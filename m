Return-Path: <pespin.shar@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 71FDF6FFFB
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 19:14:38 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id n205so11548791wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 12:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=dX9h0plMCn1aJjNubPYZzfetoHmQJFisTt8Q9/CEaLc=;
	b=mipic3z6GhDVdV0vR0AJHBLthXdh+yRY20OAfQCWNzXndHUXBODQNRiSgScZ3jEuno
	EngNGGcSp/ovW+ozGdH+om95c6dS2J93jr9c+XImO5ix0vkMXEqJ6Sl6bWP/FrMo+AMf
	Fs1FSoTIAxJoJNaqRFrTwJLrYabeDAH+rqw3MaRTFmjOJmk2jvgl4leIqCoCXqN/aYPY
	78qbB3oQPnHoOodpQFmumhK2Qw3OfMN3NQK7VSxd9qWBTXVq54vDyvYn8L+eObvSrrHl
	ihi5asDWpi2VZwrXY83C9ITCj8pjGxTNUJSt31H0xAyNf4OLE0OUZJhRseAaRR2vwtZq
	FXKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=dX9h0plMCn1aJjNubPYZzfetoHmQJFisTt8Q9/CEaLc=;
	b=FA1kahNazev74lGHinuHKAVxaDmkLO6skdy0FS+1yYF3psskUBza1mCCNB5//G0rkJ
	Ukp9P0v/266nkJyreMO5taX57NKj0U1ZklRX7dGllnAuv6Y9uFTBzCNh4ugusCshzTTL
	DOaGWhlBFsRgX7/fbvx1nyWUmYy2bUD+Id9QDFL97C7AttCVjKLVUzQ5YSmx89IlPeXM
	+LETEkah9ZOi6iOL6tKS646ws+QoR8bL18JvDqf1wJswH1fUiX15Hc+ZRDAXa+53escL
	TUuWLjmgEe+S8d3IwrrJrFBF38yH4eR3YQiST0kqI8alzG/6fHlL3zSUyk08tQqrsxLW
	O0/A==
X-Gm-Message-State: AD7BkJJxkozWz8jbYpxXZyKAH/NrIdtnp+4I2nLIaJcJnqywy1xRphPviCnW//PmHd+6cg==
X-Received: by 10.194.179.227 with SMTP id dj3mr20381689wjc.50.1457896479077; 
	Sun, 13 Mar 2016 12:14:39 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1811:c1f:3300:9248:9aff:fe94:7ff1])
	by smtp.gmail.com with ESMTPSA id
	n66sm12851410wmg.20.2016.03.13.12.14.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 13 Mar 2016 12:14:38 -0700 (PDT)
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 13 Mar 2016 20:13:02 +0100
Message-Id: <72ed143929fdbc5ab4b4bbdccf991d286d9abb98.1457896224.git.pespin.shar@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
Subject: [PATCH 04/42] avahi: Fix usage of systemd unitdir vars
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
X-List-Received-Date: Sun, 13 Mar 2016 19:14:38 -0000

Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
---
 meta/recipes-connectivity/avahi/avahi.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
index 81aad79..aaccb75 100644
--- a/meta/recipes-connectivity/avahi/avahi.inc
+++ b/meta/recipes-connectivity/avahi/avahi.inc
@@ -56,7 +56,7 @@ EXTRA_OECONF = "--with-avahi-priv-access-group=adm \
 
 # The distro choice determines what init scripts are installed
 EXTRA_OECONF_SYSVINIT = "${@bb.utils.contains('DISTRO_FEATURES','sysvinit','--with-distro=debian','--with-distro=none',d)}"
-EXTRA_OECONF_SYSTEMD = "${@bb.utils.contains('DISTRO_FEATURES','systemd','--with-systemdsystemunitdir=${systemd_unitdir}/system/','--without-systemdsystemunitdir',d)}"
+EXTRA_OECONF_SYSTEMD = "${@bb.utils.contains('DISTRO_FEATURES','systemd','--with-systemdsystemunitdir=${systemd_system_unitdir}/','--without-systemdsystemunitdir',d)}"
 
 AVAHI_GTK ?= "--disable-gtk --disable-gtk3"
 
-- 
2.7.1


