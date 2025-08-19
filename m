Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 668FDCA0EF7
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 01:01:39 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.3212.1755565295531383884
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Aug 2025 18:01:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a88REsUI;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-76e434a0118so3357905b3a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Aug 2025 18:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755565294; x=1756170094; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pKhs9g7cukSu6FscOQGK3VnMIGDSLPwVugMz0sk2mvY=;
        b=a88REsUIVvz7RL7YVZvSc1I+vgSbVwX77tWYRyXtTwb0cfGELsqxThjEF2YcTijrom
         cKbXE4jvDYdnGvGxl5iRlXXEAqDQ9Q6s7TwNaPjcpYOmmzae0lsV5e+jOGK00X2q+sOr
         ub7JGP+WlS3WJu4T/anKlKX/aqArozYxODIE/y/l0kMuF3ntFbLlpNGhzks6EQuM75Pz
         MYZOiTuz978d13OOarLoUlykEdvrygAUL559U5cCRag8BqJKMNBLtdfgKvkreg39pgjd
         1i3bRNpmTcUliQnmsRDde7k7cbyUXgqPK7vEqygbh148H3b1UtNCAmEB7Jyoe/yW/K+C
         iN3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755565294; x=1756170094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pKhs9g7cukSu6FscOQGK3VnMIGDSLPwVugMz0sk2mvY=;
        b=EjKE0vV278ebuLZaDWjB3sg4BKh8SnM1yOMBkrrZ/P4XuOECrgZ8XQ6ptdAjfzu9kS
         lCkbFJ/ty0Pl4zUrJFWTIHOpwK3MGg1KswluRcaSj3jQN3QdSJx2OCZGY5bbJSZzYhoQ
         VXDhzBeHeyam+O7lc9pb4sfZBxMiQjXccSfHAZ8SNRZvvpAopsGE+DamgIReRWNErVaG
         X6YPAmZHFXcoj0Nxzf5stgXGN7ALjVTPFctguY61oO6PNuwEqkn/W65HCheQQtv9zObG
         iRqY0QR7YGNp47PYhjnJMYtev+chn9xcYLIYEcNSZ9WuoQ5iAo5xO8/gHXnxflT+UNi4
         NPAA==
X-Gm-Message-State: AOJu0YwGHxmLwQfGrIeh4fp7QoUWDxnumUDdtmeQV3kFTpdmXDQXxZ3F
	rxu18QdX2T79EmKtLpn4u/W+7UzyBqD8Se/EhrvKTVqarfB4AEED+De21HmVCgpi
X-Gm-Gg: ASbGncuN0AeS1P/c+YrcdScwnH0qjCMnD164HUcSWYkDWJUc+kJ85sjKLx3nQGaIDZL
	FRRjSQABcmt7rlQDnJ83VN23wbL0Tv4dsOBRR2prhV56SkdRFlcMTHe3wZmhm1yI/RTiFEOUc1q
	MHKfTKJ92onb4IHfI93cZWY+fbTHjrTrOpfhiy3aDEpiIlNdOrQkqGNXkWH+iTjCkg4WL0DOdzM
	obgMToFE3NrVS3RQOcFpb4RCdlLQFhdkMjZoHOC3C9+tr0Q3rf9zZ8FSTAu4eeshP87Jv6qcqbM
	8sS4rTSYlIJix9nCGQYc0JD32u6i6Wzos7Oz6Q6DmQiMJvVCZrXl5YuIMTcZJwuG8U13vVob6lj
	sW6XUUPS4Bah3eX1zp0qwzw==
X-Google-Smtp-Source: AGHT+IEoI2UerxHB5e96JmJOibmFYJa0RXCiKPxaUx+eDSPzKjSkcsLXWWTvrBp9FhC8f8MKhI9N4A==
X-Received: by 2002:a05:6a20:9188:b0:240:406b:194c with SMTP id adf61e73a8af0-2430d4d61d0mr919619637.41.1755565294376;
        Mon, 18 Aug 2025 18:01:34 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::adc2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d544de1sm777859b3a.94.2025.08.18.18.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 18:01:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/3] m4: Fix ptest on musl
