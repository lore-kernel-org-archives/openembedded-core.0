Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.5])
 by mx.groups.io with SMTP id smtpd.web08.3542.1620958343284348172
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 May 2021 19:12:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=o/I1cREA;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.5, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1620958341; i=@fujitsu.com;
	bh=ij8tdWodbHE4AWsguFziwOtemUtx+bdz6R7OD//LHZc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=o/I1cREAdJE4SRJJ+AG4S3Ppxiv5+JRwVYUI+FDkuVn2wUo2DrkJ0GkVXPISgUgfT
	 mAx9TSC/ZyIG5TK/hyrsg827NUzygMfUCVzqo4MoD4nxLu8ILUZ+O4oErsbzbaGfKz
	 6zmEKZswIL1/q087XvoEoCEaoaEVAR5tANRm1XJV8kJRMVMndqx/ayp7+VzkP8BFk4
	 iCSO1mTP73eSrlQGFV0fm+NYnGphiL7J/1g48leIsTFIj380mbrBkJf481p/tCEk2T
	 YmKEWoshqxY0aBaAV44kHk+P2sJFUb6NfLRSkOqmMZK6qK780eQL3ymw7LAENTbH4P
	 HLsZIPHetOYPQ==
Received: from [100.112.192.143] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-west-1.aws.symcld.net id E8/35-34775-48CDD906; Fri, 14 May 2021 02:12:20 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupikeJIrShJLcpLzFFi42Kxs+GYqttyZ26
  CwaH/QhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bZqWuYC/6wVezs+c7awDibrYuRi0NIYBaT
  xN+/7VDObkaJpv53LF2MnBxsAroS5x6vZe9i5OAQEdCTuPpPFCQsLGAl8fzvVUYQm0VAVeL2m
  YesIDavgIfE77Uz2EFsCQEFiSkP3zNDxAUlTs58AjaSWUBC4uCLF8wgIyUEFCVmT5eHKK+QmD
  FjG9sERp5ZSDpmIelYwMi0itEiqSgzPaMkNzEzR9fQwEDX0NBI19DSSNfIwEQvsUo3US+1VLc
  8tbhE11AvsbxYr7gyNzknRS8vtWQTIzCIUgoOnNnBeOr1B71DjJIcTEqivCc9ZycI8SXlp1Rm
  JBZnxBeV5qQWH2KU4eBQkuD9fmtugpBgUWp6akVaZg4woGHSEhw8SiK8f0DSvMUFibnFmekQq
  VOMilLivMK3gRICIImM0jy4NlgUXWKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzHsVZDxPZl
  4J3PRXQIuZgBbfmD4LZHFJIkJKqoGJp2Kz6/l957d/ZHPfaPvs99vf98NjqzZJrvjwg/E0b+U
  9z88LMzSaKyoUzjpLr4qJT1h54uoO1qnRh7qOdH1fclPhofU3+QCx93nne15udnV++evXBE+m
  qBvx73iYjXR9p37TEZfK9+P/+E/X7uievzU5j2y6Yi7P5pKJlncJtilVWPq44sfsXa/f3p8tf
  9v46KWGqJ9B7yI0BPc4nrueI/phG4fupFyVxCsd2peLOOumeTZ7qjjdSEvW8olKM6yUWV+t+0
  D2uuffF0/Xp9XUsGgezbi98ULFjO1LKh0X7/18g39bwMf6Xc8UdlgUv7NxnC61t/+zsN/FyWs
  cXib49jE/udbTtN3U74V8pp6TEktxRqKhFnNRcSIABg5FRB0DAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-5.tower-271.messagelabs.com!1620958339!340539!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22282 invoked from network); 14 May 2021 02:12:20 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-5.tower-271.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 May 2021 02:12:20 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14E2CCBJ027412
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 14 May 2021 03:12:19 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 14 May 2021 03:12:10 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] rng-tools: upgrade 6.11 -> 6.12
Date: Fri, 14 May 2021 10:11:43 +0800
Message-ID: <1620958303-16272-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../rng-tools/{rng-tools_6.11.bb => rng-tools_6.12.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/rng-tools/{rng-tools_6.11.bb => rng-tools_6.12.bb} (97%)

diff --git a/meta/recipes-support/rng-tools/rng-tools_6.11.bb b/meta/recipes-support/rng-tools/rng-tools_6.12.bb
similarity index 97%
rename from meta/recipes-support/rng-tools/rng-tools_6.11.bb
rename to meta/recipes-support/rng-tools/rng-tools_6.12.bb
index 61a0cef2e0..9673700981 100644
--- a/meta/recipes-support/rng-tools/rng-tools_6.11.bb
+++ b/meta/recipes-support/rng-tools/rng-tools_6.12.bb
@@ -14,7 +14,7 @@ SRC_URI = "\
     file://default \
     file://rngd.service \
 "
-SRCREV = "2ea13473fd5bfea3c861dc0e23bd65e2afe8007b"
+SRCREV = "a2cd12bc253a014328b87137559fd4e1ab296d9b"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1

