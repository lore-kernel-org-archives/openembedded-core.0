Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id C21B36CBD7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2014 21:07:40 +0000 (UTC)
Received: by mail-we0-f175.google.com with SMTP id p61so7448611wes.34
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2014 13:07:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=+15R9sHAKMJL9zGn8enADKnLEtrsgg2v8IlxzSdFACg=;
	b=UvojUFXa2zC+oRAvD3iLR6UMp6U0RhAu46xejd+0EqxfCUKVhzyLsTPNvV0gMMERXA
	8/Ffu643sWImE8d9rn/BOKO/kdhkfcr2aeaHuDA6i5XwAYj5/nS6j+li5eyv7ncl8dNf
	+zhHvTkapEuM1vXLvJEdLkqUoNTJq4CXLg1f9044JKNNMJWqYNadN2JKAzyCre3XvErN
	UgxTA3Qcpop58uos5DK6N+H6oiPih0kZ1i3THxP4TD9ZrdI7miLYfXIh6rIGoxLgKkM8
	UOJPsbMcxUOMVrEU5uJzCBmqY9qByOJgdfFLjJi4lrjjU4RDKFkEqUm3yjgqjB+oEEMj
	d4kw==
X-Gm-Message-State: ALoCoQl8joYA1l63vZ/gEZLhoiwf3HD69oHoHId7iIpQpEuQkinnD7V2qqzDZDRc+f/0ojF/7TXA
X-Received: by 10.194.71.47 with SMTP id r15mr3249346wju.19.1390252061457;
	Mon, 20 Jan 2014 13:07:41 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id n3sm5061547wix.10.2014.01.20.13.07.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Jan 2014 13:07:40 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jan 2014 21:07:34 +0000
Message-Id: <1390252054-9399-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1390252054-9399-1-git-send-email-ross.burton@intel.com>
References: <1390252054-9399-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 3/3] libxcb: upgrade to 1.10
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
X-List-Received-Date: Mon, 20 Jan 2014 21:07:41 -0000

Remove spurious libxcb-xinerama addition to PACKAGES, this is handled by the
dynamic split_packages() now.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-lib/libxcb_1.10.bb  |   10 ++++++++++
 meta/recipes-graphics/xorg-lib/libxcb_1.9.3.bb |   12 ------------
 meta/recipes-graphics/xorg-lib/libxcb_git.bb   |    2 --
 3 files changed, 10 insertions(+), 14 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxcb_1.10.bb
 delete mode 100644 meta/recipes-graphics/xorg-lib/libxcb_1.9.3.bb

diff --git a/meta/recipes-graphics/xorg-lib/libxcb_1.10.bb b/meta/recipes-graphics/xorg-lib/libxcb_1.10.bb
new file mode 100644
index 0000000..d88b025
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libxcb_1.10.bb
@@ -0,0 +1,10 @@
+include libxcb.inc
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d763b081cb10c223435b01e00dc0aba7"
+
+
+DEPENDS += "libxdmcp"
+
+SRC_URI[md5sum] = "074c335cc4453467eeb234e3dadda700"
+SRC_URI[sha256sum] = "98d9ab05b636dd088603b64229dd1ab2d2cc02ab807892e107d674f9c3f2d5b5"
diff --git a/meta/recipes-graphics/xorg-lib/libxcb_1.9.3.bb b/meta/recipes-graphics/xorg-lib/libxcb_1.9.3.bb
deleted file mode 100644
index 7374f10..0000000
--- a/meta/recipes-graphics/xorg-lib/libxcb_1.9.3.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-include libxcb.inc
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d763b081cb10c223435b01e00dc0aba7"
-
-
-DEPENDS += "libxdmcp"
-
-PACKAGES =+ "libxcb-xinerama"
-
-SRC_URI[md5sum] = "1ca999ca94f760d917ef2d8466a88742"
-SRC_URI[sha256sum] = "aad09d223fcb5bd345ce4d1737f178a557b6f2e201128e1ee3c83af46028018b"
diff --git a/meta/recipes-graphics/xorg-lib/libxcb_git.bb b/meta/recipes-graphics/xorg-lib/libxcb_git.bb
index 1482b7a..186636e 100644
--- a/meta/recipes-graphics/xorg-lib/libxcb_git.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcb_git.bb
@@ -8,5 +8,3 @@ PR = "r1"
 
 SRC_URI = "git://anongit.freedesktop.org/git/xcb/libxcb"
 S = "${WORKDIR}/git"
-
-PACKAGES =+ "libxcb-xinerama"
-- 
1.7.10.4


