Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id C1256613DF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 19:48:26 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id s10so1996146wmh.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 11:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=GEAhq0sBfzhK/7CIF34RJX48W76d5p6+eYzNq4ifLXI=;
	b=AeFa0GPWrs5dgsp06u5TliM53Ktr6i5D6mBr4BmKiQ4gwY0fHmV+9cCcwvEvpGxPpe
	c4WR7/usFM6WgLFw33ERx3SM+8faH6HQVDErHKJufQTb3H33r8ZlrGkOrHdkeMaNEgO+
	QyEDJ/jArBwA8fO7nYah2rjZsZY+st2jRKFni9qlcNDMQtypwsCF2zn+dgtPd6WDN19T
	TLWi0spgej4hacsMffRe+jCT8Y0ZICEsVTR95O7XCZ9ndJhyDriKL1Vuv8zkX/EBwBx3
	mVtPSVTfc1JHPAEwEPRGhwDXDcihYxDmjdrSGYgR+q0g+SdLvH5JTHwzpXr7fMtn1dHa
	QWEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=GEAhq0sBfzhK/7CIF34RJX48W76d5p6+eYzNq4ifLXI=;
	b=cmBILOuJVr9bvxleZS+LcevqRy68gO7P1svbhokTpEKBuPb+PycOTLcNimmgSwXrC/
	b1eyGKPX+aDuX6hcf7638uTTi2l1wnUmdSKAC/cILqudi3t9FG2WRr5vAW5QCLjHv2BD
	B/bPowfa+SzG4IUiWsdlOENCJ2XMthz5QrpdW9ZuCwhtCvoZYt1RzPUxpX4aPc+gMQf7
	xgRKlI1vW6dTYfJFUwAQN5YKDqxyITus7ciIaA+VMJsMJupLrD17pmKsM36UPvcXyp7y
	b0dej5wrVI7/YsLJodEb9AwbJHZ6g/Fi/ImLWj9Lfe3YYRmgzyXm5VhWuNYzjBCVszDl
	rATA==
X-Gm-Message-State: APjAAAVXScUCAxkW7rcJ39FDbhiFCfVPJ8c0a2yv0IlypGv/BWG0wpZz
	tcPquISOAPgoo+9yJHr0qFi+QMp3
X-Google-Smtp-Source: APXvYqy6MoDOAKdyFLMKjkzapNvBvvIUSVh4Jbx5ZweWW9mmG7/+YPPRyZ9B+0kzHjd+mo0V/+2qiQ==
X-Received: by 2002:a1c:a515:: with SMTP id o21mr11853896wme.85.1582141707169; 
	Wed, 19 Feb 2020 11:48:27 -0800 (PST)
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
	by smtp.gmail.com with ESMTPSA id
	y185sm1204049wmg.2.2020.02.19.11.48.26
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 19 Feb 2020 11:48:26 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Feb 2020 20:47:52 +0100
Message-Id: <20200219194752.7967-13-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200219194752.7967-1-alex.kanavin@gmail.com>
References: <20200219194752.7967-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 13/13] virglrenderer: upgrade 0.8.1 -> 0.8.2
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
X-List-Received-Date: Wed, 19 Feb 2020 19:48:27 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{virglrenderer_0.8.1.bb => virglrenderer_0.8.2.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/virglrenderer/{virglrenderer_0.8.1.bb => virglrenderer_0.8.2.bb} (94%)

diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.1.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb
similarity index 94%
rename from meta/recipes-graphics/virglrenderer/virglrenderer_0.8.1.bb
rename to meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb
index 133618844a..1046b8504f 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.1.bb
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb
@@ -9,7 +9,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c81c08eeefd9418fca8f88309a76db10"
 
 DEPENDS = "libdrm mesa libepoxy"
-SRCREV = "66c57963aaf09a1c41056bd2a001da1d51957a14"
+SRCREV = "7d204f3927be65fb3365dce01dbcd04d447a4985"
 SRC_URI = "git://anongit.freedesktop.org/virglrenderer \
            file://0001-gallium-Expand-libc-check-to-be-platform-OS-check.patch \
            file://0001-meson.build-use-python3-directly-for-python.patch \
-- 
2.25.0


