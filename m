Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 53B5273D8D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Apr 2015 03:35:44 +0000 (UTC)
Received: by pdbqd1 with SMTP id qd1so36527975pdb.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Apr 2015 20:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=qKR2T9EeaInl8vGztH8DoPJnJfCaPyIUg+q7A3cyauI=;
	b=v+aQfqzxgggqctoVA91piBfNkExsfhb5jqNjXCTp7OBVfinazcQ23UquRJ+H5XBwvA
	gbgx0MrkVRTDg+X5AZCUegoVgDb2wL5y2Z+kdgziAjXVIl4Ta7VRXTqdun68Qj2g7RS4
	8vKm49vPGUeBAzdFOHOvCZ+fyvA4CwfS46LiEFQUi+Zaj77JVZ5XVfIELLAt7kNKvXQM
	vY3wLQXO1EBayn+8vt5cv8Lu/9k9AGYwZ+Oz16b2JZSQKLul5zV+epP36QkOnBcjS1RK
	GSMV2IpoXmmIowlvFtQDexOmsb6PYWbo/cRp7asEx9UbSB7ofSFHz0Ga3p5mQsIBnINZ
	jufA==
X-Received: by 10.68.130.42 with SMTP id ob10mr1500362pbb.151.1429846546385;
	Thu, 23 Apr 2015 20:35:46 -0700 (PDT)
Received: from iMac.hsd1.ca.comcast.net (c-24-130-225-169.hsd1.ca.comcast.net.
	[24.130.225.169])
	by mx.google.com with ESMTPSA id qv9sm9575507pab.27.2015.04.23.20.35.45
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Apr 2015 20:35:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Apr 2015 20:35:26 -0700
Message-Id: <6188c86163aed96aeb4fdc162c492624ae292fd4.1429846256.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <aced357a8b994ceff87490e2e9faa526143bf4c4.1429846255.git.raj.khem@gmail.com>
References: <aced357a8b994ceff87490e2e9faa526143bf4c4.1429846255.git.raj.khem@gmail.com>
In-Reply-To: <cover.1429846255.git.raj.khem@gmail.com>
References: <cover.1429846255.git.raj.khem@gmail.com>
Subject: [PATCH 08/14] gnome-icon-theme: Needs nls.m4
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
X-List-Received-Date: Fri, 24 Apr 2015 03:35:45 -0000

it really needs nls, so lets add proper dependencies
and options

Change-Id: Ib01f066e9dadf2784686cbe28578d2784dfcba88
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb b/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb
index ee018bd..fde2bc0 100644
--- a/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb
+++ b/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb
@@ -10,7 +10,7 @@ PR = "r5"
 
 DEPENDS = "icon-naming-utils-native glib-2.0 intltool-native libxml-simple-perl-native"
 
-inherit autotools perlnative gtk-icon-cache pkgconfig
+inherit autotools perlnative gtk-icon-cache pkgconfig gettext
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/2.31/${BPN}-${PV}.tar.bz2 \
            file://iconpath-option.patch"
-- 
2.1.4


