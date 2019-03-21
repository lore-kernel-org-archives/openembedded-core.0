Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id BD22F7CE5C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2019 12:31:07 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id w10so4891311wrm.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2019 05:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=jZPXDua4sxYMqYXfISzFg0gxUpMdDSA8N45HdYoApFg=;
	b=Uy8MnC/GHfNO3w1T4kzbDftBClZZWlIrdmsZDR/x9Ov6K+8twhS6EgSmx0DNLRvNhq
	DJoR0FWXcR27tWGnGGyyRN3xdvxrK2mvV/xAi1kszem+kuurzzsBu73Lg3K17DOO+mkx
	9U4XgWiRG0LKQdKwysa/DDpc1KKONCk9EeD+ppxS/ILF0te+9RTqEqlG8H/LoNDqrrrI
	esh4KB5h5i5+H574V+xt65sHh0ehP3b+IXfs+Q9KEOOPFPwyb1iWckbzAVco69bOo+vE
	+kf4Nrt96cMZ6t+MTvkB02XVoDowU5N9FV8qGuEOkZgbVZGC97K/EGv8WZOFIaz/H+5V
	HS+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=jZPXDua4sxYMqYXfISzFg0gxUpMdDSA8N45HdYoApFg=;
	b=soVU+ezVIUOflQOLfrC2C0BYyNPo3KtHu/JEwMiSMEa1m5lsoT12VWX1PvrXhYlQ0o
	vol/pki32XCA3Qai6aYaf328qV5ibNtcNi6YvaCFyXT8g+IXpN9HtyWTWeDd97amEYls
	KhkVACH1rV+Gcny1Lei61LHexn1/e/88Ofc0b+CBme7+OxDrwwlBz85u3mtaMfbdFzY/
	Vr5zp7KsVOgdZICsTspV0/W7cybmcYF+qmq3DwvJP6BvonXljZ0Tdf7Jww/r9bBlg9Io
	w/cTxdbyBbwNUe14TQtFBSsUD/Pu1fsSfoCCu9xhRPaAAsKp/NINQt8ZINAwaC7UazeP
	a79w==
X-Gm-Message-State: APjAAAVdVuvmMi2GGHXhApG8+qCB4Tifr6drw6kO4mETDuZk3CCVz3zx
	t3hRh8G1JydVuhardVrL28IRplsg990=
X-Google-Smtp-Source: APXvYqx+khv/Cd/w1l7WRBAGt81yPhrzqBHiCJjKUXlKJ9AoFaljNxKvJ5r37FitKtD/2hNglrieeQ==
X-Received: by 2002:adf:81a1:: with SMTP id 30mr2612215wra.285.1553171468224; 
	Thu, 21 Mar 2019 05:31:08 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	u14sm4297353wrr.42.2019.03.21.05.31.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Mar 2019 05:31:07 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Mar 2019 12:31:05 +0000
Message-Id: <20190321123105.3020-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] libpcre: update patch status
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
X-List-Received-Date: Thu, 21 Mar 2019 12:31:07 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/libpcre/libpcre/out-of-tree.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libpcre/libpcre/out-of-tree.patch b/meta/recipes-support/libpcre/libpcre/out-of-tree.patch
index 687dcc034da..d56789615fc 100644
--- a/meta/recipes-support/libpcre/libpcre/out-of-tree.patch
+++ b/meta/recipes-support/libpcre/libpcre/out-of-tree.patch
@@ -1,6 +1,6 @@
 In out-of-tree builds the #include fails because $srcdir isn't in the include path.  Set CPPFLAGS so that it is.
 
-Upstream-Status: Submitted [https://bugs.exim.org/show_bug.cgi?id=2379]
+Upstream-Status: Backport [r1750]
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
 Index: configure.ac
-- 
2.11.0


