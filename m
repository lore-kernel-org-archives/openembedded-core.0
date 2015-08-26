Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D7D61734B8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 05:59:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t7Q5xmSW026365
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 22:59:48 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Tue, 25 Aug 2015 22:59:47 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Aug 2015 13:55:28 +0800
Message-ID: <1440568528-26012-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][v2] xmlto: xsltproc is required by both native and target
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Aug 2015 05:59:48 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

xsltproc is used to perform the XSL-T transformation by xmlto by default,
so it is required by both native and target, and target has the dependence
on libxslt-bin, so add libxslt to native RDEPENDS

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta/recipes-devtools/xmlto/xmlto_0.0.26.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/xmlto/xmlto_0.0.26.bb b/meta/recipes-devtools/xmlto/xmlto_0.0.26.bb
index a7a0183..688be74 100644
--- a/meta/recipes-devtools/xmlto/xmlto_0.0.26.bb
+++ b/meta/recipes-devtools/xmlto/xmlto_0.0.26.bb
@@ -24,6 +24,9 @@ RDEPENDS_${PN} = "docbook-xml-dtd4 \
 RDEPENDS_${PN}_append_class-target = " \
                   libxslt-bin \
 "
+RDEPENDS_${PN}_append_class-native = " \
+                  libxslt \
+"
 
 BBCLASSEXTEND = "native"
 
-- 
1.9.1


