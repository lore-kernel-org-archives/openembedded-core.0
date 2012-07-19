Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SrtVN-0000wg-4i
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 18:23:09 +0200
Received: from mail-we0-f180.google.com ([74.125.82.180])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 19 Jul 2012 09:11:47 -0700
Received: by mail-we0-f180.google.com with SMTP id t11so1708114wey.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 09:11:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=NkZk/ma274iEhNtU6v6+1GDJs4oFkkJQg+EJQkIlcHA=;
	b=mnvGaHtzZDk7avknsYIVgBAZzqMSmdfoQHFYFZFW1YwogBq6R1qsZQMOeS3uVmOXYK
	aZLx5A/pGFJ8Xf3S/J+XUBaWYWt4cscNywvp/iZYrq8ukEN2Nj6WihmcmY45k8AiFSSg
	UeVu/A57OpPlPcXCm6RDRbxuG+e4ND09I3UxUX2FuMz7ohsbmeKIfyqFUgSTy38MK+5S
	81y5mbeGl/2Le6hXuagddbyHBBjqvui4cLtPNhQfnNQChwwFwYP7wYnsao8kb+YpW5KV
	9bIMIHmnn2KAN+W8MGJRq9WhPqnaztg78iVs+DK+TTqEu4NLLiq9aLbbwi/fxm3Djr4j
	9+bA==
Received: by 10.216.195.40 with SMTP id o40mr1642461wen.36.1342714307644;
	Thu, 19 Jul 2012 09:11:47 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id cl8sm39193462wib.10.2012.07.19.09.11.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jul 2012 09:11:46 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jul 2012 17:10:58 +0100
Message-Id: <944d0d1b30d1016afeea0908625ab8b6c9cf15b0.1342713965.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1342713965.git.ross.burton@intel.com>
References: <cover.1342713965.git.ross.burton@intel.com>
In-Reply-To: <cover.1342713965.git.ross.burton@intel.com>
References: <cover.1342713965.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQk7Q9uRxHPIrRkcYq5xxVdrIxDSV0UvvdTLGNwBHwke1DZOFZfwDmSLLoIXJeOpH75OCrSR
Subject: [PATCH 11/26] polkit-gnome: cleanup thanks to new gtk-doc.bbclass
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
X-List-Received-Date: Thu, 19 Jul 2012 16:23:09 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/polkit/polkit-gnome_0.102.bb |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/polkit/polkit-gnome_0.102.bb b/meta/recipes-extended/polkit/polkit-gnome_0.102.bb
index bba917c..7e9fc2b 100644
--- a/meta/recipes-extended/polkit/polkit-gnome_0.102.bb
+++ b/meta/recipes-extended/polkit/polkit-gnome_0.102.bb
@@ -10,15 +10,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=74579fab173e4c5e12aac0cd83ee98ec \
 SRC_URI = "http://hal.freedesktop.org/releases/polkit-gnome-${PV}.tar.bz2 \
           "
 
-PR = "r1"
+PR = "r2"
 
 EXTRA_OECONF = " --disable-scrollkeeper \
                  --disable-man-pages \
                  --disable-examples \
-                 --disable-gtk-doc \
                  --disable-introspection "
 
-inherit autotools pkgconfig
+inherit autotools gtk-doc pkgconfig
 
 FILES_${PN} += " ${datadir}/dbus-1 \
                  ${datadir}/PolicyKit \
-- 
1.7.10



