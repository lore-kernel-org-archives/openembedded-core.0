Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id 06E107DF86
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 May 2019 21:12:41 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id c17so7682701lfi.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 May 2019 14:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=EKhGbtiscWWkt7Iu6morul1KxfhL4Fp0We52bJnDoOs=;
	b=njkiBgn1x/pncCHQxxj4fOH8Ah+Y4UqgHNervsye+n7xhx4VPz7gOOS0U/77ubPqSv
	ldg81JCDJCZlzuGjFukgrEpUhMRimQSwgSka+aWh3+eziSoVnM1BqeZXNGQArxXufp5q
	GPbO97eejWf1hB8+uRvfsremtWNXEsNRTI4vK2dPpIxKxgoQ/+kV1bWfrmL/J+fLQ9Eq
	Ykdbd6kSly7oCE7MhjVFSDzBOjQfy8Np2IGxADjwCiD6d0gumynARajJlPhr7KnCvkmk
	x1uA5c5SjRsKA5XQsckc9uJcd+A1z0MXU6Samb1xDnjR5Uskz+QtWLVwIA8wtHYyjPVN
	6++A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=EKhGbtiscWWkt7Iu6morul1KxfhL4Fp0We52bJnDoOs=;
	b=t9ulued53cmPpupa2z7kqXRUmjKRz13FRQnbHw+NsFn2VpHRegSShWMm/jRl9FfQ+z
	XmhoJi8kh30U16zmrxEO7jY6BfoJ4e9O2RtcJvwieM1scrHtN6nqVBJCWuRdYuzI9N0I
	ICS/YdpOd9AOENSDsme3N9RznNwvBVPOznu7MScvl523ZlMzUv2c0j0pjf7gQwbYNPjR
	YysX00URif+K9JDX3z3APR40WCgfKQXUelHiHc4JMQxK5EY63Jiczq7scIqgDoozscpz
	BNzHaAu16VDdv/Z926d8N3+g85anYSNpWrsAByM0cS3HHW7v3m020E4UyD+LSPUJzkwA
	hqQQ==
X-Gm-Message-State: APjAAAWtod26RJZfQxH2Uu/lXx1/Yr6eEBb9Cc/MWhAAL4laE33a4TS5
	zl0vELfw1I4agBjecU2mvv4V22byq4A=
X-Google-Smtp-Source: APXvYqw7YU8N2S6P0yEKIzTh8vnT2agg2HMg8A1WKIe0mj6N9m3NcGPZ2D0Vyb8zKbz+zCvZCX1a6w==
X-Received: by 2002:a19:771c:: with SMTP id s28mr6114301lfc.140.1558213962399; 
	Sat, 18 May 2019 14:12:42 -0700 (PDT)
Received: from peterliu-Precision-M4800.lan
	(c-b09ee253.022-417-73746f13.bbcust.telenor.se. [83.226.158.176])
	by smtp.gmail.com with ESMTPSA id f16sm953723lfk.75.2019.05.18.14.12.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 18 May 2019 14:12:41 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 May 2019 23:12:25 +0200
Message-Id: <1558213945-10235-3-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558213945-10235-1-git-send-email-liu.ming50@gmail.com>
References: <1558213945-10235-1-git-send-email-liu.ming50@gmail.com>
Cc: gerard.salvatella@toradex.com, luka.pivk@toradex.com,
	stefan.agner@toradex.com, Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH V2 2/2] meta: drop IMAGE_FSTYPES from UBOOT_CONFIG
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
X-List-Received-Date: Sat, 18 May 2019 21:12:42 -0000

From: Ming Liu <liu.ming50@gmail.com>

Currently, in most BSP layers, the uboot-config.bbclass is not being
inherited in machine conf, so the IMAGE_FSTYPES item would not take
effect since it's a image specific variable, So we can drop it from
UBOOT_CONFIG.

Instead, we introduce a new item 'env', it could be used to deploy
environment files to '/boot' directory and also to deploy directory.

To give a example, now the UBOOT_CONFIG could be set like this:
```
UBOOT_CONFIG ??= "emmc rawnand"
UBOOT_CONFIG[emmc] = "imx7_emmc_defconfig,uEnv-emmc.txt,u-boot.imx"
UBOOT_CONFIG[nand] = "imx7_defconfig,uEnv-nand.txt,u-boot-nand.imx"
```

It would not conflict with the current UBOOT_ENV variable, the later
has higher priority to override environment setting in UBOOT_CONFIG.

Also drop some trivial debug code in this patch.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/classes/uboot-config.bbclass  | 25 +++++++++++--------------
 meta/conf/documentation.conf       |  2 +-
 meta/recipes-bsp/u-boot/u-boot.inc | 22 ++++++++++++++++++++++
 3 files changed, 34 insertions(+), 15 deletions(-)

diff --git a/meta/classes/uboot-config.bbclass b/meta/classes/uboot-config.bbclass
index 89ff970..af609fc 100644
--- a/meta/classes/uboot-config.bbclass
+++ b/meta/classes/uboot-config.bbclass
@@ -3,7 +3,7 @@
 # The format to specify it, in the machine, is:
 #
 # UBOOT_CONFIG ??= <default>
-# UBOOT_CONFIG[foo] = "config,images,binary"
+# UBOOT_CONFIG[foo] = "config,env,binary"
 #
 # or
 #
