Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
 by mx.groups.io with SMTP id smtpd.web09.404.1614639024291887367
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Mar 2021 14:50:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YIBaMsLD;
 spf=pass (domain: gmail.com, ip: 209.85.166.41, mailfrom: flowergom@gmail.com)
Received: by mail-io1-f41.google.com with SMTP id o11so11722428iob.1
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Mar 2021 14:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6RptpLik7b4Tf6hCX6nSDxCr4mxfLt05hd+Yd2wL5jM=;
        b=YIBaMsLD7FFk9Gp4Mq9aJbnfj2we5OMWi1PmUXo/Jadwd7U5cs1Nw6jqZQIznxXK1e
         9fyTzMLUXUfUXcXHfCg0v4o+pPE9r+a0dQ9wGmEL0pKHQvTU7fm21whqCgEpLveyTu7m
         vNVUSsbVm9aNi+iS2yhsS1myXg4iMn5DMziMSQB/W5Ebvz2u1Wr3it11ZxhM4ZSnSjZc
         KN3AXrooJEEDT104zMNo0wIDFGyx0tMorY4hN4Zzjb556X1joeJS9e4tsqm297kqWbKu
         R65hR46Gm1kubY6IB04urMMTGQrZazwfLkJJ/yOqNXRiLHVs4sgxbNIoHaFYbGDZKcOD
         MxNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6RptpLik7b4Tf6hCX6nSDxCr4mxfLt05hd+Yd2wL5jM=;
        b=ZZOoQBbPVAnpF5pnx86Ow8ba2aeJTscdGVjo03LpPPLQXO/75OyxHcPiIYYFmwkDLT
         i5dr2cUIvxbxoNmSHsMh9qJDTta0XcKw9iLP0pZNic9lxZgnLqBGx6PBzITKuGQbWz5E
         cs632ESulWygkvRFyT/K9JDx62B/aiz7heJFZeFdJwgyf/98sZ2FIPU5rqW9M0yev0j/
         RYJIEIJ/vGG7SbOx9Bi0Yi6WZ4YypcYfBON1VA3RNg+A5cY3KtgsmhLC/UY5OFYSkw99
         JVOJV8pDHjhyEXBoK34awalVuRpCDSeOLeSWNrK9A/5bAd2AbUGeq1uoW2GT0cixiLBO
         IYPA==
X-Gm-Message-State: AOAM530UurIUdIybbVJHnRFAomc0zuzwHm3RQLonfIEa8eZCWPBTSbep
	XjoMUi2GWU1HAIaoQjtbVTghA9NcBfFKGw==
X-Google-Smtp-Source: ABdhPJzhxvTQ2qcei53fjoi/1ebsmCMcRNjqikigquAnj4GtYqebf7U6/G8mSMzjn3U4P4tnEkAqWA==
X-Received: by 2002:a05:6638:3a8:: with SMTP id z8mr6693089jap.111.1614639023277;
        Mon, 01 Mar 2021 14:50:23 -0800 (PST)
Return-Path: <flowergom@gmail.com>
Received: from localhost.localdomain ([116.42.185.119])
        by smtp.gmail.com with ESMTPSA id n7sm9925962ile.12.2021.03.01.14.50.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Mar 2021 14:50:22 -0800 (PST)
From: "Minjae Kim" <flowergom@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Minjae Kim <flowergom@gmail.com>
Subject: [dunfell][PATCH] bind: fix CVE-2020-8625
Date: Tue,  2 Mar 2021 07:50:12 +0900
Message-Id: <20210301225012.3130-1-flowergom@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

BIND Operational Notification: Zone journal (.jnl) file incompatibility

Upstream-Status: Backporting [https://downloads.isc.org/isc/bind9/9.16.12/patches/CVE-2020-8625.patch]
CVE: CVE-2020-8625
Signed-off-by: Minjae Kim <flowergom@gmail.com>
---
 .../bind/bind/CVE-2020-8625.patch               | 17 +++++++++++++++++
 meta/recipes-connectivity/bind/bind_9.11.22.bb  |  1 +
 2 files changed, 18 insertions(+)
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2020-8625.patch

diff --git a/meta/recipes-connectivity/bind/bind/CVE-2020-8625.patch b/meta/recipes-connectivity/bind/bind/CVE-2020-8625.patch
new file mode 100644
index 0000000000..9078f2448e
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2020-8625.patch
@@ -0,0 +1,17 @@
+Upstream-Status: Backporting [https://downloads.isc.org/isc/bind9/9.16.12/patches/CVE-2020-8625.patch]
+CVE: CVE-2020-8625
+Signed-off-by: Minjae Kim <flowergom@gmail.com>
+
+diff --git a/lib/dns/spnego.c b/lib/dns/spnego.c
+index e61d1c600f2..753dc8049fa 100644
+--- a/lib/dns/spnego.c
++++ b/lib/dns/spnego.c
+@@ -848,7 +848,7 @@ der_get_oid(const unsigned char *p, size_t len, oid *data, size_t *size) {
+ 		return (ASN1_OVERRUN);
+ 	}
+ 
+-	data->components = malloc(len * sizeof(*data->components));
++	data->components = malloc((len + 1) * sizeof(*data->components));
+ 	if (data->components == NULL) {
+ 		return (ENOMEM);
+ 	}
diff --git a/meta/recipes-connectivity/bind/bind_9.11.22.bb b/meta/recipes-connectivity/bind/bind_9.11.22.bb
index 3b4a299b36..e3b9cacc15 100644
--- a/meta/recipes-connectivity/bind/bind_9.11.22.bb
+++ b/meta/recipes-connectivity/bind/bind_9.11.22.bb
@@ -18,6 +18,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://0001-configure.in-remove-useless-L-use_openssl-lib.patch \
            file://0001-named-lwresd-V-and-start-log-hide-build-options.patch \
            file://0001-avoid-start-failure-with-bind-user.patch \
+           file://CVE-2020-8625.patch \
            "
 
 SRC_URI[sha256sum] = "afc6d8015006f1cabf699ff19f517bb8fd9c1811e5231f26baf51c3550262ac9"
-- 
2.24.3 (Apple Git-128)

