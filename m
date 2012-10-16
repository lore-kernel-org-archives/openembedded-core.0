Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TO7Q1-0007NA-Dt
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Oct 2012 15:42:49 +0200
Received: by mail-wg0-f43.google.com with SMTP id dq11so4728052wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Oct 2012 06:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=M4eFxaFTQR319EsSxz46F9Jv/FMOiqIu5ivweE9wjmI=;
	b=dvS0i1vdLzLTlhPYl6EYRy4Ry7nBuU+gIaOkrvJkdwFQZSJ5dadMYwChWKfDH8Pepg
	0bg+t6tRiSL9mh+9C4Ip5R1gvML2uHzCblCAmVUpZkR6phhO6dVTT7xnlP4FGHw3FZWv
	hH8YaEX18EtaEzoKzWQktkYghngLJdtiIaoMUuZ5ZxwCa+2NjwDRnQwTE47NI0UYc7sj
	sVYCduv1MWGmQO6nL/qPdy8ImU37XAOQapUpoO1KHadj4u0BAX++po42mivISix+oMkz
	CIYe71vjrIXIR5MqXPsHpAmklWp+af+PvdXrf76+y8YXislA3X9XGDCyb7tjsiwiUkpT
	C9fg==
Received: by 10.180.90.201 with SMTP id by9mr31986608wib.5.1350394172897;
	Tue, 16 Oct 2012 06:29:32 -0700 (PDT)
Received: from localhost.localdomain (ip-109-91-251-94.unitymediagroup.de.
	[109.91.251.94])
	by mx.google.com with ESMTPS id v3sm19172402wiw.7.2012.10.16.06.29.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 16 Oct 2012 06:29:32 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Oct 2012 15:28:21 +0200
Message-Id: <1350394101-15120-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1350394101-15120-1-git-send-email-schnitzeltony@googlemail.com>
References: <1350394101-15120-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] gnome-icon-theme: remove unused configure variable
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
X-List-Received-Date: Tue, 16 Oct 2012 13:42:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

configure: WARNING: unrecognized options: --disable-silent-rules, --with-libtool-sysroot, --disable-hicolor-check

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb b/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb
index d322686..22e0c74 100644
--- a/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb
+++ b/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb
@@ -19,6 +19,6 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/2.31/${BPN}-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "8e727703343d4c18c73c79dd2009f8ed"
 SRC_URI[sha256sum] = "ea7e05b77ead159379392b3b275ca0c9cbacd7d936014e447cc7c5e27a767982"
 
-EXTRA_OECONF = "--disable-hicolor-check --with-iconmap=${STAGING_LIBDIR_NATIVE}/../libexec/icon-name-mapping"
+EXTRA_OECONF = "--with-iconmap=${STAGING_LIBDIR_NATIVE}/../libexec/icon-name-mapping"
 
 inherit autotools perlnative
-- 
1.7.6.5



