Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Tfw4z-0008IB-34
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 18:14:46 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qB4H0LQo026335
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Dec 2012 09:00:22 -0800 (PST)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Tue, 4 Dec 2012 09:00:21 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 4 Dec 2012 11:14:41 -0600
Message-ID: <545ed0dc93e943ea1630230810bedc4dd13d4959.1354641032.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1354641032.git.mark.hatle@windriver.com>
References: <cover.1354641032.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 09/22] rpm: Fix Upstream-Status fields
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
X-List-Received-Date: Tue, 04 Dec 2012 17:14:49 -0000
X-List-Received-Date: Tue, 04 Dec 2012 17:14:49 -0000
X-List-Received-Date: Tue, 04 Dec 2012 17:14:49 -0000
Content-Type: text/plain

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../rpm/rpm/python-rpm-rpmsense.patch              |    2 +-
 .../rpm/rpm/rpm-db_buffer_small.patch              |    2 +-
 .../rpm/rpm/rpm-stub-out-git_strerror.patch        |    2 +-
 .../rpm/rpm/rpm-uuid-include.patch                 |    2 ++
 4 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm/python-rpm-rpmsense.patch b/meta/recipes-devtools/rpm/rpm/python-rpm-rpmsense.patch
index 61f1e0c..0fae571 100644
--- a/meta/recipes-devtools/rpm/rpm/python-rpm-rpmsense.patch
+++ b/meta/recipes-devtools/rpm/rpm/python-rpm-rpmsense.patch
@@ -4,7 +4,7 @@ We want to see the RPMSENSE_SCRIPT values for use with SMART.  We also
 want to see the MISSINGOK value so we can avoid recommended packages causing
 failures.
 
-Upstream-status: Pending
+Upstream-Status: Pending
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-db_buffer_small.patch b/meta/recipes-devtools/rpm/rpm/rpm-db_buffer_small.patch
index d2ed853..59022f4 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-db_buffer_small.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-db_buffer_small.patch
@@ -14,7 +14,7 @@ If DBI debugging is enabled, additional diagnostics are printed, otherwise
 a basic retry and success message is added to show that the failure was
 resolved.
 
-Upstream-status: Inappropriate (workaround)
+Upstream-Status: Inappropriate (workaround)
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-stub-out-git_strerror.patch b/meta/recipes-devtools/rpm/rpm/rpm-stub-out-git_strerror.patch
index 2cfc163..cbeeb29 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-stub-out-git_strerror.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-stub-out-git_strerror.patch
@@ -2,7 +2,7 @@ git: fix: stud-out git_strerror when --without-git
 
 Patch taken from the cvs repo,http://www.mail-archive.com/rpm-cvs@rpm5.org/msg08907.html. 
 
-Upstream-status: Backport
+Upstream-Status: Backport
 
 Signed-off-by: Morgan Little <morgan.little@windriver.com>
 
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-uuid-include.patch b/meta/recipes-devtools/rpm/rpm/rpm-uuid-include.patch
index 0e45ed7..600e2c2 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-uuid-include.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-uuid-include.patch
@@ -7,6 +7,8 @@ use the one in ossp which solves the issue.
 The recipe already depends on ossp so ossp/uuid.h will be there when rpm-native
 is built.
 
+Upstream-Status: Pending
+
 Signed-off-by: Morgan Little <morgan.little@windriver.com>
 
 
-- 
1.7.3.4



