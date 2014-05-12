Return-Path: <martin.jansa@gmail.com>
Received: from mail-la0-f46.google.com (unknown [209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id 96EC96605B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 11:34:41 +0000 (UTC)
Received: by mail-la0-f46.google.com with SMTP id ec20so1807351lab.33
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 04:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=/+fPwleku1wdBWx2TpY4GVPoUsW9hiE+eTEnJpHExg8=;
	b=KzGdN5VthT0Gu6skE1oqoCSQp3MkK8nt9lf7ElCBVfqTBoI39A88ASnJEI7hBaPzqV
	2AKjy+WIJZKLROMRGEVId+gRjAHe+XvO7uKyryQXxfaVGCC3uW1qP9jK16L0vxkgpN9x
	VjlOHwuvEI0woiYr7UMsYvPiJr2AGHBUU23hyepOpG4bLyHm8nNom7WB9xCCgs2NCjpy
	RB7+6H7xTel+yfQktrXkOwZChlK1/3JWTO5INgez9D8Bu3K+809+IIIctA5710oPmze8
	eBydcTESRyEw+ExB7V0ce1on9WwQn6c5Xq7OThCt5jn2x1soKb4gRt9ks3ETux9Emq9R
	Qcnw==
X-Received: by 10.152.5.4 with SMTP id o4mr898149lao.64.1399894482543;
	Mon, 12 May 2014 04:34:42 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	yr11sm1855801lbb.5.2014.05.12.04.34.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 May 2014 04:34:41 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 May 2014 13:34:51 +0200
Message-Id: <e052aa614dc2fd1c34aa52da5d8355d70af03c19.1399894447.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.2
In-Reply-To: <cover.1399894447.git.Martin.Jansa@gmail.com>
References: <cover.1399894447.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1399894447.git.Martin.Jansa@gmail.com>
References: <cover.1399894447.git.Martin.Jansa@gmail.com>
Subject: [daisy][PATCH 02/10] gsettings-desktop-schemas: add missing dependency on intltool-native
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
X-List-Received-Date: Mon, 12 May 2014 11:34:44 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* do_configure fails with:
  | NOTE: Executing intltoolize --copy --force --automake
  | /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/gsettings-desktop-schemas/3.10.1-r1/temp/run.do_configure.1111: 180:
  /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/gsettings-desktop-schemas/3.10.1-r1/temp/run.do_configure.1111:
   intltoolize: not found
  | WARNING: exit code 127 from a shell command.
  | ERROR: Function failed: do_configure (log file is located at
  /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/gsettings-desktop-schemas/3.10.1-r1/temp/log.do_configure.1111)
  NOTE: recipe gsettings-desktop-schemas-3.10.1-r1: task do_configure:

* introduced in:
  commit 1138976f7bdcd24ef57451a2c2ceffa43666610f
  Author: Alexandru Palalau <alexandrux.palalau@linux.intel.com>
  Date:   Tue Mar 11 13:27:46 2014 +0000

    gsettings-desktop-schemas: removed unneeded class inheritance

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-gnome/gnome/gsettings-desktop-schemas_3.10.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gnome/gsettings-desktop-schemas_3.10.1.bb b/meta/recipes-gnome/gnome/gsettings-desktop-schemas_3.10.1.bb
index 7217c66..eb09d2f 100644
--- a/meta/recipes-gnome/gnome/gsettings-desktop-schemas_3.10.1.bb
+++ b/meta/recipes-gnome/gnome/gsettings-desktop-schemas_3.10.1.bb
@@ -6,7 +6,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 PR = "r1"
 
-DEPENDS = "glib-2.0"
+DEPENDS = "glib-2.0 intltool-native"
 
 inherit gnomebase gsettings gettext
 
-- 
1.9.2


