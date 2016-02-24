Return-Path: <Tudor.Florea@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id EFB9377368
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 03:40:18 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.266.1;
	Wed, 24 Feb 2016 04:40:14 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4200)	id 46F5E28BA26;
	Wed, 24 Feb 2016 04:40:14 +0100 (CET)
From: Tudor Florea <tudor.florea@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 24 Feb 2016 04:40:08 +0100
Message-ID: <1456285208-24670-3-git-send-email-tudor.florea@enea.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1456285208-24670-1-git-send-email-tudor.florea@enea.com>
References: <1456285208-24670-1-git-send-email-tudor.florea@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: tudor.florea@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH 3/3] core-tools-profile: add lttng tools for aarch64
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
X-List-Received-Date: Wed, 24 Feb 2016 03:40:19 -0000
Content-Type: text/plain

Signed-off-by: Tudor Florea <tudor.florea@enea.com>
---
 meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index 59d930b..92db8b2 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -46,16 +46,12 @@ SYSTEMTAP_aarch64 = ""
 
 LTTNGUST = "lttng-ust"
 LTTNGUST_libc-uclibc = ""
-LTTNGUST_aarch64 = ""
 
 LTTNGTOOLS = "lttng-tools"
-LTTNGTOOLS_aarch64 = ""
 
 LTTNGMODULES = "lttng-modules"
-LTTNGMODULES_aarch64 = ""
 
 BABELTRACE = "babeltrace"
-BABELTRACE_aarch64 = ""
 
 # valgrind does not work on mips
 
-- 
1.9.1


