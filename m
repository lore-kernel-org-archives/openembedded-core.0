Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id 504937F4FE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 15:20:04 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id k13so1585191pgh.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 07:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=HCF5Yf/NF5KmbEgggPsikByUMybSwriJ+krOIgcpma8=;
	b=KvPb2KsuFTyUg0WcmNtxqrNS5udIc2sOPQzA15Ntel0fQS5rLJrh96q3wDTxcLw14O
	Ur51dvLGM6GjleGzXPOzSSThBnIXNgbFXRiDZchT2HyFdYuZKUihYjpJEK1wmSEad6hb
	pelgp+zu2VrSvXnclRYMP3qpyJwFis0WV70cxBGODFd9ZerQLGoIWf+4rG44WS6z94/L
	kdZpFfvKOU4qgKjX9YEN9leUFg8orIIGS0cSBaRbwvP7PSbAOFfKUtx0/IBb3G5EqOkq
	v99+xyULYJYRv5W1L1qldGrof5hX3nNZS/XYA1rKNXfvYX3VKTfgPbK6zU2/qOvqo8Js
	zGQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=HCF5Yf/NF5KmbEgggPsikByUMybSwriJ+krOIgcpma8=;
	b=FYZ6gYkYFrxZdS5lQUmXuvvaPoDfpU4KTRMHGmpFgDPlVG/9kGDEwT7D89HB8dVSIb
	pq/V/edtATsd7T3+xHxeC1UWh28fau2qLZoTXU7vHH75JHT+nIJ7UeScafUIhdhYCaGI
	Pvx5MMsh6HzqD5HrOUUkFXwILx/tuqqGJYySw+ZDSIenOoiRGDTYd+tqQx39f0ffEz3g
	wSpKfkCLzw1i37b6s0oFby5sf9upDS0E+/nAy7OWXPnz1ua7j0cJQVdoZ4RC/28h1Fqi
	kzff8ZvFq9GKnGItaHO7zd9w9SZFP6mbM5rp/4xlWfwuNSBaAixDU330gjEGXWe72Big
	2M8Q==
X-Gm-Message-State: APjAAAV5zmTorPACOF/aQRhvICyloVZzbv0WPdzyqOWEHrdR6LB4bEdF
	qPWJXvYOOjfb9b8SiTp4WqBhK9k8
X-Google-Smtp-Source: APXvYqz2aSv7GIXafkLjMxFnrgQ6PeSC06ta28AGX/PiWAWtUTAUri2NVUqraKPu1OWoo8GNKclIYA==
X-Received: by 2002:a17:90a:1446:: with SMTP id
	j64mr5734692pja.142.1573658405087; 
	Wed, 13 Nov 2019 07:20:05 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id t8sm2622242pjr.25.2019.11.13.07.20.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Nov 2019 07:20:04 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2019 07:19:22 -0800
Message-Id: <8818a7e878644d1c695385eb256f53a34179fbbb.1573658232.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573658232.git.akuster808@gmail.com>
References: <cover.1573658232.git.akuster808@gmail.com>
Subject: [warrior 19/25] python3: CVE-2019-16056
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
X-List-Received-Date: Wed, 13 Nov 2019 15:20:04 -0000

From: Chen Qi <Qi.Chen@windriver.com>

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...55-Dont-parse-domains-containing-GH-13079.patch | 132 +++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.7.4.bb      |   1 +
 2 files changed, 133 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-bpo-34155-Dont-parse-domains-containing-GH-13079.patch

