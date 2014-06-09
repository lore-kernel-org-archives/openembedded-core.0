Return-Path: <henning@itconsulting-heinold.de>
Received: from mail.familie-heinold.de (familie-heinold.de [85.214.48.103])
	by mail.openembedded.org (Postfix) with ESMTP id 528CC6B3AB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jun 2014 21:21:40 +0000 (UTC)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 9ABBA2232CBF;
	Mon,  9 Jun 2014 23:21:39 +0200 (CEST)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id BF9F12232CBE;
	Mon,  9 Jun 2014 23:21:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.2
Received: from localhost.localdomain (e178184227.adsl.alicedsl.de
	[85.178.184.227]) by mail.familie-heinold.de (Postfix) with ESMTPSA;
	Mon,  9 Jun 2014 23:21:38 +0200 (CEST)
From: Henning Heinold <henning@itconsulting-heinold.de>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jun 2014 23:21:28 +0200
Message-Id: <1402348889-26065-3-git-send-email-henning@itconsulting-heinold.de>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1402348889-26065-1-git-send-email-henning@itconsulting-heinold.de>
References: <1402348889-26065-1-git-send-email-henning@itconsulting-heinold.de>
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: [PATCH 2/3] perf: fix broken shell comparsion in do_install
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
X-List-Received-Date: Mon, 09 Jun 2014 21:21:47 -0000

The patch was sponsored by sysmocom

Signed-off-by: Henning Heinold <henning@itconsulting-heinold.de>
---
 meta/recipes-kernel/perf/perf.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index adbecfd..74686ca 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -112,7 +112,7 @@ do_install() {
 	unset CFLAGS
 	oe_runmake DESTDIR=${D} install
 	# we are checking for this make target to be compatible with older perf versions
-	if [ "${@perf_feature_enabled('perf-scripting', 1, 0, d)}" = "1" -a $(grep install-python_ext ${S}/tools/perf/Makefile) = "0"]; then
+	if [ "${@perf_feature_enabled('perf-scripting', 1, 0, d)}" = "1" -a $(grep install-python_ext ${S}/tools/perf/Makefile) = "0" ]; then
 		oe_runmake DESTDIR=${D} install-python_ext
 	fi
 }
-- 
1.9.1

