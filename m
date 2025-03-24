Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56E88C36002
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 08:53:31 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.34816.1742806404320413489
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Mar 2025 01:53:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LkAbXxfw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cf257158fso26860295e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 01:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742806403; x=1743411203; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=80nLxLSXeAj7Mg3FK1vvaQGUa8rFE9EkaEpGkJqFkp4=;
        b=LkAbXxfwA+BV7aZJtHSHRRvgLh0hPypynOXGqktf/905a3p2KHoRKagcMwfvW/Cw5y
         MCrKGthjHnq+vQ6o/E+GfsM5Yz1xC+O5fAnfl7BNE2QnLMRSAPhXIyl1qPXnogf96fK9
         KQ3aKbU/7QWy+SiFd+maoqwwYM94eO76XzB/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742806403; x=1743411203;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=80nLxLSXeAj7Mg3FK1vvaQGUa8rFE9EkaEpGkJqFkp4=;
        b=jhu3iqThQ4/SpAOjCiskJFoWOYOI/JwuhQbyJGt9kZq4yOqonxwJLxIhiSo5e7qknM
         AgVuiVXVVha7NhaWkakvw7Mid8Q+wO0MbFpgETtDuv51W8/GtU7P5XBk3qwpmliOgkll
         ApgpsUgUq7SDXYGVaqnUCdwWqC0xyJQ5WpyWolwwvJgy0t0DC+LGPcjPjXpvU5say1YY
         HEBXR3CwT7dXRmyUigVcXg+SiuE3fCi/Yo5Q9Xov9vfAfLPN6ERlT8A6grVw6qpFKVjn
         Tk4aO4AXygfwNaBAfuO8CDlYyl/GEUvxJRQITkRepVNopz2sFA6t3KgSS2cdulvWoeiB
         OELw==
X-Forwarded-Encrypted: i=1; AJvYcCWseP1NjHrUMMjMt3zO3gszQvxT5NR1+s39Dr5UoV+6wSvuQF/IuJIzVIvKbxf9tMLQjpNlknmhxpmJLlDRJAkBrg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxXHOeoFjNFP50L0SbtZ/s9BiPV7Yw5lvmOpU7+YQJZ8IBkFE81
	EgokY4wVU5YzUiTC0mPkA4KbKpla6CK22bT3e1YbdGjyqFWtR0uSO6W/pMLXJolT/Ijip9vwaWt
	1
X-Gm-Gg: ASbGncu0s2CZ81Z4EsorNzwN/heroySqpAnoob3Ado31bCSOupvxl6mL5IExIjdw2g9
	kBphYXXOxDe5fl7ZJ51H8fNSWTsaz+SYV4fr5uVYFBZzxe756iEbH/R17gXqJ4NlnYiUoNxyyOF
	48HwpQAOhtIIUbpe7bOuNcP24uxRmkb8fFdHDcEmd/IpEBRJH+WgTt/K27L+f3IRCCSG/tzp8Ro
	QgzneDUxA1ApdZ5v3bU+AsasStqArRp3g2ucgkmp6qbTi0eMIYAZMbrpoCUJYEiYqayDzGEfgUO
	u5FZU0uzdSLkfDSvx/FDRlxujSvTh+eeveE5zGna6w1DpcAGKnS2etHr1g1nZz3Zxx055sdc2Ja
	QD6YndoMcgBtBnhwDiLwUd76Aa+MmTFo=
X-Google-Smtp-Source: AGHT+IF5urqEdx+CAukhbkUspZxOGUsnp3dCLqF6lcVGoDVW0B12emwoCSibCgVpocQfCH+Znq29tA==
X-Received: by 2002:a05:600c:44c6:b0:43b:ce36:7574 with SMTP id 5b1f17b1804b1-43d5114e467mr85694705e9.11.1742806402682;
        Mon, 24 Mar 2025 01:53:22 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:24f9:315d:dc7:9e14? ([2001:8b0:aba:5f3c:24f9:315d:dc7:9e14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d53678dfcsm101624195e9.18.2025.03.24.01.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 01:53:21 -0700 (PDT)
Message-ID: <ee5ec3420a89c2e32c539b1f1ceaa0f02db8c25f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] bluez5: upgrade 5.79 -> 5.80
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: gudni.m.g@gmail.com, openembedded-core@lists.openembedded.org
Date: Mon, 24 Mar 2025 08:53:21 +0000
In-Reply-To: <15989.1742751113848859897@lists.openembedded.org>
References: <1298.1742735985396496900@lists.openembedded.org>
	 <15989.1742751113848859897@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 08:53:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213518

On Sun, 2025-03-23 at 10:31 -0700, Gu=C3=B0ni M=C3=A1r Gilbert via lists.op=
enembedded.org wrote:
> I managed to reproduce this locally using QEMU. It looks like to me
> this is not a new issue, see the following two Github issues which
> are mostly report from users with Alpine Linux using musl:
> =C2=A0
> * https://github.com/bluez/bluez/issues/683
> * https://github.com/bluez/bluez/issues/726
> =C2=A0
> There is a theory in one of the Github issues that the problem is
> related to enabling LTO. I'm not sure how to proceed/debug this
> exactly but I'll at least add my input into the Github issue in case
> it helps.
> =C2=A0
> Moving forward... is it acceptable to disable running this test? I
> don't personally like it as it is likely it won't be enabled again.

We could patch it out, then we'd see the patch each time we upgrade the
recipe. The ideal solution is to fix the underlying problem (or the
test).

> For reference, these are the commands I used:
> =C2=A0
> On host machine:
> =C2=A0
> 1) source layers/openembedded-core/oe-init-build-env
> 2) bitbake core-image-ptest-bluez5
> 3) runqemu qemux86-64 core-image-ptest-bluez5 slirp nographic
> =C2=A0
> Within the QEMU image terminal:
> 1) ptest-runner bluez5
> =C2=A0
> In local.conf I added:
> TCLIBC=3D"musl"
> DISTRO_FEATURES:append =3D " ptest"
> EXTRA_IMAGE_FEATURES +=3D "ptest-pkgs"
> IMAGE_FEATURES:append =3D " allow-empty-password empty-root-password
> allow-root-login" # (I was having some trouble with the root login,
> this line seemed to work for QEMU)

We don't use musl on the autobuilder ptests so in theory this should
also reproduce with glibc.

Cheers,

Richard

