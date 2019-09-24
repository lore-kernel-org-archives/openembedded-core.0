Return-Path: <paul@betafive.co.uk>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
	[66.111.4.28])
	by mail.openembedded.org (Postfix) with ESMTP id 1E1287E08B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 09:06:26 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 5F3AA21C1E;
	Tue, 24 Sep 2019 05:06:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
	by compute1.internal (MEProxy); Tue, 24 Sep 2019 05:06:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=betafive.co.uk;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=fm2; bh=ES8WmtNCwwoKT
	mnxkbuw8oiEPVhuEx1MXm2WU9PIESg=; b=mNPgQ6Kaeak0Jg2v/eiT99vccBrH6
	35ieXf7RrvBX8LnVJWqxVluHvMqN/0266k+DbJnrv/BvUrecgyplvoc+SADjW1ZC
	jTDzUIbvA4RR/cVyFG83ZLJRcI2xlgmLKavqVdi+ClVKtGeiV7AnXdEWSHW6n23l
	vgyXPD/O0qdm1V5IjRaz5CNEIUKou3ecqub+ByCXaGUBAveSYYap5ZDxwPUto/iW
	nWWAbQFPVlz3O9ENu+Km0kUnZSFdQvP+z6ztU09Ulj2F8b3DuibU6iif52FLjEFx
	dtjgVEagrnOdtrCIVMIpIh5Xhlh1wNMshLSqy+mcZhq8BNKqDY7eyDlRg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; bh=ES8WmtNCwwoKTmnxkbuw8oiEPVhuEx1MXm2WU9PIESg=; b=gaqeX/Ng
	wLhn6DGLfFom7uyi+fi92OfW9VrYHaEssC573z2/66a3nA/H4bBC/rhdooHP8mn9
	Eu5t+awRO582UNgPLVHJGerescnfMA4vVCOZOE2puVXkrJbKnLLTP2AnFkbAtLLi
	DG/s1lKIwrwQUfr2spPTlhNz6gEHyUgSJjGGpC9dQOEa5QbCUBiX+2sxMARgtOvI
	McLAO0dEF4PHgEy7KU3tDLVctErBZhDtL4vyzGU/IFpVSbGhorHcLuuS66ZDixKU
	fYNfqwKlqc6ZKaxjYGDJp+yv6OKYAbxmbjmxRr9yF16YFaMG+JFK0VRtKHxYNzOl
	PEGYLxhaWf9ZcA==
X-ME-Sender: <xms:kNyJXWYKeoj-nIowEruMW1g05Jn4n7Q70zvHAhhmUIc5yQOKMs5g9A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfedtgdduudcutefuodetggdotefrodftvf
	curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
	uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
	ertddtnecuhfhrohhmpefrrghulhcuuegrrhhkvghruceophgruhhlsegsvghtrghfihhv
	vgdrtghordhukheqnecuffhomhgrihhnpehmhihsihhtvgdrtghomhenucfkphepvddufe
	drgeekrdduuddrudegleenucfrrghrrghmpehmrghilhhfrhhomhepphgruhhlsegsvght
	rghfihhvvgdrtghordhukhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:kNyJXSarZjgvHhND8-CaVD-keR22QbF8eyakzgMQHgVqX5Te43A8Tw>
	<xmx:kNyJXd078wQ4OFvcsK2ol7tpT8lOehe6CnUB9KGvCrLpH8cMn5CFzQ>
	<xmx:kNyJXbjkaNWzj83gqOQxftHXQfkSrWgrrSy-iBaqDckKs3AXTIZ78A>
	<xmx:kNyJXbhSpHsmIFR_kT5k96OL6ULOaroi937j_p6nj8BnHHIp1x-2lA>
Received: from arch0.home.b5net.uk (unknown [213.48.11.149])
	by mail.messagingengine.com (Postfix) with ESMTPA id AEF61D6005B;
	Tue, 24 Sep 2019 05:06:23 -0400 (EDT)
From: Paul Barker <paul@betafive.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Sep 2019 10:06:09 +0100
Message-Id: <20190924090609.264248-2-paul@betafive.co.uk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190924090609.264248-1-paul@betafive.co.uk>
References: <20190924090609.264248-1-paul@betafive.co.uk>
MIME-Version: 1.0
Subject: [PATCH 1/1] archiver.bbclass: Add new mirror archiver mode
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
X-List-Received-Date: Tue, 24 Sep 2019 09:06:26 -0000
Content-Transfer-Encoding: 8bit

We define a new method of populating a source mirror using the archiver
bbclass instead of simply copying the contents of the downloads
directory. This allows the archiver features such as copyleft license
filtering and recipe type filtering to be used when preparing a source
mirror.

This new archiver mode is selected by setting `ARCHIVE_MODE[src]` to
'mirror'.

The source mirror mode can either be 'split' (default) or 'combined',
controlled by `ARCHIVER_MODE[mirror]`. Additionally, sources can be
excluded as needed by setting `ARCHIVER_MIRROR_EXCLUDE` to a list of
URI prefixes. These options are described in more detail in the new
entries in the header of archiver.bbclass.

