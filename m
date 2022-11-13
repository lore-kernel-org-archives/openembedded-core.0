Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B271AC433FE
	for <webhook@archiver.kernel.org>; Sun, 13 Nov 2022 12:02:33 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web12.1880.1668340947418692596
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Nov 2022 04:02:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=vam/wbwK;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id v4-20020a17090a088400b00212cb0ed97eso8277653pjc.5
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 04:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GP0Ur78xfGoGwCzltRZdIjQdYsntY+P+Pfp2Y+BjQPw=;
        b=vam/wbwKPoW6EtWAoczbA8Tl42uDR3t86W95qmPwvtE8vZMGuaiWEb7yelkRHg+5B3
         z7I2J9SfDwmLKp2HIQpa/hQrodfawTlsw24CpAU28bYjE0hBbMlzGQX2nf6qciEczfZ2
         f9ouxiKXvUFwVepNeWB7kDWZdM33KCYAcAMFGIlVmGCR018ofO81LIRzeGH7ifN8pRLJ
         lpgP0toC6xD/Z4sUClTHuSKpOBKz9dUW2NRpli0/7aPf3GRjy/Y6mci5acocShAG3yJp
         FsscBRMSNWk8RAkld507W440U4O9YTcRz3JE1cQWhHgcjyzcjAQn7SGlSLTxr7rKLfdh
         7ZUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GP0Ur78xfGoGwCzltRZdIjQdYsntY+P+Pfp2Y+BjQPw=;
        b=oMqFfONdD5Yr2UBVwxEv/QrwqY+TnTl5QWC5Moio/eZdjEjB9/ZPjyLNyblNvB6Ltp
         aA02XML+QK8ZE2NQ0nfEvHeUyHNGOWLFHu6nFIaXvzu4fOaf6aHcKi7KOIgTNpOUxR5l
         6pINNavRhB1UTe8o4KG/XonFAlxe0L1DnyfIk7uc/19lhKyTzkWagaCTpNpDxjyNjru+
         VZBuKUy7gF1d6veP2wUhTkGauSX4PzGHg9mvNmO/8wtaEGkCwidwyL052/0wWd+2/Iww
         Dh1ReXmg+9ymGph/bTSGxY0eUTQdyq7yDw1B8AdVvcOZf4lbMSZeWZfZnAI/40KXgppI
         IkqQ==
X-Gm-Message-State: ANoB5plld+3fnf+GJbvPQu7EnsSTClyOZF50yeEqUNwGmvzlH1MFL53Y
	2nsB+fN4Qx+NjOuehCYxHBUx5cQUYuTU1lGT
X-Google-Smtp-Source: AA0mqf5MV0gxYZTpecmtgCqPwkgjTnZe4WPo2nJ13RJudPV0Z58RWOEkOfAlfDl9lN4FmWOeMAhF1A==
X-Received: by 2002:a17:902:a408:b0:188:542a:68d8 with SMTP id p8-20020a170902a40800b00188542a68d8mr9687633plq.126.1668340946138;
        Sun, 13 Nov 2022 04:02:26 -0800 (PST)
Received: from nuc.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id o28-20020aa7979c000000b0056babe4fb8asm3709262pfp.49.2022.11.13.04.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Nov 2022 04:02:25 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 7A3849602F2; Sun, 13 Nov 2022 02:02:23 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 13 Nov 2022 02:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20221113120223.7A3849602F2@nuc.router0800d9.com>
Date: Sun, 13 Nov 2022 02:02:23 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 12:02:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173189

Branch: master

New this week: 2 CVEs
CVE-2022-3872 (CVSS3: 8.6 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3872 *
CVE-2022-45061 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-45061 *

Removed this week: 1 CVEs
CVE-2022-44638 (CVSS3: 8.8 HIGH): pixman:pixman-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-44638 *

Full list:  Found 3 unpatched CVEs
CVE-2022-3872 (CVSS3: 8.6 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3872 *
CVE-2022-43995 (CVSS3: 7.1 HIGH): sudo https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-43995 *
CVE-2022-45061 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-45061 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

