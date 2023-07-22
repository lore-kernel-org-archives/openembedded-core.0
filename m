Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A962AC001E0
	for <webhook@archiver.kernel.org>; Sat, 22 Jul 2023 18:57:19 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.11576.1690052230291265763
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Jul 2023 11:57:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=OohOkvtX;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-666eba6f3d6so1756064b3a.3
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Jul 2023 11:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690052229; x=1690657029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TXEk/PivcJcdEHksCDV9+WDhR2dJrOg2ugPj05BNzno=;
        b=OohOkvtXOzgoSj2WjchVWljFITPBUX4rQM3vJZRPbVa0C7MPa6b/A2hYb4gG5W4OcX
         S/wUnOHEmepZ+9LI2y2JUuJbbFzT1GQe9OmwND0icSyt2ZKb614Oxn2jVhupxhox+cTx
         89smWmWhDFexNkVC3T7zwhIuiMVC8ZBVyx8Ejyb9YWeaOyxU9Vw8u0P7dSDkeH1N061H
         3y5yaSxov39AgFEA3x6e3KU9hZGFzSXkqQj2K+eQBxiVq/abwgIfV0vSghNN7MzQYzrq
         UIQJbyVEc2yPRPj45+YaJfmHLYVQLpNiKGiv+zAy1JBDjlgcegpEyrWsDDTkdC6EqNNG
         t+Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690052229; x=1690657029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TXEk/PivcJcdEHksCDV9+WDhR2dJrOg2ugPj05BNzno=;
        b=KpwdGNI6p52Mf+yR/gzYES6QVf8NGyTVjSPZ6xjTMflFS3hJBgDlrA9HV0Z97IdFRa
         uflKq8xPAwkK2ELPvN6a4fIc6qit/otcpC8KefIIRPHk4cfLcuoUwnOekiaC38uvDZ9M
         VW7efrpdGW1DbSLvQbFi7/Nvdiw3GWwX8kPeXspdxMfzeHTgVjvvMl1fgNexumEHyfTf
         fTexlx6NtJd/0uVvVDeXbPmotqr2c5Ht/FU9IUL8yfc0xXkhmb31Tpna+M4maFSTQbGU
         1tNQLEB5LecwhQDB83VTg4bKIoCSAcTvsPyAXqTxk4j8cAt9IgHLAaDQn62aAg64QUOk
         wtYw==
X-Gm-Message-State: ABy/qLaLTvj+ZDoND8OnBPWi83jy8MmMuKWtnjs75plwLMemqJySDIl8
	/hIGklvlv7+gxjp0ov2OueVsAT2d4LBdJqhcXo0=
X-Google-Smtp-Source: APBJJlFYGeLNMPR9ypXlhhovzA33sI1VTIB2csDkV6Uv5VcZ2Mw9GvunXUPntwZWJclYX5U/WFA/6w==
X-Received: by 2002:a05:6a20:7f84:b0:133:6b64:c92 with SMTP id d4-20020a056a207f8400b001336b640c92mr4790052pzj.44.1690052229415;
        Sat, 22 Jul 2023 11:57:09 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id g28-20020a63375c000000b00553ad4ae5e5sm5400572pgn.22.2023.07.22.11.57.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jul 2023 11:57:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 03/11] webkitgtk: 2.38.5 -> 2.38.6
Date: Sat, 22 Jul 2023 08:56:47 -1000
Message-Id: <34bd08b121f1653907b45eb8d6192a77ef638005.1690052101.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690052101.git.steve@sakoman.com>
References: <cover.1690052101.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Jul 2023 18:57:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184726

From: Kai Kang <kai.kang@windriver.com>

Update webkitgtk from 2.38.5 to 2.38.6. It fixes CVE-2023-27932 and
CVE-2023-27954.

What’s new in the WebKitGTK 2.38.6 release?

* Enable the Asynchronous Clipboard API to make certain pages work (e.g.
  GithHub started recently requiring it).
* Support :has() CSS selectors in content filters.
* Apply basic font properties as font variation settings.
* The Bubblewrap sandbox no longer requires setting an application
  identifier via GApplication to operate correctly. Using GApplication
  is still recommended, but optional.
* Improvements to the GStreamer multimedia playback, in particular
  around MSE, WebRTC, and seeking.
* Fix the build with journald support enabled when using elogind instead
  of the systemd libraries.
* Fix the build with Link-Time Optimization enabled (-flto=auto).
* Fix context menus not working in the remote Web Inspector.
* Fix usage of the remote Web Inspector over HTTP.
* Fix debug logs not being emitted in release builds.
* Fix several crashes and rendering issues.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../webkit/{webkitgtk_2.38.5.bb => webkitgtk_2.38.6.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.38.5.bb => webkitgtk_2.38.6.bb} (98%)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.38.6.bb
similarity index 98%
rename from meta/recipes-sato/webkit/webkitgtk_2.38.5.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.38.6.bb
index 36c6233b33..5e8adf50fc 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.38.6.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0d3344e17d258106617b0e6d783d073b188a2548.patch \
            file://d318bb461f040b90453bc4e100dcf967243ecd98.patch \
            "
-SRC_URI[sha256sum] = "40c20c43022274df5893f22b1054fa894c3eea057389bb08aee08c5b0bb0c1a7"
+SRC_URI[sha256sum] = "1c614c9589389db1a79ea9ba4293bbe8ac3ab0a2234cac700935fae0724ad48b"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
 
-- 
2.34.1


