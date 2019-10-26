Return-Path: <akuster808@gmail.com>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id E0D177FBFC
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Oct 2019 06:50:06 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id q130so4147400wme.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 23:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=AL2I4DX8PA1WJ+a5/4d6qnlDWX9viDHeSy4h1Ogqqvc=;
	b=u/aq5U/GQIWCUu0X+DxZdIZ3YLyvyNhnoE6wn/tgGA3UAnHdX8EkecAm/EeljHpjSZ
	Dwqhg1H2ny4Yp/eB2oh5mAjL/l5pqEZmgGo1lkVp99aNjbTH2i3Pl9avEa8jNJr5byb2
	V6bFsP8TLAMgi8k/fZ73z5a42+R0yhB3uW4f37sBl182mKFjiu2u57dY99p10/ejxWpr
	VTHOgNSrTfiu73lbDem+7k8bIahCYPFzUM+rfcJ1fQWPdfJLQUesJVAcGBKrBytmoKr6
	8mqkjwj9PyJeupiWJ6SugZe8pQdnuMtA3RWlBSx4oE1RgNiQO27uv2MLBGM0iWo5s/CA
	92mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=AL2I4DX8PA1WJ+a5/4d6qnlDWX9viDHeSy4h1Ogqqvc=;
	b=pQ8GOOTYGbxUsDPEUKCIt7QUBLcvBLiSyAMwMVHK8dKCZ46kKFz1dHAWaPVgIgbGec
	Y7x/Fqqq21Bw7PjhMP61yEV1/ZkCF9en5scBx2KxZs/FyerVSyL3ia3YmQagzLfAzxW6
	q5ftGLu4lAvfpkZi2hde0AMjkYq+2Smv5awCG6AnCF2kSed57LO3zbUUt9K5VCdtAnvI
	UpusjSmFOZAi1QQq2dJBPIYXsxN08ZXXR5nrSiSOgJ93bwwLq5wxyW/rhC/R7xdh1QHj
	TvLibseyHyjjNs5ASsuN+6Pj/oUeW3myBcTL4mmf3NH/2AYx5fwql37KT5QJUHJq887b
	UX4Q==
X-Gm-Message-State: APjAAAWE5W5g/9bxpiLFkYZvxe9o+fXIKbSy7hhnKdwybwTXiCPKozp0
	fhrvMWyKkhvc/fotzsyKYz4CvVYV/Is=
X-Google-Smtp-Source: APXvYqy/72yatrYIytog0Z2IMfr9ZLmq2QJPe82I1yq1UVRaLAJ95wvpkln2s/No2ETYwUPuvT1uNA==
X-Received: by 2002:a7b:c04c:: with SMTP id u12mr6193563wmc.134.1572072607266; 
	Fri, 25 Oct 2019 23:50:07 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.controleur.wifipass.org ([178.18.58.186])
	by smtp.gmail.com with ESMTPSA id v6sm4807911wru.72.2019.10.25.23.50.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 25 Oct 2019 23:50:06 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Oct 2019 23:49:35 -0700
Message-Id: <27be9cf71a6fe906a23e81b56f1cc18a6fc9ef97.1572072422.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1572072421.git.akuster808@gmail.com>
References: <cover.1572072421.git.akuster808@gmail.com>
Subject: [zeus 03/28] python: CVE-2019-16056
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
X-List-Received-Date: Sat, 26 Oct 2019 06:50:07 -0000

From: Chen Qi <Qi.Chen@windriver.com>

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
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
index 5b856a5..aec8778 100644
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


