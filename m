Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id EAFD57D95C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 10:55:11 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id o25so20038724wmf.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 03:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=QCGeKVyCS6FK46WifM4Cv0zY9x9xfTHBmtfpFfWGxw0=;
	b=TC24OnRJyOf1TwI3X43I7ed3eRqC25R2Dg8gDz8sjURXw3gDkoiEVylHouAT0CoxVz
	mlTmW5tcUhbbYJUah3SyET98OpCt4Mk9E5Mocd36y4GiPibaWnxdblOBTxXN8lcWXC98
	XYKH4hGtVMSh3Ksfq/JOIXCBTbKDuxIk60nUc046AyTYd3nX3DwhfJES05lU2wAZF87u
	jRuic64DVaCb17FmmNujjZphjbTbdPt2DVDYIazJ8/KUq86i+++KjfrKU7MVowkNetP5
	pkgXYksrclnSSkCYMqEZg/+oTF5v0aWrtdYgTGJmt0/ufNoY+0yLrTLSxwsjetv/S5YR
	enQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=QCGeKVyCS6FK46WifM4Cv0zY9x9xfTHBmtfpFfWGxw0=;
	b=pNX51nSdAhJu0YonVHk2itnLPnLFlZYlOuP1XPBUGZYMp+r0BVDhukByCeaFGwemho
	EkQfh8n8/XPHzJ7ZSwQftciiHp1e7WDI7UHBSYbG8qRRP+5g7Q2R3cpgw5xN73FoLeQe
	kn3rIaB/i7JyuEvS0rnQWiZ0kZn+bPUauYs8L6/6yg/ntpuZoo5KTgfLKxS0AvyUjTnP
	OkzwvgReTywIM90ByihVSLYUJdPyq+sab3tf3rS5ugmXno/yVnfZj/2bfZWVtqviHPbP
	EIcDqxCIwjw8b4a9ekb/BioHr4fy2n3rKLGQEumUznqPc0l+FpYycQ8gVEf5PZE0Tn3P
	hvIw==
X-Gm-Message-State: APjAAAWxyg5Mhrfj377QF8gRnkcmD9vCv5n3QG+pe5K6OyXMN14zrY9C
	yDeJ6qa6qGjrTxLXE1swweMuPK6TS5E=
X-Google-Smtp-Source: APXvYqyRGG15HnoRRHM2p869/slSBJc0Dpgg/IFUh+qEIaz3JZG31yJupjYfuY2Bx+BLURs5bnVU3g==
X-Received: by 2002:a7b:c848:: with SMTP id c8mr22441588wml.110.1555325712567; 
	Mon, 15 Apr 2019 03:55:12 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	o10sm75468400wru.54.2019.04.15.03.55.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Apr 2019 03:55:11 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Apr 2019 12:54:48 +0200
Message-Id: <20190415105457.57067-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190415105457.57067-1-alex.kanavin@gmail.com>
References: <20190415105457.57067-1-alex.kanavin@gmail.com>
Subject: [PATCH 10/19] btrfs-tools: upgrade 4.20.1 -> 4.20.2
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
X-List-Received-Date: Mon, 15 Apr 2019 10:55:12 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{btrfs-tools_4.20.1.bb => btrfs-tools_4.20.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_4.20.1.bb => btrfs-tools_4.20.2.bb} (96%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.20.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.20.2.bb
similarity index 96%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_4.20.1.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_4.20.2.bb
index 3647232dc68..a1e7309664a 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.20.1.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.20.2.bb
@@ -14,7 +14,7 @@ DEPENDS = "util-linux attr e2fsprogs lzo acl python3-setuptools-native"
 DEPENDS_append_class-target = " udev"
 RDEPENDS_${PN} = "libgcc"
 
-SRCREV = "6c33832b8c7bf2d7b64d6aed023c0bda43a03311"
+SRCREV = "5c748404b97035463c79ba4e5fd41b6858535509"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
            file://0001-Add-LDFLAGS-when-building-libbtrfsutil.so.patch \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
-- 
2.17.1


