Return-Path: <kergoth@gmail.com>
Received: from mail-oa0-f46.google.com (mail-oa0-f46.google.com
	[209.85.219.46])
	by mail.openembedded.org (Postfix) with ESMTP id 53AA96A9BE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 20:46:50 +0000 (UTC)
Received: by mail-oa0-f46.google.com with SMTP id h2so6646771oag.33
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 13:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=973vt+G9K2NlFF7gSbbP9EPrhs5ZqeN3sttehYpEXNs=;
	b=Jm2wq8S96Ciy7d9taTO0HXccWOoNXqjM/ZRuTxSUCt5K/tvZyPGsUZlV1homw+BpgQ
	TT0D99pKGduhCAgBgOTW/B9mhQDCviOMnr/nzBmjoG1FnWn6xGsFuOmbKkMps/nPS6m+
	u942h2Pj8accgWJqoH0C2ZYTCxtbyrYKRcm0ssN3jhifBlC5f0s7q2Qhog5sYH+cGCsx
	ovcJV01Xry7YoN6VjIjD3sFXMtOLDRwdA0AZgy5hQ60T69Zm0em5VvOX5UWzBlP7ijJ2
	t90vjk/9am2VswBtRVwq37C1owil3Cu0a62d9qkcx1AVdO6+y16bxOAQ00f3AId158kB
	tNOQ==
X-Received: by 10.60.138.234 with SMTP id qt10mr9757414oeb.118.1370897211344; 
	Mon, 10 Jun 2013 13:46:51 -0700 (PDT)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id z5sm24272820obw.4.2013.06.10.13.46.49
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 10 Jun 2013 13:46:50 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Jun 2013 13:46:50 -0700
Message-Id: <656575f44450526f8497de92ddf86c2322625609.1370896985.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.3
In-Reply-To: <cover.1370896985.git.chris_larson@mentor.com>
References: <cover.1370896985.git.chris_larson@mentor.com>
In-Reply-To: <cover.1370896985.git.chris_larson@mentor.com>
References: <cover.1370896985.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 2/4] gconf: inherit gettext
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
X-List-Received-Date: Mon, 10 Jun 2013 20:46:50 -0000

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


