Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web10.8134.1630503942052310963
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 06:45:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JJkXeRuf;
 spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id c79so3733306oib.11
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Sep 2021 06:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=C9GmVE/qaDYvJ9atty+EK6rLo3ihPOpKlrKGazM6lR8=;
        b=JJkXeRufmh0aa1PjLuTy+chInMl7wI+ut+/kC9qOjR8vv2Om4PPJfVMVpVjZAdrwtP
         A1kfo+fp/SBcFnSDOgHeBFds22cPtxU/miu0XDU2+r8H2z4VhhKRvioqhtwPQTMU/jG1
         BtG+hRDGj54rvxUa3dEp/VhnAsVUnAcGvv0BUZSqdsN/lDglzyYXW91BRqwDpdlFYA90
         E+OW/+PhoLEIwZpvsG03kLvWlu8hpBW3jNXPs4F0QaP68a2jDOCqMnjlPEst8L1zv/qE
         IpYT8AsWLKgRYcL2LvakCMv305/ZKEjehGMVQfbjOEYaqYLCTYhcFgefNsQNFFq6BoGN
         v7nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C9GmVE/qaDYvJ9atty+EK6rLo3ihPOpKlrKGazM6lR8=;
        b=NMGcjbli8MgHg6Xf6KMCMAeKfrm/enDAQdJN2xbmKEJQ2B9wbXwO01g8Jmr/JtcsUJ
         CKhwBPGuzqjO6H/a2vGTPfZrakJGwwtVKj4BdcsJYvmFJHyebDWArcbZ01xI+TcdxCfe
         +s9YM9/4l/7BTnQOKsm6RvdICTJoYrSIjfxguAXc8MzFsykRAArwJ13+dM4GyZkhYpyp
         pDkGzBT18BNv0WESlOhbql+WCSz1zLN8PYxLrxHxz+XLIc9xtTJgYN7kgnYgVgPw/muj
         QWpbLvscKcwzhFQmdbZE8244F0DtNA/by8YyYFKiUhXYjf0VpDNklCOpEAYOTglvU4w0
         rHzg==
X-Gm-Message-State: AOAM532+J6mhzDGav5S8mF0RBWRuQ77mHKeFheq7wdbi0ypgflD8D2HS
	OuikwPt8U3NbwtkJE1rN3CxDqMk919Y=
X-Google-Smtp-Source: ABdhPJyAvCQDFXRyiC3sfBoZ7ZoWOFc6rfEsZ2A+xqsMe/0XupffAfoMfjimxluZMFpdn7mS65d/Bg==
X-Received: by 2002:aca:171a:: with SMTP id j26mr7260064oii.69.1630503941207;
        Wed, 01 Sep 2021 06:45:41 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id c75sm4283772oob.47.2021.09.01.06.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 06:45:40 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com,
	saul.wold@windriver.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 23/31] sudo: Use specific BSD license variant
Date: Wed,  1 Sep 2021 08:45:02 -0500
Message-Id: <20210901134510.29561-24-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210901134510.29561-1-JPEWhacker@gmail.com>
References: <20210901134510.29561-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make the license more accurate by specifying the specific variant of BSD
license instead of the generic one. This helps with SPDX license
attribution as "BSD" is not a valid SPDX license.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-extended/sudo/sudo.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index f109672b7e..6a18609adc 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -3,7 +3,7 @@ DESCRIPTION = "Sudo (superuser do) allows a system administrator to give certain
 HOMEPAGE = "http://www.sudo.ws"
 BUGTRACKER = "http://www.sudo.ws/bugs/"
 SECTION = "admin"
-LICENSE = "ISC & BSD & Zlib"
+LICENSE = "ISC & BSD-3-Clause & BSD-2-Clause & Zlib"
 LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=fdff64d4fd19126330aa81b94d167173 \
                     file://plugins/sudoers/redblack.c;beginline=1;endline=46;md5=03e35317699ba00b496251e0dfe9f109 \
                     file://lib/util/reallocarray.c;beginline=3;endline=15;md5=397dd45c7683e90b9f8bf24638cf03bf \
-- 
2.32.0

