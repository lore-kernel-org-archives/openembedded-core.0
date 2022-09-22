Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1C28C6FA82
	for <webhook@archiver.kernel.org>; Thu, 22 Sep 2022 13:43:46 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web09.7270.1663854218617875547
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Sep 2022 06:43:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=kSaP7bH2;
 spf=pass (domain: linaro.org, ip: 209.85.214.181,
 mailfrom: mikko.rapeli@linaro.org)
Received: by mail-pl1-f181.google.com with SMTP id l10so8806207plb.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Sep 2022 06:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=fY9ORKxRTKOc09DqqaKvu9QaqC5/GuK2JnWbA+NYIeQ=;
        b=kSaP7bH2LOfiYY82CtRLjIxK0chzPJsFYSAYTI3Nil8zg/H8Pu4sPk1Zoui418Fn4c
         9lwlJ9qW5Xo3hPSMmTKqtvumrasu6jKkq4X4WcFfXfqb1Zg9tHnXcQWwBXJIVnVk1KuE
         1uj8ahtWV8vSzKnQr5K3HSGgylhuJrxlfbkgXBHnFc8sObHT2W0ryLSRgRGz8Maw8g9j
         tvI95OoBvtnNq4cwXhIsnsMvh8udVJNRnWyQFLLzjLhPInuNYqT2rm0HeyK6bCGJKdkC
         KiaFe1ysUdrdPZkWis9J4b9rMmFQ8Stt9UPOJ6t8sjDP3v+aztJUDgRwENr5MHVJO8ZT
         Af5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=fY9ORKxRTKOc09DqqaKvu9QaqC5/GuK2JnWbA+NYIeQ=;
        b=LO6OnYvpAiVmAuuqlGpgscfkefrjeptEnnigqD9HHdz8UV6zQT5ZeqSrEE3WXqNwXN
         ro62E52o1+4CCwcDVqy2LMmznuay3XhmBlxO8am6RxlJmJS2vgiXWqEC/OuzDwxN3y1+
         8C7UjYkRIIp7w9qFqITRyFv/T/gTgtvhUDixJXCpdlw2nbqkKQ74l+D0pavYgb5lhauB
         z9OKfefSjt0PTkCYE4IalN7SXe4b6GF7rPKIP47k9dIItNaslZQBz5oL83cJlLjypEJj
         /IsI392UjJywY5mCbh6OzeTLUoDafy1BFSVWm9Cl5tktOWRrzHM2Qej3wI9u8ZE3Sti6
         jkvg==
X-Gm-Message-State: ACrzQf1LwhO6q8tnKwNm64lJTzALKRlNY3I/BPoQpN9z5UAUkdCgAaBk
	rUdjoTB/UrUEjVAa3OTjRrcBoP+GIn+n20M2BdP+Bw==
X-Google-Smtp-Source: 
 AMsMyM4D4AH8ZIG3Q/nzJD4VAHPOhpgmzTkP7/8tG61D14KDdKgV3PqqAaz3D1r6ny4oPbvMCoVV7H5TB2Z+ljVFBn4=
X-Received: by 2002:a17:90b:17cd:b0:202:ee1c:9578 with SMTP id
 me13-20020a17090b17cd00b00202ee1c9578mr15550836pjb.87.1663854217977; Thu, 22
 Sep 2022 06:43:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220922122402.32710-1-mikko.rapeli@linaro.org>
 <A7BB2455-96E4-4403-8E60-AE010F0AF124@arm.com>
 <36a2e82978462cfcd53ae5228ead7dc8b3ce4603.camel@rpsys.net>
In-Reply-To: <36a2e82978462cfcd53ae5228ead7dc8b3ce4603.camel@rpsys.net>
From: Mikko Rapeli <mikko.rapeli@linaro.org>
Date: Thu, 22 Sep 2022 16:43:50 +0300
Message-ID: 
 <CAJFpGrPS+uuihkS0+E0+gPoPFB8wRNEsLZSgVWG_zR4C8EeNiQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] poky.conf: allow changes to DISTRO_VERSION,
 SDK_VERSION and MAINTAINER
To: Richard Purdie <rpurdie@rpsys.net>
Cc: Ross Burton <ross.burton@arm.com>,
	"openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Sep 2022 13:43:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170982

Hi,

Thanks for the feedback. My product isn't a real one, it's actually
some meta layers to be used
by others to create real products.

The reason for using poky.conf distro is to stay as close to it as
possible. But I still need to know
what is the output of my builds vs. something else from poky.

If chaning these veriables from local.conf is bad practice, then I
need to find other possibilities, like
the custom distro config (maybe move away from kas). But the aim is to
do as few changes to
poky as possible.

Cheers,

-Mikko
Cheers,
-Mikko

