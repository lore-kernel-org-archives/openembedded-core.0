Return-Path: <yanxk.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5AD2C61DA4
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 02:25:13 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web11.6605.1676427903631605506
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Feb 2023 18:25:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=V0htvaAg;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: yanxk.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676427901; i=@fujitsu.com;
	bh=guBsaGBBA/jt9njkElfYNwzRkFjBOtU39tijKH2rrh4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=V0htvaAgZN/a0a3SWKYmXua4iq735MS+zL8SRBrvnmHtnR/Jp0S016xfeLczeCgU4
	 NhJU/Y1ey0lyFW/18vhOenjD52PjwhhL3aqfUXLu/LqkG3m/PrBFaxTOIgZczJytrV
	 Hb8CxcX1BWZHcJhDJqZxG43kDLq5PIPG9mD/oLLzgLk5fg3Znz5/ShaQ9j9htzzid0
	 BDtWOlZJexeYoDLf/c7eMVv96G/S6JfECs5lhDp455poR+pdaIp8+eXmPHwJgy28z5
	 ObFSjkOULuN/xNjgwxYq50legarN8/ip9tXng5z3fPh47USgAt4daSYiFnqt6DQYLo
	 c5Ho97w05wS8g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDIsWRWlGSWpSXmKPExsViZ8ORqFvj9Cb
  Z4P9HS4s7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPXh2+MBdMUKva1X2NsYLwn3cXIxSEk8JhR
  4sz1j2xdjJxAznUmif/f2CAS+xglbpzvZQRJsAnISSx+PJW1i5GDQ0RAT+LqP1GQMLOAs8S8Z
  ++YQWxhAWOJi2f7WEBKWARUJZZ9NwYxeQXcJM6v8QGpkAAasmP1EyYQm1dAUOLkzCcsEFMkJA
  6+eMEMUaMkcefXZUYIu1Ki9cMvFghbTeLquU3MExj5ZyFpn4WkfQEj0ypG0+LUorLUIl0LvaS
  izPSMktzEzBy9xCrdRL3UUt3y1OISXUO9xPJivdTiYr3iytzknBS9vNSSTYzAIEwpZn2zg3Fb
  31+9Q4ySHExKorz/Gd4kC/El5adUZiQWZ8QXleakFh9ilOHgUJLg1XMEygkWpaanVqRl5gAjA
  iYtwcGjJMKrqQyU5i0uSMwtzkyHSJ1iNOa4u3DvXmaOj38u7mUWYsnLz0uVEud9BzJJAKQ0oz
  QPbhAsUi8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEua9Ygc0hSczrwRu3yugU5iATnnM9xL
  klJJEhJRUA9Oa5upi9sDLc/2rtO9xz2CqlVh7ZMuHMyH104XXb2TM4bz9/cLTqSLS2XNn2Z+8
  8PvyXwvtn5svLzA98LLwufeTiam99nbStRWZEydlz6le/Tm97qdBYL3mfMUFH/LlkvpO31lR4
  K56LHvhKReBkxFWvqLC/Px9ogpGa5haFOUCwtfyiNxOW7/kdOfzr9lMm1MPW669bXX//DHW7b
  dN1efZzHJ6/kG1mj91xv//itWhAf4qqm9mm/8KnLkkn48tPWuWu0f623ul+w+/mHLwz7pUzaz
  oCW4LGWasNp82sfXUtIrvKave8T2a93jhyu2vD1/emNAe+lFhv8QDs45Qi6+7WHSSNpXPPL0u
  as/y2pNaSizFGYmGWsxFxYkAiicxYk8DAAA=
X-Env-Sender: yanxk.fnst@fujitsu.com
X-Msg-Ref: server-20.tower-591.messagelabs.com!1676427900!706574!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19314 invoked from network); 15 Feb 2023 02:25:00 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-20.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Feb 2023 02:25:00 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 896E5100194
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 02:25:00 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 7BBF510018D
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 02:25:00 +0000 (GMT)
Received: from localhost.localdomain (10.167.218.229) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 15 Feb 2023 02:24:58 +0000
From: <yanxk.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: <fnstml-fujitsuten@fujitsu.com>, yanxk <yanxk.fnst@fujitsu.com>
Subject: [meta-oe][PATCH V2] tar: add ptest support
Date: Fri, 10 Feb 2023 02:01:26 +0800
Message-ID: <1675965686-14923-1-git-send-email-yanxk.fnst@fujitsu.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.218.229]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 02:25:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177180

From: yanxk <yanxk.fnst@fujitsu.com>

original test suites takes 5 minutes with KVM enabled.

autotest files would contain reference to TMPDIR, now
they are removed.

tar test would provide ptest output like:

