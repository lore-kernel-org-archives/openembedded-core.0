Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D72997E25D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2019 04:02:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x4S42jlo007868
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 May 2019 21:02:45 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Mon, 27 May 2019 21:02:44 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 28 May 2019 12:01:56 +0800
Message-ID: <1559016116-139663-6-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559016116-139663-1-git-send-email-changqing.li@windriver.com>
References: <1559016116-139663-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] lsbtest: add initscripts-functions as rconflict
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
X-List-Received-Date: Tue, 28 May 2019 04:02:44 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

lsbtest rdepend on lsb, lsb rdepend on lsbinitscripts,
lsbinitscripts rconflict with initscripts-functions. so also add
rconflict for this one.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-extended/lsb/lsbtest_1.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/lsb/lsbtest_1.0.bb b/meta/recipes-extended/lsb/lsbtest_1.0.bb
index a90c023..d1526ba 100644
--- a/meta/recipes-extended/lsb/lsbtest_1.0.bb
+++ b/meta/recipes-extended/lsb/lsbtest_1.0.bb
@@ -11,6 +11,7 @@ SRC_URI = "file://LSB_Test.sh \
 		   file://session \
 		   "
 RDEPENDS_${PN} = "lsb rpm"
+RCONFLICTS_${PN} = "initscripts-functions"
 
 S = "${WORKDIR}"
 
-- 
2.7.4


