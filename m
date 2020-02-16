Return-Path: <rpjday@crashcourse.ca>
Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
	by mail.openembedded.org (Postfix) with ESMTP id 7AD196026C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 13:23:05 +0000 (UTC)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com
	([174.114.57.56]:60632 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92)
	(envelope-from <rpjday@crashcourse.ca>) id 1j3Jt3-001zA8-Bk
	for openembedded-core@lists.openembedded.org;
	Sun, 16 Feb 2020 08:23:06 -0500
Date: Sun, 16 Feb 2020 08:23:02 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.21.2002160821300.2281990@localhost.localdomain>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-0.2
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel7.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel7.indieserve.net: authenticated_id:
	rpjday+crashcourse.ca/only user confirmed/virtual account not
	confirmed
X-Authenticated-Sender: cpanel7.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: [PATCH v2] fix various, innocuous typos
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
X-List-Received-Date: Sun, 16 Feb 2020 13:23:05 -0000
Content-Type: text/plain; charset=US-ASCII


Corrections:

  - environment
  - accommodate
  - conversion
  - compatible

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 75f0f2c3e3..359f240b0b 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -243,7 +243,7 @@ def testimage_main(d):
     if d.getVar("TEST_TARGET") == "qemu":
         fstypes = [fs for fs in fstypes if fs in supported_fstypes]
         if not fstypes:
-            bb.fatal('Unsupported image type built. Add a comptible image to '
+            bb.fatal('Unsupported image type built. Add a compatible image to '
                      'IMAGE_FSTYPES. Supported types: %s' %
                      ', '.join(supported_fstypes))
     qfstype = fstypes[0]
diff --git a/meta/conf/licenses.conf b/meta/conf/licenses.conf
index 1c586a3bc6..751424d1b6 100644
--- a/meta/conf/licenses.conf
+++ b/meta/conf/licenses.conf
@@ -1,7 +1,7 @@
 # Standards are great! Everyone has their own. In an effort to standardize licensing
 # names, common-licenses will use the SPDX standard license names. In order to not
 # break the non-standardized license names that we find in LICENSE, we'll set
-# up a bunch of VarFlags to accomodate non-SPDX license names.
+# up a bunch of VarFlags to accommodate non-SPDX license names.
 #
 # We should really discuss standardizing this field, but that's a longer term goal.
 # For now, we can do this and it should grab the most common LICENSE naming variations.
diff --git a/meta/lib/oeqa/manual/eclipse-plugin.json b/meta/lib/oeqa/manual/eclipse-plugin.json
index 9869150dcf..d77d0e673b 100644
--- a/meta/lib/oeqa/manual/eclipse-plugin.json
+++ b/meta/lib/oeqa/manual/eclipse-plugin.json
@@ -82,7 +82,7 @@
             ],
             "execution": {
                 "1": {
-                    "action": "Launch a QEMU of target enviroment.(Reference to case \"ADT - Launch qemu by eclipse\") ",
+                    "action": "Launch a QEMU of target environment.(Reference to case \"ADT - Launch qemu by eclipse\") ",
                     "expected_results": ""
                 },
                 "2": {
@@ -164,7 +164,7 @@
             ],
             "execution": {
                 "1": {
-                    "action": "Launch a QEMU of target enviroment.(Reference to case \"ADT - Launch qemu by eclipse\") ",
+                    "action": "Launch a QEMU of target environment.(Reference to case \"ADT - Launch qemu by eclipse\") ",
                     "expected_results": ""
                 },
                 "2": {
@@ -319,4 +319,4 @@
             "summary": "Eclipse_Poky_installation_and_setup"
         }
     }
-]
\ No newline at end of file
+]
diff --git a/meta/lib/oeqa/sdk/context.py b/meta/lib/oeqa/sdk/context.py
index 09e77c19fe..01c38c24e6 100644
--- a/meta/lib/oeqa/sdk/context.py
+++ b/meta/lib/oeqa/sdk/context.py
@@ -136,7 +136,7 @@ class OESDKTestContextExecutor(OETestContextExecutor):
         sdk_envs = OESDKTestContextExecutor._get_sdk_environs(args.sdk_dir)
         if not sdk_envs:
             raise argparse_oe.ArgumentUsageError("No available SDK "\
-                   "enviroments found at %s" % args.sdk_dir, self.name)
+                   "environments found at %s" % args.sdk_dir, self.name)

         if args.list_sdk_env:
             self._display_sdk_envs(logger.info, args, sdk_envs)
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index e2f91bcb6c..5886862d6c 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -1741,7 +1741,7 @@ class DevtoolUpgradeTests(DevtoolBase):
                          when building the kernel.
          """
         kernel_provider = get_bb_var('PREFERRED_PROVIDER_virtual/kernel')
-        # Clean up the enviroment
+        # Clean up the environment
         bitbake('%s -c clean' % kernel_provider)
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         tempdir_cfg = tempfile.mkdtemp(prefix='config_qa')
diff --git a/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py b/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py
index 6d80827652..d4664bd0df 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py
@@ -45,7 +45,7 @@ class TestBlobParsing(OESelftestTestCase):

     def test_blob_to_dict(self):
         """
-        Test convertion of git blobs to dictionary
+        Test conversion of git blobs to dictionary
         """
         from oe.buildhistory_analysis import blob_to_dict
         valuesmap = { "foo" : "1", "bar" : "2" }
diff --git a/scripts/pybootchartgui/pybootchartgui/draw.py b/scripts/pybootchartgui/pybootchartgui/draw.py
index add5c53882..53324b9f8b 100644
--- a/scripts/pybootchartgui/pybootchartgui/draw.py
+++ b/scripts/pybootchartgui/pybootchartgui/draw.py
@@ -308,7 +308,7 @@ sec_w_base = 1 # the width of a second
 proc_h = 16 # the height of a process
 leg_s = 10
 MIN_IMG_W = 800
-CUML_HEIGHT = 2000 # Increased value to accomodate CPU and I/O Graphs
+CUML_HEIGHT = 2000 # Increased value to accommodate CPU and I/O Graphs
 OPTIONS = None

 def extents(options, xscale, trace):

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

