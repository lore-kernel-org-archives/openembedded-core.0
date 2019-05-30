Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-it1-f182.google.com (mail-it1-f182.google.com
	[209.85.166.182])
	by mail.openembedded.org (Postfix) with ESMTP id D34BA7E427
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 12:44:52 +0000 (UTC)
Received: by mail-it1-f182.google.com with SMTP id e184so9119102ite.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 05:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=5cSGZRgVU6WG/9d1usGD5zYINts1GM4eOB9Fwz+Sgao=;
	b=VXnEKp2/h+vy72LmNmYngK2IKGgvegdfAmdVHGeTahAB9lECBqCl9CRl4YJYggo6af
	BFgfb1ppv6D6rPncoHGq9kEzjBSif7sSokstIktZcNBpYdY9XFE4f7bjbdYDw0SGFE2k
	H/KlpW1FGHUKi/LJyNeQRFu3Vnb3crFZqRiMz7uVIaMvIp2HUdbIoKSNB+JFHRvr5S1Q
	QMby8ujcpdKnyyXjBVQMlRmN0mvXuFXDUsoHOuDixFLxr/SAuhm6rmqcVMVYrWRoASI1
	teBHlG0SbFn6HvgDSCq2JE+D9dbqpUmAGeOw0iJe/Kc5RcT1T2bbGuIxqXtQUQ6XVLJs
	DNlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=5cSGZRgVU6WG/9d1usGD5zYINts1GM4eOB9Fwz+Sgao=;
	b=MGuMPtT3WjcTmdyi3J8wUayLlxfB53riaBuAuES+LGg63ngJCoPTlJl5ELpV/vwhVJ
	NnOWevoFvauaqiuidtibrMVismp0URpaxp+6lLbd+8nv6UqXjKu6bQz5LvQtGoauoUIG
	k8cvR+pL5kvkjI/+6wSdjxb2sMwG5yUViJRLaw5PF/GWV4C7hFcYszFnt46rUPnNfUuV
	egcY4VynezEk5pG1LF70k8hMo3LUH3S8XMJwOrAMRz41/m8MBVrVYL3/cW3SAOBdlPA/
	HJq+ZMC9QlNdxN+pbxry7Fyau8EaIT5a8i5DzLt6qVjLhEU/nuY7KEq2/6rKAFKI/DZr
	ov8A==
X-Gm-Message-State: APjAAAUU92pPkGT2Uq1nuaf4tNK08jS5Nfr9zxQcV0/74ffpUa536SJt
	xPoNzf80wOXJ/X0/YHaQuMsbG5hMXl0=
X-Google-Smtp-Source: APXvYqw/VImkvtsj2hoG0HcnaxBevZI7WCuQdxOjqVUvGG/Y/orPSZ6U7KlG8m/nyJbDFIi1rqlojg==
X-Received: by 2002:a02:b895:: with SMTP id p21mr2333051jam.80.1559220293813; 
	Thu, 30 May 2019 05:44:53 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208]) by smtp.gmail.com with ESMTPSA id
	s70sm1034266itb.16.2019.05.30.05.44.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 May 2019 05:44:53 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Thu, 30 May 2019 08:44:40 -0400
Message-Id: <895d9d6d6e611652f3e144561811868b1df15cf6.1559220004.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1559220004.git.bruce.ashfield@gmail.com>
References: <cover.1559220004.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/9] linux-yocto-dev: bump to v5.2-rc
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
X-List-Received-Date: Thu, 30 May 2019 12:44:53 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index ae8c343008..3a055c12ad 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name
 SRCREV_machine ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 SRCREV_meta ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 
-LINUX_VERSION ?= "5.0-rc+"
+LINUX_VERSION ?= "5.2-rc+"
 LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.19.1


