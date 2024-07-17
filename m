Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B738C3DA42
	for <webhook@archiver.kernel.org>; Wed, 17 Jul 2024 06:18:52 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web10.9143.1721197130368193834
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jul 2024 23:18:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=eAb58SeZ;
 spf=pass (domain: mvista.com, ip: 209.85.219.176, mailfrom: vanusuri@mvista.com)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dff1ccdc17bso6612380276.0
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 23:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1721197128; x=1721801928; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PejdsQymtXVT89zCgfXn6IOZUcem/HmRWmeG2P9HX3A=;
        b=eAb58SeZEJlE6QOKbCFLt0blC8Qs98gBBenqJ/aj/mCedBPKezxeDwepRB6lSCgilG
         G0pGMmchdVl3/6LJhAHC03yMSAQq8jfaT7P9WhyucvER6+m/LLKD8It1kGPcQXIiTJDW
         0FgCtYzQgxR+t8uTXwUQ9ijjyOgX3ipi7iWV4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721197128; x=1721801928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PejdsQymtXVT89zCgfXn6IOZUcem/HmRWmeG2P9HX3A=;
        b=MDAJRBzNloKMugZgV+Ybz4IR5ucseBo73RnuU/1X9VNaDHOtggPOoZO0EYwXcL039d
         CiN6bln+COYf6sYdus/WttmDtkzbcP5iXHOwVhNjvpQl4p/q5tkmw/3Lbyaq/gqlBAsJ
         nSegn4Eqk+a6TgwRr8RxaBVXCsaEBsG98p4HcmGDH0jn55dEYKF08Tr7emW9/yM7FHzt
         4LBPJifPPPtv4WGhAXPcNZHrdjA2EEPGOmdM+AmFqVpyCV47wpFGacHZNZhKjM0fMV4u
         i3y8luSqZIupSifir8Yn+1euQ2JRlbowLWaHVP+kff5FNfGEcDW4m2AKKIQvF1rDPzV/
         FEVQ==
X-Gm-Message-State: AOJu0YysUzjrWh5xjU6S9ywDitSdRFaWmp7Utju1FEGvdnLWcB5Ckfrj
	9upITr30XrB5FBppGoIN5f3JLYMcfTdsXDe5NTby+0agcp3XM5TF0aNI7AcDPuXDut6ugF/dfLY
	JvWc=
X-Google-Smtp-Source: AGHT+IEwc0VpkL05TKUC+5UuwohqB+UtMVpz7XbISwR00R2zjKSvQ33+FkvW2ltnaPZzs8xf8IPH/A==
X-Received: by 2002:a05:6902:1544:b0:e05:7ae2:1141 with SMTP id 3f1490d57ef6-e05ed7609acmr874650276.32.1721197128679;
        Tue, 16 Jul 2024 23:18:48 -0700 (PDT)
Received: from MVIN00020.mvista.com ([2405:201:c01c:7959:4f42:163:8eb7:4e9])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e05babc10b7sm1037263276.35.2024.07.16.23.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 23:18:48 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][kirkstone][PATCH] python3-jinja2: Upgrade 3.1.3 -> 3.1.4
Date: Wed, 17 Jul 2024 11:48:36 +0530
Message-Id: <20240717061836.1014191-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 06:18:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202137

From: Vijay Anusuri <vanusuri@mvista.com>

Switch to use flit core since upstream changed.

They also changed the capitalisation under pypi.

The license didn't change but the file was renamed, probably as it wasn't
rst.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e352680528b18c3cdae26233bef7cddc2771d42d)

Upgrade fixes CVE-2024-34064

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../{python3-jinja2_3.1.3.bb => python3-jinja2_3.1.4.bb}  | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/python/{python3-jinja2_3.1.3.bb => python3-jinja2_3.1.4.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-jinja2_3.1.3.bb b/meta/recipes-devtools/python/python3-jinja2_3.1.4.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-jinja2_3.1.3.bb
rename to meta/recipes-devtools/python/python3-jinja2_3.1.4.bb
index 068e21bf5f..3fe82d5e4e 100644
--- a/meta/recipes-devtools/python/python3-jinja2_3.1.3.bb
+++ b/meta/recipes-devtools/python/python3-jinja2_3.1.4.bb
@@ -2,17 +2,17 @@ DESCRIPTION = "Python Jinja2: A small but fast and easy to use stand-alone templ
 HOMEPAGE = "https://pypi.org/project/Jinja2/"
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5dc88300786f1c214c1e9827a5229462"
 
-SRC_URI[sha256sum] = "ac8bd6544d4bb2c9792bf3a159e80bba8fda7f07e81bc3aed565432d5925ba90"
+SRC_URI[sha256sum] = "4a3aee7acbbe7303aede8e9648d13b8bf88a429282aa6122a993f0ac800cb369"
 
-PYPI_PACKAGE = "Jinja2"
+PYPI_PACKAGE = "jinja2"
 
 CVE_PRODUCT = "jinja2 jinja"
 
 CLEANBROKEN = "1"
 
-inherit pypi setuptools3
+inherit pypi python_flit_core
 inherit ${@bb.utils.filter('DISTRO_FEATURES', 'ptest', d)}
 
 SRC_URI += " \
-- 
2.25.1


