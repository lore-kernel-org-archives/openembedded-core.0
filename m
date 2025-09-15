Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 233F2CAC597
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 18:10:55 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.1944.1757959854385163060
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 11:10:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iNNx635j;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7726c7ff7e5so3615438b3a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 11:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757959853; x=1758564653; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=itn7CDlPO654DFvwWhO563QqeWVac29hYc2spLTl0qw=;
        b=iNNx635jXV6S1JI2grbZsmUdx8DxC2HF9SNmfwefxICVD0FhNV2mG9zNpRTwAKuHa7
         5sExX8XGZtnYCC/jHax17GmqSqWQjatRje3+L67H7NyG/hdvJoL8ebfXNP3ljO5rSrto
         UUbCt39qHvsaO2vgBqGCyV08NQa7B6SQjayefPQDhZZJxd8wztQ2czKbeWpdu0KMYsuM
         giAS6RwF9AIUIRy8XduTkpOrxzwA1WISr30x/I3dZz1SYjCvjnYT44cBWDVLgk9gy58q
         BrZot+5jD9v5HTd2NF1xcH/eH7hN+ElnEP+ENJhgWFWA85xIb37VL8v9ND/fxauOOIlA
         sNnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757959853; x=1758564653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=itn7CDlPO654DFvwWhO563QqeWVac29hYc2spLTl0qw=;
        b=CufTMHeXreaq0WuR8O7/44+0kTQ1maEw6q1VTdOZwEqqRd3Ozp6pTVDpvvpZaJvTMx
         V8E+yfaAOXHYjIINKt1zT5UU6JcWZg18a/sn2bin+AKQ2LAxue+jZZG+mc+56XKlGgDz
         Ny7yjTfTZUOOqzdooT92w3WUUwscn6Aiwa9L5OEkelTsZBcjUk0LBBJ5Abu15tXclvBR
         +9pfIBi7b73Byp+9CjMQYya4iY86IFGa81H7zsFyhSXRmM4mGow5VB2nqwHsSX/EL9FH
         dnaBxdoBwHu3UQkZT1HHEDgHSsGZHmX1wvrQqb63p/MiaVXJYC1FthOvp9hQKxrNt8BF
         /Jew==
X-Gm-Message-State: AOJu0Yw/Q4WPXR14n1DJbses22eEIuaHSm4Tajjl/l/WvjvAksrdkz5Q
	X/8CgTkakACXeYZ9FY20FVZJ6mi9QaFMh9V2sTtuMGOWqm0IMHljj5sMM7B4oMNA
X-Gm-Gg: ASbGncvVf/3eDjXEZ766ZtgsYyDsU+ExcVnmyhRN++7gkYMtUGHnkmkdL7ro8ULbdkj
	Vj5MAYYuUPUbSprk1BErwMQC/WZ1wveX5DDwel7jeKdfvrc8MKOUK1C09bkJbW9sbWLdk20Olby
	S8o0WeBnB223a9uqujtWu8AkQ759fSIf4cxrh7lFx2UrIsx6aIdrAajmipxn+lpcH+ETjSbp/fE
	u722oWW29OWGJyjvD3HOc9N699pTvj8dIsI8ckYPM+GfkDYjYUFvalOr+qVXvFs+RwpogOtxz1U
	DJcW6IK7sQTV53/VI4yAChBMX2V6J9T3Acb29G6OSdZxdXr/lFG6rRSD0JU862ubTxC1jqpsfXT
	vV+8mjKgqJ9UtGWuDGMJv/be11HzKkTk/k6tRUcyZyz1Zo85wYPf22eCMYrqnMnVlrgbwoLWv0P
	lZtD3xKDN9Ygxu0x5EeZ3501BAEuYlK1Kyj3A5OWRC
X-Google-Smtp-Source: AGHT+IFZMq4AV3oSWnUd7pHqkzk5VjvFRQySUmEDbEw2vNgvFQjzCGX6Mg01/ZmX+ogEQLSQ7gucMw==
X-Received: by 2002:a05:6a20:7f89:b0:249:ba7b:e361 with SMTP id adf61e73a8af0-2602c90ceffmr17272451637.49.1757959853362;
        Mon, 15 Sep 2025 11:10:53 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::7b77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7761473eefasm11108589b3a.97.2025.09.15.11.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 11:10:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] apt: Always use libstdc++ when using clang compiler
Date: Mon, 15 Sep 2025 11:10:50 -0700
Message-ID: <20250915181050.2499453-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 18:10:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223497

apt is not portable across non libstdc++ systems yet
there is work to get it there but its still in progress
Default to use libstdc++ with clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Use libstdc++ instead of fixing the code to work with libc++ for now

 meta/recipes-devtools/apt/apt_3.0.3.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/apt/apt_3.0.3.bb b/meta/recipes-devtools/apt/apt_3.0.3.bb
index 03a6869393b..75d85dbbce3 100644
--- a/meta/recipes-devtools/apt/apt_3.0.3.bb
+++ b/meta/recipes-devtools/apt/apt_3.0.3.bb
@@ -58,6 +58,10 @@ PACKAGECONFIG ??= ""
 # the system doesn't have merged /usr folders.
 PACKAGECONFIG[usrmerge] = "-DREQUIRE_MERGED_USR=ON,-DREQUIRE_MERGED_USR=OFF"
 
+# Needed until https://salsa.debian.org/apt-team/apt/-/merge_requests/511 is fixed
+CXXFLAGS:append:toolchain-clang = " -stdlib=libstdc++"
+LDFLAGS:append:toolchain-clang = " -stdlib=libstdc++"
+
 do_configure:prepend() {
 	echo "set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE BOTH )" >>  ${WORKDIR}/toolchain.cmake
 }

