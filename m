Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web12.196716.1598282147924069510
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2020 08:15:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Me7d023x;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id t9so811466pfq.8
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2020 08:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=siDYMuX3FB7nfcRA39Ld6EVbF47Aasz0fLl0gLp4Fr4=;
        b=Me7d023xhnGUVtni5S51PCMd7JWlnJMeBplWKDGuE9dzBMNhtgERxtXuw9HtE/2XuU
         GUlfRrr94CHztKN/k3eW/YRiOb/db+OKrPCxA9FdYmfR+NPkqFjlHSw1LBOFuJGeQK3c
         /bp4N7AIFLKXKpccUqz939toX7Y+EnRuKtUzS71BehDUK5lHyGO0Qq7ljLyTuFOWdPxX
         aZ2izcCRgI/7zS01YECMSVr5IWJgQSyOIMHvw4UvX+C15yeXqRMGt2XWQwTR2otHW01w
         eZ1Cr46rFnPhYaUPQ0WmJPpSwZaeSQMNIJYQUvxAzCM39wyJOdRtK+7rVS0Y+UAJbeN+
         73Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=siDYMuX3FB7nfcRA39Ld6EVbF47Aasz0fLl0gLp4Fr4=;
        b=eDFQePiRFxZiZp61yZpWboDeOcgFVUkNf6x4U8AgrvXREgf3cd8KLMgJI8X8mLQjj5
         th0TesMCOKYOtWbucZDv1LGe2zz60rrdD4Fm/RDuHkUJpJ0Xc+XFDZtkTFBwjOY83ayn
         lOsiZNS8iPJhU0aT85DpSiqMvGHsWIe9MIjb80fjJsZvIXORQDu8X6ahERLtm5RNKrTf
         LFbImZHh9iKzqboe8qob7v6j3DRW95SCDTOZjdWn0UH73T9ENKb9JZauVUAeeGJ0G+hG
         0LApAdbnR7YoD8MC+ia8WYoqGHkO1aijzw7V0B/vjnezlhr6lUyjwB/WzHJhAmTjwPAB
         HFrQ==
X-Gm-Message-State: AOAM530L46meGHGpVVDVxmShiv8YzcB4HvFiGnstbh5JuTZlipmGkY5o
	siDcflIVMKJ+yO01yA5AV8sY8tYhteY2M+xrnws=
X-Google-Smtp-Source: ABdhPJwWur4Nlk0JUvSeBYz0B7IRESXmyeFHHQ6fV6bbFWhw8e1/Rr5CWdqQtHSm416yRVWBWi704Q==
X-Received: by 2002:a63:d34e:: with SMTP id u14mr3584560pgi.122.1598282146937;
        Mon, 24 Aug 2020 08:15:46 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id a13sm11530382pfo.49.2020.08.24.08.15.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2020 08:15:45 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/12] alsa-topology-conf: use ${datadir} in do_install()
Date: Mon, 24 Aug 2020 05:14:59 -1000
Message-Id: <35b3e2365fe0a361d62c1d9abebd40de9e27af25.1598281931.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1598281931.git.steve@sakoman.com>
References: <cover.1598281931.git.steve@sakoman.com>

From: Mikko Rapeli <mikko.rapeli@bmw.de>

Fixes build with custom directory structure.

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9eec98b3842bb046cbd202140b9b5ccf09d20466)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.1.bb b/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.1.bb
index add1f309ec..5101cc7b7a 100644
--- a/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.1.bb
@@ -13,8 +13,8 @@ SRC_URI[sha256sum] = "354a43f4031c98bef1349ac722d83b2603ef439f81a1ab1eba8814c282
 inherit allarch
 
 do_install() {
-        install -d ${D}/usr/share/alsa
-        cp -r ${S}/topology ${D}/usr/share/alsa
+        install -d "${D}${datadir}/alsa"
+        cp -r "${S}/topology" "${D}${datadir}/alsa"
 }
 
 PACKAGES = "${PN}"
-- 
2.17.1

