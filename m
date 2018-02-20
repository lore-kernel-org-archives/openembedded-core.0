Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id CCF92785AF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 22:17:44 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w1KMHgKZ008677
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 20 Feb 2018 22:17:43 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1eoGEI-0004dW-Lq; Tue, 20 Feb 2018 22:17:42 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Feb 2018 22:17:39 +0000
Message-Id: <1519165060-17784-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Subject: [PATCH] scripts/contrib/build-perf-test: Fix fetchall reference to use runall
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
X-List-Received-Date: Tue, 20 Feb 2018 22:17:45 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/contrib/build-perf-test.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/contrib/build-perf-test.sh b/scripts/contrib/build-perf-test.sh
index 7d99228..9a091ed 100755
--- a/scripts/contrib/build-perf-test.sh
+++ b/scripts/contrib/build-perf-test.sh
@@ -283,7 +283,7 @@ write_results() {
 
 test1_p1 () {
     log "Running Test 1, part 1/3: Measure wall clock of bitbake $IMAGE and size of tmp/ dir"
-    bbnotime $IMAGE -c fetchall
+    bbnotime $IMAGE --runall=fetch
     do_rmtmp
     do_rmsstate
     do_sync
-- 
2.7.4