diff --git a/meta/recipes-devtools/python/python3/0001-bpo-34155-Dont-parse-domains-containing-GH-13079.patch b/meta/recipes-devtools/python/python3/0001-bpo-34155-Dont-parse-domains-containing-GH-13079.patch
new file mode 100644
index 0000000..319e7ed
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-bpo-34155-Dont-parse-domains-containing-GH-13079.patch
@@ -0,0 +1,132 @@
+From 90d56127ae15b1e452755e62c77dc475dedf7161 Mon Sep 17 00:00:00 2001
+From: jpic <jpic@users.noreply.github.com>
+Date: Wed, 17 Jul 2019 23:54:25 +0200
+Subject: [PATCH] bpo-34155: Dont parse domains containing @ (GH-13079)
+
+Before:
+
+        >>> email.message_from_string('From: a@malicious.org@important.com', policy=email.policy.default)['from'].addresses
+        (Address(display_name='', username='a', domain='malicious.org'),)
+
+        >>> parseaddr('a@malicious.org@important.com')
+        ('', 'a@malicious.org')
+
+    After:
+
+        >>> email.message_from_string('From: a@malicious.org@important.com', policy=email.policy.default)['from'].addresses
+        (Address(display_name='', username='', domain=''),)
+
+        >>> parseaddr('a@malicious.org@important.com')
+        ('', 'a@')
+
+https://bugs.python.org/issue34155
+
+Upstream-Status: Backport [https://github.com/python/cpython/commit/8cb65d1381b027f0b09ee36bfed7f35bb4dec9a9]
+
+CVE: CVE-2019-16056
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ Lib/email/_header_value_parser.py                  |  2 ++
+ Lib/email/_parseaddr.py                            | 11 ++++++++++-
+ Lib/test/test_email/test__header_value_parser.py   | 10 ++++++++++
+ Lib/test/test_email/test_email.py                  | 14 ++++++++++++++
+ .../2019-05-04-13-33-37.bpo-34155.MJll68.rst       |  1 +
+ 5 files changed, 37 insertions(+), 1 deletion(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2019-05-04-13-33-37.bpo-34155.MJll68.rst
+
+diff --git a/Lib/email/_header_value_parser.py b/Lib/email/_header_value_parser.py
+index fc00b4a098..bbc026ec71 100644
+--- a/Lib/email/_header_value_parser.py
++++ b/Lib/email/_header_value_parser.py
+@@ -1582,6 +1582,8 @@ def get_domain(value):
+         token, value = get_dot_atom(value)
+     except errors.HeaderParseError:
+         token, value = get_atom(value)
++    if value and value[0] == '@':
++        raise errors.HeaderParseError('Invalid Domain')
+     if leader is not None:
+         token[:0] = [leader]
+     domain.append(token)
+diff --git a/Lib/email/_parseaddr.py b/Lib/email/_parseaddr.py
+index cdfa3729ad..41ff6f8c00 100644
+--- a/Lib/email/_parseaddr.py
++++ b/Lib/email/_parseaddr.py
+@@ -379,7 +379,12 @@ class AddrlistClass:
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
+@@ -394,6 +399,10 @@ class AddrlistClass:
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
+diff --git a/Lib/test/test_email/test__header_value_parser.py b/Lib/test/test_email/test__header_value_parser.py
+index 693487bc96..7dc4de1b7b 100644
+--- a/Lib/test/test_email/test__header_value_parser.py
++++ b/Lib/test/test_email/test__header_value_parser.py
+@@ -1438,6 +1438,16 @@ class TestParser(TestParserMixin, TestEmailBase):
+         self.assertEqual(addr_spec.domain, 'example.com')
+         self.assertEqual(addr_spec.addr_spec, 'star.a.star@example.com')
+ 
++    def test_get_addr_spec_multiple_domains(self):
++        with self.assertRaises(errors.HeaderParseError):
++            parser.get_addr_spec('star@a.star@example.com')
++
++        with self.assertRaises(errors.HeaderParseError):
++            parser.get_addr_spec('star@a@example.com')
++
++        with self.assertRaises(errors.HeaderParseError):
++            parser.get_addr_spec('star@172.17.0.1@example.com')
++
+     # get_obs_route
+ 
+     def test_get_obs_route_simple(self):
+diff --git a/Lib/test/test_email/test_email.py b/Lib/test/test_email/test_email.py
+index c29cc56203..aa775881c5 100644
+--- a/Lib/test/test_email/test_email.py
++++ b/Lib/test/test_email/test_email.py
+@@ -3041,6 +3041,20 @@ class TestMiscellaneous(TestEmailBase):
+         self.assertEqual(utils.parseaddr('<>'), ('', ''))
+         self.assertEqual(utils.formataddr(utils.parseaddr('<>')), '')
+ 
++    def test_parseaddr_multiple_domains(self):
++        self.assertEqual(
++            utils.parseaddr('a@b@c'),
++            ('', '')
++        )
++        self.assertEqual(
++            utils.parseaddr('a@b.c@c'),
++            ('', '')
++        )
++        self.assertEqual(
++            utils.parseaddr('a@172.17.0.1@c'),
++            ('', '')
++        )
++
+     def test_noquote_dump(self):
+         self.assertEqual(
+             utils.formataddr(('A Silly Person', 'person@dom.ain')),
+diff --git a/Misc/NEWS.d/next/Security/2019-05-04-13-33-37.bpo-34155.MJll68.rst b/Misc/NEWS.d/next/Security/2019-05-04-13-33-37.bpo-34155.MJll68.rst
+new file mode 100644
+index 0000000000..50292e29ed
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2019-05-04-13-33-37.bpo-34155.MJll68.rst
+@@ -0,0 +1 @@
++Fix parsing of invalid email addresses with more than one ``@`` (e.g. a@b@c.com.) to not return the part before 2nd ``@`` as valid email address. Patch by maxking & jpic.
diff --git a/meta/recipes-devtools/python/python3_3.7.4.bb b/meta/recipes-devtools/python/python3_3.7.4.bb
index a3933b5..ce1a462 100644
--- a/meta/recipes-devtools/python/python3_3.7.4.bb
+++ b/meta/recipes-devtools/python/python3_3.7.4.bb
@@ -28,6 +28,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://reformat_sysconfig.py \
            file://0001-Use-FLAG_REF-always-for-interned-strings.patch \
            file://0001-test_locale.py-correct-the-test-output-format.patch \
+           file://0001-bpo-34155-Dont-parse-domains-containing-GH-13079.patch \
            "
 
 SRC_URI_append_class-native = " \
-- 
2.7.4


