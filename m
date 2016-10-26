Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 557A76003C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 03:07:31 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u9Q37WGO014840
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 20:07:33 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.209) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Tue, 25 Oct 2016 20:07:32 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Oct 2016 11:07:40 +0800
Message-ID: <9edffac4c64f48743c45304c8a04ff8bd40c8e9d.1477449270.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1477449270.git.Qi.Chen@windriver.com>
References: <cover.1477449270.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] perl: remove plan9 related stuff in perl-ptest package
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
X-List-Received-Date: Wed, 26 Oct 2016 03:07:32 -0000
Content-Type: text/plain

Remove plan9 related stuff as they are useless for linux systems.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-devtools/perl/perl-ptest.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl/perl-ptest.inc b/meta/recipes-devtools/perl/perl-ptest.inc
index d136c5c..8dfc179 100644
--- a/meta/recipes-devtools/perl/perl-ptest.inc
+++ b/meta/recipes-devtools/perl/perl-ptest.inc
@@ -23,7 +23,8 @@ do_install_ptest () {
 	    ${D}${PTEST_PATH}/lib/Config.pm
 
 	ln -sf ${bindir}/perl ${D}${PTEST_PATH}/t/perl
-
+	# Remove plan9 related stuff
+	rm -rf ${D}${PTEST_PATH}/plan9 ${D}${PTEST_PATH}/README.plan9 ${D}${PTEST_PATH}/pod/perlplan9.pod
 }
 
 python populate_packages_prepend() {
-- 
1.9.1


