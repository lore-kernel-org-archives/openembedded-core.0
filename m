Return-Path: <wesley.lindauer@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4D53C7ED64
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 19:44:48 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id w16so3620171pfn.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 12:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=7NWWlLw41gMUCfjapu8Px+t5zldTNGcUpeWlqNh77zc=;
	b=WHwH2MxOxfsBwDhddQXlaCn7TNLRkSiI0WkeYQH2mCJN39GTD2NtGQq5K5wPwCN25f
	2gR2wyTi0+1JTjY0bV6yOqPh9OV6FzWm+RMGtTID0/O6MVx00JRzrFQen0PxPJRMn1BA
	nUHuZWRH+z17CUVKM6hkvIClcE0LFKuSqgKg3W1oKAr+Zt2C4udBe82fXAP/JkdYsdxd
	6F7v78VyHTCbDoaaT3gHPIhX61ML6cyj7C5x5xxBFHOJzVMj2AsKmlpkibj/wneLCPyF
	1kzsTkDoq0svnta0dlg2UQKdRxHDuMWxxNQRYVRlpgg/IzRVz6PIACPE6QC4z+i8UUev
	bFWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7NWWlLw41gMUCfjapu8Px+t5zldTNGcUpeWlqNh77zc=;
	b=FoK3WOHOJ/XFPIi0P6XXchU9u671I7rxpLwUT9yyo6Y15dsF8YVV6WKrAzzpKGyqx8
	m5unHlyEiFq8ZPOGt4sneMmfi/99E0CmbyI8Z9ciMAVy/KRBirCt/QhVJNSGIVlOhSOW
	DAjkTFTfDo399VazRiuNjimD0S3C3n4gld9HL8pPM4Z6+nyPwcU8t7KemP4vISBpJ40K
	of3RVNiE0/KB6IS0HBESENhl1pWb44Kz3cpn4j8S/r94fAgR0hMDVh4U/TPXdQCMHcpx
	MLIPxDODtFOUNUz7mt4WcfT5p7EFzo0apMFGI+UguEmLwGCvfV2cQy/MQcAWiBTCNmJz
	/fBg==
X-Gm-Message-State: APjAAAXjjicQwr5HatTDcglc7dhqzM3f2HUO5iAXG6wL+2mYWc60bhf1
	M6sYVA1gEBjYrAPEVhv4LHjfLMnw
X-Google-Smtp-Source: APXvYqxJAjyotaXBEoXEtQ0T6Ucutxaz30rjXKVM6OQft/0/lkCk8ddGQVO/pSQgfaI8lck25/4SMw==
X-Received: by 2002:a63:ec48:: with SMTP id r8mr8737492pgj.387.1565984689163; 
	Fri, 16 Aug 2019 12:44:49 -0700 (PDT)
Received: from camaro.lpdev.prtdev.lexmark.com ([192.146.101.90])
	by smtp.gmail.com with ESMTPSA id
	o35sm5537333pgm.29.2019.08.16.12.44.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 16 Aug 2019 12:44:45 -0700 (PDT)
From: Wes Lindauer <wesley.lindauer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Aug 2019 15:44:00 -0400
Message-Id: <20190816194405.12751-1-wesley.lindauer@gmail.com>
X-Mailer: git-send-email 2.14.5
Subject: [PATCH 1/6] iw: Fix license field to BSD-2-Clause
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
X-List-Received-Date: Fri, 16 Aug 2019 19:44:48 -0000

Using just "BSD" license implies BSD-3-Clause and this recipe appears to
be closer to a BSD-2-Clause.
---
 meta/recipes-connectivity/iw/iw_5.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/iw/iw_5.0.1.bb b/meta/recipes-connectivity/iw/iw_5.0.1.bb
index e127963513..87b21e668d 100644
--- a/meta/recipes-connectivity/iw/iw_5.0.1.bb
+++ b/meta/recipes-connectivity/iw/iw_5.0.1.bb
@@ -4,7 +4,7 @@ wireless devices. It supports almost all new drivers that have been added \
 to the kernel recently. "
 HOMEPAGE = "http://wireless.kernel.org/en/users/Documentation/iw"
 SECTION = "base"
-LICENSE = "BSD"
+LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=878618a5c4af25e9b93ef0be1a93f774"
 
 DEPENDS = "libnl"
-- 
2.14.5


