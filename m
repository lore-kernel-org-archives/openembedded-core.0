Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 158D8C433F5
	for <webhook@archiver.kernel.org>; Mon,  4 Oct 2021 14:21:14 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.10084.1633357272951541352
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 07:21:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Wl4t1sZA;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id y5so11221831pll.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 07:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=/+3izpQOEQ/0SOx6LbaESaQrLQLGjr0aIdKA+qH6+Ak=;
        b=Wl4t1sZAIDBRyaBf3ic4ks7CYX62w14XBtEkFRVp8fjy2GXSmEwrB+bcgW3aaEhLRf
         FKXP2XnylK3GLV2XzAU4GntUj9vm84MUO2pP0nNn/uShd/xONpXNpwbw1rT7yCLJYSg/
         FWvHEPtmqONbgf7B3LhKzL+qcl/rH9dC86SBKeJLqY6SPtPLjI/OsjBE4ZNE7ANc7OdC
         vNACg28rabmrZ4Gmw3qpSwWErD1eA1sZ4j/6XDOu6nn9HsTKJHkGoxL9svSOwxqc3mif
         K7NAOqHhZv8RruNKWTOWzs2+G3FAK6qln+OBxQvrncXEYxCLk+EZEUrWWhvaLwkhn6mC
         bK1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/+3izpQOEQ/0SOx6LbaESaQrLQLGjr0aIdKA+qH6+Ak=;
        b=KecKlDdJyeDi77/i64mdqOBrjXpQZfxZVNYhBUZ/43wIv2HlGodziFtYeYongx70pz
         s9EuQ3PZ8tE/SSS8TXcCia7H08M+91oDnumyY9QELZhbigzrLd6k9ToRIJ5mzUjcSg3c
         EnMlZ3ingJtz6yJHIsfJrtZy4fMHOBWIi/OSS3C01YyzpriPeLwTJM8dhjtkNoiPIRYd
         7rPAnSGN3w42vebgTW0Q7LjVsemePdj5WBxHdqHpnTRaaefyvDrvWwSBYoG3tJKfCiPV
         9Sk1EsXhebnDfJ+uvY44tJANSunqEIS33Wpt7aERxrDVIaNh//TB3qFVsTFz0Oehfgq9
         tBBg==
X-Gm-Message-State: AOAM531CXCFayZxeUUTM2dpb97DR3PWMGEGt+eVKGd2forsvEiwEYnA4
	yLlGOYqSdPHBsutbptA6cravYMVzPM0deIwNjcI=
X-Google-Smtp-Source: 
 ABdhPJy0AJojT0R/e6o7NEZ0FT7YSJMtUhlGqq2Ss1Ud8Yh1S6ldWgKMcjLbVl4WpeE/WPNcIDJe9A==
X-Received: by 2002:a17:902:b717:b029:11a:fae3:ba7c with SMTP id
 d23-20020a170902b717b029011afae3ba7cmr1723pls.28.1633357272062;
        Mon, 04 Oct 2021 07:21:12 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 t4sm8313066pfj.13.2021.10.04.07.21.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 07:21:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/15] common-licenses: add "Unlicense" license
 file
Date: Mon,  4 Oct 2021 04:18:34 -1000
Message-Id: 
 <7bba9d7061b14214e9392be414d87a111ea48c5d.1633356813.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633356813.git.steve@sakoman.com>
References: <cover.1633356813.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Oct 2021 14:21:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156599

From: "Robert P. J. Day" <rpjday@crashcourse.ca>

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7698f3145a9c48778d7bb79f54df169cf375349c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/files/common-licenses/Unlicense | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta/files/common-licenses/Unlicense

diff --git a/meta/files/common-licenses/Unlicense b/meta/files/common-licenses/Unlicense
new file mode 100644
index 0000000000..68a49daad8
--- /dev/null
+++ b/meta/files/common-licenses/Unlicense
@@ -0,0 +1,24 @@
+This is free and unencumbered software released into the public domain.
+
+Anyone is free to copy, modify, publish, use, compile, sell, or
+distribute this software, either in source code form or as a compiled
+binary, for any purpose, commercial or non-commercial, and by any
+means.
+
+In jurisdictions that recognize copyright laws, the author or authors
+of this software dedicate any and all copyright interest in the
+software to the public domain. We make this dedication for the benefit
+of the public at large and to the detriment of our heirs and
+successors. We intend this dedication to be an overt act of
+relinquishment in perpetuity of all present and future rights to this
+software under copyright law.
+
+THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
+IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
+OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+OTHER DEALINGS IN THE SOFTWARE.
+
+For more information, please refer to <http://unlicense.org/>
-- 
2.25.1


