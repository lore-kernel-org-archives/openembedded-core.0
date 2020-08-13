Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web11.2323.1597345307064744128
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2020 12:01:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=kOPwWTu+;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=pkdr=bx=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4BSGBv3YD0z23
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2020 21:01:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1597345303;
	bh=tXV8jUGumlIBH+6JDoGi/Gkpsxt7ctfoc/euW93u7dQ=;
	h=From:To:Subject:Date:From;
	b=kOPwWTu+9ZLkXyu9nEsA4hu/jZjXKy4V7UDv97L+u0AP3qb8UBisc27avjl8PZsFT
	 j9EdAOku0ZXSAeFW3HGnHtOFd4SxezjLnzuTmRBpXqFAJiC2k/OMwP3W6oDJlYN67l
	 G7WLW6Np+GcJaWQpySnWpogiljq6La54yr/C5adHX8/bUqudkQ/kjTOKIlaWNbo++3
	 bG+fQRRB4RjdWCAIZsN/9iB9ES1XZi7IXSmTSkeWSZflIOT6u87cK037baySSPVftC
	 Ypcapxuikdwq8ZYXU88IbqmzySNxcdjPd0v5bu+jNTiqUA5vIBq/iaBw41tLO4ZxXY
	 D5OTe3I9KV9yPo3mrUv7szPl7hpZ81jEvigfMCN/6ouAIArm8jSAW2SUyi++gU3irJ
	 D+fBrpf0hSCWNafASjEuMFLLWTz6vgA6tTpKyJfe8ZzeHuNSUYz9GELnIBCPVc2oxs
	 AEs0T7iyyFIRoi1cnwMAKcveAKlFjjynALjFUCNLaE6CZdspOLeit7z/cDLaETtXV0
	 IQ6Iu4+20EOuLxwr0q0GeleHMajNJTmR7ke95rWi2S2xwjE5wm0zLGrfVnVeht1+mS
	 K0FaH0lnNsUwl18aO355xAgCb9BqvznlYFa6xX+KMRCDzp03eMfZ+VLfsZmPMQR0+z
	 HMJOAecimbQaxFR6pTogZAYk=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] librsvg: Upgrade 2.40.20 -> 2.40.21
Date: Thu, 13 Aug 2020 22:01:42 +0300
Message-Id: <20200813190142.25315-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1

This fixes CVE-2019-20446.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../librsvg/{librsvg_2.40.20.bb => librsvg_2.40.21.bb}         | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-gnome/librsvg/{librsvg_2.40.20.bb => librsvg_2.40.21.bb} (92%)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.40.20.bb b/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb
similarity index 92%
rename from meta/recipes-gnome/librsvg/librsvg_2.40.20.bb
rename to meta/recipes-gnome/librsvg/librsvg_2.40.21.bb
index 337299ff69..acdbc1f1b3 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.40.20.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb
@@ -23,8 +23,7 @@ SRC_URI += "file://gtk-option.patch \
             file://0001-Remove-non-reproducible-SRCDIR.patch \
 "
 
-SRC_URI[archive.md5sum] = "4949d313b0c5d9161a5c259104af5568"
-SRC_URI[archive.sha256sum] = "cff4dd3c3b78bfe99d8fcfad3b8ba1eee3289a0823c0e118d78106be6b84c92b"
+SRC_URI[archive.sha256sum] = "f7628905f1cada84e87e2b14883ed57d8094dca3281d5bcb24ece4279e9a92ba"
 
 CACHED_CONFIGUREVARS = "ac_cv_path_GDK_PIXBUF_QUERYLOADERS=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders"
 
-- 
2.17.1

