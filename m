Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 0F7776A4BC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 13:56:28 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id hi5so4587775wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 06:56:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=RPe9gN6ftsOEB4xPY7RhixMKkPe0hpGbNCbJw50rEgU=;
	b=VBMOgAxSZmea4qvPdAB7qKo51aw2tKumI69jiAh/cBUhB0rhFxOHBtwaLP6gewIxb4
	9TGdCZSq7fvViiif8Ci6rPtmxeRfGiY/gOt2bkrC4OjWY7gxv3KDVukw/n8RmOnQUNFd
	X3Gqhywh4QYs9n/z2bgNaS1rZ2hNAxnpQxyEO5Yw3IUXMpESUfQDy67EjKjOoYcdQmbK
	B1o2EAOpyZ/A2L3BiAsQYAklbHNwWhJ+kQWWnNUc11xiBdtoMq00C3lzlGfwIjbAJYwH
	B4ovRhGKTUdBvers8Jcr8B6BHwjWPGuZventH8MmtKfIHtnbr79OH9iJZvtf1psMuOi8
	CTIQ==
X-Received: by 10.180.93.74 with SMTP id cs10mr18670216wib.42.1369922189720;
	Thu, 30 May 2013 06:56:29 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	fu14sm38247963wic.0.2013.05.30.06.56.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 30 May 2013 06:56:28 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 May 2013 14:52:46 +0100
Message-Id: <68db85f8f3f742e7faa676f649935e1494cb4927.1369921759.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1369921759.git.ross.burton@intel.com>
References: <cover.1369921759.git.ross.burton@intel.com>
In-Reply-To: <cover.1369921759.git.ross.burton@intel.com>
References: <cover.1369921759.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmDmIdM8/c+4Ueki0YzoDqdKA343Ax3X/fXj484s6ihbldLrN4T7cmVRPYSwqBvcu/muCkS
Subject: [PATCH 12/14] gtk+3: register GSetting schemas
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
X-List-Received-Date: Thu, 30 May 2013 13:56:29 -0000

The schemas were not being registered, which resulted in a crash when using the
file chooser or colour picker widgets.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb b/meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb
index 9dff4a5..8f254fb 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb
@@ -23,7 +23,7 @@ SRC_URI = "http://download.gnome.org/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar.xz \
 SRC_URI[md5sum] = "8e878e18fc385f2b813419dc7b40a968"
 SRC_URI[sha256sum] = "1ca80c9c15a1df95d74cefb8c2afe4682ba272a4b489106f04877be2a7aff297"
 
-inherit autotools pkgconfig gtk-doc update-alternatives gtk-immodules-cache
+inherit autotools pkgconfig gtk-doc update-alternatives gtk-immodules-cache gsettings
 
 S = "${WORKDIR}/gtk+-${PV}"
 
-- 
1.7.10.4


