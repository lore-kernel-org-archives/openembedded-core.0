Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9CBA47E230
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2019 04:02:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x4S42hT5005978
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 May 2019 21:02:43 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Mon, 27 May 2019 21:02:43 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 28 May 2019 12:01:55 +0800
Message-ID: <1559016116-139663-5-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559016116-139663-1-git-send-email-changqing.li@windriver.com>
References: <1559016116-139663-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] lsb: add initscripts-functions as rconflict
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
X-List-Received-Date: Tue, 28 May 2019 04:02:42 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

lsb rdepend on lsbinitscripts, lsbinitscripts rconflict with initscripts-functions.
so also add rconflict for this one.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-extended/lsb/lsb_5.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/lsb/lsb_5.0.bb b/meta/recipes-extended/lsb/lsb_5.0.bb
index d1de334..6f352dc 100644
--- a/meta/recipes-extended/lsb/lsb_5.0.bb
+++ b/meta/recipes-extended/lsb/lsb_5.0.bb
@@ -10,6 +10,7 @@ RPROVIDES_${PN} += "${LSB_CORE}"
 
 # lsb_release needs getopt, lsbinitscripts
 RDEPENDS_${PN} += "${VIRTUAL-RUNTIME_getopt} lsbinitscripts"
+RCONFLICTS_${PN} = "initscripts-functions"
 
 LIC_FILES_CHKSUM = "file://README;md5=12da544b1a3a5a1795a21160b49471cf"
 
-- 
2.7.4


