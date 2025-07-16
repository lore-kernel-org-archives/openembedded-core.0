Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A01DC83F22
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 11:19:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.19560.1752664763059132057
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 04:19:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=92925b2b8c=divya.chellam@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56G4rLP31321406
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 11:19:22 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47wdva1s8y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 11:19:21 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Wed, 16 Jul 2025 04:19:19 -0700
From: dchellam <divya.chellam@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][walnascar][PATCH 1/1] libxml2: fix CVE-2025-49795
Date: Wed, 16 Jul 2025 16:48:49 +0530
Message-ID: <20250716111849.3616226-1-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Authority-Analysis: v=2.4 cv=AbaxH2XG c=1 sm=1 tr=0 ts=68778aba cx=c_pps
 a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17
 a=HCiNrPZc1L8A:10 a=Wb1JkmetP80A:10 a=xNf9USuDAAAA:8 a=GHR8O2WEAAAA:20
 a=zICZd1jsAAAA:8 a=SSmOFEACAAAA:8 a=t7CeM3EgAAAA:8 a=nKQ6MZ_GAAAA:8
 a=7Qd1s2VcBQyiQtL0OnsA:9 a=m9p5bXcFLgAA:10 a=FdTzh2GWekK77mhwV6Dw:22
 a=Zd89DY3zedpxME-_zOom:22
X-Proofpoint-GUID: DcfPuUVcYJlDAMQxWl_14Uym7c76aLFl
X-Proofpoint-ORIG-GUID: DcfPuUVcYJlDAMQxWl_14Uym7c76aLFl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDAxNyBTYWx0ZWRfX5W3grYWif87c
 hEn/GVxPUh29sxIUmAbyuAP+OvY360i0UeonsEqxrkbKeLxkdzBWApxA/Rboo/j4/eeNedWHjT5
 WXHd5jmxD5SgUrTAEFvw/7RJRBQvmYeDVm4rbeVP+U0CQ3c5sm3+0toA0AOWXJRRsDvhdlQwZZ7
 clm4tWpzLfEBDH0b3feBKwzMwQjXK0LSgK9Xus3I7O7HLr+VncIE80+4l+PYBYBQk1Xe4oaXcvF
 tfpXmsEqiPRZ2VVl8YkMIL8bVvCEEZlxKBZ5i9fuje3MX35tJpxezOKRiSmVXhC77ygBSKOQco/
 fQhD44Fws5yAwIbSmtRS+lmp06BCgmLzwPEpeZSicMrWmC0T941eErwufrLEzGdjXvtl5daFICL
 JyGpm7hc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_01,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2507150017
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 11:19:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220446

From: Divya Chellam <divya.chellam@windriver.com>

A NULL pointer dereference vulnerability was found in libxml2 when
processing XPath XML expressions. This flaw allows an attacker to
craft a malicious XML input to libxml2, leading to a denial of service.

Pick commit from 2.13 branch

Reference:
https://security-tracker.debian.org/tracker/CVE-2025-49795

Upstream-patch:
https://gitlab.gnome.org/GNOME/libxml2/-/commit/62048278a4c5fdf14d287dfb400005c0a0caa69f

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
---
 .../libxml/libxml2/CVE-2025-49795.patch       | 75 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.13.8.bb    |  1 +
 2 files changed, 76 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2025-49795.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2025-49795.patch b/meta/recipes-core/libxml/libxml2/CVE-2025-49795.patch
new file mode 100644
index 0000000000..11f543cb9b
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2025-49795.patch
@@ -0,0 +1,75 @@
+From 62048278a4c5fdf14d287dfb400005c0a0caa69f Mon Sep 17 00:00:00 2001
+From: Michael Mann <mmann78@netscape.net>
+Date: Sat, 21 Jun 2025 12:11:30 -0400
+Subject: [PATCH] [CVE-2025-49795] schematron: Fix null pointer dereference
+ leading to DoS
+
+Fixes #932
+
+CVE: CVE-2025-49795
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/62048278a4c5fdf14d287dfb400005c0a0caa69f]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ result/schematron/zvon16_0.err | 3 +++
+ schematron.c                   | 5 +++++
+ test/schematron/zvon16.sct     | 7 +++++++
+ test/schematron/zvon16_0.xml   | 5 +++++
+ 4 files changed, 20 insertions(+)
+ create mode 100644 result/schematron/zvon16_0.err
+ create mode 100644 test/schematron/zvon16.sct
+ create mode 100644 test/schematron/zvon16_0.xml
+
+diff --git a/result/schematron/zvon16_0.err b/result/schematron/zvon16_0.err
+new file mode 100644
+index 0000000..3d05240
+--- /dev/null
++++ b/result/schematron/zvon16_0.err
+@@ -0,0 +1,3 @@
++XPath error : Unregistered function
++./test/schematron/zvon16_0.xml:2: element book: schematron error : /library/book line 2: Book 
++./test/schematron/zvon16_0.xml fails to validate
+diff --git a/schematron.c b/schematron.c
+index 426300c..6e2ceeb 100644
+--- a/schematron.c
++++ b/schematron.c
+@@ -1509,6 +1509,11 @@ xmlSchematronFormatReport(xmlSchematronValidCtxtPtr ctxt,
+             select = xmlGetNoNsProp(child, BAD_CAST "select");
+             comp = xmlXPathCtxtCompile(ctxt->xctxt, select);
+             eval = xmlXPathCompiledEval(comp, ctxt->xctxt);
++            if (eval == NULL) {
++                xmlXPathFreeCompExpr(comp);
++                xmlFree(select);
++                return ret;
++            }
+ 
+             switch (eval->type) {
+             case XPATH_NODESET: {
+diff --git a/test/schematron/zvon16.sct b/test/schematron/zvon16.sct
+new file mode 100644
+index 0000000..f03848a
+--- /dev/null
++++ b/test/schematron/zvon16.sct
+@@ -0,0 +1,7 @@
++<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron">
++	<sch:pattern id="TestPattern">
++		<sch:rule context="book">
++			<sch:report test="not(@available)">Book <sch:value-of select="falae()"/> test</sch:report>
++		</sch:rule>
++	</sch:pattern>
++</sch:schema>
+diff --git a/test/schematron/zvon16_0.xml b/test/schematron/zvon16_0.xml
+new file mode 100644
+index 0000000..551e2d6
+--- /dev/null
++++ b/test/schematron/zvon16_0.xml
+@@ -0,0 +1,5 @@
++<library>
++	<book title="Test Book" id="bk101">
++		<author>Test Author</author>
++	</book>
++</library>
+-- 
+2.40.0
+
diff --git a/meta/recipes-core/libxml/libxml2_2.13.8.bb b/meta/recipes-core/libxml/libxml2_2.13.8.bb
index 3d6ecf5458..fd042c311d 100644
--- a/meta/recipes-core/libxml/libxml2_2.13.8.bb
+++ b/meta/recipes-core/libxml/libxml2_2.13.8.bb
@@ -19,6 +19,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://install-tests.patch \
            file://CVE-2025-6021.patch \
            file://CVE-2025-49794_CVE-2025-49796.patch \
+           file://CVE-2025-49795.patch \
            "
 
 SRC_URI[archive.sha256sum] = "277294cb33119ab71b2bc81f2f445e9bc9435b893ad15bb2cd2b0e859a0ee84a"
-- 
2.40.0


