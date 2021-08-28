Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
 by mx.groups.io with SMTP id smtpd.web10.174.1630174346420830636
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Aug 2021 11:12:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=KSyuw6fx;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.52, mailfrom: steve@sakoman.com)
Received: by mail-io1-f52.google.com with SMTP id g9so13524119ioq.11
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Aug 2021 11:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=MhER3FnkG+TN0uKn9WyWobvy/qkuoDpPElzF1Ro7Er8=;
        b=KSyuw6fxvGR5oGetKNsOcZiSowJC+r+2Kxs6cc5hqzpKRNwPObLfSWb5IF7KK6G6bX
         4g7oLzE4fSO+5bDKDxovshAC7ziGWiO4iGNLoD2ejmFiCijZC4hWT1ktzGsmyffzPldU
         MjRwFIgvhW4Ta+eh4SYv3YXRlqtxJoVLmeh9ukyqq4tXLA1KeZRXF5Zqs44QEKoQfh1U
         h+JzxCjn/mxtu889SzilJbiWoSwxmQBgJRpSd3+TzchSfC8i+nFgKmsJs8O7Ov7kYVI+
         eKfkLV6YDpjvuwOKYAz9tQiM9fo9BOAV1MJL5la7Mz3ais5oDuBrtcF82ny/hqbecIo0
         7GeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MhER3FnkG+TN0uKn9WyWobvy/qkuoDpPElzF1Ro7Er8=;
        b=qokhRNC7DDp2kHPTZxOBm3ZxqdRSj3mU50Kpw+NNNL/4sGZuiuA3Q9zuMgDyVbV+gA
         jHiV0Cg0KrEZtY4gF47KtGOHAzpngj3RYup1D7JiVU/8sLpbR6uORdI0Y2/aTmyTgt1j
         qOn/FyT0slryBd0Tz+DmcCdzruITM3+bHKLYt4UYS50wbioc730KW3JledZBs+DuH2FO
         rmklDw+JB4w+7LnPFYu1VTix6/mOdu0x5Sg3OahQFgN6U1SJL3L8YStouf4hRwZ787fb
         /Zdw/i+ytcx398kh/la7PND8GCX2tp3sArI6i2GenuzBjmQPo3YXKJBNCJk6qMSS/DbP
         pt6A==
X-Gm-Message-State: AOAM530AkhAHaqjBWiGWwHYesvqaZOR8d6QkElpApmARUgtN0Yb10aU7
	/PJdcUZ4PQCIbUfCQT77d2oVjkhC5DFM1CVm
X-Google-Smtp-Source: ABdhPJzXcd1HsNuTSWEEVV93k+NGOswDhpaFh/BNDMn1phrflqo+4QypwZosog7cdBuWxArmiJDwDg==
X-Received: by 2002:a05:6602:3c5:: with SMTP id g5mr12026344iov.42.1630174345436;
        Sat, 28 Aug 2021 11:12:25 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id s16sm5511664iln.5.2021.08.28.11.12.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Aug 2021 11:12:24 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/36] gnupg: upgrade 2.2.26 -> 2.2.27
Date: Sat, 28 Aug 2021 08:10:55 -1000
Message-Id: <97348726aea3ee088f48715df0e64a172665855d.1630174149.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1630174149.git.steve@sakoman.com>
References: <cover.1630174149.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wang Mingyu <wangmy@cn.fujitsu.com>

(From OE-Core rev: 90798e892fd3e0d2ef77a7ba64a33ea9f8ef317b)

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 33a997a80a56fba4138780fadda231ae4fd751ea)
[gnupg 2.2 is an LTS release so this series are all bug fixes.
https://lists.gnupg.org/pipermail/gnupg-announce/2021q1/000452.html]
Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/gnupg/{gnupg_2.2.26.bb => gnupg_2.2.27.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/gnupg/{gnupg_2.2.26.bb => gnupg_2.2.27.bb} (97%)

diff --git a/meta/recipes-support/gnupg/gnupg_2.2.26.bb b/meta/recipes-support/gnupg/gnupg_2.2.27.bb
similarity index 97%
rename from meta/recipes-support/gnupg/gnupg_2.2.26.bb
rename to meta/recipes-support/gnupg/gnupg_2.2.27.bb
index e2b03a520f..1181c8341b 100644
--- a/meta/recipes-support/gnupg/gnupg_2.2.26.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.2.27.bb
@@ -25,7 +25,7 @@ SRC_URI_append_class-native = " file://0001-configure.ac-use-a-custom-value-for-
                                 file://relocate.patch"
 SRC_URI_append_class-nativesdk = " file://relocate.patch"
 
-SRC_URI[sha256sum] = "517569e6c9fad22175df16be5900f94c991c41e53612db63c14493e814cfff6d"
+SRC_URI[sha256sum] = "34e60009014ea16402069136e0a5f63d9b65f90096244975db5cea74b3d02399"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.25.1

