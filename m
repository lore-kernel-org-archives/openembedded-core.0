Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id A4F287CE8F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Mar 2019 18:07:50 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id g6so1958331pfh.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Mar 2019 11:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=QXF60xZmEtNp9XU3LTCawBQQVZF9b/JlIBhkWY4EIrM=;
	b=u8a7HSVfSelVfyltv/3Ul9z1i1JsmXpTAH3bYMqie7fTT5tpmnGo0vUAbRlK7bt6Wa
	U+as3Rc6RgW4r/oQ6xvHuylcwPAEElrJsZJ0cJEOfCxRv+OjZi83swx499pbkMVclmTy
	ELTGPfiFJsorNNWUF5RzBUluItj+v7GvH3NTFgtAs7YTDs9P0hVvSCAe4KP6ZzM7SI0L
	bT5KFCxCsc0VaFiL7fafsyFJSs0V6uDEq7VeQfcOwTkSulybh6ywhgocpge7st9hqTQ+
	NnB2wwJGKTQmrCPgb+UtxpgglYI69z/mSSRU7J9GRq1qZfqrWlibZ8FgUDjowlrHeHrb
	KAyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=QXF60xZmEtNp9XU3LTCawBQQVZF9b/JlIBhkWY4EIrM=;
	b=hLkWEFoY4ZQjy4KyfKfrNOBK3wGSXvYfSwbQHP+d0ikqkc4pPYPGLmLkr+RCn/6Hls
	/W5UNAyY/rhIduvdCKMwd2NZrpzX7KxkrOvn/HE0NX2t4zHZ+EtjD2tU4VR8iBw5yBKm
	Q+fKkCsuovzI2Q9wVj7UZPwHGo+IciSxZQmMrZ/5iD6w6B6HN+eLTfa4Yuk/e8Ke9GiS
	g5P/B4RaWYLZ5fcjv1rtcmo4SDZjm1asp37Kb/rFf91W1gsk8/DgdRyrj0scDtIm/qp7
	oCD5IrNcupU9xokTq8FlrYdL+evlv6syNT3XU1sz2i2T1NaKBP35tT8f8QVCvgHC+qPn
	opVQ==
X-Gm-Message-State: APjAAAUiyy6jwnUcSFk7Mgavo+bbWCSs2Fm/+ARkmJEA5z0VYszXVYMH
	Aw8PyRvuS1nhuI3EPSuAaEvGrz6s
X-Google-Smtp-Source: APXvYqyao3P/y6O3OaYvHtzH7uo89gZUJJRf2+v7tFnLAfB5Cw1YKpwHnazarSlj7qOzqIuzuifmgw==
X-Received: by 2002:aa7:8157:: with SMTP id d23mr29198239pfn.67.1552241271629; 
	Sun, 10 Mar 2019 11:07:51 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:18fc:c150:6496:1a0d])
	by smtp.gmail.com with ESMTPSA id y6sm5999607pfy.87.2019.03.10.11.07.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 10 Mar 2019 11:07:51 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 10 Mar 2019 11:07:40 -0700
Message-Id: <1552241263-26116-9-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1552241263-26116-1-git-send-email-akuster808@gmail.com>
References: <1552241263-26116-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 09/12] nss: update to 3.42.1
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
X-List-Received-Date: Sun, 10 Mar 2019 18:07:52 -0000

remove nss-fix-SHA_HTONL-bug-for-arm-32be.patch now included

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../nss/nss-fix-SHA_HTONL-bug-for-arm-32be.patch   | 34 ----------------------
 .../nss/{nss_3.41.bb => nss_3.42.1.bb}             |  5 ++--
 2 files changed, 2 insertions(+), 37 deletions(-)
 delete mode 100644 meta/recipes-support/nss/nss/nss-fix-SHA_HTONL-bug-for-arm-32be.patch
 rename meta/recipes-support/nss/{nss_3.41.bb => nss_3.42.1.bb} (97%)

diff --git a/meta/recipes-support/nss/nss/nss-fix-SHA_HTONL-bug-for-arm-32be.patch b/meta/recipes-support/nss/nss/nss-fix-SHA_HTONL-bug-for-arm-32be.patch
deleted file mode 100644
index bb1c6e3..0000000
--- a/meta/recipes-support/nss/nss/nss-fix-SHA_HTONL-bug-for-arm-32be.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-Subject: [PATCH] Fix SHA_HTONL bug for arm 32be.
-
-In arm 32be, there is no need to reverse the host value.
-
-Upstream-Status: Pending
-
-Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
----
- lib/freebl/sha_fast.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/nss/lib/freebl/sha_fast.h b/nss/lib/freebl/sha_fast.h
-index 4f37d13..8072eda 100644
---- a/nss/lib/freebl/sha_fast.h
-+++ b/nss/lib/freebl/sha_fast.h
-@@ -99,6 +99,7 @@ swap4b(PRUint32 value)
-       defined(__ARM_ARCH_7__) ||   \
-       defined(__ARM_ARCH_7A__) ||  \
-       defined(__ARM_ARCH_7R__)))
-+#if defined(IS_LITTLE_ENDIAN)  
- static __inline__ PRUint32
- swap4b(PRUint32 value)
- {
-@@ -109,6 +110,7 @@ swap4b(PRUint32 value)
-     return ret;
- }
- #define SHA_HTONL(x) swap4b(x)
-+#endif
- 
- #endif /* x86 family */
- 
--- 
-2.7.4
-
diff --git a/meta/recipes-support/nss/nss_3.41.bb b/meta/recipes-support/nss/nss_3.42.1.bb
similarity index 97%
rename from meta/recipes-support/nss/nss_3.41.bb
rename to meta/recipes-support/nss/nss_3.42.1.bb
index 5ab22b1..b6bbd80 100644
--- a/meta/recipes-support/nss/nss_3.41.bb
+++ b/meta/recipes-support/nss/nss_3.42.1.bb
@@ -28,11 +28,10 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
            file://blank-cert9.db \
            file://blank-key4.db \
            file://system-pkcs11.txt \
-           file://nss-fix-SHA_HTONL-bug-for-arm-32be.patch \
            "
 
-SRC_URI[md5sum] = "eec62a289387a7ce2fd9cca1f76600f3"
-SRC_URI[sha256sum] = "ab2e18f5d0dd0079c0005396f9beb9a41e9a1bbc7e6c1d0a99affcef0471712d"
+SRC_URI[md5sum] = "1f6cc6c702379478a3a72298caaef0a7"
+SRC_URI[sha256sum] = "087db37d38fd49dfd584dd2a8b5baa7fc88de7c9bd97c0c2d5be4abcafc61fc6"
 
 UPSTREAM_CHECK_URI = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>.+)_release_notes"
-- 
2.7.4


