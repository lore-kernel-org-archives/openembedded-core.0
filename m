Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9727DC433F5
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 15:52:15 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web08.29355.1653321129448980106
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 08:52:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=05d6WQSp;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.52,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f52.google.com with SMTP id gi33so21239933ejc.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 08:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7splSDkvKq/q2vBNbU/IGtvb+Bo0JocD7WlyfiqhZRw=;
        b=05d6WQSp+9+aBWbbdTu/JRR8Eg9sDuQQ3egzIL55c4xcwX6yPyvL7IoLtP2Y24fuYt
         2OYn9tAOjHjXniVnHLpgZvvMczYegUvQhcT/uTvgWXSX+0EjTjYhEFX9XQ2Wnlaccxgn
         YQf/2IqqU05rcY1x5jeLmZettc0pV2ZLCmUHryCHIUNUMXIznKixui/u6Tzdly9rqaFb
         RToe9+IzAJytY1n7Bz803G/zJJwbC0Bpo/MkWP3cI9or1f4ACjD4H0SYlcXGC298lwnw
         0OKY4UUrS5/xrO984P1WPeWosuGC6bireNtAY1mgqVGt2T//RGIAckoR5WwhB7gWIVaR
         CnuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7splSDkvKq/q2vBNbU/IGtvb+Bo0JocD7WlyfiqhZRw=;
        b=tTQ50vWy8KotpebDGOvTCXkSUR+ZL5efeuA3syCxNkXql+bD6epo0YOFT1eWSThf8H
         mQsFstgzICYbnsxpfx2GbdS1yBbKsevnpttn8PLLUg61MvCxZGUq63vSJAoFH6fqelOC
         vOyivG5sfPPhAKQT6Eh8K9aKbVvtSzsQSBzVbWFTAf16PfPSEB+g7zUul+8HPPOZbBoq
         Yy2aoC/yx1pK3xknQv+RgRGpHH9mL/WCPsaRgny2x0aprSOsDBK9jqv2UA/CfgjXj3XS
         M3G1nXviSlxCc1ZmU2pHlVm99Hegd2sSnpCy57X3whf09oM6QeymqtRVCR5qH2AD6Z+W
         6TnA==
X-Gm-Message-State: AOAM531HMoTXoRmXOlulGTo/GbZ+D94NXJmjZZ619PRteWcD4LfTz3Io
	Lh7FzjMe9wVXKIStt3i6mn7FxXu+E6E8fQ4rNnI2Cw==
X-Google-Smtp-Source: 
 ABdhPJwWGO8w6B4geMMy6MGWLXJAquQRRMG2+JrbgBvhC5Kn4lWmYF52e9oObRc5Y21yyIIwKskMxrES4V8CL5vZZKA=
X-Received: by 2002:a17:907:3e29:b0:6fe:cf85:31a8 with SMTP id
 hp41-20020a1709073e2900b006fecf8531a8mr6527414ejc.18.1653321127566; Mon, 23
 May 2022 08:52:07 -0700 (PDT)
MIME-Version: 1.0
References: <16F1709A858F3CFB.18186@lists.openembedded.org>
In-Reply-To: <16F1709A858F3CFB.18186@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 23 May 2022 05:51:56 -1000
Message-ID: 
 <CAOSpxdaM3wBUqZKZ0XB_79aijU_kJ-4WKTwdJe6JzxBvvDXrRg@mail.gmail.com>
Subject: Re: [OE-core] OE-core CVE metrics for kirkstone on Sun 22 May 2022
 03:30:01 AM HST
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org,
	yocto-security@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 May 2022 15:52:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166038

On Sun, May 22, 2022 at 3:32 AM Steve Sakoman via
lists.openembedded.org <steve=sakoman.com@lists.openembedded.org>
wrote:
>
> Branch: kirkstone
>
> New this week: 7 CVEs
> CVE-2021-3611 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3611 *
> CVE-2021-3750 (CVSS3: 8.2 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3750 *
> CVE-2022-1621 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1621 *
> CVE-2022-1622 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1622 *
> CVE-2022-1623 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1623 *
> CVE-2022-1629 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1629 *
> CVE-2022-29824 (CVSS3: 6.5 MEDIUM): libxslt:libxslt-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-29824 *
>
> Removed this week: 11 CVEs
> CVE-2021-4206 (CVSS3: 8.2 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4206 *
> CVE-2021-4207 (CVSS3: 8.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4207 *
> CVE-2022-1381 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1381 *
> CVE-2022-1420 (CVSS3: 5.5 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1420 *
> CVE-2022-27404 (CVSS3: 9.8 CRITICAL): freetype:freetype-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-27404 *
> CVE-2022-27405 (CVSS3: 7.5 HIGH): freetype:freetype-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-27405 *
> CVE-2022-27406 (CVSS3: 7.5 HIGH): freetype:freetype-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-27406 *
> CVE-2022-29536 (CVSS3: 7.5 HIGH): epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-29536 *
> CVE-2022-29824 (CVSS3: 6.5 MEDIUM): libxml2:libxml2-native:libxslt:libxslt-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-29824 *
> CVE-2022-30293 (CVSS3: 7.5 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-30293 *
> CVE-2022-30294 (CVSS3: 9.8 CRITICAL): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-30294 *
>
> Full list:  Found 16 unpatched CVEs
> CVE-2019-12067 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
> CVE-2020-18974 (CVSS3: 3.3 LOW): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
> CVE-2021-20255 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
> CVE-2021-3611 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3611 *
> CVE-2021-3750 (CVSS3: 8.2 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3750 *
> CVE-2022-0529 (CVSS3: 5.5 MEDIUM): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0529 *
> CVE-2022-0530 (CVSS3: 5.5 MEDIUM): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0530 *
> CVE-2022-1210 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1210 *
> CVE-2022-1621 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1621 *
> CVE-2022-1622 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1622 *
> CVE-2022-1623 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1623 *
> CVE-2022-1629 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1629 *
> CVE-2022-24675 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-24675 *
> CVE-2022-28327 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-28327 *

I'm working on the above go CVEs

Steve

> CVE-2022-29458 (CVSS3: 7.1 HIGH): ncurses:ncurses-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-29458 *
> CVE-2022-29824 (CVSS3: 6.5 MEDIUM): libxslt:libxslt-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-29824 *
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#165979): https://lists.openembedded.org/g/openembedded-core/message/165979
> Mute This Topic: https://lists.openembedded.org/mt/91268527/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

