Return-Path: <liu.ming50@gmail.com>
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by mail.openembedded.org (Postfix) with ESMTP id C48F978310
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Aug 2017 17:14:42 +0000 (UTC)
Received: by mail-yw0-f194.google.com with SMTP id t139so1645864ywg.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Aug 2017 10:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=q6zJdcKhFWK/ceUKtNjFgv7REO6Li5tmlAHTqii9PPI=;
	b=GknASZWxcyLJUW+9JQzMky1RMGdxQDjQqEjGncJBmLdoTGVbU36ElZHILvGWdoueX/
	2C6oqAWdMUEXRPdZBZ3CBEYVjlaXa3NoqzNCJOEo6kio1Dua5FF5YqbXFo46v8v6fNyK
	YHEsqPnH97Vd72M21NAcdsZi0Yza2GpI91VNsGKvhDVMnsQVrAIUyx5ZkukMja7UJFHw
	JSxHZ43u+lBJfvBeoHEnAeZQiG7glfuBEH25gdxGkG8DZ1gEagQ1YNLvh6Jeo80Qvz3A
	/3K8PCprCWFKyjLf07BDMsYiDTiWxK2yD6D1BNVCSAcASDAxHTkU2f9nAsIAavzUNKPw
	+MDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=q6zJdcKhFWK/ceUKtNjFgv7REO6Li5tmlAHTqii9PPI=;
	b=mqLZ1jcwVtQI37QuBBVXnRuSYs7mtngd9iMj+VKFDBuvoqvXeRbIGkO3cokubV0jcP
	Cb0LP6RF2gX8KZ4VxEruu7gu6ENXFXtvEmFW8R7Ad2Qj6RVZofx3V9e0/zps4BkkIyJs
	gFnpRnXGxht9/lN5nAKQn0Z4syYyrxPpdTS4FmWE3Ap6Thl8lo/VXK3gXhEZ001CYi5D
	IV5WSRj52gc/gQ9B0dnenjRg1kdKPajml7yDC6TOQHyGHAeQKCgy185UhiitkoMS4aW1
	iYVdB8csyA4QocGVZfOdQweMlUsOFIhknGHQns0LwlEGNfVZiC8SQxnxwP2pD/kY9mO8
	CYvA==
X-Gm-Message-State: AIVw112fdK5oOP6CHXGuU5rppqQUuh0H+C8jxABcS+jpK++FYYYEd30r
	zG9EJocB/xqd+Y6S
X-Received: by 10.37.164.166 with SMTP id g35mr17223809ybi.132.1501607683775; 
	Tue, 01 Aug 2017 10:14:43 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([27.191.201.186]) by smtp.gmail.com with ESMTPSA id
	r64sm10946066ywd.107.2017.08.01.10.14.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 01 Aug 2017 10:14:43 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Aug 2017 19:13:49 +0200
Message-Id: <1501607630-30241-4-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1501607630-30241-1-git-send-email-liu.ming50@gmail.com>
References: <1501607630-30241-1-git-send-email-liu.ming50@gmail.com>
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH 3/4] qemux86.conf: drop do_image_wic task dependencies
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
X-List-Received-Date: Tue, 01 Aug 2017 17:14:43 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

They are being controlled by WKS_FILE_DEPENDS_DEFAULT, the code here
is redundant and incomplete as well.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/conf/machine/qemux86.conf | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.conf
index c26dda2..f0bebbf 100644
--- a/meta/conf/machine/qemux86.conf
+++ b/meta/conf/machine/qemux86.conf
@@ -29,4 +29,3 @@ MACHINE_FEATURES += "x86"
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "v86d"
 
 WKS_FILE ?= "directdisk.wks"
-do_image_wic[depends] += "syslinux:do_populate_sysroot syslinux-native:do_populate_sysroot mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot"
-- 
2.7.4


