Return-Path: <rpjday@crashcourse.ca>
Received: from smtp485.redcondor.net (smtp485.redcondor.net [208.80.204.85])
	by mail.openembedded.org (Postfix) with ESMTP id 67D6365D57
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Aug 2014 16:10:18 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp485.redcondor.net ({3be039ea-4351-44b0-a8af-642c38b25916})
	via TCP (outbound) with ESMTPS id 20140806161018173
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Aug 2014 16:10:18 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [99.240.204.5] (port=55885 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1XF3n2-0003cq-KJ for openembedded-core@lists.openembedded.org;
	Wed, 06 Aug 2014 12:10:12 -0400
Date: Wed, 6 Aug 2014 12:10:08 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.11.1408061208030.11907@localhost>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: [PATCH] Remove remnants of deleted "do_package_write" task.
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
X-List-Received-Date: Wed, 06 Aug 2014 16:10:20 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


As the do_package_write() task is listed as deleted, remove the few
remaining references.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  i'm not sure this is a valid patch, but since the ref manual insists
this task has been removed, it *seems* reasonable, but i'll let
someone else make that decision.

diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index eb36de0..7cf4476 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -33,7 +33,6 @@ do_listtasks[doc] = "Lists all defined tasks for a target"
 do_menuconfig[doc] = "Runs 'make menuconfig' for the kernel"
 do_package[doc] = "Analyzes the content of the holding area and splits it into subsets based on available packages and files"
 do_package_index[doc] = "Creates or updates the index in the Package Feed area"
-do_package_write[doc] = "Creates the actual packages and places them in the Package Feed area"
 do_package_write_deb[doc] = "Creates the actual DEB packages and places them in the Package Feed area"
 do_package_write_ipk[doc] = "Creates the actual IPK packages and places them in the Package Feed area"
 do_package_write_rpm[doc] = "Creates the actual RPM packages and places them in the Package Feed area"
diff --git a/meta/recipes-core/meta/meta-ide-support.bb b/meta/recipes-core/meta/meta-ide-support.bb
index 03cad6e..2f92912 100644
--- a/meta/recipes-core/meta/meta-ide-support.bb
+++ b/meta/recipes-core/meta/meta-ide-support.bb
@@ -14,5 +14,4 @@ do_populate_ide_support () {
 }

 do_populate_ide_support[nostamp] = "1"
-do_populate_ide_support[recrdeptask] = "do_package_write"
 addtask populate_ide_support before do_build after do_install
diff --git a/meta/recipes-core/meta/package-index.bb b/meta/recipes-core/meta/package-index.bb
index 27b6d8e..3c46b49 100644
--- a/meta/recipes-core/meta/package-index.bb
+++ b/meta/recipes-core/meta/package-index.bb
@@ -12,7 +12,6 @@ do_compile[noexec] = "1"
 do_install[noexec] = "1"
 do_package[noexec] = "1"
 do_packagedata[noexec] = "1"
-do_package_write[noexec] = "1"
 do_package_write_ipk[noexec] = "1"
 do_package_write_rpm[noexec] = "1"
 do_package_write_deb[noexec] = "1"
diff --git a/meta/recipes-devtools/installer/adt-installer_1.0.bb b/meta/recipes-devtools/installer/adt-installer_1.0.bb
index 6a63e79..a90a2b4 100644
--- a/meta/recipes-devtools/installer/adt-installer_1.0.bb
+++ b/meta/recipes-devtools/installer/adt-installer_1.0.bb
@@ -86,7 +86,6 @@ do_configure[noexec] = "1"
 do_compile[noexec] = "1"
 do_package[noexec] = "1"
 do_packagedata[noexec] = "1"
-do_package_write[noexec] = "1"
 do_package_write_ipk[noexec] = "1"
 do_package_write_rpm[noexec] = "1"
 do_package_write_deb[noexec] = "1"

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


