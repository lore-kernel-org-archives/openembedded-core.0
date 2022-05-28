Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C915C433F5
	for <webhook@archiver.kernel.org>; Sat, 28 May 2022 19:43:58 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web12.18460.1653767026302612475
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 May 2022 12:43:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HPl2iv5q;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.218.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ej1-f46.google.com with SMTP id f21so14198203ejh.11
        for <openembedded-core@lists.openembedded.org>;
 Sat, 28 May 2022 12:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=L3Gdneh2vBelhwDVjEhMDZsSHrh4OFW3BNqqkwRjQzE=;
        b=HPl2iv5q4eBE5b+X+NaXKe+M+Btdpoljs/OlqmqYmZyZvQvVI6N5VXv2L8lAiqbSRy
         BNhiT3nynPKRIcXSeKmuX0HBwi/kjy5phhW1D+8QxVXYZqlp/1uzZbeo01ZFIn0Ou+EL
         s57tCwogkqQRkLRl+UZSjxgwDJC++vKn9B65k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=L3Gdneh2vBelhwDVjEhMDZsSHrh4OFW3BNqqkwRjQzE=;
        b=gKOoOW+30MoSzg+Or2R1MOAdWGGSqY6hmPBj/edBb6hXR5hxDy4uwIHOcLGRhJxNG0
         JWBrVqK7EwcNN+jZHDOUgxh462ycJbQzezdfWj1L34+mktxZp98275uO3/BVHkYQ8Vpo
         /FgN1iwdFAuQEHuCVPT2y2AEb0129s/aHtt/8dlNVXMDY/CAa0ESFvWt+F3GZCGebNcD
         bu8TRsEtfGhWhq9lKRx7w5BbeXP2oZTJmpg+Lir9+RfvwJbgBY/JrmDpWaZO1Yp8HOnF
         ug2d2M5uEbn10vLvZQdDMhqHgjcbf+3iK19/2fkFqdqJuobZYbaO1NIlEv11dBTGzndY
         MYww==
X-Gm-Message-State: AOAM533YRFOSb9TR/J1Ve8g/s3FvykbBBZ9DDNQXj08GiJBBkg/g3HAe
	Yelq4PZLT4L2ILs8gmKAdJhggP7to3bYshjG
X-Google-Smtp-Source: 
 ABdhPJwRMN9BhPbC4NNCkeYIldZx/LZJKXdSqn3Zpf5exWstauZxVq9Zq2wql+7mn9+Aphm5Q20wuQ==
X-Received: by 2002:a5d:59a2:0:b0:20f:d628:26f5 with SMTP id
 p2-20020a5d59a2000000b0020fd62826f5mr26749001wrr.106.1653767013924;
        Sat, 28 May 2022 12:43:33 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:41b6:b722:6b4c:6704?
 ([2001:8b0:aba:5f3c:41b6:b722:6b4c:6704])
        by smtp.gmail.com with ESMTPSA id
 k7-20020a1ca107000000b00394708a3d7dsm5723497wme.15.2022.05.28.12.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 May 2022 12:43:33 -0700 (PDT)
Message-ID: 
 <db6f07a51d626042cff279bdd7119ca920d2d6d3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] tiff: Add jbig PACKAGECONFIG and clarify
 CVE-2022-1210
From: richard.purdie@linuxfoundation.org
To: akuster <akuster@mvista.com>, openembedded-core@lists.openembedded.org
Date: Sat, 28 May 2022 20:43:32 +0100
In-Reply-To: <339ded2d-6648-0016-50cd-0f2769792f00@mvista.com>
References: <20220528100501.508207-1-richard.purdie@linuxfoundation.org>
	 <339ded2d-6648-0016-50cd-0f2769792f00@mvista.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0-1ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 May 2022 19:43:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166229

On Sat, 2022-05-28 at 11:07 -0700, akuster wrote:
>=20
> On 5/28/22 03:05, Richard Purdie wrote:
> > We never depended upon libjbig so this was never present. Add the
> > PACKAGECONFIG to make this explict.
> >=20
> > CVE-2022-1210 is an issue in libjbig so we don't have a problem there,
> > mark as such.
>=20
> But what if I am a user or have a customer that needs that enabled? Now=
=20
> that issue is masked if I run the CVE checking tools , I will have a=20
> false sense of security.
>=20
> I understand that Redhat or Suse can make statements like that=C2=A0 as t=
hey=20
> provide install-able=C2=A0 binaries but for a Project that starts from bu=
ild=20
> your own DISTRO, should the community take on this responsibility?

This is the same as any of the other decisions we make for
CVE_CHECK_IGNORE. If you bbappend and/or change the configs of recipes,
you need to do some further due diligence.

The fact there isn't a PACKAGECONFIG for it at least suggests it isn't
being used.

What is the alternative? We just list this as unpatched for OE-Core and
let everyone have to look it up for themselves?

Cheers,

Richard



