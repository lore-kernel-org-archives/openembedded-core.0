Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7F78C433F5
	for <webhook@archiver.kernel.org>; Sun, 14 Nov 2021 14:03:27 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web08.9476.1636898606615691240
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Nov 2021 06:03:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=0Ax72r56;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id
 gx15-20020a17090b124f00b001a695f3734aso11688413pjb.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Nov 2021 06:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=muqd2F8r9RWQXB0AuoPqfihVr6/W42Xm9kKWddQOKMU=;
        b=0Ax72r56daEr7QmZMlRZbY5osJqny8dZLJeFXIQogjDdQX0ZWitRJBRXJBIlcFFuzm
         Rpax1PD3wgjE+78RtUkVg20MFsbl2Aw9OGIPDuDzh6IU7/TpqAuCuPZy3tCLHNpfCPt1
         HXgbD2CcaqraJKArjPaI6UtxhqUXAXBTXCVVTpNS6wzypYWFhrBs9b6GYe6SPuL4yTsK
         zw50Q9hVU3OTQjFwYmXaT4jXt0t2aCrAap4gqDtdHSFhXTm8fgspWzXuuvmcEkwqmbwb
         j2n86mpaV7zgO1gsCPKIJ/vnj7iIAjAT+qZEAfIE7zwbndSHpQE2ojuYtB0x9+Bc0Q9A
         7r1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=muqd2F8r9RWQXB0AuoPqfihVr6/W42Xm9kKWddQOKMU=;
        b=df1QRob/6nZEIEY9MzTSJWLBePAjDW3N9I7YMW0LeeII0c/2kOCSlqA/GJ1owOAmMc
         YqJ/GpHgdUJVE6pc/lR7RyEx91vghIWRGu/hNtwHKJFjHI7nJP6rPy4dtPc49zt6NFsr
         nPPfoSq+Ze3mU9QIveqKcQDpDmXJmpvzJG27n8x0CDQRAqqoEPgJO86fn/7MZUwuyDTG
         M6SDiag5NxIWlq1SwWCSQ2jcrj1hkCpO10eHI5MPej2N2V+ge5DmdKlJ7V9sU9Hmsqwt
         4BA3SWwBgak71brz2/SV8HrvRy2J+XVTMq7xAIvL6FxaGg5H+6xYVTtG4vIJypWmmOzo
         y5AQ==
X-Gm-Message-State: AOAM533TS+w1MvRtbgDsCMwavMqsRxFLfAxZBWQm/RHPofhcFad8zFPk
	p0E1IX1Cqm9UWUtWXfTE6IxFkImTaxazFC6NLXw=
X-Google-Smtp-Source: 
 ABdhPJw68GOs4sYcBECyAv2QNS2BoA6/sjnApJ2bYAD9jaqMRV2n2tawFIp8WB15qtRGVRAlilIpVA==
X-Received: by 2002:a17:902:860b:b0:143:87bf:648f with SMTP id
 f11-20020a170902860b00b0014387bf648fmr26681901plo.11.1636898605487;
        Sun, 14 Nov 2021 06:03:25 -0800 (PST)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 p17sm9241067pgj.93.2021.11.14.06.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Nov 2021 06:03:25 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 4D9F89603EA; Sun, 14 Nov 2021 04:03:22 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 14 Nov 2021 04:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20211114140322.4D9F89603EA@nuc.router0800d9.com>
Date: Sun, 14 Nov 2021 04:03:22 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Nov 2021 14:03:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158256

Branch: master

New this week: 6 CVEs
CVE-2021-3927: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3927 *
CVE-2021-3928: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3928 *
CVE-2021-41771: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41771 *
CVE-2021-41772: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41772 *
CVE-2021-43396: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-43396 *
CVE-2021-43519: lua:lua-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-43519 *

Removed this week: 4 CVEs
CVE-2021-3796: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3796 *
CVE-2021-3872: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3872 *
CVE-2021-3875: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3875 *
CVE-2021-3903: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3903 *

Full list:  Found 14 unpatched CVEs
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974: nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-3527: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3527 *
CVE-2021-3682: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3682 *
CVE-2021-36976: libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36976 *
CVE-2021-3713: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3713 *
CVE-2021-38297: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-38297 *
CVE-2021-3927: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3927 *
CVE-2021-3928: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3928 *
CVE-2021-41771: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41771 *
CVE-2021-41772: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41772 *
CVE-2021-43396: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-43396 *
CVE-2021-43519: lua:lua-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-43519 *

