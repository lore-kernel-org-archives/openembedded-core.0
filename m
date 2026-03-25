Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BE08103A987
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 02:19:19 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13713.1774405156603965418
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 19:19:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=aMQF+EIp;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8296d553142so1043786b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 19:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774405156; x=1775009956; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N3V1eJA4WYSHqk7RUT1eI4AboXDYR5JRx/t93ubQ2j0=;
        b=aMQF+EIp0tjUmc/uIXKTOLakEkKVHiI+5FFGo8eSSZFACDiToBqBNtpDY6oepdHDhv
         CVO88yj1hfYua0YOKfRZ39z6AbZSlyS5GKzcCi0uDN/YIlLsQ7lMS/XbdBZkf5A8zG+K
         YQRD/nTzrShsH28dDsWnpllHEwEjzgv9c0mTCCWy200fIL24dSpPp5zbIUMo8uVEHdHu
         E9IGNrlRq1iCJ1zDI/ZH7iy/Zl4CPRclSHHX3eiWhsIiY/U0pLvZsbzp8Dp5Poh4UdrW
         oaU6tClKUdrbsGU2xLyDLQiZG860TwUcVqnnBmRe3gVSOafJEDfG/F9kh9jhfBscw+qI
         aAGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774405156; x=1775009956;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N3V1eJA4WYSHqk7RUT1eI4AboXDYR5JRx/t93ubQ2j0=;
        b=nVRxp6WOxXaZObPukMEDnaQOw1bVhDp2CHZhoVbweVN9JjFxF9V9y76kPJoqijT6wz
         kRnhsxC6ZNdN6Ja9vfk6k3Nb963bvuNDzFhop1WFbdVZD0dXDaMeehd3RQnNInx/atqq
         VMCiGgBZMKyxyuZwLhPQhu3TCDnC3VBuCMeIdQR3e3NgKCF6ikj+MbaZadEVtxIxuD8T
         R0sxZjAimIoBb1ie0rmNhODJwYeWpHpL254lMubC4By+/9437P51TdUNfWkRJAnAQdhM
         yvMy7Ph2CzAia5abPw5nH+uRWPhE2skL1BWG9QFHwwNK0/yh/GRIKrIeQh+X3Y8PcunH
         x0jQ==
X-Gm-Message-State: AOJu0YxBq3OdtG1GxZYM/T4ZvulkcK3mH0yHRvAR97P357fgf/ZfSJm9
	5Y0mWocqLGgAT0Z/A9jT6/Uz4DdXkOpmt9MJlblI8I1bE5LiasH2eFSjVTxkqF7J
X-Gm-Gg: ATEYQzy/SFiPqxkswCitbkoeb7/i5Ew7n44RzW0tKrgCB227Ec7DO5me8oN87VQwc/m
	nPZiWJmGdOsU5oOL3y/wC+FbcQDZY66Eku9niMwlV75/sTvd8j38ttiXd0AOu2yXeK56RnELJVD
	o4kCFNsoaSG29JxWJqW1MtPjkouHcIAKIdLvK3GvY7OD5WkThjzKcjKx+PlqOcMxaMg/8LkJhgK
	XqtcjafswLwlYg1gisCce6k1oOjuV6EJSxIYI1YOjaqwDp7YzOldKWpLeoW+xEBJdBESHDXlucu
	1Pa2TPLC7bPrCN1GYK3p3ccWVa88Z0gUGJoMoI1mp+1YjlFDViDHqYrQN+OCPPuY7/EAEp1Ielb
	MRGZmj1t7PmIy0N+5QUn/kSFxZNQIgpAGm8tTCEAYlv3ezBluIwAEwKo/IarivIt7h7t4NcgNNA
	NWPyYkKe6N1LpgC2T4P9z3Z7ZVz1WdRGfDQmo=
X-Received: by 2002:a05:6a00:3688:b0:823:3078:f684 with SMTP id d2e1a72fcca58-82c6df639c7mr1551398b3a.32.1774405155516;
        Tue, 24 Mar 2026 19:19:15 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0409f409sm13581235b3a.31.2026.03.24.19.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 19:19:15 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 01/12] ccache: upgrade 4.12.2 -> 4.12.3
Date: Wed, 25 Mar 2026 15:18:45 +1300
Message-ID: <20260325021856.4053666-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 02:19:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233839

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2026

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 76a5917034080a87c02f79bb925edf0746bf8baf)

Bug fix release:
https://ccache.dev/releasenotes.html#_ccache_4_12_3

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../ccache/{ccache_4.12.2.bb => ccache_4.12.3.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/ccache/{ccache_4.12.2.bb => ccache_4.12.3.bb} (88%)

diff --git a/meta/recipes-devtools/ccache/ccache_4.12.2.bb b/meta/recipes-devtools/ccache/ccache_4.12.3.bb
similarity index 88%
rename from meta/recipes-devtools/ccache/ccache_4.12.2.bb
rename to meta/recipes-devtools/ccache/ccache_4.12.3.bb
index 28f36e5ed7..0cd9a43a1b 100644
--- a/meta/recipes-devtools/ccache/ccache_4.12.2.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.12.3.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://ccache.samba.org"
 SECTION = "devel"
 
 LICENSE = "GPL-3.0-or-later & MIT & BSL-1.0 & ISC"
-LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=5633f18ca110f0d4cb907eba07c920ef \
+LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=22ef4326c8a14ac937fc2b76ef0fd233 \
                     file://src/third_party/cpp-httplib/httplib.h;endline=6;md5=663aca6f84e7d67ade228aad32afc0ea \
                     file://src/third_party/nonstd-span/nonstd/span.hpp;endline=9;md5=b4af92a7f068b38c5b3410dceb30c186 \
                     file://src/third_party/win32-compat/win32/mktemp.c;endline=17;md5=d287e9c1f1cd2bb2bd164490e1cf449a \
@@ -17,7 +17,7 @@ DEPENDS = "zstd fmt xxhash"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "2a087efb66b62d4c66d4eb276748bbfa797ff3bde20adf44c53e5a8b9f3679af"
+SRC_URI[sha256sum] = "d683d5964a395f00c1c812ea1d1d523179f1097cbff7e7e54e714fa3f99711b1"
 
 inherit cmake github-releases
 

