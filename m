Return-Path: <paul@betafive.co.uk>
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
	[64.147.123.21])
	by mail.openembedded.org (Postfix) with ESMTP id 147D07F692
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2019 22:31:26 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id 2A4B978A;
	Tue, 12 Nov 2019 17:31:28 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
	by compute1.internal (MEProxy); Tue, 12 Nov 2019 17:31:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=betafive.co.uk;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=fm3; bh=tPASZsKXWuTff
	nxX/iTXJp3QcW//MELqOfkN7+kr3Q0=; b=sAxK/Lm8pdVxpLK0MtrKRjg58kZS4
	aTx++hzUMRXkwWm3d8XVp8arVbEFYNUasIcLdISDlYpAL+A0QB0JfqaG9zN39Hn6
	OgxsCX7hKGv36dMkS+ddNyDXPi0G7K9PqUTcS6MTtUQBVuFEeh+Mg+HG9JdOGG/q
	N1e9eExh62To210sfEJyjf53dHsQ8m/ZJj33KQ30wP9pMURMqENStWJFQ1dGLmyt
	0IPspnWwdWwMoEjU28Cwh5pxvHWe8pZhdpQKSyXXPmNp3dViljMNmM+Kiko7CARY
	ngwrN8+x61Z2h2T6VV9mSyiW5q52Dx7u04vEKhrTZS0pBGMqkZ8i9NtLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; bh=tPASZsKXWuTffnxX/iTXJp3QcW//MELqOfkN7+kr3Q0=; b=QrJ/tVgc
	GmBYCk/vi9uHic7xpoGAV4OfDde+NpQXTA4iRCey7PH24mjJe1s2lpfVHjmK7+zO
	S9weMFneL5rKkaPMaLhfgV71KMRxNnOijFlZ8pAufHmiVrb2QAq6ep8NXA/eS/QW
	KSku3xpyeF5vugPh2ZSy1jgK+W5wZEeN9YRSYzHbzlf0YnXcxIPflUHHtxkzejIT
	H/864whykrmgmFLq1GLzFZobQeDBBbA6fAG7z0807tLttMqT+KhhjoDbBtyQvXfC
	GG8PyZgawv06wtf0tFkVjoGlCYl3Yf5490rFJnndULXE6W0Ax3zUsIbjcnubXEWV
	+b5RKlqIDwC6tg==
X-ME-Sender: <xms:vzLLXTDbRp--9hHuewi4FsXxzy5-xvGVyoDbzVPP393mSozNHniSVg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedruddvledgudeigecutefuodetggdotefrod
	ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
	necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
	ertdertddtnecuhfhrohhmpefrrghulhcuuegrrhhkvghruceophgruhhlsegsvghtrghf
	ihhvvgdrtghordhukheqnecukfhppedvudefrdegkedruddurddugeelnecurfgrrhgrmh
	epmhgrihhlfhhrohhmpehprghulhessggvthgrfhhivhgvrdgtohdruhhknecuvehluhhs
	thgvrhfuihiivgeptd
X-ME-Proxy: <xmx:vzLLXYd4g76bw6pS4nl5c3XVq-3Gt-GAHfsmZtUAhR3eOVf-zTEScA>
	<xmx:vzLLXaoOYp6Xmi6AbXpNBVwYv5fqnFlBEK47OmElqU5NljuQMVpyeQ>
	<xmx:vzLLXZRqiNrgii4GL-mhbKJijlooEJzjbN3jyPq3pQkQtbRMlN_V1w>
	<xmx:vzLLXc2be8TzOfnodd1ubxkSP8oTYjNVZ04m_yYH1lDG0Mnn6dksFg>
Received: from arch0.home.b5net.uk (unknown [213.48.11.149])
	by mail.messagingengine.com (Postfix) with ESMTPA id 02DE880061;
	Tue, 12 Nov 2019 17:31:26 -0500 (EST)
