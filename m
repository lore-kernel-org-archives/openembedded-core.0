Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57985C433EF
	for <webhook@archiver.kernel.org>; Tue, 12 Oct 2021 02:09:10 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web09.8006.1634004549156411924
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 19:09:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=D8iN2MNS;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id
 ls18-20020a17090b351200b001a00250584aso742045pjb.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 19:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VT1Zb4Xi5KSE4JGnfYPDdNsJbIOaytMlRJNI/Fo4teE=;
        b=D8iN2MNSNRdL0HjeYNuljOoM6vzH4pTbXy5gaMFj2MnK0YQD/UUWltHZCGIvG6mBs0
         AhUWv7L8BGx3ZE8+lsz8C/A7OftR82TD4JliD1J60xc5bIQdHwr1V7Y5wW36IykOexZN
         rcvmr9nksbqJKCDY6CcmoYlh8+RuMfzVG1GFZc5nXxnF0ELxsqo8sL9TncApx/dbLqF8
         ceU5aK96XRlMrlS6SxyTC/MCt1xHjbx5vBxYmh5MZMnxYxhe7kwAf+El/64LMQFiDAni
         JvXZmE1CNkypTOHrBr4Kk/Ks6tcE7bVnJVQmoZRBI/Spwjxl3w7J0CLRHSEKXFfVg7Cw
         8EFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VT1Zb4Xi5KSE4JGnfYPDdNsJbIOaytMlRJNI/Fo4teE=;
        b=V4XIFM053iT4uj4GCR2q/p0VylExUD6q2kCjU5qg/9b3nUQCSjrPuepgjK3IKwzKbR
         M7/0REpRXpssz8MltGebsxKGuCF96HkAjI3uIyUIkwne2wIEXonaw9wALTnrY3h38dll
         7312BGceRVM0HA/C6YCTRuw2ePIEOXT5I7cwhg+ufcT1gfDT1Es5/iRV/nkd9fE8kCdU
         aFRRZiaChw8xc5ZVZYb1q6vN+a6DftoLJ1Mmb3r+/kCBq4VGHTa5BNpTH94WroBr7QO3
         4geih7mB1hIYH2JXoqpRN9TlI3JSvOGw2Fp5rXP9hzIYsY9xmSC+2J7gv5VAX0b6gkAG
         ndGQ==
X-Gm-Message-State: AOAM533WYLQmkWDBctiRqR9BU/e4wuX0aBERoGmkkZg5Hw1esBGiNzlO
	70djGklFOG4ZfR6SBCChOAJuqKmJcwVCqA==
X-Google-Smtp-Source: 
 ABdhPJz8EjDgit0zcpAVbH+1hlf99TCAQljDi1eKbVyA/IHlPrsiBFZG7ftixlAljA8bzcaXR+H/fQ==
X-Received: by 2002:a17:90a:4812:: with SMTP id
 a18mr2920701pjh.40.1634004548493;
        Mon, 11 Oct 2021 19:09:08 -0700 (PDT)
Received: from thetis.hsd1.or.comcast.net ([2601:1c0:6000:1830::17e1])
        by smtp.gmail.com with ESMTPSA id
 l207sm8949601pfd.199.2021.10.11.19.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 19:09:08 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@intel.com>
Subject: [PATCH 4/7] python3-zipp: upgrade 3.5.0 -> 3.6.0
Date: Tue, 12 Oct 2021 02:08:51 +0000
Message-Id: <20211012020854.2073998-4-timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211012020854.2073998-1-timothy.t.orling@intel.com>
References: <20211012020854.2073998-1-timothy.t.orling@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Oct 2021 02:09:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156855

v3.6.0
  #78: Only Path is exposed in the public API.

v3.5.1
  #77: Remove news file intended only for CPython.

References:
  https://github.com/jaraco/zipp/issues/78
  https://github.com/jaraco/zipp/issues/77

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 .../python/{python3-zipp_3.5.0.bb => python3-zipp_3.6.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-zipp_3.5.0.bb => python3-zipp_3.6.0.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-zipp_3.5.0.bb b/meta/recipes-devtools/python/python3-zipp_3.6.0.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-zipp_3.5.0.bb
rename to meta/recipes-devtools/python/python3-zipp_3.6.0.bb
index d6f4676542a..c98bc7a3a49 100644
--- a/meta/recipes-devtools/python/python3-zipp_3.5.0.bb
+++ b/meta/recipes-devtools/python/python3-zipp_3.6.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jaraco/zipp"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6"
 
-SRC_URI[sha256sum] = "f5812b1e007e48cff63449a5e9f4e7ebea716b4111f9c4f9a645f91d579bf0c4"
+SRC_URI[sha256sum] = "71c644c5369f4a6e07636f0aa966270449561fcea2e3d6747b8d23efaa9d7832"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-- 
2.30.2


