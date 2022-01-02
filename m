Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BFB7C433EF
	for <webhook@archiver.kernel.org>; Sun,  2 Jan 2022 15:33:16 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
 [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web11.13933.1641137595072962144
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Jan 2022 07:33:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=0XUBSGd/;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.48,
 mailfrom: steve@sakoman.com)
Received: by mail-io1-f48.google.com with SMTP id l3so35522114iol.10
        for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Jan 2022 07:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=BO3eSPIGafzRaG6RYOvufthogHlkHZ9EGohP6vJeTvA=;
        b=0XUBSGd/kNoFyoHQE2qby7WRt0fkUIDM+SlniGed9UlXRzniPqvZhd+rKbbwp30Nhp
         hE3EMAXQJcptfkaY86ow2JmmvIHMUhXiM2jzVPOZrj0NBEJAIqQSk5RgPc7v0o9RO+O1
         22P600U4EII9HC/8fZ7HdVzDm5uq3gjg3gRASfX1PXHEBxnoMESJBa+GwGOCr72b8pXE
         zHi2KVhU8ymnGmsFX/7MU1yLiiClkLNwUKmCLUjZyNpA8pMqqkHzFnJq5IFlhuyt/uhl
         mfO0IgpcKpKCLQRd0nVjqFX780zSpZYc9M7qhYWONxVWAxLHhJD5t6p6wuZht8dQCmKE
         yaZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=BO3eSPIGafzRaG6RYOvufthogHlkHZ9EGohP6vJeTvA=;
        b=M25waeFYp4U/FfkY6BV66Z3ZIAyUip/1/WZ6kbgG5c+Fwx2KieivDRv2Ecvf7nZXZQ
         9rbvef0V1ZGLA3yQvUB6rrGovHI8kh1/uqnGofH5suAu/ytE+w4jgL+p4Ql6oU3CmPZz
         wIk2n4cgKYLLukzKHn55qBaDcsGdErRzo3uBrJL5WfDAuIGT6wPfZANCd1HlUOAT0D1y
         wLrgJ2JsX53A7KosR0HWxK9VtCyzKseGzzluvjwnmgCWLo2KyO2gag7N++GSNfiK52E2
         eagvWr+BBUVD4dT2SaPMKnNWHK/T7IHsmp7jPdL6uwnShEqBE97IRgDeTZO03suXhnjl
         Qjuw==
X-Gm-Message-State: AOAM532EbPMk0eC86S9QK4r53YF924YCjxIVv0RoFFfkpE3xg3so4olg
	bVy2xrmIZxnaSu1zR/oC2o6uzqpoHRRRH+EzuyQ=
X-Google-Smtp-Source: 
 ABdhPJzbkEhDqeKInTazKWPSbwtqmY70Ee6Z/3cKybJm/cVOxFr5RB7gE+w2lfGOAi2abkUtMKI/Ow==
X-Received: by 2002:a02:29cc:: with SMTP id
 p195mr14933304jap.134.1641137593842;
        Sun, 02 Jan 2022 07:33:13 -0800 (PST)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 z19sm19575681ill.47.2022.01.02.07.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jan 2022 07:33:13 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id D5DDE9606FF; Sun,  2 Jan 2022 05:33:10 -1000 (HST)
Subject: OE-core CVE metrics for honister on Sun 02 Jan 2022 05:30:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220102153310.D5DDE9606FF@nuc.router0800d9.com>
Date: Sun,  2 Jan 2022 05:33:10 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Jan 2022 15:33:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160104

Branch: honister

New this week: 1 CVEs
CVE-2021-4136: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4136 *

Removed this week: 0 CVEs

Full list:  Found 21 unpatched CVEs
CVE-2016-20012: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-20012 *
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974: nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2020-35503: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35503 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-31879: wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-3507: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
CVE-2021-36976: libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36976 *
CVE-2021-3713: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3713 *
CVE-2021-3974: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3974 *
CVE-2021-3984: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3984 *
CVE-2021-4019: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4019 *
CVE-2021-4069: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4069 *
CVE-2021-4136: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4136 *
CVE-2021-42762: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42762 *
CVE-2021-43400: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-43400 *
CVE-2021-45078: binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45078 *
CVE-2021-45085: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45085 *
CVE-2021-45086: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45086 *
CVE-2021-45087: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45087 *
CVE-2021-45088: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45088 *

