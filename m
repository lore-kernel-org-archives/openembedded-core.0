Return-Path: <andreas.kling@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1522D6FEFE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Sep 2017 09:04:04 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id e64so6578267wmi.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Sep 2017 02:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=yhwBchxQWmgb2QUX7MmwFrqqagBr6cgTMiJJvKedFVg=;
	b=lVW5IX5UClrWO8nf0gypOn+oXhvpV8ukONlWkMlkUMkLswiRj1nWDtaNchYiyo60Vo
	kjdBvHtvlEYiPsSMY5/XkR5v4JlymwHtzC7y2abpajmQVSngCPfGPxZu6lfKn9rU90OI
	/upGY/4JbWNAE5Jw3YSktmgtoM0aDC0U6jNrciAEpvJ+tVWK3crbI6Zey8DLPRnk9Jxz
	VPL62KZgsWNRzD8jvrwlTWAi3H1u1DSNmJFzYROr08tJfsfDY7XymV5lUjNRGfBqLLWe
	BquxX5td55PH24Ub02TKjchJHqru9XP0Zqr8tFqMJP66AFhBXTCcSvSdGcDmnjw3fv1W
	2vxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=yhwBchxQWmgb2QUX7MmwFrqqagBr6cgTMiJJvKedFVg=;
	b=GfYjX9pVHS6X8ydkJ5Fu4ApHgoHwOFjJDSA418X8dini2Bp2YlpM8pHdG2Vu3+8nuK
	GbKsFdkYwVig3rx0pe7I4jvhH09Hd3nlMyWEIZa9lqaNNAzzASKyCVMx0LjSyVcx1LuZ
	qk/1P3Y8QeaYobaFt4Weqxylw+lzAPmpLPinKjqNvhgf0IZ1Kzazc9Al37i+eGvHrj3y
	hOMpLkelr3OiCBPmcXJrY2L6lghnxguUCuESUHAl6kNaPiO6X39g66YjXTeD1oUNRcKn
	l6olpxVzcvtKtzzTTxB2mPPOJks1xp/Vi7VgNH1l4ptP8g+HHf/1TupuS59vp0SRpg9C
	LYGg==
X-Gm-Message-State: AHPjjUgIIDQE6jogsVsuvCXYM+AYYnIMJCQ00kNazPGi4TyYm+J7x6P+
	ZF2rwdLG/oWIK7VhQgubyfZlSQ==
X-Google-Smtp-Source: AOwi7QBPhcv0COaCQZ8UVV3RcHO9eEDsauIaHVSeR4Qao9lfKyJl8K7lQUxKzjbL21BxKaqaTo5sXw==
X-Received: by 10.80.145.107 with SMTP id f40mr8850980eda.235.1506330245789;
	Mon, 25 Sep 2017 02:04:05 -0700 (PDT)
Received: from nb-lx-hgc-001.peiker-cee.de
	(business-176-094-229-202.static.arcor-ip.net. [176.94.229.202])
	by smtp.gmail.com with ESMTPSA id
	r39sm5084319edr.95.2017.09.25.02.04.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Sep 2017 02:04:05 -0700 (PDT)
From: andreas.kling@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Sep 2017 11:01:30 +0200
Message-Id: <20170925090130.16408-1-andreas.kling@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [PATCH] bind: move libraries to own package
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
X-List-Received-Date: Mon, 25 Sep 2017 09:04:05 -0000

From: Andy Kling <andreas.kling@peiker-cee.de>

  this allows to get rid of a chunk of data for
  images only requiring dhcp-client.

  -4553  KiB  python3-codecs
  -3669  KiB  bind
  -2087  KiB  libpython3.5m1.0
  +2384  KiB  bind-libs
  -1343  KiB  python3-core
  -1173  KiB  python3-lang
  -1077  KiB  python3-io
  -507   KiB  openssl
  -422   KiB  python3-importlib
  -204   KiB  python3-re
  -145   KiB  python3-math
  -110   KiB  python3-crypt
  -42    KiB  python3-readline
  -5     KiB  python3-reprlib

Signed-off-by: Andy Kling <andreas.kling@peiker-cee.de>
---
 meta/recipes-connectivity/bind/bind_9.10.5-P3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-connectivity/bind/bind_9.10.5-P3.bb b/meta/recipes-connectivity/bind/bind_9.10.5-P3.bb
index b20a4aa396..289dc79733 100644
--- a/meta/recipes-connectivity/bind/bind_9.10.5-P3.bb
+++ b/meta/recipes-connectivity/bind/bind_9.10.5-P3.bb
@@ -67,6 +67,9 @@ FILES_${PN}-utils = "${bindir}/host ${bindir}/dig"
 FILES_${PN}-dev += "${bindir}/isc-config.h"
 FILES_${PN} += "${sbindir}/generate-rndc-key.sh ${PYTHON_SITEPACKAGES_DIR}"
 
+PACKAGE_BEFORE_PN += "${PN}-libs"
+FILES_${PN}-libs = "${libdir}/*.so*"
+
 do_install_prepend() {
 	# clean host path in isc-config.sh before the hardlink created
 	# by "make install":
-- 
2.14.1


