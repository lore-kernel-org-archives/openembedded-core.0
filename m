Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id EF44E605BB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 11:58:16 +0000 (UTC)
Received: by wmec201 with SMTP id c201so22318120wme.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 03:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=cmGAJQ8PIC2+ZS2q4paScnHRB5n5yDmrphSIPVmdkkY=;
	b=xj3DorrxlMgUcqY6pvR+c8y8T8Z9g/R9iR6ESNeLBhd6Spwz5B17hJE+lwDJmJlBEg
	RlPwBTNdGEcXj8inpRe6iM5KWFpAlk7Og14nokMm+fXQ43SZ7WvqNsiN9pxW2p+MUM2K
	f0jzrMf+7utyV1yZ3x2GPITuNEZ6QQ3jNqHbXYtQGxKGbCS7SxowHiGdfeTcC7GV8Vk1
	raOpqy32l6TDIlrem779ujtl6xmphzrbZWiDEMa5sISO4eup6HVLITkEb0FtJWSegAEd
	UUDMK0uisyZYRELhLs/PVNoRG+A4ZewEk4nRODbgA7GzU1/SMpBfStUmIU/SUlV5+Qzp
	jDoA==
X-Received: by 10.194.86.161 with SMTP id q1mr50782138wjz.88.1447761497299;
	Tue, 17 Nov 2015 03:58:17 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	q77sm22371608wmd.22.2015.11.17.03.58.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Nov 2015 03:58:16 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Nov 2015 11:58:07 +0100
Message-Id: <9d1ab0ab809d39baf00dbabd33b7fcda469a6f42.1447757562.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <cover.1447757562.git.Martin.Jansa@gmail.com>
References: <cover.1447757562.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1447757562.git.Martin.Jansa@gmail.com>
References: <cover.1447757562.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 15/16] libsecret: add dependency on intltool-native
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
X-List-Received-Date: Tue, 17 Nov 2015 11:58:17 -0000

From: Joe Slater <jslater@windriver.com>

intltoolize is needed by configure.

Signed-off-by: Joe Slater <jslater@windriver.com>
Acked-By: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-gnome/libsecret/libsecret_0.18.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/libsecret/libsecret_0.18.2.bb b/meta/recipes-gnome/libsecret/libsecret_0.18.2.bb
index 8fc0018..a1dcc78 100644
--- a/meta/recipes-gnome/libsecret/libsecret_0.18.2.bb
+++ b/meta/recipes-gnome/libsecret/libsecret_0.18.2.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=23c2a5e0106b99d75238986559bb5fc6"
 
 inherit gnomebase gtk-doc
 
-DEPENDS = "glib-2.0 libgcrypt gettext-native"
+DEPENDS = "glib-2.0 libgcrypt gettext-native intltool-native"
 
 EXTRA_OECONF += "--disable-manpages"
 
-- 
2.6.3


