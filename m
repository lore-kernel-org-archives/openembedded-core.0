Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TCGHf-00066Y-TR
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Sep 2012 22:45:12 +0200
Received: by yenm14 with SMTP id m14so860745yen.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2012 13:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=xwdbi112LO8pHqWGzJW9eLFF5qrEA2HDrjstoLwQoO8=;
	b=exGSL0Lrc9fmv5iS1lmywZsEKHEP0A8pFp+1PNUaC4fkLWkaZsJz+/1CMlB5Iuks1N
	M9j+EiqxVwd/sPYeOqtbdTHkfOf8Ldof+o0MZX7QqY8XGK/N5FVhjzrBmFvCzK2Ztj5N
	Q63tTCQiqDKrhu/FNMPQtq85VQFaL4J1qsPDDs957MYuDSEWrm13iQzPoJNuj3feOdzB
	AxIQraedVsrAz4fSjORXtvLhmZB0o7VnivVOW/MdQPjkQyDkERDtoauecxdIrJo9IebC
	kHA6tOjPmKrstap9+fxOGYjtB4X1o8Jlzw3gSia/LRhLBPW+QdwIOlURp3yDKIIDkQ9+
	xizQ==
Received: by 10.236.201.195 with SMTP id b43mr707842yho.27.1347568357704;
	Thu, 13 Sep 2012 13:32:37 -0700 (PDT)
Received: from localhost.localdomain ([177.100.163.15])
	by mx.google.com with ESMTPS id l10sm22090271ang.12.2012.09.13.13.32.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Sep 2012 13:32:36 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Sep 2012 17:32:29 -0300
Message-Id: <1347568349-28024-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH] perf: Refactor code so it is easier to read
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Sep 2012 20:45:12 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-kernel/perf/perf_3.4.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf_3.4.bb b/meta/recipes-kernel/perf/perf_3.4.bb
index decc911..6e1c746 100644
--- a/meta/recipes-kernel/perf/perf_3.4.bb
+++ b/meta/recipes-kernel/perf/perf_3.4.bb
@@ -74,7 +74,7 @@ do_compile() {
 do_install() {
 	oe_runmake DESTDIR=${D} install
 	# we are checking for this make target to be compatible with older perf versions
-	if [ "${@perf_feature_enabled('perf-scripting', 1, 0, d)}" = "1" -a $(grep install-python_ext ${S}/tools/perf/Makefile) = "0"]; then
+	if [ "${@perf_feature_enabled('perf-scripting', 1, 0, d)}" = "1" ] && ! grep -q install-python_ext ${S}/tools/perf/Makefile  ]; then
 		oe_runmake DESTDIR=${D} install-python_ext
 	fi
 }
-- 
1.7.2.5



