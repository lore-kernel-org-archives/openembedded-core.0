Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
	[209.85.166.52])
	by mail.openembedded.org (Postfix) with ESMTP id 594FF7E71A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2019 02:33:04 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id j6so29110633ioa.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Aug 2019 19:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7mg914VfqNfyw8wsiZnIgi6mVi9VoaQAFw0YYHNeADw=;
	b=NPj2j7AsWtMera2BsE/j7ctB1IPUhQO5DQzsN8q8cO/D3WPf5Rf1rUlqT6hK8cop3Y
	VDSUU5ujCR30A0xXGbH/D+9V6/ZaO/yyhk6vN/Feww1Qew2LlrX8YVAhvTfgCq6zwhgS
	vjazBM9rI4fic6XCq1y6O8lm8VUTe2VTasTz3Ymgx4YVJ1m/Ze6BZ/embS/oyK+/nYZ+
	TjnU8VtCZDBl59ZGgKBDn50dLjVRpWSEHUjdwccTUHphRpDJmUvW6sYjncGmJqqmPJhY
	cZ8EYyfB+nIHkqJMtrmWHWBmGmLfoFzs4FrfUvhrYZpiw5ov0KqC/IbeQiWDtYymD42l
	8PkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7mg914VfqNfyw8wsiZnIgi6mVi9VoaQAFw0YYHNeADw=;
	b=dD1CTTlZvfGjIhPf8t3iC71f6+FPmfpc9htO101wvN/LaSzfs+0CJjcJ0mkiNou4To
	by8XNIclW5IjaIN+Jj8/1rL9f8QdpowQwgzP4N9iMnGVNltAVo99j1Gs/EKeIesBM5le
	GT/8Tquj91PvSz/f6/bX4J2dUSzn6olMZRABpWsBCxdxyx3UdhEFe0E3rThvC2yJckN9
	esnIuJaybXL6OHoP6itmZtu07GP0kQZywWIJAjk4f5pjzGakrm1+WMZdDxWLjI1wmgit
	dDiFyJ30d13UoMwNp0QFEdXUew0ArDX2ucmwlP7CT++osTgHRigu1BrEIAZHqJ883Fsj
	6LAw==
X-Gm-Message-State: APjAAAULXNisAmbHaSOIQ1PBY2+Tu2ckXqBdp5y3Vfow3F2QEI29MUkU
	ZZ6HS1TpZDbUjIKsnEtvaQ7Tc0Fe/fc=
X-Google-Smtp-Source: APXvYqyjVi/Pa1O5uq2mgKT5YjmHE/w3DdlZ08kr8GHecmGKhfu+AygA1QGb4wT6Ak8g3hSSVxiMYQ==
X-Received: by 2002:a05:6638:191:: with SMTP id
	a17mr62079553jaq.101.1564713184974; 
	Thu, 01 Aug 2019 19:33:04 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208]) by smtp.gmail.com with ESMTPSA id
	j25sm97183553ioj.67.2019.08.01.19.33.03
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 01 Aug 2019 19:33:04 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Thu,  1 Aug 2019 22:33:02 -0400
Message-Id: <20190802023302.28370-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto-dev: bump to 5.3-rcX
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
X-List-Received-Date: Fri, 02 Aug 2019 02:33:04 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index 8c83620d39..96117ccf3f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name
 SRCREV_machine ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 SRCREV_meta ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 
-LINUX_VERSION ?= "5.2-rc+"
+LINUX_VERSION ?= "5.3-rc+"
 LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.19.1


