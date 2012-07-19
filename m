Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SrtVT-0000tD-Qb
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 18:23:16 +0200
Received: from mail-we0-f180.google.com ([74.125.82.180])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 19 Jul 2012 09:11:55 -0700
Received: by weyt11 with SMTP id t11so1708313wey.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 09:11:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=/6sOew0AB+dXF9uKmvpxjfOV+xItMZexl3dewlUcoYk=;
	b=pdSMqvxRIve8f9p+nqUI2nW/tw9kWNJbgbEYMxeH7xJkgj6oaw1SyrNeRnUrDzPB8d
	nbTb1cYFfqWa0e6t3v7VTdxtFwylCokwuToKeZBtVkw6iC90p0Me8Vy/PZtjarctm/ks
	4jUvVODMclC+za/4cPEv0yu/3tU2FTLxIBrhj2sGTjyFuPK9aAlzTsEBUsaKrq38dcYX
	JlsLIbbBkV+Qv0BULLlVYbn/wahuRx0M/eMz5cJYhYNkqTbeCHFFcrX8jz+dfLszR174
	ah70SsVBHCCWIi7D2uoiA+Oj75g7c6/MM3Wp4iS/rfVxSq5poX+h0S8ZEihapMNgH5QO
	fglw==
Received: by 10.216.76.6 with SMTP id a6mr1504422wee.26.1342714313387;
	Thu, 19 Jul 2012 09:11:53 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id cl8sm39193462wib.10.2012.07.19.09.11.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jul 2012 09:11:52 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jul 2012 17:11:02 +0100
Message-Id: <7ecdabc77b9379e4fc8db962e4fc06a004b05d97.1342713965.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1342713965.git.ross.burton@intel.com>
References: <cover.1342713965.git.ross.burton@intel.com>
In-Reply-To: <cover.1342713965.git.ross.burton@intel.com>
References: <cover.1342713965.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkY/+Orv93u6L3mxfj/cfxPxF8NCgsRewViOu/CLnoSmt6xANxCznAIzosz6erqMI8g+B6p
Subject: [PATCH 15/26] libgnome-keyring: cleanup thanks to new gtk-doc.bbclass
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
 meta/recipes-gnome/gnome/libgnome-keyring_2.32.0.bb |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-gnome/gnome/libgnome-keyring_2.32.0.bb b/meta/recipes-gnome/gnome/libgnome-keyring_2.32.0.bb
index 53e583e..e5cb628 100644
--- a/meta/recipes-gnome/gnome/libgnome-keyring_2.32.0.bb
+++ b/meta/recipes-gnome/gnome/libgnome-keyring_2.32.0.bb
@@ -9,13 +9,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0914b9d3ebaba41ef2e3e0ae16f296cf \
                     file://egg/egg-dh.h;endline=22;md5=1626c16af2a8da1f88324cf3ced33f08"
 
 SECTION = "x11/gnome/libs"
-PR = "r1"
+PR = "r2"
 
-inherit gnome
+inherit gnome gtk-doc
 
 DEPENDS = "dbus eggdbus libgcrypt"
 
-EXTRA_OECONF = "--disable-gtk-doc"
-
 SRC_URI[archive.md5sum] = "c42b2ca66204835d901d3dbfc1fa5ae6"
 SRC_URI[archive.sha256sum] = "56388c0d81ddfdb57d30e4963c83ecc1c18498aab99395420e0fff69929a0f0c"
-- 
1.7.10



