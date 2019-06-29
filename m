Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 51A337E726
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jun 2019 16:53:26 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id 131so8940006ljf.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jun 2019 09:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=pwY2I+LFNeMzVJgxULFY3q44sFoGlerk68LppTmUVe4=;
	b=ZGDqOg8eZrSMjmGwQveitNiNsBXYCcpX+f80TkMPgQODxlljZUTXlFWIrzFQp9TR7b
	PRPBrDy+t4Hztg/C3Gbmq6cIf09G1AMJHPeteXUj8WsV11QfICqAlD3cBkOgJaTumnU8
	TRpDQzoRqoaCLlTWshVTYOoMJNmGNTyL/UkEuPSqSZ/JXYNUxc/omJwmf/uBwbEh28g3
	JovEAzgwbVrnhv8paIqugNAT0ihRO5DOHMiw702dKDoduy/Z42AEwXGglbL58qsKC3vo
	bEHYgcXiszUvQSTzRZUGmhoPe9heo6OtszuZ1qtX6ZzYXFJ8HifshydexxJgNCBzdQiu
	RVFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=pwY2I+LFNeMzVJgxULFY3q44sFoGlerk68LppTmUVe4=;
	b=miXQld8rhhCpt2tCUJcVi+YZQjQ3GKmHhLqbi4GPK7guK00FJwXkSQ1x0lx4nejRJG
	tEzobdlQJ6CDhZUJLb2VC+SJoMxz1ZGqWo3HvXqglhT24WTAlWdp10rsmBieAxKKuiz8
	Rsfw8fQn1QiBiELq5kLejHl65VTxsz8NvRMLniljadlVrC5bGw2IBOf4CUyGkRzx2SjG
	UhPWto0S+2ZxDQElSE7wIO2UbMsvUoPLdX8qFB6PrOcCCoRUGhn1GkhuFblPQ9m/6Xsb
	r7oNJmCJiO6VDoaQcUFd/rk2v0YdzXG3t9yFu+grB3ui3h2tFKJR5VxWDJhiavTp7xy0
	7tMw==
X-Gm-Message-State: APjAAAW1cdl3+H7Q7txeGbkPhT4FJdSOeYRq9G1ZmasDWV7wg7fxHbAb
	rrkKT3jXoyK9Mmv//PaHfqKCLyktVVM=
X-Google-Smtp-Source: APXvYqyTt/GDa5ciIw/o/7rheR7ju03U3gAoQLy4d7na8gg/7+R6oc7fHM5ece206KxwfVIlHWk6nw==
X-Received: by 2002:a2e:9a87:: with SMTP id p7mr9251876lji.133.1561827207470; 
	Sat, 29 Jun 2019 09:53:27 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	c15sm1798280lja.79.2019.06.29.09.53.26
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 29 Jun 2019 09:53:27 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 29 Jun 2019 18:53:25 +0200
Message-Id: <20190629165325.29137-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] apt: update to 1.2.31
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
X-List-Received-Date: Sat, 29 Jun 2019 16:53:27 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../apt/{apt-native_1.2.24.bb => apt-native_1.2.31.bb}        | 0
 meta/recipes-devtools/apt/apt.inc                             | 4 ++--
 meta/recipes-devtools/apt/{apt_1.2.24.bb => apt_1.2.31.bb}    | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/apt/{apt-native_1.2.24.bb => apt-native_1.2.31.bb} (100%)
 rename meta/recipes-devtools/apt/{apt_1.2.24.bb => apt_1.2.31.bb} (100%)

diff --git a/meta/recipes-devtools/apt/apt-native_1.2.24.bb b/meta/recipes-devtools/apt/apt-native_1.2.31.bb
similarity index 100%
rename from meta/recipes-devtools/apt/apt-native_1.2.24.bb
rename to meta/recipes-devtools/apt/apt-native_1.2.31.bb
diff --git a/meta/recipes-devtools/apt/apt.inc b/meta/recipes-devtools/apt/apt.inc
index 842c30240b..b855099e52 100644
--- a/meta/recipes-devtools/apt/apt.inc
+++ b/meta/recipes-devtools/apt/apt.inc
@@ -15,8 +15,8 @@ SRC_URI = "https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/${BPN}/${P
            file://0001-apt-1.2.12-Fix-musl-build.patch \
            file://0001-Include-array.h-for-std-array.patch \
            "
-SRC_URI[md5sum] = "ce8f9ab11f4fd0a08ec73eaffd75c8f0"
-SRC_URI[sha256sum] = "fa1311a9ce00e72379a0a3bc6d240ba30c0968cfbbb3472859e50b99e24e9598"
+SRC_URI[md5sum] = "d30eed9304e82ea8238c854b5c5a34d9"
+SRC_URI[sha256sum] = "03ded4f5e9b8d43ecec083704b2dcabf20c182ed382db9ac7251da0b0b038059"
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 # the package is taken from snapshots.debian.org; that source is static and goes stale
diff --git a/meta/recipes-devtools/apt/apt_1.2.24.bb b/meta/recipes-devtools/apt/apt_1.2.31.bb
similarity index 100%
rename from meta/recipes-devtools/apt/apt_1.2.24.bb
rename to meta/recipes-devtools/apt/apt_1.2.31.bb
-- 
2.17.1


