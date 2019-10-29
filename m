Return-Path: <akuster808@gmail.com>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id AC2557FB11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 09:47:53 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id w9so1636419wmm.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 02:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=LKm146eIPR4mRAfn2CZUrWTyFi2BA9VlFH1jxLSXmno=;
	b=WukJkUKUVxXBLYH4oOdl/b3hM5/JaYaxgnwJFbWSUfoe31GtaEPW/t8BJDweGcDR/4
	MHUHir9ov1XUFVISdhWSZqAC3SvSiKhDPWSb2LUplTQIV8r48ZtF4mCKkPyO0+yj8UAE
	Oalfoe6xFI8jpndFK/F9NERiB8wfHMqnYtAU++JuR6vXeG3NWDCXthMk56+oB0y6vK1Q
	fe6KcGyHdyd7bqE5iOrvvWI3IjPXWbWuKjA6rO1I9Xi6UmnZMYPi0+PIkMffj/nwwJ3s
	464Ma87bhHSj/kl4POkGP9nnSdx98Zn6FX2hdiC/tDziDCtWSbzxFDRnKimGKl20FryE
	/w+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=LKm146eIPR4mRAfn2CZUrWTyFi2BA9VlFH1jxLSXmno=;
	b=Xy1eIVROKZwI4v3WuLRiamTI3HF984ZkwmnwuJ7VyhGPai/zKH6hwCXdVxU0+9d8sH
	xS05p280orTd29Ir9p2LZAqaVa3GT5q+JoPJakpJIcj3Ey1sG1xb49TOO75Bd6RxMlaI
	iQhR7aE+IOYAZYeNbsRj5wOalsfccWADrSzXf+rpMDKcbiFf0EQ8a6rVIbaoM0E2+Lrw
	rgbb5GslzFRw+MuC/ac8QStluylkqcrGDGWzB01+AoCd4viMqzQmQT21s6uxTfwp3jO8
	ZpVzPc1Fis+Wz5gOhjvwuxhotXMD+jErf053gncNTNgaxZtw6kuUAWcBh2uiFA2ns/Tu
	2PXw==
X-Gm-Message-State: APjAAAXLtdrj48eDO10ckO8Z8lrOLBL8pmevhGDWdehfa+bLKIytrv6t
	g2lI4Xv638aBiVmphitDxsIZhWTIdrg=
X-Google-Smtp-Source: APXvYqxNW721xxoRcY/mmP8kMy5bBjlxhcd6PngxVpQzpKGJM5nGVME0C8ASrFGh9nHGvuvVBOTHvw==
X-Received: by 2002:a1c:7f44:: with SMTP id a65mr3159964wmd.19.1572342473564; 
	Tue, 29 Oct 2019 02:47:53 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com ([91.217.168.176])
	by smtp.gmail.com with ESMTPSA id
	36sm29150537wrj.42.2019.10.29.02.47.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 29 Oct 2019 02:47:53 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Oct 2019 10:47:26 +0100
Message-Id: <754ecbc73b7931474d15ec31da99edebeb0c8185.1572341125.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1572341125.git.akuster808@gmail.com>
References: <cover.1572341125.git.akuster808@gmail.com>
Subject: [warrior 13/19] python: CVE-2019-16056
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
X-List-Received-Date: Tue, 29 Oct 2019 09:47:54 -0000

From: Chen Qi <Qi.Chen@windriver.com>

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit 27be9cf71a6fe906a23e81b56f1cc18a6fc9ef97)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...55-Dont-parse-domains-containing-GH-13079.patch | 90 ++++++++++++++++++++++
 meta/recipes-devtools/python/python_2.7.16.bb      |  1 +
 2 files changed, 91 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python/0001-2.7-bpo-34155-Dont-parse-domains-containing-GH-13079.patch

