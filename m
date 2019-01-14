Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id 913F57C049
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 15:03:41 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id y139so9180616wmc.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 07:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=+mV7qq0RnYfXCrxHPYE8hQD1oUcwIoHz4Zvov8/vK8s=;
	b=VIZ85qGJQ2XnzhOsD5RLNlb9saN/bDnBfureaqaGEU5yXtNYA72wcaiCsVzmtGvJmT
	JozMivRK5KndOvsN1o5UHxOSxWJei+E3GXdgSsSm2FyD73r+2+jQVNtJF0KsqYIj8WJT
	Vvx9zXLMMhgWCKklrwQLKh7ShHe9zDadtS8mnkiVbCVye2xATOxskKwFIEAbhyqORdmj
	9vphbirvufFD2lMrxPXjBJMgzCsb/gFD6K4KOOUWunyGvZZxU20x5UaVjlA8ubg0oxD2
	wHEOrcWcFUstdbIlHjTYFJcw04q+DQTXXZrSQQyvC51JfcweSfp/Isq8qRW2tN/97bsU
	MYRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=+mV7qq0RnYfXCrxHPYE8hQD1oUcwIoHz4Zvov8/vK8s=;
	b=s/6/8On/ZG9T+cBvSl4Uo5kd6zBELaiBgid37kZADlZ6zh/+6kd7SprmPTV8NXN/rp
	RZLDWZFmJAHUxV2GJQMGYKoRrX8iSlqR/QPzmPRgOrXBILe0iSWY0Xc+ZdcrHlj1SjqF
	WFu6g9UUtcKOxHsZcL9V0x99txiUQOgitqvM7wZsccBV2R7KA2w+BNrXUgrGmJUXk3uX
	y+W7D8Z+vrz+fl6LWxkA8kNOaA/LI87wzSRmWmm11PWSew24NP81WQ8CFtW2ruP4WQB+
	HbC//9wTKYGwKC648ibcoy7B2Lx4G8N+uycqepnI2+1LDr/0gd7cPOwVsmKZpOifK5pQ
	dMQg==
X-Gm-Message-State: AJcUukebr9joM5yudrA+RWFKOszR35A+FBFnvmi40n695wB8E48KCGZg
	WZ8CnBAv+AcAhPP61sVTML6QVIUx
X-Google-Smtp-Source: ALg8bN7pX+QZN06mygE0kk+sC3q/7IbygLuWtulHSBVMnF3frNojhlJg+BnMDQnLpTnDJWdBzXvMLw==
X-Received: by 2002:a1c:e715:: with SMTP id e21mr12286267wmh.101.1547478222034;
	Mon, 14 Jan 2019 07:03:42 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	y34sm201725236wrd.68.2019.01.14.07.03.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Jan 2019 07:03:41 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Jan 2019 16:03:14 +0100
Message-Id: <9e8534f655033e327e3dc3f01784f9e494cfb75e.1547477793.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1547477793.git.alex.kanavin@gmail.com>
References: <cover.1547477793.git.alex.kanavin@gmail.com>
Subject: [PATCH 18/23] libjpeg-turbo: fix nativesdk build in same way as native builds are
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
X-List-Received-Date: Mon, 14 Jan 2019 15:03:41 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.1.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.1.bb
index d9d877dc0df..029847ff5f4 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.1.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.1.bb
@@ -31,6 +31,7 @@ inherit cmake pkgconfig
 
 # Add nasm-native dependency consistently for all build arches is hard
 EXTRA_OECMAKE_append_class-native = " -DWITH_SIMD=False"
+EXTRA_OECMAKE_append_class-nativesdk = " -DWITH_SIMD=False"
 
 # Work around missing x32 ABI support
 EXTRA_OECMAKE_append_class-target = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", "-DWITH_SIMD=False", "", d)}"
-- 
2.17.1


