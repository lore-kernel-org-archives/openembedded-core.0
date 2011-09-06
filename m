Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1R0yRj-0001j3-7V
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Sep 2011 18:24:23 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p86GJLPc000126
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Sep 2011 09:19:21 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 6 Sep 2011 09:19:20 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 6 Sep 2011 11:26:52 -0500
Message-ID: <db40dc74cfc5f4bcb8119a695054ac32dd24c8b3.1315326300.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1315326300.git.mark.hatle@windriver.com>
References: <cover.1315326300.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 1/1] prelink: Update to latest upstream version
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
X-List-Received-Date: Tue, 06 Sep 2011 16:24:23 -0000
Content-Type: text/plain

[YOCTO #1374] - Fixes underlying issue
[YOCTO #1331] - Detects bad GNU_HASH tables

Update to the latest upstream version.  This includes a number of
generic fixes, as well as a complete refresh of the prelink-rtld.

(Prelink-rtld is similar to the ld.so/ldd functionality on a normal
system.)

The new prelink-rtld update syncs to eglibc-2.13 and enables new
symbol resolution, include GNU_UNIQUE, that was causing problems on
x86_64 and potentially other architectures with C++.

An assert has been added to also detect a bad GNU_HASH situation
which was detected on some PPC64 systems.  The underlying problem is
within the toolchain, however prelink was making it worse leaving the
problem undetected.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-devtools/prelink/prelink_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/prelink/prelink_git.bb b/meta/recipes-devtools/prelink/prelink_git.bb
index bb95da7..1565ca6 100644
--- a/meta/recipes-devtools/prelink/prelink_git.bb
+++ b/meta/recipes-devtools/prelink/prelink_git.bb
@@ -8,9 +8,9 @@ and executables, so that far fewer relocations need to be resolved at \
 runtime and thus programs come up faster."
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
-SRCREV = "ac461e73b17253a4da25c5aafeac7193b553156c"
+SRCREV = "964f6eba613bf1c791a2a0b858cd044f05e2f151"
 PV = "1.0+git${SRCPV}"
-PR = "r5"
+PR = "r6"
 
 #
 # The cron script attempts to re-prelink the system daily -- on
-- 
1.7.3.4



