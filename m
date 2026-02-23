Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2B50E98E0E
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 08:55:53 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31745.1771836948164394309
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 00:55:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=2BPXSum+;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48371119eacso46751085e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 00:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771836946; x=1772441746; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bpycp3yLKRQE0dyxg3mZPiyPupCZAjXhuvokk6ehADA=;
        b=2BPXSum+VMQMkGyiRK2fxOfdGx/lMt1uHA4PAqtvbx5ApQuASrYzDeupwCcuqnHpCf
         4OFDTAWxKxxbc1c1BSq4IrPrtyXVAV2YG/UI26jR593o2VbhDDYCUzuJcbDPGmEL/GUn
         6xtPF45UjIVCMsw+b/BRrAa1Oqj3VhTsUzqlE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771836946; x=1772441746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bpycp3yLKRQE0dyxg3mZPiyPupCZAjXhuvokk6ehADA=;
        b=SnbEb6y0s7cpP9oR3/KJSWI3pXhBdtrRIye/TaksbIXrlYD5L0I3fhLMDo0n0A/Vh3
         qAezj7Ooc3SvwTs8VLBUIEJqFEK7OS5ESulyxVynGPY3zhgZrCFs7IN5PFR5/pwNeqZI
         stqcZxhrpX7xF3sSbJeDp0Y7IS5/XYEtxFuvbB3BgLNntNTpbHYj5pqUr3beGZIOhR7c
         SjSQL7LdrEM8WLfoU43ow+AaCj0RHd/WiuxmgTiH8lRWsVVtIQjfcsFkuNIi94OmmCUd
         fA/EXdNXbB4wfczWxUUbcwRxYvZ4r4Nx+8lcbSBVnpDWh3w391bSMC9Ah0jZIv6SP/eJ
         n2AA==
X-Gm-Message-State: AOJu0YxC4eDBxgvh9rT5T3KZ0GxAlwb3iIK3py/WzFwND3mtfq0+D7Bs
	+OqBEtIQnDThPC5+dGFEyCCeY3fdBPRnNXjqiFLc/CI6lDVMOcsuCIsOxplFSzFfc1FB465/LtN
	1L5Lb
X-Gm-Gg: AZuq6aLALJJRIZ6ARqMBulmNQ5hcrmhsPWkwLF5durMGvJ/xjNxJRwdm4c52WZgTWj1
	oglsVSMu3siKUu7r7XrCkf+1NPLPufPArieHkJG/WzKF0T2SIWF8E18Gw3kW8V2bmNtj++f3yOE
	V/kaiG1LnhSoASRfIS31yrJvI74uBXfrU6qXx79zyAr3msAycI25MwjY/9VRh32+CVBHeV/ZF2/
	Xx0NruHvrt/tteT3iUL6dtTx4V1SeSqJjyyoh0S4A8K9gdrENCTkiijDNDrJ5R78tDdkf55heI7
	pm7V0hW6+PFMeYgA49beChig9oOTctXcKrbXNnGIMl0uzOvVxy7+qvx3+CROsFKZPo4ZBb/gHYK
	/wZBecXkQUO/aTNgoGFvDbq3+VYlKd5bjTrRKk/AvUEPjEMFCVbbNKOcwDGIBSnt+pirG0XA1uE
	w/Uh4qdXUmqShqQDt5J0mFablBaO41mKZY3he2Vv8QfV9JzVlGGezmoN6/XIID3rSenAtiKJ89j
	tEkykb9qCF5VKLeElvGwW7pvtYc
X-Received: by 2002:a05:600c:c8a:b0:483:71f7:2782 with SMTP id 5b1f17b1804b1-483a95fc09emr127900175e9.12.1771836946274;
        Mon, 23 Feb 2026 00:55:46 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00f13df544104db802.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:f13d:f544:104d:b802])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d3ff1csm16424077f8f.20.2026.02.23.00.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 00:55:45 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: OE-Core ML <openembedded-core@lists.openembedded.org>,
	Yocto Security ML <yocto-security@lists.yoctoproject.org>
Subject: OE-core CVE metrics for master on Sun Feb 22 21:38:15 2026
Date: Mon, 23 Feb 2026 09:55:07 +0100
Message-ID: <20260223085507.17802-4-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260223085507.17802-1-yoann.congal@smile.fr>
References: <20260223085507.17802-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 08:55:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231658

Branch: master

New this week: 1 CVEs
CVE-2026-26269 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-26269 *

Removed this week: 4 CVEs
CVE-2025-68468 (CVSS3: N/A): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68468 *
CVE-2025-68471 (CVSS3: N/A): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68471 *
CVE-2026-24882 (CVSS3: N/A): gnupg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-24882 *
CVE-2026-24883 (CVSS3: N/A): gnupg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-24883 *

Full list:  Found 22 unpatched CVEs
CVE-2019-14899 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
CVE-2021-3714 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3714 *
CVE-2021-3864 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3864 *
CVE-2022-0400 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0400 *
CVE-2022-1247 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1247 *
CVE-2022-38096 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38096 *
CVE-2022-4543 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4543 *
CVE-2023-3397 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3397 *
CVE-2023-3640 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3640 *
CVE-2023-39176 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39176 *
CVE-2023-39179 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39179 *
CVE-2023-39180 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39180 *
CVE-2023-4010 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4010 *
CVE-2023-6238 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6238 *
CVE-2023-6240 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6240 *
CVE-2023-6535 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6535 *
CVE-2024-50613 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50613 *
CVE-2024-6519 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-6519 *
CVE-2025-52194 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-52194 *
CVE-2025-59529 (CVSS3: N/A): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-59529 *
CVE-2025-60876 (CVSS3: N/A): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-60876 *
CVE-2026-26269 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-26269 *

Summary of CVE counts by recipe:
  linux-yocto: 16
  libsndfile1: 2
  avahi: 1
  busybox: 1
  qemu:qemu-native:qemu-system-native: 1
  vim: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

