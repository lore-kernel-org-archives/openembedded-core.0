Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id 46ADE7D2E6
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Sep 2019 18:30:30 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id n4so5379512pgv.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Sep 2019 11:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=5v4Gwch4nPFaMMAqkIkofEo3rAvIY41hrZUzb6OtgHM=;
	b=kb4AMSIUcxrxSDHZERr+V7qmhnOQf9feRclzsAEssfCnVyoy2spX4hnQWuyQSJkpLt
	VyMM2pHdUuxd9Mo5lz2eqIIng1Ry6tDLmLanKuFk+Sc9OAknhAGtu2dOPBfpCN6Pg0CR
	dkDXLTKsaPED6zblWfGuBIOgAGDJCWEYlJlsJodsHKbdU7VUSj+r1WKLDk9swqtiF8vK
	u8Pw3dWFrOOzy3M+/OBl4123v9pnlCtk9ZAkFiXpz/asjqRfjYqkLWtR0zvB8BGCmsQ4
	SGVZxSiRRGNEC12dkXnHz4tP4XAZ1Mb2cc6Vj1aeAFPKXf1egJDgQKQ0PlmP/scuUUGQ
	N+zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=5v4Gwch4nPFaMMAqkIkofEo3rAvIY41hrZUzb6OtgHM=;
	b=mM8o4l/FP5cO4IV+4YeqgClfmu+rAVt3AdccS78P7roOIsTe+kKwrzt9VDQN0JEXfR
	il1OIYYgJWYz68mU7A9oSuNFZ0WHlOZRSXMMQJsaFYkGTkiCtQYGe1eLwa2ltk05kEkS
	BwNdRpcA7UiDr/YPhEE0itbpYafYQNdjblix2aAra81XHRg+TMyHUBCB17M83PxC/+Q8
	/06eXgsouAjSOC55u/nOCguXymuPZ4rim64hBUqaqSyrUsFRxQDlMkj5OJL5M+J32yws
	sHrxH/wTRwDk3xEEEcE0xE1DdnWJgGIL77ueqthIIMnOWiElWvjDbuu5S4m/sK3MQUJo
	7POw==
X-Gm-Message-State: APjAAAWpC4ErunkuSVPUiuYPfAKrOLmjNTqvzL37hxklFl7ew9NUo+wZ
	XBAh4cWaNNbLUxZ+PINuIxrQh4ATucY=
X-Google-Smtp-Source: APXvYqy13oFqVoyzDsKg7716jvlwXSWAmC+9pVtc1U52asi1Yb3G/ZZwcCxfbWaxcYNKajcDBico1Q==
X-Received: by 2002:a63:195f:: with SMTP id 31mr13905065pgz.225.1567881031032; 
	Sat, 07 Sep 2019 11:30:31 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	f23sm9807085pfn.22.2019.09.07.11.30.30
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 07 Sep 2019 11:30:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  7 Sep 2019 11:30:22 -0700
Message-Id: <20190907183022.6811-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190907183022.6811-1-raj.khem@gmail.com>
References: <20190907183022.6811-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH] python3-manifest.json: Fix typo in summary
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
X-List-Received-Date: Sat, 07 Sep 2019 18:30:31 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/python/python3/python3-manifest.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
index ec28c2dbb4..8e94305af7 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -115,7 +115,7 @@
         "cached": []
     },
     "asyncio": {
-        "summary": "Python Asynchronous I/",
+        "summary": "Python Asynchronous I/O",
         "rdepends": [
             "core",
             "io",
-- 
2.23.0


