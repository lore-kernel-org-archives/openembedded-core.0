Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23B05D2B922
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 13:10:59 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.17676.1730812254607271605
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Nov 2024 05:10:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=cJXepdHw;
 spf=pass (domain: mvista.com, ip: 209.85.210.171, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-720aa3dbda5so3914638b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 05:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1730812253; x=1731417053; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SryfJZdJpCwvFZ0hBzzCUIuAjbpiKZNassHCpd6Biks=;
        b=cJXepdHwUN5JCPH0Uz0oOlVYIBvFiX3tXWN/GK8IAP4eOvO2Ny8F8fdhhd0N1CyGNl
         nsTaMhyzvkRLZjoK6PmomvFw8SzlGKpog7fHvSz9/j6CYDKgDTmqwGGokt6/freD4eLB
         96WZZjPyY7yOhdowhGk2U0sn6yKBHL4mH8mjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730812253; x=1731417053;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SryfJZdJpCwvFZ0hBzzCUIuAjbpiKZNassHCpd6Biks=;
        b=o2sA6oiZs75fkDPmm7545aIOlWCDMRMeIx08WKhO0hsBnGZu48fXo0I3KRC6YD6ZYx
         QaFHpq/N4Oh+3Xqx1rfICkFSNi6C8PiVewfSkmBeAtdJK5iQ42sdY+Kverlhze/5xxj1
         LTS1mGFh6ClM3qMV6ACE9rFhtnncekQ3Qs6FESzY9807PAZRAu8bUwT88xCAJMeFdel0
         U0fmqsc5i+mSmxM9ar1J5V7cF1VVYdkA3EMjPULGabfKxyDHGK3WzSPoGrk0sd/vbK13
         hKXvt4I81db4cceymeApE+PKnFHk0nQYvQ/LZ6Exg+RLUyfsIJG6Ou1fvpeDPBSUdEjP
         4LeQ==
X-Gm-Message-State: AOJu0Yz/4Fu3fthcancILVdlCan1qNlQi6ImTYsaCqaNvOb+Zc0W87HV
	8n17zhJBiKifDylQiRg7uj4fuVGFXpMkwxFncjREf1/DY16yTyUQsoERAkD0VjDgjQTvec7Arme
	cTr0=
X-Google-Smtp-Source: AGHT+IFfbH8nt+QSGJJOri8YTuzWACaaDah3a6zK5D8JF+ecDwhD068K+gtd0p1D2oTJYX8P6zCf+Q==
X-Received: by 2002:aa7:88c6:0:b0:71d:feb7:37f4 with SMTP id d2e1a72fcca58-720ab39eca2mr31451951b3a.6.1730812253380;
        Tue, 05 Nov 2024 05:10:53 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:882e:ab98:2667:636c:d1c2:b606])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc2c39acsm9443154b3a.137.2024.11.05.05.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 05:10:52 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][PATCH] xwayland: upgrade 24.1.3 -> 24.1.4
Date: Tue,  5 Nov 2024 18:40:44 +0530
Message-Id: <20241105131044.1263658-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 13:10:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206709

From: Vijay Anusuri <vanusuri@mvista.com>

Includes security fix CVE-2024-9632

Ref: https://lists.x.org/archives/xorg/2024-October/061766.html

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xwayland/{xwayland_24.1.3.bb => xwayland_24.1.4.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_24.1.3.bb => xwayland_24.1.4.bb} (96%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_24.1.3.bb b/meta/recipes-graphics/xwayland/xwayland_24.1.4.bb
similarity index 96%
rename from meta/recipes-graphics/xwayland/xwayland_24.1.3.bb
rename to meta/recipes-graphics/xwayland/xwayland_24.1.4.bb
index 7e817a7241..6f8589ba5a 100644
--- a/meta/recipes-graphics/xwayland/xwayland_24.1.3.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_24.1.4.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "dcdb57a66cc9b124c8f936760592628ac4e744a7d7b3179aa86189ad7ea4cb10"
+SRC_URI[sha256sum] = "d96a78dbab819f55750173444444995b5031ebdcc15b77afebbd8dbc02af34f4"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
-- 
2.25.1


