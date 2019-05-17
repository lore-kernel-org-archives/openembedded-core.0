Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 13E887DF4A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 18:12:17 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id i3so7764745wml.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 11:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2KjVEFMpcobrpC1g88bYQbGIrcMqPqWOZpQuIZohnPA=;
	b=DK+oDcZhNLgONd11hSYRWabzw/gWy4CyMWBTdbPdjBCYe6zv5tLeWYngtRoQ/Erfl7
	AMOeEvjBnD73uLRvkVC5bG797Wv7yA9m8X58ZXkU3LGNeoORO5ZVkRLiDlcfS1MIsZpK
	RVOU4lDEm2qmZ7ZgTnk66xxKGpkG9jUBPT9ay80tQablweZacg6Psx/IFXOtTxp58Epc
	q6Mb/SGieD/SmeETBfCwNEL2Nsdk+FdHVRZnV8LsG4kuELNRsU3v66cv6vjBLOfE1fts
	Quep2BfnlEtzW9TiqQcuRaIt+vE7N1hqbHGS6+SgJVjdvboJxAWpIx6YhgWg7z9l/mcf
	CU7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=2KjVEFMpcobrpC1g88bYQbGIrcMqPqWOZpQuIZohnPA=;
	b=UGMK3WLbldQnEdp9xzRWS6/Ew0ibHMefUFk1Pi7+F+rrUDRSyQtUVPtPhDGJsqAiPX
	+YOze7+7Ry4N3T9y1sdP9eIxjJkoo33ML7oybjKXklVMWLJY6s6/FMlzgOjTe57ditnu
	CaNUxLeDtfiALfyPVTl7SdZfDsQxBKoqiCiWDDFqNE9q8ktj1P2w/mpAK4450wetOfKK
	tFLt0UYcK7gHHZDKS33dxSsR3FBGl68LAsJn7tmxmCxxUw9hAUcyboHf/2v0yqyhfr9H
	0NTIi9JRrpC2Oc8c3dSZRJ38/suNh2YpYiLNGH59xQoR4auNpLL8DfTOzdvxlhI9btsC
	8Aaw==
X-Gm-Message-State: APjAAAXh9iqVd4rQiLDP9u9om0bdoZkIl4JFO8vbHB8n8Tnh84lc/Y9O
	YIsMXKhcUWyMwHYG+rgD53gGbP8s
X-Google-Smtp-Source: APXvYqylx7MVlAALiyjR9qFXVWc5/geGgw5Dvz9bAXZchI7cZ263JUtJN0dsCwFRvPnJ7GEz4pjTlA==
X-Received: by 2002:a1c:7e10:: with SMTP id z16mr3319851wmc.98.1558116737764; 
	Fri, 17 May 2019 11:12:17 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	c63sm10188093wma.29.2019.05.17.11.12.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 May 2019 11:12:17 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 May 2019 20:11:36 +0200
Message-Id: <20190517181151.44001-22-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190517181151.44001-1-alex.kanavin@gmail.com>
References: <20190517181151.44001-1-alex.kanavin@gmail.com>
Subject: [PATCH 22/37] iproute2: upgrade 5.0.0 -> 5.1.0
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
X-List-Received-Date: Fri, 17 May 2019 18:12:17 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../iproute2/{iproute2_5.0.0.bb => iproute2_5.1.0.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_5.0.0.bb => iproute2_5.1.0.bb} (68%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2_5.0.0.bb b/meta/recipes-connectivity/iproute2/iproute2_5.1.0.bb
similarity index 68%
rename from meta/recipes-connectivity/iproute2/iproute2_5.0.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_5.1.0.bb
index 8f33c7fe194..6854a130042 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_5.0.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_5.1.0.bb
@@ -5,8 +5,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-libc-compat.h-add-musl-workaround.patch \
           "
 
-SRC_URI[md5sum] = "d22107b4d7cfb999eeb8ad8a0aec1124"
-SRC_URI[sha256sum] = "df047302a39650ef832c07e8dab5df7a23218cd398bd310c8628e386161d20ba"
+SRC_URI[md5sum] = "a2b8349abf4ae00e92155fda22de4d5e"
+SRC_URI[sha256sum] = "dc5a980873eabf6b00c0be976b6e5562b1400d47d1d07d2ac35d5e5acbcf7bcf"
 
 # CFLAGS are computed in Makefile and reference CCOPTS
 #
-- 
2.17.1


