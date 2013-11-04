Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7EA836D68F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2013 14:38:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id rA4EcEpS012752
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Nov 2013 06:38:14 -0800 (PST)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Mon, 4 Nov 2013 06:38:14 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 5 Nov 2013 06:40:09 +0800
Message-ID: <a47fdd6d6de89c670d33ab33064e7623f9607fa8.1383604532.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1383604532.git.liezhi.yang@windriver.com>
References: <cover.1383604532.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] build-perf-test.sh: cleanup conf/sanity_info
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
X-List-Received-Date: Mon, 04 Nov 2013 14:38:12 -0000
Content-Type: text/plain

The conf/sanity_info is in TMPDIR now, it would be removed when TMPDIR
is removed.

[YOCTO #5442]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/contrib/build-perf-test.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/contrib/build-perf-test.sh b/scripts/contrib/build-perf-test.sh
index be3b648..ef9b826 100755
--- a/scripts/contrib/build-perf-test.sh
+++ b/scripts/contrib/build-perf-test.sh
@@ -227,7 +227,7 @@ bbnotime () {
 
 do_rmtmp() {
     log "   Removing tmp"
-    rm -rf bitbake.lock pseudodone conf/sanity_info cache tmp
+    rm -rf bitbake.lock pseudodone cache tmp
 }
 do_rmsstate () {
     log "   Removing sstate-cache"
-- 
1.8.3.1


