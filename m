Return-Path: <net147@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 63B9973289
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Aug 2016 08:34:57 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id h186so22893567pfg.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 07 Aug 2016 01:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=2BgHhbh4xRGBxvET2y41qyU1I4wYjjZv4uPKyM6nyYA=;
	b=d/pxpvE7Oy3TVYMtb3QUsKlGA/7CByU0A5eB0GC2pNmyRinEK4MNXi0EobzKRqRt50
	EstVr6+aAOeqKdPD52dvLGvd7C+VR7LzN3vJIqII9WIJA/XYQsUk1L+Pfsk3Kz7MK6BQ
	8JkgVUL2o2BwkGSHduj+nONrfztkEcI3whAmePamATpm+85i6Cshq/D7bNEQLLfsDSY2
	US3Bmr/5gd9JwzUXU9r3DPfmlr2Z5fcJpBNpl8ikBMTSwKMJmSCAjMarGmwwqDue9Mpf
	mnEcD3qcLkcaMKgRE9J1IdNMzRnP8j0621ivQzQmvHo9boFWULSWMm/u5Yt3KF1eht4V
	7JyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2BgHhbh4xRGBxvET2y41qyU1I4wYjjZv4uPKyM6nyYA=;
	b=JaM5PTrb6xQzKdtoJW2x6vL/l4mXpo/7ZJ9sYrIPtaOR23/falc099Bsy0iifRBfPT
	yOk7tQn0HDytaaP/UUXOftQUsqKoR0JD2mgw5dxEvtGtA+l7+2+y0vfxPswTefX5z7dV
	YuIeOajPoMKiq8JyB/jxBjsiJv3HoSCHQpNq9QDS4ZFsrRhFlUlbUOgdm13LkRZp2Hxg
	rUi6sAjCeJeWCNAMcZRBiRLTXx+akLBnddtSsKl8fQh76dByc2Q4dKcDagXg/26h7eb8
	rq/erfBf25RfOGxseJNDxBPPwsMa7FkIZFgFPl/AeIigzefMzqXw3z+/7Odjj1kJfD64
	3IpA==
X-Gm-Message-State: AEkoouuDYzklHj3TLXCojURqAEQdPIpGwYTf1Ue0HfHIeLF18l6nsisdhUvw/+mZoOlRPA==
X-Received: by 10.98.222.70 with SMTP id h67mr151524376pfg.128.1470558897483; 
	Sun, 07 Aug 2016 01:34:57 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	m24sm39501072pfi.34.2016.08.07.01.34.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 07 Aug 2016 01:34:56 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  7 Aug 2016 18:34:28 +1000
Message-Id: <20160807083428.9084-1-net147@gmail.com>
X-Mailer: git-send-email 2.9.2
Subject: [PATCH] meta/classes: fix bb.build.FuncFailed typos
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
X-List-Received-Date: Sun, 07 Aug 2016 08:35:00 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/classes/grub-efi.bbclass     | 2 +-
 meta/classes/gummiboot.bbclass    | 4 ++--
 meta/classes/syslinux.bbclass     | 2 +-
 meta/classes/systemd-boot.bbclass | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/classes/grub-efi.bbclass b/meta/classes/grub-efi.bbclass
index b8c20dd..ae8ee38 100644
--- a/meta/classes/grub-efi.bbclass
+++ b/meta/classes/grub-efi.bbclass
@@ -95,7 +95,7 @@ python build_efi_cfg() {
     try:
          cfgfile = open(cfile, 'w')
     except OSError:
-        raise bb.build.funcFailed('Unable to open %s' % (cfile))
+        raise bb.build.FuncFailed('Unable to open %s' % (cfile))
 
     cfgfile.write('# Automatically created by OE\n')
 
diff --git a/meta/classes/gummiboot.bbclass b/meta/classes/gummiboot.bbclass
index 14fa4cf..e6eba17 100644
--- a/meta/classes/gummiboot.bbclass
+++ b/meta/classes/gummiboot.bbclass
@@ -74,7 +74,7 @@ python build_efi_cfg() {
     try:
          cfgfile = open(cfile, 'w')
     except OSError:
-        raise bb.build.funcFailed('Unable to open %s' % (cfile))
+        raise bb.build.FuncFailed('Unable to open %s' % (cfile))
 
     cfgfile.write('# Automatically created by OE\n')
     cfgfile.write('default %s\n' % (labels.split()[0]))
@@ -97,7 +97,7 @@ python build_efi_cfg() {
         try:
             entrycfg = open(entryfile, "w")
         except OSError:
-            raise bb.build.funcFailed('Unable to open %s' % (entryfile))
+            raise bb.build.FuncFailed('Unable to open %s' % (entryfile))
         localdata.setVar('OVERRIDES', label + ':' + overrides)
         bb.data.update_data(localdata)
 
diff --git a/meta/classes/syslinux.bbclass b/meta/classes/syslinux.bbclass
index 1d310dd..fa3e3ec 100644
--- a/meta/classes/syslinux.bbclass
+++ b/meta/classes/syslinux.bbclass
@@ -105,7 +105,7 @@ python build_syslinux_cfg () {
     try:
         cfgfile = open(cfile, 'w')
     except OSError:
-        raise bb.build.funcFailed('Unable to open %s' % (cfile))
+        raise bb.build.FuncFailed('Unable to open %s' % (cfile))
 
     cfgfile.write('# Automatically created by OE\n')
 
diff --git a/meta/classes/systemd-boot.bbclass b/meta/classes/systemd-boot.bbclass
index 9e9398a..b550b61 100644
--- a/meta/classes/systemd-boot.bbclass
+++ b/meta/classes/systemd-boot.bbclass
@@ -77,7 +77,7 @@ python build_efi_cfg() {
     try:
          cfgfile = open(cfile, 'w')
     except OSError:
-        raise bb.build.funcFailed('Unable to open %s' % (cfile))
+        raise bb.build.FuncFailed('Unable to open %s' % (cfile))
 
     cfgfile.write('# Automatically created by OE\n')
     cfgfile.write('default %s\n' % (labels.split()[0]))
@@ -100,7 +100,7 @@ python build_efi_cfg() {
         try:
             entrycfg = open(entryfile, "w")
         except OSError:
-            raise bb.build.funcFailed('Unable to open %s' % (entryfile))
+            raise bb.build.FuncFailed('Unable to open %s' % (entryfile))
         localdata.setVar('OVERRIDES', label + ':' + overrides)
         bb.data.update_data(localdata)
 
-- 
2.9.2


