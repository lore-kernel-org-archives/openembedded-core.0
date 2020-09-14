Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.62243.1600092773154499055
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2020 07:12:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=dkCVPNCU;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id d13so3422232pgl.6
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2020 07:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=/zzXkdhiOUd8xUQRNVLzCYbdASfKRtQ+WIPb2LQAL10=;
        b=dkCVPNCUztB9GL8GLLXxVZdRYwqy9cbIiPPjYbY2iOD4FgoZ1mk+3STzSC7yzrYEwr
         a5AMlZvGDlOUgFN8YckaSOt6UDZe/tkJa7q4nb0I2cfyzJaE+Wd5VuXrK9kMttp7yJNe
         5rjlZtDq/481cLH3TM66IwG/ShByCnZNhs0hyoe2PqQ1MyqPRepmfZkL8Qo9REyGIksM
         FJ8XUkgd3Zh9UYstyrVj74ujp3Jn3m2NMBgFr9MMXnFY5dmPVG+ZKcbTmod0+wJqrB6i
         Wad9XV43BLDV0xPmVubI2kYDqjC3eZYwKkLf3AnywYZ4Dq8d7FwvPNL8qRoyqxHjDG43
         evqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=/zzXkdhiOUd8xUQRNVLzCYbdASfKRtQ+WIPb2LQAL10=;
        b=P256uExeK4Otf3MOH4BqjMiFbWCYvXTnDdd4PSzzFRd6ehFPkGwdNxXMGfGMjCKYwg
         9KaVBfUMWLjCi/BQEN+0aHknYtasuuf2gqGJeixmc6uXBSmvgoVuRBsaA+tNDOkZLP/S
         qOXZU3/6VECS9yMvW41ErXBeb8smClgSxmPKHKybMcNps6wnkdaswcpJ1L1ej+qTpgMP
         JNwgL2br5ErFYf3lopqpif2RjGUK9fA17ARIJenf8sJzn9MUM31qKXoHRnlwFN4rjnPO
         BFqn22+M5Iw9j3v8sc8gINtt53SYmGYo/MQ5eipE1/dAOzDWjqlECR40uaYWaimmB+7k
         niEg==
X-Gm-Message-State: AOAM531ECTlWeVBujnfxSu9uqNvkCct06H/PxTi/D/RIDeWbeWIEJSa3
	EZOcNl0ayePYlJvcDGSGCNxgs0L0gyaMuHur3xs=
X-Google-Smtp-Source: ABdhPJzR1zXvry+ve0kHs4ocFmwekOkMOf/MTCr16tVizu+G71l00i66OdxopIxbhkVubPeROsVKJA==
X-Received: by 2002:a17:902:a9c6:: with SMTP id b6mr4977350plr.6.1600092770831;
        Mon, 14 Sep 2020 07:12:50 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id z22sm11053183pjq.2.2020.09.14.07.12.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 07:12:50 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 19/24] libxml2: Fix CVE-2020-24977
Date: Mon, 14 Sep 2020 04:11:37 -1000
Message-Id: <41e662d3612b870eac392bce841a9efd70add47c.1600092418.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1600092418.git.steve@sakoman.com>
References: <cover.1600092418.git.steve@sakoman.com>

From: Ovidiu Panait <ovidiu.panait@windriver.com>

GNOME project libxml2 v2.9.10 and earlier have a global Buffer Overflow
vulnerability in xmlEncodeEntitiesInternal at libxml2/entities.c. The issue has
been fixed in commit 8e7c20a1 (20910-GITv2.9.10-103-g8e7c20a1).

Reference:
https://gitlab.gnome.org/GNOME/libxml2/-/issues/178

Upstream patch:
https://gitlab.gnome.org/GNOME/libxml2/-/commit/50f06b3efb638efb0abd95dc62dca05ae67882c2

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 92dc02b8f03f3586de0a2ec1463b189a3918e303)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libxml/libxml2/CVE-2020-24977.patch       | 41 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.10.bb    |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2020-24977.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2020-24977.patch b/meta/recipes-core/libxml/libxml2/CVE-2020-24977.patch
new file mode 100644
index 0000000000..8224346660
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2020-24977.patch
@@ -0,0 +1,41 @@
+From 50f06b3efb638efb0abd95dc62dca05ae67882c2 Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Fri, 7 Aug 2020 21:54:27 +0200
+Subject: [PATCH] Fix out-of-bounds read with 'xmllint --htmlout'
+
+Make sure that truncated UTF-8 sequences don't cause an out-of-bounds
+array access.
+
+Thanks to @SuhwanSong and the Agency for Defense Development (ADD) for
+the report.
+
+Fixes #178.
+
+CVE: CVE-2020-24977
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/50f06b3efb638efb0abd95dc62dca05ae67882c2]
+
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+---
+ xmllint.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/xmllint.c b/xmllint.c
+index f6a8e463..c647486f 100644
+--- a/xmllint.c
++++ b/xmllint.c
+@@ -528,6 +528,12 @@ static void
+ xmlHTMLEncodeSend(void) {
+     char *result;
+ 
++    /*
++     * xmlEncodeEntitiesReentrant assumes valid UTF-8, but the buffer might
++     * end with a truncated UTF-8 sequence. This is a hack to at least avoid
++     * an out-of-bounds read.
++     */
++    memset(&buffer[sizeof(buffer)-4], 0, 4);
+     result = (char *) xmlEncodeEntitiesReentrant(NULL, BAD_CAST buffer);
+     if (result) {
+ 	xmlGenericError(xmlGenericErrorContext, "%s", result);
+-- 
+2.17.1
+
diff --git a/meta/recipes-core/libxml/libxml2_2.9.10.bb b/meta/recipes-core/libxml/libxml2_2.9.10.bb
index 097aceb2c0..4ebfb9e556 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.10.bb
@@ -22,6 +22,7 @@ SRC_URI = "http://www.xmlsoft.org/sources/libxml2-${PV}.tar.gz;name=libtar \
            file://fix-execution-of-ptests.patch \
            file://CVE-2020-7595.patch \
            file://CVE-2019-20388.patch \
+           file://CVE-2020-24977.patch \
            "
 
 SRC_URI[libtar.md5sum] = "10942a1dc23137a8aa07f0639cbfece5"
-- 
2.17.1

