Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.3])
 by mx.groups.io with SMTP id smtpd.web10.784.1626830044300616702
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jul 2021 18:14:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Ci5CdVDo;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.3, mailfrom: leimaohui@fujitsu.com)
Return-Path: <leimaohui@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1626830042; i=@fujitsu.com;
	bh=v920jOaFnJ6nVlKuLjLtX9RZfRDdOzsYtvSslIwA42w=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Ci5CdVDo34fvaUpMPUG4saNBLij9DuaCZT3r7iempoyRm8Ty97w+GLoJl289hjdh4
	 w9Cxz8dwll8Pa6wx0jbkon3duLa3UuDqAnqlC04h8ZtwfCCFAorysHkSFfpv8WNKBo
	 9OiGi2eHT4KpPOzWoG9Rpe8p4rtwFqMBUJDWc8fGXxKIxAWeJvw6qHyYpqX/TYr7Eq
	 y5u/nXxslFPMflzceebp20b9NUWS54lrCyx3t0Awxx4vAU72As5cBzar90TJtCOV9p
	 /mX3JkEe0Z73dhTMpZ3AtfzPo2rAspq6Qrp0PdLDmpeK1Ztd0fF9lndBp3OmJLSisd
	 oOSV/gzBXfN7Q==
Received: from [100.112.192.148] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-1.aws.symcld.net id D2/DF-07800-9D477F06; Wed, 21 Jul 2021 01:14:01 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMIsWRWlGSWpSXmKPExsViZ8MRqnuz5Hu
  Cwbs3ihZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aaJ3uZC2azVWzvnsncwDidtYuRk0NIYCuT
  xLLfZV2MXED2PkaJhStnsoEk2AQ0JHZPvczcxcjBISKgJ3H1nyhImFlATeLoy59gYWGBBInj/
  ypBwiwCqhJftl5hAwnzCrhIdPXagIQlBBQkpjx8zwxi8woISpyc+YQFYoqExMEXL5ghapQk3l
  7awwhhV0q0fvjFMoGRdxaSlllIWhYwMq1iNE8qykzPKMlNzMzRNTQw0DU0NNI1tDTSNTHRS6z
  STdRLLdUtTy0u0TXUSywv1iuuzE3OSdHLSy3ZxAgMq5SCAzo7GH+++qB3iFGSg0lJlPcs27cE
  Ib6k/JTKjMTijPii0pzU4kOMMhwcShK8KUXfE4QEi1LTUyvSMnOAIQ6TluDgURLhfZgHlOYtL
  kjMLc5Mh0idYlSUEuedAtInAJLIKM2Da4PF1SVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwr
  yri4Gm8GTmlcBNfwW0mAlo8a5pX0EWlyQipKQamKZ/d4gqiyh8zF6XqvnY3mbbwrxDyyJrV12
  K871yZUshS/h8Dze1XHahtQ/SvPgCmFN1Fa7oMspH+tc9TJ784dOWFL8t1ttS9NokVP6uZPb/
  Net8z8338Yy8F6c7XReUOH9qUu6RoDt53z7POvtX1+ME2+ENMtvU7IPmvUvg2iPkzTE/O7al2
  ujKpxJ5/6s6mxhP/nObepxf9Ovrt8Vsh8p1MpymqH1QXqhU2SjB6uB5c9+n2xxbMroUoxYKeP
  06wCzzmKlw8rc3j/U9K7bavN6XeKdq14IykdebXu3Q75yxTSkvTLht+kmzOTUan0NmH22fV7/
  m0q2YYpbFB5/nbiztztCTS/1/bfEa4dV1S5RYijMSDbWYi4oTAbH3zj8mAwAA
X-Env-Sender: leimaohui@fujitsu.com
X-Msg-Ref: server-2.tower-265.messagelabs.com!1626830041!46319!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15476 invoked from network); 21 Jul 2021 01:14:01 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-2.tower-265.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 21 Jul 2021 01:14:01 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16L1E13Y017876
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Jul 2021 02:14:01 +0100
Received: from localhost.localdomain (10.167.225.227) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Wed, 21 Jul 2021 02:13:58 +0100
From: "leimaohui" <leimaohui@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Lei Maohui <leimaohui@fujitsu.com>
Subject: [OE-core] [PATCH] archiver.bbclass: Fix patch error for recipes that inherit dos2unix.
Date: Wed, 21 Jul 2021 18:13:50 +0800
Message-ID: <1626862430-4520-1-git-send-email-leimaohui@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.227]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

do_unpack_and_patch error happens for these recipes inherit dos2unix.

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 meta/classes/archiver.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index a3962306b1..900268971c 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -483,6 +483,9 @@ python do_unpack_and_patch() {
         src_orig = '%s.orig' % src
         oe.path.copytree(src, src_orig)
 
+    if bb.data.inherits_class('dos2unix', d):
+        bb.build.exec_func('do_convert_crlf_to_lf', d)
+
     # Make sure gcc and kernel sources are patched only once
     if not (d.getVar('SRC_URI') == "" or is_work_shared(d)):
         bb.build.exec_func('do_patch', d)
-- 
2.25.1

