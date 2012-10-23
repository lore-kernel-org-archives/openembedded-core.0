Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TQkpm-0008Hf-Nl
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Oct 2012 22:12:18 +0200
Received: from mail-we0-f197.google.com ([74.125.82.197])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 23 Oct 2012 12:58:49 -0700
Received: by mail-we0-f197.google.com with SMTP id x43so3166272wey.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Oct 2012 12:58:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=qN34XV+YD6AwsTzO3WicUOd9kOA5HfgeJo9/I1grA3o=;
	b=BR91jG8Rwc5oVUcJ+nEIDjNfNk0mT3IWrWtVJrMutUQWN/0KmnO001I/0efXfexm+y
	ndNyu/Ub+JZBgYN2XqsHwZMHcT1RjjsZDSLgi5Zke/vpJ/gKx9YUszsQqerYVB85ON02
	xZcAW8e782zigjrGZw4otSnKKtGKliUW3Z7pBA32lYzIhk7GRalLZMb05ZWS5DP+9Ec2
	OP4Mx9j/rCPDjj3c5I1PHZtPrWKlawxEz9hdEy+V8JDTCrM1r3c7ARhLyaeqXbWtfQo5
	JPW0vw5XPdbSxMcSbjAc1lwwy9AuGkxu0/5Dv5MPZbk9W9Ffjx34ojUgQaQFfT7Nbza6
	WVNQ==
Received: by 10.216.132.223 with SMTP id o73mr7812853wei.69.1351022327774;
	Tue, 23 Oct 2012 12:58:47 -0700 (PDT)
Received: by 10.216.132.223 with SMTP id o73mr7812844wei.69.1351022327444;
	Tue, 23 Oct 2012 12:58:47 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id dt9sm428306wib.1.2012.10.23.12.58.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 23 Oct 2012 12:58:46 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Oct 2012 20:57:37 +0100
Message-Id: <1351022257-15219-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQmB6atpbBasb69YKfjo0yXWa+RMfdlwN44T3J0jkMFRrLEJc/VTbGafNeOOFTtivvmeLmYhvgRxn0nf1TU/Xa/qGh+AUl0ZCjDRNWk2a8jqm4Egy6Pg8OF2U3dypR+2RJiOTkB/pkxDuIf8Z7wuti4dRkv4OUDjMvNCLHu1Xa1SoV2ELqmdq75NteWsKOXQjRepcaAR
Subject: [PATCH] libxkbcommon: new window system-independent XKB library
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
X-List-Received-Date: Tue, 23 Oct 2012 20:12:19 -0000

Used by Wayland, Clutter, and more.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-lib/libxkbcommon_0.2.0.bb |   18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxkbcommon_0.2.0.bb

diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_0.2.0.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_0.2.0.bb
new file mode 100644
index 0000000..7304080
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_0.2.0.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Generic XKB keymap library"
+DESCRIPTION = "libxkbcommon is a keymap compiler and support library which \
+processes a reduced subset of keymaps as defined by the XKB specification."
+HOMEPAGE = "http://www.xkbcommon.org"
+
+LICENSE = "MIT & MIT-style"
+
+DEPENDS = "util-macros flex-native bison-native"
+
+SRC_URI = "http://xkbcommon.org/download/${PN}-${PV}.tar.bz2"
+SRC_URI[md5sum] = "2be3d4a255d02c7d46fc6a9486f21f6a"
+SRC_URI[sha256sum] = "74eb0a121ca3998015fd687591426bb15c524645a72cf602831b2e729172fb42"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=9c0b824e72a22f9d2c40b9c93b1f0ddc"
+
+PR = "r0"
+
+EXTRA_OECONF = "--disable-docs"
-- 
1.7.10



