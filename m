Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EA2EC02198
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 11:14:09 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.48186.1739186046810809485
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Feb 2025 03:14:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b22MltfY;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-439307d83f0so10579955e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 03:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739186045; x=1739790845; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o22mLFF8SWm+DMx5EKMnMfIHDngILKUVZecNoG69GG8=;
        b=b22MltfYz1FX+Z9x4E5rYZxfuI2vCjQcV+iklD+AOIQnAnLzVsdAR11MOYx9KzOBC2
         a84Shzc/t9km4oqB5Znt5A94ghe3Rye6YFY4WqdKwiZ3p2Zh+WK20SWvbLbGry9rvmU4
         VqP3zEmGDpEjiCRgOBWXZporRvSv1uvNCsmeO5BkBkP2Z4ljI4iHJQh3lNxyReReZjyN
         tjMLoO74qZVJt+DxzYypQOREPlGBeBYgtQXr+oO/qGD0zox6pnbQ/rGAhalU3FMEpH1a
         ehhSpNnIGemlHcSJs51+b5x5ABj1tjnNVDYMp90mgiLkaOgvMzLQUjZAPpo30Q8opqCA
         bEPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739186045; x=1739790845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o22mLFF8SWm+DMx5EKMnMfIHDngILKUVZecNoG69GG8=;
        b=fwulz4I7BO+9btuM2+V3kWGx+LI0DgFK6yh3HF5rRi0Ht5sx3//XgWBqRMWh9uEAvd
         +C/b2F5NfKJoPRtxlojQO5vUFLNgEkvqhmulseOrRfN7iGMdfNhj570Hqeg+Z+WCKs5D
         076n2NmO0TIeh9sWNzg2g079NvD1Q4crle7zQ6reTCPekmIT8t2LzXE7Qn2yta3wYa3H
         ZV+XfTpFu/u70LP+SXnCDpJjPvyn/B96vJyma0bUo2AO1tsZ1xHIyRA3eYJvcSezIqxe
         mZ4duD7ZhIK6RcamX0gDscJ9vxqprXdTpV0k6TIFzSsUf8SVaY9phg1PhMGAXpsY9A3U
         xKNQ==
X-Gm-Message-State: AOJu0YweIYeaVIq13r6uc2p7kmZYt+P055pv4pQqEj1sjm2qliw+zcX6
	LzIYCMxl0C+nl+weFUnBRSZ8Yo2kQTC1DpT8c8gbNYpZdLI1gGQDOjBDjA==
X-Gm-Gg: ASbGncst5piR8QLic0GNQfu/YOZfSfSWZ/X7CQjL60exjs1WORU6bzEEnU4IaJgE9b+
	AfigNl5qNoNayfrqhBjC3rF58nyqGwR0PBFzs6mumwoHkjuaud5311k+c5H0vWHFv2sAyLFpM3q
	cgi13+7/xWl3EHuYS0L+xmVEMvIWn4VccB6o0A9eHOWBKEmxSmE01v+ip6Gf/Tl6IebzMdKy2Pj
	t1sWVDPdaNDEkVFuS045hGTZ+6qlcqrDduQTHCmwIzrXEPNkvL/jyisrQRD+exBU4LPMTa8iniE
	/CW5Cgw8OhxyrC1QhJEyJzcB/2rpHAJwtrIjyzpaM9Eetg==
X-Google-Smtp-Source: AGHT+IE/ilEK91lLWi3SMGafNczQe6onJgShVrrOWdRmGE1F7Yjzqkd87FJ0o8q8DQgOPao7FH01Rw==
X-Received: by 2002:a05:600c:5110:b0:431:6083:cd38 with SMTP id 5b1f17b1804b1-4392497dad8mr103236535e9.6.1739186044758;
        Mon, 10 Feb 2025 03:14:04 -0800 (PST)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390db11264sm174789785e9.35.2025.02.10.03.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 03:14:04 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [OE-core][PATCH v11 5/5] oeqa/selftest/cases/signing.py: Re-enable self-test
Date: Mon, 10 Feb 2025 12:13:58 +0100
Message-ID: <20250210111358.1120877-5-zboszor@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210111358.1120877-1-zboszor@gmail.com>
References: <20250210111358.1120877-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 11:14:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211090

With all the pieces in place, the self test can be re-enabled.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/lib/oeqa/selftest/cases/signing.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/signing.py b/meta/lib/oeqa/selftest/cases/signing.py
index 51d1c3fa64..4df45ba032 100644
--- a/meta/lib/oeqa/selftest/cases/signing.py
+++ b/meta/lib/oeqa/selftest/cases/signing.py
@@ -71,7 +71,6 @@ class Signing(OESelftestTestCase):
         """
         import oe.packagedata
 
-        self.skipTest('This test requires rpm-sequoia support in rpm')
         self.setup_gpg()
 
         package_classes = get_bb_var('PACKAGE_CLASSES')
@@ -84,6 +83,8 @@ class Signing(OESelftestTestCase):
         feature += 'RPM_GPG_PASSPHRASE = "test123"\n'
         feature += 'RPM_GPG_NAME = "testuser"\n'
         feature += 'GPG_PATH = "%s"\n' % self.gpg_dir
+        feature += 'PACKAGECONFIG:append:pn-rpm-native = " sequoia"\n'
+        feature += 'PACKAGECONFIG:append:pn-rpm = " sequoia"\n'
 
         self.write_config(feature)
 
-- 
2.48.1


