Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E06CC4332F
	for <webhook@archiver.kernel.org>; Tue, 22 Nov 2022 12:31:20 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.17314.1669120274378240788
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Nov 2022 04:31:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dN4nbERg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id d1so12364966wrs.12
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 04:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0JDnXdXcPwYJIe8KpLoxBeAoi5Wky8MoWT32+Keqc5Y=;
        b=dN4nbERgpTgS0F0fUeBcFQo2+LRwKLWgLfi0Xyog/MNoeJN4BLXeKenn25cF2rGr5a
         wZL3Y9+sVMvEHJduKLh5OD4UqyqTsr+1HG7nQK+CUt+C0XFK3i/f8QXDbOeuEowgqNmZ
         IXLy6m1ObMhWzWAQ5VjsyRmur8wGIcYma2RIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0JDnXdXcPwYJIe8KpLoxBeAoi5Wky8MoWT32+Keqc5Y=;
        b=I8Pi1I2CCAV4gS0nVTDxF/BU8RElugyFNsq5T50KljNkwaG8Ve6gt1f+12XCDqVQU9
         XfZbjXhur+lRAYC5V1d0kHZ+baEpLhWzQJItGjdVNVl0g7VF9FBYbVed3roSlAEMK5gh
         gKUbQmATs51IaTEYr68kGqA37ITSctRCSc/JcFAZIiQ/8chFSI2ZROvURRPfztXIyYDH
         X0HBF5COugVuvCCyVYPBXeUntnHzRd6NceSMShjd7DamjQdJ2D5V2vyW8+BegqW4u8c1
         32XI0nM5ZSOIe197TM+S2RKjSxjD8h+K2i4nwCpU9l3qRCLrrkMbFplI5uxzzyXFeTwz
         hCMg==
X-Gm-Message-State: ANoB5pnE0TYw9w6Itp08NV0f4RdU69vjtI3LKfEldH2jhA0cZr5Jtr+O
	oZeX0yBMHK5S/GGkJRt92GUJDQ==
X-Google-Smtp-Source: AA0mqf42iGvP9KmYMEDCt+5UIuV6GS7IHCeIp2IABIF1xPPkmtBxu5KS098rQpEKcCF0MyHTpyQzww==
X-Received: by 2002:adf:dcc5:0:b0:236:2f7f:4c42 with SMTP id x5-20020adfdcc5000000b002362f7f4c42mr4623337wrm.479.1669120272700;
        Tue, 22 Nov 2022 04:31:12 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:2b3e:5e6:6ca6:2445? ([2001:8b0:aba:5f3c:2b3e:5e6:6ca6:2445])
        by smtp.gmail.com with ESMTPSA id l10-20020adff48a000000b002366ded5864sm13828757wro.116.2022.11.22.04.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 04:31:11 -0800 (PST)
Message-ID: <66344aa4e79a890e2c9d90af9b712bf432f450dc.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 06/17] man-db: update 2.10.2 -> 2.11.1
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Tue, 22 Nov 2022 12:31:11 +0000
In-Reply-To: <20221120133122.2464634-6-alex@linutronix.de>
References: <20221120133122.2464634-1-alex@linutronix.de>
	 <20221120133122.2464634-6-alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 12:31:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173677

On Sun, 2022-11-20 at 14:31 +0100, Alexander Kanavin wrote:
> License-Update: upstream has clarified that it is gpl3
> https://salsa.debian.org/debian/man-db/-/commit/695a3560fdf91f829f21f00a5=
02244b0cf28e29d
>=20
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  .../man-db/{man-db_2.10.2.bb =3D> man-db_2.11.1.bb}         | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>  rename meta/recipes-extended/man-db/{man-db_2.10.2.bb =3D> man-db_2.11.1=
.bb} (89%)
>=20
> diff --git a/meta/recipes-extended/man-db/man-db_2.10.2.bb b/meta/recipes=
-extended/man-db/man-db_2.11.1.bb
> similarity index 89%
> rename from meta/recipes-extended/man-db/man-db_2.10.2.bb
> rename to meta/recipes-extended/man-db/man-db_2.11.1.bb
> index a41e2dd4d8..641ee6e398 100644
> --- a/meta/recipes-extended/man-db/man-db_2.10.2.bb
> +++ b/meta/recipes-extended/man-db/man-db_2.11.1.bb
> @@ -1,15 +1,15 @@
>  SUMMARY =3D "An implementation of the standard Unix documentation system=
 accessed using the man command"
>  HOMEPAGE =3D "http://man-db.nongnu.org/"
>  DESCRIPTION =3D "man-db is an implementation of the standard Unix docume=
ntation system accessed using the man command. It uses a Berkeley DB databa=
se in place of the traditional flat-text whatis databases."
> -LICENSE =3D "LGPL-2.1-only & GPL-2.0-only"
> -LIC_FILES_CHKSUM =3D "file://COPYING.LIB;md5=3D4fbd65380cdd255951079008b=
364516c \
> -                    file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a426=
3"
> +LICENSE =3D "GPL-3.0-only"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1ebbd3e34237af26da5dc08a4e440=
464 \

From a quick look at the changes, I'm not sure this is correct. At
least some pieces of the codebase are still under GPL-2.0* so at the
very least that should still be here even if the output result is 3.0.
It may be some of our output packages are also still under the 2.0
licenses.

Cheers,

Richard


