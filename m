Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.15915.1603122186040949776
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2020 08:43:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ErlJHgyo;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id x7so14539075eje.8
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2020 08:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p02Ba/IhJ843gAZoSqSx1/Jj2xm1As/QS9NQ31/DxD8=;
        b=ErlJHgyo+tlaU8up7Rcb+oYpwUEM3YMIu41cSR15mYFrfcTQIfr4+45qXgm9gNhrBA
         +c3p1yRXLzfcrkPq5lxRV41qh6+yUyFd0TfpT5xbUywsTpIPBlF5yC1/BCqCsslq5eGw
         P1DPOdbXcQTNky6HTHEP4mxyy8vihrWavdJ5uQLAR5YGU4Or8eMLR31zbWSKxNstUKmS
         CjJdLNGUaY4oUsuInySj2TIQOu8X4AaiprYXZ5vFYI56Is6hy+4hKhGEcZ2tp5fBUmtZ
         gPHApzDOGi6Pe7NRfFysG8MoIX0f/Ohr8HAMsizBcENOWvbN4Zvpu6VE9Yhdx2Bj2YDE
         UgzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p02Ba/IhJ843gAZoSqSx1/Jj2xm1As/QS9NQ31/DxD8=;
        b=ewGC8C/2bhQ1FbM5tNrn2nPv7UnT+9g6pUov8QsJPIopR4PA51EJI4NFLrvfTrJoQ/
         91WWrlX31uLw8CPpVdEVMfGkgzvmo9b2y4+xhgI+CE2wkUa9lUzr/xqgyVTw7zzhXwXe
         JF5k07XGjU1bIRbb4Jpac69AZV6Vw8GhSFba1dmA6nH3VQgSukvfW7KH8UGT1JS++66y
         8owXBdkJf8JwbuzwnXI51+JmDV4jq/cdQiLgUh/RcbvtSW4S/gTcLuE8Ua4DvU57RBpj
         Txj/E22uNBkaFS+ceAocvy3YUJK2ymMzHmbOMKF0Mp5AwIFydJAG1hnCkFYLuHATYRKA
         M1sw==
X-Gm-Message-State: AOAM532ykcLyLcOIygkieetudJwpQvFrVLnrgZW14mRi5CFEvzqrMEgc
	rSoZvUa73+vSpbnNd1LuAol3GWVqdXE=
X-Google-Smtp-Source: ABdhPJy2v2MEsT0YzyBg5xxOpltDK7GhC0mwRwpkvc79bn1o9sIpy3CazBBu1xpP353Dyxhdc0SMtQ==
X-Received: by 2002:a17:907:24cf:: with SMTP id e15mr460368ejn.191.1603122184343;
        Mon, 19 Oct 2020 08:43:04 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id o11sm497754ejd.60.2020.10.19.08.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 08:43:03 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 3/4] boost-build-native: fix upstream version check
Date: Mon, 19 Oct 2020 17:42:55 +0200
Message-Id: <20201019154256.9519-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201019154256.9519-1-alex.kanavin@gmail.com>
References: <20201019154256.9519-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-support/boost/boost-build-native_4.3.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/boost/boost-build-native_4.3.0.bb b/meta/recipes-support/boost/boost-build-native_4.3.0.bb
index d8096de5af..258f8c9cdf 100644
--- a/meta/recipes-support/boost/boost-build-native_4.3.0.bb
+++ b/meta/recipes-support/boost/boost-build-native_4.3.0.bb
@@ -7,6 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 SRC_URI = "git://github.com/boostorg/build;protocol=https"
 SRCREV = "632ea768f3eb225b4472c5ed6d20afee708724ad"
 
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+){2,}))"
+
 inherit native
 
 S = "${WORKDIR}/git"
-- 
2.28.0

