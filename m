Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com
	[209.85.222.53])
	by mail.openembedded.org (Postfix) with ESMTP id 403C87F7EB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2019 10:40:45 +0000 (UTC)
Received: by mail-ua1-f53.google.com with SMTP id q11so5873908uao.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2019 03:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=hui2g4gWEQirGslevejLCDRbPaSjPEN/bE/tutiakKg=;
	b=Esq8qGc5RmHRLvJUNUQRkEtwE9AznCGy3MoFyZ9zBzrGvgQZA/+Unoglnq478GIFJx
	QKdvp3jrW8Q1GC2oUaQyrSyxDpC+LsyOYXuGeuC7rw6M5SkyYQns5NN47aoypWMUEqa3
	fY3rDii77XTnPeTt6WDbMUBOcTpUu/fjiwd49WIrYNNuB4iRuPgTGA9IQnzPNwhhYeyB
	xZd0C35dYm23k58236uSZQ9TLc/66OO4f8swnbxiGyfh+1005cMzy/5O0ROo62DWyJmC
	cvywuG48WmsVA3TXl+peQeX8cszn4GpCsu1Vl6EnCU2H08bFMZpXpjqZPstkA0lZxaU4
	wpqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hui2g4gWEQirGslevejLCDRbPaSjPEN/bE/tutiakKg=;
	b=j+bSM90p37Dnwgw+MXz5WCS5SMY5uM5pQPjqr5HHU8WaI1BQ4Td8MHi1x3Tdocq9/P
	nYclbd8U1X644WlEtkSl/H8PK+4jyK+vKA2wpOO+gejgmoFUnI1GjB35LvDpvyCk48jF
	BJI+LjxzvvwCW/Y23k2E0GAIqP2ZrOtZLRhDOp3hCq8gLrsRcjW2s7+sBt+PLIMaBgs4
	ZwwGw8DLZLgF7SroY6S34mpYGypuBDzHtkP4/dQ8qqusGxo6OQtiRhS4mvB7MUtK1+Qu
	vm/BUrobTyU1L8buBN0bC7oqEKygNQsD21xC7uQocVSxi4zWWMwVFqCnPZLj/HOqNUJs
	fJsw==
X-Gm-Message-State: APjAAAXDxDsY+v0Oyu5qNlO450OJw55Wm5vMjFk/o65CfWbjfOhHVeiy
	rLUXxta4w6tyJV31T50nNdSkiNyVPHzfd92rrmU=
X-Google-Smtp-Source: APXvYqzYEfkTlO7ZfrtGYF0MP018x5RuudXb5PTE3XVLRt1/XCNZve7YpsabwB6936noNYjjxlXOv2athEFU3DCO8NI=
X-Received: by 2002:ab0:1c06:: with SMTP id a6mr2499665uaj.93.1571827244763;
	Wed, 23 Oct 2019 03:40:44 -0700 (PDT)
MIME-Version: 1.0
References: <20191023103639.4847-1-bunk@stusta.de>
In-Reply-To: <20191023103639.4847-1-bunk@stusta.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 23 Oct 2019 12:40:33 +0200
Message-ID: <CANNYZj-6R9ykS22Rt8C9A90WXVrfX0ekc6HjCDi2JC51yQ53gQ@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python3: Upgrade 3.7.4 -> 3.7.5
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
X-List-Received-Date: Wed, 23 Oct 2019 10:40:45 -0000
Content-Type: multipart/alternative; boundary="000000000000928fa40595918cd5"

--000000000000928fa40595918cd5
Content-Type: text/plain; charset="UTF-8"

Python 3.8.0 is now out, so we should upgrade directly to that version.

Alex

On Wed, 23 Oct 2019 at 12:37, Adrian Bunk <bunk@stusta.de> wrote:

