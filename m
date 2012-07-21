Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SsawG-0001GY-UH
	for openembedded-core@lists.openembedded.org;
	Sat, 21 Jul 2012 16:45:49 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:52354 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1SsalF-0003dU-JN; Sat, 21 Jul 2012 10:34:25 -0400
Date: Sat, 21 Jul 2012 10:34:14 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1207211030490.13090@oneiric>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
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
Subject: kern-tools: Remove superfluous references to "defconfig" from the "createme" script.
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
X-List-Received-Date: Sat, 21 Jul 2012 14:45:49 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


Since the only current call to "createme" from do_patch() doesn't pass
a defconfig argument, remove the apparently superfluous references to
defconfig from createme, but leave the check_defconfig() function in
just in case it ever becomes useful.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  not sure if this is the right list for kern-tools patches ... should
these things go to the new kernel mailing list?


diff --git a/tools/createme b/tools/createme
index 78e98ac..219e92d 100755
--- a/tools/createme
+++ b/tools/createme
@@ -19,7 +19,7 @@ usage()
 {
 cat << EOF

-    createme [-v] [--disable-meta-gen] --meta=<branch name> <arch> <branch> [defconfig]
+    createme [-v] [--disable-meta-gen] --meta=<branch name> <arch> <branch>

       --disable-meta-gen: do not automatically create meta data
                           if not already present in the source tree.
@@ -62,7 +62,6 @@ done

 arch=$1
 branch=$2
-defconfig=$3 # might be empty
 CURRENT=`git branch |grep \*|sed 's/^\* //'`
 repo=

@@ -194,7 +193,6 @@ check_defconfig() {
 # being built
 check_branch() {
 	branch=$1
-	defconfig=$2

 	ktgt=$branch

@@ -217,6 +215,5 @@ check_branch() {


 decheckpoint
-check_defconfig $defconfig
-check_branch $branch $defconfig
+check_branch $branch
 metaize $branch

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


