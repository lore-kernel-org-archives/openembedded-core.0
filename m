Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id EBC416C0EB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 11:16:07 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id y139so1898668wmc.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 03:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=f2eQbXmFibP6C1IhqcTnVuX9YW5bvJX9XY4pD4sVtb8=;
	b=lWcg+/PASComFW2PjRDWcGkDiu0Q7QKvk3HNoDhU5zmWmUVmSTXNFYhLNczGxH8coD
	TblTn++AIhMIbLWPxtW5gWb4srsKKW+gkXMD5+lfKQngpW+ov9LaNKwcjG5WrDuMWz5d
	p30oPYBN8dlxSROmq4foiWOdIDI/9IA/aqU6AgfJtDN3SecHvrVVhrFLdgbyv9snTSnL
	9zob80lLgy1A+35H3yDlXUOFclS887KEYVepsz3zOmI523RkUi2eqF415RtgVXc7lTVe
	NEFcvLVrPtl2Z1aqFj/W4fn+2iT+BNaoRdox1/n/nEBLIP2yQypMaOBpgz0IEoYR/FxV
	0i1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=f2eQbXmFibP6C1IhqcTnVuX9YW5bvJX9XY4pD4sVtb8=;
	b=rLPrQJOAShg82hHWXgjghYHlCtVD0qgU7ZWiLyDl8icD1xkjYbQ6FZpbydVRirim7R
	6BxGQ28rmut4uw+7FWKE2HTWKPp+CR/fRt03g+PgSEiUO5fg2Y/Pq0fHj84VScMfauck
	ly8CxoQjBcuNScF3La72aD3C1pm1OV8nT2sIubu3oCpLbVnDxfcHZEBi5si8k21sSyRI
	3IEpnC3Yzom7VAfm//WbPF/2K0N9prfP89Gpc7/vXatGldQXeOFXEDK5CRR1gt1+BROs
	b6BVLrDys2qby7+99OKL1ZQs5RugM08NDCA/tdekpBDW0tzNJ6NMj8aK/zsLQwBGqZHd
	vwLA==
X-Gm-Message-State: AA+aEWYH7py/K2Iv/UCltAGlVHhO9T/uJ9KycuuDXFhOanUth8JHX2aO
	m2FstD52MS2FtlSFboHZpNKNoFaPgkg=
X-Google-Smtp-Source: AFSGD/WZOR4fMINvOAUfS/er7svI8OvYp9JQb6gGiBIHCudjiQFfV9fpziCAd6G11v0JHaxBazqraQ==
X-Received: by 2002:a1c:a104:: with SMTP id k4mr6596136wme.54.1544699768167;
	Thu, 13 Dec 2018 03:16:08 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	v19sm2919416wrd.46.2018.12.13.03.16.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Dec 2018 03:16:07 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Dec 2018 11:16:04 +0000
Message-Id: <20181213111604.6353-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20181213111604.6353-1-ross.burton@intel.com>
References: <20181213111604.6353-1-ross.burton@intel.com>
Subject: [PATCH 2/2] runqemu: formatting cleanups suggested by PyLint
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
X-List-Received-Date: Thu, 13 Dec 2018 11:16:08 -0000

Mostly whitespace fixes but also some r"" strings to clarify regular
expressions.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 scripts/runqemu | 46 +++++++++++++++++++++++-----------------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index c4a0ca811d9..9beb7b00fc0 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -127,7 +127,7 @@ def check_libgl(qemu_bin):
             ('/usr/lib/*-linux-gnu/libGL.so', '/usr/lib/*-linux-gnu/libGLU.so'))
 
         for (f1, f2) in check_files:
-            if re.search('\*', f1):
+            if re.search(r'\*', f1):
                 for g1 in glob.glob(f1):
                     if libgl:
                         break
@@ -179,12 +179,12 @@ class BaseConfig(object):
         # Supported env vars, add it here if a var can be got from env,
         # and don't use os.getenv in the code.
         self.env_vars = ('MACHINE',
-                        'ROOTFS',
-                        'KERNEL',
-                        'DEVICE_TREE',
-                        'DEPLOY_DIR_IMAGE',
-                        'OE_TMPDIR',
-                        'OECORE_NATIVE_SYSROOT',
+                         'ROOTFS',
+                         'KERNEL',
+                         'DEVICE_TREE',
+                         'DEPLOY_DIR_IMAGE',
+                         'OE_TMPDIR',
+                         'OECORE_NATIVE_SYSROOT',
                         )
 
         self.qemu_opt = ''
@@ -329,10 +329,10 @@ class BaseConfig(object):
         if p.endswith('.qemuboot.conf'):
             self.qemuboot = p
             self.qbconfload = True
-        elif re.search('\.bin$', p) or re.search('bzImage', p) or \
+        elif re.search(r'\.bin$', p) or re.search('bzImage', p) or \
              re.search('zImage', p) or re.search('vmlinux', p) or \
              re.search('fitImage', p) or re.search('uImage', p):
