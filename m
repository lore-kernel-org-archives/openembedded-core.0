Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f196.google.com (mail-ob0-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id C0611731C7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 05:37:11 +0000 (UTC)
Received: by mail-ob0-f196.google.com with SMTP id is5so2009868obc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 21:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=WlEkkt6ma32fbzPVWt4APUoWufYv8TEHrM0mtrgUpNw=;
	b=v56tmjUZnoz4pt7oH2fFY/7iob7agyZNc2nwh5y2ltKz8KqJQkwb+usJZYZBxBJZyx
	96LZByIssVy8GB73zOY/9U8W0+GGuQV/ft2jdMqXA+PK5P1M023DJk0fRLEEtPMJquc9
	tzd6hjbgb4GtB4rI8CtxNaCbHKPL3KA5KFm0N43/uzK15Hc88bgZzuMdUOKh3THA37fH
	tqkV9m8p5JYYdAA0suUA/O40p//2OyaeAzj2cNQ7wb47DmEgMtUP9j3SWNfB/jA2AodM
	JceHP5Hg1tDagH1eMBk921hiZrOhQ9595MfiHXwzDZwi1NRibLTvvPwWZ9F51+wIjkrH
	SvvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=WlEkkt6ma32fbzPVWt4APUoWufYv8TEHrM0mtrgUpNw=;
	b=R9oq8XXDBuwljZo4E0Nh1rIl1XpnJtCZwZTjkLczC1bY7ycnkbDj20hFT5i/RMetCf
	aWhsIb34jNLfTmW0Yc+wkCRr0eSScRo4E42ouIACCqTKDtzN7LN8k7R9zDzqysAb7kOM
	oCTSBn1uUzECZ/5H2LvoS+pcEuwmbSlcCwUqiY3Lg5ui2JuY/TOMsMVXuW1Nxp/4JKvL
	pdEUGXNFnHHQR2ccm+M6KQXkQP3APkGQv/e3lcyKWHvmI9aYejPgi9hfXMcpaw3eV0Ph
	2CwkIB6xz1Hb7KnHPYDWppw6UY8Z2D7UsFOFua1cOuAs3vOBqoKeoUQCRft2JDT7OGyh
	A42g==
X-Gm-Message-State: ALoCoQl2h6lhJLuz7T8vsUA9KPIk4FBPVxSvTKiOZB9fwnYaOZwz1RJ6WrsmTZLavnrYxBvexh92MOWosTeZ4mz6GhMyZV4I1g==
X-Received: by 10.60.92.97 with SMTP id cl1mr32578410oeb.12.1453354632695;
	Wed, 20 Jan 2016 21:37:12 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	w143sm19735990oiw.16.2016.01.20.21.37.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jan 2016 21:37:11 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2016 21:36:22 -0800
Message-Id: <1453354610-19218-5-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453354610-19218-1-git-send-email-armccurdy@gmail.com>
References: <1453354610-19218-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH v2 04/32] gstreamer1.0-plugins.inc: minor formatting improvements
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
X-List-Received-Date: Thu, 21 Jan 2016 05:37:12 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
index 58c0bbb..568d51f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
@@ -2,12 +2,12 @@ SUMMARY = "Plugins for the GStreamer multimedia framework 1.x"
 HOMEPAGE = "http://gstreamer.freedesktop.org/"
 BUGTRACKER = "https://bugzilla.gnome.org/enter_bug.cgi?product=Gstreamer"
 SECTION = "multimedia"
+
 DEPENDS = "gstreamer1.0"
 
 inherit autotools pkgconfig upstream-version-is-even
 
 GSTREAMER_1_0_DEBUG ?= "--disable-debug"
-GSTREAMER_1_0_GIT_BRANCH ?= "master"
 EXTRA_OECONF = "--disable-valgrind ${GSTREAMER_1_0_DEBUG} --disable-examples "
 
 acpaths = "-I ${S}/common/m4 -I ${S}/m4"
@@ -32,6 +32,8 @@ oe_runconf_prepend() {
 
 SRC_URI = "${@get_gst_srcuri(d)}"
 
+GSTREAMER_1_0_GIT_BRANCH ?= "master"
+
 def get_gst_srcuri(d):
     # check if expected prefix is present
     prefix = "gstreamer1.0-"
@@ -56,4 +58,3 @@ delete_liblink_m4_file() {
 }
 
 do_configure[prefuncs] += " delete_liblink_m4_file "
-
-- 
1.9.1


