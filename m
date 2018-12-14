Return-Path: <mhalstead@linuxfoundation.org>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0C22074535
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 23:09:11 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id y4so3322148pgc.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 15:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=jXYuyjpnF/G/RXhT1L5UJfiMY+b1lTFcBJQKzjVKSdw=;
	b=gKqbPQZd2IofRpqCRYihtS9CDRk0JmE3J+CE8jn70Ip7tO/m05w/TEb3WlP2Qu25Qf
	sAzhrPH3S6MWpYuC5RtWL6l7uhHpqqhnn1zkhxUe5lJSRU2hPoL++F+zb64iJAAaiuyb
	kLko/lzXo2c7nhNmziABkyDUpn+qL4zxC0pRU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jXYuyjpnF/G/RXhT1L5UJfiMY+b1lTFcBJQKzjVKSdw=;
	b=VjhoAw939I7aVMy3aCOvSN7BqrS0RkM1H7j9T9nfnTYLZfE+1O98ecs7xYOZL8jcxv
	aw3GI7LoioNSJ0Pz2K2C473Dxd0MDCA4Sn7iyJAhYW72Hm5zj2jY6lGILFgNZ4ouTkaI
	ZpXRS2+1Vpfa+69h+bw/jCGUoI+73IDvQiJY9W/01pTOGSNbNAiRXfgG8tTmSKFRWK44
	Qx3WbG92D2wfM1E9LIXTJVyruzn9YqH3TTjv7Gs5pm+nGJiKBMp+DOHBGr1NHdxB0n2V
	LiDjzRUY0XEbBfjti92G1KIYxLrBnu6SjV4SlxUyl/f9g/hzrF7F2ebZFwBFkeqSPGuY
	6MpQ==
X-Gm-Message-State: AA+aEWbR+d1wDaicMsr2i94pfWCjp5RyR14rMwXeteWO9DgV2IcZzs/n
	DmHQTn3KSb+W9DgRgWO0CKjae8Cb4Z8=
X-Google-Smtp-Source: AFSGD/WcRVxHaOsNbuUg1UmSqHFyJJ/GapJ+oiFmr4RvnvGKM+C6f0TWGPpf+tP0YGs4w5WWkJ+L0g==
X-Received: by 2002:a62:18ce:: with SMTP id 197mr4787286pfy.88.1544828952406; 
	Fri, 14 Dec 2018 15:09:12 -0800 (PST)
Received: from localhost.localdomain (c-24-21-170-32.hsd1.or.comcast.net.
	[24.21.170.32]) by smtp.gmail.com with ESMTPSA id
	b202sm10397497pfb.88.2018.12.14.15.09.11
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 14 Dec 2018 15:09:11 -0800 (PST)
From: Michael Halstead <mhalstead@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Dec 2018 15:08:03 -0800
Message-Id: <20181214230803.19443-1-mhalstead@linuxfoundation.org>
X-Mailer: git-send-email 2.17.2
Cc: rpurdie@linuxfoundation.org
Subject: [PATCH] yocto-uninative: Correct sha256sum for aarch64
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
X-List-Received-Date: Fri, 14 Dec 2018 23:09:12 -0000

Avoid uninative checksum warnings when building on aarch64 hardware.

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
---
 meta/conf/distro/include/yocto-uninative.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index c9d502ba4f..0d484f6c3c 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -9,7 +9,7 @@
 UNINATIVE_MAXGLIBCVERSION = "2.28"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.3/"
-UNINATIVE_CHECKSUM[aarch64] ?= "b7fbbaad1ec86d76eca84d83098f50525b8a4124cc8685eaed"
+UNINATIVE_CHECKSUM[aarch64] ?= "e495046969c796b7fbbaad1ec86d76eca84d83098f50525b8a4124cc8685eaed"
 UNINATIVE_CHECKSUM[i686] ?= "44253cddbf629082568cea4fff59419106871a0cf81b4845b5d34e7014887b20"
 UNINATIVE_CHECKSUM[x86_64] ?= "c6954563dad3c95608117c6fc328099036c832bbd924ebf5fdccb622fc0a8684"
 
-- 
2.17.2