Signed-off-by: Paul Barker <paul@betafive.co.uk>
---
 meta/classes/archiver.bbclass | 136 +++++++++++++++++++++++++++++-----
 1 file changed, 117 insertions(+), 19 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 093e2d95af..e54f57fafe 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -2,25 +2,42 @@
 # -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
 #
 # This bbclass is used for creating archive for:
-# 1) original (or unpacked) source: ARCHIVER_MODE[src] = "original"
-# 2) patched source: ARCHIVER_MODE[src] = "patched" (default)
-# 3) configured source: ARCHIVER_MODE[src] = "configured"
-# 4) The patches between do_unpack and do_patch:
-#    ARCHIVER_MODE[diff] = "1"
-#    And you can set the one that you'd like to exclude from the diff:
-#    ARCHIVER_MODE[diff-exclude] ?= ".pc autom4te.cache patches"
-# 5) The environment data, similar to 'bitbake -e recipe':
-#    ARCHIVER_MODE[dumpdata] = "1"
-# 6) The recipe (.bb and .inc): ARCHIVER_MODE[recipe] = "1"
-# 7) Whether output the .src.rpm package:
-#    ARCHIVER_MODE[srpm] = "1"
-# 8) Filter the license, the recipe whose license in
-#    COPYLEFT_LICENSE_INCLUDE will be included, and in
-#    COPYLEFT_LICENSE_EXCLUDE will be excluded.
-#    COPYLEFT_LICENSE_INCLUDE = 'GPL* LGPL*'
-#    COPYLEFT_LICENSE_EXCLUDE = 'CLOSED Proprietary'
-# 9) The recipe type that will be archived:
-#    COPYLEFT_RECIPE_TYPES = 'target'
+#  1) original (or unpacked) source: ARCHIVER_MODE[src] = "original"
+#  2) patched source: ARCHIVER_MODE[src] = "patched" (default)
+#  3) configured source: ARCHIVER_MODE[src] = "configured"
+#  4) source mirror: ARCHIVE_MODE[src] = "mirror"
+#  5) The patches between do_unpack and do_patch:
+#     ARCHIVER_MODE[diff] = "1"
+#     And you can set the one that you'd like to exclude from the diff:
+#     ARCHIVER_MODE[diff-exclude] ?= ".pc autom4te.cache patches"
+#  6) The environment data, similar to 'bitbake -e recipe':
+#     ARCHIVER_MODE[dumpdata] = "1"
+#  7) The recipe (.bb and .inc): ARCHIVER_MODE[recipe] = "1"
+#  8) Whether output the .src.rpm package:
+#     ARCHIVER_MODE[srpm] = "1"
+#  9) Filter the license, the recipe whose license in
+#     COPYLEFT_LICENSE_INCLUDE will be included, and in
+#     COPYLEFT_LICENSE_EXCLUDE will be excluded.
+#     COPYLEFT_LICENSE_INCLUDE = 'GPL* LGPL*'
+#     COPYLEFT_LICENSE_EXCLUDE = 'CLOSED Proprietary'
+# 10) The recipe type that will be archived:
+#     COPYLEFT_RECIPE_TYPES = 'target'
+# 11) The source mirror mode:
+#     ARCHIVER_MODE[mirror] = "split" (default): Sources are split into
+#     per-recipe directories in a similar way to other archiver modes.
+#     Post-processing may be required to produce a single mirror directory.
+#     This does however allow inspection of duplicate sources and more
+#     intelligent handling.
+#     ARCHIVER_MODE[mirror] = "combined": All sources are placed into a single
+#     directory suitable for direct use as a mirror. Duplicate sources are
+#     ignored.
+# 12) Source mirror exclusions:
+#     ARCHIVE_MIRROR_EXCLUDE is a list of prefixes to exclude from the mirror.
+#     This may be used for sources which you are already publishing yourself
+#     (e.g. if the URI starts with 'https://mysite.com/' and your mirror is
+#     going to be published to the same site). It may also be used to exclude
+#     local files (with the prefix 'file://') if these will be provided as part
+#     of an archive of the layers themselves.
 #
 
 # Create archive for all the recipe types
@@ -33,6 +50,7 @@ ARCHIVER_MODE[diff] ?= "0"
 ARCHIVER_MODE[diff-exclude] ?= ".pc autom4te.cache patches"
 ARCHIVER_MODE[dumpdata] ?= "0"
 ARCHIVER_MODE[recipe] ?= "0"
+ARCHIVER_MODE[mirror] ?= "split"
 
 DEPLOY_DIR_SRC ?= "${DEPLOY_DIR}/sources"
 ARCHIVER_TOPDIR ?= "${WORKDIR}/deploy-sources"
