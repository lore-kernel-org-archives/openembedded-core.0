Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.357.1611586370067409629
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 06:52:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=CYYigf5h;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id r4so7723783pls.11
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 06:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=IiIHEfKSx5l4VQC39XsjRxCtvMZl1po89lo5b4xqeSY=;
        b=CYYigf5h2idYQ9o2fxUrfbufdMF3YAyHA9vM10LmYE1OLK1eOWCqk3eq38TrpiYiOV
         z0aqZYuynpjvq8edAAjtkHQHF5o8baxlNj92H9bNjODqWD+BviB1opExqfmlveqDe6oG
         n7icKjtMcPymicWr5fHeDAnRqACMk3+3VGIFB5VJ0Dmt1QGCwgtGaSNA7zxGt0EJFJ7r
         sYmo7mE3sxLSyWSMzn0tVywtMs5XcVpKuazj/pYh6YxBumh7VJbafU9dw1DzjxDSpG5A
         DOxK3VQVJ3rvXeNWp8JW1fIJGH15SKs49Ftlj5A0i6RJt22w2HhZbuG0zNgzKs04gh1h
         TdGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IiIHEfKSx5l4VQC39XsjRxCtvMZl1po89lo5b4xqeSY=;
        b=cMTM1RiYaGBqvrlnhqNyZrdobmuH7I+O9zuUvCfYGkVPKhO0sJLAdpfysA1vE0tZ7D
         xH7i7RdGNqLFZ4xRfFL81hijQbpSSEtD+U0ZugvXRXcD2xyKnwfh64b9UKQy+iPPOy7J
         GROOEpIlbGcC+71dDaEvUHqvU98OHrU9rjYtIjcK4sw2cKyVbjagxekotxoU5sF1V4Oj
         +O+XPqDbRhmfkwFDZKwTKaE3vvz80nEILl7hcbg3EuwuUwtEjyqu465qz9dmm4JQNtZn
         NQt4uXmll1UbGwyyACftuo1qlGmVdJYKwGVhd/mt5MzMGESUG47VIgrZq6F+iL0A4Bop
         5juw==
X-Gm-Message-State: AOAM531xEPCYIYpZWMov5UR/a7bDRcT0dExdC2z5EzEqj8kfXzhkqVjz
	jTS4Zs3sCvHF5KNOvjrfZnP5UO0jeO+lVyxJ7QM=
X-Google-Smtp-Source: ABdhPJwEmGK5sy0RSeS95ffNVvMtNsP0NdlJihA24MRI51vMV0TAURWuosTCPotfj14zvKlVmSFuhA==
X-Received: by 2002:a17:90b:180d:: with SMTP id lw13mr588127pjb.94.1611586368841;
        Mon, 25 Jan 2021 06:52:48 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id x8sm17574354pfn.27.2021.01.25.06.52.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 06:52:48 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 24/47] oeqa/selftest/runtime_test: Exclude gpg directory from pseudo database
Date: Mon, 25 Jan 2021 04:50:56 -1000
Message-Id: <90085e6f3c3125046d8b26328686e6e1e83e0da4.1611585425.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611585425.git.steve@sakoman.com>
References: <cover.1611585425.git.steve@sakoman.com>
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

