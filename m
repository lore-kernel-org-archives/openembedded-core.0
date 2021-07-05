Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web09.540.1625524535804681102
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jul 2021 15:35:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=XhrkYJvF;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.177, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f177.google.com with SMTP id w74so467822oiw.8
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Jul 2021 15:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=iX+rN1nyeQsp8vPMoZA1LEHdqwfa5ZmUbluYUGxM8m0=;
        b=XhrkYJvFRFy7TaJ3mNQuWYSPzLkAomKgsCVI5tDRcY206nGsx0hhMiMZApooI9yTaL
         Cic8LZ5NGuA7pu5l4k82l5GHyzhHbRMLD7X1CXcGtkCqMuPWcdvKmhvwtf6Iimbdp/m7
         Au2OqNF8qC7BQz+u5gbMXpCBf1X6oLd7H1rh3s+yQKdiIvogU0xfVoqrIK5JVfcpYKv8
         V1GoNMoDkgUSSmk72D5fxAljw8AO8RIIuWFfo3NiXai2ZzIETQDiaDw7Wd/McGmPk6SJ
         pvMNYvVrXuBx7yWm5n9xBTmtkaHSDwVjoklWKtuabJxuEWyLY4okTpsTkqbBdqBC9LMu
         0RTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iX+rN1nyeQsp8vPMoZA1LEHdqwfa5ZmUbluYUGxM8m0=;
        b=g8P7ZkwVw1b/ycQGhR9oQYB2FMRtDENIJ2NoqaVsGwTckAyk3LeGm78SYbNldhV57V
         eISbagsunAcFw7k/6Hbd6DsKmXk1a6+fBMO6VWpH5xAG0uhKYsWhxGfrSV3o7X7Zqh1L
         xo8CFK+cswvHyG86LThhR1i3g0kTIgGUtz2arRWWS1JRWt3oHl36pQXwTiLL5iyFcgoT
         I5147PrPB+4QMG1ux8s7qcIe7GjPDZ9dQ4VEcLiz5WjDv2EEjKzcyEXuHhROWTHvD6aI
         31EkWqBR58bQECBq5+xmfJ6fSS6lahmOYDvLxW1rOTSMa28dgqQ4etsP1vmwptr25Y2e
         9B9w==
X-Gm-Message-State: AOAM532PtgrcMa0nS+UpRVGmFMFMrAFgrlRCWM5oyaV8bHToMbgtOgLD
	7sf+Uof+Cl4R7K0o6I6fpWu/uWVFWIKrnIvN
X-Google-Smtp-Source: ABdhPJxZrk7o6x7P0RIc4vjOshjGzx0m3HCgWL7oBWO/CjiD/KcBtKOnkfGFc3OfNzmexdmijUb9DQ==
X-Received: by 2002:aca:b609:: with SMTP id g9mr11756922oif.145.1625524534722;
        Mon, 05 Jul 2021 15:35:34 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id i16sm2870178otp.7.2021.07.05.15.35.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jul 2021 15:35:34 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/19] python3: apply test skipping patch unconditionally
Date: Mon,  5 Jul 2021 12:34:39 -1000
Message-Id: <0bb221206c55564fd5cfe1d2452a6abe5e86d2c3.1625511812.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1625511812.git.steve@sakoman.com>
References: <cover.1625511812.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

Testing IMAGE_FEATURES from component recipes cannot possibly work;
adjusting the test to soft-fail if needed items are not available
is not trivial, so let's just skip unconditionally for now.

(From OE-Core rev: 68b816cb90badddd0aafa2a5c6633e000cb21a21)

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 01b41f7deed48b33b35c84e32ef55de3e63b9bc1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/python/python3_3.8.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3_3.8.10.bb b/meta/recipes-devtools/python/python3_3.8.10.bb
index c3da6718a8..7295c6320e 100644
--- a/meta/recipes-devtools/python/python3_3.8.10.bb
+++ b/meta/recipes-devtools/python/python3_3.8.10.bb
@@ -33,7 +33,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-configure.ac-fix-LIBPL.patch \
            file://0001-python3-Do-not-hardcode-lib-for-distutils.patch \
            file://0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch \
-           ${@bb.utils.contains('IMAGE_FEATURES', 'tools-sdk', '', 'file://0001-test_ctypes.test_find-skip-without-tools-sdk.patch', d)} \
+           file://0001-test_ctypes.test_find-skip-without-tools-sdk.patch \
            "
 
 SRC_URI_append_class-native = " \
-- 
2.25.1

