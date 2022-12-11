Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A738C4332F
	for <webhook@archiver.kernel.org>; Sun, 11 Dec 2022 13:32:23 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.16643.1670765533988319955
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Dec 2022 05:32:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=IucuhNkd;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id 17so2018843pll.0
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Dec 2022 05:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GeOcgAOOIvNix0d7BvGZcIKXUMMlkEXeBd8LZGAqQeo=;
        b=IucuhNkd/+JhZI/wR0T8BaxeZMpxRwlT4SOI4Len6U1HPjNg6w+FXgPuJv8ctNbf13
         rCYsB+v9i8227hrH+Dmx5X+VCE7UMRwcFZXuZ8J1tASWr7EdMj0oTW1hK5Li7ty+1mfr
         Ug97N3fNZbdZAyBu0aXiVU2gesxJwYiJDQWicBvqjMrZChPt7n4PgHVu1aa+NOW5NLcD
         sEX7M3mYQJ/z1rz9FQzISmhK3YUMHKiaEhDDSwBYkPeDOaZiyUDVwSubHk9zZWAabX6W
         MbolRGOL6pNdYYA4bbz7M3CZAAkNT3e8t2rv0HeDKTN+NAL1GDT0f1a9Rf4VVHlYaS5z
         08yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GeOcgAOOIvNix0d7BvGZcIKXUMMlkEXeBd8LZGAqQeo=;
        b=Qygf98N0NfHFDx80quKqPmws7U7ZF/eSzzeiMydGmtG9Mujz3jBhGlvaySPv56A3N3
         b/TwSwmY108HGMLS9s3oIcz7Bp7ndK1TUbKCiE8kchj5IT2vckL/th2zQ6/TLvoZZyBq
         4Cfos2WiwEQVqmd3EXPvXFfI5aen8N3AMC2TgAWXeOSQbHDOvvSaEZ35nVu9jmqJWD5H
         fftDuL9QKPrvUQP8iw+11UDuIeuF1QQRrQcD1Xa3FEjcEQFVYOUQDnNwv1OzOzv+QYFT
         g4tGHua0xlOUgUENFTATUTwhAEKHw+u9xTrLCnBtSKT5qhzOrFZSYnEzV+8wUgbIyLw/
         UT9g==
X-Gm-Message-State: ANoB5pmC/wj6KtyN+uFhQE8j4tJcJYmVpZ5dMBRk5sy+E3CIQjXg1AWq
	iLupic3wp2+iAZFvitWgHfgryrqo5CogsXPnv3hKEA==
X-Google-Smtp-Source: AA0mqf4zxaOPSc6Oi3JuGICbxacryyByufNn4OYaQO9MRqrn5VwthQ5i7UHpybtLvmElQT5ANHwayQ==
X-Received: by 2002:a05:6a20:43ab:b0:ac:f68:24a0 with SMTP id i43-20020a056a2043ab00b000ac0f6824a0mr18343264pzl.29.1670765532891;
        Sun, 11 Dec 2022 05:32:12 -0800 (PST)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id o14-20020a170902d4ce00b0018999a3dd7esm4367984plg.28.2022.12.11.05.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Dec 2022 05:32:12 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 695109602A7; Sun, 11 Dec 2022 03:32:10 -1000 (HST)
Subject: OE-core CVE metrics for langdale on Sun 11 Dec 2022 03:30:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20221211133210.695109602A7@nuc.router0800d9.com>
Date: Sun, 11 Dec 2022 03:32:10 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Dec 2022 13:32:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174474

Branch: langdale

New this week: 0 CVEs

Removed this week: 0 CVEs

Full list:  Found 13 unpatched CVEs
CVE-2022-36227 (CVSS3: 9.8 CRITICAL): libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-36227 *
CVE-2022-37454 (CVSS3: 9.8 CRITICAL): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-37454 *
CVE-2022-3872 (CVSS3: 8.6 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3872 *
CVE-2022-39253 (CVSS3: 5.5 MEDIUM): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-39253 *
CVE-2022-39260 (CVSS3: 8.8 HIGH): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-39260 *
CVE-2022-40303 (CVSS3: 7.5 HIGH): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-40303 *
CVE-2022-40304 (CVSS3: 7.8 HIGH): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-40304 *
CVE-2022-4055 (CVSS3: 7.4 HIGH): xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4055 *
CVE-2022-4141 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4141 *
CVE-2022-4144 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4144 *
CVE-2022-42919 (CVSS3: 7.8 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-42919 *
CVE-2022-4292 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4292 *
CVE-2022-45061 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-45061 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

