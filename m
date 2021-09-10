Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web08.9686.1631282875671573584
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Sep 2021 07:07:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=kOAVgWz0;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.178, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f178.google.com with SMTP id w19so3044932oik.10
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Sep 2021 07:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=qWhYcpNb5iFD7S+tn8piblUHDoK2W7/yoZTgAkk72LU=;
        b=kOAVgWz01uQCGRblmXPuDPcXshIAPJXUcekMMic1cShF+1kXAqXSJuPgVZ5pUDE3N/
         VqLFILxkq/RZ4cYJyXJxwCx+EJ/LsbBPIeqCTFeiHrDCBgmiF5lh9QXcEBsn+3iV++N0
         LZkIsPMKVe7MF+hrivOo8+30R4i+F63opJAC75CoaO1/2vOQ/kE9yjZsqyJ9aFxK29l3
         fRzicwRDpPtgzuh0STJOM5brQJtHT7o+ql50lJGGhOfVKupMplsHdixBqIO9YurDodvm
         2sVMWLLo2aUX7rrNRs6aKRzf7Excym5x7KAfHfGuo+UYwkmqZF84BI82oiBdXsk9Drq0
         4WfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qWhYcpNb5iFD7S+tn8piblUHDoK2W7/yoZTgAkk72LU=;
        b=6MLnV6MbsFwFWQIDzq4zDcaKBYwPZmXikPv3Krmifi8MDbFICm3UvNs+nahyeRrie4
         28t0XPEkeUQ2tRfxi0/RCpgiGkGBnGmry1HJ6Gq60YmEABshHXGRudGybH0HfMVirTpi
         gLaw2O2lXyTIdLHekyCR40u8wIEgYl70BFs2N9sggGSn6DAmQ+jISxcpyffzpxHdOqB7
         d6livSbsT7Nc1Jf8YC059sS16LX6kZI4KYorixhhZvdgtQHxM5rNKcyMc5/ks0wIMejs
         gwkV9pkCJgFU1xnwiB7gHV+nzb07i4VLDkcqIPBMTQr5WMyyvtixdjd2YSVie7xFi+mu
         4Usg==
X-Gm-Message-State: AOAM531jX92pKZvrJ9Z2Bk7hlhvBuF6H7aKPIetjhPdIs7WyXj4HkIHH
	eIOt3uK9zc6F7QMr00LcdVoXhTF8v/CbA+s5
X-Google-Smtp-Source: ABdhPJxoJVnCRexAE60Jw0nG11ziLP5ohYSfbwv2wAMI78A6+RZV9/ErI5/LyrHDcmH/RKJcFS80gQ==
X-Received: by 2002:a05:6808:150c:: with SMTP id u12mr4252366oiw.136.1631282874537;
        Fri, 10 Sep 2021 07:07:54 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id s198sm1248831oie.47.2021.09.10.07.07.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 07:07:54 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 2/9] dbus-test: upgrade 1.12.16 -> 1.12.18
Date: Fri, 10 Sep 2021 04:07:13 -1000
Message-Id: <9716517937bf317cc1f400376da335caaceb22fc.1631282682.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1631282682.git.steve@sakoman.com>
References: <cover.1631282682.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wang Mingyu <wangmy@cn.fujitsu.com>

(From OE-Core rev: 839695e0c1b0c0fcfbb924c2b174c4a638067a32)

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5cbf053481642a820b9f4c6bed9ac79246719087)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../dbus/{dbus-test_1.12.16.bb => dbus-test_1.12.18.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/dbus/{dbus-test_1.12.16.bb => dbus-test_1.12.18.bb} (95%)

diff --git a/meta/recipes-core/dbus/dbus-test_1.12.16.bb b/meta/recipes-core/dbus/dbus-test_1.12.18.bb
similarity index 95%
rename from meta/recipes-core/dbus/dbus-test_1.12.16.bb
rename to meta/recipes-core/dbus/dbus-test_1.12.18.bb
index bea0e74ed0..0063dcce67 100644
--- a/meta/recipes-core/dbus/dbus-test_1.12.16.bb
+++ b/meta/recipes-core/dbus/dbus-test_1.12.18.bb
@@ -16,8 +16,8 @@ SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
            "
 
-SRC_URI[md5sum] = "2dbeae80dfc9e3632320c6a53d5e8890"
-SRC_URI[sha256sum] = "54a22d2fa42f2eb2a871f32811c6005b531b9613b1b93a0d269b05e7549fec80"
+SRC_URI[md5sum] = "4ca570c281be35d0b30ab83436712242"
+SRC_URI[sha256sum] = "64cf4d70840230e5e9bc784d153880775ab3db19d656ead8a0cb9c0ab5a95306"
 
 S="${WORKDIR}/dbus-${PV}"
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/dbus:"
-- 
2.25.1

