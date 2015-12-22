Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 31C386AC4B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 08:43:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tBM8hr8v023259
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 22 Dec 2015 00:43:53 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 22 Dec 2015 00:43:52 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <randy.macleod@windriver.com>, 
	<ross.burton@intel.com>, <jackie.huang@windriver.com>,
	<mark.hatle@windriver.com>, <liezhi.yang@windriver.com>
Date: Tue, 22 Dec 2015 16:43:19 +0800
Message-ID: <2c95c13720906c8788e7b42abfc6c711af8a87f9.1450772654.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1450772654.git.hongxu.jia@windriver.com>
References: <cover.1450772654.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] connman.inc: add missing RDEPENDS
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
X-List-Received-Date: Tue, 22 Dec 2015 08:43:53 -0000
Content-Type: text/plain

All of the connman-tools, connman-tests and connman-client
runtime depends connman.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-connectivity/connman/connman.inc | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index ba2ca24..76e61b4 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -142,11 +142,15 @@ python populate_packages_prepend() {
 PACKAGES =+ "${PN}-tools ${PN}-tests ${PN}-client"
 
 FILES_${PN}-tools = "${bindir}/wispr"
+RDEPENDS_${PN}-tools ="${PN}"
 
 FILES_${PN}-tests = "${bindir}/*-test ${libdir}/${BPN}/test/*"
-RDEPENDS_${PN}-tests = "python-dbus python-pygobject python-textutils python-subprocess python-fcntl python-netclient"
+RDEPENDS_${PN}-tests = "python-dbus python-pygobject python-textutils python-subprocess python-fcntl python-netclient \
+                        ${PN} \
+"
 
 FILES_${PN}-client = "${bindir}/connmanctl"
+RDEPENDS_${PN}-client ="${PN}"
 
 FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*.so.* \
             ${libdir}/connman/plugins \
-- 
1.9.1


