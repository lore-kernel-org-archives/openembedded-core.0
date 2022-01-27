Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE1FBC433FE
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 03:55:41 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web09.23801.1643255740799989993
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jan 2022 19:55:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PHup6NkR;
 spf=pass (domain: gmail.com, ip: 209.85.222.173,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id o12so1541946qke.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jan 2022 19:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=T410Ct5yRyAgSyrxOf5ljnsJseAp3YP2NJRJsmIU4m4=;
        b=PHup6NkRix3tr/e17pn48UsxMgdLWujqnQhuwoimeEJnvWudBIgLE5aABX4ibSFfFn
         +EW64KtovesPbxsw2dRrIponhg+aL3y2QT9KG668qdmZ5titxKi4YOOtwb2fChRS+hkZ
         OW3yQl0la8C7dL3hxMjz4/t3ZgFNJcVyT1tgSqOgLYL3wQsIApD0Mfw/wo8RewgED/3U
         YQfXrlCczTthEyx/eNrWMCtU8vwuFFJX8e1qfVcXjiPQ+M2Zw3g3TiEqbjeQLY/v4aPt
         Pe57Zc7lJiFXZYXfCJ3EgKoTRZkL730TEOITK4D/NMsoKTZrZbw5nOrdmVcMkcIYnxwy
         qPhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T410Ct5yRyAgSyrxOf5ljnsJseAp3YP2NJRJsmIU4m4=;
        b=YUUB5kzjco8dYrPSca5IFXMo94icyqK+vZTDF5HKAU4+eoIaqX7NC+oBxQEXhAmb7H
         lcpIfB5g+4TnVjtu28EYVJJsL48BDmiV4fnJBfKEcqFnTwWG6/F6SiY4HL4vjlFDI5LC
         E9PUnNlyAwvhKcx/3RjuhYmbJSDTKdw3qEKIHm0i2LRN8w33KxFdL72rOEXZytIMSAly
         VNfK5CGImEQWQ1roBilQJbS7a5inkAt6XG9miXgshc6e8D6q4kri99uU3XqHetP65LgI
         4oUIMnVr9R6rs5Q8WC1esqkL0oHf5fxznB0RE4De3YlyNrzGhejI1PjT3u1+4O5bj72j
         dngw==
X-Gm-Message-State: AOAM530VZFFHPbgkcmNt0whdn9SqSeybuDtgH+9fK3///WkeO4EuJEBq
	sFpYuap3TqDUQLcugWL0Kps=
X-Google-Smtp-Source: 
 ABdhPJxrwce/UbtB7rWmKhvefgEUTKJBzoumyMVB8Q9pniLDbv9t+JwmovEK7K0DfX5KkRuDrfU6hg==
X-Received: by 2002:a05:620a:31a2:: with SMTP id
 bi34mr1363074qkb.73.1643255739951;
        Wed, 26 Jan 2022 19:55:39 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id m6sm639405qti.85.2022.01.26.19.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jan 2022 19:55:39 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/6] linux-libc-headers: update to v5.16
Date: Wed, 26 Jan 2022 22:55:31 -0500
Message-Id: 
 <a69799c9d0c8e3f8f13c91a4abb77be152ae5978.1643255467.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1643255467.git.bruce.ashfield@gmail.com>
References: <cover.1643255467.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jan 2022 03:55:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160999

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Bumping our reference headers to 5.16 to support newer kernels (-dev
in particular).

No issues were found in glibc or musl, and no patch referesh/drops
are required

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc                   | 2 +-
 ...{linux-libc-headers_5.15.bb => linux-libc-headers_5.16.bb} | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_5.15.bb => linux-libc-headers_5.16.bb} (81%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index b8b2e7cbf7..161142cec5 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -21,7 +21,7 @@ SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.37%"
 GDBVERSION ?= "11.%"
 GLIBCVERSION ?= "2.34"
-LINUXLIBCVERSION ?= "5.15%"
+LINUXLIBCVERSION ?= "5.16%"
 QEMUVERSION ?= "6.2%"
 GOVERSION ?= "1.17%"
 # This can not use wildcards like 8.0.% since it is also used in mesa to denote
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.15.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb
similarity index 81%
rename from meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.15.bb
rename to meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb
index 588cc3acd1..c64629d094 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.15.bb
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb
@@ -14,7 +14,7 @@ SRC_URI:append = "\
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
-SRC_URI[md5sum] = "071d49ff4e020d58c04f9f3f76d3b594"
-SRC_URI[sha256sum] = "57b2cf6991910e3b67a1b3490022e8a0674b6965c74c12da1e99d138d1991ee8"
+SRC_URI[md5sum] = "e6680ce7c989a3efe58b51e3f3f0bf93"
+SRC_URI[sha256sum] = "027d7e8988bb69ac12ee92406c3be1fe13f990b1ca2249e226225cd1573308bb"
 
 
-- 
2.19.1


