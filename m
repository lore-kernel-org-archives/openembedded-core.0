Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
 by mx.groups.io with SMTP id smtpd.web08.10205.1622217200989831064
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 May 2021 08:53:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nJw7SWuv;
 spf=pass (domain: gmail.com, ip: 209.85.166.44, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-io1-f44.google.com with SMTP id a6so4690072ioe.0
        for <openembedded-core@lists.openembedded.org>; Fri, 28 May 2021 08:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=0+QZehCLD0cxturYQTyBuZnGddCpLtbbc5aH3vmJTgc=;
        b=nJw7SWuvUkfGt5ISN5mk6RzMWg0CHWQUED0AHvxD28TkOYWtNYe7JlsC6LyGkbVJf4
         kKmJeuvQyAYAuifs+i2A7ahFVmWCJoLV6sH7ic4cdnhMfCL3gbl/yMa/gip74niM7+vV
         Dg2Fppm7SKV2uOzWkZv44yls6vugJcmI8WrcLdLPvPLybG0XCl5eN96uJ3wJ24O5bdrw
         EHNGL38zo5j7SdNkeP4IyyuQ3D8Jvvdj8/USn5NSawj1zgoCdQtKmdjjEDC/gJZyb2rC
         rhTPVbTVuR36V/M/N6zI4JLbevOJt6ss4zmAUSE2COQKXMrvbJ1QJoPNC3q1l9qlOxxM
         gsJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=0+QZehCLD0cxturYQTyBuZnGddCpLtbbc5aH3vmJTgc=;
        b=Rf0bU4w/H4GxFwDDtcrOY020FvHvcrQrDKVu1brS3mp7Y+rwMag/ErYhONIcRlRoLx
         1s0r1JMWWqubsbeUScwQzcK+PUnOMAzSJKoQbq72H8GnROcuGOiEOXHl06MNjUkJ670y
         Z6d8i4pdeZd87bwKxH/eur7gYVQ4uyw0CYKfePl34892+xAGnLExjQRC0H7MxGIl/7Zy
         0FaFY46pSaP8Eqyj7tBtenV6wOTrVnf8ZsEGvD+nnQlD7LFhdHV9uuACT7esz2aGqHTq
         NmG2g7j8wEJMtJ4eOvA3M2+HT7yPNUJgDwZzuEQ8+t4Q4SASYrzObTLWPq6DK5FLo4le
         nCSg==
X-Gm-Message-State: AOAM531J1alrj55SubD/sCLTZ9Hk3gUoqCSWBYiOqENrzCwVBkZt1ipY
	EdNYlX/WYB+6WevWbxrLTQO2J9QzLl4C3XC5
X-Google-Smtp-Source: ABdhPJzH9gBkwJDTLYme3qin1Wq58NuLOAcf8kCRg4GABOjh1Numy2/MClWNxu9G4GM3DTZmhr40tA==
X-Received: by 2002:a6b:d80b:: with SMTP id y11mr7727112iob.202.1622217200075;
        Fri, 28 May 2021 08:53:20 -0700 (PDT)
Return-Path: <vinay.m.engg@gmail.com>
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com. [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id z8sm3367965ilq.30.2021.05.28.08.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 08:53:19 -0700 (PDT)
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
To: openembedded-core@lists.openembedded.org,
	alex.kanavin@gmail.com
Cc: richard.purdie@linuxfoundation.org,
	kweihmann@outlook.com,
	rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	vinay.kumar@blackfigtech.com,
	Vinay Kumar <vinay.m.engg@gmail.com>
Subject: [PATCH v6 2/5] Add rust testsuite for 1.46.0
Date: Fri, 28 May 2021 08:53:05 -0700
Message-Id: <20210528155308.354567-2-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210528155308.354567-1-vinay.m.engg@gmail.com>
References: <CANNYZj_RNDuTY2+dMuQBAByh_01Yj7_nWwwv2iO_sU-r+qvw_Q@mail.gmail.com>
 <20210528155308.354567-1-vinay.m.engg@gmail.com>

Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
---
 meta/recipes-devtools/rust/rust-testsuite_1.46.0.bb | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/rust-testsuite_1.46.0.bb

diff --git a/meta/recipes-devtools/rust/rust-testsuite_1.46.0.bb b/meta/recipes-devtools/rust/rust-testsuite_1.46.0.bb
new file mode 100644
index 0000000000..ad758b71f4
--- /dev/null
+++ b/meta/recipes-devtools/rust/rust-testsuite_1.46.0.bb
@@ -0,0 +1,3 @@
+require rust-testsuite.inc
+require rust-source-${PV}.inc
+require rust-snapshot-${PV}.inc
-- 
2.17.1

