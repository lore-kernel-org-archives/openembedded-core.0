Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id DFDCD7D53E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Apr 2019 06:37:59 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id h18so5885178wml.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Apr 2019 23:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=IeuQ1pdn1kilH6jv0fPNvGA7D8J4RsEFPsUy3zGqROA=;
	b=uy1Lm2zCWW/SZsFO1UdrHQyjZQ/i5JKci2ZQBon31jaZSn1K8x/Ua3+Y7m91wFTlfL
	DkfaR6esqGfT6kls3Uvd2IGS2LOuaKWaiIFWHK6JUNZyyS8bdzkEWnUh0DzVk5huLT+o
	LZNtTuz9e2bAXYh1iU1uoWRt316HSMhW61hIMBrj8TmGtdbbncnQqWE6oW28C0oHWxzx
	urjsp+HxmndCTjki00crhf7rV1j8aDqg3rL/ZaI1ei0t7IspWb//YFVFxagOcWEaoaZG
	PLKhoXbRGmoJq7Yk8dphSS5WqPJRspI0QfkJ8aHfm0b+UA4tNsHcHI9WdSm7xKn8Oza+
	nfoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=IeuQ1pdn1kilH6jv0fPNvGA7D8J4RsEFPsUy3zGqROA=;
	b=AfX4VnTKLxbVc2CaJm1I23CWZXa0U7meg3CwBWtd4LTM7RhqrPcvhoS/4FUVQ1W7Z4
	/UuUd4R9SxfYqVsulAf8iz5C7qZDZAEvtHtEmYfVAAphLiVkQ2gO5nGEFgfaZwolrSAN
	3/duaiLBq+5Mbx1ggHUyjOy8m9BGpM+TEAntFIG/JBX2iIvLtoLy+Yql3585aKk3P32S
	+6um/cKjo3DrkoB/gV4o86ppz747nwG3dyM0eAa12mgmaUKsRnKHxAkBLC0CGT4ihrx8
	xS+cpxi6UyivPyuF0JRDhqIN8/Gtm+wPOj/qJD2NrrJQdK2h/hyft4oPSM56EtNO7RW4
	iJxA==
X-Gm-Message-State: APjAAAXYzz5izyN9x7JaLfaRB5vZ7nmH2JEqFcyH1rpNgNM2SQ7HYkBY
	fpD8OkuoxLCPpKds2riNxkF2Oa8E
X-Google-Smtp-Source: APXvYqxVhbq/VkG0HB5s7OZAVlEBhLs3HqL9ZljdueyVXUjwyh/dIJrb9dnL4Yrln9g9W1Ytn+ls4w==
X-Received: by 2002:a7b:c769:: with SMTP id x9mr6773848wmk.103.1554446280492; 
	Thu, 04 Apr 2019 23:38:00 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F05D917A4978A6EAA704508.dip0.t-ipconnect.de.
	[2003:f0:7f05:d917:a497:8a6e:aa70:4508])
	by smtp.gmail.com with ESMTPSA id
	g132sm1185443wme.3.2019.04.04.23.37.59
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 04 Apr 2019 23:37:59 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org,
	alex.kanavin@gmail.com
Date: Fri,  5 Apr 2019 08:37:36 +0200
Message-Id: <20190405063736.29750-14-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190405063736.29750-1-schnitzeltony@gmail.com>
References: <20190405063736.29750-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 13/13] gst-plugins: move 'inherit gobject-introspection' to recipes supporting GI
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
X-List-Received-Date: Fri, 05 Apr 2019 06:38:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Now that whitelisting for unknown configure options was removed in
gobject-introspection.bbclass gstreamer1.0-plugins-ugly/-good start complaining

| ERROR: gstreamer1.0-plugins-ugly-1.14.4-r0 do_configure: QA Issue: gstreamer1.0-plugins-ugly: configure was passed unrecognised options: --enable-introspection [unknown-configure-option]
| ERROR: gstreamer1.0-plugins-good-1.14.4-r0 do_configure: QA Issue: gstreamer1.0-plugins-good: configure was passed unrecognised options: --enable-introspection [unknown-configure-option]

So let only those gst-plugin recipes inherit gobject-introspection whose sources
support GI.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../gstreamer/gstreamer1.0-plugins-bad_1.14.4.bb                | 2 +-
 .../gstreamer/gstreamer1.0-plugins-base_1.14.4.bb               | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.4.bb
index 4987be865b..23d093d47c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.4.bb
@@ -20,7 +20,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=73a5855a8119deb017f5f13cf327095d \
 
 DEPENDS += "gstreamer1.0-plugins-base"
 
-inherit gettext bluetooth
+inherit gettext bluetooth gobject-introspection
 
 PACKAGECONFIG ??= " \
     ${GSTREAMER_ORC} \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.14.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.14.4.bb
index 12c9bbce9d..f3e6daf564 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.14.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.14.4.bb
@@ -28,7 +28,7 @@ S = "${WORKDIR}/gst-plugins-base-${PV}"
 
 DEPENDS += "iso-codes util-linux"
 
-inherit gettext
+inherit gettext gobject-introspection
 
 PACKAGES_DYNAMIC =+ "^libgst.*"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
index 5906e4ad36..bc24b05fec 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
@@ -7,7 +7,7 @@ DEPENDS = "gstreamer1.0 glib-2.0-native"
 
 SRC_URI_append = " file://gtk-doc-tweaks.patch"
 
-inherit autotools pkgconfig upstream-version-is-even gobject-introspection gtk-doc
+inherit autotools pkgconfig upstream-version-is-even gtk-doc
 
 acpaths = "-I ${S}/common/m4 -I ${S}/m4"
 
-- 
2.20.1


