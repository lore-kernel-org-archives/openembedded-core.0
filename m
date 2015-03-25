Return-Path: <alexandru.damian@intel.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 9D0F1723B3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Mar 2015 14:14:39 +0000 (UTC)
Received: by wibg7 with SMTP id g7so75459192wib.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Mar 2015 07:14:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=CWY+G2Zh/n5aDnfbaFIqyG4EkiSjPfGdu+nlx6gFZ5k=;
	b=hTI1mIHz+54eVp2g8qmShV+MsaNsJxNEjAPIg7VHb/hxdrbF7qI8FWavXxWc/9sWWF
	GSDjio7aVP7dYSG69BN73xRUgXg1DBPXJPhg6Bq3EWx+Wtw2sPa4ymOVY7HQ0DQN3uHV
	P3JJdKWWljnMjZcrKZy0X8VjbIvPGdrDWh/EvLhc0aS90GpXwB/KdJAWyb/qWEAbSx9s
	drRrZe/tNqqwcopAjMHeELQOYHLLwJpmp1ld+UOmTFkAnK6+TNIHCtpqkjXBdoxYDZ+r
	UjBwODrTTU51g4sAB91TQ/eteX/0BP3wscUCfrc9ziFG5YTWsl6Ihzi8ffGvKmVza6eN
	kHHQ==
X-Gm-Message-State: ALoCoQni4DSTcWy0+ag6AeyWdUHdekSZhcVQ4+dhMb9PthB6h1ef8PHngIg4CX97FjPpNrWYO18J
X-Received: by 10.194.87.100 with SMTP id w4mr17841340wjz.65.1427292880504;
	Wed, 25 Mar 2015 07:14:40 -0700 (PDT)
Received: from adamian-desk.local ([83.217.123.106])
	by mx.google.com with ESMTPSA id w8sm3933991wja.4.2015.03.25.07.14.38
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 Mar 2015 07:14:39 -0700 (PDT)
Received: by adamian-desk.local (Postfix, from userid 1000)
	id F050F561325; Wed, 25 Mar 2015 14:14:37 +0000 (GMT)
From: Alex DAMIAN <alexandru.damian@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Mar 2015 14:14:36 +0000
Message-Id: <1427292876-13605-2-git-send-email-alexandru.damian@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1427292876-13605-1-git-send-email-alexandru.damian@intel.com>
References: <1427292876-13605-1-git-send-email-alexandru.damian@intel.com>
Cc: Belen Barros Pena <belen.barros.pena@linux.intel.com>
Subject: [master 2/2] toaster: update toasterconf.json for fido release
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
X-List-Received-Date: Wed, 25 Mar 2015 14:14:41 -0000

From: Belen Barros Pena <belen.barros.pena@linux.intel.com>

We update the toasterconf.json for the 1.8 "fido"
release.

A small update to the release help text in the
toasterconf.json file shipped with the
openembedded-core layer.

We now make explicit that Toaster will build with
the tip of the selected branch, and we add links
to the OpenEmbedded repository.

Signed-off-by: Belen Barros Pena <belen.barros.pena@linux.intel.com>
---
 meta/conf/toasterconf.json | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/meta/conf/toasterconf.json b/meta/conf/toasterconf.json
index aac478e..c8e42ef 100644
--- a/meta/conf/toasterconf.json
+++ b/meta/conf/toasterconf.json
@@ -12,7 +12,7 @@
             "name": "Local OpenEmbedded",
             "sourcetype": "local",
             "apiurl": "../../",
-            "branches": ["HEAD", "master", "dizzy"],
+            "branches": ["HEAD", "master", "fido", "dizzy"],
             "layers": [
                 {
                     "name": "openembedded-core",
@@ -26,13 +26,13 @@
             "name": "OpenEmbedded",
             "sourcetype": "layerindex",
             "apiurl": "http://layers.openembedded.org/layerindex/api/",
-            "branches": ["master", "dizzy"]
+            "branches": ["master", "fido", "dizzy"]
         },
         {
             "name": "Imported layers",
             "sourcetype": "imported",
             "apiurl": "",
-            "branches": ["master", "dizzy", "HEAD"]
+            "branches": ["master", "fido", "dizzy", "HEAD"]
 
         }
     ],
@@ -44,6 +44,12 @@
             "dirpath": ""
         },
         {
+            "name": "fido",
+            "giturl": "git://git.openembedded.org/bitbake",
+            "branch": "1.26",
+            "dirpath": ""
+        },
+        {
             "name": "dizzy",
             "giturl": "git://git.openembedded.org/bitbake",
             "branch": "1.24",
@@ -67,7 +73,16 @@
             "branch": "master",
             "defaultlayers": [ "openembedded-core" ],
             "layersourcepriority": { "Imported layers": 99, "Local OpenEmbedded" : 10, "OpenEmbedded" :  0 },
-            "helptext": "Toaster will run your builds using the OpenEmbedded master branch, where active development takes place. This is not a stable branch, so your builds might not work as expected."
+            "helptext": "Toaster will run your builds using the tip of the <a href=\"http://cgit.openembedded.org/openembedded-core/log/\">OpenEmbedded master</a> branch, where active development takes place. This is not a stable branch, so your builds might not work as expected."
+        },
+        {
+            "name": "fido",
+            "description": "OpenEmbedded Fido",
+            "bitbake": "fido",
+            "branch": "fido",
+            "defaultlayers": [ "openembedded-core" ],
+            "layersourcepriority": { "Imported layers": 99, "Local OpenEmbedded" : 10, "OpenEmbedded" :  0 },
+            "helptext": "Toaster will run your builds with the tip of the <a href=\"http://cgit.openembedded.org/openembedded-core/log/?h=fido\">OpenEmbedded \"Fido\"</a> branch"
         },
         {
             "name": "dizzy",
@@ -76,7 +91,7 @@
             "branch": "dizzy",
             "defaultlayers": [ "openembedded-core" ],
             "layersourcepriority": { "Imported layers": 99, "Local OpenEmbedded" : 10, "OpenEmbedded" :  0 },
-            "helptext": "Toaster will run your builds with the OpenEmbedded Dizzy release"
+            "helptext": "Toaster will run your builds with the tip of the <a href=\"http://cgit.openembedded.org/openembedded-core/log/?h=dizzy\">OpenEmbedded \"Dizzy\"</a> branch"
         },
         {
             "name": "local",
-- 
1.9.1


