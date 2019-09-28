Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
	[209.85.160.181])
	by mail.openembedded.org (Postfix) with ESMTP id 006C37DD6C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Sep 2019 22:41:59 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id m15so12076769qtq.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Sep 2019 15:42:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:organization:content-transfer-encoding;
	bh=tu4lqNzyhF8X18xBUF0QhaxhyZ3FbHjJkfOHUi4+0UI=;
	b=OmF/EpmGPy+fH8Ovhnr5o1y6tIh2gAfPOKI/ye9h4CQPWH4lei0Fnc/GFvlljUiCBK
	MXKik/lsrgSDuReN7ZvCSKYiUefpDbZNSnHH13iTwUq6CGWaDaPNeuhVW2ICEaO/1IN8
	iKVhiiN/0xBaEOkfGn2W1PAeMVXiKtl60p9VAwlC63qSvlQnrOjr4K2gXQ1Wrg9/+dJJ
	4QBATsm913y1r17cSsJF4Y6GCzZLmCeKSYT1MPnc3umZbGznMiwFvf+z9coNMc52sxPx
	oeYAxcofHMCnrRHYjiXAE+9Zdmuy4zOyvlgZGsbhzToNGJol7w9K7yV6wqrdm707Hfje
	p3Sw==
X-Gm-Message-State: APjAAAWt4nFHJC8EeNGzJLt89kwjC8UxAdx7PEMBGDTs8fqkqkNz+Orh
	vbMsVDvvmFNCHdMHEP+G0inZgvGW3HQ=
X-Google-Smtp-Source: APXvYqzFqtkr9GMzXsOlnjYkJBv3jfzFwoEVsgElDdSWFvEkEhvXE1tUHcNgf7wTkomY1CeGJixsKQ==
X-Received: by 2002:ac8:75c7:: with SMTP id z7mr6070048qtq.136.1569710520543; 
	Sat, 28 Sep 2019 15:42:00 -0700 (PDT)
Received: from localhost ([181.220.83.67]) by smtp.gmail.com with ESMTPSA id
	i30sm5091757qte.27.2019.09.28.15.41.59
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 28 Sep 2019 15:41:59 -0700 (PDT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Sat, 28 Sep 2019 19:41:51 -0300
Message-Id: <20190928224151.4126357-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190928224151.4126357-1-otavio@ossystems.com.br>
References: <20190928224151.4126357-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/2] mesa: Upgrade 19.1.6 -> 19.1.7
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
X-List-Received-Date: Sat, 28 Sep 2019 22:42:00 -0000
Content-Transfer-Encoding: 8bit

This is a stable bugfix release. Detailed release notes available at:
https://www.mesa3d.org/relnotes/19.1.7.html

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 .../mesa/{mesa-gl_19.1.6.bb => mesa-gl_19.1.7.bb}             | 0
 meta/recipes-graphics/mesa/{mesa_19.1.6.bb => mesa_19.1.7.bb} | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_19.1.6.bb => mesa-gl_19.1.7.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_19.1.6.bb => mesa_19.1.7.bb} (85%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_19.1.6.bb b/meta/recipes-graphics/mesa/mesa-gl_19.1.7.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_19.1.6.bb
rename to meta/recipes-graphics/mesa/mesa-gl_19.1.7.bb
diff --git a/meta/recipes-graphics/mesa/mesa_19.1.6.bb b/meta/recipes-graphics/mesa/mesa_19.1.7.bb
similarity index 85%
rename from meta/recipes-graphics/mesa/mesa_19.1.6.bb
rename to meta/recipes-graphics/mesa/mesa_19.1.7.bb
index 19221e9e25..d0518322ae 100644
--- a/meta/recipes-graphics/mesa/mesa_19.1.6.bb
+++ b/meta/recipes-graphics/mesa/mesa_19.1.7.bb
@@ -6,8 +6,8 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0003-Allow-enable-DRI-without-DRI-drivers.patch \
            "
 
-SRC_URI[md5sum] = "7dbb40b8d10e89bee0a5bfc85350647b"
-SRC_URI[sha256sum] = "2a369b7b48545c6486e7e44913ad022daca097c8bd937bf30dcf3f17a94d3496"
+SRC_URI[md5sum] = "cd1345c9b0d5121b860a0bdb20abc347"
+SRC_URI[sha256sum] = "e287920fdb38712a9fed448dc90b3ca95048c7face5db52e58361f8b6e0f3cd5"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.23.0


