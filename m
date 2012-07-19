Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SrtVh-0001ch-Q7
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 18:23:30 +0200
Received: from mail-wi0-f178.google.com ([209.85.212.178])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 19 Jul 2012 09:12:07 -0700
Received: by wibhr14 with SMTP id hr14so2255271wib.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 09:12:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=5P4AehEql/GJtfdk0jwUp3q2t4TleKhowYfR00anWnA=;
	b=F9gp6ba0TC3EYnGt/qFSk2rEmP4o/fHrOtKTUGWoBebM9EEemddgZ71aLb99eKM200
	lyxClTQ9xggXWC2RIsWST9KqzIDjpQuivp1cvHPSdgGDxFOIHEKOWZZqTf1y/fBroDEY
	AEI8GdYZOC/iq3l1wA5cCIi7pNCVH9PsEye0XQFbdt2+ZVQwOK5O7xLBSeSJujbGQeZz
	qGnGHSIQZfG10WIpEK+L5Ot60lj+UkJ14HKwMeLVcfL2iFauNs6716GU7m+qCxrz0hAM
	EQaEWqfdfbghH2zPBF6HDixfAWdnIhCmvd6kCTidq/ZKZMdVDb0XOEPkgqN16w2mc78q
	NFVg==
Received: by 10.216.198.10 with SMTP id u10mr1560754wen.80.1342714310892;
	Thu, 19 Jul 2012 09:11:50 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id cl8sm39193462wib.10.2012.07.19.09.11.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jul 2012 09:11:50 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jul 2012 17:11:00 +0100
Message-Id: <a6c4cb238ce2eaf06684fe4d9f240df468470090.1342713965.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1342713965.git.ross.burton@intel.com>
References: <cover.1342713965.git.ross.burton@intel.com>
In-Reply-To: <cover.1342713965.git.ross.burton@intel.com>
References: <cover.1342713965.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlPbTuAHDGNBdFz+wrlndQYQi4JZovlDYH1Mg8KLkOVNByW9aPluO2mhWwO3t8Xy7wOmaYv
Subject: [PATCH 13/26] gnome-keyring: cleanup thanks to new gtk-doc.bbclass
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
X-List-Received-Date: Thu, 19 Jul 2012 16:23:30 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb b/meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb
index ad60094..1fd42b4 100644
--- a/meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb
+++ b/meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb
@@ -11,14 +11,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 
 SECTION = "x11/gnome"
 
-PR = "r7"
+PR = "r8"
 
-inherit autotools gnome pkgconfig
+inherit autotools gnome gtk-doc pkgconfig
 
 DEPENDS = "gtk+ libgcrypt libtasn1 libtasn1-native gconf ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} = "libgnome-keyring glib-2.0-utils"
 
-EXTRA_OECONF = "--disable-gtk-doc ${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam --with-pam-dir=${base_libdir}/security', '--disable-pam', d)}"
+EXTRA_OECONF = "${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam --with-pam-dir=${base_libdir}/security', '--disable-pam', d)}"
 
 SRC_URI += "file://org.gnome.keyring.service"
 
-- 
1.7.10



