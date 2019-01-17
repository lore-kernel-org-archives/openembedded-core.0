Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
	[209.85.167.45])
	by mail.openembedded.org (Postfix) with ESMTP id F25F27C273
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 16:40:54 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id i26so8335307lfc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 08:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=6LOq25/es5UybHcO7Zg2qBSu3bzqLHix8grQqw4qZbo=;
	b=DqgGA3UfJwxi+h6rCOS9jmkkPpxjZaOq5xM9bKlKQcTsu7g5h6O5GJWQ2nz6K8nVDl
	AGdAHhLDfF1zuEyUFjx3CxXY9CKTniNf0L2ywlNQ1OIqW02mCDpekcy0IgYkTF/GToHb
	mQ8fTzGNUWlBEsKM3jHMOTuFIOSMz5dlJhxP+KdhQvub1F88aZtVNmlEM6iV1FasXeCj
	oDjvPPBMekvJgaYDRRaxr2mTR7ULaZX6gNTv2t+dK2reBWD+L4HNkPnxPTnV1lFH1UzM
	aAUxPi3cGfbjy6MGXB4PM9qoxFmPO6SmO0+is9Gh8AMmjXr4K567bHJsHK8XyJlqVJQc
	GPrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=6LOq25/es5UybHcO7Zg2qBSu3bzqLHix8grQqw4qZbo=;
	b=Jw3Iz1LPuVVnJ7hGZmh7eT66itLWnJjBcoC9Uksm/AsCDMYIf4qMHRVy+GaOuY0iXN
	kduzTBDSkg4JOyrNU/v8oolb+ntoJJYSsBohJw0NzhKZ8NLLcwO6roe/lZcKzceoPWDK
	qRF9dfwSdQm1aLycPvXaABQxre/8pglGenZHIz5gJxtN6bxWVExmewq5Ys42NneuyCl6
	6pghFC4NKb52DakXDRaB3Bq27A/0+fN73h3EEEpNY3lsJ/7NYOLsWDpuezPD+FY4z2ii
	PxcIxSK+tE2aKb657eCA/vYIBBDhaiewhABKXySAlonJPgao0TPyj0SfoAONE6//SpVD
	NJfg==
X-Gm-Message-State: AJcUukfq9uYQ4DG9NUniwuU6AcqMSkt7dht4t/IIVxu14/eaPsqshxfS
	7zEAkN6y+Wc2ovS4DMEeVJvbeQyx
X-Google-Smtp-Source: ALg8bN76P1JIVt6UT9BozRED7cdX87bzdZJaXPuDMu6EsoxZXL/jbG/elkfxX7dFz0a1NlWQ29mE+A==
X-Received: by 2002:a19:e601:: with SMTP id d1mr10972945lfh.71.1547743255249; 
	Thu, 17 Jan 2019 08:40:55 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id k14sm373098lfc.70.2019.01.17.08.40.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Jan 2019 08:40:54 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Jan 2019 17:40:12 +0100
Message-Id: <74c103b5cc607cfbc862ebe0b218aebb531c585d.1547743126.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1547743126.git.alex.kanavin@gmail.com>
References: <cover.1547743126.git.alex.kanavin@gmail.com>
Subject: [PATCHv3 27/27] vte: allow building vte-native with gcc 4.8
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
X-List-Received-Date: Thu, 17 Jan 2019 16:40:55 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...chool-asignment-to-avoid-gcc-4.8-err.patch | 27 +++++++++++++++++++
 meta/recipes-support/vte/vte_0.52.2.bb        |  5 ++--
 2 files changed, 30 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/vte/vte/0001-app.cc-use-old-school-asignment-to-avoid-gcc-4.8-err.patch

diff --git a/meta/recipes-support/vte/vte/0001-app.cc-use-old-school-asignment-to-avoid-gcc-4.8-err.patch b/meta/recipes-support/vte/vte/0001-app.cc-use-old-school-asignment-to-avoid-gcc-4.8-err.patch
new file mode 100644
index 00000000000..9c3f98fa61f
--- /dev/null
+++ b/meta/recipes-support/vte/vte/0001-app.cc-use-old-school-asignment-to-avoid-gcc-4.8-err.patch
@@ -0,0 +1,27 @@
+From 442da9076b52003743ffc6fd7b9d647de6d7aa8f Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 17 Jan 2019 16:37:54 +0100
+Subject: [PATCH] app.cc: use old school asignment to avoid gcc 4.8 error
+
+This is needed to build vte-native on Centos 7,
+and can be dropped once that OS is no longer supported.
+
+Upstream-Status: Inappropriate [ancient compiler fix]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ src/app/app.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/app/app.cc b/src/app/app.cc
+index d424064..675d789 100644
+--- a/src/app/app.cc
++++ b/src/app/app.cc
+@@ -306,7 +306,7 @@ public:
+                 else
+                         alpha = get_alpha();
+ 
+-                GdkRGBA color{bg_color};
++                GdkRGBA color = bg_color;
+                 color.alpha = alpha;
+                 return color;
+         }
diff --git a/meta/recipes-support/vte/vte_0.52.2.bb b/meta/recipes-support/vte/vte_0.52.2.bb
index 62fb5288fa9..272ae66f134 100644
--- a/meta/recipes-support/vte/vte_0.52.2.bb
+++ b/meta/recipes-support/vte/vte_0.52.2.bb
@@ -9,8 +9,9 @@ inherit gnomebase gtk-doc distro_features_check upstream-version-is-even gobject
 
 # vapigen.m4 is required when vala is not present (but the one from vala should be used normally)
 SRC_URI += "file://0001-Don-t-enable-stack-protection-by-default.patch \
-            ${@bb.utils.contains('PACKAGECONFIG', 'vala', '', 'file://0001-Add-m4-vapigen.m4.patch', d) } \
-            "
+           ${@bb.utils.contains('PACKAGECONFIG', 'vala', '', 'file://0001-Add-m4-vapigen.m4.patch', d) } \
+           file://0001-app.cc-use-old-school-asignment-to-avoid-gcc-4.8-err.patch \
+           "
 SRC_URI[archive.md5sum] = "de8181350dccb010e915e366bdd06d18"
 SRC_URI[archive.sha256sum] = "0f2657cef52accbfe56feede553155552d7c1984b1291838af3cb8cfc19b26af"
 
-- 
2.17.1


