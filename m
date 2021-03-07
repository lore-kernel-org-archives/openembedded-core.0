Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web09.22240.1615130356619824621
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Mar 2021 07:19:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=p9vNCnyz;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.54, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f54.google.com with SMTP id h98so8690954wrh.11
        for <openembedded-core@lists.openembedded.org>; Sun, 07 Mar 2021 07:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hsexE982oz5fZ8V7XD0cgtmBZaXFoQV9k1TKNeFs26k=;
        b=p9vNCnyz0J4hN1GZw/mbuRfv1P3fGSOrUgTi2XmZDQo5csg3K82Llj0d2Sx4Q1ua2M
         IaHOpAcbm85zryI36BJUtM52ckPqnWGa+3s4bhxUrs9zAPm9yJ5fya8u3T6kg/B67QlH
         Na0NRYQQj1+OeMlF1EWYJzz+hwx0hZ1ahCFn1gepX1UYpkOa1KaqzTERqP1JmF6j0R6q
         OdXHZV73Rhji+DZzv0qwiPFF80UL55ZKWu3qVHcz5g02eQWbGO2y/49InqJKi5QKLgqq
         8gcRwHQz/XKTXY3Gql1sNewSgJyfh4I9TNeBv33U4Rwi9dNlhoLFRRwoKrPdfnx8VNSC
         ISug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hsexE982oz5fZ8V7XD0cgtmBZaXFoQV9k1TKNeFs26k=;
        b=NRpr1voJoVywQ5xJuSnkYiFxefS1e2M50Q5N4DDZOpva1jTNYYmSsyUQQfDESjul51
         NW4HlgNJjJB+ll95KtcHG1VB0j2e3XzTaP77dsNxug4voIREj/PvBHfeGDmqVSHhvRYl
         12+Pwvp6sX4g+78dUvDw2Ji77+DhjTSbLURhWwjvD6rsc/PP856ixgV7MGOS1rNghdZk
         Cm2ZthKT4znFrYXtHOW3rtUsdRNfdLnapuxt/j470pVL3VnZM2xGDjSP8zKUqAUy0u2Y
         WuGAplHy5LSZqKoh5isB0tHtGJogkYig085SzoeREuFf+uKxXMYWjWUWU7ezNBYJ8cqZ
         EYMA==
X-Gm-Message-State: AOAM530VfFrUbN4anzeMdxPbYZtUHi/En3eL2yQ64C/9SxOqb0CD2B7c
	wlmSZ7cHsImGj+rtXZad983F2w==
X-Google-Smtp-Source: ABdhPJy2T9rRayO+7qbmZdVzk+xMsSKmv9jpShmBsQodx5tHcrlRldpU2neiLI0hCO3PsuRLVkjAow==
X-Received: by 2002:a5d:4532:: with SMTP id j18mr18376825wra.239.1615130354888;
        Sun, 07 Mar 2021 07:19:14 -0800 (PST)
Return-Path: <brgl@bgdev.pl>
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id z7sm13815757wrt.70.2021.03.07.07.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Mar 2021 07:19:14 -0800 (PST)
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Armin Kuster <akuster808@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [OE-core][PATCH] python3: make pydoc rdepend on python3-io
Date: Sun,  7 Mar 2021 16:19:06 +0100
Message-Id: <20210307151906.30887-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

pydoc needs tempfile (provided by python3-io) to work. Add python3-io
to its RDEPENDS.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 meta/recipes-devtools/python/python3_3.9.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3_3.9.2.bb b/meta/recipes-devtools/python/python3_3.9.2.bb
index af1843a180..c5e47eec4f 100644
--- a/meta/recipes-devtools/python/python3_3.9.2.bb
+++ b/meta/recipes-devtools/python/python3_3.9.2.bb
@@ -371,6 +371,7 @@ RDEPENDS_${PN}-ptest_append_libc-glibc = " locale-base-tr-tr.iso-8859-9"
 RDEPENDS_${PN}-tkinter += "${@bb.utils.contains('PACKAGECONFIG', 'tk', 'tk tk-lib', '', d)}"
 RDEPENDS_${PN}-idle += "${@bb.utils.contains('PACKAGECONFIG', 'tk', '${PN}-tkinter tcl', '', d)}"
 RDEPENDS_${PN}-dev = ""
+RDEPENDS_${PN}-pydoc += "${PN}-io"
 
 RDEPENDS_${PN}-tests_append_class-target = " ${MLPREFIX}bash"
 RDEPENDS_${PN}-tests_append_class-nativesdk = " ${MLPREFIX}bash"
-- 
2.30.1

