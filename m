Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3F2267D25F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 18:42:18 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id h5so15488621lfm.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 11:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=fYTK51CrVmih9YxGUknrRx6g0L0X1unYIOTlxyTaSjA=;
	b=oQ2OFdnAf+NRc0ktu+Wu1pNFm5AxTvYAgnRGGXJy97dgSM7EkK75T9UXIkqqbuH7sK
	OCgBKZUSp5OlTXiAFlXNInpmPyXVZ2LrDRmFxsaR8uA438DodhsAsbvwKd/jZbeh4z4k
	iYagn1HCz1E6jY5VehqcDmnNtivcEwhZEwQVU+ybH0DzVmxHqCvFxDdFeEsr5Ek3Ga9C
	DhV8clsDXyiHp9Khg8x3WdA/gGQurnpvq+5m8st4AD44iUlaxs94oyOcu5809L973gRz
	VzCP1pEajljPNz1bLhT5f4ncneYDXAdgwrxvpV15vMUULKd+LPlUfGwsbVwWu5GIMQdM
	BAKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=fYTK51CrVmih9YxGUknrRx6g0L0X1unYIOTlxyTaSjA=;
	b=VrfDZ0mD8JtPzIbROggU7FWStbwqFz27Gd1PsgmBzrisr45KxjyjhTZYo9F0JZF7BM
	F+9xjCnXxlpIS8dFOgEOwxxdx9k16RSTf75mqrAibuf+QYlE1s9vINPnw7HXUZrYj4MD
	13svbtc88fqrfs8Y1WoJhtpdsSmtNrcJME1QsOdsA/b8+7zjZlhQoORAEvx3k8E19a9N
	nqR4F3ddCYtFgRTp0X+t0hP0w6sGFtyuYmODPO+bvpx3UUXif0ST9MyTrLOAr8avsL4Q
	VdqdI+6qfGHmuac+6JiGFCNCtS5zCiy5zkxDwkdcL0Akiv+c8NlzpK/8J8D4zkgn27IC
	roJA==
X-Gm-Message-State: APjAAAVDPztwk8aWIIr6+xaUzTS02lGdCNILqpDfBevZv4KjkzlPPbl6
	pD0iXBeaGFEq/oF4Cju0TdONMTF6uYA=
X-Google-Smtp-Source: APXvYqyB8VIWu5EL03jOyIlAl2lctat6UERcEOXen+to/ZGMt2WfrrCcit/LNwGFGWQjUQCeT/YAig==
X-Received: by 2002:a19:ec01:: with SMTP id b1mr17846545lfa.128.1556131338647; 
	Wed, 24 Apr 2019 11:42:18 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id f4sm4145212ljg.37.2019.04.24.11.42.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Apr 2019 11:42:18 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Apr 2019 20:42:16 +0200
Message-Id: <20190424184216.16958-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] python3-pbr: update to 5.1.3
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
X-List-Received-Date: Wed, 24 Apr 2019 18:42:18 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-devtools/python/python3-pbr_5.1.2.bb | 5 -----
 meta/recipes-devtools/python/python3-pbr_5.1.3.bb | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-pbr_5.1.2.bb
 create mode 100644 meta/recipes-devtools/python/python3-pbr_5.1.3.bb

diff --git a/meta/recipes-devtools/python/python3-pbr_5.1.2.bb b/meta/recipes-devtools/python/python3-pbr_5.1.2.bb
deleted file mode 100644
index 7ba1d03535..0000000000
--- a/meta/recipes-devtools/python/python3-pbr_5.1.2.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-inherit setuptools3
-require python-pbr.inc
-SRC_URI[md5sum] = "bea55678345bd77b4ff5b2ebb729fd6d"
-SRC_URI[sha256sum] = "d717573351cfe09f49df61906cd272abaa759b3e91744396b804965ff7bff38b"
-
diff --git a/meta/recipes-devtools/python/python3-pbr_5.1.3.bb b/meta/recipes-devtools/python/python3-pbr_5.1.3.bb
new file mode 100644
index 0000000000..b8e2401c1c
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pbr_5.1.3.bb
@@ -0,0 +1,5 @@
+inherit setuptools3
+require python-pbr.inc
+
+SRC_URI[md5sum] = "08972dca5fd2a959f27842090973edd6"
+SRC_URI[sha256sum] = "8c361cc353d988e4f5b998555c88098b9d5964c2e11acf7b0d21925a66bb5824"
-- 
2.17.1


