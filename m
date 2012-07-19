Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SrtVT-0001Om-1U
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 18:23:16 +0200
Received: from mail-we0-f180.google.com ([74.125.82.180])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 19 Jul 2012 09:11:51 -0700
Received: by mail-we0-f180.google.com with SMTP id t11so1708130wey.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 09:11:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=Ztn7MzfRevbpVg+vzma0LqZylMVDm38BCZklKLyLnPE=;
	b=IZ1MAb9Lrh2ySOPHmznjs7xxQWPNqRNadTgYxv3buZj2mpvO+I33K0l9nurehtdz8R
	QCRuYECULJtmRbWGkqKHYmZp1BIfmzjEVxODg+mjGZ+SvoZcCr2trQ5OcqkjpPjDy/vs
	VbosSO4DhCV87KZAQG/l8OXsPIrB6q8znIlUNNtRe8iKQkWqiTvHXIyNbH+siy3S8nVN
	k8e7nlxCEd2cQAx+8cJ699Fkulj3hZ4SN6uRGqswTeSqkfbd1QkhcZ8HeewZ+6IDQVnp
	hlbxbGU3RLJ93JydmO4Efl+xj0DUZjPW9g+qoDDYH6QKYiyasXKC80a1Yo6zd3aNLOM2
	yNrw==
Received: by 10.217.4.193 with SMTP id u43mr318567wes.129.1342714306272;
	Thu, 19 Jul 2012 09:11:46 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id cl8sm39193462wib.10.2012.07.19.09.11.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jul 2012 09:11:45 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jul 2012 17:10:57 +0100
Message-Id: <96b86d9394cb31112bd87d99ac2cf253c2c020be.1342713965.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1342713965.git.ross.burton@intel.com>
References: <cover.1342713965.git.ross.burton@intel.com>
In-Reply-To: <cover.1342713965.git.ross.burton@intel.com>
References: <cover.1342713965.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmLxtLiyyymhbu+HNfrcgD8tNAbAjufsOkMMUsSRKha9iKTzEwDXQMnqtqnZzG7Z1Ng5FyZ
Subject: [PATCH 10/26] polkit: cleanup thanks to new gtk-doc.bbclass
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
X-List-Received-Date: Thu, 19 Jul 2012 16:23:16 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/polkit/polkit_0.104.bb |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/polkit/polkit_0.104.bb b/meta/recipes-extended/polkit/polkit_0.104.bb
index 6a8fdd6..8435c26 100644
--- a/meta/recipes-extended/polkit/polkit_0.104.bb
+++ b/meta/recipes-extended/polkit/polkit_0.104.bb
@@ -11,7 +11,7 @@ DEPENDS = "expat dbus-glib eggdbus intltool-native"
 PACKAGECONFIG = "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
 PACKAGECONFIG[pam] = "--with-authfw=pam,--with-authfw=shadow,libpam,libpam"
 
-PR = "r5"
+PR = "r6"
 
 PAM_SRC_URI = "file://polkit-1_pam.patch"
 SRC_URI = "http://hal.freedesktop.org/releases/polkit-${PV}.tar.gz \
@@ -24,9 +24,9 @@ SRC_URI = "http://hal.freedesktop.org/releases/polkit-${PV}.tar.gz \
 SRC_URI[md5sum] = "e380b4c6fb1e7bccf854e92edc0a8ce1"
 SRC_URI[sha256sum] = "6b0a13d8381e4a7b7e37c18a54595191b50757e0fcd186cd9918e9ad0f18c7f9"
 
-EXTRA_OECONF = "--with-os-type=moblin --disable-man-pages --disable-gtk-doc --disable-introspection"
+EXTRA_OECONF = "--with-os-type=moblin --disable-man-pages --disable-introspection"
 
-inherit autotools pkgconfig
+inherit autotools gtk-doc pkgconfig
 
 do_install_append() {
 	rm -f ${D}${libdir}/${PN}-1/extensions/*.a
-- 
1.7.10



