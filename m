Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 1CBCB6ADB6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2013 10:30:00 +0000 (UTC)
Received: by mail-wg0-f45.google.com with SMTP id j13so8108471wgh.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2013 03:30:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=YHP8WyM3MCIPvSTErdic2xX5sv+TJKbvQ5qtlq0akzU=;
	b=Y5K89J5vu4/uL/oS+g3Axkl9a22lZPyQnlZqZ/UeWtZvDNsEZ5aYOoihx3tWr6Yez/
	TSZNBGK044CgZfQKQArc0JnwH6NHA+p/zC8FlClgik04feEsijkd6GCxhX6I9YyQ+DTf
	X1b2gON4vcJiPxUeK55wfAfHPtF3IQbsdV1bJDioUys9CP0XBclph6Eplc/1Br5sYLC6
	xW+u8qAKpsuatWVfXG/ucsGp65H6eqJSkgw9KQ77ry62BhQUn2dzCIomuelJc9DLblhB
	YX9KUhXLFI5QGvKPn1VW6PwhnGboUBIRB/Yvk3Dr7fkSfRS5cIQ3WRumnW/sfOrWYBXp
	7fZA==
X-Received: by 10.180.21.209 with SMTP id x17mr5473281wie.47.1372069801740;
	Mon, 24 Jun 2013 03:30:01 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id fs8sm15570508wib.0.2013.06.24.03.30.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 24 Jun 2013 03:30:00 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Jun 2013 11:26:26 +0100
Message-Id: <2eeb4ab088a702323d400a0d6b279239a3a7c698.1372069538.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1372069538.git.ross.burton@intel.com>
References: <cover.1372069538.git.ross.burton@intel.com>
In-Reply-To: <cover.1372069538.git.ross.burton@intel.com>
References: <cover.1372069538.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkaUeYwOKZ7uc8guO1uODbagQwcfNJHlp62uDv1+rySxqmOsioJwaT0yArGCWyMX1nrHYxm
Subject: [PATCH 2/4] gst-plugins-bad: tremor was moved from here to -base
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
X-List-Received-Date: Mon, 24 Jun 2013 10:30:01 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
index 3d86f00..87f338f 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
@@ -6,14 +6,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                     file://COPYING.LIB;md5=55ca817ccb7d5b5b66355690e9abc605 \
                     file://gst/tta/crc32.h;beginline=12;endline=29;md5=71a904d99ce7ae0c1cf129891b98145c"
 
-DEPENDS += "gst-plugins-base tremor curl"
+DEPENDS += "gst-plugins-base curl"
 
 PR = "r4"
 
 inherit gettext
 
 EXTRA_OECONF += "--disable-examples --disable-experimental --disable-sdl --disable-cdaudio --disable-directfb \
-                 --with-plugins=wavpack,ivorbis,mpegvideoparse --disable-vdpau --disable-apexsink \
+                 --with-plugins=wavpack,mpegvideoparse --disable-vdpau --disable-apexsink \
                  --disable-orc --disable-neon"
 
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'librsvg', '', d)}"
-- 
1.7.10.4