Date: Mon, 18 Aug 2025 18:01:28 -0700
Message-ID: <20250819010128.3519760-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250819010128.3519760-1-raj.khem@gmail.com>
References: <20250819010128.3519760-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 01:01:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222059

Fixes
../../sources/m4-1.4.20/tests/test-c32ispunct.c:261: assertion 'is == 0' failed
./test-c32ispunct.sh: line 36:   402 Aborted
(core dumped) LC_ALL="$testlocale" ${CHECKER} ./test-c32ispunct${EXEEXT} 3

FAIL: test-c32ispunct.sh

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/m4/m4-1.4.20.inc        |  1 +
 ...unct-Check-for-musl-along-with-glibc.patch | 26 +++++++++++++++++++
 2 files changed, 27 insertions(+)
 create mode 100644 meta/recipes-devtools/m4/m4/0001-test-c32ispunct-Check-for-musl-along-with-glibc.patch

diff --git a/meta/recipes-devtools/m4/m4-1.4.20.inc b/meta/recipes-devtools/m4/m4-1.4.20.inc
index aad57b8b649..0a7e018d296 100644
--- a/meta/recipes-devtools/m4/m4-1.4.20.inc
+++ b/meta/recipes-devtools/m4/m4-1.4.20.inc
@@ -8,6 +8,7 @@ inherit autotools texinfo ptest gettext
 
 SRC_URI = "${GNU_MIRROR}/m4/m4-${PV}.tar.gz \
            file://0001-gettext-h-Avoid-gcc-Wformat-security-warnings-with-d.patch \
+           file://0001-test-c32ispunct-Check-for-musl-along-with-glibc.patch \
            "
 SRC_URI:append:class-target = " file://run-ptest \
                                 file://serial-tests-config.patch \
diff --git a/meta/recipes-devtools/m4/m4/0001-test-c32ispunct-Check-for-musl-along-with-glibc.patch b/meta/recipes-devtools/m4/m4/0001-test-c32ispunct-Check-for-musl-along-with-glibc.patch
new file mode 100644
index 00000000000..fb03e94c52d
--- /dev/null
+++ b/meta/recipes-devtools/m4/m4/0001-test-c32ispunct-Check-for-musl-along-with-glibc.patch
@@ -0,0 +1,26 @@
+From 761aa7fab4a82dc01daa28799f4f1d6ae17a4c26 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 18 Aug 2025 11:31:32 -0700
+Subject: [PATCH] test-c32ispunct: Check for musl along with glibc
+
+This check crashes on musl based locales, other libcs
+e.g. glibc ignore it too.
+
+Upstream-Status: Submitted [https://lists.gnu.org/archive/html/m4-patches/2025-08/msg00000.html]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tests/test-c32ispunct.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/tests/test-c32ispunct.c
++++ b/tests/test-c32ispunct.c
+@@ -255,7 +255,7 @@ main (int argc, char *argv[])
+           is = for_character ("\360\235\204\200", 4);
+           ASSERT (is != 0);
+         #endif
+-        #if !(defined __GLIBC__ || (defined __APPLE__ && defined __MACH__) || defined __FreeBSD__ || defined __NetBSD__ || defined __OpenBSD__ || defined _AIX || defined __sun || defined __CYGWIN__ || (defined _WIN32 && !defined __CYGWIN__) || defined __ANDROID__)
++        #if !(defined __GLIBC__ || defined MUSL_LIBC || (defined __APPLE__ && defined __MACH__) || defined __FreeBSD__ || defined __NetBSD__ || defined __OpenBSD__ || defined _AIX || defined __sun || defined __CYGWIN__ || (defined _WIN32 && !defined __CYGWIN__) || defined __ANDROID__)
+           /* U+E003A TAG COLON */
+           is = for_character ("\363\240\200\272", 4);
+           ASSERT (is == 0);

