Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EE28C4332F
	for <webhook@archiver.kernel.org>; Sun, 27 Nov 2022 13:32:23 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.91659.1669555934368154561
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Nov 2022 05:32:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=K92S4nZh;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id j12so7830719plj.5
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 05:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lz19LThzeVDfDWqKdRCmuTz2Waw+GGnGhHtwYWRuGZE=;
        b=K92S4nZhQdHfP9c2Mahdzn6uQCBIB2PJAcK2yNZH8J91JdKsCQxP9gQP027B092swY
         hr5pNAdC4aAoZllFrvd+Or6hQRclRqt3iNXdt6VB3vHyfqPOBBlBLwcSiKfwzRinueBD
         uBT3KL0vRTiy0nYm9sawq+7zHYud2BMRGEae6wBMeU35aeGSifWqyH48wIH7rfz+33Va
         p0+x78rX2uc5wPlhVnu3NrAZkSqpebC7NK/mI6poGjABoDl8lRHNZmcN5ZRE+V2jcou4
         QpoWOrOTHYYP72Piit5PDhEUXGTEwgN6qEXiH2ZHssb0JKmF90gThcYDn0nC3UM8Kk5m
         73UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lz19LThzeVDfDWqKdRCmuTz2Waw+GGnGhHtwYWRuGZE=;
        b=VbJE5gPeqE+SeebTayNl8IgtaYuBLzz1ZqEm/OTAiQXbjynRBXqu/bP1yk//aF/o8i
         jwg8/sdayxpwgpS8FXVWXRoFaOC7FmRB7D89QVK+EXuS9sNuXmLO6op4pmUM8w9WKGU9
         p/KTsiOxjaWHFeML8AKsI1du0U9PP0uFEexuOdMrw2Po88j10Ls/pbhiXatMOkl69ol3
         n4C7G1tSoiZJRQaZ8MBdDzb5G/GUO0OywsxhA71aiE/VEqV9HnqTSV13ccttaNVyYKxf
         NEU8MfONGVPjZjrLNU+8g9DI5ZqcmhN3rPB9gKTPNMncYTRmKqhF9KYCfkRRV+sPjVYH
         UR7w==
X-Gm-Message-State: ANoB5pllOxnuRYBQqhF7CCs/zFu3pixCXyyC5QPv9W20zgQ0hBIWzigD
	PckyTh4kmhbjyJD+h4lO1NGkkWzZT0wLTTQ293M=
X-Google-Smtp-Source: AA0mqf7jlOYSrKgCQcz7FAq0YdVMaOMQTPpKxA0BwM98WE0FULuVzTJInm7w5RR4WvhTRuQDZjhZ+Q==
X-Received: by 2002:a17:903:41c9:b0:185:57b6:13c3 with SMTP id u9-20020a17090341c900b0018557b613c3mr40691243ple.116.1669555933268;
        Sun, 27 Nov 2022 05:32:13 -0800 (PST)
Received: from nuc.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id lr18-20020a17090b4b9200b00212cf2fe8c3sm18036664pjb.1.2022.11.27.05.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 05:32:12 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 0093F9602F7; Sun, 27 Nov 2022 03:32:10 -1000 (HST)
Subject: OE-core CVE metrics for langdale on Sun 27 Nov 2022 03:30:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20221127133211.0093F9602F7@nuc.router0800d9.com>
Date: Sun, 27 Nov 2022 03:32:10 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 13:32:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173843

Branch: langdale

New this week: 1 CVEs
CVE-2022-4055 (CVSS3: 7.4 HIGH): xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4055 *

Removed this week: 5 CVEs
CVE-2022-2879 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2879 *
CVE-2022-2880 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2880 *
CVE-2022-41715 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41715 *
CVE-2022-41716 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41716 *
CVE-2022-43680 (CVSS3: 7.5 HIGH): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-43680 *

Full list:  Found 8 unpatched CVEs
CVE-2022-3872 (CVSS3: 8.6 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3872 *
CVE-2022-39253 (CVSS3: 5.5 MEDIUM): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-39253 *
CVE-2022-39260 (CVSS3: 8.8 HIGH): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-39260 *
CVE-2022-39377 (CVSS3: 9.8 CRITICAL): sysstat https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-39377 *
CVE-2022-3970 (CVSS3: 9.8 CRITICAL): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3970 *
CVE-2022-4055 (CVSS3: 7.4 HIGH): xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4055 *
CVE-2022-42919 (CVSS3: 7.8 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-42919 *
CVE-2022-45061 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-45061 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

