Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web12.8726.1596639028438990920
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2020 07:50:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=n5Gf3T+g;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id p8so8457205pgn.13
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2020 07:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=baqiOpVUM2IIv0/pIR2n9Ckbgr/AJa6GlWjF6cOp/cU=;
        b=n5Gf3T+gTS02WrNAB1iiVzyIedPhQH74IWPoJWBbndZrMSwVTVoxAnFXdM6Zd1IKH/
         EyWhieyyBmszPO4rIVvGX1qbYJhYhV7p4Iz329OYsOeC3NDUfKY+4800tajFexoncNMS
         wEvN4wrCB6TbIuhqEWqaSj6+x3DDpIpsd3VaMjcNUMBceyBrdbzTwU6fi4JYLbail9SS
         /n2jVOR3MPubV+JQnEgFPIEnSwWCfVUDwb5PCAohzz7gouXNQ9OcfEvY4PNtYFDBZrWo
         X+itYwTlXJFLiC2j6PyPMJUbmAJp+jFpqdY4HZ8UUXl/DP/f6yfzwPKYcmxVFOo0FyHA
         OdCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=baqiOpVUM2IIv0/pIR2n9Ckbgr/AJa6GlWjF6cOp/cU=;
        b=RWci+cPfAwCZuMrUfDsWaVS8OUkuQkVxaeCHV5n05frBcMhdVLSb4L6pYvbbIlHYS2
         Jil88WgdeHiRGMjF5cW4LUnU254fmh5rnIsbPhpOQXsYfnU2EEmS1+cr5LyDWwHHTJOp
         ZOrM7jEXgmU64EK+8KZa3FhrOe885lnjaqAJFODsbGFhEcjElf2uk4hVKlrvxzXw3qKT
         /5i2w8wLmk+jstH/oMhXyxbW46rh+ON3LoUgDWnuMH62NIzLdlZ45nhbiPOOQsAWhEC+
         pjWiuuXk2S8n+bLfBa9V8+igEyWk50qoe9iO+8c4k1tt42hj0XKKT5PX8gWXuNrxiCqY
         sj6A==
X-Gm-Message-State: AOAM530MS//xW86DMWMKVlqidzvwUEYczKp05YTSNMs6qHXuBR/zHq0E
	36WQJ1twzTGhlzVmLirk8/NYuRtDgCM=
X-Google-Smtp-Source: ABdhPJzloIeMHTeJwmRmf56SjsyWDR9IwC7aIqPRS24RkeicXau5Do53ELmPblt1eJOlBsFMaefI7g==
X-Received: by 2002:a62:16d3:: with SMTP id 202mr3699927pfw.265.1596639027471;
        Wed, 05 Aug 2020 07:50:27 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id d81sm3879721pfd.174.2020.08.05.07.50.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2020 07:50:26 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell v2 10/11] glib-networking: upgrade 2.62.3 to 2.62.4
Date: Wed,  5 Aug 2020 04:49:33 -1000
Message-Id: <9bf1f323a955e2e923136f4e5a9193878dee1a8d.1596638643.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1596638643.git.steve@sakoman.com>
References: <cover.1596638643.git.steve@sakoman.com>

Bug and CVE fix release

Fixes CVE-2020-13645

Details of changes at:

https://gitlab.gnome.org/GNOME/glib-networking/-/commits/glib-2-62

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{glib-networking_2.62.3.bb => glib-networking_2.62.4.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/glib-networking/{glib-networking_2.62.3.bb => glib-networking_2.62.4.bb} (88%)

diff --git a/meta/recipes-core/glib-networking/glib-networking_2.62.3.bb b/meta/recipes-core/glib-networking/glib-networking_2.62.4.bb
similarity index 88%
rename from meta/recipes-core/glib-networking/glib-networking_2.62.3.bb
rename to meta/recipes-core/glib-networking/glib-networking_2.62.4.bb
index e9596ce1a4..b74532087c 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.62.3.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.62.4.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 SECTION = "libs"
 DEPENDS = "glib-2.0"
 
-SRC_URI[archive.md5sum] = "a758ca62bd54982a798b39c744cbf783"
-SRC_URI[archive.sha256sum] = "8ca1f86f23a76b5c7640624f7d5490705c78e81375e1741c9a1c41ce7f8f7ff7"
+SRC_URI[archive.md5sum] = "fad14a4a2cac73f0c2f9d426f1a9e5af"
+SRC_URI[archive.sha256sum] = "c18f289eec480fdce12044c0a06f77521edf9f460d16ad4213de61f2a3b294cf"
 
 PACKAGECONFIG ??= "gnutls"
 
-- 
2.17.1

