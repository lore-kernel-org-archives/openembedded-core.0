Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TQYld-0006rp-5a
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Oct 2012 09:19:13 +0200
Received: by mail-we0-f175.google.com with SMTP id t44so1819934wey.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Oct 2012 00:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=+0XcSorOsH+ctFWvRGP2zWNTAQfcSrFgKv9Htj2LsiA=;
	b=MnQVOUGZCfMIauCIT/0LGLAR5s0cL5BnkpBGrVUaWa1uicpuEW/vAYCDIakMlGN5wJ
	ZrLac4AZlA8ubgFEOjSJSxljLJ65pxOo5jCvJ39ywgmeonTJwxljl2FmLfVXKNBOlwJM
	sZc5IQCT75POkHYqn3V9Ul7sbwnjEGVha8dvocg9d0v5ikLCh+4xIGXZPJ8VQ3C8fwmI
	qJJwWvO6HTOzl5Li+bqu3QYa7n07k1JQvPXZpHoHfm2OKUahOT5tvtqk2p7qchehE+tO
	BwJjQRpejZjU6F7XpzTV8N6H+KqK1sr0hfImH6kqOzJ33Bx1mqSb7qOrBKhA7e9SidzV
	LHrg==
Received: by 10.180.84.41 with SMTP id v9mr26689483wiy.8.1350975947670;
	Tue, 23 Oct 2012 00:05:47 -0700 (PDT)
Received: from localhost.localdomain (ip-109-91-251-94.unitymediagroup.de.
	[109.91.251.94])
	by mx.google.com with ESMTPS id cn6sm26296766wib.9.2012.10.23.00.05.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 23 Oct 2012 00:05:46 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Oct 2012 09:04:31 +0200
Message-Id: <1350975871-26719-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1350975871-26719-1-git-send-email-schnitzeltony@googlemail.com>
References: <1350975871-26719-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] sato-icon-theme: fix build
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
X-List-Received-Date: Tue, 23 Oct 2012 07:19:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

| Can't locate XML/Simple.pm in @INC (@INC contains: /usr/local/lib64/perl5 /usr/local/share/perl5 /usr/lib64/perl5/vendor_perl /usr/share/perl5/vendor_perl /usr/lib64/perl5 /usr/share/perl5 .) at /home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/lib/icon-naming-utils/icon-name-mapping line 12.
| BEGIN failed--compilation aborted at /home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/lib/icon-naming-utils/icon-name-mapping line 12.
| make[3]: *** [install-data-local] Error 2
| make[3]: Leaving directory `/home/andreas/tmp/oe-core-eglibc/work/all-angstrom-linux/sato-icon-theme-0.4.1-r5/sato-icon-theme-0.4.1/16x16/actions'
| make[2]: *** [install-am] Error 2
| make[2]: Leaving directory `/home/andreas/tmp/oe-core-eglibc/work/all-angstrom-linux/sato-icon-theme-0.4.1-r5/sato-icon-theme-0.4.1/16x16/actions'
| make[1]: *** [install-recursive] Error 1
| make[1]: Leaving directory `/home/andreas/tmp/oe-core-eglibc/work/all-angstrom-linux/sato-icon-theme-0.4.1-r5/sato-icon-theme-0.4.1/16x16'
| make: *** [install-recursive] Error 1
| ERROR: oe_runmake failed
| ERROR: Function failed: do_install (see /home/andreas/tmp/oe-core-eglibc/work/all-angstrom-linux/sato-icon-theme-0.4.1-r5/temp/log.do_install.21502 for further information)

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../sato-icon-theme/sato-icon-theme.inc            |    2 +-
 .../sato-icon-theme/sato-icon-theme_0.4.1.bb       |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc b/meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc
index 476e925..e014a7d 100644
--- a/meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc
+++ b/meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=56a830bbe6e4697fe6cbbae01bb7c2b2"
 SECTION = "x11"
 DEPENDS = ""
 
-inherit autotools pkgconfig allarch gtk-icon-cache
+inherit autotools pkgconfig allarch gtk-icon-cache perlnative
 
 FILES_${PN} += "${datadir}"
 
diff --git a/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb b/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb
index cd34cac..96d8301 100644
--- a/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb
+++ b/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb
@@ -2,7 +2,7 @@ require sato-icon-theme.inc
 
 DEPENDS += "icon-naming-utils-native"
 
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "http://pokylinux.org/releases/sato/${BPN}-${PV}.tar.gz \
            file://iconpath-option.patch \
-- 
1.7.6.5



