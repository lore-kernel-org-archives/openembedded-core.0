Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RSBe2-0003Wv-AZ
	for openembedded-core@lists.openembedded.org;
	Sun, 20 Nov 2011 18:57:34 +0100
Received: by ywt2 with SMTP id 2so3995670ywt.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Nov 2011 09:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=5FCoRBq47oGZRwoDNM2aB9P9VxVIob1nGVb3GcWSB/0=;
	b=RiJhSMFWGHGQLCPiN62UAlfuO4XSJotig9b4Jt3h8CJrP4kP6c0TLzXUqjHFGwO8vI
	oAEuel9nKMAzaNviasu1Pk5L143MEsqfgdiOwysspH6901E0721xkmH6E9/9Jjtvvp4u
	SbLHQtnVeOqyIk/NEm9Gb4IkfT6WvYT+ZrjSY=
Received: by 10.50.77.229 with SMTP id v5mr11545878igw.13.1321811465215;
	Sun, 20 Nov 2011 09:51:05 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id dd36sm34710971ibb.7.2011.11.20.09.51.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 20 Nov 2011 09:51:04 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 20 Nov 2011 09:50:46 -0800
Message-Id: <1eb02b430c12807824427da5cb5abb586a5be8cb.1321811216.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <d06edef859ff936294d76bc07523f50eaaa5baf4.1321811216.git.raj.khem@gmail.com>
References: <d06edef859ff936294d76bc07523f50eaaa5baf4.1321811216.git.raj.khem@gmail.com>
In-Reply-To: <cover.1321811216.git.raj.khem@gmail.com>
References: <cover.1321811216.git.raj.khem@gmail.com>
Subject: [PATCH 4/5] netbase: Update recipe 4.46 -> 4.47
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
X-List-Received-Date: Sun, 20 Nov 2011 17:57:34 -0000

moreover 4.46 tar is not available on debian pools

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../netbase/{netbase-4.46 => netbase-4.47}/hosts   |    0
 .../netbase/{netbase-4.46 => netbase-4.47}/init    |    0
 .../{netbase-4.46 => netbase-4.47}/interfaces      |    0
 .../netbase/{netbase-4.46 => netbase-4.47}/nfsroot |    0
 .../qemuarm/interfaces                             |    0
 .../qemuarmv6/interfaces                           |    0
 .../qemuarmv7/interfaces                           |    0
 .../qemumips/interfaces                            |    0
 .../qemuppc/interfaces                             |    0
 .../qemux86-64/interfaces                          |    0
 .../qemux86/interfaces                             |    0
 .../netbase/{netbase_4.46.bb => netbase_4.47.bb}   |    6 +++---
 12 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-core/netbase/{netbase-4.46 => netbase-4.47}/hosts (100%)
 rename meta/recipes-core/netbase/{netbase-4.46 => netbase-4.47}/init (100%)
 rename meta/recipes-core/netbase/{netbase-4.46 => netbase-4.47}/interfaces (100%)
 rename meta/recipes-core/netbase/{netbase-4.46 => netbase-4.47}/nfsroot (100%)
 rename meta/recipes-core/netbase/{netbase-4.46 => netbase-4.47}/qemuarm/interfaces (100%)
 rename meta/recipes-core/netbase/{netbase-4.46 => netbase-4.47}/qemuarmv6/interfaces (100%)
 rename meta/recipes-core/netbase/{netbase-4.46 => netbase-4.47}/qemuarmv7/interfaces (100%)
 rename meta/recipes-core/netbase/{netbase-4.46 => netbase-4.47}/qemumips/interfaces (100%)
 rename meta/recipes-core/netbase/{netbase-4.46 => netbase-4.47}/qemuppc/interfaces (100%)
 rename meta/recipes-core/netbase/{netbase-4.46 => netbase-4.47}/qemux86-64/interfaces (100%)
 rename meta/recipes-core/netbase/{netbase-4.46 => netbase-4.47}/qemux86/interfaces (100%)
 rename meta/recipes-core/netbase/{netbase_4.46.bb => netbase_4.47.bb} (92%)

