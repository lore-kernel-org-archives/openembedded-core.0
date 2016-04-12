Return-Path: <danismostlikely@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id 18A456FF60
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 18:25:37 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id vv3so1902078pab.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 11:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=OWYiDQFHqANCmrd27Sn2qLtN9OJn552lkkbtUx9GRqk=;
	b=xTwrh0Gh1moWgFNDR+7r7Dz0LEozGKGktRDGqFu0SwDTKCKJw2r0pfE/5SbYc0kVrm
	IBbMtVr6wUAK5GucmRNeqrDvdk6Ey9+yHSdW94fBUpcagzptQE5KNTBQ1gMm2Xi9ePYv
	BOv+I+B7/ksN/HjsnWa+NudfGYjrj7BYC7UB545mUBM6DWdD6kzqFwrWtS5uHmfng3RW
	SrXtlrYicADKjZh0M6Y5qp6tzsAmm/jxh24h3Ozuiho/UfMGS0aVwZRbEJMrsqYUWSnn
	KzDCfoIb2Fed/QQSBxrTv1++w5eVnIcpc3R3+r3feXaAtvJPmN9LQuejAJ3hxUlRZ0E8
	U5Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=OWYiDQFHqANCmrd27Sn2qLtN9OJn552lkkbtUx9GRqk=;
	b=ZeaurPVESvUOLoiwPiXNIP1nGmDzklHB0dTIOzXovvuNBsFiGEPEsVWlIVJq/Y9ILI
	JfVfkXhvQbvikmkY0WYFIyUswW7v8kzgaa8b/hGGwuNK22lBV/H0YhbuON3HH984esnE
	Dmw5/iyiXgUuUwz4uSis6Ho/m/ZpFsmWZIVdhQLlOUNyUv1jmaEg5wteI70qkuDave8b
	DIv48v5sre8pxea96UxkxxX9paK/MQaCOnnyX0hCV+M6XYr5JqwWmgI8gQlEA3l58O7H
	BMV02+a37mxKI8Oz9ORgTL/V2XfF3tmFlNZC59d/K1sUyF8ybx4Em2Fe0ruGAp0JpRKA
	CUlQ==
X-Gm-Message-State: AOPr4FUQi9FlFG8UlLS/xZsPqBoYY+OAOsPCx8UTDZ2fO37TfeKvyihIePGgDL6JiZ9fXg==
X-Received: by 10.66.136.41 with SMTP id px9mr6658384pab.80.1460485538674;
	Tue, 12 Apr 2016 11:25:38 -0700 (PDT)
Received: from mediabox.local (71-17-245-40.sktn.hsdb.sasknet.sk.ca.
	[71.17.245.40]) by smtp.gmail.com with ESMTPSA id
	ud5sm45385274pac.11.2016.04.12.11.25.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 12 Apr 2016 11:25:38 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Apr 2016 12:25:32 -0600
Message-Id: <1460485532-13735-3-git-send-email-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1460485532-13735-1-git-send-email-danismostlikely@gmail.com>
References: <1460485532-13735-1-git-send-email-danismostlikely@gmail.com>
Subject: [PATCH 3/3] git: update to 2.8.1
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
X-List-Received-Date: Tue, 12 Apr 2016 18:25:38 -0000

From: Dan McGregor <dan.mcgregor@usask.ca>

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta/recipes-devtools/git/git_2.7.2.bb | 11 -----------
 meta/recipes-devtools/git/git_2.8.1.bb | 11 +++++++++++
 2 files changed, 11 insertions(+), 11 deletions(-)
 delete mode 100644 meta/recipes-devtools/git/git_2.7.2.bb
 create mode 100644 meta/recipes-devtools/git/git_2.8.1.bb

diff --git a/meta/recipes-devtools/git/git_2.7.2.bb b/meta/recipes-devtools/git/git_2.7.2.bb
deleted file mode 100644
index 3fd7151..0000000
--- a/meta/recipes-devtools/git/git_2.7.2.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require git.inc
-
-EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
-                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
-                 "
-EXTRA_OEMAKE += "NO_GETTEXT=1"
-
-SRC_URI[tarball.md5sum] = "162ddc6c9b243899ad67ebd6b1c166b1"
-SRC_URI[tarball.sha256sum] = "58959e3ef3046403216a157dfc683c4d7f0dd83365463b8dd87063ded940a0df"
-SRC_URI[manpages.md5sum] = "7bb067d6363f537b92c3b8b813ff9ed6"
-SRC_URI[manpages.sha256sum] = "e6b5481fd6e24a1d1b155ef17363b313d47025bf6da880737fa872ab78e24f15"
diff --git a/meta/recipes-devtools/git/git_2.8.1.bb b/meta/recipes-devtools/git/git_2.8.1.bb
new file mode 100644
index 0000000..8978b72
--- /dev/null
+++ b/meta/recipes-devtools/git/git_2.8.1.bb
@@ -0,0 +1,11 @@
+require git.inc
+
+EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
+                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
+                 "
+EXTRA_OEMAKE += "NO_GETTEXT=1"
+
+SRC_URI[tarball.md5sum] = "1a12555182c1e9f781bc30a5c5f9515e"
+SRC_URI[tarball.sha256sum] = "cfc66324179b9ed62ee02833f29d39935f4ab66874125a3ab9d5bb9055c0cb67"
+SRC_URI[manpages.md5sum] = "60552f15a90b9fcdc1b92b222e2d2379"
+SRC_URI[manpages.sha256sum] = "df46de0c172049f935cc3736361b263c5ff289b77077c73053e63ae83fcf43f4"
-- 
2.8.1