diff --git a/meta/recipes-devtools/python/python/0001-2.7-bpo-34155-Dont-parse-domains-containing-GH-13079.patch b/meta/recipes-devtools/python/python/0001-2.7-bpo-34155-Dont-parse-domains-containing-GH-13079.patch
new file mode 100644
index 0000000..5415472
--- /dev/null
+++ b/meta/recipes-devtools/python/python/0001-2.7-bpo-34155-Dont-parse-domains-containing-GH-13079.patch
@@ -0,0 +1,90 @@
+From 532ed09c5454bb789a301bb6f1339a0818255610 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Roberto=20C=2E=20S=C3=A1nchez?= <roberto@connexer.com>
+Date: Sat, 14 Sep 2019 13:26:38 -0400
+Subject: [PATCH] [2.7] bpo-34155: Dont parse domains containing @ (GH-13079)
+ (GH-16006)
+
+This change skips parsing of email addresses where domains include a "@" character, which can be maliciously used since the local part is returned as a complete address.
+
+(cherry picked from commit 8cb65d1381b027f0b09ee36bfed7f35bb4dec9a9)
+
+Excludes changes to Lib/email/_header_value_parser.py, which did not
+exist in 2.7.
+
+Co-authored-by: jpic <jpic@users.noreply.github.com>
+
+https://bugs.python.org/issue34155
+
+Upstream-Status: Backport [https://github.com/python/cpython/commit/8cb65d1381b027f0b09ee36bfed7f35bb4dec9a9]
+
+CVE: CVE-2019-16056
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ Lib/email/_parseaddr.py                            | 11 ++++++++++-
+ Lib/email/test/test_email.py                       | 14 ++++++++++++++
+ .../2019-05-04-13-33-37.bpo-34155.MJll68.rst       |  1 +
+ 3 files changed, 25 insertions(+), 1 deletion(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2019-05-04-13-33-37.bpo-34155.MJll68.rst
+
+diff --git a/Lib/email/_parseaddr.py b/Lib/email/_parseaddr.py
+index 690db2c22d..dc49d2e45a 100644
+--- a/Lib/email/_parseaddr.py
++++ b/Lib/email/_parseaddr.py
+@@ -336,7 +336,12 @@ class AddrlistClass:
+         aslist.append('@')
+         self.pos += 1
+         self.gotonext()
+-        return EMPTYSTRING.join(aslist) + self.getdomain()
++        domain = self.getdomain()
++        if not domain:
++            # Invalid domain, return an empty address instead of returning a
++            # local part to denote failed parsing.
++            return EMPTYSTRING
++        return EMPTYSTRING.join(aslist) + domain
+ 
+     def getdomain(self):
+         """Get the complete domain name from an address."""
+@@ -351,6 +356,10 @@ class AddrlistClass:
+             elif self.field[self.pos] == '.':
+                 self.pos += 1
+                 sdlist.append('.')
++            elif self.field[self.pos] == '@':
++                # bpo-34155: Don't parse domains with two `@` like
++                # `a@malicious.org@important.com`.
++                return EMPTYSTRING
+             elif self.field[self.pos] in self.atomends:
+                 break
+             else:
+diff --git a/Lib/email/test/test_email.py b/Lib/email/test/test_email.py
+index 4b4dee3d34..2efe44ac5a 100644
+--- a/Lib/email/test/test_email.py
++++ b/Lib/email/test/test_email.py
+@@ -2306,6 +2306,20 @@ class TestMiscellaneous(TestEmailBase):
+         self.assertEqual(Utils.parseaddr('<>'), ('', ''))
+         self.assertEqual(Utils.formataddr(Utils.parseaddr('<>')), '')
+ 
++    def test_parseaddr_multiple_domains(self):
++        self.assertEqual(
++            Utils.parseaddr('a@b@c'),
++            ('', '')
++        )
++        self.assertEqual(
++            Utils.parseaddr('a@b.c@c'),
++            ('', '')
++        )
++        self.assertEqual(
++            Utils.parseaddr('a@172.17.0.1@c'),
++            ('', '')
++        )
++
+     def test_noquote_dump(self):
+         self.assertEqual(
+             Utils.formataddr(('A Silly Person', 'person@dom.ain')),
+diff --git a/Misc/NEWS.d/next/Security/2019-05-04-13-33-37.bpo-34155.MJll68.rst b/Misc/NEWS.d/next/Security/2019-05-04-13-33-37.bpo-34155.MJll68.rst
+new file mode 100644
+index 0000000000..50292e29ed
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2019-05-04-13-33-37.bpo-34155.MJll68.rst
+@@ -0,0 +1 @@
++Fix parsing of invalid email addresses with more than one ``@`` (e.g. a@b@c.com.) to not return the part before 2nd ``@`` as valid email address. Patch by maxking & jpic.
diff --git a/meta/recipes-devtools/python/python_2.7.16.bb b/meta/recipes-devtools/python/python_2.7.16.bb
index ec724c3..b263e72 100644
--- a/meta/recipes-devtools/python/python_2.7.16.bb
+++ b/meta/recipes-devtools/python/python_2.7.16.bb
@@ -30,6 +30,7 @@ SRC_URI += " \
            file://support_SOURCE_DATE_EPOCH_in_py_compile_2.7.patch \
            file://float-endian.patch \
            file://0001-python2-use-cc_basename-to-replace-CC-for-checking-c.patch \
+           file://0001-2.7-bpo-34155-Dont-parse-domains-containing-GH-13079.patch \
 "
 
 S = "${WORKDIR}/Python-${PV}"
-- 
2.7.4


