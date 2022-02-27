Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 412BFC433EF
	for <webhook@archiver.kernel.org>; Sun, 27 Feb 2022 10:53:12 +0000 (UTC)
Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web11.7918.1645959191476035108
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Feb 2022 02:53:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com
 ([174.114.107.13]:58920 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1nOHAq-00AjjW-94
	for openembedded-core@lists.openembedded.org; Sun, 27 Feb 2022 05:53:09 -0500
Date: Sun, 27 Feb 2022 05:53:05 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: [PATCH] various typo/grammar/punctuation fixes
Message-ID: <e87695fc-5342-abae-423b-43726cad859a@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id:
 rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Feb 2022 10:53:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162433


Among other things, fix misspellings of:

  - absolute
  - deprecated
  - suitable
  - handle

and a bunch of other things.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  was perusing runqemu script, so most changes are there but checked
around for other stuff at the same time.

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 5637a02451..642f0eb637 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -217,7 +217,7 @@ class TestImage(OESelftestTestCase):
         if distro and distro in ['debian-9', 'debian-10', 'centos-7', 'centos-8', 'ubuntu-16.04', 'ubuntu-18.04', 'almalinux-8.5']:
             self.skipTest('virgl headless cannot be tested with %s' %(distro))

-        render_hint = """If /dev/dri/renderD* is absent due to lack of suitable GPU, 'modprobe vgem' will create one sutable for mesa llvmpipe sofware renderer."""
+        render_hint = """If /dev/dri/renderD* is absent due to lack of suitable GPU, 'modprobe vgem' will create one suitable for mesa llvmpipe software renderer."""
         try:
             content = os.listdir("/dev/dri")
             if len([i for i in content if i.startswith('render')]) == 0:
diff --git a/scripts/crosstap b/scripts/crosstap
index 73c8947442..5aa72f14d4 100755
--- a/scripts/crosstap
+++ b/scripts/crosstap
@@ -353,7 +353,7 @@ bitbake workspace.

 Anything after -- option is passed directly to stap.

-Legacy script invocation style supported but depreciated:
+Legacy script invocation style supported but deprecated:
   %prog <user@hostname> <sytemtap-script> [systemtap options]

 To enable most out of systemtap the following site.conf or local.conf
diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
index 5a51fa793f..d4ac074ad9 100755
--- a/scripts/oe-setup-builddir
+++ b/scripts/oe-setup-builddir
@@ -94,9 +94,9 @@ into your configuration please add entries to conf/bblayers.conf.

 EOM

-    # Put the abosolute path to the layers in bblayers.conf so we can run
-    # bitbake without the init script after the first run
-    # ##COREBASE## is deprecated as it's meaning was inconsistent, but continue
+    # Put the absolute path to the layers in bblayers.conf so we can run
+    # bitbake without the init script after the first run.
+    # ##COREBASE## is deprecated as its meaning was inconsistent, but continue
     # to replace it for compatibility.
     sed -e "s|##OEROOT##|$OEROOT|g" \
         -e "s|##COREBASE##|$OEROOT|g" \
@@ -115,7 +115,7 @@ The Yocto Project has extensive documentation about OE including a reference
 manual which can be found at:
     https://docs.yoctoproject.org

-For more information about OpenEmbedded see their website:
+For more information about OpenEmbedded see the website:
     https://www.openembedded.org/

 EOM
diff --git a/scripts/runqemu b/scripts/runqemu
index 5c108ec23a..9ddd47267c 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -73,11 +73,11 @@ of the following environment variables (in any order):
     gl-es - enable virgl-based GL acceleration, using OpenGL ES (also needs gtk or sdl options)
     egl-headless - enable headless EGL output; use vnc (via publicvnc option) or spice to see it
     (hint: if /dev/dri/renderD* is absent due to lack of suitable GPU, 'modprobe vgem' will create
-    one sutable for mesa llvmpipe sofware renderer)
+    one suitable for mesa llvmpipe software renderer)
     serial - enable a serial console on /dev/ttyS0
     serialstdio - enable a serial console on the console (regardless of graphics mode)
-    slirp - enable user networking, no root privileges is required
-    snapshot - don't write changes to back to images
+    slirp - enable user networking, no root privilege is required
+    snapshot - don't write changes back to images
     kvm - enable KVM when running x86/x86_64 (VT-capable CPU required)
     kvm-vhost - enable KVM with vhost when running x86/x86_64 (VT-capable CPU required)
     publicvnc - enable a VNC server open to all hosts
@@ -352,10 +352,10 @@ class BaseConfig(object):
     def check_arg_path(self, p):
         """
         - Check whether it is <image>.qemuboot.conf or contains <image>.qemuboot.conf
-        - Check whether is a kernel file
-        - Check whether is a image file
-        - Check whether it is a nfs dir
-        - Check whether it is a OVMF flash file
+        - Check whether it is a kernel file
+        - Check whether it is an image file
+        - Check whether it is an NFS dir
+        - Check whether it is an OVMF flash file
         """
         if p.endswith('.qemuboot.conf'):
             self.qemuboot = p
@@ -366,7 +366,7 @@ class BaseConfig(object):
             self.kernel =  p
         elif os.path.exists(p) and (not os.path.isdir(p)) and '-image-' in os.path.basename(p):
             self.rootfs = p
-            # Check filename against self.fstypes can hanlde <file>.cpio.gz,
+            # Check filename against self.fstypes can handle <file>.cpio.gz,
             # otherwise, its type would be "gz", which is incorrect.
             fst = ""
             for t in self.fstypes:

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

