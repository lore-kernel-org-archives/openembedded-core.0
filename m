Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f44.google.com (mail-pg0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 3257D74DE8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2018 20:37:45 +0000 (UTC)
Received: by mail-pg0-f44.google.com with SMTP id n1-v6so544998pgs.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2018 13:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4iddE+2/DJllB4PVh+zrCYQ25B5IlF0arDGqDOM0d8Y=;
	b=bb3GntsxrMt4GyiiE2XMmaMP9Vt/C8wrMWvbcTUMMityJo1AywEUiaiWMW1ynoITNw
	0ZyJdYf4OdnbqnYhqNVQJn2kLop7JDX80b+kY5T4tz21ek4b2NSbsddU6cXCAoQqqAHE
	ZtH4HCrKoyguj/2UMS45O/ejL+eDPI/feGmH4uiQ1AYj/2Qa3YT0N/nYa+5NKg9Lzthr
	Gh8vFOgF7pk/U95colbxCY8VMOMLmT3bHAVvWDoZFv3ieY8OqpHDYZKoy3/ZwCTDBpq4
	epx7iJO5y5dyzqeP425AAWWLe4fkXchRuGMmoGauW27iJJjGWtlK6nd4smaMPJit+qR2
	Du+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=4iddE+2/DJllB4PVh+zrCYQ25B5IlF0arDGqDOM0d8Y=;
	b=eHumVayK8i8Y67xUDVQJvkhkJIdQ2gmgUgV3rg0S4sUCuG3JrdaiLi4cVkJwM16rHd
	y0T8K7VBhsGuwo1taLPQrKVig+5cbzcQwXXreDYi3nnlhQ8v4IrP48kQYDFj4Jzb2GkK
	AIW8rYIfWhmZ4RXdsDbUidvwzmpQuBxQjApG5HuBBetcvnbDEJd12UZLMntK3jarDEvP
	GsNijzO6AlAdjwjFhF6tTH7z8NzUP9UPtBC/6hO+ZPhrUG5gQW3LKDZhp1qUdTe/5802
	vOi1F6W68FJPvQ2OUoQDYn+E1th+HMQkl8ui3hngULOu3euuRHg4bnT5SCele5LEyOas
	o4KA==
X-Gm-Message-State: ALKqPwfiorb2KeR0OZ7n//cLW0Pnc8mUprd88SZ8aSvOLO9zklEtBesP
	vfeGnBQqWDoaMeaiitsWwRtB0w==
X-Google-Smtp-Source: AB8JxZrIHTiNA56lMMy39SdSXZ8Ibh0GJzee+MI1Sd0896ouoOjX/S5QkVUom8DbKVLQZ2pH/2qLfQ==
X-Received: by 2002:a62:5959:: with SMTP id
	n86-v6mr16648400pfb.217.1526416666733; 
	Tue, 15 May 2018 13:37:46 -0700 (PDT)
Received: from localhost.localdomain ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	a3-v6sm818566pgw.14.2018.05.15.13.37.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 15 May 2018 13:37:46 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 May 2018 13:37:25 -0700
Message-Id: <1526416645-4896-4-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1526416645-4896-1-git-send-email-armccurdy@gmail.com>
References: <1526416645-4896-1-git-send-email-armccurdy@gmail.com>
Subject: [morty][PATCH 3/3] nativesdk-packagegroup-sdk-host.bb: add cmake
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
X-List-Received-Date: Tue, 15 May 2018 20:37:46 -0000

From: brian avery <brian.avery@intel.com>

The Eclipse plugin uses cmake from the SDK and currently has issues
because cmake is not installed as a host tool.  This patch adds cmake as
a host tool for the sdk/esdk.

Signed-off-by: brian avery <brian.avery@intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry picked from commit b1ccab95464855877558972c4523956be32dee36)
Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
index 2c2abed..832d7c7 100644
--- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
+++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
@@ -23,6 +23,7 @@ RDEPENDS_${PN} = "\
     nativesdk-shadow \
     nativesdk-makedevs \
     nativesdk-smartpm \
+    nativesdk-cmake \
     nativesdk-postinst-intercept \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'nativesdk-wayland', '', d)} \
     "
-- 
1.9.1


