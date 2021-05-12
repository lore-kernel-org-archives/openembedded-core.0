Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.web08.8331.1620831504278160781
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 07:58:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=kDbq2/L/;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.44, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f44.google.com with SMTP id s24-20020a4aead80000b02901fec6deb28aso4996241ooh.11
        for <openembedded-core@lists.openembedded.org>; Wed, 12 May 2021 07:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=WSffufEjTYMEZOHAzwMdUWJ20IJFShpKx624yLUQU00=;
        b=kDbq2/L/3hbKNW6V11wMgRt7p0ELmq7S6JydA870LWwluDuekanfpUbv8xJPczvwAa
         gLVxqnJ+2IgoOMBxEeqi9yQj8EMU5p1O2MHJdUgvHcWWUwDsqPkhTuC2uzkFUhSAoVkx
         3eHmCT0z0+RnKWHW2LCLJ1Vdpa/SNQF/FLi0eGk0W2toHEnFFR453+8YbQanAUyqz5s1
         ctRc8FOxFxcLw2eQp787xHnZqydLkjMgNmrFwNzguU6UZBgIf9NPtGbKINv+gqHq2TJV
         2hZ3yJktENbWMka5vzdsD4n87cloamDDWJ5EyOoJ7NjH2/L27Ejk9UEAO51EZHEfWGKh
         BUMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WSffufEjTYMEZOHAzwMdUWJ20IJFShpKx624yLUQU00=;
        b=Hy37DGQ2i1cspS8G6SqVNukY0PNeAPM6Sx3TvzFaeWZCAeOyt9TnqHrGjY40z0CDJV
         vZoY1khrchRydYPI/OCn3hWdtdnSCNxKDNemIWLqsyhOzLJFZWgrNYAqmQWSrkteIG2c
         D3yPL9Epdlp7i3S2Ik7ARGIOpwRGbJf80CdYuenoR+3wWWWuWSSSJzsDGQKdktQyU3bY
         X9QRn4aRrZ8OU8RyiSkEPPfZls6TNg7ZccidKqpPJadKERjn/uFiigOgNK7TAwDJnDme
         0E/8cCXI49bgWvz4v/4GUn+kl1WA1D36P0+mbRZ/yC7TCV+hqCzWypTCcfwjOWFUlVh5
         1/rg==
X-Gm-Message-State: AOAM532qx+aiwep9rmBpdE26y/8cn7y7kRTUdjVOCdYotPFOezw8/4vr
	2ACF3mw1q1kXi5RmhwdbVWEG0tVL8fsbTrUrEkY=
X-Google-Smtp-Source: ABdhPJxcF1s2X753mOfddwqc2Vdkz8sJNLSRGsymPdUj4JQTcPZoXDGpacdE9XwZ2682X0lL3zAEmQ==
X-Received: by 2002:a4a:7b43:: with SMTP id l64mr18665181ooc.24.1620831503199;
        Wed, 12 May 2021 07:58:23 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id 21sm1678otg.4.2021.05.12.07.58.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 07:58:22 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/22] qemu: Exclude CVE-2017-5957 from cve-check
Date: Wed, 12 May 2021 04:56:48 -1000
Message-Id: <5efdb71b4c01dfa6fde92427e9e85c58cbc1d9ec.1620831171.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1620831171.git.steve@sakoman.com>
References: <cover.1620831171.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The CVE applies to virglrender before 0.6.0 which we don't have.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9b5355375d028577de0b98e05992de6a088cb972)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 7647e44726..86abd5ea49 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -61,6 +61,9 @@ UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 SRC_URI[md5sum] = "278eeb294e4b497e79af7a57e660cb9a"
 SRC_URI[sha256sum] = "d3481d4108ce211a053ef15be69af1bdd9dde1510fda80d92be0f6c3e98768f0"
 
+# Applies against virglrender < 0.6.0 and not qemu itself
+CVE_CHECK_WHITELIST += "CVE-2017-5957"
+
 COMPATIBLE_HOST_mipsarchn32 = "null"
 COMPATIBLE_HOST_mipsarchn64 = "null"
 
-- 
2.25.1

