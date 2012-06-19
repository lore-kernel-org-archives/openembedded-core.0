Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Sh0m1-0001bC-Vh
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jun 2012 17:55:22 +0200
Received: by pbbrq2 with SMTP id rq2so9371045pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2012 08:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=hX+DUK/NTUBp9hngagyk2tRmm6iuMZDB4oMek6IdfI4=;
	b=cjNBr0tOuJz1moeD3ycjjTviVEvSdDkiGPV3Sg7l2U4zmpMm59pBv/dTInAzUumOGO
	y2qWLaZ9sfQ9PFeX3WMRqySesZ+WyHd3646rjpU5ZyUYO6viwN3OsV0JFmAngyYQ/VDT
	VQXY+z7vxQYtCzHelIGXheOjTENwF8LvUXRVNPyLkUJQC4ZW9fCYdnnimy2TSq9fio2W
	AgS5osGX9tNvnRi6whHfyStAjJtqNBZYMwJo5n5f6H7E6THPyhwQbgdb6bhJ0ii+OQlj
	6DkEBQ+FfmfZD1vF9eGnpRIYxhhJnnnG6GeBSDaQ7EmZBO2w6TAQgQIfKqJo580PVpK8
	JHxQ==
Received: by 10.68.197.70 with SMTP id is6mr46868251pbc.64.1340120677791;
	Tue, 19 Jun 2012 08:44:37 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id kt1sm28280609pbc.32.2012.06.19.08.44.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 19 Jun 2012 08:44:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jun 2012 08:43:21 -0700
Message-Id: <1340120601-23917-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] gcc-4.7: Update to tip of gcc-4_7-branch since 4.7.1 has been out
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
X-List-Received-Date: Tue, 19 Jun 2012 15:55:22 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-4.7.inc |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc b/meta/recipes-devtools/gcc/gcc-4.7.inc
index 34a73b1..25a1088 100644
--- a/meta/recipes-devtools/gcc/gcc-4.7.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
@@ -3,12 +3,12 @@ require gcc-common.inc
 PR = "r2"
 
 # Third digit in PV should be incremented after a minor release
-# happens from this branch on gcc e.g. currently its 4.7.0
-# when 4.7.1 is releases and we bump SRCREV beyond the release
-# on branch then PV should be incremented to 4.7.1+svnr${SRCPV}
+# happens from this branch on gcc e.g. currently its 4.7.1
+# when 4.7.2 is releases and we bump SRCREV beyond the release
+# on branch then PV should be incremented to 4.7.2+svnr${SRCPV}
 # to reflect that change
 
-PV = "4.7.0+svnr${SRCPV}"
+PV = "4.7.1+svnr${SRCPV}"
 
 # BINV should be incremented after updating to a revision
 # after a minor gcc release (e.g. 4.7.1 or 4.7.2) has been made
@@ -16,9 +16,9 @@ PV = "4.7.0+svnr${SRCPV}"
 # 4.7.1 then the value below will have 2 which will mean 4.7.2
 # which will be next minor release and so on.
 
-BINV = "4.7.1"
+BINV = "4.7.2"
 
-SRCREV = "186651"
+SRCREV = "188658"
 BRANCH = "gcc-4_7-branch"
 FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/gcc-4.7' ], d)}"
 
-- 
1.7.5.4



