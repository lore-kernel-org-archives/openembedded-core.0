Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TQYlb-0006qr-Kw
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Oct 2012 09:19:11 +0200
Received: by mail-wi0-f169.google.com with SMTP id hq4so2723728wib.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Oct 2012 00:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=fLcdhC7dn+Hj5LaD29vuhcBdjaMMEpkl14eaFmlhuIc=;
	b=bDdYMPjHI8hqs36jngPhG9p2EI12uctb4OfLX7kkMWwHY2MCM+5I3KkYIkeGfPSXC5
	dQsozJ2D9KryNXz+E4KH4GofbC7EciuuMqxOVrWG7uDqdPnJOoveNtc2QxCH2A1gc/zg
	StIuwMLyt1CthQagXbrD5/j3A+Jv8l58mnZtdysUGyKwnElWdRfGBD9Ut2KJqKwccBZr
	tNJdrtROkurQDG3NZYCZ4520uAb9T9tGS59MZG3nnSHrUbyOzcZunttGCOVzAv0uYcLZ
	HFx0TaqkkTuFW+LOHNxVVjTc29euAo2EhxDpJ1ZQHJz32Nsh13xNJ/c2DwY3N3pXuAou
	OCQw==
Received: by 10.180.86.202 with SMTP id r10mr26735850wiz.12.1350975946111;
	Tue, 23 Oct 2012 00:05:46 -0700 (PDT)
Received: from localhost.localdomain (ip-109-91-251-94.unitymediagroup.de.
	[109.91.251.94])
	by mx.google.com with ESMTPS id cn6sm26296766wib.9.2012.10.23.00.05.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 23 Oct 2012 00:05:45 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Oct 2012 09:04:30 +0200
Message-Id: <1350975871-26719-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1350975871-26719-1-git-send-email-schnitzeltony@googlemail.com>
References: <1350975871-26719-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] gnome-icon-theme: remove unused configure variable
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
X-List-Received-Date: Tue, 23 Oct 2012 07:19:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

configure: WARNING: unrecognized options: --disable-silent-rules, --with-libtool-sysroot, --disable-hicolor-check

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb b/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb
index f017b56..afdf4cb 100644
--- a/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb
+++ b/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb
@@ -19,7 +19,6 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/2.31/${BPN}-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "8e727703343d4c18c73c79dd2009f8ed"
 SRC_URI[sha256sum] = "ea7e05b77ead159379392b3b275ca0c9cbacd7d936014e447cc7c5e27a767982"
 
-EXTRA_OECONF = "--disable-hicolor-check"
-EXTRA_OECONF += "--with-iconmap=${@d.getVar('STAGING_LIBEXECDIR_NATIVE', True).replace('gnome-icon-theme', 'icon-naming-utils')}/icon-name-mapping"
+EXTRA_OECONF = "--with-iconmap=${@d.getVar('STAGING_LIBEXECDIR_NATIVE', True).replace('gnome-icon-theme', 'icon-naming-utils')}/icon-name-mapping"
 
 inherit autotools perlnative
-- 
1.7.6.5