From: Paul Barker <paul@betafive.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Nov 2019 22:31:19 +0000
Message-Id: <20191112223119.47941-2-paul@betafive.co.uk>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191112223119.47941-1-paul@betafive.co.uk>
References: <20191112223119.47941-1-paul@betafive.co.uk>
MIME-Version: 1.0
Subject: [PATCH 1/1] cdrtools-native: Don't set uid/gid during install
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
X-List-Received-Date: Tue, 12 Nov 2019 22:31:27 -0000
Content-Transfer-Encoding: 8bit

This is a native recipe so won't be installed as root.

If the string 'root' is part of the username then the install script
can get tricked into thinking we are root (regardless of the actual
uid or permissions) resulting in attempts to run chown/chgrp
inappropriately.

Signed-off-by: Paul Barker <paul@betafive.co.uk>
---
 ...001-Don-t-set-uid-gid-during-install.patch | 27 +++++++++++++++++++
 .../cdrtools/cdrtools-native_3.01.bb          |  5 +++-
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/cdrtools/cdrtools-native/0001-Don-t-set-uid-gid-during-install.patch

diff --git a/meta/recipes-devtools/cdrtools/cdrtools-native/0001-Don-t-set-uid-gid-during-install.patch b/meta/recipes-devtools/cdrtools/cdrtools-native/0001-Don-t-set-uid-gid-during-install.patch
new file mode 100644
index 0000000000..06d73df82b
--- /dev/null
+++ b/meta/recipes-devtools/cdrtools/cdrtools-native/0001-Don-t-set-uid-gid-during-install.patch
@@ -0,0 +1,27 @@
+From 529cd5b007aa681c3ca14e5ab1e30469dd51646b Mon Sep 17 00:00:00 2001
+From: Paul Barker <paul@betafive.co.uk>
+Date: Tue, 12 Nov 2019 22:17:19 +0000
+Subject: [PATCH] Don't set uid/gid during install
+
+Signed-off-by: Paul Barker <paul@betafive.co.uk>
+Upstream-status: Inappropriate [native]
+---
+ RULES/rules.prg | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/RULES/rules.prg b/RULES/rules.prg
+index 023555c..f70f1a7 100644
+--- a/RULES/rules.prg
++++ b/RULES/rules.prg
+@@ -94,7 +94,7 @@ INSGRP=		$(__DEFINSGRP:$(_UNIQ)%=%)
+ 
+ LD=		@echo "	==> LINKING   \"$@\""; ld
+ LOCALIZE=	@echo "	==> LOCALIZING \"$@\""; $(RM_F) $@; cp
+-INSTALL=	@echo "	==> INSTALLING \"$@\""; sh $(SRCROOT)/conf/install-sh -c -m $(INSMODEINS) -o $(INSUSR) -g $(INSGRP)
++INSTALL=	@echo "	==> INSTALLING \"$@\""; sh $(SRCROOT)/conf/install-sh -c -m $(INSMODEINS)
+ CHMOD=		@echo "	==> SETTING PERMISSIONS ON \"$@\""; chmod
+ CHOWN=		@echo "	==> SETTING OWNER ON \"$@\""; chown
+ CHGRP=		@echo "	==> SETTING GROUP ON \"$@\""; chgrp
+-- 
+2.24.0
+
diff --git a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
index 78e1565e47..1c602e7ce7 100644
--- a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
+++ b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
@@ -7,7 +7,10 @@ SECTION = "console/utils"
 LICENSE = "GPLv2 & CDDL-1.0 & LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=32f68170be424c2cd64804337726b312"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/cdrtools/cdrtools-${REALPV}.tar.bz2"
+SRC_URI = " \
+	${SOURCEFORGE_MIRROR}/project/cdrtools/cdrtools-${REALPV}.tar.bz2 \
+	file://0001-Don-t-set-uid-gid-during-install.patch \
+	"
 UPSTREAM_VERSION_UNKNOWN = "1"
 
 SRC_URI[md5sum] = "7d45c5b7e1f78d85d1583b361aee6e8b"
-- 
2.24.0


