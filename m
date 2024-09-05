Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03056CE7AA2
	for <webhook@archiver.kernel.org>; Thu,  5 Sep 2024 22:40:30 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.22755.1725576027521887079
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Sep 2024 15:40:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZM6oQc+r;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42c5347b2f7so10757295e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Sep 2024 15:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1725576026; x=1726180826; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZvIKkv5MisLGAttSmvbLJo9rPDte6SKJbIXPR4GSmvY=;
        b=ZM6oQc+r4rHkan2D5zQoMNkLoiTFuCpHQGOYFhoaEZmRoDJ10jJuFEYoI51TWhwEk/
         ayDfDonXVsrIvi4wbKSMUptvzSTtrDsHFsnhwyOwbvLcvPvzKAJc1HSSHRuLY72QBlGY
         VGEDguarK6wYjchQiWzPzjimFh+3TPI6eTKh8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725576026; x=1726180826;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZvIKkv5MisLGAttSmvbLJo9rPDte6SKJbIXPR4GSmvY=;
        b=VcipwaI7VMAoI271wt3n2vIgv/Z4UibonTMMexra81vcONE28hz8H2cgJnVE/HozAc
         zAiMGx3/X1s98MRDfcCMSRiFPVEgboc0I04IoafwRdilcUPpEHMQGGTxanYviZNG1kMc
         XGLX7AArzKF4FLyoIF0QflAg5cqkD9mdnZdB+2//V3vZtq1I+XERAaWcP+Tk0dWtYC0c
         UCyxdc/iBZ9BITGyeAttrooG5h+9f31C+hTmsm3b1Jlo3c5VRG/7T1xCT5KqJZWw1z1P
         09bPDTIskxi2d1cO6ZOpHq+8GsdFWrATdVg7djIKi5EQtlUhZWXJfKNB9d0e8nrIodTb
         yFTw==
X-Forwarded-Encrypted: i=1; AJvYcCWAAL3Z5YHT7OD4GpMe/cT+AfMqLu3u6MOfrcCUYC0xnVd8LGflbcICg7zzhRqQE50Sw47zsKhTe4mAUPQ2iywzBA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxhd9F0f4pGnYQMbjDWqbeRMBVS7CI56Pf25ifVgL3KVD3ux6eu
	SpU9fdbUvvAdRyOI+J7x8WhhTfl8BI+QvP7JMNxNz8a+Hxc3xldb1106c+OYeNQ=
X-Google-Smtp-Source: AGHT+IHlm2ALkmFsHlMNT9Eyd3BlhVVqhL99cYuvrtATvi95lrpQs11WV0P1AAY+dhwzhRbmJt0Qdg==
X-Received: by 2002:a05:600c:154a:b0:428:1b0d:8657 with SMTP id 5b1f17b1804b1-42bb01c1136mr187449345e9.22.1725576025732;
        Thu, 05 Sep 2024 15:40:25 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:59c8:5822:d805:79c3? ([2001:8b0:aba:5f3c:59c8:5822:d805:79c3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374c15705easm14904133f8f.33.2024.09.05.15.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 15:40:25 -0700 (PDT)
Message-ID: <20c8fafa66b718fde5d622c2476fa60e545d50ad.camel@linuxfoundation.org>
Subject: Re: [OE-core] [master/scarthgap PATCH] meta-ide-support: Mark
 recipe as MACHINE-specific
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: paul.barker.ct@bp.renesas.com, openembedded-core@lists.openembedded.org
Date: Thu, 05 Sep 2024 23:40:24 +0100
In-Reply-To: <20240905202102.565-1-paul.barker.ct@bp.renesas.com>
References: <20240905202102.565-1-paul.barker.ct@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Sep 2024 22:40:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204245

On Thu, 2024-09-05 at 21:21 +0100, Paul Barker via lists.openembedded.org w=
rote:
> meta-ide-support:do_write_test_data dumps the bitbake data dictionary to
> a file using export2json(). As this obviously includes the value of
> MACHINE, and other MACHINE-specific variables, the recipe needs to be
> marked as MACHINE-specific.
>=20
> Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
> ---
> =C2=A0meta/recipes-core/meta/meta-ide-support.bb | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-core/meta/meta-ide-support.bb b/meta/recipes-co=
re/meta/meta-ide-support.bb
> index d85aa120c08b..7ed422ce4ddb 100644
> --- a/meta/recipes-core/meta/meta-ide-support.bb
> +++ b/meta/recipes-core/meta/meta-ide-support.bb
> @@ -1,6 +1,7 @@
> =C2=A0SUMMARY =3D "Integrated Development Environment support"
> =C2=A0DESCRIPTION =3D "Meta package for ensuring the build directory cont=
ains all appropriate toolchain packages for using an IDE"
> =C2=A0LICENSE =3D "MIT"
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> =C2=A0
> =C2=A0DEPENDS =3D "virtual/libc gdb-cross-${TARGET_ARCH} qemu-native qemu=
-helper-native unfs3-native cmake-native autoconf-native automake-native me=
son-native intltool-native pkgconfig-native"
> =C2=A0RM_WORK_EXCLUDE +=3D "${PN}"

Something about this is making our toolchain tests unhappy, e.g.:

https://valkyrie.yoctoproject.org/#/builders/42/builds/86/steps/12/logs/std=
io

I've not looked into it at all, just reporting what we've need to fix
in order to be able to consider merging this.

Cheers,

Richard

