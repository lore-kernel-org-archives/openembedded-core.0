Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1ShMrn-0001GP-7k
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jun 2012 17:30:47 +0200
Received: by dalh21 with SMTP id h21so9610280dal.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2012 08:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=hX+DUK/NTUBp9hngagyk2tRmm6iuMZDB4oMek6IdfI4=;
	b=pPecoYAUAcr0R9w7EI0lVk9ANieJRQ9xTYWpPaDe2AXX1JEltnH3e5WIqYfs3jjeBy
	eoid2KHz1AvqnkZbT75pT+isvn5P6j9vFRmQD1N8wof1BFKuYMXVXYk8FXnAdWcoBDuV
	hI1hHjb3G83URNzUumZXzZ90jeaVbM+kwvQYpvQEa3H16mj/zu3Ou8KQRzcaF+9vGIpu
	6a7tU56g3U8AXLndsV60Yg3rLjfS4uF6u/P2HqP3ljdxXML3CtYDGITN6S1knYvPAZmQ
	8EGdIeRrWQD8cgsIZxM8XneJAOasZpfYQP1FEjIfqhMsAF6MdxmL+s2thXImDJMQDUHc
	hriw==
Received: by 10.68.228.136 with SMTP id si8mr77375207pbc.159.1340205601808;
	Wed, 20 Jun 2012 08:20:01 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id jw3sm32227422pbc.65.2012.06.20.08.20.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Jun 2012 08:20:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jun 2012 08:18:37 -0700
Message-Id: <a1ca534609d8ae49a16b9d28cc9e92db0894c4e4.1340205163.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <b69f84fe9eeede659eb8f390497ccb764e37f880.1340205163.git.raj.khem@gmail.com>
References: <b69f84fe9eeede659eb8f390497ccb764e37f880.1340205163.git.raj.khem@gmail.com>
In-Reply-To: <cover.1340205163.git.raj.khem@gmail.com>
References: <cover.1340205163.git.raj.khem@gmail.com>
Subject: [PATCH 2/5] gcc-4.7: Update to tip of gcc-4_7-branch since 4.7.1 has been out
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
X-List-Received-Date: Wed, 20 Jun 2012 15:30:47 -0000

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



