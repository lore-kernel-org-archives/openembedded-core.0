Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SrtbR-0005Dr-Pw
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 18:29:25 +0200
Received: from mail-wg0-f44.google.com ([74.125.82.44])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 19 Jul 2012 09:18:02 -0700
Received: by wgbdr13 with SMTP id dr13so1879356wgb.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 09:18:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=MJilSBV9w/gsHEqIHMwwOmFG3uV3J1pi/33kzTNP7Bo=;
	b=hU+axQXHx63FequG0GM81z9SX6NBlpt2UrQRxs5x/xcfhMGoDr+gw7DpvUlfm3lU+z
	i/62C/1MdCshecK2GosjeonrG881xGh6LOIl5Wvqghfk0a0AFRJISAsI/laMHjBvnZVL
	ZM/zAHGpR7+MDu8uR0oTy/5xYredsPuEPeZ4U3SgBLEJg7Iv2oL/0KzZhuRzag5YR8YH
	8dnm0i7tJK1NFZ6hPBKOwmoMbZfvaZSUFpW7zjlUszZp2nJZMqmpm01Fki0413PNoTXL
	4lktIm7pJCK8HOKx2IrFSaTqLUlYw0q4VmMkvOC7XzogDKBkyh0PKLdiTpo+oq5y0jMc
	KKKA==
Received: by 10.180.82.164 with SMTP id j4mr6132174wiy.18.1342714680673;
	Thu, 19 Jul 2012 09:18:00 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id j6sm7124654wiy.4.2012.07.19.09.17.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jul 2012 09:18:00 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jul 2012 17:17:46 +0100
Message-Id: <1342714666-7951-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQm/tqCrTfw5cxepRt0LIdizGDzAnOKWBa58REDdgik36llCyqfzeY3BuWVcESKsXHKTK5UR
Subject: [PATCH] webkit-gtk: bump PR
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Jul 2012 16:29:26 -0000

Accidently ommitted the PR bump from the previous patches, which change the
build.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-sato/webkit/webkit-gtk_1.8.1.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-sato/webkit/webkit-gtk_1.8.1.bb b/meta/recipes-sato/webkit/webkit-gtk_1.8.1.bb
index 180861e..0cc167b 100644
--- a/meta/recipes-sato/webkit/webkit-gtk_1.8.1.bb
+++ b/meta/recipes-sato/webkit/webkit-gtk_1.8.1.bb
@@ -15,6 +15,8 @@ DEPENDS = "zlib enchant gnome-keyring libsoup-2.4 curl libxml2 cairo libxslt lib
            gtk+ gstreamer gst-plugins-base flex-native gperf-native perl-native-runtime sqlite3 ${ICU_LIB}"
 DEPENDS += " ${@base_contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl', '', d)}"
 
+PR = "r1"
+
 SRC_URI = "\
   http://www.webkitgtk.org/releases/webkit-${PV}.tar.xz \
   file://nodolt.patch \
-- 
1.7.10



