Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web09.19569.1621260882143286726
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 07:14:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=0HJBTiaS;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id h20so3217351plr.4
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 07:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=waOmwgEzLeuCi6iPJvsDM8m29TlJ/jIcP8KipXTYnAc=;
        b=0HJBTiaSMsLLRCBmw17sw5+imZtEAZblHrHtX54lnFI+FEMo3qcTVGmol/7W2qOICi
         Vmz/E8Lv1B3J+FSjAkGDueXp8NiMc6ApXZ3rT7B/16+IsuqKhJZzL3760n2yUZzdnkIi
         /M9PFhWDQ8kxyc3Lmq9SaLqnpBuZsznaLX9YblnWVV7YkqS5VfawqyrMGSD/gpMlXY0I
         omdwPsTse3K9TNSvOGeu4I9kMAMAbVBCPewrXWJ+sNsbj3Hb4BKJ9QqfODvljxSnRK9s
         t7OEBS5o8pfmCzJTd48JMQXHW4dTgtaM9YbEIseM++ney3Iijb3Lq830mPg7PivSfmHq
         bFog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=waOmwgEzLeuCi6iPJvsDM8m29TlJ/jIcP8KipXTYnAc=;
        b=h95WKkCgPFb3HjQyUatfx4XIymv3D33G9HWq3cRxPvjVeO09n3X2Px/fMhYZBIxvrk
         ZGjRwnYJ+5HvLSwsxrO5UxGLdguzpfHPoHkyLVJAOxnsD8/y9khBDEZPFMWU1h1ri8zJ
         M/c2A8SkP+47v6kyPkGWgbDHaPml8sCoWDdk6XZElx+6AUdgNTE2uMofHVal/CtAga1y
         0ReP8IfODARZNNS2SBeqDgNNuQ5OCL2STs/5trEeNSf0rphKTNmWmy5hZforhAhUVPwV
         XqRsNH2eXB9KxgsgZYriRGcNforYTIXWos71Xuf8RjfYZo42SvNTU72J7Y0wcYqDpE1o
         YAEw==
X-Gm-Message-State: AOAM5323nPPByuihM8gu3eL2GEDrdg5LZjZlGGPkJ5YEfyrvIGtYdJ3E
	mgzoqTDSAH5o2vV556guuxtnB20M8cO/Ix0k1I4=
X-Google-Smtp-Source: ABdhPJwokwGDDZJEZI5xe36Y7gdmlbumZqGTCNZMUnv6zCh6OOQjASIA3AKTPSmLH4sVX90kYvhkeQ==
X-Received: by 2002:a17:902:d711:b029:f0:b127:8105 with SMTP id w17-20020a170902d711b02900f0b1278105mr53434ply.20.1621260881297;
        Mon, 17 May 2021 07:14:41 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 66sm11292660pgj.9.2021.05.17.07.14.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 07:14:40 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 19/35] bluez: Exclude CVE-2020-12352 CVE-2020-24490 from cve-check
Date: Mon, 17 May 2021 04:13:25 -1000
Message-Id: <d7779a9d58b088ce078956af4fdc0325d8c03c35.1621260695.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1621260695.git.steve@sakoman.com>
References: <cover.1621260695.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

These CVEs are fixed with kernel changes and don't affect the bluez recipe.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 658902477840ea34d414083c4c79616bf5e999a2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/bluez5/bluez5_5.55.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.55.bb b/meta/recipes-connectivity/bluez5/bluez5_5.55.bb
index 8190924562..e5353bd815 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.55.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.55.bb
@@ -3,6 +3,9 @@ require bluez5.inc
 SRC_URI[md5sum] = "94972b8bc7ade60c72b0ffa6ccff2c0a"
 SRC_URI[sha256sum] = "8863717113c4897e2ad3271fc808ea245319e6fd95eed2e934fae8e0894e9b88"
 
+# These issues have kernel fixes rather than bluez fixes so exclude here
+CVE_CHECK_WHITELIST += "CVE-2020-12352 CVE-2020-24490"
+
 # noinst programs in Makefile.tools that are conditional on READLINE
 # support
 NOINST_TOOLS_READLINE ?= " \
-- 
2.25.1

