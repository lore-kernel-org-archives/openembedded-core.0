Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13796C4332F
	for <webhook@archiver.kernel.org>; Sun,  4 Dec 2022 12:02:36 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.127280.1670155347729630426
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Dec 2022 04:02:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=o/0sbFPm;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id y17so8491687plp.3
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Dec 2022 04:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pchxvQ1apzgLC40ZWiHE1Wj68DuR0HthsRTKuJj8oVg=;
        b=o/0sbFPmmpyFGQvOiJy8nMg1Gv62Cs/0U7g6wBMH9SDL/hhM6W7jYROcRctYN3MJWn
         hAOA1TIgmCmVD3Kv4EHUhH1pfGSiiEpnvg6+du/dIC7C5kABab6tLtTCfbUvO8bUSCoU
         mlshkE/XSeCr84B1Ig0mN/IlgWHeklQRLCNP3J6ktMsGEIHaxi+QPU5mUEdrqvYc9vb/
         xiRZsBj8Tw6wsul+zuHR2BiNkxpLjxitTTpucMiUlo7564aoDY0gbHcEl3q0Z9li7cgY
         HIaPY4Y19KY367+59VZKksUV6cOC3mGa3Rdblo/w15J54ViEYN9bwJ71oiWj5CpD/7lO
         ie/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pchxvQ1apzgLC40ZWiHE1Wj68DuR0HthsRTKuJj8oVg=;
        b=U5IPlxRdG5BUHvFuSgv33RA1OO0hF89lxTVW26b1+KU+fFul94+uQJBGxQdmaZORbX
         I2l39+V3Wee0bES2QDuArubPphYezga4szFNlY05m19fFK4f8LYhPF7ZSkH8F5BIcE0X
         El51fcl08HI1hCT6wgExafrIaZjIVugPA80J5mbb0CtHXi14aN/77Zs9To/PAPPTm7Ty
         AZ0+RHYBN0/fC9baW1PSo6RQ7SNYk9RnCPckHcXaTAZRSI/q+xsHS8tL+RuZgGkjrRqw
         +pyM7zFqWgnueLW2Tm8OZWspfAsZqFC6uI9/xSI9pjpdR0J+gDux4xDcUXCYyKmEe96W
         Vs6g==
X-Gm-Message-State: ANoB5pnvoyQlCZgiugi/t7k/U0ZMrYtgdUmKgWFUn4iMYbMvLA+GhMLh
	Dqh70TdQFw1Y+OUr6XtITUuCaCxkorm5bDJaR4oD5Q==
X-Google-Smtp-Source: AA0mqf6J6Qsv+sgQN0Qdi+Zn0IqQAi3ZjYN4vQSV17sSJXQ9FnjRatLuu7ne85PXczdMqyqvk2aOWg==
X-Received: by 2002:a17:90a:bb16:b0:200:2d7f:18c2 with SMTP id u22-20020a17090abb1600b002002d7f18c2mr84382339pjr.106.1670155346608;
        Sun, 04 Dec 2022 04:02:26 -0800 (PST)
Received: from nuc.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id e17-20020aa798d1000000b005742ee445fdsm8005418pfm.70.2022.12.04.04.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Dec 2022 04:02:25 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id EA1309602B7; Sun,  4 Dec 2022 02:02:23 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 04 Dec 2022 02:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20221204120223.EA1309602B7@nuc.router0800d9.com>
Date: Sun,  4 Dec 2022 02:02:23 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Dec 2022 12:02:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174250

Branch: master

New this week: 5 CVEs
CVE-2022-36227 (CVSS3: 9.8 CRITICAL): libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-36227 *
CVE-2022-40303 (CVSS3: 7.5 HIGH): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-40303 *
CVE-2022-40304 (CVSS3: 7.8 HIGH): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-40304 *
CVE-2022-4141 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4141 *
CVE-2022-4144 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4144 *

Removed this week: 1 CVEs
CVE-2022-3970 (CVSS3: 9.8 CRITICAL): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3970 *

Full list:  Found 8 unpatched CVEs
CVE-2022-36227 (CVSS3: 9.8 CRITICAL): libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-36227 *
CVE-2022-3872 (CVSS3: 8.6 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3872 *
CVE-2022-40303 (CVSS3: 7.5 HIGH): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-40303 *
CVE-2022-40304 (CVSS3: 7.8 HIGH): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-40304 *
CVE-2022-4055 (CVSS3: 7.4 HIGH): xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4055 *
CVE-2022-4141 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4141 *
CVE-2022-4144 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4144 *
CVE-2022-45061 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-45061 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

