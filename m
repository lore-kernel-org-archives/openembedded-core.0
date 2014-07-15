Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id AA28B705E6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 16:18:46 +0000 (UTC)
Received: by mail-we0-f181.google.com with SMTP id q59so5898379wes.40
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 09:18:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=eX3q7k3lS8UGyM+RfCEvZ+tTHQ0W59h9LMT2lq02Ctk=;
	b=k4rkenlqaGAAmZCZRZEW2/BseJWHRYSYf9VAbtEJxFE0iZ7pXX0CfD/DqOegAMIILP
	caHV5SrFI3grl1yRimU5UryQzE69zeuSgShc2Kli6EL8Pfm7sLYgMEvB4Aw4jyWBXJRC
	58grH7vqJKz+vkMYz2bpOGTS4VqcoEEiROtgLCRAzX/Qn21esWPLezw1czTc8GKzsOzK
	RPBgle8/hD3E3qJAVDQeC5zM7EcH/BmJ6XVBIKeZi/DDk1zJBSKBP+0SifNRoQbmQXdm
	1EPXbqNnsNn352+eofZnetafp6bDBp7UN3P/pLZvP+rB2Zymt4RMH+aKmNcRwb/rIChE
	l8aw==
X-Gm-Message-State: ALoCoQn2YPWqfGb/yxZ7MKAt4bQRciz6djTL7Ev1dlX0Rxi0PCEqWTBgmPOLVh4aEPmZJ1kHY8RA
X-Received: by 10.180.94.166 with SMTP id dd6mr6577826wib.33.1405441127328;
	Tue, 15 Jul 2014 09:18:47 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	au7sm33554040wjc.41.2014.07.15.09.18.46 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Jul 2014 09:18:46 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jul 2014 17:18:34 +0100
Message-Id: <03013af37177fc05ac28bf57c4ed7d348b0bacd3.1405440532.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1405440532.git.ross.burton@intel.com>
References: <cover.1405440532.git.ross.burton@intel.com>
In-Reply-To: <cover.1405440532.git.ross.burton@intel.com>
References: <cover.1405440532.git.ross.burton@intel.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 4/7] libmad: use "foreign" automake strictness
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
X-List-Received-Date: Tue, 15 Jul 2014 16:18:47 -0000

libmad doesn't want GNU-levels of automake strictness so tell it to be
"foreign".

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../libmad/libmad/automake-foreign.patch                   |   12 ++++++++++++
 meta/recipes-multimedia/libmad/libmad_0.15.1b.bb           |    1 +
 2 files changed, 13 insertions(+)
 create mode 100644 meta/recipes-multimedia/libmad/libmad/automake-foreign.patch

diff --git a/meta/recipes-multimedia/libmad/libmad/automake-foreign.patch b/meta/recipes-multimedia/libmad/libmad/automake-foreign.patch
new file mode 100644
index 0000000..3e54424
--- /dev/null
+++ b/meta/recipes-multimedia/libmad/libmad/automake-foreign.patch
@@ -0,0 +1,12 @@
+Pass foreign to AM_INIT_AUTOMAKE so it doesn't enforce GNU strictness.
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/configure.ac b/configure.ac
+index e602fd3..e075b86 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -29 +29 @@ AC_CONFIG_SRCDIR([decoder.h])
+-AM_INIT_AUTOMAKE
++AM_INIT_AUTOMAKE([foreign])
diff --git a/meta/recipes-multimedia/libmad/libmad_0.15.1b.bb b/meta/recipes-multimedia/libmad/libmad_0.15.1b.bb
index 58d68a6..30937eb 100644
--- a/meta/recipes-multimedia/libmad/libmad_0.15.1b.bb
+++ b/meta/recipes-multimedia/libmad/libmad_0.15.1b.bb
@@ -15,6 +15,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/mad/libmad-${PV}.tar.gz \
            file://add-pkgconfig.patch \
            file://fix_for_mips_with_gcc-4.5.0.patch \
            file://obsolete_automake_macros.patch \
+           file://automake-foreign.patch \
 "
 
 SRC_URI[md5sum] = "1be543bc30c56fb6bea1d7bf6a64e66c"
-- 
1.7.10.4


