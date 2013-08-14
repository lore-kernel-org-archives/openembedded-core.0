Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f45.google.com (mail-ee0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id C359F6B5FC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 11:13:06 +0000 (UTC)
Received: by mail-ee0-f45.google.com with SMTP id c50so4810777eek.18
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 04:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6XaVZhZI46PhL/5voofBtmc06ZhX7t4KKLyAgxUcGhQ=;
	b=tpBijknoQdSOX7VrS4O5bo7NhP2vouSzSxAzuZVSJdfRZUL7qRKXBkshHJFQF5mgQq
	oqrAJhPFNY7XtTn4/FMK2YmcpR9oCYrYzl95n2RRKbh6szQvuSiSZPj80MJmu7iCllzr
	5Vg1Sc/8KKDKuINkMxoZPl8j06c9mPGJtrXqXsT88lhfB3Yp5eUSyAjA6GXaTbKE/r0y
	5CVsGSSjTJU4cJbuPkMdK5oqvtLGnyCAhyNCI4T9fZpM1vo1az/sTfHgY9U7BQg3apLM
	qN4lBoDYbl9+ZAhuEgyDYLX7ImVOgU8YSozBak7Pz29/tBm4Ypa83I4ELX+TcEsbFsTf
	LtNQ==
X-Received: by 10.15.22.69 with SMTP id e45mr2665066eeu.59.1376478787175;
	Wed, 14 Aug 2013 04:13:07 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n48sm74347984eeg.17.2013.08.14.04.13.06 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 14 Aug 2013 04:13:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Aug 2013 13:13:52 +0200
Message-Id: <1376478834-12858-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1376478834-12858-1-git-send-email-Martin.Jansa@gmail.com>
References: <1376478834-12858-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 2/4] gst-plutins-gl: add dependency on glew
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
X-List-Received-Date: Wed, 14 Aug 2013 11:13:07 -0000

* fails without:
  | ./gstglshader.h:30:21: fatal error: GL/glew.h: No such file or directory

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb
index 213e799..4474e1e 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb
@@ -8,7 +8,7 @@ SRC_URI[sha256sum] = "48340b6a4b8abce16344a7bc33e74a94fdcce4f57ef6342cdf2f941c42
 
 SRC_URI += " file://0001-conditional-gl-framebuffer-undefined-use.patch"
 
-DEPENDS += "gst-plugins-base virtual/libgles2 virtual/egl jpeg libpng"
+DEPENDS += "gst-plugins-base virtual/libgles2 virtual/egl jpeg libpng glew"
 
 inherit gettext gconf
 
-- 
1.8.3.2