PASS: compressor program failure
SKIP: remove-files with compression
PASS: remove-files with compression: grand-child

be aware tar tests contain some large compression and
decompression tests that require large device storage.

those cases would not work fine in default qemu image,
for the default storage is too small. Some errors:

listing sparse files bigger than 2^33 B        ./testsuite: line 1928: echo: write error: No space left on device

they are hard coded in the original test scripts, no
modifications have been made to that yet.

Signed-off-by: yanxk <yanxk.fnst@fujitsu.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-extended/tar/tar-1.34/run-ptest  | 10 ++++++
 meta/recipes-extended/tar/tar_1.34.bb         | 31 +++++++++++++++++--
 3 files changed, 40 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/tar/tar-1.34/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 0681b4b7a2..139fbc4a03 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -102,6 +102,7 @@ PTESTS_SLOW = "\
     python3-cryptography-ptest \
     python3-ptest \
     strace-ptest \
+    tar-ptest \
     tcl-ptest \
     util-linux-ptest \
     valgrind-ptest \
diff --git a/meta/recipes-extended/tar/tar-1.34/run-ptest b/meta/recipes-extended/tar/tar-1.34/run-ptest
new file mode 100644
index 0000000000..9ca27153d9
--- /dev/null
+++ b/meta/recipes-extended/tar/tar-1.34/run-ptest
@@ -0,0 +1,10 @@
+#!/bin/sh
+
+# Define tar test work dir
+WORKDIR=/usr/lib/tar/ptest/tests/
+
+# Run test
+cd ${WORKDIR}
+./atconfig ./atlocal ./testsuite
+
+./testsuite 2>&1 | grep -E '[0-9]{1,3}: ' | sed -e 's/^.....//' -e '/[ok]$/s/^/PASS: /;/FAILED (.*)/s/^/FAIL: /;/skipped (.*)/s/^/SKIP: /;/expected failure/ s/^/PASS: /;/UNEXPECTED PASS/s/^/FAIL: /' -e 's/ok$//g' -e 's/FAILED.*//g' -e 's/skipped.*//g' -e 's/expected failure.*//g' -e 's/UNEXPECTED PASS.*//g'
diff --git a/meta/recipes-extended/tar/tar_1.34.bb b/meta/recipes-extended/tar/tar_1.34.bb
index 7307cd57a2..ce319f6e7a 100644
--- a/meta/recipes-extended/tar/tar_1.34.bb
+++ b/meta/recipes-extended/tar/tar_1.34.bb
@@ -6,11 +6,13 @@ SECTION = "base"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI = "${GNU_MIRROR}/tar/tar-${PV}.tar.bz2"
+SRC_URI = "${GNU_MIRROR}/tar/tar-${PV}.tar.bz2 \
+           file://run-ptest \
+"
 
 SRC_URI[sha256sum] = "b44cc67f8a1f6b0250b7c860e952b37e8ed932a90bd9b1862a511079255646ff"
 
-inherit autotools gettext texinfo
+inherit autotools gettext texinfo ptest
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG:append:class-target = " ${@bb.utils.filter('DISTRO_FEATURES', 'acl', d)}"
@@ -42,6 +44,31 @@ do_install:append:class-target() {
     fi
 }
 
+# Tar testsuite would generate some small tests that are bash
+# scripts, so set ptest dependency to bash
+
+RDEPENDS:${PN}-ptest += "bash"
+
+do_compile_ptest() {
+    oe_runmake -C ${B}/gnu/ check
+    oe_runmake -C ${B}/lib/ check
+    oe_runmake -C ${B}/rmt/ check
+    oe_runmake -C ${B}/src/ check
+    oe_runmake -C ${B}/tests/ genfile checkseekhole ckmtime
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests/
+    sed -i "/abs_/d" ${B}/tests/atconfig
+    install --mode=755 ${B}/tests/atconfig ${D}${PTEST_PATH}/tests/
+    sed -i "s%${B}/../tar-1.34.build-aux:%%g" ${B}/tests/atlocal
+    install --mode=755 ${B}/tests/atlocal ${D}${PTEST_PATH}/tests/
+    install --mode=755 ${B}/tests/genfile ${D}${PTEST_PATH}/tests/
+    install --mode=755 ${B}/tests/checkseekhole ${D}${PTEST_PATH}/tests/
+    install --mode=755 ${B}/tests/ckmtime ${D}${PTEST_PATH}/tests/
+    install --mode=755 ${S}/tests/testsuite ${D}${PTEST_PATH}/tests/
+}
+
 PACKAGES =+ "${PN}-rmt"
 
 FILES:${PN}-rmt = "${sbindir}/rmt*"
-- 
2.25.1


