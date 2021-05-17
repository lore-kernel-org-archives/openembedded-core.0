Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.19355.1621260863226518095
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 07:14:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=QP+x2nBn;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d16so5014014pfn.12
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 07:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=OJyx6xJhLla1jk7yvW+D3jWFdmc1gBtKQ9hK7S6o0pY=;
        b=QP+x2nBnNyJ9EX5ylr1a4BCRT4s5EdE/Byld7U3vAJdGSNFlimgCWqrl/Xf3gCG2KQ
         i6JSlIjuJQy9vv+YVaDZMaDJO92YlA9w2HmvbDS1W0ZzeBqhZ0t8oQ/b42uovAGQpumt
         1/eTe1WykdzneyH13wjCvvPOLfZ9HQMt25OfY4MJMAyBzE3++Tz8umz7mwWuaMfBYMUm
         FaqW7hnYLKrE/sVylLSSAd0YTvKu8EfWIREq3NTFLWHk5Dg+noa8ZMc/n0iTHOv/t2Zs
         pT3zy2PCEtVwkLOGgy/n9MVfS9lqmzr0d0k0feWGXVBXFTwAVIoV36qDlTZ/+8bXj2HH
         pDXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OJyx6xJhLla1jk7yvW+D3jWFdmc1gBtKQ9hK7S6o0pY=;
        b=oO6g+zyF26WIXvN63wlYh5fU9ZJxHQPz7t5zqyIhozi2l5VuhriAY8XJOeR7KNwzVu
         lvofLLq4QemALlJNKSgV5jiSVL0VdiFTyzPp3+uPXNi+TywVgEGoMCv7OKwd7jgO7kWI
         MpOd6pQnkq1miL8YNCT7bj4iIquzjuwiPtP5YRZ1uLgF98TyRGLz+3TD90V5A1VGWoEV
         /rjXbEtYqeDs8IUoYb04CXDmhFD2jFFAxpxGGe1kPZhkV0cUVr8Zkjpb+ATMWsfqoMli
         atxir6IaVFN5fvfdNFoTWXkymUw49UTmiKCMMUOiG9y5+Wx1R05YR5MeiAKEWRjqvj9L
         fxlw==
X-Gm-Message-State: AOAM533HUDPmGAFWjLPFFSJJoZmHip9U/kY3clDSBDfA3Mhh2DQJXb0a
	r57zA6VOYpJMwGKRKGyJYpovyCqhRZTAvSZjeEA=
X-Google-Smtp-Source: ABdhPJwkLVeGdWRZFFRJJ+2QOUYp5Xg35DWk9gwoPZec9nMwxIphzFrSf768phICwHsu6CpduBbJ1g==
X-Received: by 2002:a63:4706:: with SMTP id u6mr61127456pga.152.1621260862382;
        Mon, 17 May 2021 07:14:22 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 66sm11292660pgj.9.2021.05.17.07.14.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 07:14:22 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/35] qemu: Exclude CVE-2007-0998 from cve-check
Date: Mon, 17 May 2021 04:13:16 -1000
Message-Id: <f0e0787265d9d8bd01629f2b56a0eb57d950c037.1621260695.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1621260695.git.steve@sakoman.com>
References: <cover.1621260695.git.steve@sakoman.com>
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