> Backported patch removed.
>
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>  ...lib-as-location-for-site-packages-an.patch |   2 +-
>  ...nt-parse-domains-containing-GH-13079.patch | 132 ------------------
>  ...asename-to-replace-CC-for-checking-c.patch |   2 +-
>  .../{python3_3.7.4.bb => python3_3.7.5.bb}    |   5 +-
>  4 files changed, 4 insertions(+), 137 deletions(-)
>  delete mode 100644
> meta/recipes-devtools/python/python3/0001-bpo-34155-Dont-parse-domains-containing-GH-13079.patch
>  rename meta/recipes-devtools/python/{python3_3.7.4.bb => python3_3.7.5.bb}
> (98%)
>
> diff --git
> a/meta/recipes-devtools/python/python3/0001-Do-not-hardcode-lib-as-location-for-site-packages-an.patch
> b/meta/recipes-devtools/python/python3/0001-Do-not-hardcode-lib-as-location-for-site-packages-an.patch
> index 661f52d01f..ea75262c4f 100644
> ---
> a/meta/recipes-devtools/python/python3/0001-Do-not-hardcode-lib-as-location-for-site-packages-an.patch
> +++
> b/meta/recipes-devtools/python/python3/0001-Do-not-hardcode-lib-as-location-for-site-packages-an.patch
> @@ -70,7 +70,7 @@ index 6e81b2f..671a20e 100644
>
>   Programs/python.o: $(srcdir)/Programs/python.c
>  @@ -856,7 +857,7 @@ regen-opcode:
> - Python/compile.o Python/symtable.o Python/ast_unparse.o Python/ast.o:
> $(srcdir)/Include/graminit.h $(srcdir)/Include/Python-ast.h
> + Python/compile.o Python/symtable.o Python/ast_unparse.o Python/ast.o
> Python/future.o Parser/parsetok.o: $(srcdir)/Include/graminit.h
> $(srcdir)/Include/Python-ast.h
>
>   Python/getplatform.o: $(srcdir)/Python/getplatform.c
>  -              $(CC) -c $(PY_CORE_CFLAGS) -DPLATFORM='"$(MACHDEP)"' -o $@
> $(srcdir)/Python/getplatform.c
> diff --git
> a/meta/recipes-devtools/python/python3/0001-bpo-34155-Dont-parse-domains-containing-GH-13079.patch
> b/meta/recipes-devtools/python/python3/0001-bpo-34155-Dont-parse-domains-containing-GH-13079.patch
> deleted file mode 100644
> index 319e7ed07e..0000000000
> ---
> a/meta/recipes-devtools/python/python3/0001-bpo-34155-Dont-parse-domains-containing-GH-13079.patch
> +++ /dev/null
> @@ -1,132 +0,0 @@
> -From 90d56127ae15b1e452755e62c77dc475dedf7161 Mon Sep 17 00:00:00 2001
> -From: jpic <jpic@users.noreply.github.com>
> -Date: Wed, 17 Jul 2019 23:54:25 +0200
> -Subject: [PATCH] bpo-34155: Dont parse domains containing @ (GH-13079)
> -
> -Before:
> -
> -        >>> email.message_from_string('From: a@malicious.org@
> important.com', policy=email.policy.default)['from'].addresses
> -        (Address(display_name='', username='a', domain='malicious.org'),)
> -
> -        >>> parseaddr('a@malicious.org@important.com')
> -        ('', 'a@malicious.org')
> -
> -    After:
> -
> -        >>> email.message_from_string('From: a@malicious.org@
> important.com', policy=email.policy.default)['from'].addresses
> -        (Address(display_name='', username='', domain=''),)
> -
> -        >>> parseaddr('a@malicious.org@important.com')
> -        ('', 'a@')
> -
> -https://bugs.python.org/issue34155
> -
> -Upstream-Status: Backport [
> https://github.com/python/cpython/commit/8cb65d1381b027f0b09ee36bfed7f35bb4dec9a9
> ]
> -
> -CVE: CVE-2019-16056
> -
> -Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ----
> - Lib/email/_header_value_parser.py                  |  2 ++
> - Lib/email/_parseaddr.py                            | 11 ++++++++++-
> - Lib/test/test_email/test__header_value_parser.py   | 10 ++++++++++
> - Lib/test/test_email/test_email.py                  | 14 ++++++++++++++
> - .../2019-05-04-13-33-37.bpo-34155.MJll68.rst       |  1 +
> - 5 files changed, 37 insertions(+), 1 deletion(-)
> - create mode 100644
> Misc/NEWS.d/next/Security/2019-05-04-13-33-37.bpo-34155.MJll68.rst
> -
> -diff --git a/Lib/email/_header_value_parser.py
> b/Lib/email/_header_value_parser.py
> -index fc00b4a098..bbc026ec71 100644
> ---- a/Lib/email/_header_value_parser.py
> -+++ b/Lib/email/_header_value_parser.py
> -@@ -1582,6 +1582,8 @@ def get_domain(value):
> -         token, value = get_dot_atom(value)
> -     except errors.HeaderParseError:
> -         token, value = get_atom(value)
> -+    if value and value[0] == '@':
> -+        raise errors.HeaderParseError('Invalid Domain')
> -     if leader is not None:
> -         token[:0] = [leader]
> -     domain.append(token)
> -diff --git a/Lib/email/_parseaddr.py b/Lib/email/_parseaddr.py
> -index cdfa3729ad..41ff6f8c00 100644
> ---- a/Lib/email/_parseaddr.py
> -+++ b/Lib/email/_parseaddr.py
> -@@ -379,7 +379,12 @@ class AddrlistClass:
> -         aslist.append('@')
> -         self.pos += 1
> -         self.gotonext()
> --        return EMPTYSTRING.join(aslist) + self.getdomain()
> -+        domain = self.getdomain()
> -+        if not domain:
> -+            # Invalid domain, return an empty address instead of
> returning a
> -+            # local part to denote failed parsing.
> -+            return EMPTYSTRING
> -+        return EMPTYSTRING.join(aslist) + domain
> -
> -     def getdomain(self):
> -         """Get the complete domain name from an address."""
> -@@ -394,6 +399,10 @@ class AddrlistClass:
> -             elif self.field[self.pos] == '.':
> -                 self.pos += 1
> -                 sdlist.append('.')
> -+            elif self.field[self.pos] == '@':
> -+                # bpo-34155: Don't parse domains with two `@` like
> -+                # `a@malicious.org@important.com`.
> -+                return EMPTYSTRING
> -             elif self.field[self.pos] in self.atomends:
> -                 break
> -             else:
> -diff --git a/Lib/test/test_email/test__header_value_parser.py
> b/Lib/test/test_email/test__header_value_parser.py
> -index 693487bc96..7dc4de1b7b 100644
> ---- a/Lib/test/test_email/test__header_value_parser.py
> -+++ b/Lib/test/test_email/test__header_value_parser.py
> -@@ -1438,6 +1438,16 @@ class TestParser(TestParserMixin, TestEmailBase):
> -         self.assertEqual(addr_spec.domain, 'example.com')
> -         self.assertEqual(addr_spec.addr_spec, 'star.a.star@example.com')
> -
> -+    def test_get_addr_spec_multiple_domains(self):
> -+        with self.assertRaises(errors.HeaderParseError):
> -+            parser.get_addr_spec('star@a.star@example.com')
> -+
> -+        with self.assertRaises(errors.HeaderParseError):
> -+            parser.get_addr_spec('star@a@example.com')
> -+
> -+        with self.assertRaises(errors.HeaderParseError):
> -+            parser.get_addr_spec('star@172.17.0.1@example.com')
> -+
> -     # get_obs_route
> -
> -     def test_get_obs_route_simple(self):
> -diff --git a/Lib/test/test_email/test_email.py
> b/Lib/test/test_email/test_email.py
> -index c29cc56203..aa775881c5 100644
> ---- a/Lib/test/test_email/test_email.py
> -+++ b/Lib/test/test_email/test_email.py
> -@@ -3041,6 +3041,20 @@ class TestMiscellaneous(TestEmailBase):
> -         self.assertEqual(utils.parseaddr('<>'), ('', ''))
> -         self.assertEqual(utils.formataddr(utils.parseaddr('<>')), '')
> -
> -+    def test_parseaddr_multiple_domains(self):
> -+        self.assertEqual(
> -+            utils.parseaddr('a@b@c'),
> -+            ('', '')
> -+        )
> -+        self.assertEqual(
> -+            utils.parseaddr('a@b.c@c'),
> -+            ('', '')
> -+        )
> -+        self.assertEqual(
> -+            utils.parseaddr('a@172.17.0.1@c'),
> -+            ('', '')
> -+        )
> -+
> -     def test_noquote_dump(self):
> -         self.assertEqual(
> -             utils.formataddr(('A Silly Person', 'person@dom.ain')),
> -diff --git
> a/Misc/NEWS.d/next/Security/2019-05-04-13-33-37.bpo-34155.MJll68.rst
> b/Misc/NEWS.d/next/Security/2019-05-04-13-33-37.bpo-34155.MJll68.rst
> -new file mode 100644
> -index 0000000000..50292e29ed
> ---- /dev/null
> -+++ b/Misc/NEWS.d/next/Security/2019-05-04-13-33-37.bpo-34155.MJll68.rst
> -@@ -0,0 +1 @@
> -+Fix parsing of invalid email addresses with more than one ``@`` (e.g. a@b
> @c.com.) to not return the part before 2nd ``@`` as valid email address.
> Patch by maxking & jpic.
> diff --git
> a/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
> b/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
> index 5735954628..a0ea897f4e 100644
> ---
> a/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
> +++
> b/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
> @@ -63,7 +63,7 @@ index a7de901..4a3681f 100644
>  +  case $cc_basename in
>       *clang*)
>         AC_SUBST(LLVM_AR)
> -       AC_PATH_TARGET_TOOL(LLVM_AR, llvm-ar, '', ${llvm_path})
> +       AC_PATH_TOOL(LLVM_AR, llvm-ar, '', ${llvm_path})
>  @@ -1426,7 +1427,7 @@ then
>     fi
>   fi
> diff --git a/meta/recipes-devtools/python/python3_3.7.4.bb
> b/meta/recipes-devtools/python/python3_3.7.5.bb
> similarity index 98%
> rename from meta/recipes-devtools/python/python3_3.7.4.bb
> rename to meta/recipes-devtools/python/python3_3.7.5.bb
> index 8c429e95c3..0338fa4ba8 100644
> --- a/meta/recipes-devtools/python/python3_3.7.4.bb
> +++ b/meta/recipes-devtools/python/python3_3.7.5.bb
> @@ -29,7 +29,6 @@ SRC_URI = "
> http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
>             file://0001-Use-FLAG_REF-always-for-interned-strings.patch \
>
> file://0001-test_locale.py-correct-the-test-output-format.patch \
>
> file://0017-setup.py-do-not-report-missing-dependencies-for-disa.patch \
> -
>  file://0001-bpo-34155-Dont-parse-domains-containing-GH-13079.patch \
>             "
>
>  SRC_URI_append_class-native = " \
> @@ -40,8 +39,8 @@ SRC_URI_append_class-nativesdk = " \
>
> file://0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch \
>             "
>
> -SRC_URI[md5sum] = "d33e4aae66097051c2eca45ee3604803"
> -SRC_URI[sha256sum] =
> "fb799134b868199930b75f26678f18932214042639cd52b16da7fd134cd9b13f"
> +SRC_URI[md5sum] = "08ed8030b1183107c48f2092e79a87e2"
> +SRC_URI[sha256sum] =
> "e85a76ea9f3d6c485ec1780fca4e500725a4a7bbc63c78ebc44170de9b619d94"
>
>  # exclude pre-releases for both python 2.x and 3.x
>  UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000928fa40595918cd5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Python 3.8.0 is now out, so we should upgrade directl=
y to that version.</div><div><br></div><div>Alex<br></div></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 23 Oct 20=
19 at 12:37, Adrian Bunk &lt;<a href=3D"mailto:bunk@stusta.de">bunk@stusta.=
de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Backported patch removed.<br>
<br>
Signed-off-by: Adrian Bunk &lt;<a href=3D"mailto:bunk@stusta.de" target=3D"=
_blank">bunk@stusta.de</a>&gt;<br>
---<br>
=C2=A0...lib-as-location-for-site-packages-an.patch |=C2=A0 =C2=A02 +-<br>
=C2=A0...nt-parse-domains-containing-GH-13079.patch | 132 -----------------=
-<br>
=C2=A0...asename-to-replace-CC-for-checking-c.patch |=C2=A0 =C2=A02 +-<br>
=C2=A0.../{<a href=3D"http://python3_3.7.4.bb" rel=3D"noreferrer" target=3D=
"_blank">python3_3.7.4.bb</a> =3D&gt; <a href=3D"http://python3_3.7.5.bb" r=
el=3D"noreferrer" target=3D"_blank">python3_3.7.5.bb</a>}=C2=A0 =C2=A0 |=C2=
=A0 =C2=A05 +-<br>
=C2=A04 files changed, 4 insertions(+), 137 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-devtools/python/python3/0001-bpo-3415=
5-Dont-parse-domains-containing-GH-13079.patch<br>
=C2=A0rename meta/recipes-devtools/python/{<a href=3D"http://python3_3.7.4.=
bb" rel=3D"noreferrer" target=3D"_blank">python3_3.7.4.bb</a> =3D&gt; <a hr=
ef=3D"http://python3_3.7.5.bb" rel=3D"noreferrer" target=3D"_blank">python3=
_3.7.5.bb</a>} (98%)<br>
<br>
diff --git a/meta/recipes-devtools/python/python3/0001-Do-not-hardcode-lib-=
as-location-for-site-packages-an.patch b/meta/recipes-devtools/python/pytho=
n3/0001-Do-not-hardcode-lib-as-location-for-site-packages-an.patch<br>
index 661f52d01f..ea75262c4f 100644<br>
--- a/meta/recipes-devtools/python/python3/0001-Do-not-hardcode-lib-as-loca=
tion-for-site-packages-an.patch<br>
+++ b/meta/recipes-devtools/python/python3/0001-Do-not-hardcode-lib-as-loca=
tion-for-site-packages-an.patch<br>
@@ -70,7 +70,7 @@ index 6e81b2f..671a20e 100644<br>
<br>
=C2=A0 Programs/python.o: $(srcdir)/Programs/python.c<br>
=C2=A0@@ -856,7 +857,7 @@ regen-opcode:<br>
- Python/compile.o Python/symtable.o Python/ast_unparse.o Python/ast.o: $(s=
rcdir)/Include/graminit.h $(srcdir)/Include/Python-ast.h<br>
+ Python/compile.o Python/symtable.o Python/ast_unparse.o Python/ast.o Pyth=
on/future.o Parser/parsetok.o: $(srcdir)/Include/graminit.h $(srcdir)/Inclu=
de/Python-ast.h<br>
<br>
=C2=A0 Python/getplatform.o: $(srcdir)/Python/getplatform.c<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(CC) -c $(PY_CORE_=
CFLAGS) -DPLATFORM=3D&#39;&quot;$(MACHDEP)&quot;&#39; -o $@ $(srcdir)/Pytho=
n/getplatform.c<br>
diff --git a/meta/recipes-devtools/python/python3/0001-bpo-34155-Dont-parse=
-domains-containing-GH-13079.patch b/meta/recipes-devtools/python/python3/0=
001-bpo-34155-Dont-parse-domains-containing-GH-13079.patch<br>
deleted file mode 100644<br>
index 319e7ed07e..0000000000<br>
--- a/meta/recipes-devtools/python/python3/0001-bpo-34155-Dont-parse-domain=
s-containing-GH-13079.patch<br>
+++ /dev/null<br>
@@ -1,132 +0,0 @@<br>
-From 90d56127ae15b1e452755e62c77dc475dedf7161 Mon Sep 17 00:00:00 2001<br>
-From: jpic &lt;<a href=3D"mailto:jpic@users.noreply.github.com" target=3D"=
_blank">jpic@users.noreply.github.com</a>&gt;<br>
-Date: Wed, 17 Jul 2019 23:54:25 +0200<br>
-Subject: [PATCH] bpo-34155: Dont parse domains containing @ (GH-13079)<br>
-<br>
-Before:<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; email.message_from_string(&#39;Fr=
om: a@malicious.org@<a href=3D"http://important.com" rel=3D"noreferrer" tar=
get=3D"_blank">important.com</a>&#39;, policy=3Demail.policy.default)[&#39;=
from&#39;].addresses<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 (Address(display_name=3D&#39;&#39;, username=
=3D&#39;a&#39;, domain=3D&#39;<a href=3D"http://malicious.org" rel=3D"noref=
errer" target=3D"_blank">malicious.org</a>&#39;),)<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; parseaddr(&#39;a@malicious.org@<a=
 href=3D"http://important.com" rel=3D"noreferrer" target=3D"_blank">importa=
nt.com</a>&#39;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 (&#39;&#39;, &#39;<a href=3D"mailto:a@maliciou=
s.org" target=3D"_blank">a@malicious.org</a>&#39;)<br>
-<br>
-=C2=A0 =C2=A0 After:<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; email.message_from_string(&#39;Fr=
om: a@malicious.org@<a href=3D"http://important.com" rel=3D"noreferrer" tar=
get=3D"_blank">important.com</a>&#39;, policy=3Demail.policy.default)[&#39;=
from&#39;].addresses<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 (Address(display_name=3D&#39;&#39;, username=
=3D&#39;&#39;, domain=3D&#39;&#39;),)<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; parseaddr(&#39;a@malicious.org@<a=
 href=3D"http://important.com" rel=3D"noreferrer" target=3D"_blank">importa=
nt.com</a>&#39;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 (&#39;&#39;, &#39;a@&#39;)<br>
-<br>
-<a href=3D"https://bugs.python.org/issue34155" rel=3D"noreferrer" target=
=3D"_blank">https://bugs.python.org/issue34155</a><br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://github.com/python/cpython/co=
mmit/8cb65d1381b027f0b09ee36bfed7f35bb4dec9a9" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/python/cpython/commit/8cb65d1381b027f0b09ee36bf=
ed7f35bb4dec9a9</a>]<br>
-<br>
-CVE: CVE-2019-16056<br>
-<br>
-Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
----<br>
- Lib/email/_header_value_parser.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 ++<br>
- Lib/email/_parseaddr.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 11 ++++++++++-<br>
- Lib/test/test_email/test__header_value_parser.py=C2=A0 =C2=A0| 10 +++++++=
+++<br>
- Lib/test/test_email/test_email.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 14 ++++++++++++++<br>
- .../2019-05-04-13-33-37.bpo-34155.MJll68.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 1 +<br>
- 5 files changed, 37 insertions(+), 1 deletion(-)<br>
- create mode 100644 Misc/NEWS.d/next/Security/2019-05-04-13-33-37.bpo-3415=
5.MJll68.rst<br>
-<br>
-diff --git a/Lib/email/_header_value_parser.py b/Lib/email/_header_value_p=
arser.py<br>
-index fc00b4a098..bbc026ec71 100644<br>
---- a/Lib/email/_header_value_parser.py<br>
-+++ b/Lib/email/_header_value_parser.py<br>
-@@ -1582,6 +1582,8 @@ def get_domain(value):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0token, value =3D get_dot_atom(value)<br>
-=C2=A0 =C2=A0 =C2=A0except errors.HeaderParseError:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0token, value =3D get_atom(value)<br>
-+=C2=A0 =C2=A0 if value and value[0] =3D=3D &#39;@&#39;:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise errors.HeaderParseError(&#39;Invalid Do=
main&#39;)<br>
-=C2=A0 =C2=A0 =C2=A0if leader is not None:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0token[:0] =3D [leader]<br>
-=C2=A0 =C2=A0 =C2=A0domain.append(token)<br>
-diff --git a/Lib/email/_parseaddr.py b/Lib/email/_parseaddr.py<br>
-index cdfa3729ad..41ff6f8c00 100644<br>
---- a/Lib/email/_parseaddr.py<br>
-+++ b/Lib/email/_parseaddr.py<br>
-@@ -379,7 +379,12 @@ class AddrlistClass:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0aslist.append(&#39;@&#39;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.pos +=3D 1<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.gotonext()<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 return EMPTYSTRING.join(aslist) + self.getdom=
ain()<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 domain =3D self.getdomain()<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not domain:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Invalid domain, return an emp=
ty address instead of returning a<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # local part to denote failed p=
arsing.<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return EMPTYSTRING<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return EMPTYSTRING.join(aslist) + domain<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0def getdomain(self):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;Get the complete domai=
n name from an address.&quot;&quot;&quot;<br>
-@@ -394,6 +399,10 @@ class AddrlistClass:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif self.field[self.pos] =
=3D=3D &#39;.&#39;:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.pos +=
=3D 1<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sdlist.appen=
d(&#39;.&#39;)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif self.field[self.pos] =3D=
=3D &#39;@&#39;:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # bpo-34155: Don&=
#39;t parse domains with two `@` like<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # `a@malicious.or=
g@<a href=3D"http://important.com" rel=3D"noreferrer" target=3D"_blank">imp=
ortant.com</a>`.<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return EMPTYSTRIN=
G<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif self.field[self.pos] =
in self.atomends:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
-diff --git a/Lib/test/test_email/test__header_value_parser.py b/Lib/test/t=
est_email/test__header_value_parser.py<br>
-index 693487bc96..7dc4de1b7b 100644<br>
---- a/Lib/test/test_email/test__header_value_parser.py<br>
-+++ b/Lib/test/test_email/test__header_value_parser.py<br>
-@@ -1438,6 +1438,16 @@ class TestParser(TestParserMixin, TestEmailBase):<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEqual(addr_spec.domain, &#39;=
<a href=3D"http://example.com" rel=3D"noreferrer" target=3D"_blank">example=
.com</a>&#39;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEqual(addr_spec.addr_spec, &#=
39;<a href=3D"mailto:star.a.star@example.com" target=3D"_blank">star.a.star=
@example.com</a>&#39;)<br>
- <br>
-+=C2=A0 =C2=A0 def test_get_addr_spec_multiple_domains(self):<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 with self.assertRaises(errors.HeaderParseErro=
r):<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 parser.get_addr_spec(&#39;star@=
a.star@<a href=3D"http://example.com" rel=3D"noreferrer" target=3D"_blank">=
example.com</a>&#39;)<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 with self.assertRaises(errors.HeaderParseErro=
r):<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 parser.get_addr_spec(&#39;star@=
a@<a href=3D"http://example.com" rel=3D"noreferrer" target=3D"_blank">examp=
le.com</a>&#39;)<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 with self.assertRaises(errors.HeaderParseErro=
r):<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 parser.get_addr_spec(&#39;star@=
172.17.0.1@<a href=3D"http://example.com" rel=3D"noreferrer" target=3D"_bla=
nk">example.com</a>&#39;)<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0# get_obs_route<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0def test_get_obs_route_simple(self):<br>
-diff --git a/Lib/test/test_email/test_email.py b/Lib/test/test_email/test_=
email.py<br>
-index c29cc56203..aa775881c5 100644<br>
---- a/Lib/test/test_email/test_email.py<br>
-+++ b/Lib/test/test_email/test_email.py<br>
-@@ -3041,6 +3041,20 @@ class TestMiscellaneous(TestEmailBase):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEqual(utils.parseaddr(&#39;&l=
t;&gt;&#39;), (&#39;&#39;, &#39;&#39;))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEqual(utils.formataddr(utils.=
parseaddr(&#39;&lt;&gt;&#39;)), &#39;&#39;)<br>
- <br>
-+=C2=A0 =C2=A0 def test_parseaddr_multiple_domains(self):<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 utils.parseaddr(&#39;a@b@c&#39;=
),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (&#39;&#39;, &#39;&#39;)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 utils.parseaddr(&#39;a@b.c@c&#3=
9;),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (&#39;&#39;, &#39;&#39;)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 utils.parseaddr(&#39;a@172.17.0=
.1@c&#39;),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (&#39;&#39;, &#39;&#39;)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0def test_noquote_dump(self):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEqual(<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0utils.formataddr((&#39;A S=
illy Person&#39;, &#39;person@dom.ain&#39;)),<br>
-diff --git a/Misc/NEWS.d/next/Security/2019-05-04-13-33-37.bpo-34155.MJll6=
8.rst b/Misc/NEWS.d/next/Security/2019-05-04-13-33-37.bpo-34155.MJll68.rst<=
br>
-new file mode 100644<br>
-index 0000000000..50292e29ed<br>
---- /dev/null<br>
-+++ b/Misc/NEWS.d/next/Security/2019-05-04-13-33-37.bpo-34155.MJll68.rst<b=
r>
-@@ -0,0 +1 @@<br>
-+Fix parsing of invalid email addresses with more than one ``@`` (e.g. a@b=
@<a href=3D"http://c.com" rel=3D"noreferrer" target=3D"_blank">c.com</a>.) =
to not return the part before 2nd ``@`` as valid email address. Patch by ma=
xking &amp; jpic.<br>
diff --git a/meta/recipes-devtools/python/python3/0001-python3-use-cc_basen=
ame-to-replace-CC-for-checking-c.patch b/meta/recipes-devtools/python/pytho=
n3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch<br>
index 5735954628..a0ea897f4e 100644<br>
--- a/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-=
replace-CC-for-checking-c.patch<br>
+++ b/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-=
replace-CC-for-checking-c.patch<br>
@@ -63,7 +63,7 @@ index a7de901..4a3681f 100644<br>
=C2=A0+=C2=A0 case $cc_basename in<br>
=C2=A0 =C2=A0 =C2=A0 *clang*)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_SUBST(LLVM_AR)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0AC_PATH_TARGET_TOOL(LLVM_AR, llvm-ar, &#39;&#39=
;, ${llvm_path})<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0AC_PATH_TOOL(LLVM_AR, llvm-ar, &#39;&#39;, ${ll=
vm_path})<br>
=C2=A0@@ -1426,7 +1427,7 @@ then<br>
=C2=A0 =C2=A0 fi<br>
=C2=A0 fi<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3_3.7.4.b=
b" rel=3D"noreferrer" target=3D"_blank">python3_3.7.4.bb</a> b/meta/recipes=
-devtools/python/<a href=3D"http://python3_3.7.5.bb" rel=3D"noreferrer" tar=
get=3D"_blank">python3_3.7.5.bb</a><br>
similarity index 98%<br>
rename from meta/recipes-devtools/python/<a href=3D"http://python3_3.7.4.bb=
" rel=3D"noreferrer" target=3D"_blank">python3_3.7.4.bb</a><br>
rename to meta/recipes-devtools/python/<a href=3D"http://python3_3.7.5.bb" =
rel=3D"noreferrer" target=3D"_blank">python3_3.7.5.bb</a><br>
index 8c429e95c3..0338fa4ba8 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3_3.7.4.bb" rel=
=3D"noreferrer" target=3D"_blank">python3_3.7.4.bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3_3.7.5.bb" rel=
=3D"noreferrer" target=3D"_blank">python3_3.7.5.bb</a><br>
@@ -29,7 +29,6 @@ SRC_URI =3D &quot;<a href=3D"http://www.python.org/ftp/py=
thon/$%7BPV%7D/Python-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank=
">http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Use-FLAG_REF-always-f=
or-interned-strings.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-test_locale.py-correc=
t-the-test-output-format.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0017-setup.py-do-not-repor=
t-missing-dependencies-for-disa.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-bpo-34155-Dont-parse-=
domains-containing-GH-13079.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI_append_class-native =3D &quot; \<br>
@@ -40,8 +39,8 @@ SRC_URI_append_class-nativesdk =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-main.c-if-OEPYTHON3HO=
ME-is-set-use-instead-of-PYTHON.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;d33e4aae66097051c2eca45ee3604803&quot;<br>
-SRC_URI[sha256sum] =3D &quot;fb799134b868199930b75f26678f18932214042639cd5=
2b16da7fd134cd9b13f&quot;<br>
+SRC_URI[md5sum] =3D &quot;08ed8030b1183107c48f2092e79a87e2&quot;<br>
+SRC_URI[sha256sum] =3D &quot;e85a76ea9f3d6c485ec1780fca4e500725a4a7bbc63c7=
8ebc44170de9b619d94&quot;<br>
<br>
=C2=A0# exclude pre-releases for both python 2.x and 3.x<br>
=C2=A0UPSTREAM_CHECK_REGEX =3D &quot;[Pp]ython-(?P&lt;pver&gt;\d+(\.\d+)+).=
tar&quot;<br>
-- <br>
2.17.1<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000928fa40595918cd5--
