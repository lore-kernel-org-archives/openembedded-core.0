Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 825FE70F06
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Sep 2014 05:47:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s825lio2005422
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Sep 2014 22:47:45 -0700 (PDT)
Received: from localhost (128.224.162.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Mon, 1 Sep 2014 22:47:44 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 2 Sep 2014 13:47:42 +0800
Message-ID: <1409636862-23071-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [128.224.162.226]
Subject: [PATCH] scripts/create-recipe: minor fixes
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
X-List-Received-Date: Tue, 02 Sep 2014 05:47:54 -0000
Content-Type: text/plain

Fixed:
- Remove PR. We don't need the "PR = r0" in the bb file.
- Function length can't get the array's size correctly.
  Should use function scalar.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 scripts/create-recipe |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/scripts/create-recipe b/scripts/create-recipe
index b192990..e4bc4c3 100755
--- a/scripts/create-recipe
+++ b/scripts/create-recipe
@@ -1747,7 +1747,6 @@ sub write_bbfile
 	    print BBFILE "\"\n";
 	}
 
-	print BBFILE 'PR = "r0"' . "\n";
 	if ($python == 1) {
 	    print BBFILE "PV = \"$pversion\"\n\n";
 	}
@@ -1865,7 +1864,7 @@ foreach (@tgzfiles) {
 #
 
 my @sourcetars = <$orgdir/$outputdir/*\.tar\.bz2 $orgdir/$outputdir/*\.tar\.gz $orgdir/$outputdir/*\.zip>;
-if ( length @sourcetars == 0) {
+if (scalar(@sourcetars) == 0) {
 	print "Can NOT find source tarball. Exiting...\n";
 	exit (1);
 }
-- 
1.7.9.5


