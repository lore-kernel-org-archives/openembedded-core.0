Return-Path: <bradleyb@fuzziesquirrel.com>
X-Greylist: delayed 440 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 08 Nov 2016 20:53:19 UTC
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
	[173.167.31.197])
	by mail.openembedded.org (Postfix) with ESMTP id 71A946014F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2016 20:53:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@bajor.fuzziesquirrel.com
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Nov 2016 15:45:50 -0500
Message-Id: <1478637950-24714-1-git-send-email-bradleyb@fuzziesquirrel.com>
Subject: [PATCH] libyaml: Enable nativesdk bake
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
X-List-Received-Date: Tue, 08 Nov 2016 20:53:20 -0000

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 meta/recipes-support/libyaml/libyaml_0.1.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libyaml/libyaml_0.1.7.bb b/meta/recipes-support/libyaml/libyaml_0.1.7.bb
index 5c422ef..b167f03 100644
--- a/meta/recipes-support/libyaml/libyaml_0.1.7.bb
+++ b/meta/recipes-support/libyaml/libyaml_0.1.7.bb
@@ -17,4 +17,4 @@ S = "${WORKDIR}/yaml-${PV}"
 
 inherit autotools
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
1.8.3.1

