Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 686AD6CEF3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 10:06:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9BA69Qi013625
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 03:06:09 -0700 (PDT)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Fri, 11 Oct 2013 03:06:08 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 11 Oct 2013 06:06:06 -0400
Message-ID: <cb2e86b8c5378e37cf8dd3166fff92e15341fd7e.1381485178.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1381485178.git.wenzong.fan@windriver.com>
References: <cover.1381485178.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] populate_sdk_rpm: add python to nativesdk INSTALL_PROVIDESNAME_RPM list
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
X-List-Received-Date: Fri, 11 Oct 2013 10:06:08 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Add '/usr/bin/python' to rpm ignore list for fixing native SDK packages
installation error:

* error: Can't install nativesdk-xxx-$ver@x86_64_nativesdk: \
    no package provides /usr/bin/python

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta/classes/populate_sdk_rpm.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_rpm.bbclass b/meta/classes/populate_sdk_rpm.bbclass
index b010593..1e64552 100644
--- a/meta/classes/populate_sdk_rpm.bbclass
+++ b/meta/classes/populate_sdk_rpm.bbclass
@@ -100,7 +100,7 @@ populate_sdk_rpm () {
 	export INSTALL_PACKAGES_RPM="${TOOLCHAIN_HOST_TASK}"
 	export INSTALL_PACKAGES_ATTEMPTONLY_RPM="$(echo '${TOOLCHAIN_HOST_TASK_ATTEMPTONLY}' | sed 's/ *$//g')"
 	export INSTALL_PACKAGES_LINGUAS_RPM=""
-	export INSTALL_PROVIDENAME_RPM="/bin/sh /bin/bash /usr/bin/env /usr/bin/perl pkgconfig libGL.so()(64bit) libGL.so"
+	export INSTALL_PROVIDENAME_RPM="/bin/sh /bin/bash /usr/bin/env /usr/bin/perl /usr/bin/python pkgconfig libGL.so()(64bit) libGL.so"
 	export INSTALL_TASK_RPM="populate_sdk_rpm-nativesdk"
 	export INSTALL_COMPLEMENTARY_RPM=""
 
-- 
1.7.9.5


