Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web09.8731.1604910714363200425
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2020 00:31:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CNhi6/f6;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id 7so10999905ejm.0
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2020 00:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=m/5KLro1DpdJMSrMDJ3UOmfVQmZ1IyfvONbnEcdAWbs=;
        b=CNhi6/f6l2f65EX4luAextsGs53FZ0zBrJj6BwQiGZkRNabuEdCXkY3/QiZWNZi6XQ
         Ox9iIMutK7+t1il6EVbZEQLCsnzgsfUMBAGJl39Z3n5Im2R8EqPPf/OrlSCd4hyLBDge
         gW/RJVkJSS0Rva0+UUKJs+lOzUowPgQa62KwOt3hSxf31ycvJup5ACzUD1httLao0oZ8
         i+4AMquCgCLoz8VixzAhFTQdyVFZ9vG8IkkGhnImczdQ/Fn8SKLUHf3u4A9nzbUZx9Kg
         j/yF1ghuYERw7QYbMGRFPP8MySocc6ys1dHwRHuCGh80g+Mp01cmuo6Hab9L17g936fS
         dBoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m/5KLro1DpdJMSrMDJ3UOmfVQmZ1IyfvONbnEcdAWbs=;
        b=VExIFQySoWEuU2ArG87vnfO8frgKhyfnJ246T79nmdMJDqArRJSgnHj/mwiWSY00ge
         BkIXCZUueV6Huw4LUBT9xcqmgAH64AU19WKl0h2qEgaz1wrFI4cC3XMqyKKHxEgISdr7
         RSkzNtv02DUk6zNSASK7Z/70duJNcFEOhuYTh3fXWBJEpmmAKT63fhv2qNay9KnC7a0r
         i6OumryAOxIItvABy8at/orbKqEja3FKWqLoskd61gzz0phR+te0f3jCxWGt9W+SKvCU
         3v6jQR1Deohhpfa2FFuQ1w1IsmaaBhX7BtTUr4VDS/QMQrDLOZeAkbT3pF2NLUN70Osl
         IekA==
X-Gm-Message-State: AOAM533SOyxeLL7YT4Z2/PiYAv5vXAss2dFM3ahycFzYomQHMaZcgFvB
	Kw/Yp7f6DOTf2obuJaNwv0QwEwB1IJWVnw==
X-Google-Smtp-Source: ABdhPJx3MCEV0xTqfh4NQuHrAUc+50XCAWAGwjyRwtefr3hMyQWfMMxVFtMzV5nnr/uDMMPzhTAAPg==
X-Received: by 2002:a17:906:5618:: with SMTP id f24mr13649394ejq.381.1604910712776;
        Mon, 09 Nov 2020 00:31:52 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id sa23sm8187691ejb.80.2020.11.09.00.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 00:31:52 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [RFC PATCH 12/12] poky.conf: remove wayland/opengl from distro features, as it is now oe-core default
Date: Mon,  9 Nov 2020 09:31:33 +0100
Message-Id: <20201109083133.16503-12-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201109083133.16503-1-alex.kanavin@gmail.com>
References: <20201109083133.16503-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta-poky/conf/distro/poky.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-poky/conf/distro/poky.conf b/meta-poky/conf/distro/poky.conf
index 31dc110bf6..f9050a1718 100644
--- a/meta-poky/conf/distro/poky.conf
+++ b/meta-poky/conf/distro/poky.conf
@@ -15,7 +15,7 @@ DISTRO_VERSION[vardepsexclude] = "DATE"
 SDK_VERSION[vardepsexclude] = "DATE"
 
 # Override these in poky based distros
-POKY_DEFAULT_DISTRO_FEATURES = "largefile opengl ptest multiarch wayland vulkan"
+POKY_DEFAULT_DISTRO_FEATURES = "largefile ptest multiarch vulkan"
 POKY_DEFAULT_EXTRA_RDEPENDS = "packagegroup-core-boot"
 POKY_DEFAULT_EXTRA_RRECOMMENDS = "kernel-module-af-packet"
 
-- 
2.29.1

