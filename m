Return-Path: <avery.brian@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 30375766DF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 23:04:25 +0000 (UTC)
Received: by pawq9 with SMTP id q9so37789924paw.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 16:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BcL25IBg6C9RrRu6mC0feynNUVGSBmkEKlkNnCY5sIM=;
	b=IrbBDUqaRhGnm06v3/mB0MCaH9RVulwcil+rMUtcmnn8JBRgFs8T5WJjeBZqCYyJQo
	3TIn+nuTMuIkD+dovtI235x+coh7gsT8AQWlxxoaJtLfBjX8qtUfBKDqR+HAkcqQ0xEL
	6sxp7ourAyFY4ZDu6typELcVv0tkuaeil0AuZ2ubMh2+oCaTTqy3dBs5rielpQxEix0X
	ePatm5QRxHDZn4pnt2/EnByZIRQdPsQTsFIxN1D1vwW1Bbl/sc5+ipm/5bYpZvd1mkC1
	J/9amspdHptjLVN7HXZ+rI6S1/afzKHJTQzza5772fyFfdsByiN9O0/IAHYbMqDAA305
	YAww==
X-Received: by 10.68.244.137 with SMTP id xg9mr11012722pbc.27.1440111865544;
	Thu, 20 Aug 2015 16:04:25 -0700 (PDT)
Received: from whisper.hsd1.or.comcast.net
	(c-98-232-142-195.hsd1.or.comcast.net. [98.232.142.195])
	by smtp.gmail.com with ESMTPSA id f4sm5477811pdc.95.2015.08.20.16.04.24
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 20 Aug 2015 16:04:24 -0700 (PDT)
From: brian avery <avery.brian@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Aug 2015 16:04:55 -0700
Message-Id: <de1da1b1a976acc7a5412705149b832b9a17973d.1440111536.git.avery.brian@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1440111536.git.avery.brian@gmail.com>
References: <cover.1440111536.git.avery.brian@gmail.com>
Subject: [FIDO PATCH 1/1] toasterconf: remove master as a branch option from fido release
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
X-List-Received-Date: Thu, 20 Aug 2015 23:04:25 -0000

From: Alexandru DAMIAN <alexandru.damian@intel.com>

Toaster isn't designed to be forward compatible. As such,
a release cannot build releases newer then it.

Particularly, "fido" cannot build "master", so we remove
"master" from the list of supported releases in "fido"

[YOCTO #8154]

Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
Signed-off-by: brian avery <avery.brian@gmail.com>
---
 meta/conf/toasterconf.json | 23 ++++-------------------
 1 file changed, 4 insertions(+), 19 deletions(-)

diff --git a/meta/conf/toasterconf.json b/meta/conf/toasterconf.json
index c8e42ef..ecd6a9f 100644
--- a/meta/conf/toasterconf.json
+++ b/meta/conf/toasterconf.json
@@ -12,7 +12,7 @@
             "name": "Local OpenEmbedded",
             "sourcetype": "local",
             "apiurl": "../../",
-            "branches": ["HEAD", "master", "fido", "dizzy"],
+            "branches": ["HEAD", "fido", "dizzy"],
             "layers": [
                 {
                     "name": "openembedded-core",
@@ -26,24 +26,18 @@
             "name": "OpenEmbedded",
             "sourcetype": "layerindex",
             "apiurl": "http://layers.openembedded.org/layerindex/api/",
-            "branches": ["master", "fido", "dizzy"]
+            "branches": ["fido", "dizzy"]
         },
         {
             "name": "Imported layers",
             "sourcetype": "imported",
             "apiurl": "",
-            "branches": ["master", "fido", "dizzy", "HEAD"]
+            "branches": ["fido", "dizzy", "HEAD"]
 
         }
     ],
     "bitbake" : [
         {
-            "name": "master",
-            "giturl": "git://git.openembedded.org/bitbake",
-            "branch": "master",
-            "dirpath": ""
-        },
-        {
             "name": "fido",
             "giturl": "git://git.openembedded.org/bitbake",
             "branch": "1.26",
@@ -63,19 +57,10 @@
         }
     ],
 
-    "defaultrelease": "master",
+    "defaultrelease": "fido",
 
     "releases": [
         {
-            "name": "master",
-            "description": "OpenEmbedded master",
-            "bitbake": "master",
-            "branch": "master",
-            "defaultlayers": [ "openembedded-core" ],
-            "layersourcepriority": { "Imported layers": 99, "Local OpenEmbedded" : 10, "OpenEmbedded" :  0 },
-            "helptext": "Toaster will run your builds using the tip of the <a href=\"http://cgit.openembedded.org/openembedded-core/log/\">OpenEmbedded master</a> branch, where active development takes place. This is not a stable branch, so your builds might not work as expected."
-        },
-        {
             "name": "fido",
             "description": "OpenEmbedded Fido",
             "bitbake": "fido",
-- 
1.9.1


