Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7B3C17700A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Jan 2016 23:10:24 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id q184so3930497qkb.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Jan 2016 15:10:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=OZW6FU7xddDCjzyKZFxcS27CYUVeploFf2ciAct0NfQ=;
	b=IKoyvEXtXBCFBheby2AER8qKzqSCo6b7xlBGjVnSiAHGxVPOwysXTaCPNgHvgvsjQh
	pPk40o0QRTO0RJoR5PIbyQbzHPZM2NE/eBpKC5wz0GwwiVZMpfrM2Zd7wIBwGWZ902wU
	/DDHlxcfFtJZ71avfc+TqhX8OWPs7+r3BDWWZ+0XfxZnCfRFwprMMIwH5gFP/tgIpsGu
	JgJoSOAdQG275o56dfQm6mm1x/y4fT9UACROsS8JnRa+YjSHYbrx2KMIfCKax+CWhBKt
	NJZV3p2MWFHIPQYIrPRqgljVVRWHrmIqdfbfUoYq87W8AsCAo2UnrgpMMEghvy90u07l
	zjUA==
X-Gm-Message-State: AG10YOSZQqusHpn/6BVQfMN3w/wILOw/STA2qGi3feCBf3CY/692FJE/RAyI8w6iVBSMPQ==
X-Received: by 10.55.20.211 with SMTP id 80mr12542200qku.67.1453590625252;
	Sat, 23 Jan 2016 15:10:25 -0800 (PST)
Received: from build-slave.star.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id 67sm5769501qht.14.2016.01.23.15.10.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 23 Jan 2016 15:10:24 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Date: Sat, 23 Jan 2016 18:10:09 -0500
Message-Id: <e85a1fb72d85bbc617b33ec8962a56136aee9126.1453589999.git.derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1453589999.git.derek@asterius.io>
References: <cover.1453589999.git.derek@asterius.io>
In-Reply-To: <cover.1453589999.git.derek@asterius.io>
References: <cover.1453589999.git.derek@asterius.io>
Subject: [meta-python][PATCH 12/13] python-feedparser: update to 5.2.1
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
X-List-Received-Date: Sat, 23 Jan 2016 23:10:28 -0000

---
 .../recipes-devtools/python/python-feedparser_5.1.3.bb     | 14 --------------
 .../recipes-devtools/python/python-feedparser_5.2.1.bb     |  9 +++++++++
 2 files changed, 9 insertions(+), 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-feedparser_5.1.3.bb
 create mode 100644 meta-python/recipes-devtools/python/python-feedparser_5.2.1.bb

diff --git a/meta-python/recipes-devtools/python/python-feedparser_5.1.3.bb b/meta-python/recipes-devtools/python/python-feedparser_5.1.3.bb
deleted file mode 100644
index 92d5568..0000000
--- a/meta-python/recipes-devtools/python/python-feedparser_5.1.3.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY = "Python Atom and RSS feed parser"
-HOMEPAGE = "http://code.google.com/p/feedparser"
-SECTION = "devel/python"
-LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=f5fbe7f8b71b4019eca5ac5f900fd8ad"
-
-SRC_URI = "http://feedparser.googlecode.com/files/feedparser-${PV}.tar.bz2"
-SRC_URI[md5sum] = "6fb6372a1dc2f56d4d79d740b8f49f25"
-SRC_URI[sha256sum] = "7f6507d400d07edfd1ea8205da36808009b0c539f5b8a6e0ab54337b955e6dc3"
-
-S = "${WORKDIR}/feedparser-${PV}"
-
-inherit setuptools
-
diff --git a/meta-python/recipes-devtools/python/python-feedparser_5.2.1.bb b/meta-python/recipes-devtools/python/python-feedparser_5.2.1.bb
new file mode 100644
index 0000000..fa4f97e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-feedparser_5.2.1.bb
@@ -0,0 +1,9 @@
+SUMMARY = "Python Atom and RSS feed parser"
+HOMEPAGE = "http://code.google.com/p/feedparser"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c21a7713ef6dc1b99644061c397e7c2a"
+
+SRC_URI[md5sum] = "d552f7a2a55e8e33b2a3fe1082505b42"
+SRC_URI[sha256sum] = "bd030652c2d08532c034c27fcd7c85868e7fa3cb2b17f230a44a6bbc92519bf9"
+
+inherit pypi setuptools
-- 
1.9.1


