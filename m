Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00E6FC433FE
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 16:56:43 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.1467.1650298972713467139
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Apr 2022 09:22:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ImZFbcvD;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.49,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f49.google.com with SMTP id bv19so27743398ejb.6
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Apr 2022 09:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MAWJhxuj1OrMH9dnntI/puCH6OKnxbJtI+lXegJwi+8=;
        b=ImZFbcvDXFJpOltrell3t+pWgn4yeCf2A8ErHhbHrxRH0sc4WXA977Vwpug7wAN2jb
         I5PyWSWKuw9IEBWimeuBmv/lelS9kyN0Xb3AmmGqtVGKYSAg+s3B8R7AJvBnvDUxF6Um
         gONwUAfScKfrtx7vuMaP6JWHXPlDy2bG2nrWMVVelj/WvMPHN7N5GKBkNiHSORldG75O
         i7gzf/hGc977XhfOT5Xd3kSNLymF1E+MMT/jgBsM6F8+Fh2OUp+lqMWoWEmps+Bez8pK
         9h1Dii0cLZ/W7FRf1DgeJVPypzoB9yN6GrOidsPF4ptH6PudP8xeDL5S/aTR78QZwwJ0
         I/AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MAWJhxuj1OrMH9dnntI/puCH6OKnxbJtI+lXegJwi+8=;
        b=DVB9WA+ztJ9oHiA9Vye058B2ux8LKoRxWiFus/O5r+0+khsdKJassD4+F1Lpoj04n8
         Yof1Emy32a5T9bpJkggLOpkILPzrzAe6fOJ9W81IQ/vKnctWLi5Irve21lT4jgGSjcM0
         JQEoaKflQUz2y5gBvyF/ZkXRJsmFBobxJHAouhlWADCfdsoCmTZd+w/xbXOKIYc2Hb9m
         +WJenm7yTBKpMehVY8nghM66SWWOrlazt1aehG1FNHlfC64Gq5Z4Ww6pr9eGE4o6YXIG
         ILrw2Pfuqp7yL6S+T4+yp463c7/XCdoez2I/k8lJvGLv86s5Vjohknx09YbePc0OXkSu
         lPsg==
X-Gm-Message-State: AOAM532DPq2QNZbzcqVENjrn6zefSga3piqHEIQ5hxgootdU1FKPC8mw
	503GMWYEjDdENSkYJE+xiy9BenrSZUi6xE3T8t1sSA==
X-Google-Smtp-Source: 
 ABdhPJzJzuibcdl92fAuLVFDUUFBi+z07UBQO108arqLpkgo1yYi0rpPnEJy3j7ZVezkpz58bfUmn4eWC0ZSbW68T20=
X-Received: by 2002:a17:907:6d1f:b0:6ef:cc05:d554 with SMTP id
 sa31-20020a1709076d1f00b006efcc05d554mr2203190ejc.685.1650298971154; Mon, 18
 Apr 2022 09:22:51 -0700 (PDT)
MIME-Version: 1.0
References: <16E6AD619D49A549.19917@lists.yoctoproject.org>
In-Reply-To: <16E6AD619D49A549.19917@lists.yoctoproject.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 18 Apr 2022 06:22:39 -1000
Message-ID: 
 <CAOSpxdZaPVeSXJeMHJH5y3RmekU+G=a2osPjq8XsZVNjy4=CAQ@mail.gmail.com>
Subject: Re: [yocto-security] OE-core CVE metrics for master on Sun 17 Apr
 2022 02:00:01 AM HST
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org,
	yocto-security@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 16:56:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164604

On Sun, Apr 17, 2022 at 2:02 AM Steve Sakoman via
lists.yoctoproject.org <steve=sakoman.com@lists.yoctoproject.org>
wrote:
>
> Branch: master
>
> New this week: 3 CVEs
> CVE-2022-1210 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1210 *
> CVE-2022-28391 (CVSS3: 9.8 CRITICAL): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-28391 *
> CVE-2022-28805 (CVSS3: 9.1 CRITICAL): lua:lua-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-28805 *

Working on this one too

Steve

>
> Removed this week: 6 CVEs
> CVE-2019-1010238 (CVSS3: 9.8 CRITICAL): pango:pango-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010238 *
> CVE-2021-44647 (CVSS3: 5.5 MEDIUM): lua:lua-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44647 *
> CVE-2022-1050 (CVSS3: 8.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1050 *
> CVE-2022-1056 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1056 *
> CVE-2022-24975 (CVSS3: 7.5 HIGH): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-24975 *
> CVE-2022-26280 (CVSS3: 9.1 CRITICAL): libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-26280 *
>
> Full list:  Found 9 unpatched CVEs
> CVE-2019-12067 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
> CVE-2020-18974 (CVSS3: 3.3 LOW): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
> CVE-2021-20255 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
> CVE-2022-0529 (CVSS3: 7.8 HIGH): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0529 *
> CVE-2022-0530 (CVSS3: 7.8 HIGH): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0530 *
> CVE-2022-1210 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1210 *
> CVE-2022-27191 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-27191 *
> CVE-2022-28391 (CVSS3: 9.8 CRITICAL): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-28391 *
> CVE-2022-28805 (CVSS3: 9.1 CRITICAL): lua:lua-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-28805 *
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#567): https://lists.yoctoproject.org/g/yocto-security/message/567
> Mute This Topic: https://lists.yoctoproject.org/mt/90521085/3620601
> Group Owner: yocto-security+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/yocto-security/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

