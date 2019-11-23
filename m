Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id 65CD67FCE6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Nov 2019 16:11:34 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id q17so4943313pgt.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Nov 2019 08:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=zAPWOM8GAGEACS8MX4o7MWlIEWshZyXvNtsIaGYVfRk=;
	b=qB5PGENeWP5Y/3d7uvVwtKfGe3bzCm/yE6Ss3R+cKlYZoATYYCuy3tIh3yd6pRL+gu
	7xuIhcGyZXHMUyaN767GpQkYJHSwtSLdk4/AoaWMpRGtdceYJZaA5Bnw1pL7aKwkLY4J
	ZZpFAISfhub5/l5l4A7kAxFhv5YPSvwFMgzQVAM0vk+7uDjZsJvsonIHUTtMxL9oXqF4
	MnbHPmrjYH7jUNUoaGqIa2DY1XL4w5JGx+ye/3RNGXLKHZwko4Ln1JOkC5AUdka3KwXq
	U/ALFXcBXTz9ErZYuHTesgzof23kJ0m3qmsbvoar+YHDaMXMNq+TrKTHAd099+2QyGGt
	zezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=zAPWOM8GAGEACS8MX4o7MWlIEWshZyXvNtsIaGYVfRk=;
	b=sErAroNTD+FlDdSA3zw+mwUaIF4Pv/3ybpWbB/AXzCwHJE7mkJ0gVqdHGPne8VtFVE
	lXbs5kHFbGr5xBYkLuBjEW6uve1PthGjrJMbnYlafSOe/GLfwETFkAveXyB71SQDXCsM
	CCnJ8Ga3DrwOOWGVFPihILspu4PfwFWV14s+J0d8LwSsPiO8pPTStBUjnt0QxypzwTIG
	5GAUd9B5X93ZfYIlkGelSJfqaZQFmWoxAoJHJ70W0CpkkxFeQKg8TokjNc2I0WFUFJaR
	b4ZajMD25G1J3s6hIElq4eWljd+hX1+baVz57pLmQLOanbEUHTFRPttfqbkycg8NqBGE
	/CbQ==
X-Gm-Message-State: APjAAAWwhjcOFE/0swFwS9yH69idgEORCUTwdcVkkxwcKwyRDbTSwz7n
	yiqETfKOhsMjjlTs5efJfTxkMzF7
X-Google-Smtp-Source: APXvYqxvfrMytn+MUUg6LzvEgtXmlgT0S7fviBZ3CRYBSCNDaHuu3qWQQRizmiMHyH2u/wYn1KNU+w==
X-Received: by 2002:a63:e647:: with SMTP id p7mr22718526pgj.47.1574525495316; 
	Sat, 23 Nov 2019 08:11:35 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:d5a1:4623:137e:d439])
	by smtp.gmail.com with ESMTPSA id
	199sm2091943pfz.186.2019.11.23.08.11.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 23 Nov 2019 08:11:34 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 23 Nov 2019 08:11:23 -0800
Message-Id: <1574525485-20450-9-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574525485-20450-1-git-send-email-akuster808@gmail.com>
References: <1574525485-20450-1-git-send-email-akuster808@gmail.com>
Subject: [zeus][PATCH 09/11] gstreamer1.0-rtsp-server: upgrade to version 1.16.1
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
X-List-Received-Date: Sat, 23 Nov 2019 16:11:34 -0000

From: Carlos Rafael Giani <crg7475@mailbox.org>

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...er1.0-rtsp-server_1.16.0.bb => gstreamer1.0-rtsp-server_1.16.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.16.0.bb => gstreamer1.0-rtsp-server_1.16.1.bb} (88%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.1.bb
similarity index 88%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.1.bb
index 042938b..ca360bc 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.1.bb
@@ -13,8 +13,8 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz
            file://gtk-doc-tweaks.patch \
            "
 
-SRC_URI[md5sum] = "adc4460239ec2eccf58ad9752ce53bfd"
-SRC_URI[sha256sum] = "198e9eec1a3e32dc810d3fbf3a714850a22c6288d4a5c8e802c5ff984af03f19"
+SRC_URI[md5sum] = "380d6a42e856c32fcefa508ad57129e0"
+SRC_URI[sha256sum] = "b0abacad2f86f60d63781d2b24443c5668733e8b08664bbef94124906d700144"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
-- 
2.7.4


