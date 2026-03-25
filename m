Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 204EE103A995
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 02:20:09 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13956.1774405183846312057
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 19:19:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=WnYUsXTe;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-82a07738118so2491266b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 19:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774405183; x=1775009983; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Yo+3C/pgvWde+tJqtWsOUudwcsNzMUmcrakpPgLQX4=;
        b=WnYUsXTek8kWJLnnahCDQT3tPZMd1BGRhHL0sKUrrblFiKG/7gKf46EI3xaTqpiV0+
         ROtyNII652FBrtYb43iwgFEr6KSPbTALDXM0tvo5BYkuJViy6O+QG4Y5yGcMe6LT4Sqt
         TPisZGSXij02XaBS7DevBPXBOFTyt/6NinQVhjphb/dliXNCWQgmoLaFIxoe6uDT6wUu
         PPbjQyox/3UcGsuMBsRMlXP2jw5RM/z5of9hOoqEtnW5FB4NBQgktWtTzoVPeYOFe62Y
         HtvyLzJV/uRquguSloj6zhAWJK9WB44ZCAQ5SOIJcMaNKJy0Tyz0z/TrXgxf2P7tyrAn
         e60A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774405183; x=1775009983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2Yo+3C/pgvWde+tJqtWsOUudwcsNzMUmcrakpPgLQX4=;
        b=XGAY31PlaT3d0rGf/z5l0aCEmUyRNJKLWbV1SEs4R6gCI15c++fU+/maJRDnqgM3CY
         rXiQMVqHvh82YSox5wYu4+03AbbKz7xM+0/pAnGaFUyI7k365S4x9tIHvakpwIShIQsG
         6mUfFuYSavL/kvejpIdFa2hFp1Kb74UfxpIe8rZSVQqvKnHDsHqMsYaGC1aEHBdg25oM
         2R7oJ47Ue7LKIDgySLWE7pC8L6mEKzP//jzTXf0krS2TQeSRKQgyQezu2pwXdvo+JqlS
         z7RJ6FoO4Wr8W8vjVXHPLvTwppNUXzA0IeDhLuenJ20/EIU6ZRF5tY+kpGu3198Otj5l
         Q+1Q==
X-Gm-Message-State: AOJu0YxAfVFXZCHg/eotgf8N2iyn5r21us+0upahEc3mOnH8Tv4n7Xjp
	xCTQm2euvVQcGy8zJs99IWkVxGe3M1JcT1fLDAW/Nn3tPNyItijUDujlq9T4hTTs
X-Gm-Gg: ATEYQzyKcbqI7URIFvjR7orr8dch8PJUwE6YHkSygj2y8NtfPYSwwVsXqtxZ2F9tPZi
	dBcnT8TToDdD+JBICsN5jhvEcWVUrGKLXxiS4qAvI6v417LXDTajVrlQ28iijtwzO0MVAqV+mTw
	MAFSeEeDi5nXOvdIU/B2+L8ZXf+uxFmFfwoydW+nB6I84ixKWcJNyKrSHZO3kKbOXst07ThMiT5
	uVNg64Jk4CS6zpRjVrDfsJzZW4r/XALg3vAzzdA8c6JaBg8aK4/iyoe650U2bkr5L1Zx6LC7nlg
	BAkRN+qjZ6ma9dDVeIuaR44s51hwlEDJlp9PkVGR5LNk/3wbYhDIp0Y1gUSXbKIhJUXz3/2Shni
	lAnhmsRSup5q6ILJfixhGIHv4Wk7CQxIUoggcierx+n1hoEKRVAwir56lq4bn5eXFZ1YuN2ohRk
	tfO9gNtvSv/dfVWIqbLTHfFWtBoe0dFGPBfE8KshfuOIcfcA==
X-Received: by 2002:a05:6a00:1c81:b0:81f:5238:5560 with SMTP id d2e1a72fcca58-82c6ded3a6bmr1812606b3a.13.1774405183001;
        Tue, 24 Mar 2026 19:19:43 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0409f409sm13581235b3a.31.2026.03.24.19.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 19:19:42 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 06/12] tzdata,tzcode-native: Upgrade 2025b -> 2025c
Date: Wed, 25 Mar 2026 15:18:50 +1300
Message-ID: <20260325021856.4053666-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325021856.4053666-1-ankur.tyagi85@gmail.com>
References: <20260325021856.4053666-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 02:20:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233844

From: Paul Barker <paul@pbarker.dev>

This release mostly changes code and commentary. The only changed data
are leap second table expiration and pre-1976 time in Baja California.

Full release notes:
  https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/TAGXKYLMAQRZRFTERQ33CEKOW7KRJVAK/

Signed-off-by: Paul Barker <paul@pbarker.dev>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 452334219309793ad74abd6ff390dcb06cab929b)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 9a5105ffd7..b9323432b8 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2025b"
+PV = "2025c"
 
 SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -16,5 +16,5 @@ S = "${UNPACKDIR}/tz"
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "05f8fedb3525ee70d49c87d3fae78a8a0dbae4fe87aa565c65cda9948ae135ec"
-SRC_URI[tzdata.sha256sum] = "11810413345fc7805017e27ea9fa4885fd74cd61b2911711ad038f5d28d71474"
+SRC_URI[tzcode.sha256sum] = "697ebe6625444aef5080f58e49d03424bbb52e08bf483d3ddb5acf10cbd15740"
+SRC_URI[tzdata.sha256sum] = "4aa79e4effee53fc4029ffe5f6ebe97937282ebcdf386d5d2da91ce84142f957"

