Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 457A46DDF2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2013 12:47:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rATClvcR027911
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2013 04:47:57 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Fri, 29 Nov 2013 04:47:56 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 29 Nov 2013 20:48:12 +0800
Message-ID: <ead5e4dcba20bbb02c769d37b66a49ecbd8c3f0e.1385728901.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1385728901.git.Qi.Chen@windriver.com>
References: <cover.1385728901.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 04/18] hdparm: make wiper appear before hdparm in PACKAGES
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
X-List-Received-Date: Fri, 29 Nov 2013 12:47:57 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Make wiper appear before hdparm in PACKAGES so that wiper is packaged
correctly.

[YOCTO #5555]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/hdparm/hdparm_9.43.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/hdparm/hdparm_9.43.bb b/meta/recipes-extended/hdparm/hdparm_9.43.bb
index 592b8cb..2ba0c42 100644
--- a/meta/recipes-extended/hdparm/hdparm_9.43.bb
+++ b/meta/recipes-extended/hdparm/hdparm_9.43.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=910a8a42c962d238619c75fdb78bdb24 \
                     file://wiper/wiper.sh;beginline=7;endline=31;md5=b7bc642addc152ea307505bf1a296f09"
 
 
-PACKAGES += "wiper"
+PACKAGES =+ "wiper"
 
 FILES_wiper = "${bindir}/wiper.sh"
 
-- 
1.7.9.5