@@ -41,6 +59,10 @@ ARCHIVER_RPMTOPDIR ?= "${WORKDIR}/deploy-sources-rpm"
 ARCHIVER_RPMOUTDIR = "${ARCHIVER_RPMTOPDIR}/${TARGET_SYS}/${PF}/"
 ARCHIVER_WORKDIR = "${WORKDIR}/archiver-work/"
 
+# When producing a combined mirror directory, allow duplicates for the case
+# where multiple recipes use the same SRC_URI.
+ARCHIVER_COMBINED_MIRRORDIR = "${ARCHIVER_TOPDIR}/mirror"
+SSTATE_DUPWHITELIST += "${DEPLOY_DIR_SRC}/mirror"
 
 do_dumpdata[dirs] = "${ARCHIVER_OUTDIR}"
 do_ar_recipe[dirs] = "${ARCHIVER_OUTDIR}"
@@ -106,6 +128,8 @@ python () {
         elif hasTask("do_configure"):
             d.appendVarFlag('do_ar_configured', 'depends', ' %s:do_configure' % pn)
         d.appendVarFlag('do_deploy_archives', 'depends', ' %s:do_ar_configured' % pn)
+    elif ar_src == "mirror":
+        d.appendVarFlag('do_deploy_archives', 'depends', '%s:do_ar_mirror' % pn)
 
     elif ar_src:
         bb.fatal("Invalid ARCHIVER_MODE[src]: %s" % ar_src)
@@ -281,6 +305,79 @@ python do_ar_configured() {
         create_tarball(d, srcdir, 'configured', ar_outdir)
 }
 
+python do_ar_mirror() {
+    import subprocess
+
+    src_uri = (d.getVar('SRC_URI') or '').split()
+    if len(src_uri) == 0:
+        return
+
+    dl_dir = d.getVar('DL_DIR')
+    mirror_exclusions = (d.getVar('ARCHIVER_MIRROR_EXCLUDE') or '').split()
+    mirror_mode = d.getVarFlag('ARCHIVER_MODE', 'mirror')
+    have_mirror_tarballs = d.getVar('BB_GENERATE_MIRROR_TARBALLS')
+
+    if mirror_mode == 'combined':
+        destdir = d.getVar('ARCHIVER_COMBINED_MIRRORDIR')
+    elif mirror_mode == 'split':
+        destdir = d.getVar('ARCHIVER_OUTDIR')
+    else:
+        bb.fatal('Invalid ARCHIVER_MODE[mirror]: %s' % (mirror_mode))
+
+    if not have_mirror_tarballs:
+        bb.fatal('Using `ARCHIVER_MODE[src] = "mirror"` depends on setting `BB_GENERATE_MIRROR_TARBALLS = "1"`')
+
+    def is_excluded(url):
+        for prefix in mirror_exclusions:
+            if url.startswith(prefix):
+                return True
+        return False
+
+    bb.note('Archiving the source as a mirror...')
+
+    bb.utils.mkdirhier(destdir)
+
+    fetcher = bb.fetch2.Fetch(src_uri, d)
+
+    for url in fetcher.urls:
+        if is_excluded(url):
+            bb.note('Skipping excluded url: %s' % (url))
+            continue
+
+        bb.note('Archiving url: %s' % (url))
+        ud = fetcher.ud[url]
+        ud.setup_localpath(d)
+        localpath = None
+
+        # Check for mirror tarballs first. We will archive the first mirror
+        # tarball that we find as it's assumed that we just need one.
+        for mirror_fname in ud.mirrortarballs:
+            mirror_path = os.path.join(dl_dir, mirror_fname)
+            if os.path.exists(mirror_path):
+                bb.note('Found mirror tarball: %s' % (mirror_path))
+                localpath = mirror_path
+                break
+
+        if len(ud.mirrortarballs) and not localpath:
+            bb.warn('Mirror tarballs are listed for a source but none are present.' \
+                    'Falling back to original download.\n' \
+                    'SRC_URI = %s' % (url))
+
+        # Check original download
+        if not localpath:
+            bb.note('Using original download: %s' % (ud.localpath))
+            localpath = ud.localpath
+
+        if not localpath or not os.path.exists(localpath):
+            bb.fatal('Original download is missing for a source.\n' \
+                        'SRC_URI = %s' % (url))
+
+        # We now have an appropriate localpath
+        bb.note('Copying source mirror')
+        cmd = 'cp -fpPRH %s %s' % (localpath, destdir)
+        subprocess.check_call(cmd, shell=True)
+}
+
 def exclude_useless_paths(tarinfo):
     if tarinfo.isdir():
         if tarinfo.name.endswith('/temp') or tarinfo.name.endswith('/patches') or tarinfo.name.endswith('/.pc'):
@@ -482,6 +579,7 @@ addtask do_ar_original after do_unpack
 addtask do_unpack_and_patch after do_patch
 addtask do_ar_patched after do_unpack_and_patch
 addtask do_ar_configured after do_unpack_and_patch
+addtask do_ar_mirror after do_fetch
 addtask do_dumpdata
 addtask do_ar_recipe
 addtask do_deploy_archives before do_build
-- 
2.23.0


