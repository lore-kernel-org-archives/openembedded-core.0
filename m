Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23D45C433EF
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 11:35:33 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web10.5091.1657107325295692161
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 04:35:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JNwO78gQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.222.182,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-qk1-f182.google.com with SMTP id r138so10749462qke.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 04:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=SKozGnLp8WfdKk9s6Rfxq8mIIy9AN8cwX3oo/F1UTmA=;
        b=JNwO78gQGPOaitsSmzy4EE1mKmltYjuoAkD8+W3Z2BzpaRLZkym3hIJIpLndps9oob
         jg6+9pM0456BXJx0P1UKrZ2Qyxq7bcpkrrBtS/Ca493OM9eXWGMbG0PRPV5lGzFEk4FB
         M64sB+BR82+3THPM/qorAepnZ9s746O9XLLl4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=SKozGnLp8WfdKk9s6Rfxq8mIIy9AN8cwX3oo/F1UTmA=;
        b=Qu1Ya+O12cwhHSWxXolR7sZcMLUOMttqv0wbeC/thtVtq1rr3rHi7SOwiARCHsJ0IM
         G/y4egDtG5Bhilc5vn/R8wwXUd1Z+DTeg8+djAshLSB17v36jDPBY7A7PuR8W2JA8Jf0
         DteYUuTU/pgMAhy/AXrxgeNAwtut8sd4IJb00aPDSRxqURWHi+uke0D8kfsyZW2R5srq
         q5dtDYPrFqqcrkaZJCIn46T++KTpXVL3k7wA/Q0WLzHAqeHTpH5n6hCMxJKnOeqefCuv
         bx7IruiVGWrHyfApLOGDyuWG1/vQcflsytkIpKTWRZctNSY9AWjscAg9hQjIyCSd33Ol
         QxCQ==
X-Gm-Message-State: AJIora8zine/jlpdP8G5mBppJQBPZBzrCgaS9duqUF/I9yWZEf2ziUOT
	kpJfimshV0Zdno0Qu+KF6FL3ig==
X-Google-Smtp-Source: 
 AGRyM1vuEG9qhjWBBgSTr8/mfnSm49lgnID+I2ezGUtqbjhwD4xwuhoy0jI9RQyGUdyqjsypp/ZckQ==
X-Received: by 2002:a05:620a:2b96:b0:6af:25ab:54b2 with SMTP id
 dz22-20020a05620a2b9600b006af25ab54b2mr26958427qkb.99.1657107324135;
        Wed, 06 Jul 2022 04:35:24 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9b71:63f4:5737:a5c8?
 ([2001:8b0:aba:5f3c:9b71:63f4:5737:a5c8])
        by smtp.gmail.com with ESMTPSA id
 i11-20020a05620a248b00b006af4f9b77fdsm22941154qkn.44.2022.07.06.04.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 04:35:23 -0700 (PDT)
Message-ID: 
 <6d91f47a67fdcd99ded5b6e31836dc41b2f75ca5.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/7] sato: work around missing icons in
 adwaita 42.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Wed, 06 Jul 2022 12:35:20 +0100
In-Reply-To: <20220705170339.771017-1-alex@linutronix.de>
References: <20220705170339.771017-1-alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Jul 2022 11:35:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167720

On Tue, 2022-07-05 at 19:03 +0200, Alexander Kanavin wrote:
> adwaita icon theme upstream has done significant trimming around app cate=
gory icons
> (fullcolour versions gone completely, 'symbolic' b&w versions still aroun=
d but marked
> as legacy). Going forward, apps would need to provide their own icons. Gi=
ven that
> sato is likely to be deprecated in favour of wayland/weston rather soon, =
let's use
> the symbolic icons for now.
>=20
> [YOCTO #14782]

I did finally get some time to run some tests and compare these with
some ideas I had. This patch has horribly fuzzy icons in black and
white and I do not think it is a good option. I'm therefore definitely
not going to take this patch.

I'm going to work on cleaning up my patch to add svg icons to sato-
icon-theme and bring those back for now. It will mean icon-naming-tools
has to come back too but it isn't a complex recipe.

Cheers,

Richard


