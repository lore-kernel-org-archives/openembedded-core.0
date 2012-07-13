Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Spdnt-0005PF-4w
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jul 2012 13:12:57 +0200
Received: from mail-wg0-f42.google.com ([74.125.82.42])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 13 Jul 2012 04:01:41 -0700
Received: by wgbfm10 with SMTP id fm10so462997wgb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jul 2012 04:01:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=YRWujkhFPfQHRPZdD/TZgfEhccCbdlxvPk8NHp+TkqM=;
	b=mCpkzPnoyBpHwmunCeafCf2aOt7m9/9aQZbA+Z4QNbrOpQWvWHf+7RuTXEEEITkPNh
	tmk26BaB+5D5i32Z+VuPUOuwACxsK7gRiohNesj5Og+DJQranw5oDDWPxOIRs7JQC8Sr
	ovGBBVYiNrNqkzCeJYUuV0JOx/PFNFo00lMmeFVd+dCxnVJoc1gcZDv+8nrwmHhuGGPh
	w3USHGeh5/30BIh8uKy4fmoM+OoL4Nx/BJBy5zkQAS+FQLZXpIqWyMlxmZFW7NKdRhXh
	mrRl85scXPf2cjbU2//DOU/qCxq+mTqjRn8mW7OIfmWFVS8t7ncA11ExSf4o3SV7D/0G
	girg==
Received: by 10.180.106.137 with SMTP id gu9mr1682740wib.20.1342177299335;
	Fri, 13 Jul 2012 04:01:39 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id w7sm2795746wiz.0.2012.07.13.04.01.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jul 2012 04:01:38 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Jul 2012 12:01:27 +0100
Message-Id: <1342177287-4348-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQnNkhCM/TDBoUgZmSU5NLPMOzYA2+g9oBsMCKLg1vlov1MQerd11FhIrrZSuU4ZMaJ7BRjY
Subject: [PATCH] base.bbclass: add GNUmakefile to the list of possible makefile names
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Jul 2012 11:12:57 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/base.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 08065c6..f691799 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -280,7 +280,7 @@ base_do_configure() {
 addtask compile after do_configure
 do_compile[dirs] = "${S} ${B}"
 base_do_compile() {
-	if [ -e Makefile -o -e makefile ]; then
+	if [ -e Makefile -o -e makefile -o -e GNUmakefile ]; then
 		oe_runmake || die "make failed"
 	else
 		bbnote "nothing to compile"
-- 
1.7.10



