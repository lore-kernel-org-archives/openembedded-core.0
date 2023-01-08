Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C1D2C53210
	for <webhook@archiver.kernel.org>; Sun,  8 Jan 2023 13:33:31 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.44651.1673184810319660001
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Jan 2023 05:33:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=y7D25XSZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id cp9-20020a17090afb8900b00226a934e0e5so9124195pjb.1
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Jan 2023 05:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FWZXi6FHA2BXeV21La0ZU34fpMmCviKiQQ8nbnLS3AU=;
        b=y7D25XSZc9Vj7YQ0JAEZMidF3e8HIT4WGwEjE14P3kysit5Nod1KjUeA4ez5zPwwAN
         cDfwUs13Pihd1ZoWEGiwOIQ4ZjMKyArI61tlUJDtHZxWu4noE/EF5ONuoKvIUBshBYqR
         ZPTEtuFq/h6SVGrpxhpK6VOMabIYM+agFO47L3ywWYjkLnyahK+zKjM9SukaYayyJT/M
         KXcZs8xow4S/V2+kt2QOLaAmLpO2DYbtWGU9kZB75Lgisf8iySrKOFccy8tqJaaxhV/L
         HWbMEH/R4wqVKZhEm9ADhNqd1yQYMeOSQDJtlps0bTMNfHPSoZ3zt9IowRtfuTftjh6M
         tnRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FWZXi6FHA2BXeV21La0ZU34fpMmCviKiQQ8nbnLS3AU=;
        b=3q5w/K/bRrOs78u1qLTHNJUE+//cRettIL2IHwATpDtDQGSbmrI8Tvr0AzoQkamKv+
         dLQhJrvpFPdSsVzwEkXWt1Zgb440QAZFdpWFu2LLN7MbiMAMpoQl3HkxAkR8PyD+/x+O
         ZdGLo3UTG7UCe7Jgesh5hYwxITqA8gws2gXKDIYvMIo1qNuE20XZllEEaJkNxFurntrG
         guqbWq7SxRxXg3oYsTfGEt9eadgx6NXRI+j68kosTtm7VoyqR+NLguW+/iU7MjkZIyol
         1q8dPZ1r62R832fv/E7PCiwPL5lgs0Quc5D+DqYn/onfLZhuHLzxCdWAc+Eymoyc9oHT
         U9Qw==
X-Gm-Message-State: AFqh2kpC9fh/ZrNpqMDBu4VjDQctm8bJy24lPGGdqORGTl1yoYg7eP/L
	icutGibsKB6op6ujdc5sywr2ANN9SyiTUqNLQ10=
X-Google-Smtp-Source: AMrXdXup6py2+yleywbVe+lUr4DzSm4Hts+D9T8NfBgaA0olUw16KvnIwYxRsD67cCty0HZ/Op9GaA==
X-Received: by 2002:a17:90a:fa89:b0:226:a4bc:c4d8 with SMTP id cu9-20020a17090afa8900b00226a4bcc4d8mr17984637pjb.4.1673184808833;
        Sun, 08 Jan 2023 05:33:28 -0800 (PST)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id ms19-20020a17090b235300b002132f3e71c6sm3796852pjb.52.2023.01.08.05.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 05:33:28 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 70F419602D3; Sun,  8 Jan 2023 03:33:24 -1000 (HST)
Subject: OE-core CVE metrics for langdale on Sun 08 Jan 2023 03:30:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20230108133324.70F419602D3@nuc.router0800d9.com>
Date: Sun,  8 Jan 2023 03:33:24 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Jan 2023 13:33:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175629

Branch: langdale

New this week: 2 CVEs
CVE-2022-43551 (CVSS3: 7.5 HIGH): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-43551 *
CVE-2022-47629 (CVSS3: 9.8 CRITICAL): libksba:libksba-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-47629 *

Removed this week: 0 CVEs

Full list:  Found 23 unpatched CVEs
CVE-2022-2601 (CVSS3: 8.6 HIGH): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2601 *
CVE-2022-37454 (CVSS3: 9.8 CRITICAL): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-37454 *
CVE-2022-3775 (CVSS3: 7.1 HIGH): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3775 *
CVE-2022-3872 (CVSS3: 8.6 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3872 *
CVE-2022-39253 (CVSS3: 5.5 MEDIUM): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-39253 *
CVE-2022-39260 (CVSS3: 8.8 HIGH): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-39260 *
CVE-2022-3996 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3996 *
CVE-2022-40303 (CVSS3: 7.5 HIGH): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-40303 *
CVE-2022-40304 (CVSS3: 7.8 HIGH): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-40304 *
CVE-2022-4055 (CVSS3: 7.4 HIGH): xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4055 *
CVE-2022-40897 (CVSS3: 5.9 MEDIUM): python3-setuptools:python3-setuptools-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-40897 *
CVE-2022-4144 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4144 *
CVE-2022-41717 (CVSS3: 5.3 MEDIUM): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41717 *
CVE-2022-41720 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41720 *
CVE-2022-42010 (CVSS3: 6.5 MEDIUM): dbus:dbus-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-42010 *
CVE-2022-42011 (CVSS3: 6.5 MEDIUM): dbus:dbus-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-42011 *
CVE-2022-42012 (CVSS3: 6.5 MEDIUM): dbus:dbus-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-42012 *
CVE-2022-42919 (CVSS3: 7.8 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-42919 *
CVE-2022-43551 (CVSS3: 7.5 HIGH): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-43551 *
CVE-2022-45061 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-45061 *
CVE-2022-4603 (CVSS3: 8.8 HIGH): ppp https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4603 *
CVE-2022-46908 (CVSS3: 7.3 HIGH): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46908 *
CVE-2022-47629 (CVSS3: 9.8 CRITICAL): libksba:libksba-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-47629 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

