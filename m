Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1203C54E65
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 08:09:44 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.6053.1747814975285852992
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 May 2025 01:09:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7236463a26=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L5IJRq021592;
	Wed, 21 May 2025 01:09:29 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46rwfs90xf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 21 May 2025 01:09:29 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 21 May 2025 01:09:11 -0700
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 21 May 2025 01:09:09 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <Peter.Marko@siemens.com>, <mathieu.dubois-briand@bootlin.com>,
        <alex.kanavin@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/5] libxml2: upgrade 2.13.8 -> 2.14.3
Date: Wed, 21 May 2025 16:09:21 +0800
Message-ID: <20250521080925.815334-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: kXzviLf8e2W2WBMxu1Bk6F6wMCybUU_k
X-Proofpoint-ORIG-GUID: kXzviLf8e2W2WBMxu1Bk6F6wMCybUU_k
X-Authority-Analysis: v=2.4 cv=KJNaDEFo c=1 sm=1 tr=0 ts=682d8a39 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=dt9VzEwgFbYA:10 a=GHR8O2WEAAAA:20 a=aiIX5UjjAAAA:8 a=SSmOFEACAAAA:8 a=t7CeM3EgAAAA:8 a=7CQSdrXTAAAA:8
 a=LIGI6Mc-YZhTsUlX958A:9 a=m9p5bXcFLgAA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDA3OSBTYWx0ZWRfX9WuJc9kpRMpq AT8HGNRHdPhnqB8HnECeZmRuKFusL73n1XqZmB7MifJ3/olMPTo2huz+5ynFERrUwRZ1gjRF9r6 0xP477d3r9SNIvOoxeeSor7EeQt8fNml0XNKiutb047ZrHrYnC4yHQi3ugjsh4o/3BWIMg+Btvp
 7MhMFyAjR1i3c7jhllWBkCXSaR/M/mMLaQnTE60MQb7LYiG4+0zAT9aP1cbqfq6CFBbPcOVMH9U //ZVgHVQcZMrwJauhaVDuIN+tGDxvEQBgK5+7avPMblbmcmXhWYjYICpXxwLEwdc229jsHMAfDF 7ezg9etegZm215uUccLe0oh7twMMqLTslJ0jlcfwLD7u3wtidhGyBBrooLB3o22jdaDdUxr82iD
 Gx+qX2F0Sr5ZUTRhmTuHPGMhKiOg7miWJETjMIaklASIYYXZeHNOwvBt0PX/wqVYSkNoGHFZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_02,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 bulkscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505210079
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 08:09:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217000

- Rebase install-tests.patch
- Remove --enable-ipv6, due to upstream [build: Remove check for IPv6 ][2]

License-Update: Mention contributors in Copyright [1]

[1] https://gitlab.gnome.org/GNOME/libxml2/-/commit/4bd66d4549b2e8925a752e0daac3a189d2fec8f7
[2] https://gitlab.gnome.org/GNOME/libxml2/-/commit/dc6f55cf6e03ae63a40e3af9ad6879821558d6a7

Release notes: https://gitlab.gnome.org/GNOME/libxml2/-/releases/v2.14.3
Regressions

    reader: Fix reading compressed data
    parser: Make undeclared entities in XML content fatal
    save: Fix XML escape table
    save: Fix xmlSave with NULL encoding
    Revert "valid: Remove duplicate error messages when streaming"

Bug fixes

    save: Fix serialization of attribute defaults containing &lt;
    io: Fix linkage of __xml*BufferCreateFilename functions

Build systems

    cmake: Fix installation directories in libxml2-config.cmake
    meson: Install libxml2.py

Improvements

    parser: Make xmlCtxtGetValidCtxt depend on VALID_ENABLED
    html: Avoid HTML_PARSE_HTML5 clashing with XML_PARSE_NOENT

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../libxml/libxml2/install-tests.patch           | 16 +++++++++++-----
 .../{libxml2_2.13.8.bb => libxml2_2.14.3.bb}     |  6 ++----
 2 files changed, 13 insertions(+), 9 deletions(-)
 rename meta/recipes-core/libxml/{libxml2_2.13.8.bb => libxml2_2.14.3.bb} (93%)

