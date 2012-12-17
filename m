Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TkeIW-0008Gn-2Y
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Dec 2012 18:16:13 +0100
Received: from mail-wi0-f197.google.com ([209.85.212.197])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 17 Dec 2012 09:00:37 -0800
Received: by mail-wi0-f197.google.com with SMTP id hm6so2706104wib.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2012 09:01:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=3kSgcAiEuEyhIs19426ZMF7Lw1XdJMIv7ZhIDKl4Iqc=;
	b=KoGyrIpvK5Eduf3gJDiEZcs8jlqbZYVCerUUu0g2+JQVHVZfxYRTeRNeJHPa3Xy+MQ
	WIh1ffXUrJTcfo4ldKTt6LgG+dDthNVr7lKfaQuxBaIqJXvSUwbnB/bFAVrlfT4/RxeO
	wgBSaBsFnI6gpwnrS5edyxwKhhIhK9Sm0gRTI3kuOcQcZ3ASbkmSIAOUzrdc2k1Ckg+R
	+s1x5ue6MFNZAjOhWzCjlmEh9Nr4oGdqIZ2d6KHnee7OeZhYC4E53rw7vjOvFbUFKBAH
	NrytfX6A4B6/l899gYMF7dgz9LY9q6dD3Bcb52vlkr5eg9QzkeuVqZZheSYk3M/Tmyof
	8r2A==
Received: by 10.180.101.229 with SMTP id fj5mr16541498wib.7.1355763687375;
	Mon, 17 Dec 2012 09:01:27 -0800 (PST)
Received: by 10.180.101.229 with SMTP id fj5mr16541442wib.7.1355763686906;
	Mon, 17 Dec 2012 09:01:26 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id fv2sm11928720wib.4.2012.12.17.09.01.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Dec 2012 09:01:26 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Dec 2012 16:59:45 +0000
Message-Id: <1355763585-984-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQlPjkgB5g+8tf3IbJeqNwRSL3lm2uoz5I6V1VtFcTTfYo1pD4p2RMJm3OPkTdt85lfk4DgDyIfgLv6kpliuME94kXg/r7BLoowqqiazkDgvyz0S0tks4O6q4TSrQ3bQE+dH8wyBggdp4aLdkE5rAswnHoRmi11E0eFAoxO3M5ibagu+HgKBrR38C7Fc3rIrairn99dA
Subject: [PATCH] gst-meta-base: don't rdepend on ximagesink/xvimagesink
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
X-List-Received-Date: Mon, 17 Dec 2012 17:16:13 -0000

Loosen these dependencies to recommends, as some targets won't want or build
these sinks.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb b/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb
index 21243c6..37c70c2 100644
--- a/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 
-PR = "r12"
+PR = "r13"
 
 PACKAGES = "\
     gst-meta-base \
@@ -33,7 +33,7 @@ RDEPENDS_gst-meta-base = "\
     gst-plugins-good-autodetect \
     gst-plugins-good-souphttpsrc"
 
-RDEPENDS_gst-meta-x11-base = "\
+RRECOMMENDS_gst-meta-x11-base = "\
     gst-plugins-base-ximagesink \
     gst-plugins-base-xvimagesink"
 
-- 
1.7.10



