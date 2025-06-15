Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83978C61CE8
	for <webhook@archiver.kernel.org>; Sun, 15 Jun 2025 11:03:00 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.7132.1749985374779671505
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 04:02:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=VMTskEGp;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-235a3dd4f0dso22877325ad.0
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 04:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749985374; x=1750590174; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zs6H3IS+Lq5Y1X+MWpQBHm1MMIu+O+EhuXu4o+xP7Yw=;
        b=VMTskEGpTmQRjbJJ8jFnnKUY0Zxd7XARXOt0qGyeg6OSBT+8m9x/isj5SbjHll3xVC
         PJbu/qDuuIMv/e9kpIIGWjiTIR1tSluh8q9BmJKYYaf0m+mvCW7Fc5YSyqIV1YCSb+dM
         xhltG4UM/u8HkBSHGfsFbQEM+3csdXSEOFZEqktbI5+fq+PTu8eTUze9QgcRnXXM43Lt
         QCAvlc8sxXw20lRnxmQwbpIWT5+UkHRC1VExNrStwNoOc7JU3v4h8x2R0jYUBVBPbv1q
         8dcdHE0bGl2aIEfKltE8I1djTLA9BIKjrVzyJi/egoSlJZYJlXf0oG35Opq/dsDC3BbC
         SIQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749985374; x=1750590174;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zs6H3IS+Lq5Y1X+MWpQBHm1MMIu+O+EhuXu4o+xP7Yw=;
        b=hPe0f2Y8mdKzY757814YM9mOGsThkXSRyIw0ubpAJmnScxNzei4dT8zCRPTJ/8f6kz
         4+Uoek/j0E78aNsDkqzWLwmu0PlUAxEIIVV67KnSyKuOIOTIYhiP/XL8WHWyZ5RgWAjb
         w78nuznPHyy/S/OdiDvpKLgdMQfk1mskwJeBA2ikrS4j/kc9HOQ6KhoMn8MuDRYeu0+v
         DbUGtyz1V8HpoJ1fWAGTassDv1YVeRq7uxEJ3UYDO2knU12czQ6/3V0InklZ3mrdfa7M
         Yu/Y3L8f8HsDsZF08lZ5Ggd8bEmQQsbVgJxj/9+rJmViQYuzFIoI3xObiFYwPhYiFU95
         ry1w==
X-Gm-Message-State: AOJu0Yzl56RDw19UmuPLE0X5Rv3CvLjXQcvihMI+u2Hv+1Wkj8uj7BeC
	GK6y1npvrTZ95oIVxr9GxUTy3Ibvc7dskNeDOowoNe/LOnWBlVNK+LWoW1nS84gHrNSBh+YF+dk
	Vjz5c
X-Gm-Gg: ASbGncutIxleR0tedLLfUzvZX7hduS6kpsVO+utrOrGx57dzPdrnsnjQA6sks+WF5MH
	ci4ZhdJOIjdu6mIM93FfFA0ghFzyhJgEnrLpDbLcJHMuqHacO15aZjNorSx7aeurAvroBls6XzM
	YAlQ5ztocyhzdpLoVt2D+jh4U9l5vAxYnik/iQ+iwqUhvJFhVTmaVi2tj2hK4KguA4SWse7rLOF
	n0gYKS7UKax1dtJyyumb16wmFagoo+CQ1amiOq8Y0xH6oOplKVOP2iK5/rPaYu/EYtIaDGe1B0V
	NfL2SQTPiyorsjJU4zFAkql692AUZuy3mlVvhqOfv0XXiv4Vy9bWT8qiXueMdseIwp3Lu9Mtp/V
	kmQ==
X-Google-Smtp-Source: AGHT+IFTh6ecw7/S9euxwjbxpzwNxDcRVXvuT8DuOOla0To4X5Xg4V2627vtpv9gDeBBBD5p+IYUaA==
X-Received: by 2002:a17:903:2ac3:b0:234:f19a:eead with SMTP id d9443c01a7336-2366b13ae96mr86561695ad.43.1749985373724;
        Sun, 15 Jun 2025 04:02:53 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d8a19b0sm42560075ad.61.2025.06.15.04.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 04:02:53 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 89CCC1004D5; Sun, 15 Jun 2025 01:02:52 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 15 Jun 2025 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 15 Jun 2025 01:02:52 -1000
Message-Id: <20250615110252.89CCC1004D5@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 11:03:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218645

Branch: master

New this week: 0 CVEs

Removed this week: 1 CVEs
CVE-2025-3198 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-3198 *

Full list:  Found 26 unpatched CVEs
CVE-2019-14899 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
CVE-2021-3714 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3714 *
CVE-2021-3864 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3864 *
CVE-2022-0400 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0400 *
CVE-2022-1247 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1247 *
CVE-2022-38096 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38096 *
CVE-2022-4543 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4543 *
CVE-2023-3397 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3397 *
CVE-2023-3640 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3640 *
CVE-2023-4010 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4010 *
CVE-2023-6238 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6238 *
CVE-2023-6240 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6240 *
CVE-2023-6535 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6535 *
CVE-2024-50613 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50613 *
CVE-2024-57995 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-57995 *
CVE-2024-58097 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58097 *
CVE-2024-8354 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-8354 *
CVE-2025-21751 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21751 *
CVE-2025-21833 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21833 *
CVE-2025-21949 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21949 *
CVE-2025-23137 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-23137 *
CVE-2025-29087 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-29087 *
CVE-2025-37803 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37803 *
CVE-2025-37860 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37860 *
CVE-2025-37925 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37925 *
CVE-2025-40014 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-40014 *

Summary of CVE counts by recipe:
  linux-yocto: 23
  libsndfile1: 1
  qemu:qemu-native:qemu-system-native: 1
  sqlite3:sqlite3-native: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

