Return-Path: <alexandru.damian@intel.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 27F0265C97
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Feb 2015 17:52:07 +0000 (UTC)
Received: by pdbft15 with SMTP id ft15so32711127pdb.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Feb 2015 09:52:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=AtT8UYK+SvE+68GCeI04ZeRh/xRRrQ6ke0LFrTwnlwI=;
	b=cWswLYkyx/osjrU85YDBwsCxzFCH8FpEuGX0v5DwMwcwXw9kmlpM/cZd4nhSj3W6R1
	he1Knpg+AsibAYklNkLTVrgEm/N9uR7HtFpZFbCzoLKwhixPLWWDPm90m7x+jQ4JOJX6
	esSPfC4BnWYVf84eZYnoAflQFws96u7wZDG1cNpkJNxjSeYfA/YBU0iigGZRcbL4me1R
	UigQwhlGpxykUZam8VWFN8109BeaXVmnAWe4mjH1EoOjq5Rlog9+UHI6hYmGwp59UNby
	e00stYko/bMgB1nJDZcduMKzGcqY0ETKxed2ILrMnVOxBTHZIK9HwXM2QWNSuIYyrpZt
	jZFA==
X-Gm-Message-State: ALoCoQlIGpDiDr5Tfc7U19y9O8oREcZiNafz2cxzxAyab5au+ECVMDL0zoPcc8/wAzsh/2gmMkST
X-Received: by 10.66.62.229 with SMTP id b5mr31441842pas.30.1423504328714;
	Mon, 09 Feb 2015 09:52:08 -0800 (PST)
Received: from adamian-desk.local ([83.217.123.106])
	by mx.google.com with ESMTPSA id n4sm3850561pdl.12.2015.02.09.09.52.07
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Feb 2015 09:52:08 -0800 (PST)
Received: by adamian-desk.local (Postfix, from userid 1000)
	id 0FB21566188; Mon,  9 Feb 2015 17:52:06 +0000 (GMT)
From: Alex DAMIAN <alexandru.damian@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Feb 2015 17:52:05 +0000
Message-Id: <1423504325-13907-1-git-send-email-alexandru.damian@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 1/1] Update Toaster configuration file
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
X-List-Received-Date: Mon, 09 Feb 2015 17:52:11 -0000

From: Belen Barros Pena <belen.barros.pena@intel.com>

Update the config section of the meta/conf/toasterconf.json file
to set the default project variables as in meta-yocto/conf/toasterconf.json

[YOCTO #7248]

Signed-off-by: Belen Barros Pena <belen.barros.pena@intel.com>
---
 meta/conf/toasterconf.json | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/conf/toasterconf.json b/meta/conf/toasterconf.json
index fe1564e..aac478e 100644
--- a/meta/conf/toasterconf.json
+++ b/meta/conf/toasterconf.json
@@ -1,5 +1,12 @@
 {
-    "config": {"MACHINE": "qemux86", "DISTRO": "poky"},
+    "config": {
+        "MACHINE"      : "qemux86",
+        "DISTRO"       : "poky",
+        "IMAGE_FSTYPES": "ext3 jffs2 tar.bz2",
+        "IMAGE_INSTALL_append": "",
+        "PACKAGE_CLASSES": "package_rpm",
+        "SDKMACHINE"   : "x86_64"
+    },
     "layersources": [
         {
             "name": "Local OpenEmbedded",
-- 
1.9.1


