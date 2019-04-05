Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id C91116BE2D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Apr 2019 06:37:58 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id a184so5448084wma.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Apr 2019 23:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=x1rTDxrdXQ3AK6e62Zp376xc0hwv59R44uF9BUFI0hI=;
	b=dsyw5eurqXiZCihZciH0eHN1k3AZ+TIBnh2enZYCWga/8AZ9+dHLcnDhWH+fx8+LOU
	p0/ew5kCp2qB1RQHtXHrvBR4yzN2WUfaEJy1LNyWh8o2V7UI5EGeezWd3OYbqciC2j97
	2GDC+1yatiwPgTKnqRIPFVs5BZLV3TPu5nbbFoCNfTiQ8oJfWtPhjViwfQCwDiYQWouf
	bw83yHJXszNAlBICukkXyIn9rYFog+abAjSp7hxNoUh3h2pMsHPpogg9yfeabBZbAaK6
	KofTZQPkjhHPV9zuaxJKqEK/o9HFe/kt32JgvI9XFHW705CVajUSYdFcGvb8RvUGHc4E
	dH4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=x1rTDxrdXQ3AK6e62Zp376xc0hwv59R44uF9BUFI0hI=;
	b=e6IiOX177nek2ilqfDwCOFk95/XjzwzuWalXs+8HkqCSkrngBOJfchpYcTnkY71nYg
	c+fhrc0xzFodAYoc6ClpgA6cbcdZj4jWEkhVXt9gTGG0zLOre1VTm8xbffniN3ljNW+x
	9JPFfU2ImN2Jes3+eGZk41YsTlcvKxoGKh1hjKQzt66I9/OzAl5y6Wgde2sbVGV0vQ7Y
	EiSzSZfPGJ4LUZ+uh5AXO7vpUsjlpSt4jEAuBiM6f3dIMQDstgj60deDXkV8eH4vsWE1
	wMwqUYAc6Xk5W0TZJl9qykHHt54ROjCKRY0Uml6dqYI5vo5ZGGCgkgSTsZB6kOk6SRrj
	EwSQ==
X-Gm-Message-State: APjAAAVyyW+UCKi254tGEZmgWXMhoIRS80FMsv8gsnyNz4fzJtz+ngnm
	M+Ecm5LjaQgrE53wEQ18aHAUQ7Sh
X-Google-Smtp-Source: APXvYqxkn5eQ6MbuuB4T83Euu/YHF6xBILQOVlW28390LppFQrAhpGByP65kU1l1KMdCw4ajC9C4Zw==
X-Received: by 2002:a1c:5f06:: with SMTP id t6mr6906740wmb.7.1554446279469;
	Thu, 04 Apr 2019 23:37:59 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F05D917A4978A6EAA704508.dip0.t-ipconnect.de.
	[2003:f0:7f05:d917:a497:8a6e:aa70:4508])
	by smtp.gmail.com with ESMTPSA id
	g132sm1185443wme.3.2019.04.04.23.37.58
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 04 Apr 2019 23:37:58 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org,
	alex.kanavin@gmail.com
Date: Fri,  5 Apr 2019 08:37:35 +0200
Message-Id: <20190405063736.29750-13-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190405063736.29750-1-schnitzeltony@gmail.com>
References: <20190405063736.29750-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 12/13] glib-networking: upgrade 2.58.0 -> 2.60.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Apr 2019 06:37:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

this version support gnutls option again - it was mandatory for 2.58.0

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...-networking_2.58.0.bb => glib-networking_2.60.1.bb} | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-core/glib-networking/{glib-networking_2.58.0.bb => glib-networking_2.60.1.bb} (71%)

diff --git a/meta/recipes-core/glib-networking/glib-networking_2.58.0.bb b/meta/recipes-core/glib-networking/glib-networking_2.60.1.bb
similarity index 71%
rename from meta/recipes-core/glib-networking/glib-networking_2.58.0.bb
rename to meta/recipes-core/glib-networking/glib-networking_2.60.1.bb
index f3190e1cae..09af229d69 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.58.0.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.60.1.bb
@@ -9,15 +9,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 SECTION = "libs"
 DEPENDS = "glib-2.0"
 
-SRC_URI[archive.md5sum] = "75b14b7e73a67753be9ce307751c661d"
-SRC_URI[archive.sha256sum] = "bdfa0255e031b8ee003cc283002536b77ee76450105f1dc6ab066b9bf4330068"
+SRC_URI[archive.md5sum] = "83321ffc3c336894b8a5bc18db3fe58d"
+SRC_URI[archive.sha256sum] = "d71c6b2faa5ac29100314f08a1be020a2afd0291f025614c0af0d17b14435d92"
 
 PACKAGECONFIG ??= "gnutls"
 
-PACKAGECONFIG[gnutls] = "-Dgnutls=true,-Dgnutls=false,gnutls"
-PACKAGECONFIG[libproxy] = "-Dlibproxy_support=true,-Dlibproxy_support=false,libproxy"
+PACKAGECONFIG[gnutls] = "-Dgnutls=enabled,-Dgnutls=disabled,gnutls"
+PACKAGECONFIG[libproxy] = "-Dlibproxy=enabled,-Dlibproxy=disabled,libproxy"
 
-EXTRA_OEMESON = "-Dgnome_proxy_support=false"
+EXTRA_OEMESON = "-Dgnome_proxy=disabled"
 
 GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase gettext upstream-version-is-even gio-module-cache
-- 
2.20.1


