Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U1GWV-0001FB-KH
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Feb 2013 14:19:25 +0100
Received: from mail-wi0-f197.google.com ([209.85.212.197])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 01 Feb 2013 05:03:33 -0800
Received: by mail-wi0-f197.google.com with SMTP id hj6so752443wib.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Feb 2013 05:03:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references:x-gm-message-state;
	bh=xCTmhbDb4g+aExqFVeSo1U2G2B8gMZ3g336n/flQFSg=;
	b=dzYzNFGeNEYa5TCGRiUe9OzTurcVNOKfn98XEEhSfwLlWmLalkmN0hcea4l0k2SNf/
	JEAjn5SQjfkHBx1oLnI7tzKuT4dP6EbyS+rKID06gaDEvJMH3WpdCJy8x33EpQ2K+TSH
	mmdB+zO4wLhChZH4w3uzAVFMnROhAF7veW8BGCNdxI4MmMf22dT16Lpp2MCYbbUPAf6K
	JKa7QwYueoCj7cXgQFX1B/osByOkT5PYzmrEhIE3zzQx1LWiFijNMNtCDQm9surDezlh
	pLb1NGkpEC8KWS4OGxOvVn5kku8WfxPMyg5e6WcaJuSsqsjKRBfFxaHFOv57ftvMPM0/
	MS0A==
X-Received: by 10.194.19.10 with SMTP id a10mr21537277wje.45.1359723811425;
	Fri, 01 Feb 2013 05:03:31 -0800 (PST)
X-Received: by 10.194.19.10 with SMTP id a10mr21537270wje.45.1359723811342;
	Fri, 01 Feb 2013 05:03:31 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id hu8sm3146594wib.6.2013.02.01.05.03.30
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 01 Feb 2013 05:03:30 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Feb 2013 13:01:19 +0000
Message-Id: <b2bbf738d9266467e8b144ebc13822e83bc3f67b.1359723526.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1359723526.git.ross.burton@intel.com>
References: <cover.1359723526.git.ross.burton@intel.com>
In-Reply-To: <cover.1359723526.git.ross.burton@intel.com>
References: <cover.1359723526.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlXxDX/PSGLncT40BwvjXg6VCsxMlPd7jzU1nY0CUdKgc3jYOg/TVxdkbHVnScD20GukyrWpRJxYKK3hA0OZ6uDiT6GX2F/z0mDK+D2QDezmyvN+pvc8GKkKlKKw5igecWreTGkB3F4ygbw2t8dKOG42WMKgMNcVZ7XrcG4AWJGqWqKNp/L3I1tQblBmW1mxnrsbLXZ
Subject: [PATCH 3/6] clutter-box2d: remove
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
X-List-Received-Date: Fri, 01 Feb 2013 13:19:34 -0000
X-List-Received-Date: Fri, 01 Feb 2013 13:19:34 -0000

This is a specialised physics engine for Clutter, and isn't suitable for
oe-core.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/clutter/clutter-box2d.inc    |   15 ---------------
 meta/recipes-graphics/clutter/clutter-box2d_git.bb |   14 --------------
 2 files changed, 29 deletions(-)
 delete mode 100644 meta/recipes-graphics/clutter/clutter-box2d.inc
 delete mode 100644 meta/recipes-graphics/clutter/clutter-box2d_git.bb

diff --git a/meta/recipes-graphics/clutter/clutter-box2d.inc b/meta/recipes-graphics/clutter/clutter-box2d.inc
deleted file mode 100644
index 056b091..0000000
--- a/meta/recipes-graphics/clutter/clutter-box2d.inc
+++ /dev/null
@@ -1,15 +0,0 @@
-DESCRIPTION = "Clutter Box2D"
-HOMEPAGE = "http://www.clutter-project.org/"
-LICENSE = "LGPLv2.1+"
-
-# The main clutter lib is machine specific so we need to be too
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-inherit autotools pkgconfig gtk-doc
-
-do_install_append () {
-	install -d ${D}${bindir}
-	install ${S}/examples/.libs/blockbox ${D}${bindir}
-}
-
-FILESPATH = "${FILE_DIRNAME}/clutter-box2d"
diff --git a/meta/recipes-graphics/clutter/clutter-box2d_git.bb b/meta/recipes-graphics/clutter/clutter-box2d_git.bb
deleted file mode 100644
index d256a28..0000000
--- a/meta/recipes-graphics/clutter/clutter-box2d_git.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-require clutter-box2d.inc
-
-LIC_FILES_CHKSUM = "file://box2d/License.txt;md5=e5d39ad91f7dc4692dcdb1d85139ec6b"
-
-SRCREV = "de5452e56b537a11fd7f9453d048ff4b4793b5a2"
-PV = "0.12.1+git${SRCPV}"
-PR = "r1"
-
-SRC_URI = "git://git.gnome.org/clutter-box2d.git"
-
-S = "${WORKDIR}/git"
-
-DEPENDS += "clutter-1.8"
-PROVIDES = "clutter-box2d-1.6"
-- 
1.7.10.4



