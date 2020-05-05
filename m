Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
 by mx.groups.io with SMTP id smtpd.web10.1529.1588648888659805761
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2020 20:21:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=FcjhlosG;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.196, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f196.google.com with SMTP id b6so217291plz.13
        for <openembedded-core@lists.openembedded.org>; Mon, 04 May 2020 20:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Hq7hQnu4svXBtusIvAAzsKorQNUiGV+95t41RbLYvUs=;
        b=FcjhlosGWZzvxfQWJrNq/VcbLBbBAsXUNoiwlnRUhA+5t3sDeEs8K1azlCe9zXyjvs
         VQM/F1s9XOyVKtUj3ty7QdOShHXGc5lkSUckVJm1JUi9k17ezCguHMcDN/ZRDWWNZNiI
         Z2cpXDAQ5kyAsmBZykES0KXs7TcxL71ZZs7N7Fh3pAmsRKcp1aIytTF2ZX6s80fJCVoP
         eyXDzMaHx8RloAX7QrPJJ3c83dne7UM1DmrRMuPetsYTm5Hgm5d1YgIL1I2kIj3EnmGU
         lkxSMcD2qdoEpncEIBnM1ExyeCnlQu1UbYgX/5lk1Zc6B6ZoONzjbAlC/+lSxCxYTlng
         4LDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Hq7hQnu4svXBtusIvAAzsKorQNUiGV+95t41RbLYvUs=;
        b=XLvbcAxe/3sc2cq5p6GXqoNSp8HbQnudXh13e2Ro3NNbUKin4cr9BbffWSxwNLO1Bz
         4/JQtiRSBdq7fzjeyoO3ymXaT/Gu3t8BSSCpCqeuuHAtWOmzQ2wZY6NLSRZoS22EgZ6q
         Lc1ZF7pQNJLx4t8TL4bW5R6pXY3gPC41OLfqcOAtmFAdkDT6IcxSg+Caup63TYi6n5H9
         kEimJRhxj+DaxTEeVxuEqylPwkvRZ30t3DGzR2R4urN8ZDA1842CehmF3Mjm3OyNFRfg
         Yb2WB22/TiCaECIi+9NKekNUkEm9PIbOwrzp0TZmJP+Blt7YjN6+V+K4WCwsYT01mO7L
         zuzw==
X-Gm-Message-State: AGi0PuZRH95LssHHoLXbrwPKs4xwVuvxu+LsoAPcSAwC44MU9Gifbz7I
	ZYZbCw9i669QJmkf9OzFoQPip5ls/uiEww==
X-Google-Smtp-Source: APiQypLOXWOQ/+TgtOdCs0/vmJxuJ3xprKSOjBrvOuHNe5CKZfnsnCltn7j1ZikDEwvp8N/SffsK3Q==
X-Received: by 2002:a17:90a:a608:: with SMTP id c8mr404932pjq.90.1588648887625;
        Mon, 04 May 2020 20:21:27 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 20sm503379pfx.116.2020.05.04.20.21.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 20:21:27 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 28/28] icu: CVE-2020-10531
Date: Mon,  4 May 2020 17:19:23 -1000
Message-Id: <12f0cbf348d5acb0a7913bb5dc98e7fccc5ec34f.1588638879.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1588638879.git.steve@sakoman.com>
References: <cover.1588638879.git.steve@sakoman.com>

From: Wang Mingyu <wangmy@cn.fujitsu.com>

security Advisory

References:
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-10531

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../icu/icu/CVE-2020-10531.patch              | 128 ++++++++++++++++++
 meta/recipes-support/icu/icu_66.1.bb          |   1 +
 2 files changed, 129 insertions(+)
 create mode 100644 meta/recipes-support/icu/icu/CVE-2020-10531.patch

