Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.26703.1592249789039163874
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2020 12:36:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=p05YKy3+;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id x22so8261372pfn.3
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2020 12:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=7ieUNxSW9799dmyzQcD3w9+2CBJYQPlguuhKQyr5uI4=;
        b=p05YKy3+Ao8cGW/YCgfAb2xd8ETNyuhKk1i/9p3OjGkEqR0mFK5ZWMyOpTQTZLJejI
         k73a6mRA3CtWLF1KwctZgV4BEDZZYJKspn5BmB+bn5umQ8NdKlzjk+Otnp0Edv1lBuTh
         Pj2PnZcwsJh/J6Jt0lu/1NGEuhqJNBogktZdJ5LgtmYLBjgC7A/UvecBeBFuuAYw8zby
         I3epCSZzLuOzSLP2XA+Qk91wgCfayAbIICmVZw7PzAH7CIFdmr+xDmfHrSlqOSER9OH/
         zX8GXHd+impMoD1bE/3u9YXRl6wXz6bBd5uTERA0B/LFQkMRDxPI6+8u1YtqZ/5Klfi+
         IGLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=7ieUNxSW9799dmyzQcD3w9+2CBJYQPlguuhKQyr5uI4=;
        b=AzBhUdcc2sy6g3XxD5HO39xFrLQZXsKgRXGSxw8TN7pnYp7ayBKWH5cokjvRG80Dog
         9bWlv7TtsgK4jqJpLcZQKRHlI2rmqPfzXGlRTqwTIZ67ra3Xpu/hKrWSEr7F5HsXpEmq
         dX5+e3g7jdIRwnrNXxhfkSfNs0xXvqKqLhR/xzWsIpdzr6jLBytxjJiK+sAyv9UfM9N7
         Kb+HLi/+HPt0IX8H1amrYYdHWuFTJc+d16aLKPQja8sXJg/zbgMGRJMz/J6+FQlSNLg2
         usqkvJNZhyE0M+cJ4fo3raXU1yy4APV/z0Gl6AdMP7byjSzGhLssCsvgLZYiL8JXGp5S
         67Jg==
X-Gm-Message-State: AOAM531ytoM3T2dkBL7o5aqajQUbe50WZS6nW+YX0zXOfzUZND9C5HZ4
	KvHQU7qDu8q6Dpn8WCW0leVXLOe1bWI=
X-Google-Smtp-Source: ABdhPJzuYe27uKyJdCsllWKhd7UPecg7ClsvJjHcQl/kzRNi8kpNgWRk9VXHp3d3Rokpw/n7DB6wgQ==
X-Received: by 2002:aa7:96ef:: with SMTP id i15mr24297598pfq.312.1592249788004;
        Mon, 15 Jun 2020 12:36:28 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id u1sm12405492pgf.28.2020.06.15.12.36.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 12:36:27 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/21] cogl: point to correct HOMEPAGE
Date: Mon, 15 Jun 2020 09:35:30 -1000
Message-Id: <cf7e02e8cdb3cc4cdb9f155c8bd16dece2805a39.1592249381.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592249381.git.steve@sakoman.com>
References: <cover.1592249381.git.steve@sakoman.com>

From: Konrad Weihmann <kweihmann@outlook.com>

As the previousy set wasn't reachable anymore

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3ae0aa1df25c8c7511950c6fc965955bdb205cd2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/cogl/cogl-1.0.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/cogl/cogl-1.0.inc b/meta/recipes-graphics/cogl/cogl-1.0.inc
index d8d06651da..1c5d0b79cb 100644
--- a/meta/recipes-graphics/cogl/cogl-1.0.inc
+++ b/meta/recipes-graphics/cogl/cogl-1.0.inc
@@ -3,7 +3,7 @@ DESCRIPTION = "Cogl is a small open source library for using 3D graphics \
 hardware for rendering. The API departs from the flat state machine style of \
 OpenGL and is designed to make it easy to write orthogonal components that \
 can render without stepping on each others toes."
-HOMEPAGE = "http://wiki.clutter-project.org/wiki/Cogl"
+HOMEPAGE = "https://gitlab.gnome.org/GNOME/cogl"
 LICENSE = "MIT"
 
 inherit clutter features_check upstream-version-is-even gobject-introspection
-- 
2.17.1

