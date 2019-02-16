Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id 7640F7C7AB
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Feb 2019 21:46:45 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id r2so14029136wrv.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Feb 2019 13:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Mqc1JSX5idbxJqiSeWE3ZUNw6pwyuXJliq0HuRlsqwQ=;
	b=Iph/Fhpf7ItZl6xrn9CxRvXWfO5TvX0/ib9ZPE9OtqyIEn0uUeWozaRwkDTD3vnuh8
	ElPEFuIV3xAHnujjzGccV/PT6i4Of1dVzwC2qEOHIdVt7M9zthLLAZ67DYE150Y5o31s
	63J5PjMf63aupXsFT4QVMM+3Jo3PaH9qZ5Z04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Mqc1JSX5idbxJqiSeWE3ZUNw6pwyuXJliq0HuRlsqwQ=;
	b=fxYx2adOnCsGYZyJ4M43T6Jx21Ic5jxH4cfyrkfJMDyoj3eb+VRQ9P5PCeLmRXeOcI
	G8/2Wli1I9KSvIvffFkOFZ+3w/d0htL7QY6jWoK3I4gmQTuFwiwHbyg/fIGPjroSd+8l
	vFttI/r5212RGDMaGjoP/wqtnI5oepuqVlOjlChHJAMKt1frvVU/RsNcxdzCd+6L6gJ1
	SI8HYBnsTlqj7O5k5OXuVLq9Yv8/fn1IsnjDdqJRpV9HZ1ahrfMdy10O8ISd1JgMCfVd
	C+bTXt3SBJptZvtnNP7FyqBfcrPqbbRRVg801mG4BlLCWZzH1tyXQiIwBCMAKlDoSsdY
	lO7Q==
X-Gm-Message-State: AHQUAuaW4Q1eHvJjG3ChVV7qK1VhUYgzMDL95klpzQaRYMvN+exDzVOA
	GmWPfqmWUbTr8VoT2ONSWmRcYHqA4Mo=
X-Google-Smtp-Source: AHgI3IYmnmNQCwG5jTwH4lZm1tuylcE7NpDQ+kaXb0rFa/1T7HLFYIRL0loRcH3CpRvtau7AuZ5NDw==
X-Received: by 2002:a5d:6203:: with SMTP id y3mr10696096wru.137.1550353605824; 
	Sat, 16 Feb 2019 13:46:45 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	n6sm7147773wmk.9.2019.02.16.13.46.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 16 Feb 2019 13:46:44 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 16 Feb 2019 21:46:36 +0000
Message-Id: <20190216214638.11456-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190216214638.11456-1-richard.purdie@linuxfoundation.org>
References: <20190216214638.11456-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 5/7] font-util: Break circular native RDEPENDS
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
X-List-Received-Date: Sat, 16 Feb 2019 21:46:45 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-graphics/xorg-font/font-util_1.3.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-font/font-util_1.3.1.bb b/meta/recipes-graphics/xorg-font/font-util_1.3.1.bb
index 34646ff99b4..1289c1686c6 100644
--- a/meta/recipes-graphics/xorg-font/font-util_1.3.1.bb
+++ b/meta/recipes-graphics/xorg-font/font-util_1.3.1.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5df208ec65eb84ce5bb8d82d8f3b9675 \
 DEPENDS = "encodings util-macros"
 DEPENDS_class-native = "util-macros-native"
 RDEPENDS_${PN} = "mkfontdir mkfontscale encodings"
-RDEPENDS_${PN}_class-native = "mkfontdir-native mkfontscale-native"
+RDEPENDS_${PN}_class-native = ""
 
 BBCLASSEXTEND = "native"
 
-- 
2.20.1


