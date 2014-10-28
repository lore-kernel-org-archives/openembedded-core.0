Return-Path: <alexandru.damian@intel.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 21F2460557
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Oct 2014 14:09:24 +0000 (UTC)
Received: by mail-wg0-f51.google.com with SMTP id l18so924400wgh.34
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Oct 2014 07:09:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=HnXw91q3wMt2e60QBDzgapr/7YSvY3zSuGkv8EWHx0U=;
	b=K62phWXlgaDzMiZ6Wy2rRL1W/TCiXDHH2NES2jpCaF42JGd/tUenQWmvpqzaC7hfWY
	zTJMQ8PFcZ2tZTgnTNAA4Dzq407xt7p8p9h71KtMpLCANmQ5Pc6JRBgrDzMls9/fVByC
	UYzKZZnRmgjCMuIi1v9Tk/Urx6rN04Dg0jpgerTHZ5Wl+b6vp+zSCrV7Ikf2lbIKHfzI
	p/ntbNOdCZpOtMUHKeAQyh90JOEe3JO4w5NO02xA10umigQ6LJEcBFMSUXgOmr2oTNsq
	fpH21ozjuhPSnrYApl6Q0c5yowA+SIUBDS169dQWjRAdd74dF7DST/80y4LN09IX+17O
	F8FQ==
X-Gm-Message-State: ALoCoQkjNYgis+Db9rT2pYoXZBnP90C015EuUyIW9G1QzE3q8L4wMVu+4cRqLgg/gg4iiw2imXIU
X-Received: by 10.180.73.19 with SMTP id h19mr27993868wiv.3.1414505363027;
	Tue, 28 Oct 2014 07:09:23 -0700 (PDT)
Received: from adamian-desk.corp.intel.com ([83.217.123.106])
	by mx.google.com with ESMTPSA id mc4sm2354382wic.6.2014.10.28.07.09.20
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Oct 2014 07:09:22 -0700 (PDT)
Received: by adamian-desk.corp.intel.com (Postfix, from userid 1000)
	id 176B7561BD7; Tue, 28 Oct 2014 14:09:21 +0000 (GMT)
From: Alex DAMIAN <alexandru.damian@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Oct 2014 14:09:19 +0000
Message-Id: <1414505359-1271-1-git-send-email-alexandru.damian@intel.com>
X-Mailer: git-send-email 1.9.1
Cc: Alexandru DAMIAN <alexandru.damian@intel.com>
Subject: [PATCH 01/27] toaster: add toaster layer configuration file
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
X-List-Received-Date: Tue, 28 Oct 2014 14:09:28 -0000

From: Alexandru DAMIAN <alexandru.damian@intel.com>

In managed mode, Toaster tries to discover layers
that are being checked-out on disk.

In base layers, the toasterconf.json file
describes basic configuration file for builds based
on that layer, like default configuration variable
settings, toaster-compatible branches, and the
layerindex URL where the base layer and
compatible layers are listed.

This patch adds toasterconf.json file to the oe core layer.

Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
---
 meta/conf/toasterconf.json | 71 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 meta/conf/toasterconf.json

diff --git a/meta/conf/toasterconf.json b/meta/conf/toasterconf.json
new file mode 100644
index 0000000..cdc7564
--- /dev/null
+++ b/meta/conf/toasterconf.json
@@ -0,0 +1,71 @@
+{
+    "config": {"MACHINE": "qemux86", "DISTRO": "poky"},
+    "layersources": [
+        {
+            "name": "Poky",
+            "sourcetype": 0,
+            "apiurl": "../../",
+            "branches": ["master"],
+            "layers": [
+                {
+                    "name": "openembedded-core",
+                    "local_path": "meta",
+                    "vcs_url": "remote:origin",
+                    "dirpath": "meta"
+                },
+                {
+                    "name": "meta-yocto",
+                    "local_path": "meta",
+                    "vcs_url": "remote:origin",
+                    "dirpath": "meta-yocto"
+                },
+                {
+                    "name": "meta-yocto-bsp",
+                    "local_path": "meta",
+                    "vcs_url": "remote:origin",
+                    "dirpath": "meta-yocto-bsp"
+                }
+
+            ]
+        },
+        {
+            "name": "OpenEmbedded",
+            "sourcetype": 1,
+            "apiurl": "http://layers.openembedded.org/layerindex/api/",
+            "branches": ["master", "dizzy"]
+        }
+    ],
+    "bitbake" : [
+        {
+            "name": "master",
+            "giturl": "git://git.yoctoproject.org/poky.git",
+            "branch": "dizzy",
+            "dirpath": "bitbake"
+        },
+        {
+            "name": "master",
+            "giturl": "git://git.yoctoproject.org/poky.git",
+            "branch": "master",
+            "dirpath": "bitbake"
+        }
+    ],
+
+    "defaultrelease": "master",
+
+    "releases": [
+        {
+            "name": "master",
+            "description": "Yocto Project master",
+            "bitbake": "master",
+            "branch": "master",
+            "defaultlayers": [ "Poky:openembedded-core", "Poky:meta-yocto", "Poky:meta-yocto-bsp"]
+        },
+        {
+            "name": "dizzy",
+            "description": "Yocto Project 1.7 Dizzy",
+            "bitbake": "master",
+            "branch": "dizzy",
+            "defaultlayers": [ "Poky:openembedded-core", "Poky:meta-yocto", "Poky:meta-yocto-bsp"]
+        }
+    ]
+}
-- 
1.9.1


