Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D846CA0EE4
	for <webhook@archiver.kernel.org>; Sat, 16 Aug 2025 10:22:42 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.32036.1755339752942886564
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Aug 2025 03:22:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fJoK8+1D;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-afcb7a2befdso390449966b.2
        for <openembedded-core@lists.openembedded.org>; Sat, 16 Aug 2025 03:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755339751; x=1755944551; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=JdFOyQXBlASlfp9De1c10iJQiFBwHUZQzZ5sS/u3KrM=;
        b=fJoK8+1DpwZSqurQGqku7LgN5M2VtEYGpI+4KbkJnRBya8wcYkHuolPwCiz58Ut3jO
         1yWIjAEqBwehG5gXcwFgBi42XmpMjh0VuFi/vPwVZT7j3ImfIT+ntwHZ8wOym6xY1VoB
         y177+H/9dQjWTwGHmRUZUxIXKktCxk3u9XZM1eMgYqwHfjYW9bI9XZ6ybtzNhxONvewJ
         IXOIa8jkS/gvv8dV7BgboT1VAfMS+DKElrjegFrXmQVtNUlD1wxEZNV17LkHXH06caZe
         2aIFauEygWcDFflvJiz+OD92hMtDkQEjtkDwYAfYleS5WqXr37wUYpZGVBdRRYSAgb8B
         hauw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755339751; x=1755944551;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JdFOyQXBlASlfp9De1c10iJQiFBwHUZQzZ5sS/u3KrM=;
        b=PVfbFsys7pKOQvGwzn6gYEZIksnVUQV/8Epn63NXDRMr7G0v9sySnK+51uJIjXjqOj
         N9+iXzJCZVbmdst165UFGk3YQSO63sQKQfbsr4YhftGGZ7vMBDLNbdW8nVbeZq033omn
         RnS8/QsKNsIOfZgJwdQsw85JLHlLVomDEW/QLmNXf/ogJ3k0W0e+06Qfm9yoKbdTGny3
         NxF9mzsF8BdlD/n3Yr5K/Jy0yxP6cyApgpVJcHx/uOndVZGadyxjapw8ptniyvX/6S+u
         LfsZi4ium7hT5p/jdpJjngbMHx8bfQBKuYnUjKRqN2RkzoFBqq6X76pydhhmqz+hNooH
         nI+A==
X-Gm-Message-State: AOJu0YxdUD6eMJoTiL3WLiz4wf0mmj8CZx+tvU7iupl0/RwKGscvvmfF
	NtYKKDEgl13grUZ8/3cgzNwJA2vqf3gM2uKbxdK/lbWtnVHUZDVWK1NsutmdwQ==
X-Gm-Gg: ASbGncuG+HctRP91oi857OGiCydOnBoGTti6JdW2dGSR08kR3ORT+7ssUCT7CeWwxdD
	oI+iGfQUEofUWcXIdP7Pcy2S5VpLISfgYEUJPpcjsg2gTVnuHTrSpSyPsosJfu4cYp6EQhP+3ZV
	OOWRN6HLomkzsPuviP+8q6haHqzsTTowPdlow/OZq6sDjuTDdd0Ylg8vX8AacXGU3mggogiFkgB
	rQfx8tk1SfE6pxrUIjWcDXa8k/hhTQcNKSeq7oMjFkHNJ+5rBVfsdhWNsafYPpd3QF5DKFnIe/Z
	ex/huzs+tYESYlqT3ZTJnowkvDekWLciKgVP5vI3Ubqx/0Yx8z+OWs3TE75fHWcfRJDKG839MBM
	pZzfMVWK6juceAs0NUPvScVsDRe9CT6Q=
X-Google-Smtp-Source: AGHT+IHMzFdRkLchQklrTIjQF/o1ZOXk4IaZ+OMROGJKO4KGHgd8WGIKC/jfe5c8tZ2ep43Bpv5ErA==
X-Received: by 2002:a17:907:72c2:b0:af9:2668:4c21 with SMTP id a640c23a62f3a-afceadd702emr186315566b.33.1755339750974;
        Sat, 16 Aug 2025 03:22:30 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdd01ab3fsm346939166b.102.2025.08.16.03.22.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 03:22:30 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] boost-build-native: upgrade 1.87 -> 1.89
Date: Sat, 16 Aug 2025 12:22:28 +0200
Message-ID: <20250816102229.55627-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 16 Aug 2025 10:22:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221995

Changelog: https://www.boost.org/releases/1.89.0/

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...st-build-native_1.87.0.bb => boost-build-native_1.89.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/boost/{boost-build-native_1.87.0.bb => boost-build-native_1.89.0.bb} (88%)

diff --git a/meta/recipes-support/boost/boost-build-native_1.87.0.bb b/meta/recipes-support/boost/boost-build-native_1.89.0.bb
similarity index 88%
rename from meta/recipes-support/boost/boost-build-native_1.87.0.bb
rename to meta/recipes-support/boost/boost-build-native_1.89.0.bb
index 5b914b6f88..911de72bc1 100644
--- a/meta/recipes-support/boost/boost-build-native_1.87.0.bb
+++ b/meta/recipes-support/boost/boost-build-native_1.89.0.bb
@@ -6,8 +6,8 @@ SECTION = "devel"
 LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
-SRC_URI = "git://github.com/boostorg/build;protocol=https;branch=master"
-SRCREV = "4a52d8c06635435b64e31a56eaf7ca5dc912a71d"
+SRC_URI = "git://github.com/boostorg/build;protocol=https;branch=master;tag=boost-${PV}"
+SRCREV = "be69c44857e34fae250aa1321808a05c1d88bfde"
 PE = "1"
 
 UPSTREAM_CHECK_GITTAGREGEX = "boost-(?P<pver>(\d+(\.\d+)+))"

