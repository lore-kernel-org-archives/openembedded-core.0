Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 81BAF6A931
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Jun 2013 06:40:13 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r586eC1s025315
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Jun 2013 23:40:12 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.158) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Fri, 7 Jun 2013 23:40:10 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 8 Jun 2013 14:40:08 +0800
Message-ID: <f348bf04a5089012ba68e9734d07d86e2a4c8231.1370673504.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1370673504.git.rongqing.li@windriver.com>
References: <cover.1370673504.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] wpa-supplicant: Enable EXTRA_CFLAGS
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
X-List-Received-Date: Sat, 08 Jun 2013 06:40:13 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

Even if we define EXTRA_CFLAGS, but it never work, since the source codes
donot refer it, and CFLAGS is given a fixed value.

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc
index e5f7881..8d7233a 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc
@@ -40,6 +40,7 @@ export BINDIR = "${sbindir}"
 
 do_compile () {
 	unset CFLAGS CPPFLAGS CXXFLAGS
+	sed -e "s:CFLAGS\ =.*:& \$(EXTRA_CFLAGS):g" -i ${S}/src/lib.rules
 	oe_runmake -C wpa_supplicant
 }
 
-- 
1.7.10.4


