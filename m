Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
 by mx.groups.io with SMTP id smtpd.web12.9964.1614349501215771122
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 06:25:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=QOzXK9Pg;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.171, mailfrom: steve@sakoman.com)
Received: by mail-il1-f171.google.com with SMTP id o1so8103036ila.11
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 06:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=3Fq2HqejWXUNG48ECC7lVAldabwIHyyQ4Vdy9MLfa6I=;
        b=QOzXK9PgUFTMB/2lap0xtVVei5W2x419tsM1mPA2rNYOxlXdt87TrzDLBVU2TtfAi9
         m4/B5vXNGjZSW0Mo19Pj3hteqcl47M8Et7TZo3AMNR07r7qKwMNXtg6a7OK+AvDYLz3e
         XOBlMdmjNvFTUHdAecUV02zAsJKxdR6RuIBUA3oDmzxNFpcJ0XJvwmXBulu9rjuRhV7t
         QnwgVXvHfYn2cZzAj7JlTjb6x1Wow3oLpbD1+lOwA146dlqQMt/J4aYCtmAY7YSfgtjX
         Yv672e50r067bANaiG8phbS/pJ0qJ3XUYVbP4MNDHheh93Gl7oKL6UpxoiJclDW7pHzL
         hAcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3Fq2HqejWXUNG48ECC7lVAldabwIHyyQ4Vdy9MLfa6I=;
        b=YTveYq7MvLNDqce2TFMg0edNMqEb2r9wmcjfGruDWUEO0+dWT8YU2sZXhEhyd8Fs9K
         CGhzmFBJHROxPR94a2R1L0NRADXBZuEmKEsFLZhTjuAU6REMALunlyFoI78s9ScbLoUQ
         HyvU8k2D2uSdaben6USTNicfX0LrYXB8WNe08/wnONvnCbT0B1hbekAw0rKLXekv0d/6
         dhrl4AqwYaPiSHpmZEM0wTHBoYDK1o4t0A+MqtR+K3ra9kOu+CLxV07mhVPg570fj9IV
         Lf3tdXcFPqG+KzwsucmXXVAdSpgppaSgHS06er9gBMLslkj4rrV74f3tsJqLdyDOBDj6
         gQUg==
X-Gm-Message-State: AOAM5303hO1taYXR+rszks48omPmxtnSamWVC4XURclqDgjcLIj4zMRy
	3F5UswFfttqH/7gIsfcakVLYouFFfvwAocgw
X-Google-Smtp-Source: ABdhPJzjYvBapM5aFLYa1tZu8eqW2OL7/wIpy7QM7TuR+iXEvpV0UBHrZNug8hLG0Pv5FVN/aNQtUA==
X-Received: by 2002:a05:6e02:1a0f:: with SMTP id s15mr2746775ild.244.1614349500009;
        Fri, 26 Feb 2021 06:25:00 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id i3sm5383377ioq.13.2021.02.26.06.24.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 06:24:59 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/40] pseudo: Update to work with glibc 2.33
Date: Fri, 26 Feb 2021 04:23:44 -1000
Message-Id: <3bf3de8159c44c47a39104fdda5d63aab549269d.1614348990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1614348990.git.steve@sakoman.com>
References: <cover.1614348990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Update to a pseudo version which contains some heqader fixes for
glibc 2.33.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c897ac317926b132547578b1f6bd347fe5677dfc)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 0ba7b50355..0072e0558b 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -6,7 +6,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
            file://fallback-group \
            "
 
-SRCREV = "8317c0ab172db47dabcef909bae02cd77b1f1010"
+SRCREV = "f332f5633b5dd73fa2b6e5d605eb33e4a446d7ad"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.25.1

