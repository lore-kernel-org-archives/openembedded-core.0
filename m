Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id 3DBCE7FDED
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2020 20:26:40 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id q9so4408244wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2020 12:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=QrX3puzFbSY3PCefem4q2Ru8SYspxHWbPag0bf6UCFY=;
	b=mjCO5anWxb/2Gnr61lmtf7VWfdSCOK17fC+Y0rQPrKHlcbNStz+TTRz93xuNPgGr10
	LiZWiH5r5g+4QDAyF6gdkAMI9RB/J25OwdXtrlxA7m8KORY4RQnU4eNfRIIuR7KrthSZ
	3MGLSTqTTilo1iJnMLhWteGPLiAlUgNj/Rx0lvYF3LwJ420hUyx7Ual/C61pxO/v4Rj0
	JmIIzs5FOURFskBkWAMR1mx1lS379t4QvYeXD6KtSbtd57UcNUDa2fb6CvgCnkUzjQOh
	omMe8I1exg/QE3ndytNgzlqDEb0mJVxpVbaVakldAKVTXKK6E0tJIuFyMJ+pmBlaMxcH
	OSoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=QrX3puzFbSY3PCefem4q2Ru8SYspxHWbPag0bf6UCFY=;
	b=PHHTUAwimqhQ/dt/u6y50JpD66EJF8AWN/ZTWWgzc4ss0qhkfW2w2QMrcVbpppkb1c
	XVBdCQlfWGkdP04NE5rWYgTOe7yfXK47o3sS7ZIWe4R10hrOkCfom6GC5fvCR7mgY0tk
	WU4C15BOhjWxL+jUnD3mEsdVsTqalmH2LVxTudMBOCeUq15+PtbVvzgZoAYQperq48YW
	ctUoLdYDfEoi3UoViaihsjOTpcyafbXWilY1SYg7R5OMx0Z+W5U8SvIpEx60r5CGlYLT
	yfQy+lvVu5JQMKRqKyzqwsj9l9FC8HhsgOkFJyVy2n98HbI/cKsO2XcHSk4QIvlCZu6Z
	scww==
X-Gm-Message-State: APjAAAVIzztBddZg9GfEHIxJXobvJuYGYTvXrqSu7JD98XbdSOGtWe9t
	7ejquvKs0WX19fE0nvV+VpqF5O10JFg=
X-Google-Smtp-Source: APXvYqyo7gUcbahcjQE1GHAWihu8719vrtjil8tfR1J0DM6ErZAio73oorvhlXkAAj/2T0qw8vUaIA==
X-Received: by 2002:a1c:c919:: with SMTP id f25mr6676121wmb.49.1578601600715; 
	Thu, 09 Jan 2020 12:26:40 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0446528B12EBEBA10192C2.dip0.t-ipconnect.de.
	[2003:f0:7f04:4652:8b12:ebeb:a101:92c2])
	by smtp.gmail.com with ESMTPSA id z6sm9149986wrw.36.2020.01.09.12.26.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 09 Jan 2020 12:26:40 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jan 2020 21:26:20 +0100
Message-Id: <20200109202623.28936-9-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200109202623.28936-1-schnitzeltony@gmail.com>
References: <20200109202623.28936-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 08/11] gcr: add mime to inherit
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
X-List-Received-Date: Thu, 09 Jan 2020 20:26:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

gcr installs mime types we want in our mime-database

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta/recipes-gnome/gcr/gcr_3.34.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gcr/gcr_3.34.0.bb b/meta/recipes-gnome/gcr/gcr_3.34.0.bb
index e3e8999635..272112dd12 100644
--- a/meta/recipes-gnome/gcr/gcr_3.34.0.bb
+++ b/meta/recipes-gnome/gcr/gcr_3.34.0.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
 DEPENDS = "gtk+3 p11-kit glib-2.0 libgcrypt \
            ${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'libxslt-native', '', d)}"
 
-inherit gnomebase gtk-icon-cache gtk-doc features_check upstream-version-is-even vala gobject-introspection gettext
+inherit gnomebase gtk-icon-cache gtk-doc features_check upstream-version-is-even vala gobject-introspection gettext mime
 # depends on gtk+3, but also x11 through gtk+-x11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-- 
2.21.0


