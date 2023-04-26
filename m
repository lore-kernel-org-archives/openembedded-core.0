Return-Path: <qiutt@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07908C7618E
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 06:31:37 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web11.1839.1682490688092515488
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Apr 2023 23:31:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=smmxlDAc;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: qiutt@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1682490686; i=@fujitsu.com;
	bh=0dYP/DXFqo6QBuRY0PRiQmcV6NuzMJxzqu3FVv0rPSI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=smmxlDAcX0Bf9eMItzNIqtATXfIb/HZ2Zn4vcTWjS3fhYs6swCwrPw07HIToHpuHh
	 eOoGbkjP/8poGQ1enqtVILtYBjGWowHrONIfTLnmsETQE8ejInagAlrKVx5GcQ+6Bw
	 f3xOPq/WwN+eCPMRVyPIc1WC5w/yCN/f4Xmc+DR9FqpoO0Gr/n5C+MP3JehcLXNYM3
	 4UZKxxzODXX/htmqXudqVV/vOFilsBu6bEDVHyEpAH3JfVSRLFZ8jfdGhCsWk56hso
	 GchBcDe9DU9MUg5qRxBNWm/P9JisGgGJDo8sIUbHrpYPHauRHqBG+PoX5DTBBskOe7
	 koH8SqUrd6otQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8OxWdf2qEe
  KQcdbS4s7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPpwyPsBTN4Kx7MWMfUwHiEu4uRi0NI4AGj
  xI6t21ghnCtMEj2d59khnL2MEvOPHmbqYuTkYBOQlFjevArMFhFwlrg26SSYzSygLNF9ZA4zi
  C0s4CGx9dp+NhCbRUBV4vSiWYwgNq+Ag0Tz3s1gcQkBOYkdq58wQcQFJU7OfMICMUdC4uCLF8
  wQNYoSUzuWskDYlRKtH35B2WoSV89tYp7AyD8LSfssJO0LGJlWMZoVpxaVpRbpGlroJRVlpme
  U5CZm5uglVukm6qWW6panFpfoGukllhfrpRYX6xVX5ibnpOjlpZZsYgSGY0qxyssdjP93/tU7
  xCjJwaQkyssV5pYixJeUn1KZkVicEV9UmpNafIhRhoNDSYLX/5BHipBgUWp6akVaZg4wNmDSE
  hw8SiK8/ZuB0rzFBYm5xZnpEKlTjIpS4rzyh4ESAiCJjNI8uDZYPF5ilJUS5mVkYGAQ4ilILc
  rNLEGVf8UozsGoJMx7HmQKT2ZeCdz0V0CLmYAWlzOALS5JREhJNTDxcIaeTlx/mDnuVk90n97
  HPU0xb1S3PL7TxvX7prSh5sqYnW2VsotbVsYcj0yxO64UlLJg3drmK9wPZdffiTSaHNj974eF
  kof7xEWPn2rsnPKlNnNfSdm6rpB4OVP/liWiB3befFOymk3qxiRHPn3fmSlXV+d6SRtLq/v9a
  m4J2ODjsS30QvPaTvce1QKRrczTZ4orrt52qXppbMLkpnubfp9y3Wz84p/4ZgalwCTPjk3yCa
  eaMmt+qR6QaDvR2MSl/6HHmOFSxwr+rRNb24znX1/L0Dz992+jZzw8x8o0rs2Yd+u3c/WtmVH
  WQeZPdtQWviue9MsxanJgX1y3/773KbLPHJ15nmgFzLt7iVOJpTgj0VCLuag4EQAorjX0QgMA
  AA==
X-Env-Sender: qiutt@fujitsu.com
X-Msg-Ref: server-4.tower-571.messagelabs.com!1682490685!263998!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28672 invoked from network); 26 Apr 2023 06:31:25 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-4.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 26 Apr 2023 06:31:25 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id A59A4165
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 07:31:25 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 99AAF164
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 07:31:25 +0100 (BST)
Received: from localhost.localdomain (10.167.219.96) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 26 Apr 2023 07:31:23 +0100
From: <qiutt@fujitsu.com>
To: <qiutt@fujitsu.com>, <openembedded-core@lists.openembedded.org>
CC: <fnstml-fujitsuten@fujitsu.com>
Subject: [PATCH V1] Fix error SRCDIR when using usrmerge DISTRO_FEATURES
Date: Wed, 26 Apr 2023 14:31:07 +0800
Message-ID: <1682490667-2414-1-git-send-email-qiutt@fujitsu.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.219.96]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 06:31:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180405

From: Qiu Tingting <qiutt@fujitsu.com>

When build e2fsprogs ptest with usrmerge DISTRO_FEATURES,
in test_script and test_one scripts, value of SRCDIR has problem.
  SRCDIR=/usr/usr/lib/e2fsprogs/ptest/test

ptest log
  # ptest-runner e2fsprogs
  START: ptest-runner
  2022-12-17T11:08
  BEGIN: /usr/lib/e2fsprogs/ptest
  ls: cannot access '/usr/usr/lib/e2fsprogs/ptest/test/[a-zA-Z]_*': No such file or directory
  ./test_script: line 54: /usr/usr/lib/e2fsprogs/ptest/test/test_post: No such file or directory
  DURATION: 0
  END: /usr/lib/e2fsprogs/ptest
  2022-12-17T11:08
  STOP: ptest-runner
  TOTAL: 1 FAIL: 0

Reason
  In Makefile.in, SRCDIR is set by prefix and libdir.
    @echo "SRCDIR=${prefix}${libdir}/e2fsprogs/ptest/test" >> test_one
    @echo "SRCDIR=${prefix}${libdir}/e2fsprogs/ptest/test" >> test_script
  prefix=/usr
  libdir=/usr/lib (when usrmerge is set)

solution
  After ptest compiling, check and modify SRCDIR in test_script and test_one.

Signed-off-by: Qiu Tingting <qiutt@fujitsu.com>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb
index 2620610903..3219817c08 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb
@@ -122,6 +122,8 @@ RDEPENDS:${PN}-ptest += "e2fsprogs-badblocks e2fsprogs-dumpe2fs e2fsprogs-e2fsck
 
 do_compile_ptest() {
 	oe_runmake -C ${B}/tests
+	sed -i 's/\/usr\/usr/\/usr/g' -i ${B}/tests/test_one
+	sed -i 's/\/usr\/usr/\/usr/g' -i ${B}/tests/test_script
 }
 
 do_install_ptest() {
-- 
2.25.1