@@ -15,23 +15,24 @@ UBOOT_BINARY ?= "u-boot.${UBOOT_SUFFIX}"
 
 python () {
     ubootmachine = d.getVar("UBOOT_MACHINE")
-    ubootconfigflags = d.getVarFlags('UBOOT_CONFIG')
     ubootbinary = d.getVar('UBOOT_BINARY')
     ubootbinaries = d.getVar('UBOOT_BINARIES')
+    ubootenvs = d.getVar('UBOOT_ENVS')
+    ubootconfig = (d.getVar('UBOOT_CONFIG') or "").split()
+    ubootconfigflags = d.getVarFlags('UBOOT_CONFIG') or {}
+
     # The "doc" varflag is special, we don't want to see it here
     ubootconfigflags.pop('doc', None)
-    ubootconfig = (d.getVar('UBOOT_CONFIG') or "").split()
 
     if not ubootmachine and not ubootconfig:
-        PN = d.getVar("PN")
-        FILE = os.path.basename(d.getVar("FILE"))
-        bb.debug(1, "To build %s, see %s for instructions on \
-                 setting up your machine config" % (PN, FILE))
         raise bb.parse.SkipRecipe("Either UBOOT_MACHINE or UBOOT_CONFIG must be set in the %s machine configuration." % d.getVar("MACHINE"))
 
     if ubootmachine and ubootconfig:
         raise bb.parse.SkipRecipe("You cannot use UBOOT_MACHINE and UBOOT_CONFIG at the same time.")
 
+    if ubootconfigflags and ubootenvs:
+        raise bb.parse.SkipRecipe("You cannot use UBOOT_ENVS as it is internal to uboot_config.bbclass.")
+
     if ubootconfigflags and ubootbinaries:
         raise bb.parse.SkipRecipe("You cannot use UBOOT_BINARIES as it is internal to uboot_config.bbclass.")
 
@@ -40,18 +41,14 @@ python () {
             for f, v in ubootconfigflags.items():
                 if config == f: 
                     items = v.split(',')
-                    if items[0] and len(items) > 3:
-                        raise bb.parse.SkipRecipe('Only config,images,binary can be specified!')
+                    if len(items) == 0 or len(items) > 3:
+                        raise bb.parse.SkipRecipe('Only config,env,binary can be specified!')
                     d.appendVar('UBOOT_MACHINE', ' ' + items[0])
-                    # IMAGE_FSTYPES appending
                     if len(items) > 1 and items[1]:
-                        bb.debug(1, "Appending '%s' to IMAGE_FSTYPES." % items[1])
-                        d.appendVar('IMAGE_FSTYPES', ' ' + items[1])
+                        d.appendVar('UBOOT_ENVS', ' ' + items[1])
                     if len(items) > 2 and items[2]:
-                        bb.debug(1, "Appending '%s' to UBOOT_BINARIES." % items[2])
                         d.appendVar('UBOOT_BINARIES', ' ' + items[2])
                     else:
-                        bb.debug(1, "Appending '%s' to UBOOT_BINARIES." % ubootbinary)
                         d.appendVar('UBOOT_BINARIES', ' ' + ubootbinary)
                     break
 }
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 550df20..5da7eb8 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -439,7 +439,7 @@ TUNEVALID[doc] = "Descriptions, stored as flags, of valid tuning features."
 
 #U
 
-UBOOT_CONFIG[doc] = "Configures the UBOOT_MACHINE and can also define IMAGE_FSTYPES for individual cases."
+UBOOT_CONFIG[doc] = "Configures the UBOOT_MACHINE and can also define UBOOT_ENVS, UBOOT_BINARIES for individual cases."
 UBOOT_ENTRYPOINT[doc] = "Specifies the entry point for the U-Boot image."
 UBOOT_LOADADDRESS[doc] = "Specifies the load address for the U-Boot image."
 UBOOT_LOCALVERSION[doc] = "Appends a string to the name of the local version of the U-Boot image."
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index e5af762..3b22e6e 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -121,6 +121,13 @@ do_compile () {
                         fi
                     done
                     unset k
+                    for env in ${UBOOT_ENVS}; do
+                        k=$(expr $k + 1);
+                        if [ $k -eq $i ]; then
+                            ${S}/scripts/get_default_envs.sh ${B}/${config} > ${B}/${config}/${env}
+                        fi
+                    done
+                    unset k
                 fi
             done
             unset  j
@@ -145,6 +152,13 @@ do_install () {
                     install -m 644 ${B}/${config}/u-boot-${type}.${UBOOT_SUFFIX} ${D}/boot/u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX}
                     ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${D}/boot/${UBOOT_BINARY}-${type}
                     ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${D}/boot/${UBOOT_BINARY}
+                    for env in ${UBOOT_ENVS}; do
+                        k=$(expr $k + 1);
+                        if [ $k -eq $i ]; then
+                            install -m 0644 ${B}/${config}/${env} ${D}/boot/${env}
+                        fi
+                    done
+                    unset k
                 fi
             done
             unset  j
@@ -235,6 +249,14 @@ do_deploy () {
                 if [ $j -eq $i ]
                 then
                     install -m 644 ${B}/${config}/u-boot-${type}.${UBOOT_SUFFIX} ${DEPLOYDIR}/u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX}
+                    for env in ${UBOOT_ENVS}; do
+                        k=$(expr $k + 1);
+                        if [ $k -eq $i ]; then
+                            install -m 0644 ${B}/${config}/${env} ${DEPLOYDIR}/${env}
+                        fi
+                    done
+                    unset k
+
                     ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${DEPLOYDIR}/${UBOOT_SYMLINK}-${type}
                     ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${DEPLOYDIR}/${UBOOT_SYMLINK}
                     ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${DEPLOYDIR}/${UBOOT_BINARY}-${type}
-- 
2.7.4


