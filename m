Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68904C36011
	for <webhook@archiver.kernel.org>; Sun, 30 Mar 2025 02:36:50 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.24340.1743302203978029318
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Mar 2025 19:36:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bssA/rCu;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so34971835e9.2
        for <openembedded-core@lists.openembedded.org>; Sat, 29 Mar 2025 19:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743302202; x=1743907002; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OLpnB9H4pZd6/8asaGRfp7PAwUjUvQwK7tPTJbtIZwc=;
        b=bssA/rCulK9bWMLOMjGwUP5dmAQ9j3zaXndw7JNLi0rjW5Rqhkj0SVGk/PAweDXR0X
         xTWMUW6X5v87Osai4f6Btz0vXU6tsChnSWDcimEO1JZWOrzt+EkGdnZaXNBkH2y3YDz8
         Ze4XKFpPA077eC68BF5U3jbTxpRu4ZsSPUAFFgIvMN0lGWaKnwnYiNkRhpA8qgtNFIrj
         Ubk0EQ0qYkAp9i3BIZZqvaW/Dv1075POl9iZ+DN6qcnxVNsWkJgpIuFkgLF+5nMGpnq6
         2tSTw9eeZqvMDnx8XXEoaCzGZlbyElI7lhQzeEYm6LDjUyoTJU6cS3FbGPg5P7NTDvtz
         rcXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743302202; x=1743907002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OLpnB9H4pZd6/8asaGRfp7PAwUjUvQwK7tPTJbtIZwc=;
        b=nUN8/WfUIxKdsuqBCkwjmTuCIHzRa382uZ4j+UzXR4Tf8OmbQnnNXFeiekceKjXl+S
         SdBv8atjhMSuxVRjwUC4w+uCjYlh07tnrOMt2JAOeYd7esXxxvUJxOav99bMQMjVotMd
         Dy7waNuRK7OM1+gejcm953vsnRyeFOkSVJGVsR6UzPzk6LOSBZLmzn0qFQx94JVdApSu
         3zduN4p5yVYLfknV2D7n3n9Qn0CqwYz4YXGxLMn5Pemv+7sKVqPe0tpWBJjoI1JOALEf
         zH2nz8p+RXql1InXcHLz6cGeEnIXmZhSrNsqIMq3SoOukmcextAI+cUhI0a5yZziELbk
         WLdQ==
X-Gm-Message-State: AOJu0YyPAmoqa560JzdwWw+oq8Cr+BugspG7wWyhl1B6SbAtGRSv3jui
	GDKOaNYI1uAkFIdZ2WkGWDHyLUHf6SfxTKcnxMQXC3wQEIptGqix7D1Uhg==
X-Gm-Gg: ASbGncvBnbMoCyIXIexOZGR4XxOw3gxUrpbk4Uots2jcFbseQmjXelUTpPjiD7fRgny
	ZpmwVHi1fPTWuzaD6PZYyJtg8iyawUYDefxZRXc8tRu2XBp7zuFm+8lUArpXfOlYLqRiER57HnO
	CEPqLc9qC6D1IgH5thYdOMEJ6HthzVYFs2+skB79wMem7jzeF1QxmWcQJ+Aq3+FHz6pmOWIw5bP
	TSzG5U2NZyD+OXbyNk2acqu1k2V0dxCH/ncqh3xZToW6QCv+pf36rnd/DYdsQ9cFjFSOShtAldK
	O8/l9MxokJMcfNKQPz7/yYGWuAZ/gHMMtrHs51a5a7q2vEuprHkCbcjorMaF1W+zDLgblw==
X-Google-Smtp-Source: AGHT+IFBmOsZMmR7ArTFlOzl3r6lKJyaqgMgaPANapQI+u5CiWgc2VwM7R+0NX/4QdK1fasStoCE1Q==
X-Received: by 2002:a5d:6dab:0:b0:391:4889:5045 with SMTP id ffacd0b85a97d-39c12114fccmr3240926f8f.36.1743302201810;
        Sat, 29 Mar 2025 19:36:41 -0700 (PDT)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b663470sm7304692f8f.27.2025.03.29.19.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 19:36:40 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [PATCH v2 3/3] bluez5: disable aics tests
Date: Sun, 30 Mar 2025 02:36:23 +0000
Message-ID: <20250330023624.58070-3-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250330023624.58070-1-gudni.m.g@gmail.com>
References: <20250330023624.58070-1-gudni.m.g@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Mar 2025 02:36:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213909

Temporarily disable aics tests as they can fail
depending on how the tests are executed. Sometimes they pass,
sometimes they fail. The issue has been observed since BlueZ 5.72 to 5.80

Starting with BlueZ 5.80, the tests began failing when using the
ptest-runner script. This is not a new issue in BlueZ 5.80 which is
why the test is disabled with this commit until a solution is found.

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 .../0001-bluez5-disable-aics-tests.patch      | 40 +++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-bluez5-disable-aics-tests.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index a81f317a37..f240743a05 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -69,6 +69,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://run-ptest \
            file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
            file://0001-test-gatt-Fix-hung-issue.patch \
+           file://0001-bluez5-disable-aics-tests.patch \
            "
 S = "${WORKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-bluez5-disable-aics-tests.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-bluez5-disable-aics-tests.patch
new file mode 100644
index 0000000000..e5ece59cec
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-bluez5-disable-aics-tests.patch
@@ -0,0 +1,40 @@
+From 9958e88edf74509faf759099896b37477625913f Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
+Date: Sun, 30 Mar 2025 02:20:24 +0000
+Subject: [PATCH] bluez5: disable aics tests
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Temporarily disable aics tests as they can fail
+depending on how the tests are executed. Sometimes they pass,
+sometimes they fail. The issue has been observed since BlueZ 5.72 to 5.80
+
+Starting with BlueZ 5.80, the tests began failing when using the
+ptest-runner script. This is not a new issue in BlueZ 5.80 which is
+why the test is disabled with this commit until a solution is found.
+
+See discussion on Github:
+https://github.com/bluez/bluez/issues/726
+https://github.com/bluez/bluez/issues/683
+
+Upstream-Status: Inappropriate [OE-Specific]
+
+Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
+---
+ unit/test-vcp.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/unit/test-vcp.c b/unit/test-vcp.c
+index 6a61ea2..04b92e4 100644
+--- a/unit/test-vcp.c
++++ b/unit/test-vcp.c
+@@ -2754,7 +2754,7 @@ int main(int argc, char *argv[])
+ 	tester_init(&argc, &argv);
+ 
+ 	test_vocs_unit_testcases();
+-	test_aics_unit_testcases();
++	//test_aics_unit_testcases();
+ 
+ 	return tester_run();
+ }
-- 
2.43.0