diff --git a/meta/recipes-core/netbase/netbase-4.46/hosts b/meta/recipes-core/netbase/netbase-4.47/hosts
similarity index 100%
rename from meta/recipes-core/netbase/netbase-4.46/hosts
rename to meta/recipes-core/netbase/netbase-4.47/hosts
diff --git a/meta/recipes-core/netbase/netbase-4.46/init b/meta/recipes-core/netbase/netbase-4.47/init
similarity index 100%
rename from meta/recipes-core/netbase/netbase-4.46/init
rename to meta/recipes-core/netbase/netbase-4.47/init
diff --git a/meta/recipes-core/netbase/netbase-4.46/interfaces b/meta/recipes-core/netbase/netbase-4.47/interfaces
similarity index 100%
rename from meta/recipes-core/netbase/netbase-4.46/interfaces
rename to meta/recipes-core/netbase/netbase-4.47/interfaces
diff --git a/meta/recipes-core/netbase/netbase-4.46/nfsroot b/meta/recipes-core/netbase/netbase-4.47/nfsroot
similarity index 100%
rename from meta/recipes-core/netbase/netbase-4.46/nfsroot
rename to meta/recipes-core/netbase/netbase-4.47/nfsroot
diff --git a/meta/recipes-core/netbase/netbase-4.46/qemuarm/interfaces b/meta/recipes-core/netbase/netbase-4.47/qemuarm/interfaces
similarity index 100%
rename from meta/recipes-core/netbase/netbase-4.46/qemuarm/interfaces
rename to meta/recipes-core/netbase/netbase-4.47/qemuarm/interfaces
diff --git a/meta/recipes-core/netbase/netbase-4.46/qemuarmv6/interfaces b/meta/recipes-core/netbase/netbase-4.47/qemuarmv6/interfaces
similarity index 100%
rename from meta/recipes-core/netbase/netbase-4.46/qemuarmv6/interfaces
rename to meta/recipes-core/netbase/netbase-4.47/qemuarmv6/interfaces
diff --git a/meta/recipes-core/netbase/netbase-4.46/qemuarmv7/interfaces b/meta/recipes-core/netbase/netbase-4.47/qemuarmv7/interfaces
similarity index 100%
rename from meta/recipes-core/netbase/netbase-4.46/qemuarmv7/interfaces
rename to meta/recipes-core/netbase/netbase-4.47/qemuarmv7/interfaces
diff --git a/meta/recipes-core/netbase/netbase-4.46/qemumips/interfaces b/meta/recipes-core/netbase/netbase-4.47/qemumips/interfaces
similarity index 100%
rename from meta/recipes-core/netbase/netbase-4.46/qemumips/interfaces
rename to meta/recipes-core/netbase/netbase-4.47/qemumips/interfaces
diff --git a/meta/recipes-core/netbase/netbase-4.46/qemuppc/interfaces b/meta/recipes-core/netbase/netbase-4.47/qemuppc/interfaces
similarity index 100%
rename from meta/recipes-core/netbase/netbase-4.46/qemuppc/interfaces
rename to meta/recipes-core/netbase/netbase-4.47/qemuppc/interfaces
diff --git a/meta/recipes-core/netbase/netbase-4.46/qemux86-64/interfaces b/meta/recipes-core/netbase/netbase-4.47/qemux86-64/interfaces
similarity index 100%
rename from meta/recipes-core/netbase/netbase-4.46/qemux86-64/interfaces
rename to meta/recipes-core/netbase/netbase-4.47/qemux86-64/interfaces
diff --git a/meta/recipes-core/netbase/netbase-4.46/qemux86/interfaces b/meta/recipes-core/netbase/netbase-4.47/qemux86/interfaces
similarity index 100%
rename from meta/recipes-core/netbase/netbase-4.46/qemux86/interfaces
rename to meta/recipes-core/netbase/netbase-4.47/qemux86/interfaces
diff --git a/meta/recipes-core/netbase/netbase_4.46.bb b/meta/recipes-core/netbase/netbase_4.47.bb
similarity index 92%
rename from meta/recipes-core/netbase/netbase_4.46.bb
rename to meta/recipes-core/netbase/netbase_4.47.bb
index b55a8a1..ddfa8ad 100644
--- a/meta/recipes-core/netbase/netbase_4.46.bb
+++ b/meta/recipes-core/netbase/netbase_4.47.bb
@@ -17,6 +17,9 @@ SRC_URI = "${DEBIAN_MIRROR}/main/n/netbase/netbase_${PV}.tar.gz \
            file://interfaces \
            file://nfsroot"
 
+SRC_URI[md5sum] = "fcd87a62f177592724a8066e3774ae97"
+SRC_URI[sha256sum] = "a7e6525c9a09b00eff3395d09739b3c70a18bff8d13f7daa21fdf81989387726"
+
 do_install () {
 	install -d ${D}${sysconfdir}/init.d \
 		   ${D}${sbindir} \
@@ -48,6 +51,3 @@ CONFFILES_${PN} = "${sysconfdir}/hosts ${sysconfdir}/network/interfaces"
 PACKAGE_ARCH_qemuarm = "${MACHINE_ARCH}"
 PACKAGE_ARCH_qemux86 = "${MACHINE_ARCH}"
 PACKAGE_ARCH_qemux86-64 = "${MACHINE_ARCH}"
-
-SRC_URI[md5sum] = "e15762f4a8280a62f7ddfea6093120f1"
-SRC_URI[sha256sum] = "2fdee144112731ee0028fee2584cc82d664857ca7004c2eb59de7bda5b159838"
-- 
1.7.5.4



