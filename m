Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
 by mx.groups.io with SMTP id smtpd.web12.61430.1600092767078256650
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2020 07:12:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=qcbh6D9R;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.196, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f196.google.com with SMTP id c196so12890896pfc.0
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2020 07:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=P3IIMv4Tt8M+JcnUFS/PFAq8ZsBEVFVEWdFAZXJlD+o=;
        b=qcbh6D9R9viy46ir85KI+hbPadp10KjGbgtm/Se+ZgFuxTjpex8QUmcyKXzJPDlAI0
         855sRU8QGa6+2dWWFX5tu6JaY1Zgu1cK1YCd4bEzxVqo0jexSMzi5ByCFj7PAoj7DIoI
         35KI+hhgn5iDtJ+cjeqNc5Id8Ni12I10dqk7tGnLok3HJV/Qhupk80dQd+AJ7G8rEK26
         VbwrPWqV5xPDsewuN9m+CBggSVUlK8hRFhGMXPpotd019PY15FY1Q7zYV7kgY70pvYP9
         79GYSeJ6iyh+gDujSvMs3iyIC2hMiISoYtbfUWMLOroLgHeB+XErc/Oj1lfIMQEg/Wm4
         LUdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=P3IIMv4Tt8M+JcnUFS/PFAq8ZsBEVFVEWdFAZXJlD+o=;
        b=lrgI5etlqo/wS4VOXajLb8vH6uqqAws7TXOR8+DtITOuvqayF+QEII7wTwfIy2eXuu
         QODoZ+X30DeTCTPKzoq3d1/uY09q7zCgrojBs1o6CthQDXfB+aZpqaq95cFC8CwHyVYJ
         TZeehz4fJoBw7l2m1Yoswf24dptXMQjD2MdKgOvfh9HXqIh3o8/QH/rIaaM622O3WsSe
         8FK0SzR+LHD3yfB0soBYwjarVeaYELCBJfDVcutnHl6XsZfPSm7Wz8vPokLfQFNrJ86K
         znY/HrYklrfDuH9UQM6f3P9MZOJPtkytW7ZxYXB0Nr6q6BpX6of2Ib9oQn1M/ofJlyzn
         fAdQ==
X-Gm-Message-State: AOAM5313f7dTAneopq1PAFahuWeqipXUSi2ZqfgBCA/PniY7w/m3nc+c
	Biw/09FHtIY+Ybk6EZvetcNk8r1ljA/44UK9GRc=
X-Google-Smtp-Source: ABdhPJy6BbbpHDeKGDq53G/4D9dYstU4NXivodBBT6D6EeeB8JrqNpmdiOiYQKlB4ylB1hUeiaOhQw==
X-Received: by 2002:a63:801:: with SMTP id 1mr11253886pgi.48.1600092766258;
        Mon, 14 Sep 2020 07:12:46 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id z22sm11053183pjq.2.2020.09.14.07.12.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 07:12:45 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 17/24] curl: add vendors to CVE_PRODUCT to exclude false positives
Date: Mon, 14 Sep 2020 04:11:35 -1000
Message-Id: <f43a1bd9e4ae2f652e14d6b6d04e3e81d6062b47.1600092418.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1600092418.git.steve@sakoman.com>
References: <cover.1600092418.git.steve@sakoman.com>

From: Ross Burton <ross@burtonini.com>

To avoid false positives (such as CVE-2010-0734, rubygems:curl), expand
the CVE_PRODUCT list to include all the vendors that have been used.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bb265122cccea9466405fdd924ad10ce8cda0dec)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/curl/curl_7.69.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/curl/curl_7.69.1.bb b/meta/recipes-support/curl/curl_7.69.1.bb
index 8b5170f021..dfcd533c80 100644
--- a/meta/recipes-support/curl/curl_7.69.1.bb
+++ b/meta/recipes-support/curl/curl_7.69.1.bb
@@ -14,7 +14,9 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "ec5fc263f898a3dfef08e805f1ecca42"
 SRC_URI[sha256sum] = "2ff5e5bd507adf6aa88ff4bbafd4c7af464867ffb688be93b9930717a56c4de8"
 
-CVE_PRODUCT = "curl libcurl"
+# Curl has used many names over the years...
+CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
+
 inherit autotools pkgconfig binconfig multilib_header
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} gnutls libidn proxy threaded-resolver verbose zlib"
-- 
2.17.1

