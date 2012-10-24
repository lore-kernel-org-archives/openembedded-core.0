Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TQwBw-0001af-Ot
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Oct 2012 10:19:57 +0200
Received: by mail-wi0-f177.google.com with SMTP id hj13so181457wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Oct 2012 01:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=7mdXfq5E0zdRSZaq7cE+StM8iqybyQesrAmnxt+shio=;
	b=J27gYUK/dScPTlsdDkdASovGd0yMReKVpweYFZO2y8YtMfHMcOBNPsrHfDxovdzjhs
	LkbRmAVxBapd43Sq4WtAHsJAOf0xSVVtp6d2MkP50GspoFemurwmHyTZp5ejnjeDdKG2
	cyPuD/pkkz/7m8U6bONkhI3Orujsxz9n5jueEdooFcDVlKLZgCzqzJgA0xzvlJIDsFTe
	tDsHiEMWKR9agZHiFBxWdtSkUhQL1HmJGozhWje/KJ2FbPffN9X1la/5YdMNi33R1XZl
	GES/FstwT4DTG2iDRUYQbI6l4a7OLPUfbJRUGSE0cjp79HFyHFXvaLr1sSdUVJNB5cVC
	8OmQ==
Received: by 10.180.24.4 with SMTP id q4mr470542wif.19.1351065991877;
	Wed, 24 Oct 2012 01:06:31 -0700 (PDT)
Received: from localhost.localdomain (ip-109-91-251-94.unitymediagroup.de.
	[109.91.251.94])
	by mx.google.com with ESMTPS id ei1sm3534677wid.7.2012.10.24.01.06.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 24 Oct 2012 01:06:31 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Oct 2012 10:05:16 +0200
Message-Id: <1351065917-14779-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1351065917-14779-1-git-send-email-schnitzeltony@googlemail.com>
References: <1351065917-14779-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [V3 3/4] sato-icon-theme: fix build
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
X-List-Received-Date: Wed, 24 Oct 2012 08:19:57 -0000
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
 .../sato-icon-theme/sato-icon-theme_0.4.1.bb       |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

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
index cd34cac..ead2f7d 100644
--- a/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb
+++ b/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb
@@ -1,8 +1,8 @@
 require sato-icon-theme.inc
 
-DEPENDS += "icon-naming-utils-native"
+DEPENDS += "icon-naming-utils-native libxml-simple-perl-native"
 
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "http://pokylinux.org/releases/sato/${BPN}-${PV}.tar.gz \
            file://iconpath-option.patch \
-- 
1.7.6.5



