Received: from co9ehsobe001.messaging.microsoft.com ([207.46.163.24]
	helo=co9outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <r63875@freescale.com>) id 1UZZhj-0003zI-KL
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 06:40:47 +0200
Received: from mail41-co9-R.bigfish.com (10.236.132.249) by
	CO9EHSOBE002.bigfish.com (10.236.130.65) with Microsoft SMTP Server id
	14.1.225.23; Tue, 7 May 2013 03:52:26 +0000
Received: from mail41-co9 (localhost [127.0.0.1])	by mail41-co9-R.bigfish.com
	(Postfix) with ESMTP id 801E9240813	for
	<openembedded-core@lists.openembedded.org>;
	Tue,  7 May 2013 03:52:26 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h1fc6h1ee6h1de0h1fdah1202h1e76h1d1ah1d2ahzz8275bhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h1354h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1d0ch1d2eh1d3fh1155h)
Received: from mail41-co9 (localhost.localdomain [127.0.0.1]) by mail41-co9
	(MessageSwitch) id 1367898743992886_25538;
	Tue,  7 May 2013 03:52:23 +0000 (UTC)
Received: from CO9EHSMHS020.bigfish.com (unknown [10.236.132.238])	by
	mail41-co9.bigfish.com (Postfix) with ESMTP id EF599D0001D	for
	<openembedded-core@lists.openembedded.org>;
	Tue,  7 May 2013 03:52:23 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO9EHSMHS020.bigfish.com
	(10.236.130.30) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 7 May 2013 03:52:21 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Tue, 7 May 2013 03:52:16 +0000
Received: from localhost.localdomain (tank.ap.freescale.net [10.193.20.104])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	r473qEjm002897; Mon, 6 May 2013 20:52:15 -0700
From: Olivia Yin <hong-hua.yin@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 7 May 2013 11:11:49 +0800
Message-ID: <1367896309-5638-1-git-send-email-hong-hua.yin@freescale.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: Olivia Yin <hong-hua.yin@freescale.com>
Subject: [PATCH] [oe][meta-oe][PATCH]yajl: pass the cmake variable LIB_SUFFIX to handle installation on 64-bit systems
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 May 2013 04:40:56 -0000
Content-Type: text/plain

WARNING: QA Issue: yajl: Files/directories were installed but not shipped
  /usr/lib
  /usr/lib/libyajl.so.2
  /usr/lib/libyajl.so
  /usr/lib/libyajl_s.a
  /usr/lib/libyajl.so.2.0.4
  /usr/lib/.debug
  /usr/lib/.debug/libyajl.so.2.0.4

NOTE: for 64-bit systems where lib64 is used you can pass the cmake
      variable LIB_SUFFIX to cause installation into the system's 'lib64'
      directory.

Signed-off-by: Olivia Yin <hong-hua.yin@freescale.com>
---
 meta-oe/recipes-devtools/yajl/yajl_2.0.4.bb |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta-oe/recipes-devtools/yajl/yajl_2.0.4.bb b/meta-oe/recipes-devtools/yajl/yajl_2.0.4.bb
index 7359520..9d67e2d 100644
--- a/meta-oe/recipes-devtools/yajl/yajl_2.0.4.bb
+++ b/meta-oe/recipes-devtools/yajl/yajl_2.0.4.bb
@@ -1,6 +1,7 @@
 DESCRIPTION = "Yet Another JSON Library - A Portable JSON parsing and serialization library in ANSI C"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=74f541bd9a2b6c8e5d0714bcdc327f32"
+PR = "r1"
 
 SRCREV = "fee1ebef9fa7dc0e9f5a23f37123b19b68c796ff"
 SRC_URI = "git://github.com/lloyd/yajl.git"
@@ -8,3 +9,5 @@ SRC_URI = "git://github.com/lloyd/yajl.git"
 S = "${WORKDIR}/git"
 
 inherit cmake lib_package
+
+EXTRA_OECMAKE = "-DLIB_SUFFIX=${@d.getVar('baselib', True).replace('lib', '')}"
-- 
1.7.0.4




