Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id ECD6A7F994
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 13:09:05 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id z26so17285754wmi.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 05:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9AITOXBWl78SYYr2kuS8tQeBoi6uw4yAEghPhRbxm70=;
	b=PbrlrXviz5m8i/ZpHN2E6genZ1+CJHcQblV3E6CxHVPC6BR4HNClTBHxM3sxvQrKye
	a3ExpYVRFSiCPjkWO+iOoO407DJJc6MJ5vOjOadUivu6dEdeCxWmmQtOz+P7VxlMCZZL
	RKaMmA/f7hU6ARiJKsL6GENjSmVYkBU3PZSbDHhcbfudrGDWC5yltYJaRB15QX73z8Jb
	tjmkKixc6j0kdO+BRsyxRv1LEMF3l//LuEFmFl6vnhfy7ZBqXfgxqQ7FTMymqTsfBee3
	/YgPRqlYsfEMqdFa0GAMK/6HS8LH7E3oQkN89RIFgPi2mmwFBkOJYjHJhlBzArk7m1Mp
	ASuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9AITOXBWl78SYYr2kuS8tQeBoi6uw4yAEghPhRbxm70=;
	b=LeWi0d5M0WR8pdtnqnSrh/etsjXpMfTlqGL+EU+/Xe4qirixKgYylXag8FdKtpqMPk
	RsyUceO8yKpNTznseBs/+dM3zrqObxx35Bs19Rl/HHWuD7NZL5q/JijECKWxbLQndeoo
	CxE40ejqM8ui/xf24yXMIdW7aFDaun7hvimgQea+qunXtM1AnaoHhPNXzeVmnxGmh4JE
	xo57P94jz0NuuF//CUMy65uEW3t7IUIFBL/Tg/Sw2QQxR5ylEZztD6akCZ/GnIQhtcES
	I99ZWClxly8mTD9l0GNLnh9goyIT5Ordddl9G+6rWFLYju/yPNvL1D/ZUO2gQGZucJrt
	HQYA==
X-Gm-Message-State: APjAAAVG51iBMqlXgwWsMJalmD840CRZB4PlcN7rRst/V9IFY88HU+DV
	kpGUgt2r1Mbxe0yOnhtFc76Omw62
X-Google-Smtp-Source: APXvYqz8u0inM75k0wM/krhEsxKEUu+1fJa9wpgkB89bQ0eLESktGDbUpJjX4k5FjkXibf1TmIwtvA==
X-Received: by 2002:a1c:610b:: with SMTP id v11mr28650168wmb.156.1574082546456;
	Mon, 18 Nov 2019 05:09:06 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	z4sm21413846wmf.36.2019.11.18.05.08.59
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 18 Nov 2019 05:09:06 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Nov 2019 14:08:01 +0100
Message-Id: <20191118130801.21860-13-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191118130801.21860-1-alex.kanavin@gmail.com>
References: <20191118130801.21860-1-alex.kanavin@gmail.com>
Subject: [PATCH 13/13] man-pages: correct the SRC_URI
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
X-List-Received-Date: Mon, 18 Nov 2019 13:09:06 -0000

The homepage: https://www.kernel.org/doc/man-pages/download.html
specifies that the latest tarballs are published one level up
from where we currently take them.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-extended/man-pages/man-pages_5.01.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/man-pages/man-pages_5.01.bb b/meta/recipes-extended/man-pages/man-pages_5.01.bb
index 28525f4ba7e..ea1249e4396 100644
--- a/meta/recipes-extended/man-pages/man-pages_5.01.bb
+++ b/meta/recipes-extended/man-pages/man-pages_5.01.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://www.kernel.org/pub/linux/docs/man-pages"
 LICENSE = "GPLv2+"
 
 LIC_FILES_CHKSUM = "file://README;md5=794f701617cc03fe50c53257660d8ec4"
-SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/Archive/${BP}.tar.gz"
+SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/${BP}.tar.gz"
 
 SRC_URI[md5sum] = "38abead776a506109e128ab96bcbbe58"
 SRC_URI[sha256sum] = "070bef794c6826b3fb3965d1a2efdb46c25cb37c06c715987f88a50906cd5b6f"
-- 
2.17.1


