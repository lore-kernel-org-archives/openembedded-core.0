Return-Path: <oystwa@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id 452836FF0E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Oct 2017 12:00:17 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id g70so1296473lfl.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Oct 2017 05:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=vBpWvnlIO2k0gYZeZ+uIAMwOhWSqn7J9uDgyNFA9Ld8=;
	b=S3wDAHjgTktYkHfZ+e5tet0YHU9DEMQFKdqChXFfuW7q3eFjxo/BcV2n1r6nW8u3x+
	aW/aHZZ7MvlQAlhCAjkbJBK37j9gWXcOc5l8hflEz3k4yPnM6gV1JhAxv6y5kn+Mg+VW
	JK1P3XUMFKiQdnzjV3S2DstUdq9zyePALe+vAmZ1Inch+w6Vcpd0XPTeg1G6OMUuA9Mo
	rCwa84Kqo1jxOfUrk+lcUIavht1zlDMyecEK0QBxFcN5pvVLvMSDsZQVDFpW/wc7p5mo
	3Hvd4Cg6oSzd3NstsU10rWvrvoTC2p+4spo4p8aWDGTMJtWO46PxcV3siPuHr2STu2QM
	hMBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=vBpWvnlIO2k0gYZeZ+uIAMwOhWSqn7J9uDgyNFA9Ld8=;
	b=ZJf1QG1GCe7UCeILeUNg2GC1q6tj4bF9LdUyKe/6XQrQomn4Y2zc7LDHab7I5xmVJE
	RV12f4gRNVTqUSn8IM/awmevGxD61WHWndrxQ0BCwQhIU8BHLb/kkxTmRZJHxxMaDNve
	ngYS91KvBzPzlhwWfynjsjf6Jr0dRpJWTtoWC4Go7yz0IAjx52P0svhDf7hPEx5BCvmH
	sdILmduxedvcH248R+mXw27Ty0TI4c+T+CviFRqhXezvvR4ps8DxpGSizjLjG4cjUdDe
	B5TVLJlDrDY1VG+12ipoX48BArBe5T8Px1Yg7Ycvk6mJPq5gf8Yf6L2NjVsEiS2XyDmD
	NV8g==
X-Gm-Message-State: AMCzsaV3c0po/BfKlY69JOu1U9m1QgZkIL0JdXDSU9IajyfPxxi+7Tg3
	xdr4AGuQl6IISw25o5UoDPBs7Q==
X-Google-Smtp-Source: AOwi7QDBlQZCpeVsrIE09Ogac8Kg9uftUC6moyz2IpRWZKL2goMHFkIiuhcsITfk794NwtnNykAiDA==
X-Received: by 10.46.70.18 with SMTP id t18mr6131963lja.31.1507636817699;
	Tue, 10 Oct 2017 05:00:17 -0700 (PDT)
Received: from localhost.localdomain (114.138.16.62.customer.cdi.no.
	[62.16.138.114]) by smtp.gmail.com with ESMTPSA id
	r101sm279023lfi.17.2017.10.10.05.00.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Oct 2017 05:00:16 -0700 (PDT)
From: =?UTF-8?q?=C3=98ystein=20Walle?= <oystwa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Oct 2017 14:00:12 +0200
Message-Id: <20171010120012.20163-1-oystwa@gmail.com>
X-Mailer: git-send-email 2.11.0.485.g4e59582
MIME-Version: 1.0
Cc: =?UTF-8?q?=C3=98ystein=20Walle?= <ow@datarespons.no>
Subject: [PATCH] cmake: fix typo in toolchain file
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
X-List-Received-Date: Tue, 10 Oct 2017 12:00:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Øystein Walle <ow@datarespons.no>

Signed-off-by: Øystein Walle <ow@datarespons.no>
---
 meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake b/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
index 6518408c70..dc8477ea34 100644
--- a/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
+++ b/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
@@ -1,7 +1,7 @@
 set( CMAKE_SYSTEM_NAME Linux )
 set( CMAKE_C_FLAGS $ENV{CFLAGS} CACHE STRING "" FORCE )
 set( CMAKE_CXX_FLAGS $ENV{CXXFLAGS}  CACHE STRING "" FORCE )
-set( CMAKE ASM_FLAGS ${CMAKE_C_FLAGS} CACHE STRING "" FORCE )
+set( CMAKE_ASM_FLAGS ${CMAKE_C_FLAGS} CACHE STRING "" FORCE )
 set( CMAKE_LDFLAGS_FLAGS ${CMAKE_CXX_FLAGS} CACHE STRING "" FORCE )
 
 set( CMAKE_FIND_ROOT_PATH $ENV{OECORE_TARGET_SYSROOT} $ENV{OECORE_NATIVE_SYSROOT} )
-- 
2.14.2


