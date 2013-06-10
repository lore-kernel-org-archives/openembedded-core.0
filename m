Return-Path: <kergoth@gmail.com>
Received: from mail-pb0-f53.google.com (mail-pb0-f53.google.com
	[209.85.160.53])
	by mail.openembedded.org (Postfix) with ESMTP id 649B66A8D9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 23:15:48 +0000 (UTC)
Received: by mail-pb0-f53.google.com with SMTP id xb12so7677154pbc.26
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 16:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=973vt+G9K2NlFF7gSbbP9EPrhs5ZqeN3sttehYpEXNs=;
	b=s8PQkUWaanJEkL6mU+/6qLkvjW97micWCK+58cKMUTPQAiPTvMnP8jgN3d+uU6haQI
	GXuWEOLlehf+algsPYE3BwlfcCvPD+3A6bEmH3jNFMoGTl1pCEfE2VGzJ3Jsl4anjd7p
	oJULM4GQlKV7PJdUwu2UrYFLXjuse9849hPGeehAu+kJx+NRPjK1ehO1XuYg8PSDKF+d
	DyQVQOWHeqfWryEcUxRKo1qtpLx+L5u2sDcicCWaPMdRz5epo3AbrBXJbGfYXsRKGfyQ
	cX5aCZcv+QjcS/PY060saA8bkK+FrM5BiQjXcmPU+CRXR6CgP4ZtckEV/iYNC+rapH5E
	S3ng==
X-Received: by 10.66.121.193 with SMTP id lm1mr15953904pab.138.1370906149453; 
	Mon, 10 Jun 2013 16:15:49 -0700 (PDT)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id
	nz3sm11887957pbb.33.2013.06.10.16.15.47 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 10 Jun 2013 16:15:48 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Jun 2013 16:15:48 -0700
Message-Id: <8cb8319692b620e2c52751b89a691dd6966ec950.1370906102.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.3
In-Reply-To: <cover.1370906102.git.chris_larson@mentor.com>
References: <cover.1370906102.git.chris_larson@mentor.com>
In-Reply-To: <cover.1370906102.git.chris_larson@mentor.com>
References: <cover.1370906102.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH v2 2/4] gconf: inherit gettext
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
X-List-Received-Date: Mon, 10 Jun 2013 23:15:48 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-gnome/gnome/gconf_3.2.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gnome/gconf_3.2.6.bb b/meta/recipes-gnome/gnome/gconf_3.2.6.bb
index a1843d5..9b22d95 100644
--- a/meta/recipes-gnome/gnome/gconf_3.2.6.bb
+++ b/meta/recipes-gnome/gnome/gconf_3.2.6.bb
@@ -8,7 +8,7 @@ DEPENDS_class-native = "glib-2.0-native dbus-native dbus-glib-native libxml2-nat
 
 PR = "r0"
 
-inherit gnomebase gtk-doc
+inherit gnomebase gtk-doc gettext
 
 SRC_URI = "${GNOME_MIRROR}/GConf/${@gnome_verdir("${PV}")}/GConf-${PV}.tar.xz;name=archive \
            file://remove_plus_from_invalid_characters_list.patch \
-- 
1.8.3


