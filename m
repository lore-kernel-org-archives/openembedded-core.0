Return-Path: <michael.g.wood@intel.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 5468D71975
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 12:24:44 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id a197so75582330wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 04:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=qOzxX7BK2HbIR8iGjk3LQsywOp/opk0ikaVxQxIiUAk=;
	b=mHgASq0godI01iSRpMgqiCrMgNYrPXBM2OHsRonrh0CptOfhi1kU5IhnkygvOUciXv
	Ssjl1XPJvumjFfosyDLEI2ZpsHWbrp78k2UPH5NcNdDs1BmAHfHyZ4j0YcKvxwlt91vh
	XB3ucfMHRXyPPqPGhnLbBcsjcHdTwkP6AW1L9EERpJg6lGKZazlYyv/FUqt7vouB4IOZ
	j/PNpoRM03Xs/5iX/1R879tznWtp9KHYa9b96WzKVknTnQbV4JrMPG2QYBCNDRrPfpdR
	NQ54n2QKC9tV5jS3OsBd4k3hSRtwM2J8j9p8oJOrstVf/JmZy/97ZbBx3xWGwG/iAkZn
	3Vrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=qOzxX7BK2HbIR8iGjk3LQsywOp/opk0ikaVxQxIiUAk=;
	b=mWLsnRFG9yYHfZMRVdzG4TV3Lq+Mb/LExcnB0spGHGWBlfeL7FQtGqFrGdCIg30D6D
	jFJyNDywa3zkhPMNBsvfIJuNpFJMTGWJble44pIjd8SIZvQhdlV0QmeVpzYqUcyNQsqF
	ECs9+k4c1tKoabujwKjsRys7U08OAS+pgw3/w65JGRPL9o7Nc8s2mQP8uw4VAqXl+nWE
	3FI+BCCbLnS5iNGS+bi8jh4MSZG+BlDeovasH0ghQ57jJYVZ/SavNl5N8Vt8HSF5RpBe
	2yW/2EwEPHZCPleanphhdvnY/iH0qhf2cQZdbzovnxt3YXBa6xaGJTLyJtHN/dkwgSzf
	f4Gg==
X-Gm-Message-State: AKaTC00O+KfJKQYTK3vtpLJPROH1OUKCr+TVHqKrfKkffCSdJKTNq23JKR8NOW1OeVQ5YK9X
X-Received: by 10.28.228.5 with SMTP id b5mr2926713wmh.129.1479903885735;
	Wed, 23 Nov 2016 04:24:45 -0800 (PST)
Received: from orion.home (host31-54-69-88.range31-54.btcentralplus.com.
	[31.54.69.88]) by smtp.gmail.com with ESMTPSA id
	cl10sm36194076wjb.4.2016.11.23.04.24.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 23 Nov 2016 04:24:45 -0800 (PST)
From: Michael Wood <michael.g.wood@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Nov 2016 12:24:35 +0000
Message-Id: <1479903876-7268-1-git-send-email-michael.g.wood@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: toaster@yoctoproject.org
Subject: [PATCH 1/2] conf: Remove redundant toasterconf.json file
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
X-List-Received-Date: Wed, 23 Nov 2016 12:24:45 -0000

We no longer use this file to start toaster. Toaster's configuration is
setup by Toaster itself using the standard Django data fixtures.

Signed-off-by: Michael Wood <michael.g.wood@intel.com>
---
 meta/conf/toasterconf.json | 77 ----------------------------------------------
 1 file changed, 77 deletions(-)
 delete mode 100644 meta/conf/toasterconf.json

diff --git a/meta/conf/toasterconf.json b/meta/conf/toasterconf.json
deleted file mode 100644
index 796125b..0000000
--- a/meta/conf/toasterconf.json
+++ /dev/null
@@ -1,77 +0,0 @@
-{
-    "config": {
-        "MACHINE"      : "qemux86",
-        "DISTRO"       : "nodistro",
-        "DL_DIR"       : "${TOPDIR}/../downloads",
-        "IMAGE_FSTYPES": "ext4 jffs2 tar.bz2",
-        "IMAGE_INSTALL_append": "",
-        "PACKAGE_CLASSES": "package_rpm",
-        "SSTATE_DIR"   : "${TOPDIR}/../sstate-cache"
-    },
-    "layersources": [
-        {
-            "name": "Local OpenEmbedded",
-            "sourcetype": "local",
-            "apiurl": "../../",
-            "branches": ["HEAD", "master"],
-            "layers": [
-                {
-                    "name": "openembedded-core",
-                    "local_path": "meta",
-                    "vcs_url": "remote:origin",
-                    "dirpath": "meta"
-                }
-            ]
-        },
-        {
-            "name": "OpenEmbedded",
-            "sourcetype": "layerindex",
-            "apiurl": "http://layers.openembedded.org/layerindex/api/",
-            "branches": ["master"]
-        },
-        {
-            "name": "Imported layers",
-            "sourcetype": "imported",
-            "apiurl": "",
-            "branches": ["master", "HEAD"]
-
-        }
-    ],
-    "bitbake" : [
-        {
-            "name": "master",
-            "giturl": "git://git.openembedded.org/bitbake",
-            "branch": "master",
-            "dirpath": ""
-        },
-        {
-            "name": "HEAD",
-            "giturl": "git://git.openembedded.org/bitbake",
-            "branch": "HEAD",
-            "dirpath": ""
-        }
-    ],
-
-    "defaultrelease": "master",
-
-    "releases": [
-        {
-            "name": "master",
-            "description": "OpenEmbedded master",
-            "bitbake": "master",
-            "branch": "master",
-            "defaultlayers": [ "openembedded-core" ],
-            "layersourcepriority": { "Imported layers": 99, "Local OpenEmbedded" : 10, "OpenEmbedded" :  0 },
-            "helptext": "Toaster will run your builds using the tip of the <a href=\"http://cgit.openembedded.org/openembedded-core/log/\">OpenEmbedded master</a> branch, where active development takes place. This is not a stable branch, so your builds might not work as expected."
-        },
-        {
-            "name": "local",
-            "description": "Local OpenEmbedded",
-            "bitbake": "HEAD",
-            "branch": "HEAD",
-            "defaultlayers": [ "openembedded-core" ],
-            "layersourcepriority": { "Imported layers": 99, "Local OpenEmbedded" : 10, "OpenEmbedded" :  0 },
-            "helptext": "Toaster will run your builds with the version of OpenEmbedded that you have cloned or downloaded to your computer."
-        }
-    ]
-}
-- 
2.7.4