diff --git a/meta/recipes-core/libxml/libxml2/install-tests.patch b/meta/recipes-core/libxml/libxml2/install-tests.patch
index 1c8c13ab5cc..2570efcdf50 100644
--- a/meta/recipes-core/libxml/libxml2/install-tests.patch
+++ b/meta/recipes-core/libxml/libxml2/install-tests.patch
@@ -1,21 +1,24 @@
-From 8c1054eacb430472068f21e4840749c384e8e866 Mon Sep 17 00:00:00 2001
+From 5bebe007b3efd1a723bd45bb9b3303f8645e9810 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
-Date: Mon, 5 Dec 2022 17:02:32 +0000
+Date: Mon, 19 May 2025 09:45:18 +0800
 Subject: [PATCH] add yocto-specific install-ptest target
 
 Add a target to install the test suite.
 
 Upstream-Status: Inappropriate
 Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+Rebase to v2.14.3
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
  Makefile.am | 10 ++++++++++
  1 file changed, 10 insertions(+)
 
 diff --git a/Makefile.am b/Makefile.am
-index 4cb9a5c..8adcd7e 100644
+index 6f98144..ecb3b54 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -27,6 +27,16 @@ check_PROGRAMS = \
+@@ -26,6 +26,16 @@ check_PROGRAMS = \
  	testparser \
  	testrecurse
  
@@ -29,6 +32,9 @@ index 4cb9a5c..8adcd7e 100644
 +	cp -r $(srcdir)/result $(DESTDIR)$(ptestdir)
 +	cp -r $(srcdir)/python/tests $(DESTDIR)$(ptestdir)/python
 +
- bin_PROGRAMS = xmllint xmlcatalog
+ bin_PROGRAMS = xmllint
  
  bin_SCRIPTS = xml2-config
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/libxml/libxml2_2.13.8.bb b/meta/recipes-core/libxml/libxml2_2.14.3.bb
similarity index 93%
rename from meta/recipes-core/libxml/libxml2_2.13.8.bb
rename to meta/recipes-core/libxml/libxml2_2.14.3.bb
index e82e0e8ec36..1cdc80cbb76 100644
--- a/meta/recipes-core/libxml/libxml2_2.13.8.bb
+++ b/meta/recipes-core/libxml/libxml2_2.14.3.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://gitlab.gnome.org/GNOME/libxml2"
 BUGTRACKER = "http://bugzilla.gnome.org/buglist.cgi?product=libxml2"
 SECTION = "libs"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://Copyright;md5=f437ed9058e8e5135e47c01e973376ba \
+LIC_FILES_CHKSUM = "file://Copyright;md5=5873615e8a9ecbf5c8857c4312ee05d6 \
                     file://dict.c;beginline=6;endline=15;md5=2b4b7b827d2d8b080372433c4c9c85b6 \
                     file://list.c;beginline=4;endline=13;md5=b9c25b021ccaf287e50060602d20f3a7 \
                     "
@@ -19,7 +19,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://install-tests.patch \
            "
 
-SRC_URI[archive.sha256sum] = "277294cb33119ab71b2bc81f2f445e9bc9435b893ad15bb2cd2b0e859a0ee84a"
+SRC_URI[archive.sha256sum] = "6de55cacc8c2bc758f2ef6f93c313cb30e4dd5d84ac5d3c7ccbd9344d8cc6833"
 SRC_URI[testtar.sha256sum] = "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273"
 
 # Disputed as a security issue, but fixed in d39f780
@@ -28,10 +28,8 @@ CVE_STATUS[CVE-2023-45322] = "disputed: issue requires memory allocation to fail
 BINCONFIG = "${bindir}/xml2-config"
 
 PACKAGECONFIG ??= "python \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
 "
 PACKAGECONFIG[python] = "--with-python=${PYTHON},--without-python,python3"
-PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 
 inherit autotools pkgconfig binconfig-disabled ptest
 
-- 
2.34.1


