Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B114C433FE
	for <webhook@archiver.kernel.org>; Sun, 20 Nov 2022 13:34:50 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.12463.1668951280099569874
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Nov 2022 05:34:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=LryhSHh5;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id h14so8312708pjv.4
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 05:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ln2jBgl1Dk14QgDWXF9mp5GHgAZARU69D1AdM+YJRmU=;
        b=LryhSHh5jkYFyEoOe8lcTsgqfz1k1LiczhvmEWwD58xgUVibxPsj2/OhPyP7lrGZYy
         eQy1zyvcm+JyACQHZ05HaOWZYXNt4l8qglGbWzmhVGGBaEN6M3CdPO/kTycTJi54GzqT
         rmqcBkmqSMJSJzHZXvfOKF+hCwfFrkigPO2aYObtm3tk5M9Jb5U/+mG/AYfnFycktMbo
         6UCSEJrmJrAZhc7ZiZnz0UmJbcQuyo85LiXgJUQ8+yyt/641F8blTPIRpjldEBl6wIEM
         0fwd84CxfWU2PgPmeBdO7iBKakfDmvyW+AHe+w60jGK1u7to3R0LvpU1sumcSK6PDa9M
         BFBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ln2jBgl1Dk14QgDWXF9mp5GHgAZARU69D1AdM+YJRmU=;
        b=lhU86lCgcPoDX6Vc25O9rt3TdToH1ir0MfVW73yangXnA6zWlOSY+IO7NGTPuv7EaM
         QknjMcHzQ58rUpzHx7quqaDjoi2asXUu+MY70Ri4YXQ7ZRMUq4NzLCFOCiGsRIQdEQPi
         3Bdt7UGtwzx3G38W8uCpWw5NVE86JIgP4B+VbKT2XVyRRNsCoOQem8q7+nY5TE5FIayR
         oQDaQA2yD0xJfYr9dHMlh9wiGdzcE8VYd/vPEtrRjiqXMouLoCFieX3Ts7Sq04PXdm7m
         s4N8rEQV/gsukASpgIvI4nTQqA22xnltrtjKe0e80BTch4tZ4o7YtNCIw1SK8m6oiPdf
         muZg==
X-Gm-Message-State: ANoB5pmW0DXIjMeX9rss07JNf61TxZO1nMgiTxbCj22CjGFnLobJO1r+
	h2+44VdNJ7aV+3MoCo0AW1bqjOy2GmnLjy7qDD8=
X-Google-Smtp-Source: AA0mqf6bAUAqjzzLwD7E5yKjOy9pjwD+M2TnZ+yjsB9lVGINwDJjbIwN1GaNoiKwlhA5DxofenDb3g==
X-Received: by 2002:a17:90a:7e0d:b0:213:d630:f4af with SMTP id i13-20020a17090a7e0d00b00213d630f4afmr16306496pjl.77.1668951278991;
        Sun, 20 Nov 2022 05:34:38 -0800 (PST)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id l11-20020a170903120b00b001769e6d4fafsm7584882plh.57.2022.11.20.05.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 05:34:38 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 9F8D29602C3; Sun, 20 Nov 2022 03:34:36 -1000 (HST)
Subject: OE-core CVE metrics for langdale on Sun 20 Nov 2022 03:30:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20221120133436.9F8D29602C3@nuc.router0800d9.com>
Date: Sun, 20 Nov 2022 03:34:36 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 13:34:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173599

Branch: langdale

New this week: 2 CVEs
CVE-2022-39377 (CVSS3: 9.8 CRITICAL): sysstat https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-39377 *
CVE-2022-3970 (CVSS3: 9.8 CRITICAL): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3970 *

Removed this week: 4 CVEs
CVE-2022-42915 (CVSS3: 9.8 CRITICAL): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-42915 *
CVE-2022-42916 (CVSS3: 7.5 HIGH): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-42916 *
CVE-2022-43995 (CVSS3: 7.1 HIGH): sudo https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-43995 *
CVE-2022-44638 (CVSS3: 8.8 HIGH): pixman:pixman-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-44638 *

Full list:  Found 12 unpatched CVEs
CVE-2022-2879 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2879 *
CVE-2022-2880 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2880 *
CVE-2022-3872 (CVSS3: 8.6 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3872 *
CVE-2022-39253 (CVSS3: 5.5 MEDIUM): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-39253 *
CVE-2022-39260 (CVSS3: 8.8 HIGH): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-39260 *
CVE-2022-39377 (CVSS3: 9.8 CRITICAL): sysstat https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-39377 *
CVE-2022-3970 (CVSS3: 9.8 CRITICAL): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3970 *
CVE-2022-41715 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41715 *
CVE-2022-41716 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41716 *
CVE-2022-42919 (CVSS3: 7.8 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-42919 *
CVE-2022-43680 (CVSS3: 7.5 HIGH): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-43680 *
CVE-2022-45061 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-45061 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

