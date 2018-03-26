Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id AAAA978743
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 14:31:19 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id p9-v6so12042198pls.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 07:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=5nexabaezKNcnS+TjXgK2DVIIvWyrkGS7ofjUC1azLE=;
	b=MY9gaNAFtMAI7KLDpVSen/fkRdgBZtjdf3MI0VrzmZIXWeXfpNukyto6cRlUyuB3Js
	OF1V0fNhOpphXbla41VndUromEeRUT8DwFIaVRIG3AYP3D7irezruwFfIIinSR3bxQaE
	FqFcspM3JakQju7vq1BpECm1N0JOfO1M0M4WKDAFu1zOblzd36ffC54rBhyMFY/wRqXF
	X+dUxVBrauyxbFWQCVYWvw/yccrSy98nfVE7iv0qXI0T/yyCt8FdKfdyOi1tarfZzN/I
	bJKQd4mqvJwaHpT+jF8oWXGKrIXGQVhxl5UGf6riQ9ALjGVe5D7h5NQ5z1cq0/JJGQwz
	ruoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=5nexabaezKNcnS+TjXgK2DVIIvWyrkGS7ofjUC1azLE=;
	b=OkWrX4CxerSpx95n5v4rX4FU3pJFhgdxXAs6k9EvHIfk+LMZD9x6UxaRlMKDqHo+tC
	5GYiwWYf9Bfp7vvrnjQjp7kTp1JZopfrP0sBkMmsEQr5HirxfWhzMuyZbQTtuYkgIDJB
	x//0u9KZtXWWORVVwN98zBmvuIUk5UFodFDqZybh53umxtkN55+gQdEuEz3uHIra8jlp
	vKDoFiayO07qm3wbL6OwT5LBc6889M5WXVhBXrYIIGC+WxQOSW7K1/UNo/KdA6siDEGH
	dc96XBUlMXgsdc7X2kHcx3qpO7J7cSeVzJR17SV8Nia70RuMfswN1pTSEDlKvXpnugBs
	Qp2A==
X-Gm-Message-State: AElRT7HiuMCFKfWnILGhYzUgAHQoupBweYukJTANkhoqEbxFJu2pOpGx
	rR+X4z7IvdT8DcuDaPeyqm0=
X-Google-Smtp-Source: AG47ELsOBDF1iWMghGA0IkIpr1fejCksSUG96FsvFl7FOxNSZmdHuGuG9knXXoki81X09bU87BG2yA==
X-Received: by 2002:a17:902:481:: with SMTP id
	e1-v6mr40586615ple.377.1522074681103; 
	Mon, 26 Mar 2018 07:31:21 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:203c:a04e:87e9:791b])
	by smtp.gmail.com with ESMTPSA id
	j11sm29932492pff.94.2018.03.26.07.31.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 26 Mar 2018 07:31:20 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Mon, 26 Mar 2018 07:30:09 -0700
Message-Id: <aedc268bdbc2be6a0e76ca86fe5c4cd2b9c82f58.1521989435.git.akuster@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1521989435.git.akuster@mvista.com>
References: <cover.1521989435.git.akuster@mvista.com>
Subject: [PATCH 06/21] xkbcomp: update to 1.4.1
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
X-List-Received-Date: Mon, 26 Mar 2018 14:31:20 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../xorg-app/{xkbcomp_1.4.0.bb => xkbcomp_1.4.1.bb}                 | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xkbcomp_1.4.0.bb => xkbcomp_1.4.1.bb} (75%)

diff --git a/meta/recipes-graphics/xorg-app/xkbcomp_1.4.0.bb b/meta/recipes-graphics/xorg-app/xkbcomp_1.4.1.bb
similarity index 75%
rename from meta/recipes-graphics/xorg-app/xkbcomp_1.4.0.bb
rename to meta/recipes-graphics/xorg-app/xkbcomp_1.4.1.bb
index c9dc327..c35d5d7 100644
--- a/meta/recipes-graphics/xorg-app/xkbcomp_1.4.0.bb
+++ b/meta/recipes-graphics/xorg-app/xkbcomp_1.4.1.bb
@@ -9,11 +9,9 @@ be read directly by XKB-capable X servers or utilities."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=08436e4f4476964e2e2dd7e7e41e076a"
 
-PR = "${INC_PR}.0"
-
 DEPENDS += "libxkbfile"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "cc22b232bc78a303371983e1b48794ab"
-SRC_URI[sha256sum] = "bc69c8748c03c5ad9afdc8dff9db11994dd871b614c65f8940516da6bf61ce6b"
+SRC_URI[md5sum] = "07df9790d30f9a369d20a418af784de0"
+SRC_URI[sha256sum] = "748dc4cf58ac95684106bd9cf163ac6ab7de9a236faec02a6f4d4006d63a5736"
-- 
2.7.4


