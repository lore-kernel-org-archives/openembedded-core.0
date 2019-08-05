Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3D6227F35C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2019 10:59:23 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id u25so62191493wmc.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Aug 2019 03:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=o1jUxj8A2VC93tSKheuEuDiiEVKbDaBpZel6OravNkU=;
	b=VDYalMhQnt7J2cqgwkW/ptyqDt4M/lb+9mKSTDdsg32xVacbKa/0a4LfBotORDnb5p
	AF48UdXmzf/XtTeCuOsqMTPflQ3xZH/rVeCUuTt30h5a8lysXKxhkocYQqzrd/qyVx3L
	DIrfrg4eMQvAIiOD04AFb5cPQmnVxk3LbC6I/XCm2xfyEZjTPSFrxXe7St65MqoY0t6D
	z7DyFP0n8mC7fc6j0G2IKyVla/WZe1o/v68QHGCN0aGTEZo5fod34MbsIth5pSWBJwE5
	rxhGwVGqztmio3PRLeBxjjoJZb6HgYdlU8D2/rTMcaiCg4yni2fuCJVyZ8TkTOajRSju
	D3Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=o1jUxj8A2VC93tSKheuEuDiiEVKbDaBpZel6OravNkU=;
	b=DRRGhBm3yGFp4zTo6NCSb2+vhgv6246KkcdUHDsIos8giTcUk1iyCUGeGfawqlonCu
	p1IJ7gg0FxOG/ZVG/8c8NL1Hj9om2oiRrXROFSHPrC6TDyoRYCSGcmG/nHqmDzZe6CeB
	9Tx6AZljm+u+nd+/iDxO2D/jvFMTc8S2h1iioJINKODy22R2cjsdi/N36MafC86BFVUJ
	eBUmxUXQN0sXCinW93sNKwlvBaVYPExl2hnhxR1taC9pf7q6Y2NeK100LEFgtyIyieMD
	IvZiRHybxWYrfgfoggLbXcuq7yHOEeEQHDu1p+zng50HmPmh4H1Ai4ybPMci8r7uZHqk
	eUqA==
X-Gm-Message-State: APjAAAUX4CPNNOhmba734hEBegq+OXnaLtzY67IqSWILLYNkR7Uhg1X7
	n+w1lqw7qlD59Wp3M6q1EpBpVjuadZg=
X-Google-Smtp-Source: APXvYqwtyii2Uhh41eoKZfY+UY91rK/+tTjhJGUCRJ9TGhOSEqEVCqRqAX+oGwP3R19HRRHNO8EEpg==
X-Received: by 2002:a1c:20c3:: with SMTP id g186mr18090817wmg.15.1565002763662;
	Mon, 05 Aug 2019 03:59:23 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	c1sm192158885wrh.1.2019.08.05.03.59.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 05 Aug 2019 03:59:21 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Aug 2019 11:59:19 +0100
Message-Id: <20190805105919.22258-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] qemu: fix patch Upstream-Status
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
X-List-Received-Date: Mon, 05 Aug 2019 10:59:23 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...4-linux-user-fix-to-handle-variably-sized-SIOCGSTAMP-w.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu/0014-linux-user-fix-to-handle-variably-sized-SIOCGSTAMP-w.patch b/meta/recipes-devtools/qemu/qemu/0014-linux-user-fix-to-handle-variably-sized-SIOCGSTAMP-w.patch
index f7939b84bf6..7cac8ef3d11 100644
--- a/meta/recipes-devtools/qemu/qemu/0014-linux-user-fix-to-handle-variably-sized-SIOCGSTAMP-w.patch
+++ b/meta/recipes-devtools/qemu/qemu/0014-linux-user-fix-to-handle-variably-sized-SIOCGSTAMP-w.patch
@@ -31,7 +31,7 @@ Message-Id: <20190718130641.15294-1-laurent@vivier.eu>
 Signed-off-by: Laurent Vivier <laurent@vivier.eu>
 Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
 ---
-Uptream-status: Backport (upstream commit: 6d5d5dde9adb5acb32e6b8e3dfbf47fff0f308d2)
+Upstream-Status: Backport [upstream commit: 6d5d5dde9adb5acb32e6b8e3dfbf47fff0f308d2]
 
  linux-user/ioctls.h        |  21 +++++-
  linux-user/syscall.c       | 140 +++++++++++++++++++++++++++++--------
-- 
2.20.1


