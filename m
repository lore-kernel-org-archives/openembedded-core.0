Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54183CD6E5D
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 11:45:56 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23203.1780400581512334813
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2026 04:43:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ic2AIWNN;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: frederikbraendstrup@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-68b2229b48eso8968834a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 04:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780400580; x=1781005380; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8oqvltsjKYti6J6HOmbmQARMTeMFA89CkL5Js0n7dx4=;
        b=ic2AIWNNk1m+OjbRLvJWgTz7mmKtT5qIUj5oMOg1t0X0Qn1b7tVujXfN1L658Jj+i4
         3UcBZGEYOv8qNpH+UgtQTHPCKGxhzZiHOxExSR9B9UrTkrujTCiicnZev9jR+DPk9XVM
         c9PtsxjOcZIQ6fpfUB8gBx7EM6jew95NDCrGflJSSLRdRsRuxxMJ2CnQHKIaqdzF4L6B
         mQBvX5ALhZco70S9yx9M0ceaq6ytOmO7p3fTQzwTsZqwyfG0uvIyCwB1FKguLl2gf3O8
         +1KYOmZcUfYlguATKhZZToTU4yFP/c4uQg5wxe6EkxOfvzJRYhf4hIDueCxGYmO0/3ZC
         MMAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780400580; x=1781005380;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8oqvltsjKYti6J6HOmbmQARMTeMFA89CkL5Js0n7dx4=;
        b=Q6QS3y2YGKiBkLlKg0QtSgcrOwgDxT440FStcyM0845g32wVD6hqhuPYvHqaif1p++
         VPOOavqnBM5llIuAvHfI5Ut2JOI7aJnjbeapZSFSWStlse0PjsNebGkjcc0ciGUg3TfD
         z9Oun02QkSKSj7OIKCxiioYPw6sXFWv5/yvEEXc1XG+UOF6n32HxCGRxOrhmkcHvOgmX
         5Zlrv1tLaUsVnfYW+EDdWy8KVmjmmPCZNbcF+53ncgoGkb3WG6IUDTHCUKqetOgvcbU8
         aQ9UVeDfkb+Kfq/XeHo098Pfw0skP2fnq8QLNUQaDCrkzj/FFSmWf54qmMlFJPmmBIqH
         dFtQ==
X-Gm-Message-State: AOJu0YwXBrP81amx4O6nmG0iuOVIlKmkZA45lElL3gvcnY5P0h7ihfQT
	18upa5UuGUsGQUv5mMeo0sO1y02Xb/mFNBBfNpM/c01UPDlIOJKs/qGOhwOxYgIv
X-Gm-Gg: Acq92OFvfz9cK1zYEs/npoxJJD6oJBPkMZ1x9rY7jUpKp/v7sBJ7/WDCkx713znIzoR
	pv520IIA3yWhwhK4dGezQJopUzg1TmOrNIael1556X/68ry8U5on6Tf80HEZmwzUuTM3fwCmpay
	Ui0hPFiTx9Nxc8Vi3QEN5QnBMIhBHlejZqGZZi2uTtRYLvqSZ8tp5YaRc0c+fjmQD8egweJkx8J
	5f0bkYtc7yo4aLjZoPH2RCqdKQhQl7OIbKCLBZLAFUoMYrhLBVcqRkSahnVtVfNJvavdb3oSpPV
	/Lx6kE0V7kpjZMI8lO7e/0KRKRElENZJOl9mAKfSCd3zhc2C+0bbru1UQpKmOpPWDqdbI868LjP
	ZNzfaG5OBN+xMbM+yoSqMOqMzOanPHDtts48XhkLdOOGx9JEhP/6+Je3Us9bzehg7IH3tM15Eol
	VBpnyDiThPTy0nAYEN0imGspqrIXs4cZrYXKDbiplWV0MOJnsRe6A4x6RJWg==
X-Received: by 2002:a05:6402:50c8:b0:68d:2da8:8511 with SMTP id 4fb4d7f45d1cf-68d2da88d05mr6078081a12.3.1780400579431;
        Tue, 02 Jun 2026 04:42:59 -0700 (PDT)
Received: from ws.taila4487.ts.net ([80.166.137.147])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68ceb860a50sm3281519a12.26.2026.06.02.04.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 04:42:59 -0700 (PDT)
From: =?UTF-8?B?RnJlZGVyaWsgQnLDpm5kc3RydXA=?= <frederikbraendstrup@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Frede Hoey Braendstrup <frede@vokalo.io>
Subject: [PATCH] python3-packaging: 26.0 -> 26.2
Date: Tue,  2 Jun 2026 13:42:43 +0200
Message-ID: <20260602114242.3099011-2-frederikbraendstrup@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 11:45:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238033

From: Frede Hoey Braendstrup <frede@vokalo.io>

---
 .../{python3-packaging_26.0.bb => python3-packaging_26.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-packaging_26.0.bb => python3-packaging_26.2.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-packaging_26.0.bb b/meta/recipes-devtools/python/python3-packaging_26.2.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-packaging_26.0.bb
rename to meta/recipes-devtools/python/python3-packaging_26.2.bb
index ff45cb5133..1e4c0a6bd3 100644
--- a/meta/recipes-devtools/python/python3-packaging_26.0.bb
+++ b/meta/recipes-devtools/python/python3-packaging_26.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/packaging"
 LICENSE = "Apache-2.0 | BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=faadaedca9251a90b205c9167578ce91"
 
-SRC_URI[sha256sum] = "00243ae351a257117b6a241061796684b084ed1c516a08c48a3f7e147a9d80b4"
+SRC_URI[sha256sum] = "ff452ff5a3e828ce110190feff1178bb1f2ea2281fa2075aadb987c2fb221661"
 
 SRC_URI += "file://run-ptest.in"
 
-- 
2.54.0


