Return-Path: <akuster808@gmail.com>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id 089A57FBF5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Oct 2019 06:50:07 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id 6so5735268wmf.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 23:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=6VlHPiYWbrH8W8meV6MoSN8M26gg/2vizoyt9kTaghk=;
	b=Ti4zrra7evy1O7Oa7xsUxXKx5JBf11vH3BVkxCH02E3Ddy4YmQ1/LLIis3mRynvRIz
	fEMTg7aHCoSVLuSi4csUCVy+xl62kGJqgL3XhMe/BYh3JoLStYZnoCswXD2ikYO190OL
	CS/2tKaKw69AKd0P/QuAXHUVgkQ3A//nXW3vqjjmIXP9+TsTXwyPowAmL/NDfDyaonL6
	WCaS5okZPOuu+FnDnYnENkuwSaipWXrJD6fDxsQMTprFeBXSmdwcw5f6eljB0ngVPdxZ
	S/rfkbOZ1ZcYoWeWGKNHutmfuw7oQoxEBop/Q78+01ySdFOYp27IJXn76nMRXEI44ECv
	HFzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=6VlHPiYWbrH8W8meV6MoSN8M26gg/2vizoyt9kTaghk=;
	b=VKVlfGcs/zdr21ZvqONSDbmNWR61Md660ZM4ZyoXcrODjbOtLvDHSyVK+aCUc1UZbd
	AlB0e8aIEGgfRupI6Wh75rK53wdrh+NtipMGbSx5WSypN3Nmj9ws7Pp1NtZawr8AJ3M3
	LQ8ca8aaWTH+zPJrbrDimND7I78mwcaDpUPwqvNoqzjzrNmR6QZV2GZM/okeXR1v/1me
	dHLMXNSNu1C2CaMUujRrseboeeX/zy8oWIiBtgxrCe8W1doC7SCO0ukXd4Vj6KY91BfY
	DtE+lmQGPddbbeuWJ3B78BV+Ey3R+I4KzbUNzGezo0i1MZ7p+/xpUXB+3RywE7D2v+Oh
	FcXA==
X-Gm-Message-State: APjAAAVa1+ojk+E6p8ntSAfqNdOYQuByPYKGcS7HBJH5uUiV7YGOVcG9
	tu0r27K7krciXgrQa3LtqF2f1xsrnaA=
X-Google-Smtp-Source: APXvYqzWgnxbZrOaXdRyafeeXqM8Jxm7lxw9mFnzH8kRZxQYv6sYvF/5u+Ct2tBbzJUnLKNlRJoKUw==
X-Received: by 2002:a1c:9847:: with SMTP id a68mr6513625wme.18.1572072608271; 
	Fri, 25 Oct 2019 23:50:08 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.controleur.wifipass.org ([178.18.58.186])
	by smtp.gmail.com with ESMTPSA id v6sm4807911wru.72.2019.10.25.23.50.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 25 Oct 2019 23:50:07 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Oct 2019 23:49:36 -0700
Message-Id: <b80c0a4b6821da55d2882b60d5d3e7b21d43a383.1572072422.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1572072421.git.akuster808@gmail.com>
References: <cover.1572072421.git.akuster808@gmail.com>
Subject: [zeus 04/28] python3: CVE-2019-16056
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
X-List-Received-Date: Sat, 26 Oct 2019 06:50:08 -0000

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
index 8693c44..42818bf 100644
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