-            self.kernel =  p
+            self.kernel = p
         elif os.path.exists(p) and (not os.path.isdir(p)) and '-image-' in os.path.basename(p):
             self.rootfs = p
             # Check filename against self.fstypes can hanlde <file>.cpio.gz,
@@ -343,13 +343,13 @@ class BaseConfig(object):
                     fst = t
                     break
             if not fst:
-                m = re.search('.*\.(.*)$', self.rootfs)
+                m = re.search(r'.*\.(.*)$', self.rootfs)
                 if m:
-                    fst =  m.group(1)
+                    fst = m.group(1)
             if fst:
                 self.check_arg_fstype(fst)
-                qb = re.sub('\.' + fst + "$", '', self.rootfs)
-                qb = '%s%s' % (re.sub('\.rootfs$', '', qb), '.qemuboot.conf')
+                qb = re.sub(r'\.' + fst + "$", '', self.rootfs)
+                qb = '%s%s' % (re.sub(r'\.rootfs$', '', qb), '.qemuboot.conf')
                 if os.path.exists(qb):
                     self.qemuboot = qb
                     self.qbconfload = True
@@ -538,9 +538,9 @@ class BaseConfig(object):
                 raise RunQemuError(yocto_paravirt_kvm_wiki)
 
         if not os.access(dev_kvm, os.W_OK|os.R_OK):
-                logger.error("You have no read or write permission on /dev/vhost-net.")
-                logger.error("Please change the ownership of this file as described at:")
-                raise RunQemuError(yocto_kvm_wiki)
+            logger.error("You have no read or write permission on /dev/vhost-net.")
+            logger.error("Please change the ownership of this file as described at:")
+            raise RunQemuError(yocto_kvm_wiki)
 
     def check_fstype(self):
         """Check and setup FSTYPE"""
@@ -569,8 +569,8 @@ class BaseConfig(object):
         if self.rootfs and not os.path.exists(self.rootfs):
             # Lazy rootfs
             self.rootfs = "%s/%s-%s.%s" % (self.get('DEPLOY_DIR_IMAGE'),
-                    self.rootfs, self.get('MACHINE'),
-                    self.fstype)
+                                           self.rootfs, self.get('MACHINE'),
+                                           self.fstype)
         elif not self.rootfs:
             cmd_name = '%s/%s*.%s' % (self.get('DEPLOY_DIR_IMAGE'), self.get('IMAGE_NAME'), self.fstype)
             cmd_link = '%s/%s*.%s' % (self.get('DEPLOY_DIR_IMAGE'), self.get('IMAGE_LINK_NAME'), self.fstype)
@@ -826,7 +826,7 @@ class BaseConfig(object):
                 print('DTB: [%s]' % self.dtb)
         print('MACHINE: [%s]' % self.get('MACHINE'))
         print('FSTYPE: [%s]' % self.fstype)
-        if self.fstype  == 'nfs':
+        if self.fstype == 'nfs':
             print('NFS_DIR: [%s]' % self.rootfs)
         else:
             print('ROOTFS: [%s]' % self.rootfs)
@@ -844,7 +844,7 @@ class BaseConfig(object):
 
         # Figure out a new nfs_instance to allow multiple qemus running.
         ps = subprocess.check_output(("ps", "auxww")).decode('utf-8')
-        pattern = '/bin/unfsd .* -i .*\.pid -e .*/exports([0-9]+) '
+        pattern = r'/bin/unfsd .* -i .*\.pid -e .*/exports([0-9]+) '
         all_instances = re.findall(pattern, ps, re.M)
         if all_instances:
             all_instances.sort(key=int)
@@ -863,7 +863,7 @@ class BaseConfig(object):
             # Use '%s' since they are integers
             os.putenv(k, '%s' % v)
 
-        self.unfs_opts="nfsvers=3,port=%s,udp,mountport=%s" % (nfsd_port, mountd_port)
+        self.unfs_opts = "nfsvers=3,port=%s,udp,mountport=%s" % (nfsd_port, mountd_port)
 
         # Extract .tar.bz2 or .tar.bz if no nfs dir
         if not (self.rootfs and os.path.isdir(self.rootfs)):
@@ -1160,8 +1160,8 @@ class BaseConfig(object):
         self.qemu_opt = "%s %s %s %s" % (qemu_bin, self.get('NETWORK_CMD'), self.get('ROOTFS_OPTIONS'), self.get('QB_OPT_APPEND'))
 
         for ovmf in self.ovmf_bios:
-            format = ovmf.rsplit('.', 1)[-1]
-            self.qemu_opt += ' -drive if=pflash,format=%s,file=%s' % (format, ovmf)
+            fmt = ovmf.rsplit('.', 1)[-1]
+            self.qemu_opt += ' -drive if=pflash,format=%s,file=%s' % (fmt, ovmf)
         if self.ovmf_bios:
             # OVMF only supports normal VGA, i.e. we need to override a -vga vmware
             # that gets added for example for normal qemux86.
-- 
2.11.0


