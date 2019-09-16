Return-Path: <armccurdy@gmail.com>
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id E6EAE7F2A0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 19:24:45 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id x10so550879pgi.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 12:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=6BEkz1Xe2v/iYUSXAlNjR79VajN70EzO/bujZ0wYPi0=;
	b=imKeYHwz/3Vv4sBWrndm81LSEfEBc+eHfhcfnkGxVwAjHD4NhWmssc8HcYaUT56R+l
	clnsNADwD6HgCKq0ZVpA6SmjTZLPKMBiK7hKWFzGSH+3d3LpxbG3FH8cGX63B9FqAWOx
	1bQ7go1DYbO1kpV3tpqvdn2eDfQdaP5QBQ5T7VMvAartL9c8zs4K9w4qdp/yr4tVCqig
	2B7vZMBPtXWG+Z9NA67gejpuWUODdhNlwF2wJukivxWcOWxZ4Bnj6kywCvrB7QaoIVrF
	LzznvBK8DMGrGJHNwlo3X1dPYs8cZ1pmug3jS2D3PUSqEIhTdHVDaEsULGKLSYNGYMdT
	Z5rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=6BEkz1Xe2v/iYUSXAlNjR79VajN70EzO/bujZ0wYPi0=;
	b=BW8aQ6e2vW7cO3dEekc6LA8U/ykhAorxLPmMDOxv5ZkucGE0emu7bEyYvzBF8XRGtB
	2+spluXtJ8RBmMblAYCWQ94S/G3iTUR87nHkCrRJC6Qtb5aIkBN+KVlmm25V/10o61bD
	gdtitW2pmpude7J/Q3uNDrQV9Omt23KFkGUp1RrG2LEWfPHCliivQd8QbSdWFUJND3cH
	tkIzJcPGYZPFsGFRPF9EIyWVAuXvf93To/6FCVfei8QYj6fpc0rLi/yFGiobeCrzUHtM
	1TNajlwzgVG317nFKMNTolFUjXCcT+ea/Srp5FIuCCHx+JuVyyYTwRxdZ9tdBcdZI5HN
	wNgw==
X-Gm-Message-State: APjAAAUx5Q+zHy4l4yjaK2Up6OZh+rzuOSbvTPDSzjTsYsvPbd1+Un3Z
	1a0+xuG2Lr6eBE2xiEm58Ghaiw3Y
X-Google-Smtp-Source: APXvYqzgOyptuXfUmAgFirJqVeuVrnf6vznJi9iXM/0krYsPpQU1Yg+Ug9wInExKLj5/xV3Ro6+mPQ==
X-Received: by 2002:a17:90a:30e8:: with SMTP id
	h95mr912015pjb.44.1568661886818; 
	Mon, 16 Sep 2019 12:24:46 -0700 (PDT)
Received: from localhost.localdomain ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id d7sm5490494pfr.7.2019.09.16.12.24.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 16 Sep 2019 12:24:46 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Sep 2019 12:24:29 -0700
Message-Id: <20190916192429.27294-8-armccurdy@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190916192429.27294-1-armccurdy@gmail.com>
References: <20190916192429.27294-1-armccurdy@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 8/8] libunwind: apply configure over-ride to both big and little endian ARM
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
X-List-Received-Date: Mon, 16 Sep 2019 19:24:46 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-support/libunwind/libunwind.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/libunwind/libunwind.inc b/meta/recipes-support/libunwind/libunwind.inc
index 5726589661..76a1bf6246 100644
--- a/meta/recipes-support/libunwind/libunwind.inc
+++ b/meta/recipes-support/libunwind/libunwind.inc
@@ -12,6 +12,7 @@ PACKAGECONFIG[lzma] = "--enable-minidebuginfo,--disable-minidebuginfo,xz"
 PACKAGECONFIG[latexdocs] = "--enable-documentation, --disable-documentation, latex2man-native"
 
 EXTRA_OECONF_arm = "--enable-debug-frame"
+EXTRA_OECONF_armeb = "--enable-debug-frame"
 EXTRA_OECONF_aarch64 = "--enable-debug-frame"
 
 do_install_append () {
-- 
2.23.0


