Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web12.14016.1598363820598937715
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2020 06:57:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Bc03DZN3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id t14so2182192wmi.3
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2020 06:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=gwHqkGN5pY0Z284VKtFN9W4wZxa8wcGcmWqVUAnbw8w=;
        b=Bc03DZN3HoBB/Xqd7kcP9hZfmr8JVVjkOSHgv5rb5ShTB7dJyU5uL3RvOOY8Pfdx+b
         ZkNbl/5UOujTksIp5YQaKRRg8ZoFPERatKwLEzbmxZKLGQ4+9FgqRGAR4VHcElGt69lb
         4fIIJ7Qv041yXN0X1oZKDyO8GXewJN586pIAw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gwHqkGN5pY0Z284VKtFN9W4wZxa8wcGcmWqVUAnbw8w=;
        b=KCbnpVpSihr8mVa1TzTM1BdFsytQS1bhePLDUtu3ANNOJPkPWY97lwi9d0hg6QOWsQ
         0n+CKUXYDVo870h0pvS/230ZMinL2/p68dZXzSJx9kdubJfziS6rqgbz3Cl4LZKXs3E4
         9UXKHPeR+3sv/IRFOg83rlvcHVqn6f1/kZ5F5Ds5GYaaHbvHlaRccwvxBrvKupejUQ2N
         S6DhCMjWQdmm505k0tPeWzAy6Pj5B13Nri4U1XCrNx/TX5dGOGtdibeL1GrbliMmO8uL
         JwpBZWWKGqeA5LyG5w7ZYdmLbyxbun2Hr5Go0kt1ZlEzgVisIKX2Hv2iw5XZpz4ADo2Y
         TWXg==
X-Gm-Message-State: AOAM530gutpngNpng9vH55ztG0eDdjcpDpvw8Qsawi87DB/Zv641L5Fe
	JrAkBbJH4GtJ6RiZEY0vykBc+aRw2QdJhWV2
X-Google-Smtp-Source: ABdhPJxPvakqNPALKjh4tfOGGuXreGGww+9cEPwQdo1NUdMP1TENj/KV2BBp4IlWMBf7CJ1zzySPrg==
X-Received: by 2002:a1c:f605:: with SMTP id w5mr2157250wmc.26.1598363818827;
        Tue, 25 Aug 2020 06:56:58 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (d.9.b.8.7.0.d.0.8.3.5.0.7.0.4.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:c407:538:d07:8b9d])
        by smtp.gmail.com with ESMTPSA id 32sm33674904wrh.18.2020.08.25.06.56.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2020 06:56:58 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] selftest/recipetool: Drop globbing SRC_URI test, no longer supported
Date: Tue, 25 Aug 2020 14:56:56 +0100
Message-Id: <20200825135656.1422309-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200825135656.1422309-1-richard.purdie@linuxfoundation.org>
References: <20200825135656.1422309-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Globbing is a bad idea in SRC_URI, it breaks the task checksums and
can't really be fixed. Since we're removing it, drop the test for
its interaction with recipetool.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../files/selftest-replaceme-src-globfile           |  1 -
 .../recipetool/selftest-recipetool-appendfile.bb    |  2 --
 meta/lib/oeqa/selftest/cases/recipetool.py          | 13 -------------
 3 files changed, 16 deletions(-)
 delete mode 100644 meta-selftest/recipes-test/recipetool/files/selftest-replaceme-src-globfile

diff --git a/meta-selftest/recipes-test/recipetool/files/selftest-replaceme-src-globfile b/meta-selftest/recipes-test/recipetool/files/selftest-replaceme-src-globfile
deleted file mode 100644
index 1e20a2b03eb..00000000000
--- a/meta-selftest/recipes-test/recipetool/files/selftest-replaceme-src-globfile
+++ /dev/null
@@ -1 +0,0 @@
-A file matched by a glob in SRC_URI
diff --git a/meta-selftest/recipes-test/recipetool/selftest-recipetool-appendfile.bb b/meta-selftest/recipes-test/recipetool/selftest-recipetool-appendfile.bb
index 7375c479330..b5f976708f4 100644
--- a/meta-selftest/recipes-test/recipetool/selftest-recipetool-appendfile.bb
+++ b/meta-selftest/recipes-test/recipetool/selftest-recipetool-appendfile.bb
@@ -10,7 +10,6 @@ SRC_URI = "file://installscript.sh \
            file://file1 \
            file://add-file.patch \
            file://subdir \
-           file://selftest-replaceme-src-glob* \
            file://selftest-replaceme-inst-globfile \
            file://selftest-replaceme-inst-todir-globfile \
            file://selftest-replaceme-inst-func"
@@ -27,7 +26,6 @@ do_install() {
 	install -m 0644 ${WORKDIR}/selftest-replaceme-todir ${D}${datadir}
 	install -m 0644 ${WORKDIR}/file1 ${D}${datadir}/selftest-replaceme-renamed
 	install -m 0644 ${WORKDIR}/subdir/fileinsubdir ${D}${datadir}/selftest-replaceme-subdir
-	install -m 0644 ${WORKDIR}/selftest-replaceme-src-globfile ${D}${datadir}/selftest-replaceme-src-globfile
 	cp ${WORKDIR}/selftest-replaceme-inst-glob* ${D}${datadir}/selftest-replaceme-inst-globfile
 	cp ${WORKDIR}/selftest-replaceme-inst-todir-glob* ${D}${datadir}
 	install -d ${D}${sysconfdir}
diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index c2ade2543a3..6bac53cf3da 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -226,19 +226,6 @@ class RecipetoolTests(RecipetoolBase):
         _, output = self._try_recipetool_appendfile('selftest-recipetool-appendfile', '/usr/share/selftest-replaceme-subdir', self.testfile, '', expectedlines, ['testfile'])
         self.assertNotIn('WARNING: ', output)
 
-    def test_recipetool_appendfile_src_glob(self):
-        # A file that's in SRC_URI as a glob
-        expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
-                         '\n',
-                         'SRC_URI += "file://testfile"\n',
-                         '\n',
-                         'do_install_append() {\n',
-                         '    install -d ${D}${datadir}\n',
-                         '    install -m 0644 ${WORKDIR}/testfile ${D}${datadir}/selftest-replaceme-src-globfile\n',
-                         '}\n']
-        _, output = self._try_recipetool_appendfile('selftest-recipetool-appendfile', '/usr/share/selftest-replaceme-src-globfile', self.testfile, '', expectedlines, ['testfile'])
-        self.assertNotIn('WARNING: ', output)
-
     def test_recipetool_appendfile_inst_glob(self):
         # A file that's in do_install as a glob
         expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
-- 
2.25.1

