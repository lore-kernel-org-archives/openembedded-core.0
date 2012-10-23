Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TQYla-0006qf-I2
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Oct 2012 09:19:10 +0200
Received: by mail-wi0-f171.google.com with SMTP id hj13so2861276wib.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Oct 2012 00:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=5ESKxWVkIJk8r6c/0SfoF9mXuZybo7D/PWf0FYpBx5A=;
	b=fYpIHmCkkQLkAPIMaEiJ5EyIc0UVnwzL4LF3F40oXCOWelEL6h4weaDCLxxbLU+C4x
	U6ElzTkSUF7bfmNXlaOdNx4py1oiS9oraLVxBGhLeTOETeqpP4uns9zn8BupZPdlZFvS
	H01u5D7Hn+oqhbFI+3yULOpBgiF9M8oSy1xRDBVJUis0RArNj93uR5xteGEeCnjjEv7k
	8pXpBdMPqsJz7XbuFnqdX7QgqebO6RsbVnz8qXAjLYimUFmjqLXJBjKkUDoqmWFz7pdh
	BG1VCiwpsUgSKol9+To2Mm+Ud6Jt0df172BlAlfgyZ6S+JjvdLxZ1BkSN3lU52YaLbON
	RwaA==
Received: by 10.180.100.35 with SMTP id ev3mr42466276wib.7.1350975944838;
	Tue, 23 Oct 2012 00:05:44 -0700 (PDT)
Received: from localhost.localdomain (ip-109-91-251-94.unitymediagroup.de.
	[109.91.251.94])
	by mx.google.com with ESMTPS id cn6sm26296766wib.9.2012.10.23.00.05.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 23 Oct 2012 00:05:43 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Oct 2012 09:04:29 +0200
Message-Id: <1350975871-26719-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1350975871-26719-1-git-send-email-schnitzeltony@googlemail.com>
References: <1350975871-26719-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] gnome-icon-theme: fix icon mapping
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
X-List-Received-Date: Tue, 23 Oct 2012 07:19:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Multiple errors in log.do_install as:
Can't locate XML/Simple.pm in @INC (@INC contains: /usr/local/lib64/perl5 /usr/local/share/perl5 /usr/lib64/perl5/vendor_perl /usr/share/perl5/vendor_perl /usr/lib64/perl5 /usr/share/perl5 .) at /home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/lib/../libexec/icon-name-mapping line 12.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb b/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb
index 8e7995b..f017b56 100644
--- a/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb
+++ b/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb
@@ -9,7 +9,7 @@ SECTION = "x11/gnome"
 DEPENDS = "icon-naming-utils-native glib-2.0 intltool-native"
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



