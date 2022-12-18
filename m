Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78B0AC4332F
	for <webhook@archiver.kernel.org>; Sun, 18 Dec 2022 12:03:08 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.28253.1671364980783761395
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Dec 2022 04:03:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=X7i9OqSR;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id w4-20020a17090ac98400b002186f5d7a4cso10454258pjt.0
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Dec 2022 04:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qiuYUAKi28YaX/J8AicpAwpULVnoJrl1HH5TJpXmC2c=;
        b=X7i9OqSRK9MNPpkgb1VL5wLjFjITaPkDKBm7QuGtMWiwE9BN7s2E1s3+cEoHHLV+bX
         SkeOyNDILaup5ST4zaamu8BXYW7gTYPaGlEebACn0YQhMJhovmcdfYajiUViqkomFWk1
         kC5iPIUZ4tNBXy4RWe2rDrrUOlW1XTS59UHo3Pn2l0Of5PNPUWMzzxoLdheQ25kIXm6U
         MSPyCgldw1EJDPqAXyt4GHJSJF5dHp+p9Dt0gTfjBUnLSawhBqoI9MlF1SDBL5V0PEEL
         7qS43oNY6Ik2PDtHANmQTqgAl8x5yFdCV2VvuCbxMjZ639Gdsu+lolbUrTN1f9fzfyv3
         YQuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qiuYUAKi28YaX/J8AicpAwpULVnoJrl1HH5TJpXmC2c=;
        b=lhYybw0mHyWhadBRrB4DqYhi89ST+BpbNSRNeEZfausd3UTiQAsDLRIZBeCo3qjfYY
         f1vPJVB1kJO7pdztgCOeBaAQGRxJ+yda//EqRLkR+AB3jDOognP2iDxG+1BFr2duaW1r
         +NVxnmHwykKyy+qVJUuGS/q9zK8V2LGYKN6LcEJ4r5fFR90k6HsPD7CDSMWvuAiAONps
         qCnw9OOGK3WbTfrSb+YVjSU/bjoMKHqfUI9I36NhDemxNAHKk0vEDfD06JELAykAFNXJ
         pap9ZJYQiUtJWn9U4BiVjuCRx8XMKn5tjextaKJAc14zLrRMpF9024A44UCorqlTBAkl
         zC/w==
X-Gm-Message-State: ANoB5pkBjtDDx6q3JIbMqb2oe5Y8pIdXuMr3l+jIHA2WueF407pGP/Ov
	oZ0q5s+6phXJBPYv5RNtdOcmAgwmqGhfv1fj1t4=
X-Google-Smtp-Source: AA0mqf6gfmeBHPEB9quYVyzqlnK2/2PETLqlKiCYtcLmx5thkxDV8VGPnvprkxuivADNEwDeioveVA==
X-Received: by 2002:a05:6a20:a599:b0:ad:e914:5523 with SMTP id bc25-20020a056a20a59900b000ade9145523mr26738376pzb.53.1671364979580;
        Sun, 18 Dec 2022 04:02:59 -0800 (PST)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id u62-20020a637941000000b004790eb3fee1sm4275269pgc.90.2022.12.18.04.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Dec 2022 04:02:58 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id EBFBC960367; Sun, 18 Dec 2022 02:02:56 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 18 Dec 2022 02:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20221218120256.EBFBC960367@nuc.router0800d9.com>
Date: Sun, 18 Dec 2022 02:02:56 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Dec 2022 12:03:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174783

Branch: master

New this week: 5 CVEs
CVE-2022-2601 (CVSS3: 8.6 HIGH): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2601 *
CVE-2022-3996 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3996 *
CVE-2022-41717 (CVSS3: 5.3 MEDIUM): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41717 *
CVE-2022-41720 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41720 *
CVE-2022-46908 (CVSS3: 9.8 CRITICAL): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46908 *

Removed this week: 0 CVEs

Full list:  Found 9 unpatched CVEs
CVE-2022-2601 (CVSS3: 8.6 HIGH): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2601 *
CVE-2022-3872 (CVSS3: 8.6 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3872 *
CVE-2022-3996 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3996 *
CVE-2022-4055 (CVSS3: 7.4 HIGH): xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4055 *
CVE-2022-4144 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4144 *
CVE-2022-41717 (CVSS3: 5.3 MEDIUM): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41717 *
CVE-2022-41720 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41720 *
CVE-2022-45061 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-45061 *
CVE-2022-46908 (CVSS3: 9.8 CRITICAL): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46908 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

