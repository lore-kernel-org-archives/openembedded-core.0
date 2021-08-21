Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web09.10411.1629549737523555139
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Aug 2021 05:42:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=WcJoLxdU;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81, mailfrom: leimaohui@fujitsu.com)
Return-Path: <leimaohui@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1629549735; i=@fujitsu.com;
	bh=rQALYbs1/LfEFwtAXc+1+7s3E0eIEovXHEg3Mhk3xr8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=WcJoLxdUoLDk0xy0v7kur3ijM2JSIJPnWt0wKSbsaDeI1hy03dl1RxwG5yZBbNs0I
	 BnI8VpZnSSn/Sik8dcMDdgfMHL8coYw2ifzPq6jCT3OT3tFfMMfdNxuBQtAPLpTU3A
	 s3muVz+CDl0VMXZxVAtj72meHF5ShGhtZ+CqogUNyT8WlQP9/O4dcofkQjK+7LUjbm
	 MiTbp8JDtSy971+O0Zk664Bcfh3NgPL/SxuKKMBpPtZ9kYC9gVYH7YpPGiZgy9bs/F
	 PGFbTGv4nXp0Ke0LvsTjssE0+4fuIB2rQJPdaIY7dM0DZKefxYSc+BV4hAjCC2hO8k
	 ZgVkEuaapXVRw==
Received: from [100.112.199.201] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-west-1.aws.symcld.net id 97/DD-02582-6A4F0216; Sat, 21 Aug 2021 12:42:14 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGIsWRWlGSWpSXmKPExsViZ8MRorvsi0K
  iwf8v8hZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bOcx/YCp4yV3Ru2s7YwDiBuYuRk0NIYBaT
  xL6uwC5GLiB7L6PEhedT2UASbAIaErunXgYq4uAQEdCTuPpPFCTMLKAmcfTlT7BeYQF/ieetT
  ewgNouAqsTR/7NZQGxeAVeJSR/WsYLYEgIKElMevmeGiAtKnJz5hAVijoTEwRcvmCFqlCTeXt
  rDCGFXSMya1cY0gZF3FpKWWUhaFjAyrWK0SCrKTM8oyU3MzNE1NDDQNTQ00jW0NNM1MjTRS6z
  STdJLLdUtTy0u0TXUSywv1iuuzE3OSdHLSy3ZxAgMrpSCI9d2MB54/UHvEKMkB5OSKG+8k0Ki
  EF9SfkplRmJxRnxRaU5q8SFGGQ4OJQnenPdAOcGi1PTUirTMHGCgw6QlOHiURHiNPgCleYsLE
  nOLM9MhUqcYFaXEebM/AyUEQBIZpXlwbbDousQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmH
  fvJ6ApPJl5JXDTXwEtZgJaLKQqC7K4JBEhJdXAtK333jkbs+s/fQXus980PJCaeJUxZvHR6OZ
  7OZv3XgxR4Ve5PafcI7I3re1ib0CMpy4z55+5wlOfvr/y6V0Fw6wjKye09m1Z/zOeabLb/gdT
  Tz6P9ij00j2e2W+j7KNl1VgjlvZpgtgaVolDpSt2W7Uu2KTAymkSnLM1pGTN/FVzbKevXXfh4
  3O3SIG56tOWZJo+D5mjxXhzL0uTq3rBFZM6NYENp/ZsW3bXhDVGfHtZ01aNO+ZrZBgOCAqsvv
  h47dOAR4ebzhXtUyr74xEhrNnyzsns4m2Wz5apHS3X1nlyKqT3Lto1fbNs6y+988KLttwyPs3
  ncazafOpZ0eP3xY0lfS7s3fbxsJTx97q5nkosxRmJhlrMRcWJAJlgVlApAwAA
X-Env-Sender: leimaohui@fujitsu.com
X-Msg-Ref: server-23.tower-285.messagelabs.com!1629549734!60959!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26928 invoked from network); 21 Aug 2021 12:42:14 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-23.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 21 Aug 2021 12:42:14 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 17LCg8iC027504
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Sat, 21 Aug 2021 13:42:14 +0100
Received: from localhost.localdomain (10.167.225.227) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Sat, 21 Aug 2021 13:42:06 +0100
From: "leimaohui" <leimaohui@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Lei Maohui <leimaohui@fujitsu.com>
Subject: [OE-core] [PATCH 0/2] glibc: Fix conflict errors when enable multilib.
Date: Sun, 22 Aug 2021 05:41:51 +0800
Message-ID: <1629582113-29292-1-git-send-email-leimaohui@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.227]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

- Fix a miss in 0029-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch.
- Added new file bits/pthread_stack_min.h to oe_multilib_header.

Lei Maohui (2):
  wordsize.h: Fix a miss, this file in arm and aarch64 should be the
    same.
  Fix conflict error when enable multilib.

 meta/recipes-core/glibc/glibc-package.inc                 | 2 +-
 ...dsize.h-Unify-the-header-between-arm-and-aarch64.patch | 8 --------
 2 files changed, 1 insertion(+), 9 deletions(-)

-- 
2.25.1

