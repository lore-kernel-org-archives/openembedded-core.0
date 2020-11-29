Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web12.43133.1606636087186400597
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Nov 2020 23:48:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=agtlSlN2;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id k11so7846896pgq.2
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Nov 2020 23:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Rnx3opB6AdqYB6opDQBDWMWAXC6zY1yaZc7/6vQ68FM=;
        b=agtlSlN2WnpIizLZccu8I/hCPmCLDHf3NHDs+X18kotBt13y9LZVlFX1r2x4O86xkX
         vBQtnEmZrZUL6+HNN142qbmoGgFlCKZN32wP+/tJCiLvE6DdiS52j5q+D28SXVSENjdx
         e7aGlYU102A24GdDJhNkq32y06c+S6oAJ1Gr9D74BJjDT69VCQU3xBvu4ls0/hMVuq9u
         YatVxrZpkmki3twQtgYRD7OX8S+wXTtpD0Ow8a0u2KWT7nowK+hi/eREeml4HImHUsfq
         j2QCuJYbaDk0BwDDHy3Vq5U7E9qEosM12WfIKC/0H+ILbJ6dym4OCsUiPVL7+d/a0Xl2
         qgTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Rnx3opB6AdqYB6opDQBDWMWAXC6zY1yaZc7/6vQ68FM=;
        b=MG7iJxdxBaikt/uSpBNNrr4DX1689Ou3k8MIkKQZE7ZrmZdVnADXhfuFaKqqwQhZQ4
         e8KW982ADcF+i5ppcO9p2uE8U3HsLF2Kgbk6eB9QHOMv1ttZiQaIfyv/z3t0mOE13i6d
         6qmyYkbbi4zgH8E11M37mbDK0iqr92e2TCfwyBVhzzVYrlrBYdOgIjF2Y+MIEr4wcR65
         jMteMo0BnzdvTN1/LyQb8FxfNJSLdkiy9fpeBrvcVxuPrP7isvULiaoHabaM6j7ID+io
         f9NHtYSR/oNhcee2AX2SQQRcQwv38gpL1ihTvoyThzw9yCdSdh4mhaT5b03UKU9SX4i/
         EHFA==
X-Gm-Message-State: AOAM532jgRcuidEsWPwRPBf2wplBHYLFarF8o95qIRCVzk2tm2Rzh4Xz
	0qhWBaBeTPSpEOo2JqR9dz+HkKcjoVWYUQ==
X-Google-Smtp-Source: ABdhPJzXe6a09Pfz792Pre1giWmwMhxJAES/dA/Kv09qD/UoXoapZqfv3mR/enfUzLaRWe+HNhz8sg==
X-Received: by 2002:a65:668e:: with SMTP id b14mr13003206pgw.307.1606636086550;
        Sat, 28 Nov 2020 23:48:06 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::49d7])
        by smtp.gmail.com with ESMTPSA id z20sm12905267pjq.16.2020.11.28.23.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2020 23:48:06 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v5 3/5] python3-numpy: Add ldd runtime dependency on ptest package
Date: Sat, 28 Nov 2020 23:48:00 -0800
Message-Id: <20201129074802.1493537-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201129074802.1493537-1-raj.khem@gmail.com>
References: <20201129074802.1493537-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
E           RuntimeError: command ['ldd'] cannot be run

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb b/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb
index b484e7cddc..e59ea752cc 100644
--- a/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb
+++ b/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb
@@ -49,6 +49,7 @@ RDEPENDS_${PN} = "${PYTHON_PN}-unittest \
                   ${PYTHON_PN}-threading \
                   ${PYTHON_PN}-multiprocessing \
 "
+RDEPENDS_${PN}-ptest += "ldd"
 
 RDEPENDS_${PN}_class-native = ""
 
-- 
2.29.2

