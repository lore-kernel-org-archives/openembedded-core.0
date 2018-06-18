Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 6994374F96
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2018 10:10:52 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id p11-v6so14410148wmc.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2018 03:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Cnyc/vfG4qdCjzxBugtb+RWxeXwC9Mehgk7Ck1zmmDY=;
	b=ogiRWZbgt10YDZ7luQh5bBULqGGyonHSrDFpr+2Gkvd+ffRrRtErXt8gRYVQ7eQKTl
	W+u7q7GStamNAnJl/i/RO5o9lnr5mnGqzBzmLixHpF0R+ndXaROjV3EjFMOUoyt3eym6
	2qirJheXn553wS/0MxraEBriJRWQAb0RWtjeGuv5RbtTIfbXWWgOjX/hi3CTXqopl5vz
	JjTt/UaErmeq7BZaQvsgZbYaXsnC7SvbpbbSBfS+8WSgRVNSUL+GAHc0v1adUeRu1o6W
	ySLC7dxC/3T4dqZt46P++Hea9IcGwpbblz5gsLEDK34jyxBLYwovDvs1DkVCJ4LYeMQp
	k+rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Cnyc/vfG4qdCjzxBugtb+RWxeXwC9Mehgk7Ck1zmmDY=;
	b=TI9Px+pOx3BgC7iFWsb4BaNtlKIVjLHItWTU84WmjcpSieENQqk/IdG8j5r2mUgXnt
	FRD59DNOY6KeDlDqBr0B5ea1U8fixEPwfg330a5kV4tv4hfGEukuLpZkwWxrFqrrzRkX
	M4BKIV9w/3lfN6d5RQkb3axjbGoZv/28alMzYjEK1LqwCuCGttiIrAku6/j+GXN/rmhT
	/L8L8XMuhvWaWyq13qwp65Pxaw224Om6iFFjLCVFI2ixSuDl+6NF+clFsQhKx9kO1zq1
	JWzBGF4QOCxupKz5hgGv/8QbgabwRM/unM9WTZJLlIafPjIdN9tPM5LzMnXeZ2au7YI/
	uwbQ==
X-Gm-Message-State: APt69E1d/gfzO0Jc9rW1mQyFocoHu+6UM03bglggtKmh3ZJ6AWM8YEho
	DGrPoBWgjiwo5VPRh7pZ5pi3tPy8
X-Google-Smtp-Source: ADUXVKLSB6EjiFgwrzvprSRfPRJugLjx71Gn7/Jm6QUoZ2qvfcNk6vG1k2HslBmfNg6UV3FC1vK8Hg==
X-Received: by 2002:a1c:dc41:: with SMTP id
	t62-v6mr8432430wmg.42.1529316652540; 
	Mon, 18 Jun 2018 03:10:52 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	e2-v6sm17583475wro.97.2018.06.18.03.10.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Jun 2018 03:10:51 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jun 2018 11:10:44 +0100
Message-Id: <20180618101044.10636-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180618101044.10636-1-ross.burton@intel.com>
References: <20180618101044.10636-1-ross.burton@intel.com>
Subject: [PATCH 3/3] xf86-video-intel: update dependencies for the tools
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
X-List-Received-Date: Mon, 18 Jun 2018 10:10:52 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
index cda1de1eb1a..5cc4eefc785 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
@@ -31,7 +31,7 @@ PACKAGECONFIG[sna] = "--enable-sna,--disable-sna"
 PACKAGECONFIG[uxa] = "--enable-uxa,--disable-uxa"
 PACKAGECONFIG[udev] = "--enable-udev,--disable-udev,udev"
 PACKAGECONFIG[xvmc] = "--enable-xvmc,--disable-xvmc,libxvmc xcb-util"
-PACKAGECONFIG[tools] = "--enable-tools,--disable-tools,libxinerama libxrandr libxdamage libxfixes libxcursor libxtst libxext libxrender"
+PACKAGECONFIG[tools] = "--enable-tools,--disable-tools,libxinerama libxrandr libxdamage libxfixes libxcursor libxtst libxrender libxscrnsaver libxext libx11 pixman libxcb libxshmfence"
 
 # --enable-kms-only option is required by ROOTLESS_X
 EXTRA_OECONF += '${@oe.utils.conditional( "ROOTLESS_X", "1", " --enable-kms-only", "", d )}'
-- 
2.11.0


