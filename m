Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D4B7ECAAA1
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 16:13:02 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web09.11112.1667232772340383595
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Oct 2022 09:12:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kBuDMRFz;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-13b6c1c89bdso13911522fac.13
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 09:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AdNyOSShjdQ38bE8ucpavZl9PWvScyv5xd+MX7M6tn4=;
        b=kBuDMRFzAH7BoYNIM6FalPXoXyrkVoxqEf8A6KPwGzDYXDkhUJ4GPPKHq95Qgzcvrp
         wm5ltmpP1HLDt0dXoEidEjngA2fQS/Y5MjwSvgfVVRXv+DMMTKZWoX5Cbir8AYrVW2lj
         rqCe3uVrJQ//72E2fdYX9bZx0zMEHkpL9C/wxbBN/xEKlyQxTJqCapt9wuDzLpQsmuqi
         Lq1o1xzn8ped1DX6Udig6DI7UcIZyTVOXM3sqmRSeh9bkJvFLlDZoY4T/YDOJOYsuk/h
         xbzOPqG8QX3B4SsCYwNRfOHzzvAk9DJdkaCjfXB1CuCu9ndn4gscjUfTX1x5DUQxiumY
         swEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AdNyOSShjdQ38bE8ucpavZl9PWvScyv5xd+MX7M6tn4=;
        b=RIo3FhBbciNyl3y6joIlDo/sGPvGSaSAPuGW/Nx2N7ftHANZj29SATCSo+D+MSj3Tr
         3eveHSTDRck17M1tKpssx5BasHePFlVcgVrf3oVOsWbTVL/ETK6hKhZ6ZtcIYWBFKN2C
         4MnEUsLR4z2UD4/9cvFBXfVQjLgr+WguKHrWk4ylUjsjRXV0NSXmz0AW2WZZOweleOKL
         EnQ8Ka33dDPYDHcggSzuR0zqMgLFW63StMOrScVEBUVVUZlX1EI1cucmhVkyASc3N79u
         XzSiI2wDa2d4Wa9P03KZjCPaoInel+5DE+XcYuZ97wiFfOVeHoFtq0jxw4cyD1PNOf1S
         X5/A==
X-Gm-Message-State: ACrzQf34PjjSZVEmguGHEZvmJ3ae9pm2ldddPnmvucgVs+KAQzs5ifYs
	kU65k4kYhD9ngN4gI7/A79V4crDYe3N2BxM/fGM=
X-Google-Smtp-Source: AMsMyM7ZPNeurRnU8pWGSNB7Dfb12+GK/t4C3jGzi9hT70DfI4vSwFwd2yKqMejj1wOxR8Je8Skk0hx7C6b97v55NCg=
X-Received: by 2002:a05:6870:b00b:b0:127:2d3d:3c16 with SMTP id
 y11-20020a056870b00b00b001272d3d3c16mr17186256oae.262.1667232771532; Mon, 31
 Oct 2022 09:12:51 -0700 (PDT)
MIME-Version: 1.0
References: <20221030120341.EB40996219F@nuc.router0800d9.com>
In-Reply-To: <20221030120341.EB40996219F@nuc.router0800d9.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 31 Oct 2022 09:12:25 -0700
Message-ID: <CAMKF1sr-Fk=1dnaPzdmCX==C4TrgjjOG0Oy=0_yy==153mtpyA@mail.gmail.com>
Subject: Re: [OE-core] OE-core CVE metrics for master on Sun 30 Oct 2022
 02:00:01 AM HST
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org, 
	yocto-security@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 16:13:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172329

On Sun, Oct 30, 2022 at 5:03 AM Steve Sakoman <steve@sakoman.com> wrote:
>
> Branch: master
>
> New this week: 2 CVEs
> CVE-2022-3705 (CVSS3: 7.5 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3705 *
> CVE-2022-43680 (CVSS3: 7.5 HIGH): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-43680 *
>
> Removed this week: 17 CVEs
> CVE-2022-3165 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3165 *
> CVE-2022-3352 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3352 *
> CVE-2022-3358 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3358 *
> CVE-2022-3550 (CVSS3: 9.8 CRITICAL): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3550 *
> CVE-2022-3551 (CVSS3: 7.5 HIGH): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3551 *
> CVE-2022-3553 (CVSS3: 7.5 HIGH): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3553 *
> CVE-2022-3554 (CVSS3: 7.5 HIGH): libx11:libx11-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3554 *
> CVE-2022-3555 (CVSS3: 7.5 HIGH): libx11:libx11-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3555 *
> CVE-2022-3570 (CVSS3: 9.8 CRITICAL): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3570 *
> CVE-2022-3597 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3597 *
> CVE-2022-3598 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3598 *
> CVE-2022-3599 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3599 *
> CVE-2022-3626 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3626 *
> CVE-2022-3627 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3627 *
> CVE-2022-39253 (CVSS3: 5.5 MEDIUM): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-39253 *
> CVE-2022-39260 (CVSS3: 8.8 HIGH): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-39260 *
> CVE-2022-41556 (CVSS3: 7.5 HIGH): lighttpd https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41556 *
>
> Full list:  Found 5 unpatched CVEs
> CVE-2022-2879 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2879 *
> CVE-2022-2880 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2880 *
> CVE-2022-3705 (CVSS3: 7.5 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3705 *
> CVE-2022-41715 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41715 *

Sent a patch for 1.19.2 upgrade which should take care of all go CVEs
reported here.

> CVE-2022-43680 (CVSS3: 7.5 HIGH): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-43680 *
>
> For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172278): https://lists.openembedded.org/g/openembedded-core/message/172278
> Mute This Topic: https://lists.openembedded.org/mt/94662953/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

