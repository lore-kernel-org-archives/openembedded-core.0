Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5F2736C304
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Nov 2018 16:28:39 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id y3-v6so2506089wrh.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Nov 2018 08:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=yo07bmmYRV26kAsJV4GB5cjh7Anez+GWMJ96NnOvU6w=;
	b=DuQejYWyv5HRe+vVYNQj8jFG7dWxKfg68E37Xzy41ULYf8UPwdhzDcpT8988mDBz9l
	iHI2jBLKq7byMnuIGsqDnFDP8eR/6whQ/psn9ArCdQ1cEHDerkgk/h06tLik4rNu6e3B
	QLmN9PPEK7Sp33OPuGNawzmfFQKhf+9tjdxCkBFtM3B5HaUY8NQg6N1s52nHxRaoF8J4
	opeZ2FU43DH035c1nX+OxAGAzFKcX7lC9cp9Lsuea+YuMdk/xXBMQzAsvbJAgZcPvWgQ
	fbx6fYFuhHqQgZvNS8FaCsLW4N9kgX9g31dv9aT8B37D8sRNDqBusQnQKL2YgBaK10hF
	1L+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=yo07bmmYRV26kAsJV4GB5cjh7Anez+GWMJ96NnOvU6w=;
	b=ln353mCQTmIgPu37+NHU0//T3i5JWKz9J/m6U3F0nddSyPWnzhDvJJPFAghckytAT1
	RZoDXaD7l+X5L3Q5Vfbs6qSTFU+J/l1dbxkMoDdNI52Ap5iWMDPqYcKYC/jJWyYt6jfs
	aUPZf85XjMnKqk0CCl3Kjum/kyKPJVlubJZJ0jyaA3O+UacqMB3ZVfmBQKTb6zv7u6TT
	sES+iwJpc9OWkLWNcIXR2hztF5RtW9sVl6RZr3tf709wrvs0q7/TZHCduY5nBOpx0K4W
	m6Ehd/9338TpCaZmAUsQkNVeXeJxwlMTsDnK/9935zLDqbYgK660ck7H9UKI48uceUfO
	lZtg==
X-Gm-Message-State: AGRZ1gLFBiqPVRZ1CnY3agXbR6pToh7o/wTvHal8oKxOveE5OEdQTMDD
	x8IBP4crnW4WNfBInlxpi4mu/Aym0a0=
X-Google-Smtp-Source: AJdET5f5RF4woULzQKACUmlDZHWcfiJAYBuWMMK8WZ6rfINDvphmuCPKGqMt9KLg522D8yUtDST22A==
X-Received: by 2002:adf:f290:: with SMTP id
	k16-v6mr8783291wro.108.1541780919670; 
	Fri, 09 Nov 2018 08:28:39 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	v3-v6sm1315025wmf.2.2018.11.09.08.28.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Nov 2018 08:28:38 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Nov 2018 16:28:36 +0000
Message-Id: <20181109162836.12088-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] unzip: actually apply CVE-2018-18384
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
X-List-Received-Date: Fri, 09 Nov 2018 16:28:40 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/unzip/unzip_6.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extended/unzip/unzip_6.0.bb
index b9d87dd6396..daba7227223 100644
--- a/meta/recipes-extended/unzip/unzip_6.0.bb
+++ b/meta/recipes-extended/unzip/unzip_6.0.bb
@@ -21,6 +21,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/infozip/UnZip%206.x%20%28latest%29/UnZip%206.0/
 	file://19-cve-2016-9844-zipinfo-buffer-overflow.patch \
 	file://symlink.patch \
 	file://0001-unzip-fix-CVE-2018-1000035.patch \
+	file://CVE-2018-18384.patch \
 "
 UPSTREAM_VERSION_UNKNOWN = "1"
 
-- 
2.11.0


