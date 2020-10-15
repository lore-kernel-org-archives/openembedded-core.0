Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web12.1872.1602800523037994329
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2020 15:22:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZiS3sPbF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id y12so376658wrp.6
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2020 15:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=KOycWxQl+E1txf6qhZqt7bOckUCmlRXEh+A+uJF6mk4=;
        b=ZiS3sPbFWl5HS8NOVyAtiiBzyPXbXPPf5fwhNn1GNNBr4MAlq7X3JGnAhuTyp+jd6S
         L0oUukvQLdkPFCPKWJMBjY9PVHJwjl/J39Bul7e1HBL/ahsV7esXjX5pKC951xKirqUf
         /Sya2s1wDUZ66Ao6Z5OlEMQoWKxglwQifxP9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=KOycWxQl+E1txf6qhZqt7bOckUCmlRXEh+A+uJF6mk4=;
        b=brnijdUE6mtpaX4zTaewQVShg05sCNGug7kGq1DCbEkqBrhCrTOXnNMYGtb+/ed47X
         kiiNECjnESIWKxndRAdoCGRl2pGGouuIVEi7o3gU7FFcdvgw0QDFFzEwKRG8etHfwqR3
         BSIAdSJ++h+9G1hFhJ5z+fhD+EJdXAYipDngcI2s3u3HwgbbisWJYbd66QJruTEqDMiL
         f6gjkbzzKpfa1qrywklYT0puSXpdVivJAbgQ2lF2krN1e83yF/158k/+c/Dm6My/DzZ/
         qB5Vh2fyg+FkI5r5aYx9k8qvLbEoAXvpidQ4bWNJ34azp7PAX+7TM0gO8TLtkH9xet1D
         5hKQ==
X-Gm-Message-State: AOAM5312OOFbZ/ta3mri5ZVdN8iGMpjvEseeOgBCOIw5lYexUNmLKISm
	zrd2sk2EIV7y69VoWKT2j0bvaw==
X-Google-Smtp-Source: ABdhPJwavlsdMyf8cgxjZYf1mlPSVsSWrxXF1qgUnLX++Gz3LJg39O+svFl0UJcLPtNyEsXKxm5SoQ==
X-Received: by 2002:adf:9793:: with SMTP id s19mr421052wrb.139.1602800521408;
        Thu, 15 Oct 2020 15:22:01 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from f.7.c.a.0.7.9.b.6.d.5.e.8.7.d.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (f.7.c.a.0.7.9.b.6.d.5.e.8.7.d.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:7d78:e5d6:b970:ac7f])
        by smtp.gmail.com with ESMTPSA id w5sm484176wmg.42.2020.10.15.15.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2020 15:22:00 -0700 (PDT)
Message-ID: <de3d7aef8f799ace3a55349c1d805e081b66e111.camel@linuxfoundation.org>
Subject: Re: [OE-core] [meta-oe][PATCH 0/2] kernel-fitimage: adding support for Initramfs bundle and u-boot script
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>, 
	openembedded-core@lists.openembedded.org, Lakshmi.Kailasanathan@arm.com, 
	Ross.Burton@arm.com
Cc: nd@arm.com
Date: Thu, 15 Oct 2020 23:21:58 +0100
In-Reply-To: <20201013113232.29228-1-abdellatif.elkhlifi@arm.com>
References: <20201013113232.29228-1-abdellatif.elkhlifi@arm.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-10-13 at 12:32 +0100, Abdellatif El Khlifi wrote:
> From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
> 
> This patchset adds Initramfs bundle support to the FIT image kernel class in
> addition to u-boot boot script capability.
> 
> A third patch will be sent which adds the description of the new features in
> the Yocto reference manual.
> 
> Abdellatif El Khlifi (2):
>   kernel-fitimage: adding support for Initramfs bundle and u-boot script
>   oeqa/selftest/imagefeatures: adding fitImage testcases for initramfs
>     bundle and boot script
> 
>  meta/classes/kernel-fitimage.bbclass          | 148 ++++++++++--
>  meta/lib/oeqa/selftest/cases/imagefeatures.py | 215 ++++++++++++++++++
>  2 files changed, 339 insertions(+), 24 deletions(-)

Unfortunately this failed on the autobuilder in both the test it adds
and in other related ones:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/1462/steps/8/logs/step2d
https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/1447

and others builds too.

Cheers,

Richard

