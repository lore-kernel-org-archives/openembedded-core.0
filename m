Return-Path: <alexandru.damian@intel.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 35DFE72379
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Nov 2014 16:53:38 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id n12so6960125wgh.20
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Nov 2014 08:53:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=y8VhuFtyEBgUPrk5T5Yq3tqzOluK0fcFX3X3hrunkT0=;
	b=GahdXv83Vk6ISqjONvvFVi3Kf+dAORlwI0lOoybmMnbfFiV/UlGrCM4F5fdGsoW4fV
	OuiFuu8NP7L0klBuGzE8UzE8MIhXrYOoLyjsrBCcrdPkxeuoevj3BJY3k19h+2oUcdHH
	4is+wkL5QB6Y5pkVkUPJ88tDdpr3akbkUsmwRqWhen32wMHps4tfigFuvM8COWhtXKGd
	3x6xQdA+9wbeXbrUZeyR2EUy8sTdCi0V2ymPCKHI2V3f4NScWqEk7GEGp5u4x4Xs2lCp
	wuuDh2y+Be7xNuoIlFJ1XTsJHF92DPyO4jvvh14XLp9IEKEIMOF6QSD1JD/r2f2SSShB
	BDkg==
X-Gm-Message-State: ALoCoQmTZPPXOXk3HY8KQtr+QcCfSKUgluH5Pg3nMx69MQDFAp5BRycjA6QlHLEdJLCVID18x8qE
X-Received: by 10.180.182.199 with SMTP id eg7mr52297463wic.17.1417107218781; 
	Thu, 27 Nov 2014 08:53:38 -0800 (PST)
Received: from adamian-desk.local ([83.217.123.106])
	by mx.google.com with ESMTPSA id
	mc10sm25991266wic.24.2014.11.27.08.53.37 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Nov 2014 08:53:37 -0800 (PST)
Received: by adamian-desk.local (Postfix, from userid 1000)
	id 41B6A563B9C; Thu, 27 Nov 2014 16:53:37 +0000 (GMT)
From: Alex DAMIAN <alexandru.damian@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Nov 2014 16:53:35 +0000
Message-Id: <1417107215-28956-1-git-send-email-alexandru.damian@intel.com>
X-Mailer: git-send-email 1.9.1
Cc: Belen Barros Pena <belen.barros.pena@linux.intel.com>
Subject: [PATCH 1/1] toaster: naming and description changes
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
X-List-Received-Date: Thu, 27 Nov 2014 16:53:39 -0000

From: Belen Barros Pena <belen.barros.pena@linux.intel.com>

Some minor changes to the names and descriptions
used in the Toaster configuration file:

* Change the name of the local layer source from Local OE-Core
to Local OpenEmbedded

* Change the imported layer source name from User Imported Layers
to just Imported layers. It is shorter, which helps table display

* Change the description of the master release from OE-Core
master to OpenEmbedded master

* Change the description of the dizzy release from OE-Core dizzy
to OpenEmbedded Dizzy

* Change the helptext of the dizzy release to remove the
"latest" reference, which can make maintenance hard

* Change the name of the Local Yocto Project release to Local
OpenEmbedded

Signed-off-by: Belen Barros Pena <belen.barros.pena@linux.intel.com>

diff --git a/meta/conf/toasterconf.json b/meta/conf/toasterconf.json
index c9835d0..fe1564e 100644
--- a/meta/conf/toasterconf.json
+++ b/meta/conf/toasterconf.json
@@ -2,7 +2,7 @@
     "config": {"MACHINE": "qemux86", "DISTRO": "poky"},
     "layersources": [
         {
-            "name": "Local OE-Core",
+            "name": "Local OpenEmbedded",
             "sourcetype": "local",
             "apiurl": "../../",
             "branches": ["HEAD", "master", "dizzy"],
@@ -22,7 +22,7 @@
             "branches": ["master", "dizzy"]
         },
         {
-            "name": "User Imported Layers",
+            "name": "Imported layers",
             "sourcetype": "imported",
             "apiurl": "",
             "branches": ["master", "dizzy", "HEAD"]
@@ -55,30 +55,30 @@
     "releases": [
         {
             "name": "master",
-            "description": "OE-Core master",
+            "description": "OpenEmbedded master",
             "bitbake": "master",
             "branch": "master",
             "defaultlayers": [ "openembedded-core" ],
-            "layersourcepriority": { "User Imported Layers": 99, "Local OE-Core" : 10, "OpenEmbedded" :  0 },
+            "layersourcepriority": { "Imported layers": 99, "Local OpenEmbedded" : 10, "OpenEmbedded" :  0 },
             "helptext": "Toaster will run your builds using the OpenEmbedded master branch, where active development takes place. This is not a stable branch, so your builds might not work as expected."
         },
         {
             "name": "dizzy",
-            "description": "OE-Core dizzy",
+            "description": "OpenEmbedded Dizzy",
             "bitbake": "dizzy",
             "branch": "dizzy",
             "defaultlayers": [ "openembedded-core" ],
-            "layersourcepriority": { "User Imported Layers": 99, "Local OE-Core" : 10, "OpenEmbedded" :  0 },
-            "helptext": "Toaster will run your builds with the latest OpenEmbedded release, the dizzy branch."
+            "layersourcepriority": { "Imported layers": 99, "Local OpenEmbedded" : 10, "OpenEmbedded" :  0 },
+            "helptext": "Toaster will run your builds with the OpenEmbedded Dizzy release"
         },
         {
             "name": "local",
-            "description": "Local Yocto Project",
+            "description": "Local OpenEmbedded",
             "bitbake": "HEAD",
             "branch": "HEAD",
             "defaultlayers": [ "openembedded-core" ],
-            "layersourcepriority": { "User Imported Layers": 99, "Local OE-Core" : 10, "OpenEmbedded" :  0 },
-            "helptext": "Toaster will run your builds with the version of the OpenEmbedded that you have cloned or downloaded to your computer."
+            "layersourcepriority": { "Imported layers": 99, "Local OpenEmbedded" : 10, "OpenEmbedded" :  0 },
+            "helptext": "Toaster will run your builds with the version of OpenEmbedded that you have cloned or downloaded to your computer."
         }
     ]
 }
-- 
1.9.1


