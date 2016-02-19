Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f181.google.com (mail-ob0-f181.google.com
	[209.85.214.181])
	by mail.openembedded.org (Postfix) with ESMTP id 107807705C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Feb 2016 01:31:00 +0000 (UTC)
Received: by mail-ob0-f181.google.com with SMTP id jq7so94130015obb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Feb 2016 17:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ZB9oY2R7Xpn80MWlqabjGJ8ku/8TZQZzKTFlHmiqnlw=;
	b=v4RBt0w8/2No3+m2GEDo6okUgr0ieIFC8SvbJ1LsXYEYXDj/wPGlk5tnXmfaIw/mMh
	Px7IK8lUvfsfRoQ7O0Z7pO6cCG+2Lj+1IKCJ09Z0i6OjNTY9dbDUH6OjWyMBnHBpC63x
	gykcUpCL9a2xffGIkvIKjIKaG4IfHE84517zJmTwpnKpvQq2pZAaBECVtMLoMCpnKM0x
	l4n0LUW8nj52AjAvKy7+mPcK2mhQKwNEG9ehrUwAD2NuwDXwW9y3LCyqhMcyIJjAaM9I
	hO52Rfxb9utZwodSkgczEXFh9O1fWaFsfR6Qsadzn9L2GDxgLLixgLEwgCLQf8cc0QvZ
	gmEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ZB9oY2R7Xpn80MWlqabjGJ8ku/8TZQZzKTFlHmiqnlw=;
	b=ZQRNF8OVbvRxVbTRdmQzHOlr5yMdZQoAeMd3vIkIDCZgK+wZBXBDy0Cn13di138rvM
	cxsxTxCRFpY3fpwQ/OIdc7vSSK9JkQXezDEJ4+Qc0A9EgMF7jU2F96UUzfOMHHkHxyys
	vehK7V1N1O95nmmxSe/hHSPAOjEOrTZvCraQQezINeTbkV95KHUAX7yC9cs5fkRLNEOv
	JosOPFxPLDsTpJtbp1BYpZbTKbhzCQNfa9Z9OIxvtBuuJotbjlZVxtoh8d+p8WxoG3Z7
	xkxZRllRU/VSvULQjIW3JNpN+zNug13j4olBndsBluBrOcDLZFTOZDF/QxZRrI2wxpO6
	mVAw==
X-Gm-Message-State: AG10YOTa+pTQ4WWfJ9vWKVjFRyfsmkVRxCDyCsauLqUXIZjgBbsavJWLU6n6ZI7VifbcTQ==
X-Received: by 10.182.75.198 with SMTP id e6mr9497064obw.0.1455845461400;
	Thu, 18 Feb 2016 17:31:01 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id wa8sm5566371obc.7.2016.02.18.17.30.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 18 Feb 2016 17:31:00 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Feb 2016 17:30:49 -0800
Message-Id: <1455845451-25185-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1455845451-25185-1-git-send-email-armccurdy@gmail.com>
References: <1455845451-25185-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH v2 1/3] libsoup-2.4: minor formatting improvements
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
X-List-Received-Date: Fri, 19 Feb 2016 01:31:03 -0000

Also update HOMEPAGE from generic Gnome to something libsoup specific.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-support/libsoup/libsoup-2.4_2.52.2.bb | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.52.2.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.52.2.bb
index 3215ff1..865c1d7 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.52.2.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.52.2.bb
@@ -1,22 +1,14 @@
 SUMMARY = "An HTTP library implementation in C"
-HOMEPAGE = "http://www.gnome.org/"
+HOMEPAGE = "https://wiki.gnome.org/Projects/libsoup"
 BUGTRACKER = "https://bugzilla.gnome.org/"
-
+SECTION = "x11/gnome/libs"
 LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
-SECTION = "x11/gnome/libs"
-
 DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 intltool-native"
 
-EXTRA_OECONF = "--disable-vala"
+SHRT_VER = "${@d.getVar('PV', True).split('.')[0]}.${@d.getVar('PV', True).split('.')[1]}"
 
-# libsoup-gnome is entirely deprecated and just stubs in 2.42 onwards.  Enable
-# by default but let it be easily disabled.
-PACKAGECONFIG ??= "gnome"
-PACKAGECONFIG[gnome] = "--with-gnome,--without-gnome"
-
-SHRT_VER = "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
 
 SRC_URI[md5sum] = "e4757d09012ed93822b1ee41435fec24"
@@ -26,5 +18,12 @@ S = "${WORKDIR}/libsoup-${PV}"
 
 inherit autotools gettext pkgconfig upstream-version-is-even
 
+# libsoup-gnome is entirely deprecated and just stubs in 2.42 onwards.  Enable
+# by default but let it be easily disabled.
+PACKAGECONFIG ??= "gnome"
+PACKAGECONFIG[gnome] = "--with-gnome,--without-gnome"
+
+EXTRA_OECONF = "--disable-vala"
+
 # glib-networking is needed for SSL, proxies, etc.
 RRECOMMENDS_${PN} = "glib-networking"
-- 
1.9.1