diff --git a/meta/recipes-support/icu/icu/CVE-2020-10531.patch b/meta/recipes-support/icu/icu/CVE-2020-10531.patch
new file mode 100644
index 0000000000..6697b27dc8
--- /dev/null
+++ b/meta/recipes-support/icu/icu/CVE-2020-10531.patch
@@ -0,0 +1,128 @@
+From b7d08bc04a4296982fcef8b6b8a354a9e4e7afca Mon Sep 17 00:00:00 2001
+From: Frank Tang <ftang@chromium.org>
+Date: Sat, 1 Feb 2020 02:39:04 +0000
+Subject: [PATCH] ICU-20958 Prevent SEGV_MAPERR in append
+
+See #971
+
+Upstream-Status: Accepted
+CVE: CVE-2020-10531
+
+Reference to upstream patch:
+https://github.com/unicode-org/icu/commit/b7d08bc04a4296982fcef8b6b8a354a9e4e7afca
+
+---
+ common/unistr.cpp          |  6 ++-
+ test/intltest/ustrtest.cpp | 62 +++++++++++++++++++++++++++++++
+ test/intltest/ustrtest.h   |  1 +
+ 3 files changed, 68 insertions(+), 1 deletion(-)
+
+diff --git a/common/unistr.cpp b/common/unistr.cpp
+index 901bb33..6ea0915 100644
+--- a/common/unistr.cpp
++++ b/common/unistr.cpp
+@@ -1563,7 +1563,11 @@ UnicodeString::doAppend(const UChar *srcChars, int32_t srcStart, int32_t srcLeng
+   }
+ 
+   int32_t oldLength = length();
+-  int32_t newLength = oldLength + srcLength;
++  int32_t newLength; 
++  if (uprv_add32_overflow(oldLength, srcLength, &newLength)) { 
++     setToBogus(); 
++     return *this; 
++  }
+ 
+   // Check for append onto ourself
+   const UChar* oldArray = getArrayStart();
+diff --git a/test/intltest/ustrtest.cpp b/test/intltest/ustrtest.cpp
+index b6515ea..ad38bdf 100644
+--- a/test/intltest/ustrtest.cpp
++++ b/test/intltest/ustrtest.cpp
+@@ -67,6 +67,7 @@ void UnicodeStringTest::runIndexedTest( int32_t index, UBool exec, const char* &
+     TESTCASE_AUTO(TestWCharPointers);
+     TESTCASE_AUTO(TestNullPointers);
+     TESTCASE_AUTO(TestUnicodeStringInsertAppendToSelf);
++    TESTCASE_AUTO(TestLargeAppend);
+     TESTCASE_AUTO_END;
+ }
+ 
+@@ -2310,3 +2311,64 @@ void UnicodeStringTest::TestUnicodeStringInsertAppendToSelf() {
+     str.insert(2, sub);
+     assertEquals("", u"abbcdcde", str);
+ }
++
++void UnicodeStringTest::TestLargeAppend() {
++    if(quick) return;
++
++    IcuTestErrorCode status(*this, "TestLargeAppend");
++    // Make a large UnicodeString
++    int32_t len = 0xAFFFFFF;
++    UnicodeString str;
++    char16_t *buf = str.getBuffer(len);
++    // A fast way to set buffer to valid Unicode.
++    // 4E4E is a valid unicode character
++    uprv_memset(buf, 0x4e, len * 2);
++    str.releaseBuffer(len);
++    UnicodeString dest;
++    // Append it 16 times
++    // 0xAFFFFFF times 16 is 0xA4FFFFF1,
++    // which is greater than INT32_MAX, which is 0x7FFFFFFF.
++    int64_t total = 0;
++    for (int32_t i = 0; i < 16; i++) {
++        dest.append(str);
++        total += len;
++        if (total <= INT32_MAX) {
++            assertFalse("dest is not bogus", dest.isBogus());
++        } else {
++            assertTrue("dest should be bogus", dest.isBogus());
++        }
++    }
++    dest.remove();
++    total = 0;
++    for (int32_t i = 0; i < 16; i++) {
++        dest.append(str);
++        total += len;
++        if (total + len <= INT32_MAX) {
++            assertFalse("dest is not bogus", dest.isBogus());
++        } else if (total <= INT32_MAX) {
++            // Check that a string of exactly the maximum size works
++            UnicodeString str2;
++            int32_t remain = INT32_MAX - total;
++            char16_t *buf2 = str2.getBuffer(remain);
++            if (buf2 == nullptr) {
++                // if somehow memory allocation fail, return the test
++                return;
++            }
++            uprv_memset(buf2, 0x4e, remain * 2);
++            str2.releaseBuffer(remain);
++            dest.append(str2);
++            total += remain;
++            assertEquals("When a string of exactly the maximum size works", (int64_t)INT32_MAX, total);
++            assertEquals("When a string of exactly the maximum size works", INT32_MAX, dest.length());
++            assertFalse("dest is not bogus", dest.isBogus());
++
++            // Check that a string size+1 goes bogus
++            str2.truncate(1);
++            dest.append(str2);
++            total++;
++            assertTrue("dest should be bogus", dest.isBogus());
++        } else {
++            assertTrue("dest should be bogus", dest.isBogus());
++        }
++    }
++}
+diff --git a/test/intltest/ustrtest.h b/test/intltest/ustrtest.h
+index 218befd..4a356a9 100644
+--- a/test/intltest/ustrtest.h
++++ b/test/intltest/ustrtest.h
+@@ -97,6 +97,7 @@ public:
+     void TestWCharPointers();
+     void TestNullPointers();
+     void TestUnicodeStringInsertAppendToSelf();
++    void TestLargeAppend();
+ };
+ 
+ #endif
+-- 
+2.17.1
+
diff --git a/meta/recipes-support/icu/icu_66.1.bb b/meta/recipes-support/icu/icu_66.1.bb
index f2bb344e33..a8096c1840 100644
--- a/meta/recipes-support/icu/icu_66.1.bb
+++ b/meta/recipes-support/icu/icu_66.1.bb
@@ -26,6 +26,7 @@ SRC_URI = "${BASE_SRC_URI};name=code \
            file://fix-install-manx.patch \
            file://0001-Fix-big-endian-build.patch;apply=no \
            file://0001-icu-Added-armeb-support.patch \
+           file://CVE-2020-10531.patch \
            "
 
 SRC_URI_append_class-target = "\
-- 
2.17.1

