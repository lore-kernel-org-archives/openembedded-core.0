Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 988D2C87FCE
	for <webhook@archiver.kernel.org>; Sun, 27 Jul 2025 11:02:39 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.58194.1753614151951486868
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jul 2025 04:02:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=RdiM+24N;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-234b9dfb842so31008925ad.1
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Jul 2025 04:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753614151; x=1754218951; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BMJcMuDdDjs3pNArv/YIAet/QQaYj6YubnPeY3icwOw=;
        b=RdiM+24NGHmYM0ykbHZimhK00cpmlrh5cRGamLQhTId+x0hUpkH+lWeRAZhC3Im6DZ
         t1BC7cS9mRkq7Xvx8JL8X6siVqeoqAf204pu9ddVKVVyB2Z9Ub0aGeI5R+3SDGdJfNe1
         44S2dcoO/DN+44O7hQa1vs3rzmX5OFDAV7oThZqxyN1Tr60kd/yWVyyEsD3GRwgmL9m1
         W9UlFJOw7R+3OawVfJma1Jo/eXvEDFwSw9RANcxmfoAf8/dj144M7DX7yfNJq9Fq8MYF
         eGCWPKBMGYrH1He4GqkZrTfXxcR7XTcmM92TQEeZdlXkN6sxff9Ntls0w82meigWMkK9
         GQoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753614151; x=1754218951;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BMJcMuDdDjs3pNArv/YIAet/QQaYj6YubnPeY3icwOw=;
        b=tw6N63S5YzFyI/ypaeuXg8qAPNmzzynd+d/zIR4Ga+xbbK3Vi+9xnflEypMi0MSxdP
         NqVjdPSrZdP46VD3azEkWkR+Ha1t7MRhZDANqPxOmGpwCzP70dKruNTisqY5pyfatcRj
         pScbaDBQrsJzyWUfDIa17H5eHu/UIHx7WtT77NoTs0fMr9qNJ2oj1MqcRUjU9z67r9Rw
         jFUq+QD2RK3SMv3vzSiUPOojceFkgCjiSX6lZ24EqG/obu+5e44mlVcXBalGZaJRY/Zw
         Fxq9E03LIj7RVl1oR4uADqMCxP3RR3pO4S4DCbdxihuNimS9yZRjdShTPpzIx2aJgOTp
         nEVA==
X-Gm-Message-State: AOJu0YxZFP40QPsV3t/yzmLDyQmv4ze07fDSLW+gjABVT6+QK4mgmo6k
	AJ+XuT5Fjq0j5LBW9tkFCicaA0WSWcLd/9nV9+QXLEfqD9qoq3DHY5+7niaPh7vjvypSeKiAuDx
	xmi9U
X-Gm-Gg: ASbGnctfKJa/e6jSwqB2JGLoHEhqsWXQ8hLkS5cYmG6pQiTTyxNqiN0nWHpG23zky/j
	QJe6YQZ1/bL9rbcX2FhAl6huuJkcGM511HlG10glJLy/6M+hwnjqkto97S5NuhMbn5BoKr4Q4Xq
	5mM510Fbh1HzXlmTsOXh9zee8K0+pSeG4qc2iBoSPIm3+TBQcIH+suCsP67a/4RYbys0x4xw9K+
	1qXFswnmDZwrCqq4KWZwP/mRQ+GpeMytkRN+pdo/45yNoSxrSWy+baA+WG1kfvSmg8+soZabACl
	GzyBGwW400FwPU7iKWbGyistaIA8IN7byhD7E7ZFADMAYztXhb37fYqcpkeMYSOG8LzCOmBwMhG
	z0FjcqGQRoYGJE0wbDF/KE8L4+bU=
X-Google-Smtp-Source: AGHT+IFkmRTVE465g6tsn5A/xavZABK5obuxVnIOWFWRDMOucBoDJZtsd6PXI+IvqWOaamQuQF9+Hg==
X-Received: by 2002:a17:902:ef11:b0:23d:fa76:5c3b with SMTP id d9443c01a7336-23fb30acc71mr131931995ad.22.1753614148949;
        Sun, 27 Jul 2025 04:02:28 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24011bc0b00sm6665655ad.69.2025.07.27.04.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 04:02:28 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 1330A100464; Sun, 27 Jul 2025 01:02:28 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 27 Jul 2025 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 27 Jul 2025 01:02:28 -1000
Message-Id: <20250727110228.1330A100464@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Jul 2025 11:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220943

Branch: master

New this week: 0 CVEs

Removed this week: 0 CVEs

Full list:  Found 27 unpatched CVEs
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
CVE-2024-56738 (CVSS3: N/A): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-56738 *
CVE-2024-57995 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-57995 *
CVE-2024-58097 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58097 *
CVE-2024-8354 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-8354 *
CVE-2025-21751 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21751 *
CVE-2025-21833 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21833 *
CVE-2025-21949 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21949 *
CVE-2025-29087 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-29087 *
CVE-2025-37803 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37803 *
CVE-2025-37860 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37860 *
CVE-2025-37925 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37925 *
CVE-2025-40014 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-40014 *
CVE-2025-6965 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-6965 *

Summary of CVE counts by recipe:
  linux-yocto: 22
  sqlite3:sqlite3-native: 2
  grub:grub-efi:grub-native: 1
  libsndfile1: 1
  qemu:qemu-native:qemu-system-native: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

