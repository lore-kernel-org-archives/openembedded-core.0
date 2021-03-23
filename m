Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.2979.1616463779114360288
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Mar 2021 18:42:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=YNWUwLXT;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1616463777; i=@fujitsu.com;
	bh=Z+7un7a2hc1CweCY/lrpXD6XweNqgvZUoqXQz0jI8Tk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=YNWUwLXTAc1fuE36OFwqGX2V+m6M9nObsi7+dUrdNs37fliiBuojB3oa0U/ri0XZ1
	 YXn66QVkJEImTkCAEpDfZYNacnNx3BZSav/LtjHg5IctSExOINnhjdrYAu0dIqMBL0
	 175GkvdVJI3ZfglpnbNPgjFMK1rW5DGP1bVqFqzMDsBEKKgasWYXHPKX2xVIHevK6Y
	 Kg53fXcO9gx5YfCusWQfG5OSDoovhXeVNQeniTxLkyGjU9XjT0kSkIoIAMwXad7vYa
	 Tyxp3OA4Si8pDADm7EK5HlweLsyf75sQueh4/gshic1+mR6DUnVJacTGotaPQJiHY9
	 LSe1tj3EG+lyw==
Received: from [100.113.3.92] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.symcld.net id B5/03-07430-0A749506; Tue, 23 Mar 2021 01:42:56 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRWlGSWpSXmKPExsViZ8MRorvAPTL
  BYPFxJos7P9+xOzB6nNu4gjGAMYo1My8pvyKBNaPj9lSWgkfsFb3X97I0ML5h62Lk4hAS2Mwk
  cWjNVVYI5wSjxLbee+xdjJwcbAJqEtNv3QBKcHCICOhJXP0nChJmFlCXuLSuhQXEFhYwl9i9b
  D0jiM0ioCrx+mc/WCuvgJPE9Vm3mEBsCQEFiSkP3zOD2JwCzhL9p4+BxYWAak5sesMCUS8ocX
  LmExaI+RISB1+8YIboVZSYfbmZBcKukljTMY1tAiP/LCQts5C0LGBkWsVomVSUmZ5RkpuYmaN
  raGCga2horGusa2hpopdYpZuol1qqm5yaV1KUCJTVSywv1iuuzE3OSdHLSy3ZxAgMyJRC5kM7
  GJ+8/qB3iFGSg0lJlFdUPDJBiC8pP6UyI7E4I76oNCe1+BCjDAeHkgSvhRtQTrAoNT21Ii0zB
  xgdMGkJDh4lEV5lV6A0b3FBYm5xZjpE6hSjopQ4bwhInwBIIqM0D64NFpGXGGWlhHkZGRgYhH
  gKUotyM0tQ5V8xinMwKgnzPgMZz5OZVwI3/RXQYiagxR+Yw0AWlyQipKQamI4EHOvXO69T7Nu
  ty7BRJjR08fbQ06ETfTQ5zzc2HL8nuDBrbuLf6feu866a66do1yH29vLZxWUvrn+LZ3HL2+j5
  x7j4elzjZNfzXwr1XsVVm6m9txbkNavzkNlnobOTIyhx3tF4lohv1hMsTbf3Sdb0vdyyfDlDj
  Zi0etn78/q6Z3++LDmeEsH7VE21dPu22j/tu3x2B/OHLXZb4LegV/H4ytOL4npW7l3F51hjLP
  +VPeasyILEFYue7elnj6/cWFXf+8vT5Z2A/533pwOWOfe7B9qZFPr8FBfk+RsV+tPYVny7jpE
  UQ15dXZ143mKOe3O3Op/fecpui9bEXYWrr6mn73h/quj63+9sE1L3KrEUZyQaajEXFScCAAi8
  6HRDAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-25.tower-226.messagelabs.com!1616463775!105556!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8934 invoked from network); 23 Mar 2021 01:42:55 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-25.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 23 Mar 2021 01:42:55 -0000
Received: from r01ukexcasm214.r01.fujitsu.local (ex2k13_214.fs.fujitsu.com [10.182.185.116])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12N1gnu1014697
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Mar 2021 01:42:55 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 23 Mar 2021 01:42:50 +0000
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH 2/2] openssh: correct LICENSE
Date: Tue, 23 Mar 2021 09:42:39 +0800
Message-ID: <1616463759-38618-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1616463759-38618-1-git-send-email-wangmy@fujitsu.com>
References: <1616463759-38618-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116)
Content-Type: text/plain

From: Wang Mingyu <wangmy@cn.fujitsu.com>

update LICENSE to show that BSD-2-Clause, BSD-3-Clause and BSD-4-Clause are all present.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta/recipes-connectivity/openssh/openssh_8.5p1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_8.5p1.bb b/meta/recipes-connectivity/openssh/openssh_8.5p1.bb
index 61d9b95b9e..6a49cf71cc 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.5p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.5p1.bb
@@ -5,7 +5,7 @@ Ssh (Secure Shell) is a program for logging into a remote machine \
 and for executing commands on a remote machine."
 HOMEPAGE = "http://www.openssh.com/"
 SECTION = "console/network"
-LICENSE = "BSD & ISC & MIT"
+LICENSE = "BSD-2-Clause & BSD-3-Clause & BSD-4-Clause & BSD & ISC & MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=d9d2753bdef9f19466dc7bc959114b11"
 
 DEPENDS = "zlib openssl virtual/crypt"
-- 
2.25.1

