Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 7782A6ABBB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2013 11:49:37 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id c10so646889wiw.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2013 04:49:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=EDfTdbYK6Oed4pf0498gZrf4KzGSraR9IQkTa1uflzM=;
	b=fcdzDn1gm6QwsrpRumqcD6bxutRoSdq9Q/hqaS1SRBfFmG7+f/GLXp2sF18iltyuNh
	B0XHwG9X6mHfo2NXZKL+r4garGIDvnl7sah755yAcEFMTbw4gWBVp2ri5h8wearyNaTB
	sYZnMyRyzFVSWydAp90yznSWG93FC0AgwdvFP2MLtDeLbUv+7U4V5P7geHciS5K0azMS
	0FaB23MCTYSILh95o1Y+ojO2ZP8NA4KOpmStW7l5sCh45oF9lxF6yzkaXy7Oej7tdCCG
	AH7YEa+ptV9uQuAZFEismmnfSnLeJY4gs3SIDbAUYjSghhgnxpDoLVd3s459TKqtrkyL
	V5zw==
X-Received: by 10.194.8.72 with SMTP id p8mr10129544wja.71.1372160977495;
	Tue, 25 Jun 2013 04:49:37 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id fb9sm3636055wid.2.2013.06.25.04.49.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 25 Jun 2013 04:49:36 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Jun 2013 12:46:04 +0100
Message-Id: <1372160764-22195-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQlgBKx1YnGq5aKQswWw6ACRKVY5Q/DpYidkBLj5Okc81OXp5e2urPJykiuX8HYbS7mOgyso
Subject: [PATCH] gdk-pixbuf: add a wrapper for gdk-pixbuf-pixdata
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
X-List-Received-Date: Tue, 25 Jun 2013 11:49:37 -0000

gdk-pixbuf 2.26 added a new binary gdk-pixbuf-pixdata, but no wrapper script was
added for it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.28.1.bb |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.28.1.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.28.1.bb
index 4bf2eb6..a97234c 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.28.1.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.28.1.bb
@@ -73,6 +73,9 @@ do_install_append_class-native() {
 	create_wrapper ${D}/${bindir}/gdk-pixbuf-csource \
 		GDK_PIXBUF_MODULE_FILE=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/${LIBV}/loaders.cache
 
+	create_wrapper ${D}/${bindir}/gdk-pixbuf-pixdata \
+		GDK_PIXBUF_MODULE_FILE=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/${LIBV}/loaders.cache
+
 	create_wrapper ${D}/${bindir}/gdk-pixbuf-query-loaders \
 		GDK_PIXBUF_MODULE_FILE=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/${LIBV}/loaders.cache \
 		GDK_PIXBUF_MODULEDIR=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/${LIBV}/loaders
-- 
1.7.10.4


