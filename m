Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id 826046D6F5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 02:37:31 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id k18so10434343lfj.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 19:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=PWlbA2ImoX1yjzLGq2atfYr7vl5SXwgenaIXs+JiSz4=;
	b=JYz72HnMlIJRmyE9b8VDocXoo8uDVCkdxlq9wgtgYfPQm4D7aX59uZ1hP28OcETIPJ
	fDHFoU/0jxPVLZzUD+yUniT46ab/4QThrkSMGz2JtQ5gdP+ATCcPBVunrNC00JBtPFcK
	vu+ZfictJKB48RWlVLl3zbZTaxcey57u2S9oue7H2avdyE8ESKQCNzBfOKBgW7NOU0NW
	EQcwxqtVaVWJC23Lk233ZVNUSbWWshhv1l7lCA7o4xbxAHrg2mQgLXHsF3Po/akZXPWx
	4+3CFJcjDJX6+hd7r15KJjMCakajZfknA86d3vRElrQWyKmw5kIHuJJKOAkJUdnWaDeE
	JTzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=PWlbA2ImoX1yjzLGq2atfYr7vl5SXwgenaIXs+JiSz4=;
	b=J1fNI7mw630Cg+koS9wGnk70/YVNIZZwsF6HQ8LCbgHX8Diq7uvjfriPotgERpFOvQ
	vZSbTtjIKTiqywijjotoItSXHULM7Cfhpz7F8rsiLTFWIWRIbQwFsJHQ1cN1yevivSKN
	xCj46aPiz/BxkZGpqK8O6ba9CmTC7xb3a37l3L8VMeHdDQTF8DnEVUwXMKESpG4Rj3x8
	dXqVf/BKJVYiEqBXmMEDwObFWoj9MkeYVzVIwtClHz5wuQeWwsGcInoMq91l7zwbSl3k
	rEWT4T510KEybz8zDepvSska8NwiFM+p1pRWSKLoHkAWRiDg3WcgoYHp7r0e0SAF2KSZ
	ohiw==
X-Gm-Message-State: APjAAAXmS06GQaGZiyPy+xGnWARve1y7nOniMCexjHqzNGuxGorg0W5h
	cR0gXsqAyq6uKZAyh5oUPF69jSVuzSs=
X-Google-Smtp-Source: APXvYqyZJzvOpENj/BDjejR6qwKp0++GqIZpX2SXANXP2KQHkPB09A1FwXt8pIXrJZ9mHtkmiBiFdA==
X-Received: by 2002:a19:f60f:: with SMTP id x15mr12238294lfe.95.1555987051592; 
	Mon, 22 Apr 2019 19:37:31 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id y7sm3351722lfg.76.2019.04.22.19.37.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Apr 2019 19:37:30 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Apr 2019 04:37:26 +0200
Message-Id: <20190423023726.31461-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] orc: update to 0.4.29
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
X-List-Received-Date: Tue, 23 Apr 2019 02:37:32 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-devtools/orc/{orc_0.4.28.bb => orc_0.4.29.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/orc/{orc_0.4.28.bb => orc_0.4.29.bb} (84%)

diff --git a/meta/recipes-devtools/orc/orc_0.4.28.bb b/meta/recipes-devtools/orc/orc_0.4.29.bb
similarity index 84%
rename from meta/recipes-devtools/orc/orc_0.4.28.bb
rename to meta/recipes-devtools/orc/orc_0.4.29.bb
index 03cddad8bb..8313576ab4 100644
--- a/meta/recipes-devtools/orc/orc_0.4.28.bb
+++ b/meta/recipes-devtools/orc/orc_0.4.29.bb
@@ -4,9 +4,8 @@ LICENSE = "BSD-2-Clause & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1400bd9d09e8af56b9ec982b3d85797e"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/orc/orc-${PV}.tar.xz"
-
-SRC_URI[md5sum] = "6b582ec4b3275c5efd51e3ae6406d445"
-SRC_URI[sha256sum] = "bfcd7c6563b05672386c4eedfc4c0d4a0a12b4b4775b74ec6deb88fc2bcd83ce"
+SRC_URI[md5sum] = "25799917c7d31a891d5e32b83ad08f6d"
+SRC_URI[sha256sum] = "4f8901f9144b5ec17dffdb33548b5f4c7f8049b0d1023be3462cdd64ec5a3ab2"
 
 inherit autotools pkgconfig gtk-doc
 
-- 
2.17.1


