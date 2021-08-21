Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web10.10324.1629549737897295835
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Aug 2021 05:42:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ZpKErkH9;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: leimaohui@fujitsu.com)
Return-Path: <leimaohui@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1629549735; i=@fujitsu.com;
	bh=222/Wgbsi2QPNzhs9732Zr17PHBbVLBXbdcdbMUZ4rY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ZpKErkH9jL/REElyvmnwAOnvLgW66u8ss6jCIgyCwxoHG2hlSYSv5ASFCwQoiWZhH
	 8mZh9tDRA2wM55IBZzr5wbDiXJMUuIhqyevwZnMoRVaM5DIIwJuMVfogIHy/6O5BSz
	 arhedqAS5xt49ZbmXWmjy0c4zyam9rBYanM0ksBG0lBY0psTbwnO/BBFGvNw6NXqR7
	 +GnfSqLnkZuMeE5AQhEL+v5kdfDW2VuH8DmIrSFJFT674l8LR2WXcaVQp/DvK1DzxZ
	 Q2DIUkzVPfYi4/n70aLpDmB3EOD0Ab6wgWMTlX1F1alE9HVCSllKbtz4+r9Hou4qTW
	 DeuJ32fTfJv9g==
Received: from [100.112.192.137] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.symcld.net id F7/89-10123-6A4F0216; Sat, 21 Aug 2021 12:42:14 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPIsWRWlGSWpSXmKPExsViZ8MRorvsi0K
  iwYm9ShZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8b9luyCnZwVjzrdGhhXcXQxcnEICcxikng8
  ZwErhLOXUWLbo3PsXYycHGwCGhK7p15m7mLk4BAR0JO4+k8UJMwsoCZx9OVPZhBbWCBd4uqCf
  rByFgFViRvndrKA2LwCrhLnHnwGq5EQUJCY8vA9mM0p4CZxfuYjVhBbCKjmwqfVUPWCEidnPm
  GBmC8hcfDFC6heJYm3l/YwQtgVErNmtTFNYOSfhaRlFpKWBYxMqxgtkooy0zNKchMzc3QNDQx
  0DQ2NdA0tgdjITC+xSjdRL7VUtzy1uETXUC+xvFivuDI3OSdFLy+1ZBMjMBRTCg7U7WB88PqD
  3iFGSQ4mJVHeeCeFRCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvDnvgXKCRanpqRVpmTnAuIBJS
  3DwKInwGn0ASvMWFyTmFmemQ6ROMRpzTPg7bxEzx7ufixcxC7Hk5eelSonzZn8GKhUAKc0ozY
  MbBIvXS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEefd+AprCk5lXArfvFdApTECnCKnKgpx
  SkoiQkmpgOjar9tDONwYvRablsgoUL138ZfnGBUu9BAzcfiX/VtntcKlDNuOD1o7Zq9e5XOu1
  3vBX93XKMZtpEsW7xa58fpW9SldCvXV+3cVTE8oWVO2/5RMu47xAubzhnZMNy62HB7qnLjmXX
  jyTX+vgko/h3CumOsScvX7b2tp9v8bUyUyhQZ2rmWykjnDGyW+SX3Fun12WlKJR7MXV9p5+v/
  esDHnnPGX62SwFp41fOkOEUgzEX8t9u7rm1IYtL8++96hL7V/oun597Cn2S3pNwi5Vd3dlr9j
  Qc+H06ve/YtMf3LjbVeK2YrLZHR+2pD2RZVPCmVtOczntEut/udLB3tm96OuijRemTNh8TEur
  TIkv64kSS3FGoqEWc1FxIgA8EpSgUgMAAA==
X-Env-Sender: leimaohui@fujitsu.com
X-Msg-Ref: server-4.tower-265.messagelabs.com!1629549734!515674!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17211 invoked from network); 21 Aug 2021 12:42:14 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-4.tower-265.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 21 Aug 2021 12:42:14 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 17LCg8iD027504
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Sat, 21 Aug 2021 13:42:14 +0100
Received: from localhost.localdomain (10.167.225.227) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Sat, 21 Aug 2021 13:42:08 +0100
From: "leimaohui" <leimaohui@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Lei Maohui <leimaohui@fujitsu.com>
Subject: [OE-core] [PATCH 1/2] wordsize.h: Fix a miss, this file in arm and aarch64 should be the same.
Date: Sun, 22 Aug 2021 05:41:52 +0800
Message-ID: <1629582113-29292-2-git-send-email-leimaohui@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1629582113-29292-1-git-send-email-leimaohui@fujitsu.com>
References: <1629582113-29292-1-git-send-email-leimaohui@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.227]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 ...dsize.h-Unify-the-header-between-arm-and-aarch64.patch | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc/0029-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch b/meta/recipes-core/glibc/glibc/0029-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
index 8e011699ef..ece792509e 100644
--- a/meta/recipes-core/glibc/glibc/0029-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
+++ b/meta/recipes-core/glibc/glibc/0029-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
@@ -46,14 +46,6 @@ copy to sysdeps/arm/bits/wordsize.h
 index 91da566b74..34fcdef1f1 100644
 --- a/sysdeps/aarch64/bits/wordsize.h
 +++ b/sysdeps/arm/bits/wordsize.h
-@@ -1,6 +1,6 @@
- /* Determine the wordsize from the preprocessor defines.
- 
--   Copyright (C) 2016-2021 Free Software Foundation, Inc.
-+   Copyright (C) 2016-2020 Free Software Foundation, Inc.
-    This file is part of the GNU C Library.
- 
-    The GNU C Library is free software; you can redistribute it and/or
 @@ -17,12 +17,16 @@
     License along with the GNU C Library; if not, see
     <https://www.gnu.org/licenses/>.  */
-- 
2.25.1

