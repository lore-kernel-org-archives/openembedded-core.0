Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web10.11254.1599130492820216794
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Sep 2020 03:54:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=yIsTSPRu;
 spf=pass (domain: burtonini.com, ip: 209.85.128.65, mailfrom: ross@burtonini.com)
Received: by mail-wm1-f65.google.com with SMTP id w2so2416388wmi.1
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2020 03:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WGM6NYm8/HElAMxhWYl867zF1LNQVY8TjqUX+++t25g=;
        b=yIsTSPRuNoiXXBIF64xtX7j8IT56VMyA0Qn1FS65+HRz+xOUOzEZAGKCJhJakn6P/1
         Vnm+7ePEAUx0Fp1kBuvbULShjzxh3RJfnzghnKMc7+SEsnWDK0yklR4W1zMguXWT5y7D
         seia4qCGGXrU8gXFvl4XxP5g5q5nAk208SkypBtMVXwFp71r8ODmnmxOLf7yLePgr3o/
         1Iv14Re5mywG1LkQ/NbSFgSwPspMznnop/MWKsyQYz1C59P96ByszdG7CEFrSUnN2if1
         ol1SUpKhbE6PZ6WW3E40wAlXhb8smAtyGHkboZSxCKGS1QFko1VKWh8TDEEsErswLAt2
         81/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WGM6NYm8/HElAMxhWYl867zF1LNQVY8TjqUX+++t25g=;
        b=uRV8OO0D5ldOI7dEQOJQ/Iv/tg/Ccea/m61zv4DivdJz2qNxW0SKbadwFff48pjhv+
         e/AJecbDPF9rSHoAmv5ImAVxnAxwc8uBKeDvws0k06YZmwHa3irRHQ7M8nq+9iZiDVvv
         vcHvfmoomiIr3ISiSm6ZefmgZP1N2bcJTgqSb45k3/d+Z8ztNYcEwVNuatjKBokOtkDL
         EVcqacUwylXaXi2J1RMWxkbPRfoTmikh1NJWwdWVw2flJNZ4e4HoGCvXpprM10C4rwR+
         qzQ/7PyRrM6WJ26pVrulE7dH5duO/1VdhIAk2+wRhmAiOcKGtF4Y8i8cBdCpWV7Pr8bm
         RL0w==
X-Gm-Message-State: AOAM531l/F5rj5ZRmOYWBUXl8ChTh510SrOudtccOkjtsM+hV0rhrkPX
	gE40p9uh1zzUebQiEXbSe2EzijyYUmsYdH/h
X-Google-Smtp-Source: ABdhPJyL8HKgCcM+bACAAp0kPWA2bH/jxONRtHTL3kiL8alo2EwSY7/Jtl6pR901EG/1m7bTbZSvZA==
X-Received: by 2002:a1c:2b04:: with SMTP id r4mr1779142wmr.76.1599130490876;
        Thu, 03 Sep 2020 03:54:50 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from localhost.localdomain (35.106.2.81.in-addr.arpa. [81.2.106.35])
        by smtp.gmail.com with ESMTPSA id p9sm3566012wma.42.2020.09.03.03.54.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2020 03:54:50 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
X-Google-Original-From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] debianutils: change SRC_URI to use snapshot.debian.org
Date: Thu,  3 Sep 2020 11:54:48 +0100
Message-Id: <20200903105448.4736-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The primary Debian archive only contains tarballs which are currently
shipped in a release, so it's easy for a tarball we need to disappear.
Instead, point at snapshot.debian.org to ensure the link remains valid.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/debianutils/debianutils_4.11.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/debianutils/debianutils_4.11.1.bb b/meta/recipes-support/debianutils/debianutils_4.11.1.bb
index 71fc99e29b..ef7aa50408 100644
--- a/meta/recipes-support/debianutils/debianutils_4.11.1.bb
+++ b/meta/recipes-support/debianutils/debianutils_4.11.1.bb
@@ -3,7 +3,7 @@ SECTION = "base"
 LICENSE = "GPLv2 & SMAIL_GPL"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=9b912cd0cc654134c0ef3424a0705b94"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/d/${BPN}/${BPN}_${PV}.tar.xz"
+SRC_URI = "http://snapshot.debian.org/archive/debian/20200525T145753Z/pool/main/d/${BPN}/${BPN}_${PV}.tar.xz"
 # the package is taken from snapshots.debian.org; that source is static and goes stale
 # so we check the latest upstream from a directory that does get updated
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/d/${BPN}/"
-- 
2.25.1

