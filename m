Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
	[209.85.208.44])
	by mail.openembedded.org (Postfix) with ESMTP id 467476D4C6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 14:59:04 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id d46so9666997eda.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 07:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=hFsZN0YjU/AwuqHtXZLg8sZhlu/xgmzqTDEfacrvXW4=;
	b=QoiqRDp6rSb1d2IJQIYqEMwwb+0JWO1E7jb7T/V517PW0/oxZ7W0fBqOiApUiUfaEf
	c6CGLFOMdDiJIztQVP2Ld/1CPMOHDZU88Y2nvZVZtPs/9Ji06SgayCpVTgK9uYnJp2co
	XFVa0oDT5e0WPypWacMe92DbhWqsZEgLqqcwwPBTJsHD9eky2VEfaMkiEuPVCA+pmp+O
	Y39wEUjgfK1IbpB2ljSOcCQXxIvJHinw56nHnKtngUFDdZnb0DXEI7nzRhdMwRdEH/4k
	OT+qi2CCaXZoYoaQDHH4rcsacdGrF7ZGjFmksEIJXSPqaSUYAVAtnIfCv7WkY4IQcBT9
	ZjfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=hFsZN0YjU/AwuqHtXZLg8sZhlu/xgmzqTDEfacrvXW4=;
	b=YOyTtJ//c/qvdAO6zVhTFvZjfg3NFLQUoTvbPuiArGWJoJSo7SxzXghvtDxemL9JHx
	V9nttxHvYz4u6JbDwffEzQjob9sxx/xunwDvyy4O4MyWCXiRrjvEHDNnzgj36Iv2v/SL
	NttzsRcFgIcptl8e14bsZkZUE99FINiDMMGoy+pFNLpVFj+aH581mV5MFBiKf8HNpoAx
	fnm8/ZigVEZ0i01yhJTUpB2TSxv1zMVJnHxKBZj8d44FjfkaWB78iOZGZkONnhl5nJaH
	ICPvs9x3kTgsTmoXn/bIcwM+k1EaWuaYo1YcrMFIzauEe/wOuFrkPKc9RRT0UZqCxT1R
	+IAg==
X-Gm-Message-State: APjAAAXaPwmQiB0dERxJhsu4W56EOiJsa1842hi6+eiIoMQWiwt8EMfw
	vL0vZLSTtC7zBVLmpGR81GqnSZZhJGc=
X-Google-Smtp-Source: APXvYqzlcvDoRPSUiwugz5ZaCxR964wYLZb+IGMtIFbzcoyCeTPD8rWJ7/nLdVYmzMNqKMckxiXCsQ==
X-Received: by 2002:a17:906:1851:: with SMTP id
	w17mr9928234eje.242.1555945144736; 
	Mon, 22 Apr 2019 07:59:04 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	a14sm2212192edc.61.2019.04.22.07.59.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Apr 2019 07:59:04 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Apr 2019 16:59:01 +0200
Message-Id: <20190422145901.24657-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] libcap: update to 2.27
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
X-List-Received-Date: Mon, 22 Apr 2019 14:59:04 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../recipes-support/libcap/{libcap_2.26.bb => libcap_2.27.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libcap/{libcap_2.26.bb => libcap_2.27.bb} (93%)

diff --git a/meta/recipes-support/libcap/libcap_2.26.bb b/meta/recipes-support/libcap/libcap_2.27.bb
similarity index 93%
rename from meta/recipes-support/libcap/libcap_2.26.bb
rename to meta/recipes-support/libcap/libcap_2.27.bb
index 14841de4a7..4f3bac8490 100644
--- a/meta/recipes-support/libcap/libcap_2.26.bb
+++ b/meta/recipes-support/libcap/libcap_2.27.bb
@@ -10,8 +10,8 @@ DEPENDS = "hostperl-runtime-native gperf-native"
 SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${PV}.tar.xz \
            file://0001-ensure-the-XATTR_NAME_CAPS-is-defined-when-it-is-use.patch \
            "
-SRC_URI[md5sum] = "968ac4d42a1a71754313527be2ab5df3"
-SRC_URI[sha256sum] = "b630b7c484271b3ba867680d6a14b10a86cfa67247a14631b14c06731d5a458b"
+SRC_URI[md5sum] = "2e8f9fab32eb5ccb37969fe317fd17aa"
+SRC_URI[sha256sum] = "dac1792d0118bee6aae6ba7fb93ff1602c6a9bda812fd63916eee1435b9c486a"
 
 inherit lib_package
 
-- 
2.17.1


