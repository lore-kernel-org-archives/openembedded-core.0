Received: from mail-we0-f172.google.com ([74.125.82.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UXUSP-0002cJ-7F
	for openembedded-core@lists.openembedded.org;
	Wed, 01 May 2013 12:40:23 +0200
Received: by mail-we0-f172.google.com with SMTP id r6so1117522wey.31
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 May 2013 03:22:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=rnDrLLfEpfYH6pZOxgu8OuyoK+gqXsgFYwFsEjDm3eM=;
	b=ST74GvYh5g6t00soXQ6MR0/ZDOU30quizkEMytYhKCQFN4FyILuARWEfrt9QGIcCQZ
	6foJcalQ9ND1Mu6IXiU7FkSTWGsaK7GJ26bu+zGDtGU7H9tTTFRgzAKSPsthxYm4XJbI
	SW0YhNivXN/oAE0WuIGG7iQhex56pk5PcdVoCMqHVRUBhHWcS/v7L8Dn9qcAkEM/3axu
	PeF/ByB8PcDoHvrCnfRw1hTa9FOiPYREnDk/cur026scYIHjgfreZRJ4hiYYA9N1EoVE
	mNFFxnWEj3M0ZX2gd/S8a9VxE2cW7snensvEpUeJud3t4ZexV3QIAU6UdafNGZTk/vwt
	K2ag==
X-Received: by 10.194.178.162 with SMTP id cz2mr2185932wjc.27.1367403745440;
	Wed, 01 May 2013 03:22:25 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id fz3sm3018245wib.0.2013.05.01.03.22.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 01 May 2013 03:22:24 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 May 2013 11:19:22 +0100
Message-Id: <14c10a2894fd7e722a8443b03b12462ab8bdfdad.1367403369.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <06a1154d758be0744da68717b31077cc02ec657e.1367403369.git.ross.burton@intel.com>
References: <06a1154d758be0744da68717b31077cc02ec657e.1367403369.git.ross.burton@intel.com>
In-Reply-To: <cover.1367403369.git.ross.burton@intel.com>
References: <cover.1367403369.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlbVyZW114FO8+ECEao/eJFXhgdiuIDLKqTqE/sqpHyKrIY+1qJnfrANAI24JEmORBLG8en
Subject: [PATCH 3/3] libgnome-keyring: remove, nothing in oe-core uses this anymore
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 May 2013 10:40:25 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/distro/include/seperatebuilddir.inc       |    1 -
 meta/recipes-gnome/gnome/libgnome-keyring_2.32.0.bb |   19 -------------------
 2 files changed, 20 deletions(-)
 delete mode 100644 meta/recipes-gnome/gnome/libgnome-keyring_2.32.0.bb

diff --git a/meta/conf/distro/include/seperatebuilddir.inc b/meta/conf/distro/include/seperatebuilddir.inc
index f70ae68..d113f92 100644
--- a/meta/conf/distro/include/seperatebuilddir.inc
+++ b/meta/conf/distro/include/seperatebuilddir.inc
@@ -291,7 +291,6 @@ B_pn-libgcc = "${SEPB}"
 #B_pn-libgcrypt-native = "${SEPB}"
 B_pn-libglade = "${SEPB}"
 B_pn-libglu = "${SEPB}"
-B_pn-libgnome-keyring = "${SEPB}"
 B_pn-libgpg-error = "${SEPB}"
 B_pn-libgpg-error-native = "${SEPB}"
 B_pn-libice = "${SEPB}"
diff --git a/meta/recipes-gnome/gnome/libgnome-keyring_2.32.0.bb b/meta/recipes-gnome/gnome/libgnome-keyring_2.32.0.bb
deleted file mode 100644
index 8ed44f3..0000000
--- a/meta/recipes-gnome/gnome/libgnome-keyring_2.32.0.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-DESCRIPTION = "Compatibility library for accessing secrets"
-HOMEPAGE = "http://www.gnome.org/"
-BUGTRACKER = "https://bugzilla.gnome.org/"
-
-LICENSE = "LGPLv2 & LGPLv2+ & LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0914b9d3ebaba41ef2e3e0ae16f296cf \
-                    file://library/gnome-keyring.h;endline=25;md5=68ea64f81c160d670c37da5f137be4fb \
-                    file://library/gnome-keyring.c;endline=26;md5=8d7a4fb674aaa012ea5a98e7c368b4a5 \
-                    file://egg/egg-dh.h;endline=22;md5=1626c16af2a8da1f88324cf3ced33f08"
-
-SECTION = "x11/gnome/libs"
-PR = "r3"
-
-inherit gnome gtk-doc
-
-DEPENDS = "dbus libgcrypt glib-2.0 intltool-native"
-
-SRC_URI[archive.md5sum] = "c42b2ca66204835d901d3dbfc1fa5ae6"
-SRC_URI[archive.sha256sum] = "56388c0d81ddfdb57d30e4963c83ecc1c18498aab99395420e0fff69929a0f0c"
-- 
1.7.10.4



