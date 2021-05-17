Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.19359.1621260876102360639
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 07:14:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=CK27XyqD;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id v13so3199587ple.9
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 07:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=/L8oXwnaAxYZg7G7BiO5gqYs/0XiV7Nvx9SUdfSQMcc=;
        b=CK27XyqDXwJaYc8VjfiFfcfKZWP1kFjJLZLofriPERBrM8DuSzTzaOFpCu21yarae1
         EMbcjyzLRLEFQzJ5FKKATT3P992lyxHr7wvqL9F6l90vm6FCb1Piqn6arjfG3lBT0zHA
         KyHFvgys8mdLrNJfR+TcCPEE1Zcr1RemmGiPj0VmISsRbwRIeBCgarQtlSHG0HECID7Y
         sgry15Gj0lEcpC1h1p4B5s5e2VVll7X8fxxZKLp+rYi0G3qwYJpD7473O0Bx/EUZrXya
         ajSoa9BCtyu+ymw/5XgwBr6CMC2ywHhw55i41uFlJ1fYg4YX+0iomtgrqO4xDnJxcFSo
         LQlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/L8oXwnaAxYZg7G7BiO5gqYs/0XiV7Nvx9SUdfSQMcc=;
        b=b+5LSliwOLyzVnfdZMXOy4/SM1P2OXLuUk31Hi5PhV5GaE5FoK0rguNd8fUJz81PQ2
         9Nw0aYwYD39yZ7v3W+S7eFQMcJZF4qQMBb7tenmflDr2PKro1rLmeacFL0Xly06A70rh
         4DABo0k1lAIt6ufdbl6UC8UK2odhZepzEWdEVAW7QhH5/tXm5Rq92FZGgaKxZx6AHZ9h
         1v29IMcKxoj0xOOIh/G+Za/T1+/7C41D6jWBYPoLgj907P/cEw2XjWSZgEQ3u4MPYA63
         ZP+fFEI6xJEWbhbx+IMDESQLtqEMlyMMPV0oX1SL1kNVudPKEFNDXfRGzVD1EWcPz7qr
         UIVA==
X-Gm-Message-State: AOAM533otQKPOH53n/w6q3v/Tt2RYZm4MOQOBCMh6nJWMi6GtYfPUXwA
	Uy32g8wSBb0XxijcR/EdnHjtkRO8VqRAPCI8DzE=
X-Google-Smtp-Source: ABdhPJzO6u8YD8vi/PMWOdMNdib6oPYMXVnSltANlXXwmOt7qjhkzDCAVSkURjUhwo820NSQ4A/MQQ==
X-Received: by 2002:a17:90a:e28e:: with SMTP id d14mr25012553pjz.223.1621260875279;
        Mon, 17 May 2021 07:14:35 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 66sm11292660pgj.9.2021.05.17.07.14.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 07:14:34 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 16/35] unzip: Exclude CVE-2008-0888 from cve-check
Date: Mon, 17 May 2021 04:13:22 -1000
Message-Id: <4ff9d2c57d9cade1faa3916f171e5ad96ee32487.1621260695.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1621260695.git.steve@sakoman.com>
References: <cover.1621260695.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The patch mentioned as the fix for the CVE is applied to the 6.0 source
code. Zip versioning makes CPE entry changes hard.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8917e5ae2bb44d017fc0155f16632c5decadb0bd)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/unzip/unzip_6.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extended/unzip/unzip_6.0.bb
index 0c56a39d92..af5530ab38 100644
--- a/meta/recipes-extended/unzip/unzip_6.0.bb
+++ b/meta/recipes-extended/unzip/unzip_6.0.bb
@@ -32,6 +32,9 @@ UPSTREAM_VERSION_UNKNOWN = "1"
 SRC_URI[md5sum] = "62b490407489521db863b523a7f86375"
 SRC_URI[sha256sum] = "036d96991646d0449ed0aa952e4fbe21b476ce994abc276e49d30e686708bd37"
 
+# Patch from https://bugzilla.redhat.com/attachment.cgi?id=293893&action=diff applied to 6.0 source
+CVE_CHECK_WHITELIST += "CVE-2008-0888"
+
 # exclude version 5.5.2 which triggers a false positive
 UPSTREAM_CHECK_REGEX = "unzip(?P<pver>(?!552).+)\.tgz"
 
-- 
2.25.1

