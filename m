Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 113F1C433FE
	for <webhook@archiver.kernel.org>; Sun, 13 Nov 2022 13:32:24 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web12.2476.1668346339958300089
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Nov 2022 05:32:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Ybf/6raF;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id q1-20020a17090a750100b002139ec1e999so8403217pjk.1
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 05:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hr+9Z8vk5Fn5fVohPSZBu3dehERTUL5DXipaXtLZEpQ=;
        b=Ybf/6raFSfCCvYdjFAiRiwyjyIsm2c36X5LYRxsU1idXEHp3dAvYCpoGlG7H+qLKuN
         Sz8hFoZ3hZjSxu7yL5X4i1rRXhngsmuXHwhZFLkZyJCsUOrCy3igVebqMvOaWnNydC5C
         Vd52ILR1IpmfbystC+9M8cKt6MfOahyBuP3QdT4zbGBydDoTwGhntwG+nZhGi4nyF/8S
         Q4WS5KXemwApBcQMqEaCMq6jP/OXQQU+4Lm3R4PjVlfWeirdWogTVmMjXVFVgKUR0Uv8
         1kG6cGRIxbOw4kVxuFtv/BmE9qp+okUKV4SvSZG2ExOjHWvkXraO5Nrq0OSK0Tha9Fbz
         3nJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hr+9Z8vk5Fn5fVohPSZBu3dehERTUL5DXipaXtLZEpQ=;
        b=dCz0vcp2VfHGhrRXjswvjkLJw3jrd+t0hu0qH1QWONY0XjaYRYHXQgzhbFkFx3tl78
         hXALjW3csECnArMUo54k0TIv/se39o/4m1/6rHcCecmTEDWVZyNLpWLeK+pWVg0vuo6v
         yUQUYuVlBvcL4RA5gyHXw1/yGm97muTW6ePfcZLsKUF9m/Fye5yjd0AIoQzBQTPPyG0R
         IbpYhD5lAfmZLSgRZEqEk2TjDxH/Ld9/xeM3bsfNxQw+3xzo0BykMztjTLKDXNE3d1gH
         rbQNX7OkUfE9JMBwKt99sQyQ+KYMfkFOZ3XS5PQtaDajhDX8SGKwHsZNa2xgM5yS694w
         oglw==
X-Gm-Message-State: ANoB5pmrprIfsQvGL0rA6aAFMtFMFCxdhrUll9Pb+aoe0YjLiDSmsoCF
	A+iRTGURz4WQISiB3e8ovQMQ32wi9hd7wSGA
X-Google-Smtp-Source: AA0mqf73n+nG5HJnmmTPHWC+1ZUxgcqPEi4jbqk4AAsR9L0gBFurVilc9v5JReMYEHpF3V/bjnRAnQ==
X-Received: by 2002:a17:903:2301:b0:187:3fcb:121e with SMTP id d1-20020a170903230100b001873fcb121emr10180663plh.100.1668346338594;
        Sun, 13 Nov 2022 05:32:18 -0800 (PST)
Received: from nuc.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id e127-20020a621e85000000b0056bb06ce1cfsm4864879pfe.97.2022.11.13.05.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Nov 2022 05:32:18 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 446D19602F2; Sun, 13 Nov 2022 03:32:16 -1000 (HST)
Subject: OE-core CVE metrics for langdale on Sun 13 Nov 2022 03:30:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20221113133216.446D19602F2@nuc.router0800d9.com>
Date: Sun, 13 Nov 2022 03:32:16 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 13:32:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173192

Branch: langdale

New this week: 3 CVEs
CVE-2022-3872 (CVSS3: 8.6 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3872 *
CVE-2022-42919 (CVSS3: 7.8 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-42919 *
CVE-2022-45061 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-45061 *

Removed this week: 1 CVEs
CVE-2022-3705 (CVSS3: 7.5 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3705 *

Full list:  Found 14 unpatched CVEs
CVE-2022-2879 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2879 *
CVE-2022-2880 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2880 *
CVE-2022-3872 (CVSS3: 8.6 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3872 *
CVE-2022-39253 (CVSS3: 5.5 MEDIUM): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-39253 *
CVE-2022-39260 (CVSS3: 8.8 HIGH): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-39260 *
CVE-2022-41715 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41715 *
CVE-2022-41716 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41716 *
CVE-2022-42915 (CVSS3: 9.8 CRITICAL): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-42915 *
CVE-2022-42916 (CVSS3: 7.5 HIGH): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-42916 *
CVE-2022-42919 (CVSS3: 7.8 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-42919 *
CVE-2022-43680 (CVSS3: 7.5 HIGH): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-43680 *
CVE-2022-43995 (CVSS3: 7.1 HIGH): sudo https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-43995 *
CVE-2022-44638 (CVSS3: 8.8 HIGH): pixman:pixman-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-44638 *
CVE-2022-45061 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-45061 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

