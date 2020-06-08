Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web10.25157.1591602499519973584
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2020 00:48:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=M34hYGdA;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id k11so17158132ejr.9
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2020 00:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jzkPjOp/rTrI66c1wVpcGNWN1rnP2JCSxkK8mtF70kA=;
        b=M34hYGdA2LSTMBNtcQpCxeDeG9irSBLdJ5ipdW/l0+Oe9Bc5wM0ewaVI6Pl+gK7kzJ
         E930gq8k6OnRPKQjyb4Ua7uijMI8bPI13H6x5ntbIBmqR/Nxc2ycQszbpAmUDZwm18NU
         rjaKJxtq40WKEGL7LPvyOrPQb80kPWOyN2l9hdiDkYC6j4GTtTKJnEmnS27iGqGtIkaD
         g9mN66eZaNfwP044HH1diiBI5F+wfzfPKsl2pDJ83RhFebQkEzO+E21YnZbOGecoLnfA
         sFSdLNLhFF7QXCk5jKS/8omYUeIp7AOD0Sp8F6iFn+BuyTY31ukC/q0G+dAC+4HyE9aO
         cALA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jzkPjOp/rTrI66c1wVpcGNWN1rnP2JCSxkK8mtF70kA=;
        b=Ru+lKVs4qodS3Ctd+OZ8Qip+9bVKVUuAKy0BmW4P+3Y7VRyrmep2JqnpQRSAbvezCk
         N+owD6N+4WDsM9p5dZIrhyuaCTWwXT9eKnTsAP/DrpUkH9wRtnRXQntLr11icZOa8jzA
         BX5uh1598RHndxmjBZnxuGoengXYCgoaEkNnsoFvrVYAB6Cp63sqLxO5qPtJz/wM2jWl
         k0mpb/JpM6YWfE24E0hV4uqdTt+pCBUznhCRoHDWR0MdmP7Ah9vg1HL7PQ72+ypFYj0H
         diS4dAccU6zxwrUosUJCry5o2cmGvrQceaUu4fbxvVln3KMXKKQhJqwgKmgsUFmaqXdN
         YeRw==
X-Gm-Message-State: AOAM5321PajqiHjRbZYXfyK0zEjQDkKdA2pUV/f+ekEHtaCeoYCIvC/E
	UmyKItf+nih66KEziKtO5YEZk2GHmhE=
X-Google-Smtp-Source: ABdhPJxkBatcVm9hZ79JKMfbzzNyarE42xGtQIFWw3Y5werVvQp8P2cMkNBLjz0PEwVdk/mpBEA6Jw==
X-Received: by 2002:a17:906:940d:: with SMTP id q13mr19956145ejx.534.1591602497895;
        Mon, 08 Jun 2020 00:48:17 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.66.228])
        by smtp.gmail.com with ESMTPSA id g22sm12473466edj.63.2020.06.08.00.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 00:48:17 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 06/42] python3-numpy: upgrade 1.18.4 -> 1.18.5
Date: Mon,  8 Jun 2020 09:46:23 +0200
Message-Id: <20200608074659.7051-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200608074659.7051-1-alex.kanavin@gmail.com>
References: <20200608074659.7051-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/python-numpy/python-numpy.inc            | 3 +--
 .../{python3-numpy_1.18.4.bb => python3-numpy_1.18.5.bb}       | 0
 2 files changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/python-numpy/{python3-numpy_1.18.4.bb => python3-numpy_1.18.5.bb} (100%)

diff --git a/meta/recipes-devtools/python-numpy/python-numpy.inc b/meta/recipes-devtools/python-numpy/python-numpy.inc
index 6a437e7c3c..75309e3080 100644
--- a/meta/recipes-devtools/python-numpy/python-numpy.inc
+++ b/meta/recipes-devtools/python-numpy/python-numpy.inc
@@ -9,8 +9,7 @@ SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${S
            file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch \
            file://0001-convert-shebang-from-python-to-python3.patch \
            "
-SRC_URI[md5sum] = "70e6c294f8dffa8d630eda1b0d42ae4d"
-SRC_URI[sha256sum] = "e0781ec6627e85f2a618478ee278893343fb8b40577b4c74b2ec15c7a5b8f698"
+SRC_URI[sha256sum] = "2c095bd1c5290966cceee8b6ef5cd66f13cd0e9d6d0e8d6fc8961abd64a8e51f"
 
 UPSTREAM_CHECK_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
diff --git a/meta/recipes-devtools/python-numpy/python3-numpy_1.18.4.bb b/meta/recipes-devtools/python-numpy/python3-numpy_1.18.5.bb
similarity index 100%
rename from meta/recipes-devtools/python-numpy/python3-numpy_1.18.4.bb
rename to meta/recipes-devtools/python-numpy/python3-numpy_1.18.5.bb
-- 
2.26.2

