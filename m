Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
	[209.85.128.43])
	by mail.openembedded.org (Postfix) with ESMTP id 474727C125
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 16:39:20 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id b11so3976934wmj.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 08:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=+mV7qq0RnYfXCrxHPYE8hQD1oUcwIoHz4Zvov8/vK8s=;
	b=ne0bk0UyjrTAsCWH+fcQE10CSUUIvjvHZGndUlRncejseFENNxyNEdTnIvvYjfk2zu
	gcbv+W7g/lA6yP2Xjv4vS+eN6529Y6NzdIv4i3QONkm0zBDgPJHhJFRx98ZF6Jdr1yTk
	mh+Pu7nEYJwMaMAKlem1pyUoV/50cN6YyMx7Nsd0I+EEX5+xwSjaLhM2UWW+3ZS5CzR6
	6aSX946GzlcVlSDO3cO1bN+1LvFAnX9q5ChHQRlyM/QsCOU7M95F6QXAuRQ5tRZwE1Ad
	HhI1Ng1MnqETcX9jkltZ5o0PxD/A/bnEI8ygsr2C+zr+S/uvPTNfvHYbn/6sQ1MHcIfD
	JLWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=+mV7qq0RnYfXCrxHPYE8hQD1oUcwIoHz4Zvov8/vK8s=;
	b=iJEKdO9CBXbhuqzIPBH6jKOHQBd2wfXp3V2k7otii4n6AYRDhzysxK5HNFatUcCwGt
	u3g21w7cg7mOSoGCRj9e7P0IFaMc0HJ325UhWVh1bOprQ4ZEmpbQsm/03FF5e/XEgmaE
	PAkcP5ZX6Dl74pCbTzCztRRI9bysHDLpFLc+d4ndFhQ7GMBn7B4EWSSYVY7AuYSaCdwM
	ZUzDuOoePWRFunzMOsRm8UdpAWP+Gp3DMBtZyH2V5LAV5b6mBvhu//zayx7wZiLWrE3P
	a3xoh8lGY7IdzBp9ERrvQEfaQfpgkf4kn4py1CfzN3VmIR0q22IiTUOiet8f5R5OjuyD
	56sA==
X-Gm-Message-State: AJcUukezkNYofS/GCBRBxxVi47RRz/cUzcv6CtF8t6WXLTSxDe0aGEXD
	oh0u/KSg2WbtYifSp3nQ6HFFabu5qWE=
X-Google-Smtp-Source: ALg8bN4Oe1aNl7H7XqbITbpFSdQoB7orKlKHfF/rn2wb5qVFyQWmnPq8UPNa6wTCjQwzkVvEJbGQTg==
X-Received: by 2002:a1c:2902:: with SMTP id p2mr4012324wmp.19.1547570360758;
	Tue, 15 Jan 2019 08:39:20 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	f15sm77594927wrt.10.2019.01.15.08.39.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Jan 2019 08:39:20 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jan 2019 17:38:52 +0100
Message-Id: <f172028179a4d0faf7327c53f59e529f9dda9c31.1547570285.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1547570285.git.alex.kanavin@gmail.com>
References: <cover.1547570285.git.alex.kanavin@gmail.com>
Subject: [PATCHv2 17/22] libjpeg-turbo: fix nativesdk build in same way as native builds are
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Jan 2019 16:39:20 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.1.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.1.bb
index d9d877dc0df..029847ff5f4 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.1.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.1.bb
@@ -31,6 +31,7 @@ inherit cmake pkgconfig
 
 # Add nasm-native dependency consistently for all build arches is hard
 EXTRA_OECMAKE_append_class-native = " -DWITH_SIMD=False"
+EXTRA_OECMAKE_append_class-nativesdk = " -DWITH_SIMD=False"
 
 # Work around missing x32 ABI support
 EXTRA_OECMAKE_append_class-target = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", "-DWITH_SIMD=False", "", d)}"
-- 
2.17.1


