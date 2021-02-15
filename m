Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web08.32102.1613399905244486641
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Feb 2021 06:38:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=lhl9j/de;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.179, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f179.google.com with SMTP id h17so4029864oih.5
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Feb 2021 06:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=g+rs1HBX2BJleP27y0vHMSUSv9pfyCvEY4qXSWbiQKs=;
        b=lhl9j/deuo7EZ0+/ZjF2JL0dErXcdqP2ntFNurW43KiuJKS1Y8xYrfByGmxo0c/TTT
         /c5DzlIoCT55k0HqSYY8h8OVqmoSaU6tM5jaGri1YjTRGCeJPuPlc7lbk5SeCTLbKYGO
         uQnJDfGitI6IUWTVpJ+YyPD5eym9pFwTGbGZZgUnY4h4kl88jAEzwddH+reMj6Ls6YIh
         dJayLPnth5MWnu48ARVHb5muuIFH7QdcF5yZlVBoBTtCY3OzRLycJT1AZFxunnY50O1M
         xwSqNOsuDdlO9/xAeteIIW/C6IzXL/LbB1DWaGc57h/4KjbswJBb6WwIhy3+NXDYvqVf
         66jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g+rs1HBX2BJleP27y0vHMSUSv9pfyCvEY4qXSWbiQKs=;
        b=dXxH3yajp8S8Perh5fYT6tbCDZ/Uenrmt+Q67mdNTejiz1iRMp2u5shRfBg2+5Rw/M
         Bl2+bpA0aZE/ktEpl8gE9zQwVQCnjyVWtfjxXO2pYbP/FGq5DbEHgNBcIvH7pHk9d57h
         Jrkw5Z3VC5O6GqXomCV6KPO2ihqX9x+9x/nNQMVzMJaB9YaEYe7Xv9an3PVndZBG/LRn
         N72rhaxkc5XUjwgLv7fQyaz+/GnMDJhFjYoNEILOPbBvgFxPtYEI41ZhkSM7WWEy0dxb
         6MB5Y+Z/rPMl82xlWEX3w6WfBt+109vpN/aQqIRbCkW2krAa7oPa1Vki8+tFUYfYTJrH
         3F4A==
X-Gm-Message-State: AOAM532mZzokLf5jPpIQ8V4a4Mae40W5lTnbcI4jdciyhiJdD1Uxcgx9
	s9OmLgweE0IDV8VN6Nu+tMcAxUxdKok29mLT
X-Google-Smtp-Source: ABdhPJyNumBLSU9ocARQZkK8NIvYZo5k6Tzt5UoW/dnh1w9KPDP1KyIhNAeO7H+zgP1Gn5bH4MUing==
X-Received: by 2002:aca:307:: with SMTP id 7mr8410886oid.174.1613399904222;
        Mon, 15 Feb 2021 06:38:24 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id f1sm2714068otq.10.2021.02.15.06.38.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 06:38:23 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/17] libgcrypt: Whitelisted CVEs
Date: Mon, 15 Feb 2021 04:37:18 -1000
Message-Id: <2ebd235bc86032e388fb7e565834f3200e09d081.1613399659.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1613399659.git.steve@sakoman.com>
References: <cover.1613399659.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: saloni <saloni.jain@kpit.com>

Whitelisted below CVEs:

1. CVE-2018-12433
Link: https://security-tracker.debian.org/tracker/CVE-2018-12433
Link: https://nvd.nist.gov/vuln/detail/CVE-2018-12433
CVE-2018-12433 is marked disputed and ignored by NVD as it does
not impact crypt libraries for any distros and hence, can be safely
marked whitelisted.

2. CVE-2018-12438
Link: https://security-tracker.debian.org/tracker/CVE-2018-12438
Link: https://ubuntu.com/security/CVE-2018-12438
CVE-2018-12438 was reported for affecting openjdk crypt libraries
but there are no details available on which openjdk versions are
affected and does not directly affect libgcrypt or any specific
yocto distributions, hence, can be whitelisted.

Signed-off-by: Saloni Jain <Saloni.Jain@kpit.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2943efe3f56d394308f9364b439c25f6a7613288)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb
index 4e0eb0a169..9fd3b7c8c9 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb
@@ -29,6 +29,9 @@ SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "348cc4601ca34307fc6cd6c945467743"
 SRC_URI[sha256sum] = "3b4a2a94cb637eff5bdebbcaf46f4d95c4f25206f459809339cdada0eb577ac3"
 
+# Below whitelisted CVEs are disputed and not affecting crypto libraries for any distro.
+CVE_CHECK_WHITELIST += "CVE-2018-12433 CVE-2018-12438"
+
 BINCONFIG = "${bindir}/libgcrypt-config"
 
 inherit autotools texinfo binconfig-disabled pkgconfig
-- 
2.25.1

