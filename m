Return-Path: <changhyeok.bae@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id B5E327FDC8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 21:58:50 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id a5so265647wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 13:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=6lFfXx6T4bZ9PJP0n5yZHnvQzLHexYDasSJdAxjxD0k=;
	b=YRWG8FXXBKjebIHZYkkzAaXJ2cmj0tdevPw3CAuTdvOYKpTO3nfaD98LLLouFMbnqR
	ARAk0AC8CpD5a1gQiJw505sJcQ4mvLMwEiN8w028V7E8TeiDRcfPUAe6Hm1ByKewepKR
	En2iqJepV56Z75v4+LWmI/n8zaDrWdtzl7MBulBQLoYvr5e01wZEi2W/CGenwlO7efsD
	74IVtC5N4tAzVK9qes5lxkknYvXxas+wZFgl7QRO3yZnj7TnopUnUco3FwegrzWTfV4l
	zYO7/LO+BjaJuOuAVIB+X3DXN6gzrGiaVZ0bOkcmkq7ScB/TXsDkt4LIhuXzi4x02DgR
	WwMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=6lFfXx6T4bZ9PJP0n5yZHnvQzLHexYDasSJdAxjxD0k=;
	b=f7dXqOJ7jmezxR+Kh4resE+iNpDLct7l02YzdB71sAWeRJKjS3Wz7mrLNpwun47KeS
	aDj5Lb/HMYuiu9r1GMPcq+V+ViccD7Qx3JosJIJjm6zDicz/5XiNdwZcwKWa+SRgGWsI
	+MTvkPvh+8/48HguR8mh9+PzBskl3vZIIIoTPNPa4tmez0TfgEuQAWq5q3EEVFz7clCn
	QjGBfzI33u6XhEMJYbTWmNFZcFMYtpvyszeuYAl4SwIXvR9tIR6KXTJbnzJQ3XIf+6ZB
	NL8K68X7GrWL50RyP24paWnHZp8bOAXfi9nj4+aVCI2eUrGmdEZP71QIjR2O8/J2MXe6
	wPPw==
X-Gm-Message-State: APjAAAVN3nbOvDdOngNE9lFU6a1rj782s/p5f2eRj7IO3Ght6nsZeUEF
	nmdaIjMUizWcbJwohSB8AG9SwRcH
X-Google-Smtp-Source: APXvYqzd+doZVOvytZNurwCqRzVjgmqSxpdJkfgpuL6VslvtO7CA0SUCiaJhJBTsuLybQMefYKvEAg==
X-Received: by 2002:a1c:7717:: with SMTP id t23mr777728wmi.17.1580162330938;
	Mon, 27 Jan 2020 13:58:50 -0800 (PST)
Received: from cmtcleu60844809.rd.corpintra.net
	([2a02:8109:b5c0:3fe0:dc62:8512:95d7:1c04])
	by smtp.gmail.com with ESMTPSA id b16sm194198wmj.39.2020.01.27.13.58.50
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 27 Jan 2020 13:58:50 -0800 (PST)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Jan 2020 22:59:25 +0100
Message-Id: <20200127215927.19826-1-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH 1/3] iproute2: upgrade 5.3.0 -> 5.5.0
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
X-List-Received-Date: Mon, 27 Jan 2020 21:58:50 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 .../iproute2/{iproute2_5.3.0.bb => iproute2_5.5.0.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_5.3.0.bb => iproute2_5.5.0.bb} (66%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2_5.3.0.bb b/meta/recipes-connectivity/iproute2/iproute2_5.5.0.bb
similarity index 66%
rename from meta/recipes-connectivity/iproute2/iproute2_5.3.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_5.5.0.bb
index 75772d4696..ad0ab13c9a 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_5.3.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_5.5.0.bb
@@ -4,8 +4,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-libc-compat.h-add-musl-workaround.patch \
           "
 
-SRC_URI[md5sum] = "227404413c8d6db649d6188ead1e5a6e"
-SRC_URI[sha256sum] = "cb1c1e45993a3bd2438543fd4332d70f1726a6e6ff97dc613a8258c993117b3f"
+SRC_URI[md5sum] = "ee8e2cdb416d4a8ef39525d39ab7c2d0"
+SRC_URI[sha256sum] = "bac543435cac208a11db44c9cc8e35aa902befef8750594654ee71941c388f7b"
 
 # CFLAGS are computed in Makefile and reference CCOPTS
 #
-- 
2.23.0


