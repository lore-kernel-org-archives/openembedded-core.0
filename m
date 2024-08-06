Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 576A5C52D6F
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 21:07:44 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.18349.1722978457510137960
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Aug 2024 14:07:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Sn2Da9fB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4281c164408so7149655e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 14:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1722978456; x=1723583256; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rXidqTg+POt79ReaCQHNNDHqvci4S7mXhssOp+UqG4Q=;
        b=Sn2Da9fBjbsJoXQj4jVETYzMS+Agcb8+uFxg8ud5C4SvP4IEgF7njVynzkKWKGXx/+
         6kZqPJ8LEJ5evlEXY2IlMb5BInh8o8yD0sKOwRcQiPLutAt0XvkgVQpoOls6Sc2YkY6x
         M6uIuweATDqBWgTZzsbA0nCQ5rcCTP9ziIgBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722978456; x=1723583256;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rXidqTg+POt79ReaCQHNNDHqvci4S7mXhssOp+UqG4Q=;
        b=qtEEqWVi2DBszZjG87SJSavcZdPK3ZeXDWjkmI4sER5IPRrk1GUN6+UZIu2DdGzZXq
         lcb5HeOV+RMyHCLnpuqykI5Lm87/JJZsO+delu6Y5dQOmmpzwhTYFarlwiQQ2KyZu9jN
         +SoomFxplV6p6V6PO+Onj2mA29eqNp17+XCYBWT7ZSPQE8H1IX4TIyWDaaFo/pLrSpTR
         JdIk2Cr/hXC5nAU6k9SEO71S4Y1Ac5Q+l1SO9ecyHR9/bEsI0ENW3MT1jqFwNGUIHmu0
         826+VIC/UEMLNyb9t1TMGmGa3oYoCFLGz1yWO46ZBKAQojMa9+TheI41uEgLx9JalOnB
         C8rw==
X-Forwarded-Encrypted: i=1; AJvYcCUh8PfjTqxYePauKrERmm7NP3vRtr+oe47bnNKXd5b/XvRaFEc7wosdjj6kxEniTHNwznUxfVfgxICmy8uRkodfhtEp5cfN0VmHYFsV6gBdPhbpqXZnlv7X
X-Gm-Message-State: AOJu0YziMfUSOo5IUjUsc6z6o7uzw77P6T2hDlInez3Js8VcaQ65SI6i
	SLg/H2PkabJmBqY8N6goWoTJvLQFNX4jNs/8RLb6H0H9VlM9xKiJlouK1VjURZ8=
X-Google-Smtp-Source: AGHT+IHnbqxmwOvldFj8oB+E0/LHZkrbWiTX2ceeZDo3BP5IpGQwSLi2kD5xTUMHaA5UTK2z1gL3YQ==
X-Received: by 2002:a05:600c:4585:b0:428:c0a:27ea with SMTP id 5b1f17b1804b1-428e6b02199mr105698445e9.12.1722978455766;
        Tue, 06 Aug 2024 14:07:35 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:aeae:cd04:92c6:bd93? ([2001:8b0:aba:5f3c:aeae:cd04:92c6:bd93])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36bbd01619csm14046251f8f.36.2024.08.06.14.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 14:07:35 -0700 (PDT)
Message-ID: <81ea9a655d4ec6a065425755ec1b1a023253ddec.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v2] kea: upgrade 2.4.1 -> 2.6.1
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: tgamblin@baylibre.com, openembedded-core@lists.openembedded.org
Date: Tue, 06 Aug 2024 22:07:34 +0100
In-Reply-To: <694ac64f-62cc-43f6-aea2-250bb1b02b9a@baylibre.com>
References: <17E9397D7ECFD5A5.19172@lists.openembedded.org>
	 <694ac64f-62cc-43f6-aea2-250bb1b02b9a@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 21:07:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203051

On Tue, 2024-08-06 at 15:57 -0400, Trevor Gamblin via lists.openembedded.or=
g wrote:
>=20
> On 2024-08-06 3:12 p.m., Trevor Gamblin via lists.openembedded.org wrote:
> > Refresh patch 'fix_pid_keactrl.patch' to apply on new version.
> >=20
> > Add an extra sed call to do_install:append() to remove a reference to
> > TMPDIR from ${D}/usr/sbin/kea-admin.
> >=20
> > License-Update: Update copyright year
> >=20
> > Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> > ---
> > v2 tweaks the extra sed call to use BPN instead of PN, so that it works
> > with multilib builds.
> This was supposed to be a v3. Do I need to resend?
> >=20

No, we're ok thanks. I've included this in the current AB run.

Cheers,

Richard

