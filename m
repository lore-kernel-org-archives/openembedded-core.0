Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F29CC4321E
	for <webhook@archiver.kernel.org>; Sat, 26 Nov 2022 14:15:16 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.70811.1669472106369233751
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Nov 2022 06:15:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=eG8UYk89;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id 9so6453807pfx.11
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 06:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wBcjFuTSdugV8+I5dcNqagfWQlu4t9DWYMzYzWw+omk=;
        b=eG8UYk89k/uDwBsxDM/wOvZoDoUD0UGopw9VDyGsC0eSKBMecuxIrB/uHpAGHVCXWu
         NlgLzcL2Zk3i3IHgXMLRjne3Y7P6CEiAPINHpKMWRf+/PKnBljUrNriimd3XctMdrE55
         eXyal3SakITWRezXsMmmeYldBXriQsG1tGI+kOJ+MNudMEGvbJzYIEat13/5J9AB+6Uc
         jHMIhbb9wLEeITTGpPgajb/+IWPxgLslptooMBEvaLEkr5zsqCRdlBpyXMmiSHlUWa2M
         IaXGssxSHt9REK8RN5K65UJ2EQhR7kIv+imVd23zC+rcBz7N5FP/fuWAK8NX9a3nPxN2
         EUDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wBcjFuTSdugV8+I5dcNqagfWQlu4t9DWYMzYzWw+omk=;
        b=kpXFeA5KvQMdhfJQTqXVWNafh7zqCug+lbxoPirtmPNLC96RsiG3uveOl+BP2MHfWj
         fnHWYqcX8Bu84mOgNeCb+//Mr+O65yu5NlVi1CseykXlWCe4ywZQ1G6JTVNyU0+HuCgU
         0GJhgr3Th9sV1yrFUROB/pcOetaO5Rce8+wVB117kkLbHNqC+dBQ6ltO0PLXRcCzX8Fb
         n3Fhi/x7AjyIR46fhUrveOIlw/m5nrvT1y1Nscdg1iA4ATpt/ro0FxdL5RP2DJWfmZTb
         Wzt6Cgx/tnEhX51aWWegT3/AmhFp6K1L3u1JUqIqvtZ4zin0q7Nh2C3hPr9tIiig+Kqq
         hrIg==
X-Gm-Message-State: ANoB5pkJbyVkkdJdJ06zgKex1nxAsvlvvnesbziWt7nbqwimGx0wbGny
	sgcB5+AM0ojXV97iX5qOZsBLtRzuKhCVow+55Vo=
X-Google-Smtp-Source: AA0mqf6PaA8PaBq9bwWpqUSAmq4SapGRjKTJDQeczVVon+x08mG+nHi4A+3Syku5jncyzeQB0otViw==
X-Received: by 2002:aa7:8b4d:0:b0:56c:411f:b699 with SMTP id i13-20020aa78b4d000000b0056c411fb699mr23239459pfd.48.1669472105321;
        Sat, 26 Nov 2022 06:15:05 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id im22-20020a170902bb1600b001895f7c8a71sm4649177plb.97.2022.11.26.06.15.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Nov 2022 06:15:04 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 04/37] xwayland: upgrade 22.1.4 -> 22.1.5
Date: Sat, 26 Nov 2022 04:14:08 -1000
Message-Id: <c486dd07b937c6aeb08eaa26aab125a077dd180a.1669471990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669471990.git.steve@sakoman.com>
References: <cover.1669471990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 14:15:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173797

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 48ca760427f14ae291bf2ebf6f93f8d0fb27e3ab)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xwayland/{xwayland_22.1.4.bb => xwayland_22.1.5.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_22.1.4.bb => xwayland_22.1.5.bb} (95%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb b/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb
similarity index 95%
rename from meta/recipes-graphics/xwayland/xwayland_22.1.4.bb
rename to meta/recipes-graphics/xwayland/xwayland_22.1.5.bb
index 8597d07a7d..c1c5407dee 100644
--- a/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "5c39bdd77444c3fa7a0e2ef317ae69ddde89a901dc8914dbc8eac39a9313512a"
+SRC_URI[sha256sum] = "e317ac1f119f8321654921761420901e4abd95585a8c763ce26af3b045ac1672"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
-- 
2.25.1


