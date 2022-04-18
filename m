Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9F42C433F5
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 16:56:42 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.1119.1650297415682834210
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Apr 2022 08:56:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=4r9YpvdC;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.42,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f42.google.com with SMTP id 11so12901498edw.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Apr 2022 08:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zJvTHeFnjSKv18JygQKLL2RA0n2Tu1Zqqv3qHBQbkz4=;
        b=4r9YpvdCGM7Nmmz3ZZqpLlK7ZwxYYzrKc4AIofsrPDfzeNVbjuSfU1jut0t9imyJ0B
         ivTZrV5yk+AIc7K7nJLquLOC+h+vh4z6t+uf+htB+ecLLs3lXRG8QFlY2E1KU2rUpUAl
         D+LdpxC9Hr+wKVtQJNhhpl57ZgpW6UYJVUBxcl9NLGMONi1dX2zRSlHNv5YMrbYW3dHI
         fdhDx1Rv3QBXSP9lpr7CrPi6As1z7kVLi/ppxFJ1T+nKxZBJdKyqV73eWw5/DPVfXoTo
         IHkb1UzU2ArFyXd1x3QMUMG1Vk3reIxemvSXiTikspiYCbPLNsZ7pdP10pdG4GqBr0jV
         ZrpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zJvTHeFnjSKv18JygQKLL2RA0n2Tu1Zqqv3qHBQbkz4=;
        b=Ctv6oCSW00260BPaP7azxGY4RpOVEEwy+LrTsAJF9zA/UrwSc3sPfJ8WMIAfx/i9LP
         x1/91nTaOy0BdQHkNhwGZLNop44uOjrz3Jj4dgsnjuvXGlDqGS4B9VMM/ZtBMcQw6mQm
         8tLVggZu5cxW3ABPDS+Qb3nz2gMBZupglMDlIkiqQSBt5cYng/JirNOLWbzAHEWhoaFp
         mY4+8hsb/M98JZdbfyQU6lC2REL4Fsu3M5GUjY0XkcD2qFGkXhfSqWY/O6DgxGT5pddk
         syw8rmgp/Bdzd1Ka3F/qOm/uwP2qcm4xk2LGHRYjkC96wNyZZxug3EPJjPORLFEtMc6i
         lqGw==
X-Gm-Message-State: AOAM530JduSycMsD36zoiWKFNbfjzy8hFbn9i34oszoFq0uE7J7Xpm2/
	l3FrWxX5iIvtiUbcNB5ecHy2V0bquiXnBfEMFm8psA==
X-Google-Smtp-Source: 
 ABdhPJyuIl3H2HZ+DUIP51A638febTy5MJ7Q8IqSlgqtuhv2Rwa3E39ZcVZIv9ZMB+1iKsWUTt8adFAozb9jVlV/LoU=
X-Received: by 2002:a05:6402:1a44:b0:41d:8969:e4c9 with SMTP id
 bf4-20020a0564021a4400b0041d8969e4c9mr12999161edb.299.1650297413627; Mon, 18
 Apr 2022 08:56:53 -0700 (PDT)
MIME-Version: 1.0
References: <16E6AD619D49A549.19917@lists.yoctoproject.org>
In-Reply-To: <16E6AD619D49A549.19917@lists.yoctoproject.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 18 Apr 2022 05:56:42 -1000
Message-ID: 
 <CAOSpxdbnAsjRaO_stDL-iTrpc0xhcR7-V9iRDpqFs8WKt9fcqw@mail.gmail.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/164603

On Sun, Apr 17, 2022 at 2:02 AM Steve Sakoman via
lists.yoctoproject.org <steve=sakoman.com@lists.yoctoproject.org>
wrote:
>
> Branch: master
>
> New this week: 3 CVEs
> CVE-2022-1210 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1210 *
> CVE-2022-28391 (CVSS3: 9.8 CRITICAL): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-28391 *

I'm working on this one.

Steve

> CVE-2022-28805 (CVSS3: 9.1 CRITICAL): lua:lua-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-28805 *
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

