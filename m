Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id AC2D07D672
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 20:15:45 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id l199so2000027qke.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 13:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version:organization
	:content-transfer-encoding;
	bh=1Lj0GtN4jHPxWEPQMf9okKG1Nvu//u44BNL//dZ4THU=;
	b=PF1VD6OJAvIosiT74YqcOxXptGqEVAdQVxrewfUhqIrKsPF4TwMcsvwIAtoDZRxMyV
	kNrQfjQwVlRdoaW4UxWeGDNNEtISfWctfO3mRnS88SQpWeNsRP1tjzC3ZI30QlrTkhST
	tYjOlCeG0mQeXACSSnrLrXkkNvA3CSUBXQh1DhFqsPllC5ENPYbnJHndlqnFb+tChiBr
	bdXSHo7a9sxVvS+Sd8fOty+kLoABEulsL1Q0f2+mvS/E+zCTQEcoWs/GraoN6XEhHD+B
	ybIDwYmXoIaC8nibcM/q6tElL5/cQBAKynPR3H9GhjGWS+C+5lTdRyRNQvUnOAsbChlo
	gqMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:organization:content-transfer-encoding;
	bh=1Lj0GtN4jHPxWEPQMf9okKG1Nvu//u44BNL//dZ4THU=;
	b=nTbdFuiwb0DomQyfwVofihOnNdQH/EPTRqN0X1l4/+ZGp9WUJUscrqjx6U9c2R1Hxp
	7BScvemEhaRdSt8dfNS8lU7ODUECt86bKxn3Z80bd5qOzrirEkSLXGEOuIrICf5F8tIp
	3g1SD6rDi/2t4VSmVimqn56meWhf5xXjgfvPrksgawMA4h4fcM4CJF+rd7IaUmry5snk
	o5nnOzQIiT0z7d06OuzlPM/TzOBQ8u7I9nGa0ggcpQ/AKrtsSNp6SKTiuueg/ItOARqW
	f6m1q67EXqLTtu/vqp3kuy8zzWtnzp43eAa7aCKHpzGDXC9N+272b3N/RxdbBzSbHc/v
	Q+6Q==
X-Gm-Message-State: APjAAAWQVg2EBNWuZrmZX65fgnZIAvam3Me4lyLq6zip5ECu0OMApxmA
	EnsuScTUcJteKJqbg8tCmwozDRbTWBmcXg==
X-Google-Smtp-Source: APXvYqzq4rBZlKuzHzUq9umbyLw2a9PhBtH9dMGAGQhNk+hwdU7/0BFG4RZEdjmKBV/PHIDkQC1c7Q==
X-Received: by 2002:a37:4948:: with SMTP id w69mr27247227qka.122.1556136946401;
	Wed, 24 Apr 2019 13:15:46 -0700 (PDT)
Received: from centrium.lab.ossystems ([181.220.83.165])
	by smtp.gmail.com with ESMTPSA id y7sm6801607qki.14.2019.04.24.13.15.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Apr 2019 13:15:45 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Apr 2019 17:15:29 -0300
Message-Id: <20190424201529.28928-1-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Subject: [PATCH] mesa: Update 19.0.1 -> 19.0.3
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
X-List-Received-Date: Wed, 24 Apr 2019 20:15:45 -0000
Content-Transfer-Encoding: 8bit

Mesa 19.0.3 is a bug fix release which fixes bugs found since the
19.0.1 release.

For full log see:

https://www.mesa3d.org/relnotes/19.0.2.html
https://www.mesa3d.org/relnotes/19.0.3.html

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 .../mesa/{mesa-gl_19.0.1.bb => mesa-gl_19.0.3.bb}             | 0
 meta/recipes-graphics/mesa/{mesa_19.0.1.bb => mesa_19.0.3.bb} | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_19.0.1.bb => mesa-gl_19.0.3.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_19.0.1.bb => mesa_19.0.3.bb} (85%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_19.0.1.bb b/meta/recipes-graphics/mesa/mesa-gl_19.0.3.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_19.0.1.bb
rename to meta/recipes-graphics/mesa/mesa-gl_19.0.3.bb
diff --git a/meta/recipes-graphics/mesa/mesa_19.0.1.bb b/meta/recipes-graphics/mesa/mesa_19.0.3.bb
similarity index 85%
rename from meta/recipes-graphics/mesa/mesa_19.0.1.bb
rename to meta/recipes-graphics/mesa/mesa_19.0.3.bb
index d90be8a074..585c3ede23 100644
--- a/meta/recipes-graphics/mesa/mesa_19.0.1.bb
+++ b/meta/recipes-graphics/mesa/mesa_19.0.3.bb
@@ -7,8 +7,8 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0004-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch \
 "
 
-SRC_URI[md5sum] = "19636bb3da35c21f43040d31e575d5ce"
-SRC_URI[sha256sum] = "6884163c0ea9e4c98378ab8fecd72fe7b5f437713a14471beda378df247999d4"
+SRC_URI[md5sum] = "d03bf14e42c0e54ebae5730712ccc408"
+SRC_URI[sha256sum] = "f027244e38dc309a4c12db45ef79be81ab62c797a50a88d566e4edb6159fc4d5"
 
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
-- 
2.20.1


