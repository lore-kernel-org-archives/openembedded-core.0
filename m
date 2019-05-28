Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5415E7E26A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2019 04:02:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x4S42W7Z024713
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 May 2019 21:02:42 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Mon, 27 May 2019 21:02:21 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 28 May 2019 12:01:54 +0800
Message-ID: <1559016116-139663-4-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559016116-139663-1-git-send-email-changqing.li@windriver.com>
References: <1559016116-139663-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] bootchart2: add initscripts-functions as rconflict
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
X-List-Received-Date: Tue, 28 May 2019 04:02:51 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

bootchart2 rdepend on lsb, lsb rdepend on lsbinitscripts,
lsbinitscripts rconflict with initscripts-functions. so also add
rconflict for this one.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb b/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb
index 396d0ec..36092e6 100644
--- a/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb
+++ b/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb
@@ -143,6 +143,7 @@ RDEPENDS_pybootchartgui = "python3-pycairo python3-compression python3-image pyt
 RDEPENDS_${PN}_class-target += "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'sysvinit-pidof', 'procps', d)}"
 RDEPENDS_${PN}_class-target += "lsb"
 DEPENDS_append_class-native = " python3-pycairo-native"
+RCONFLICTS_${PN}_class-target = "initscripts-functions"
 
 PACKAGES =+ "bootchartd-stop-initscript"
 FILES_bootchartd-stop-initscript += "${sysconfdir}/init.d ${sysconfdir}/rc*.d"
-- 
2.7.4


