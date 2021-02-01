Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web08.36646.1612196820352543339
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Feb 2021 08:27:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=xZv+6LtA;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.179, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f179.google.com with SMTP id w124so19381525oia.6
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Feb 2021 08:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=wLwrTPTmcrlP0NgzCblStRnTyeMAEGlyOx4KpuQkz3s=;
        b=xZv+6LtAVpXjk+SlO4njEpvr7P52wx4PE9YWkb5H1brZ94IOg/AADPa47bD19+heWm
         We9wUVE3ycdpqUJDpHdNtGLQnAtN7AM/cJ9/qxlZPOZTINDpze8xHjPNyZArZNKwlfpz
         NgScNHaxFEkPwqwGgaWDDLdLUTwVAiSb/mXbu/tucj5H7Nxd0orcINwi+lKSxSxz/Jza
         1PRxa8KJrki/vUR/AInqy6Fx+UblBOfp4pJmq3/jsxrG7xa3fhk4EFjLyuT/D6AMpo8K
         0U0WZQQA/gLrmMBRTFSqlVX3PnDOGmfCrUXJSIKoEC/nnPcYHSj2KsG9fg8sBKqJ/7NO
         LR5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wLwrTPTmcrlP0NgzCblStRnTyeMAEGlyOx4KpuQkz3s=;
        b=a08OxQR2mvYqmgVRGXnOqaebyWemdzketwmlwcAUMFzqE02W2mSSd12zzWtcwVfAAM
         CnjYStVaXYbcwcuN7b0sIW0kpCQdTw1q1WsNa4XvtH6/jH+uMTqfjPYFj1JQXViknA4W
         nmwRQictN1UFvdeBHsIZ8bJtyCwg4JD1YZiNZ6YV90Z+dUsKeT681U5ZTgb5+C2UYxGa
         7jSAPLcIGyG6pIDcCv6AbVb4LKPmGhVAGXSdzw5fcYDsXfxovuhJrfXDRnyvTkeJEM3k
         7mtvwIlLPvQ7u/3NlMgz6Ahjc3Wi8fiF1E/cyW8G2zSWubF5JRcPstQXcBARQ94Cs3u9
         /W3A==
X-Gm-Message-State: AOAM533gNNC5Xf1blePFuv4G0tLg+tA0n1T+ztWb/73mmgmRZgwOMZqJ
	HWlLTsw31hnGqLIT0jVsarRxzZjnsRxg8HtIpLU=
X-Google-Smtp-Source: ABdhPJw0V1IMixLdJJz1BRrjVZgHPcxrhjgrqRtqZjVdQtRVaEaAkJGXDaTMCcNr/mxrSx8DgrV/Pw==
X-Received: by 2002:aca:c7c1:: with SMTP id x184mr11221250oif.96.1612196819146;
        Mon, 01 Feb 2021 08:26:59 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id o16sm3980726ote.79.2021.02.01.08.26.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Feb 2021 08:26:58 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 16/21] timezone: upgrade to 2021a
Date: Mon,  1 Feb 2021 06:24:47 -1000
Message-Id: <4a219389f166229872c0213a6d31c94cc565269c.1612188857.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1612188857.git.steve@sakoman.com>
References: <cover.1612188857.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ovidiu Panait <ovidiu.panait@windriver.com>

Release 2021a - 2021-01-24 10:54:57 -0800

  Changes to future timestamps

    South Sudan changes from +03 to +02 on 2021-02-01 at 00:00.
    (Thanks to Steffen Thorsen.)

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ed9114df2086c4ad0544cf99c9c1ff8fb7b830b9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 9a19093e24..a89560b424 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2020f"
+PV = "2021a"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata \
@@ -14,5 +14,5 @@ SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "cfeeea2a7745164f64bd9f6d76e47916f4ac820c4434493674adbbd4324329c5"
-SRC_URI[tzdata.sha256sum] = "121131918c3ae6dc5d40f0eb87563a2be920b71a76e2392c09519a5e4a666881"
+SRC_URI[tzcode.sha256sum] = "eb46bfa124b5b6bd13d61a609bfde8351bd192894708d33aa06e5c1e255802d0"
+SRC_URI[tzdata.sha256sum] = "39e7d2ba08c68cbaefc8de3227aab0dec2521be8042cf56855f7dc3a9fb14e08"
-- 
2.25.1

