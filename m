Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web09.8173.1620831509569995174
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 07:58:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=mGg0o/2Q;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.174, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f174.google.com with SMTP id v22so17626928oic.2
        for <openembedded-core@lists.openembedded.org>; Wed, 12 May 2021 07:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=OJyx6xJhLla1jk7yvW+D3jWFdmc1gBtKQ9hK7S6o0pY=;
        b=mGg0o/2Qy549FgQywTrPbwMdG+MP+oV1ZP7bSSxu2F8rMlC48868DfEttUw017g6j3
         H6e7l8aPU8BHE7CO5/8bKNLwSgnO/45CfdR6HqsrGne7VgHpHjU+5ImXo+j4eLR699Cr
         PMTsQn9M4lhPGMbgaRyxAO7M98FE50TzfKrcUyIkJ3JnJKjIDBUuLj0Q/vBnoG4Ol7xm
         W/+kJGVAei9J2rV+hDuSj/DJ5eQKyL3Vk5avTwbd9ABusZcQaw6uFTiZl2d3thGio/Q3
         DeyG3atctRujchtXK751ZNVzS5qD90B824oUfXBPxK3QiS5z8hcXHmk23Pg1qc3NMyVl
         N1qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OJyx6xJhLla1jk7yvW+D3jWFdmc1gBtKQ9hK7S6o0pY=;
        b=fu7lXnArrr5DdSASvW4t9hdpMbEwrw/8Pgp8EuIlkCKilkBgYuKMyrT43akbqfJP8S
         mp3DWoGCX4trYwVpo7lrw/lhAnh+/+0cmI5EkakP+A01bWvn/RZ/RTmD9bC/4Jgr7YXz
         AQIHYcJcU/CecEgdt4W6YI2qHW+JPt+HxfWfDSQFLvNcK3L4aflx0l6U7BTmPEJZCh2D
         ecN2NmWwJpGb2UGnVEpIeoU+cVToLlRrfe/zUtJybaNvrwGlQRdnnlI1h8E2Hp1cpgwn
         agUvP+w/u9/RF1D1EMWc0osM+dflHovxbSk2RxHHfeolxtoa+RUniQqqrgAgZV6HTIIR
         ESUw==
X-Gm-Message-State: AOAM53244j8U+oUYhEYT7taMw+31z2j6F5rJVXT+VFsSjFJXrVvcEwBW
	dHHq8zolEwW9PmbwVtSYXPZqbfQaPxNQ4F62EhY=
X-Google-Smtp-Source: ABdhPJyRSxy0ziRIbCn4fJkK9/2Fb0zHxJLScJVbipuDHJ2STrbhjFcZtfu0haTxkBa/kS7WYwJJ5Q==
X-Received: by 2002:aca:a9c4:: with SMTP id s187mr26636883oie.47.1620831508510;
        Wed, 12 May 2021 07:58:28 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id 21sm1678otg.4.2021.05.12.07.58.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 07:58:28 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/22] qemu: Exclude CVE-2007-0998 from cve-check
Date: Wed, 12 May 2021 04:56:49 -1000
Message-Id: <a424454c935e2fbb3a4c596dda4855ddcb4e8af1.1620831171.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1620831171.git.steve@sakoman.com>
References: <cover.1620831171.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The CVE applies to the built-in VNC server but we don't enable this by default.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d62b9974a5f3a0f462434ce2763c28a4b4bbcfc6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 86abd5ea49..396ff1c5eb 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -64,6 +64,10 @@ SRC_URI[sha256sum] = "d3481d4108ce211a053ef15be69af1bdd9dde1510fda80d92be0f6c3e9
 # Applies against virglrender < 0.6.0 and not qemu itself
 CVE_CHECK_WHITELIST += "CVE-2017-5957"
 
+# The VNC server can expose host files uder some circumstances. We don't
+# enable it by default.
+CVE_CHECK_WHITELIST += "CVE-2007-0998"
+
 COMPATIBLE_HOST_mipsarchn32 = "null"
 COMPATIBLE_HOST_mipsarchn64 = "null"
 
-- 
2.25.1

