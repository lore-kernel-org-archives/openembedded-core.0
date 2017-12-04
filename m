Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 501CF78568
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Dec 2017 10:24:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vB4AOLEQ025375
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Dec 2017 02:24:21 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.167) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Mon, 4 Dec 2017 02:24:20 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 4 Dec 2017 18:25:37 +0800
Message-ID: <ea2ba0a0f3b3b660be59b28ead48ec4cc49ea81b.1512383059.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1512383059.git.Qi.Chen@windriver.com>
References: <cover.1512383059.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] coreutils: add PACKAGECONFIG for single-binary
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
X-List-Received-Date: Mon, 04 Dec 2017 10:24:20 -0000
Content-Type: text/plain

Add PACKAGECONFIG for single-binray. Disable it by default.

When enabled, there would only be one binary file /usr/bin/coreutils, other
files like 'ls' are text files containing contents like:

  #!/usr/bin/coreutils --coreutils-prog-shebang=ls

And the size of the rpm package reduces from 849K to 519K.

Default to disable this option to keep the traditional behaviour.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/coreutils/coreutils_8.28.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/coreutils/coreutils_8.28.bb b/meta/recipes-core/coreutils/coreutils_8.28.bb
index 0543ceb..d55dbe1 100644
--- a/meta/recipes-core/coreutils/coreutils_8.28.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.28.bb
@@ -45,6 +45,7 @@ PACKAGECONFIG_class-native ??= "xattr"
 #
 PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl,"
 PACKAGECONFIG[xattr] = "--enable-xattr,--disable-xattr,attr,"
+PACKAGECONFIG[single-binary] = "--enable-single-binary,--disable-single-binary,,"
 
 # [ df mktemp base64 gets a special treatment and is not included in this
 bindir_progs = "arch basename chcon cksum comm csplit cut dir dircolors dirname du \
-- 
1.9.1


