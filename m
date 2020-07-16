Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.3356.1594933701772945232
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2020 14:08:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=e7PgFfcs;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 17so13068302wmo.1
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2020 14:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=fa/M1/Jz/ppZRgVr80gw3Vpu4a5+GN6NfTBstYB92rY=;
        b=e7PgFfcsGJ61dZrQFkdVVYyk3JD051SbxNRUs1cTv+aB35do46vm15Ty51kbeLVl1i
         85/a9zFrP1KGxFfsFTxYMVc9c9WRCo9pFam/MHSNpHSrMBPhFHWW1MPy/O/mVG8xloR9
         oir5BcCcMJ02xcPzfitfmBAjcs7h0QpyJu28s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fa/M1/Jz/ppZRgVr80gw3Vpu4a5+GN6NfTBstYB92rY=;
        b=b6hiAdRrbriIbRr/bLQ8W0hPL0CGm3oTa6rlJWsuzskEshSGApE/mXhySMbwJVZxfY
         t9cWaz2f+6B7mHvwZV9GLLgYkwzMot7MvJqrF578r4dhtnhxBPar+NW+xUph8WC0f6ii
         A4RTSEpz1IBu11J/rWnBO0OIVh75bBfPhIFZZfO4Z/jKourAc0O4Smykt6pYVzqVgWlb
         OAWPFJpM/SW6AF5uSD7Fi8eqY9LHC/6Sn7f+lyblCJuv8nmgJB0ZwweNDCbpHwVN5Iva
         RSHWXMRmQ2HUyLVUy1IMZgu8i8eMo+J/BuSFN3NVWJ49TCPfMRaCBzfeZ3I88fomd8E8
         np6g==
X-Gm-Message-State: AOAM53123pWM/AJzRx/POLvwFFDrMhi9T6pBQ0F6KKqgsBesqreU+Jfv
	WBdTQ+IOE7J9VghxpWugGMgC6iPhDDmMjQ==
X-Google-Smtp-Source: ABdhPJyNWH85lJbRto9tZXolQ2w5NZ43/hxKqUQ4t8nSWNYrgbaruyNrQMQV/FV7iy16yfMW/vbdWg==
X-Received: by 2002:a7b:c116:: with SMTP id w22mr5773057wmi.97.1594933700049;
        Thu, 16 Jul 2020 14:08:20 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (f.2.4.2.d.8.4.b.f.c.c.1.d.5.4.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:b45d:1ccf:b48d:242f])
        by smtp.gmail.com with ESMTPSA id r10sm10952034wrm.17.2020.07.16.14.08.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 14:08:19 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/20] libnsl2: upgrade 1.2.0 -> 1.3.0
Date: Thu, 16 Jul 2020 22:07:58 +0100
Message-Id: <20200716210808.7438-10-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200716210808.7438-1-richard.purdie@linuxfoundation.org>
References: <20200716210808.7438-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/libnsl/libnsl2_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/libnsl/libnsl2_git.bb b/meta/recipes-extended/libnsl/libnsl2_git.bb
index 28c84af7adb..badb71d9774 100644
--- a/meta/recipes-extended/libnsl/libnsl2_git.bb
+++ b/meta/recipes-extended/libnsl/libnsl2_git.bb
@@ -10,9 +10,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 SECTION = "libs"
 DEPENDS = "libtirpc"
 
-PV = "1.2.0+git${SRCPV}"
+PV = "1.3.0"
 
-SRCREV = "4a062cf4180d99371198951e4ea5b4550efd58a3"
+SRCREV = "fbad7b36acaa89a54023930af70805649f962999"
 
 SRC_URI = "git://github.com/thkukuk/libnsl \
           "
-- 
2.25.1

