Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33339.1795350820710204686
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Nov 2026 04:33:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=tTCnzd2J;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: saeednourian82@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so12562215e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Nov 2026 04:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795350819; x=1795955619; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DOCti7/PYy8JUCWiWl4lGnQitP+T/HP09C/rsBmjDR4=;
        b=tTCnzd2JR4FmjLRkYiiEaEJDItWgxjWDemFdCDra7/p+iysq8kaC9ABL/pCfhYvdXw
         I3fvcIuWRo09exX2t4KPdwjH9fuUj8XY1p7B1fl/y/Vssvkupcd1tY6VDNHBvKrskGXz
         EAic9lb78YloRgGg0GcMFQc+MuKTSYekWUcglyLX6Vfi1Jwm5i6NqYtslzTUo4aez9qY
         zsrSPCWVNxKXZQV+8BlnuCC0ExlozFAzoFHFgYigBn3ZLFknjJgEWIoflCTc8DbVYIvv
         OR7iZaNC60SWA8AG2qy3Q8nfq16v9ctpMk3vsxSvLlhhFbUKk3Sa2dHkxe+tFuUwHfFJ
         4uQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795350819; x=1795955619;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DOCti7/PYy8JUCWiWl4lGnQitP+T/HP09C/rsBmjDR4=;
        b=eBJJIffzzex2dewkV71UFsd7Xa1IFd+prnLfKO9Fdc65YBz7+LV2nldt1RnY1FWDEr
         oS1aEoO8R/wAjfJpm4ZLx9HsUYE4pp5I03tLTkmoTvlOGIgC/E1RBCsKsdIh4JISgF/F
         oVC61eGBOFOf2Uo5kjOpFnWCCL9j5kF2yUXxGfshmDLjJoEWiZLI7MkNbA0Rzp7wwlx2
         iSheWCUnAhfsnnmSdHwpIA5cgKULWu1PzLuK9gTrgNGNYMm+VEwTMxKGqm+qFRLRlSrx
         R315jEToFDyhjhC2aFak+iYdkgD2dwt25gGM9anuPLoHpZL4Y4tT5N25ChdloJpriSLf
         1oAA==
X-Gm-Message-State: APuU4Z9fG456cuRwanyYJSrEa+J8tSq/grLyK8AM7EshZ4rbPWsmVBIJ
	igrxavvwacB2Z9p8Hu3vnrMZLnKsf9O26GJnQG1tRB1O7TrV3Obo2xIc78sgtCeO0B61NA==
X-Gm-Gg: AZFdTZdPjTDRyw7PMtI4moE/6VqQHhteavEwxjwHz30HgWZPczCbixmkq518WSz7A/d
	93kgm7WXYUFjgDFhQid02iQFvvodDwJOPKKWpNb9FV/AEv//Ez1cJS25XQTP4Y571acDsvhaLTX
	IhSl3yWTWRtIktxCkTqc/WsSgDoMwUpb0icruwwgHLmKAcZ1Yt6BQNKO+0yXfClRsvmEivcI47q
	O+MU+nFqWLfmys2BDfXwN664k4NXVj0lopk0IDkFwkGee05Fq3T3e7Odqh2aLvJY8+OLBdGJPxS
	U6YVu2Ci5zOsdDfML16MOgMjFUMWYxG3LaVw6FZnNIfdQ1DAbNPJjO+V1ULgtoxT5lxtZmTg843
	sDXkSYF/fq3WkVhXBiom3SpDrimFeGu2YLWrygFNfyvSb3TusYOXrDhQp3rIisEn6Y4VeuLwtRF
	EGNF6QLHbWzrRF5yMo6d3YRDkImNDZRLET6/O3aIhDOpeK8VqVLXCMmR7GRYV6O6xsr75q12P9N
	ACzZisXtNZZxE6P0A16VxZ/03DF+WbH5SEvZ74K0Xp6qUiAUcDi4zHZM95oME1k8C1Ea7M88sDV
	gog+oVKhId1g+LTi5GF0MdTag3akVVdLOdpQ7Fw7iPwtp8IWzJVj07i58AXli4mqf9ZpH36hfIG
	rABwuvZxVe6Ek5Exz9Ic=
X-Received: by 2002:a05:600c:5249:b0:4bb:665c:a078 with SMTP id 5b1f17b1804b1-4bb8893a89bmr179759325e9.28.1795350818806;
        Sun, 22 Nov 2026 04:33:38 -0800 (PST)
Return-Path: <saeednourian82@gmail.com>
Received: from saeedvft-ubuntu.tail2d4112.ts.net ([46.100.16.26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9067846esm123540645e9.4.2026.11.22.04.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 04:33:37 -0800 (PST)
From: Saeed Nourian <saeednourian82@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: francesco@valla.it,
	mathieu.dubois-briand@bootlin.com,
	Saeed Nourian <saeednourian82@gmail.com>
Subject: [PATCH] image-fitimage: fix typo in FIT_LOADABLE_COMPRESSION example
Date: Sun, 22 Nov 2026 16:03:24 +0330
Message-ID: <20261122123324.585452-1-saeednourian82@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 22 Nov 2026 12:33:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250868
Content-Type: text/plain; charset="utf-8"

The example sets FIT_LOADABLE_COMPRESSSION[atf], but
kernel-fit-image.bbclass reads FIT_LOADABLE_COMPRESSION, so the
setting would be ignored if the example were copied as is.

Signed-off-by: Saeed Nourian <saeednourian82@gmail.com>
---
 meta/conf/image-fitimage.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/image-fitimage.conf b/meta/conf/image-fitimage.conf
index a06d30e494..eaf9120bbb 100644
--- a/meta/conf/image-fitimage.conf
+++ b/meta/conf/image-fitimage.conf
@@ -91,7 +91,7 @@ FIT_UBOOT_ENV ?= ""
 # Example:
 #   FIT_LOADABLES = "atf"
 #   FIT_LOADABLE_FILENAME[atf] = "bl31.bin"
-#   FIT_LOADABLE_COMPRESSSION[atf] = "none"
+#   FIT_LOADABLE_COMPRESSION[atf] = "none"
 #   FIT_LOADABLE_DESCRIPTION[atf] = "TF-A firmware image"
 #   FIT_LOADABLE_TYPE[atf] = "tfa-bl31"
 #   FIT_LOADABLE_ARCH[atf] = "arm64"
-- 
2.43.0

