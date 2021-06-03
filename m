Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web09.380.1622752117383226758
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Jun 2021 13:28:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=h3jg1+wK;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id b9so11075050ejc.13
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Jun 2021 13:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L45GUzG3sTHdRWXLiO7IXmMc/C5dcXo0loMMtI1moA8=;
        b=h3jg1+wKX8bDvyc3CzbxxXmRVEHBGSOBPdjEfulbau+VIR6AEuuNzRWWbeJz3thvi8
         uQ25Km9cZZp8VTG3+yzsqiEu/QVOasd8ffo2JBHl3LCWcUAfExeFpG9NyZErbIDcrkgP
         z62S5JNG2XSFavZoxJbCeVJUjxiZvAy/Gg7MC8s8Z9ryCuAoqrm8+Fs9gH9msxjfAgOj
         TE1wG/hSD8q0RROEDbawGpas5FZ1RXJlKWbDkReyPuxUn+IojQl7p9ITl2kdjyN3O+Xi
         /vhzzZsuLSJbeGiEhw/MhDXhAPYQtjFNfMazGWRIMz10brQL63wipH18xeUhph0a1dpz
         oNXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L45GUzG3sTHdRWXLiO7IXmMc/C5dcXo0loMMtI1moA8=;
        b=tGv2JeT/43Qb49UaJAOrfz4jzRKFx8GYFPMVmSrRum8tTNqcT8Lg4uPjoY/IUv29lh
         jAjSKII2oHDTNtp0h3kRW4WhJ5V+qXrQF76vfTmXA5U18bf5c09IZ1Sek79TTjpsrgVv
         uAkNkck13b3Nt3KrUhSwJXwe/74ahrJBknaAEvA5coAKEEQVGlJ1dfdlDwISTnl/hNJx
         AyLyg3hplUp+Q4I1fX4g1W75pE4CvnVFioy5dbEKIRTeN6+DJNTxRiBVhTIGY1fQDQKb
         l/UXNcgI6xo0/UH8sKYo4xwHUfo9gwnf4EGgNrwYy0o0NRl75JuVwcrDc0zAeYlMYq5m
         FDKg==
X-Gm-Message-State: AOAM53017Fv5O/9KvwR7TIHEEw36MBAJUm+yKXA9QocM1epZ41FoC5EO
	rDsRQFCuv6IvjXP4x9jc0yh2KKA1Y/06Gg==
X-Google-Smtp-Source: ABdhPJxIjj0PgqEl4LEz07UeRiQ43mddrDzrUTQYWqpTqNFNkiOIVuOY4HdOAf/SLDBbJUryToUwgA==
X-Received: by 2002:a17:906:3818:: with SMTP id v24mr945737ejc.197.1622752115717;
        Thu, 03 Jun 2021 13:28:35 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f11f861d707ea86d7bc33dd.dip0.t-ipconnect.de. [2003:f0:7f11:f861:d707:ea86:d7bc:33dd])
        by smtp.gmail.com with ESMTPSA id u17sm2216009edx.16.2021.06.03.13.28.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 13:28:35 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] libinput: upgrade 1.17.3 -> 1.18.0
Date: Thu,  3 Jun 2021 22:28:26 +0200
Message-Id: <20210603202827.2141368-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* COPYING changed by link (master->main) [1]

[1] https://gitlab.freedesktop.org/libinput/libinput/-/commit/354df8bce9874e92de2ad8535fdcedaec0755b27

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../wayland/{libinput_1.17.3.bb => libinput_1.18.0.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{libinput_1.17.3.bb => libinput_1.18.0.bb} (91%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.17.3.bb b/meta/recipes-graphics/wayland/libinput_1.18.0.bb
similarity index 91%
rename from meta/recipes-graphics/wayland/libinput_1.17.3.bb
rename to meta/recipes-graphics/wayland/libinput_1.18.0.bb
index ef19146f79..e46071c67b 100644
--- a/meta/recipes-graphics/wayland/libinput_1.17.3.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.18.0.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://www.freedesktop.org/wiki/Software/libinput/"
 SECTION = "libs"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=1f2ea9ebff3a2c6d458faf58492efb63"
+LIC_FILES_CHKSUM = "file://COPYING;md5=bab4ac7dc1c10bc0fb037dc76c46ef8a"
 
 DEPENDS = "libevdev udev mtdev libcheck"
 
@@ -16,7 +16,7 @@ SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
            file://run-ptest \
            file://determinism.patch \
            "
-SRC_URI[sha256sum] = "0d010e0bf601b5d3a06b3c4d77d67751cf554f3e6448e57aa046ea9ee8f818ac"
+SRC_URI[sha256sum] = "18c6a286583268d39841348e561fbb4713bde0c643b360f5d8a3f27800afdb9a"
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
-- 
2.31.1

