Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web09.8401.1626358128249208135
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jul 2021 07:08:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=q+xF+Zk2;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id y4so5332327pfi.9
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jul 2021 07:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ODa3hTjmqtnjcvi88o6rp31oJI10Y/fPkt/x9n8pW9k=;
        b=q+xF+Zk2lBP0grvIkKTgb+3BitMwOadA2/LmhCDZVePpVR5wilDMgAF7tAMnaZ5GuU
         DXZ5e3K6J46L4iSzX9Q1IFRQ7wDqtYDm031SFaYaP44PVAC3dbZMgL7sIg5abGq1Um8g
         e5MIbJ8R9TDItXasJ5J4x3zYUZGOne3I7H22FSpaG6ATAthBZT6OepTdNrasfY6rYwXu
         YxZW4Sc5Y3D7Jsykg2q/0DtZsumLvx81EBCV0p+BFdmEuqQumckhdwfKpBPV5jtZP0ES
         lUAMctCJvdYKaOuzNC++HywNr3RaV03KxcMBRwZvyUjcnI61XcbyJB7C0xFHFxI5SrXu
         zMHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ODa3hTjmqtnjcvi88o6rp31oJI10Y/fPkt/x9n8pW9k=;
        b=a0B7uxwmEt/v+Tw1vOgsBoGLGvSaEWu5M7uYVz/s8uQh+136eThiB7SFzX82iEAytV
         cAwqKoYz1uAE3SJzsKqVju2iMoLGk/xJe5GNOt8Wnw+siHe01G1oBjm8n0RoNLwUTlJr
         D+EJEASy5aZqWXQVBhOIhKkq/K8Ko5W95ZBP8DMVx7HlBZbwYzrKZXgJvao6hkNsFoUU
         jrvT9k03iqjE+qepP1VtHMo1OsE7/vdprMptc3n8wDWjrtgxxYpRJWe3ahMLaPUx6JkM
         BBh3KsOlqNfUR/rMzZMFIT1LLOqQ6+kEuJehNDkA/p1V78WdYc46ptU49R5djFcCeBgv
         z61A==
X-Gm-Message-State: AOAM533Vr7SeTXRjI97SymVAW+IlXux4sVtsYR3W8yBShTTXiwoqVP7m
	SXRhNcmKrCdP3ECCmulcZSbufDFinFK0ah/F
X-Google-Smtp-Source: ABdhPJy8WTmkJ1oSenL3hDiu0sZKvRjbfwmb9Ytq8VFdOQzrgu4zTMvElfru6I4GKPyfPIh9bpE9Nw==
X-Received: by 2002:a62:b616:0:b029:303:aa7b:b2e0 with SMTP id j22-20020a62b6160000b0290303aa7bb2e0mr4794228pff.21.1626358127381;
        Thu, 15 Jul 2021 07:08:47 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id u185sm6915353pfu.49.2021.07.15.07.08.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 07:08:46 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 6/7] sstate: Drop pseudo exclusion
Date: Thu, 15 Jul 2021 04:07:24 -1000
Message-Id: <d7e87a5851d717da047f552be394d5712efa0402.1626357703.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626357703.git.steve@sakoman.com>
References: <cover.1626357703.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Now that pseudo-native always includes statx support and we have sanity
checks on pseudo-native to ensure it always contains a minimum feature set,
we no longer need to mark pseudo-native as distro specific. This fixes
eSDK build problems.

[YOCTO #14428]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3279e43fcb469edb63c7c4eb60fdc565d5751f9d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/sstate.bbclass | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 9ed0e0c139..0a25e3ed9d 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -123,8 +123,6 @@ SSTATE_HASHEQUIV_REPORT_TASKDATA[doc] = "Report additional useful data to the \
 python () {
     if bb.data.inherits_class('native', d):
         d.setVar('SSTATE_PKGARCH', d.getVar('BUILD_ARCH', False))
-        if d.getVar("PN") == "pseudo-native":
-            d.appendVar('SSTATE_PKGARCH', '_${ORIGNATIVELSBSTRING}')
     elif bb.data.inherits_class('crosssdk', d):
         d.setVar('SSTATE_PKGARCH', d.expand("${BUILD_ARCH}_${SDK_ARCH}_${SDK_OS}"))
     elif bb.data.inherits_class('cross', d):
-- 
2.25.1

