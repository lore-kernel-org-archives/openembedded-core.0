Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.18517.1592835559834542047
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 07:19:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dn1U6zB5;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id b5so8468585pfp.9
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 07:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=LRolw8ucj79KObCM1jtKJ5jxou6WvoXq1ioEhZsBvBw=;
        b=dn1U6zB5+zkZ6Jh6PfSW/7lMI75K+ufspbF+uTNLuGWP0OtnhBgckRDR1C3G2WdEqu
         DV2U7Zp54VJVx/UwMjaUmB4Cbi2+CQQJRknjW7l0Fb6gxPlaO4A9740QGR332G0nwk9p
         2x0dAckbfoRaMyTGCfTniF2BIkk/FI5LzSexjLf55WzWaEuQ9u/ehOO+EIwqgYXo1JJ2
         wdTymScNjpC2hYvvWZ2Qcpqgo0BVgdZiWlrY3N4bCixtmizB67ASVylFkUM9rY+7QxG6
         +elHKW0LEmGEZaIfuakn3j4QlQdWk3s7HN7R7m+Tw6IgpXbchgEmXJMWyaQ+nNqwMKwn
         ZNsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=LRolw8ucj79KObCM1jtKJ5jxou6WvoXq1ioEhZsBvBw=;
        b=tds2rByx9QyioqF9FrTiTRyjXuIyH72H25XzXYhoBLnP8CoBCulthnO6UaR20zdLDG
         OJhvs6yn7kdQbmloa0XPpHxutqd9sUPmzaCPmVC9EfAklQjucc2RRe/V1fL7foE1nanw
         I+I36brwuEAm31YDkSqqealO9ujfqO8lAMrr86ixm+7q7USS8TMpSXou2CaVn7/JyASC
         AeUhRRScGK434mWywl6/Wrz0iBpPZ2k0KUyrPleRV/HgsrpRjzCFo1cSeH2IyZzkI3lc
         fOPputXL51TFzSNkoHP9Cd27ba2IrP5qHeG3N053Af2PekKwsNC5HBcXZYQMavpmvOlG
         DEbA==
X-Gm-Message-State: AOAM531nSOOYL00Znj7L+Y9HtPxQNcx8F65O3mKCw1jEYCIv80wD3+Wt
	L/ScMlb03l9oRq/HxeRNAlfWNqd5
X-Google-Smtp-Source: ABdhPJxJmSmpmOujCJV8hLjeoBrx022X358DRWYQzN9VI9JozBq8b5qGWuldiw0EocHaBuuhcCFzDw==
X-Received: by 2002:aa7:9781:: with SMTP id o1mr20457125pfp.97.1592835559166;
        Mon, 22 Jun 2020 07:19:19 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:489f:ae11:ae3f:a4e7])
        by smtp.gmail.com with ESMTPSA id 23sm14188840pfy.199.2020.06.22.07.19.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 07:19:18 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/6] log4cplus: move meta-oe pkg to core
Date: Mon, 22 Jun 2020 07:19:12 -0700
Message-Id: <20200622141915.31932-4-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200622141915.31932-1-akuster808@gmail.com>
References: <20200622141915.31932-1-akuster808@gmail.com>

pkg need for kea

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../log4cplus/log4cplus_2.0.5.bb              | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta/recipes-devtools/log4cplus/log4cplus_2.0.5.bb

diff --git a/meta/recipes-devtools/log4cplus/log4cplus_2.0.5.bb b/meta/recipes-devtools/log4cplus/log4cplus_2.0.5.bb
new file mode 100644
index 0000000000..967ac7623a
--- /dev/null
+++ b/meta/recipes-devtools/log4cplus/log4cplus_2.0.5.bb
@@ -0,0 +1,19 @@
+SUMMARY = "log4cplus provides a simple C++ logging API for log management"
+SECTION = "libs"
+HOMEPAGE = "http://sourceforge.net/projects/log4cplus/"
+BUGTRACKER = "http://sourceforge.net/p/log4cplus/bugs/"
+
+LICENSE = "Apache-2.0 & BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=41e8e060c26822886b592ab4765c756b"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}-stable/${PV}/${BP}.tar.gz \
+          "
+SRC_URI[md5sum] = "71dd956bf686195127559671f1426cff"
+SRC_URI[sha256sum] = "c07115c23219390633798def30b7b51a0f79fdeb857e4b49632f17746d0ceb97"
+
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/log4cplus/files/log4cplus-stable/"
+UPSTREAM_CHECK_REGEX = "log4cplus-stable/(?P<pver>\d+(\.\d+)+)/"
+
+inherit autotools pkgconfig
+
+BBCLASSEXTEND = "native"
-- 
2.17.1

