Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 928C578771
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 14:31:24 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id s24-v6so1661620plq.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 07:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=A+On4OKukAaJOsREr9KQVM4TLovEZ8VP9sGWw5mmTrM=;
	b=ATKc2yFbD1nRoODYFulUti90Lo0LfxJUCBqGK22eUL52wbg34lwNjSUd6J81BahpwQ
	wLQODtlVy/lBSbdLrK8Bim4Jy0CSg/yC0ZCPkY9Ph8BJ7zDuN9e8Xrzj/Jl7sesI1+r8
	wKmjLbwp1+6ptXunfFxwwYlsoNFPnNxXRnvHDbfdDjomiVFNKIGwxSuLVb6bVDOpM3av
	11qLuXOmu9f/RwzM2GBmiYeZ33EPsJGTYYzWZ/XS3sW3LSMgn0OgRfqM063fP08PuoAU
	ydklwV+FsYbx6/jphex7NAX9X1YecU7unLejHMneRbNiDh164Yh64Eh+9TbY97TqNnCO
	r5kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=A+On4OKukAaJOsREr9KQVM4TLovEZ8VP9sGWw5mmTrM=;
	b=B32EoCv8SOzeK3XHZOeRvgpMOuzpM3YTPjrVjGyOgGmnkRTxnecTPOd56RiycJlH2u
	roSv4bG5AGbXW1DRry6LzPAX1IZ2IQXFlu4X8PgRntoHnjomojuDSjG1jjvUAg8zn7TS
	WAc72f7RlpKBLLmzjBkGOlBY+6x/TzSMjzLC4zZJRQ0KrR9jLuGnxJh9O+nFhIIXRNGG
	cylRxy8RMi+EXVNfawIypr7YUorBjCXka+JgiXyOTUn+VJ2B4YCa9YQ47Dvwzwaai/z2
	vujiwjQziF624w6/cDfvYyv4tZzgKa5MsZU62uzsyKPuQP0ZWejs77l8NPt0p/OCdGOp
	XiOQ==
X-Gm-Message-State: AElRT7HAlXJpaTC5YQMPjlZ9Y/j0EElcYdOctxNOxiJR8FUINpaeeqWG
	xgyhTTDfFs8CJpD29Azeo2RJ/w==
X-Google-Smtp-Source: AG47ELvAVJbBOnvSlNCTjitzIG/55vaEJ0vKVuPBC52v1fPIY457gMzmVRrBYWbkjl2IvSNdlsQ6CA==
X-Received: by 2002:a17:902:8308:: with SMTP id
	bd8-v6mr10294698plb.313.1522074686168; 
	Mon, 26 Mar 2018 07:31:26 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:203c:a04e:87e9:791b])
	by smtp.gmail.com with ESMTPSA id
	j11sm29932492pff.94.2018.03.26.07.31.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 26 Mar 2018 07:31:25 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Mon, 26 Mar 2018 07:30:13 -0700
Message-Id: <46ebc9b2acd479edcdd6388c9d7759fb27cf9536.1521989435.git.akuster@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1521989435.git.akuster@mvista.com>
References: <cover.1521989435.git.akuster@mvista.com>
Subject: [PATCH 10/21] xeyes: update to 1.1.2
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
X-List-Received-Date: Mon, 26 Mar 2018 14:31:24 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-graphics/xorg-app/{xeyes_1.1.1.bb => xeyes_1.1.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xeyes_1.1.1.bb => xeyes_1.1.2.bb} (72%)

diff --git a/meta/recipes-graphics/xorg-app/xeyes_1.1.1.bb b/meta/recipes-graphics/xorg-app/xeyes_1.1.2.bb
similarity index 72%
rename from meta/recipes-graphics/xorg-app/xeyes_1.1.1.bb
rename to meta/recipes-graphics/xorg-app/xeyes_1.1.2.bb
index 84d0cb8..06885f8 100644
--- a/meta/recipes-graphics/xorg-app/xeyes_1.1.1.bb
+++ b/meta/recipes-graphics/xorg-app/xeyes_1.1.2.bb
@@ -8,7 +8,7 @@ PE = "1"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=3ea51b365051ac32d1813a7dbaa4bfc6"
 
-SRC_URI[md5sum] = "a3035dcecdbdb89e864177c080924981"
-SRC_URI[sha256sum] = "975e98680cd59e1f9439016386609546ed08c284d0f05a95276f96aca6e8a521"
+SRC_URI[md5sum] = "6f0543ec84283df5743eeafc173bea4a"
+SRC_URI[sha256sum] = "57bcec0d2d167af9e5d44d0dbd74c6d7c0f0591cd0608952b23c749fdd910553"
 
 DEPENDS += "libxau libxt libxext libxmu libxrender"
-- 
2.7.4


