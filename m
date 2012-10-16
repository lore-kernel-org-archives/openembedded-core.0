Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TO7Q0-0007N3-2o
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Oct 2012 15:42:48 +0200
Received: by mail-wi0-f177.google.com with SMTP id hj13so3027847wib.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Oct 2012 06:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=Ii8ffikZaEQWryLXoDIE3Wo3VjLrq7iEnwQDNEjyLpg=;
	b=fwFuZdvSXDsw1C2y60pPMukSiSgGAdr4IWH3Gs2dfUtRzhWqDgbt6ODkP82iax4HG1
	RiAlPw8wh/RCyumMdgtS8JSCXk862BZF6H+wMdOwnu6FWXHsm9NWD7NxbfBRcsoiQkFM
	9em79Ln3qd2RvQF0aAcqGKH1AOszJSAEdM6hM3Ol1WyncHBNK9sR+tWzf1ItoFmWK2WH
	5aWYU+ld+c8VLUt6O+hvJKoSIPzdysDZSaU1rl1XDS3NTwhkYE7xJbKmPoXjLPaCH8Q5
	LMpaS3uYeNgpHMS896I4sLQfowR7WTOS0lm8mRsCEY2ArqsaUTYJfd/HojwGhbgFZ6dJ
	J5Ww==
Received: by 10.180.82.34 with SMTP id f2mr31943463wiy.17.1350394171540;
	Tue, 16 Oct 2012 06:29:31 -0700 (PDT)
Received: from localhost.localdomain (ip-109-91-251-94.unitymediagroup.de.
	[109.91.251.94])
	by mx.google.com with ESMTPS id v3sm19172402wiw.7.2012.10.16.06.29.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 16 Oct 2012 06:29:30 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Oct 2012 15:28:20 +0200
Message-Id: <1350394101-15120-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1350394101-15120-1-git-send-email-schnitzeltony@googlemail.com>
References: <1350394101-15120-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] gnome-icon-theme: fix icon mapping
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
X-List-Received-Date: Tue, 16 Oct 2012 13:42:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Multiple errors in log.do_install as:
Can't locate XML/Simple.pm in @INC (@INC contains: /usr/local/lib64/perl5 /usr/local/share/perl5 /usr/lib64/perl5/vendor_perl /usr/share/perl5/vendor_perl /usr/lib64/perl5 /usr/share/perl5 .) at /home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/lib/../libexec/icon-name-mapping line 12.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb b/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb
index e4b61fd..d322686 100644
--- a/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb
+++ b/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb
@@ -9,7 +9,7 @@ SECTION = "x11/gnome"
 DEPENDS = "icon-naming-utils-native glib-2.0 intltool-native"
 RDEPENDS_${PN} = "hicolor-icon-theme"
 RRECOMMENDS_${PN} = "librsvg-gtk"
-PR = "r3"
+PR = "r4"
 
 FILES_${PN} += "${datadir}/*"
 
@@ -21,4 +21,4 @@ SRC_URI[sha256sum] = "ea7e05b77ead159379392b3b275ca0c9cbacd7d936014e447cc7c5e27a
 
 EXTRA_OECONF = "--disable-hicolor-check --with-iconmap=${STAGING_LIBDIR_NATIVE}/../libexec/icon-name-mapping"
 
-inherit autotools
+inherit autotools perlnative
-- 
1.7.6.5



