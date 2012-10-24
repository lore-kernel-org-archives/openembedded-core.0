Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TQwBw-0001ag-2C
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Oct 2012 10:19:56 +0200
Received: by mail-we0-f175.google.com with SMTP id t44so111310wey.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Oct 2012 01:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=uWf/KARUiOaXggiB3fbR83EndbosJ3mAx/TfW3Cmp04=;
	b=qo3+7Adrc4t9KPL8IVCdZ2Od/V1L7WnEyjGXtTzASpLEdxNtuxqrGx5wn3F17AwRRg
	Kq+CWHWSTdj4cobiqA45G9RxchQRDU06feZR0L4+H5uP/w8BxcPht0Htu5Rj999UEaYv
	9q6QfuZPabsQWEMM18SjrtG3LAkUDB9sOpyjZh8IvqddJOzbWSZdUguD5Kjw+ke3Ec59
	xbOgvDDXUmlYKO6R7fmsdSEPDO80pUJ3GiRDmOiGab/3FXIDanNAAWEU7cciuOJK1Smd
	0QohQxjDWdR4L/aFwTiGFvTRQRXov8f49W5bwLOdR1Ij+tU1WbmLbtFqd1JmuCyU8ff9
	9zCw==
Received: by 10.216.225.142 with SMTP id z14mr7950668wep.38.1351065989196;
	Wed, 24 Oct 2012 01:06:29 -0700 (PDT)
Received: from localhost.localdomain (ip-109-91-251-94.unitymediagroup.de.
	[109.91.251.94])
	by mx.google.com with ESMTPS id ei1sm3534677wid.7.2012.10.24.01.06.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 24 Oct 2012 01:06:28 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Oct 2012 10:05:14 +0200
Message-Id: <1351065917-14779-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1351065917-14779-1-git-send-email-schnitzeltony@googlemail.com>
References: <1351065917-14779-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [V3 1/4] gnome-icon-theme: fix icon mapping
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
X-List-Received-Date: Wed, 24 Oct 2012 08:19:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Multiple errors in log.do_install as:
Can't locate XML/Simple.pm in @INC (@INC contains: /usr/local/lib64/perl5 /usr/local/share/perl5 /usr/lib64/perl5/vendor_perl /usr/share/perl5/vendor_perl /usr/lib64/perl5 /usr/share/perl5 .) at /home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/lib/../libexec/icon-name-mapping line 12.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb b/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb
index 8e7995b..2eb5fda 100644
--- a/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb
+++ b/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb
@@ -6,10 +6,10 @@ LICENSE = "LGPLv3+ | CC-BY-SA-3.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e7e289d90fc8bdceed5e3f142f98229e"
 
 SECTION = "x11/gnome"
-DEPENDS = "icon-naming-utils-native glib-2.0 intltool-native"
+DEPENDS = "icon-naming-utils-native glib-2.0 intltool-native libxml-simple-perl-native"
 RDEPENDS_${PN} = "hicolor-icon-theme"
 RRECOMMENDS_${PN} = "librsvg-gtk"
-PR = "r3"
+PR = "r4"
 
 FILES_${PN} += "${datadir}/*"
 
@@ -22,5 +22,4 @@ SRC_URI[sha256sum] = "ea7e05b77ead159379392b3b275ca0c9cbacd7d936014e447cc7c5e27a
 EXTRA_OECONF = "--disable-hicolor-check"
 EXTRA_OECONF += "--with-iconmap=${@d.getVar('STAGING_LIBEXECDIR_NATIVE', True).replace('gnome-icon-theme', 'icon-naming-utils')}/icon-name-mapping"
 
-
-inherit autotools
+inherit autotools perlnative
-- 
1.7.6.5



