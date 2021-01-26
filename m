Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web09.12883.1611672197559251216
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 06:43:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=qzNt8tPC;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id 11so10541623pfu.4
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Jan 2021 06:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=IiIHEfKSx5l4VQC39XsjRxCtvMZl1po89lo5b4xqeSY=;
        b=qzNt8tPC1dAD9Ywum2GL0AwAKIFFQVsxsXknCqV3N1lZqQgNBWQq4Af8OOTdWSnfrH
         NJb2Tn+m1KNnxcugW4tmJ3LRxYojY4xZ7Hw6yloEKWGPi8EUZofrlGri5JJwLqOJJXSM
         w683fqkf6+tVFLQjRL+2Q7U3acq+NTCExmfIZvNt3bKI3RplidsCTto4yRIXTIhdWNsk
         XgO1S6ZLahBwGxAZ8nIA+FlT5cMzfpm7rIC4bWdgTUF4ABF4V/43T4JlLimKZAVLokJA
         Za0VuxSLPNObKwytcgORxpaHG+nel+q0w6NpUi32MM68nBfmBkJdDu7dC4XPaIk68sho
         IekA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IiIHEfKSx5l4VQC39XsjRxCtvMZl1po89lo5b4xqeSY=;
        b=LkUbq+TLOSfKsQ6jM/Py7CEHTPAb4/ZUdGpiaaBafqliPj5U8PRANnrQzChqhXq0n+
         gwAwanLfOz6sGYNvP+2WXP3sc2SMXpwJu9v1i9i2Fv6BHAbi2Phk/qlViH9RCLdOUQDN
         9r5iwXqFFZ1B8MoE8zXoXsB+YHFRHERGmN4Fz4pIvifQ1w9ke0j84CJIhzPEnsxbh94P
         ravLkxl82mCgLm/120mVujzIyJTCx1tqjYigYN//YOZ4UmofEuHtPgFn2ylm+9+mv8jv
         i+aosvbA9ATfRfG5O2s35SBchj4See6L90pYZjT4+dQyPQGOtvXD6a1kurFSssYi76Bj
         7ABw==
X-Gm-Message-State: AOAM530GtBluGzYM/MpneBWE7hfc91ElG285U1/U8bKY1iKhUbgbJXaV
	EwxytR0jDWcpiDH4aA7iogZZlGDJivN+RQClr1s=
X-Google-Smtp-Source: ABdhPJwZNHJV16pgjmg7vnRdlaT7CH8cFICwXATPSqttIvREtHPcxKMr940V2iTokPZyqwZ24B7evQ==
X-Received: by 2002:a65:6713:: with SMTP id u19mr5899774pgf.364.1611672196566;
        Tue, 26 Jan 2021 06:43:16 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 11sm19303634pgz.22.2021.01.26.06.43.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 06:43:15 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell V3 23/46] oeqa/selftest/runtime_test: Exclude gpg directory from pseudo database
Date: Tue, 26 Jan 2021 04:41:34 -1000
Message-Id: <391b7d3d4f31c6a3f09ff3555d027b583c09a50a.1611671734.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611671734.git.steve@sakoman.com>
References: <cover.1611671734.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Avoid pseudo abort()s like:
path mismatch [1 link]: ino 6295376 db '/tmp/oeqa-feed-sign-2mw7z81v/S.gpg-agent.yocto-native' req '/tmp/jwkivmu6'.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 189630ca6cdf7ceb6cf9b8f9d86c58997f505efc)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index cd03069340..976b513727 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -161,6 +161,7 @@ class TestImage(OESelftestTestCase):
         features += 'PACKAGE_FEED_GPG_NAME = "testuser"\n'
         features += 'PACKAGE_FEED_GPG_PASSPHRASE_FILE = "%s"\n' % os.path.join(signing_key_dir, 'key.passphrase')
         features += 'GPG_PATH = "%s"\n' % self.gpg_home
+        features += 'PSEUDO_IGNORE_PATHS .= ",%s"\n' % self.gpg_home
         self.write_config(features)
 
         # Build core-image-sato and testimage
-- 
2.25.1

