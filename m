Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web09.927.1614703178631320158
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Mar 2021 08:39:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kSjewiAm;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id d13so20992392edp.4
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Mar 2021 08:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WlnYfmLB3p7HTZdL543GLgiMqtTspNYp8VPDBv1MMqc=;
        b=kSjewiAmoP1fc+RgAhTheB4KURPO0o0crV+Q2F5Hlg/X17wqbcoUkNEVb92mzYRteM
         utLjUn8Du4rhyVzo5lwhBeDtTU/49jOfejKSWJ8CZxOXDxxHeCImHBpcs+DfGgFEu+j0
         amgXAKTHbfQYSm9ErGFe40YOPYBS4+hH4b/tEHW+1bdrVKcbuliDzofw65vXEtq4WdKn
         AP5hCSWxgNemJT8twaxML6B2GS30bznop3uumQNw8fRnIH6nOjqepIEl+DRDMo0NCIEb
         5UQkJPWSibJdbeJly3kbHNxCUwDyHVaq7SEMbJKZ7JLDYRNQmz07Eg9IyUb5AA8Fea24
         A6vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WlnYfmLB3p7HTZdL543GLgiMqtTspNYp8VPDBv1MMqc=;
        b=Y4wUa+I649E1GVHmqLhKbSksGonL2M3AsF72TPuX12MgGxf/UvvBOauGmIF1o4Vj7Z
         A/vechzNHr2kPKtZTgp4cR7nyPNrrEZPAnm15wmJi9EWuTb2wdfviNdHiKpbCgDYh1jP
         lyx0EcAORg7X43HCw6Tmc1FU7AwuEkK6YuiAOyzu2Bx2ZLMO3f/a7y431utL0B/sFJL8
         FJd9u+KTedTuJDEnSXppw9aHJ6VpLqkm/mGguE2eas8hyZqKu8XqkAgaeNL5Zo2gbW/A
         y3ZWeXxEoeVQG+N8l6K21AZR3by28b4L334npJANkqLRe+eGuSJONpQJl15RsC0nQTGg
         /ZjA==
X-Gm-Message-State: AOAM531mnicjGzwlzbx6zvyCCduh4GFgUSMu404xgMHyyplQH5v5bKDf
	VIBn2WrAAJ12AamYu4eFCkCOd4LJV0sEjJTKXsY=
X-Google-Smtp-Source: ABdhPJzjcfO1l1A5LtxFJqMQOjRSAXEUtHT4knHLX0f2LdpGgXcFjGcQKAAZRXWWUQ659g2LBQBo3yvzwqw5c5+D9fs=
X-Received: by 2002:aa7:dd99:: with SMTP id g25mr10484225edv.230.1614703176781;
 Tue, 02 Mar 2021 08:39:36 -0800 (PST)
MIME-Version: 1.0
References: <20210302161223.43040-1-chee.yang.lee@intel.com>
In-Reply-To: <20210302161223.43040-1-chee.yang.lee@intel.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Tue, 2 Mar 2021 17:39:25 +0100
Message-ID: <CA+chaQc-OPYrNgv7HCjNAwrrijWzktp1mG90=XCfyCdzKO6o8Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH][dunfell 1/2] python3: fix CVE-2021-3177 CVE-2021-23336
To: Lee Chee Yang <chee.yang.lee@intel.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000045121805bc906108"

--00000000000045121805bc906108
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

CVE-2021-3177.patch is already on its way to dunfell in:
https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dstable/=
dunfell-nut&id=3D1e01cf0c4edc82a0a0160ce376d502cb3eed54ea

it would be better if you rebase on top of that and while doing that pleas=
e
delete the first CVE-2021-23336.patch as you're adding it twice as:
 .../python/CVE-2021-23336.patch
 .../python/python3/CVE-2021-23336.patch



On Tue, Mar 2, 2021 at 5:12 PM Lee Chee Yang <chee.yang.lee@intel.com>
wrote:

> From: Lee Chee Yang <chee.yang.lee@intel.com>
>
> Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> ---
>  .../python/CVE-2021-23336.patch               | 530 ++++++++++++++++++
>  .../python/python3/CVE-2021-23336.patch       | 530 ++++++++++++++++++
>  .../python/python3/CVE-2021-3177.patch        | 191 +++++++
>  meta/recipes-devtools/python/python3_3.8.2.bb |   2 +
>  4 files changed, 1253 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/CVE-2021-23336.patch
>  create mode 100644
> meta/recipes-devtools/python/python3/CVE-2021-23336.patch
>  create mode 100644
> meta/recipes-devtools/python/python3/CVE-2021-3177.patch
>
> diff --git a/meta/recipes-devtools/python/CVE-2021-23336.patch
> b/meta/recipes-devtools/python/CVE-2021-23336.patch
> new file mode 100644
> index 0000000000..2a885b9d37
> --- /dev/null
> +++ b/meta/recipes-devtools/python/CVE-2021-23336.patch
> @@ -0,0 +1,530 @@
> +From 3ab6f812653e79d008d5eba31dc25d34f3ca7170 Mon Sep 17 00:00:00 2001
> +From: Senthil Kumaran <senthil@uthcode.com>
> +Date: Mon, 15 Feb 2021 10:15:02 -0800
> +Subject: [PATCH] bpo-42967: only use '&' as a query string separator
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> + (GH-24297)  (#24529)
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +* bpo-42967: only use '&' as a query string separator (#24297)
> +
> +bpo-42967: [security] Address a web cache-poisoning issue reported in
> +urllib.parse.parse_qsl().
> +
> +urllib.parse will only us "&" as query string separator by default
> +instead of both ";" and "&" as allowed in earlier versions. An optional
> +argument seperator with default value "&" is added to specify the
> +separator.
> +
> +Co-authored-by: =C3=89ric Araujo <merwok@netwok.org>
> +Co-authored-by: blurb-it[bot] <43283697+blurb-it[bot]@
> users.noreply.github.com>
> +Co-authored-by: Ken Jin <28750310+Fidget-Spinner@users.noreply.github.c=
om
> >
> +Co-authored-by: =C3=89ric Araujo <merwok@netwok.org>
> +(cherry picked from commit fcbe0cb04d35189401c0c880ebfb4311e952d776)
> +
> +* [3.8] bpo-42967: only use '&' as a query string separator (GH-24297)
> +
> +bpo-42967: [security] Address a web cache-poisoning issue reported in
> urllib.parse.parse_qsl().
> +
> +urllib.parse will only us "&" as query string separator by default
> instead of both ";" and "&" as allowed in earlier versions. An optional
> argument seperator with default value "&" is added to specify the separa=
tor.
> +
> +Co-authored-by: =C3=89ric Araujo <merwok@netwok.org>
> +Co-authored-by: blurb-it[bot] <43283697+blurb-it[bot]@
> users.noreply.github.com>
> +Co-authored-by: Ken Jin <28750310+Fidget-Spinner@users.noreply.github.c=
om
> >
> +Co-authored-by: =C3=89ric Araujo <merwok@netwok.org>.
> +(cherry picked from commit fcbe0cb04d35189401c0c880ebfb4311e952d776)
> +
> +Co-authored-by: Adam Goldschmidt <adamgold7@gmail.com>
> +
> +* Update correct version information.
> +
> +* fix docs and make logic clearer
> +
> +Co-authored-by: Adam Goldschmidt <adamgold7@gmail.com>
> +Co-authored-by: Fidget-Spinner <
> 28750310+Fidget-Spinner@users.noreply.github.com>
> +
> +Upstream-Status: Backport [
> https://github.com/python/cpython/commit/e3110c3cfbb7daa690d54d0eff6c264=
c870a71bf
> ]
> +CVE: CVE-2020-23336
> +Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
> +
> +---
> + Doc/library/cgi.rst                           | 11 ++-
> + Doc/library/urllib.parse.rst                  | 22 +++++-
> + Doc/whatsnew/3.6.rst                          | 13 ++++
> + Doc/whatsnew/3.7.rst                          | 13 ++++
> + Lib/cgi.py                                    | 23 ++++---
> + Lib/test/test_cgi.py                          | 29 ++++++--
> + Lib/test/test_urlparse.py                     | 68 +++++++++++++------
> + Lib/urllib/parse.py                           | 19 ++++--
> + .../2021-02-14-15-59-16.bpo-42967.YApqDS.rst  |  1 +
> + 9 files changed, 153 insertions(+), 46 deletions(-)
> + create mode 100644
> Misc/NEWS.d/next/Security/2021-02-14-15-59-16.bpo-42967.YApqDS.rst
> +
> +diff --git a/Doc/library/cgi.rst b/Doc/library/cgi.rst
> +index 4048592..880074b 100644
> +--- a/Doc/library/cgi.rst
> ++++ b/Doc/library/cgi.rst
> +@@ -277,14 +277,16 @@ These are useful if you want more control, or if
> you want to employ some of the
> + algorithms implemented in this module in other circumstances.
> +
> +
> +-.. function:: parse(fp=3DNone, environ=3Dos.environ,
> keep_blank_values=3DFalse, strict_parsing=3DFalse)
> ++.. function:: parse(fp=3DNone, environ=3Dos.environ,
> keep_blank_values=3DFalse, strict_parsing=3DFalse, separator=3D"&")
> +
> +    Parse a query in the environment or from a file (the file defaults =
to
> +-   ``sys.stdin``).  The *keep_blank_values* and *strict_parsing*
> parameters are
> ++   ``sys.stdin``).  The *keep_blank_values*, *strict_parsing* and
> *separator* parameters are
> +    passed to :func:`urllib.parse.parse_qs` unchanged.
> +
> ++   .. versionchanged:: 3.8.8
> ++      Added the *separator* parameter.
> +
> +-.. function:: parse_multipart(fp, pdict, encoding=3D"utf-8",
> errors=3D"replace")
> ++.. function:: parse_multipart(fp, pdict, encoding=3D"utf-8",
> errors=3D"replace", separator=3D"&")
> +
> +    Parse input of type :mimetype:`multipart/form-data` (for  file
> uploads).
> +    Arguments are *fp* for the input file, *pdict* for a dictionary
> containing
> +@@ -303,6 +305,9 @@ algorithms implemented in this module in other
> circumstances.
> +       Added the *encoding* and *errors* parameters.  For non-file
> fields, the
> +       value is now a list of strings, not bytes.
> +
> ++   .. versionchanged:: 3.8.8
> ++      Added the *separator* parameter.
> ++
> +
> + .. function:: parse_header(string)
> +
> +diff --git a/Doc/library/urllib.parse.rst b/Doc/library/urllib.parse.rs=
t
> +index 52f98ef..45ca03a 100644
> +--- a/Doc/library/urllib.parse.rst
> ++++ b/Doc/library/urllib.parse.rst
> +@@ -165,7 +165,7 @@ or on combining URL components into a URL string.
> +       now raise :exc:`ValueError`.
> +
> +
> +-.. function:: parse_qs(qs, keep_blank_values=3DFalse,
> strict_parsing=3DFalse, encoding=3D'utf-8', errors=3D'replace',
> max_num_fields=3DNone)
> ++.. function:: parse_qs(qs, keep_blank_values=3DFalse,
> strict_parsing=3DFalse, encoding=3D'utf-8', errors=3D'replace',
> max_num_fields=3DNone, separator=3D'&')
> +
> +    Parse a query string given as a string argument (data of type
> +    :mimetype:`application/x-www-form-urlencoded`).  Data are returned =
as
> a
> +@@ -190,6 +190,9 @@ or on combining URL components into a URL string.
> +    read. If set, then throws a :exc:`ValueError` if there are more tha=
n
> +    *max_num_fields* fields read.
> +
> ++   The optional argument *separator* is the symbol to use for separati=
ng
> the
> ++   query arguments. It defaults to ``&``.
> ++
> +    Use the :func:`urllib.parse.urlencode` function (with the ``doseq``
> +    parameter set to ``True``) to convert such dictionaries into query
> +    strings.
> +@@ -201,8 +204,14 @@ or on combining URL components into a URL string.
> +    .. versionchanged:: 3.8
> +       Added *max_num_fields* parameter.
> +
> ++   .. versionchanged:: 3.8.8
> ++      Added *separator* parameter with the default value of ``&``. Pyt=
hon
> ++      versions earlier than Python 3.8.8 allowed using both ``;`` and
> ``&`` as
> ++      query parameter separator. This has been changed to allow only a
> single
> ++      separator key, with ``&`` as the default separator.
> ++
> +
> +-.. function:: parse_qsl(qs, keep_blank_values=3DFalse,
> strict_parsing=3DFalse, encoding=3D'utf-8', errors=3D'replace',
> max_num_fields=3DNone)
> ++.. function:: parse_qsl(qs, keep_blank_values=3DFalse,
> strict_parsing=3DFalse, encoding=3D'utf-8', errors=3D'replace',
> max_num_fields=3DNone, separator=3D'&')
> +
> +    Parse a query string given as a string argument (data of type
> +    :mimetype:`application/x-www-form-urlencoded`).  Data are returned =
as
> a list of
> +@@ -226,6 +235,9 @@ or on combining URL components into a URL string.
> +    read. If set, then throws a :exc:`ValueError` if there are more tha=
n
> +    *max_num_fields* fields read.
> +
> ++   The optional argument *separator* is the symbol to use for separati=
ng
> the
> ++   query arguments. It defaults to ``&``.
> ++
> +    Use the :func:`urllib.parse.urlencode` function to convert such lis=
ts
> of pairs into
> +    query strings.
> +
> +@@ -235,6 +247,12 @@ or on combining URL components into a URL string.
> +    .. versionchanged:: 3.8
> +       Added *max_num_fields* parameter.
> +
> ++   .. versionchanged:: 3.8.8
> ++      Added *separator* parameter with the default value of ``&``. Pyt=
hon
> ++      versions earlier than Python 3.8.8 allowed using both ``;`` and
> ``&`` as
> ++      query parameter separator. This has been changed to allow only a
> single
> ++      separator key, with ``&`` as the default separator.
> ++
> +
> + .. function:: urlunparse(parts)
> +
> +diff --git a/Doc/whatsnew/3.6.rst b/Doc/whatsnew/3.6.rst
> +index 04c1f7e..4409a3a 100644
> +--- a/Doc/whatsnew/3.6.rst
> ++++ b/Doc/whatsnew/3.6.rst
> +@@ -2443,3 +2443,16 @@ because of the behavior of the socket option
> ``SO_REUSEADDR`` in UDP. For more
> + details, see the documentation for ``loop.create_datagram_endpoint()``=
.
> + (Contributed by Kyle Stanley, Antoine Pitrou, and Yury Selivanov in
> + :issue:`37228`.)
> ++
> ++Notable changes in Python 3.6.13
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ++
> ++Earlier Python versions allowed using both ``;`` and ``&`` as
> ++query parameter separators in :func:`urllib.parse.parse_qs` and
> ++:func:`urllib.parse.parse_qsl`.  Due to security concerns, and to
> conform with
> ++newer W3C recommendations, this has been changed to allow only a singl=
e
> ++separator key, with ``&`` as the default.  This change also affects
> ++:func:`cgi.parse` and :func:`cgi.parse_multipart` as they use the
> affected
> ++functions internally. For more details, please see their respective
> ++documentation.
> ++(Contributed by Adam Goldschmidt, Senthil Kumaran and Ken Jin in
> :issue:`42967`.)
> +diff --git a/Doc/whatsnew/3.7.rst b/Doc/whatsnew/3.7.rst
> +index b9b5021..8f47a9f 100644
> +--- a/Doc/whatsnew/3.7.rst
> ++++ b/Doc/whatsnew/3.7.rst
> +@@ -2556,3 +2556,16 @@ because of the behavior of the socket option
> ``SO_REUSEADDR`` in UDP. For more
> + details, see the documentation for ``loop.create_datagram_endpoint()``=
.
> + (Contributed by Kyle Stanley, Antoine Pitrou, and Yury Selivanov in
> + :issue:`37228`.)
> ++
> ++Notable changes in Python 3.7.10
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ++
> ++Earlier Python versions allowed using both ``;`` and ``&`` as
> ++query parameter separators in :func:`urllib.parse.parse_qs` and
> ++:func:`urllib.parse.parse_qsl`.  Due to security concerns, and to
> conform with
> ++newer W3C recommendations, this has been changed to allow only a singl=
e
> ++separator key, with ``&`` as the default.  This change also affects
> ++:func:`cgi.parse` and :func:`cgi.parse_multipart` as they use the
> affected
> ++functions internally. For more details, please see their respective
> ++documentation.
> ++(Contributed by Adam Goldschmidt, Senthil Kumaran and Ken Jin in
> :issue:`42967`.)
> +diff --git a/Lib/cgi.py b/Lib/cgi.py
> +index 5ace46a..13255a9 100755
> +--- a/Lib/cgi.py
> ++++ b/Lib/cgi.py
> +@@ -106,7 +106,8 @@ log =3D initlog           # The current logging fun=
ction
> + # 0 =3D=3D> unlimited input
> + maxlen =3D 0
> +
> +-def parse(fp=3DNone, environ=3Dos.environ, keep_blank_values=3D0,
> strict_parsing=3D0):
> ++def parse(fp=3DNone, environ=3Dos.environ, keep_blank_values=3D0,
> ++          strict_parsing=3D0, separator=3D'&'):
> +     """Parse a query in the environment or from a file (default stdin)
> +
> +         Arguments, all optional:
> +@@ -125,6 +126,9 @@ def parse(fp=3DNone, environ=3Dos.environ,
> keep_blank_values=3D0, strict_parsing=3D0):
> +         strict_parsing: flag indicating what to do with parsing errors=
.
> +             If false (the default), errors are silently ignored.
> +             If true, errors raise a ValueError exception.
> ++
> ++        separator: str. The symbol to use for separating the query
> arguments.
> ++            Defaults to &.
> +     """
> +     if fp is None:
> +         fp =3D sys.stdin
> +@@ -145,7 +149,7 @@ def parse(fp=3DNone, environ=3Dos.environ,
> keep_blank_values=3D0, strict_parsing=3D0):
> +     if environ['REQUEST_METHOD'] =3D=3D 'POST':
> +         ctype, pdict =3D parse_header(environ['CONTENT_TYPE'])
> +         if ctype =3D=3D 'multipart/form-data':
> +-            return parse_multipart(fp, pdict)
> ++            return parse_multipart(fp, pdict, separator=3Dseparator)
> +         elif ctype =3D=3D 'application/x-www-form-urlencoded':
> +             clength =3D int(environ['CONTENT_LENGTH'])
> +             if maxlen and clength > maxlen:
> +@@ -169,10 +173,10 @@ def parse(fp=3DNone, environ=3Dos.environ,
> keep_blank_values=3D0, strict_parsing=3D0):
> +             qs =3D ""
> +         environ['QUERY_STRING'] =3D qs    # XXX Shouldn't, really
> +     return urllib.parse.parse_qs(qs, keep_blank_values, strict_parsing=
,
> +-                                 encoding=3Dencoding)
> ++                                 encoding=3Dencoding, separator=3Dsepa=
rator)
> +
> +
> +-def parse_multipart(fp, pdict, encoding=3D"utf-8", errors=3D"replace")=
:
> ++def parse_multipart(fp, pdict, encoding=3D"utf-8", errors=3D"replace",
> separator=3D'&'):
> +     """Parse multipart input.
> +
> +     Arguments:
> +@@ -193,7 +197,7 @@ def parse_multipart(fp, pdict, encoding=3D"utf-8",
> errors=3D"replace"):
> +     headers.set_type(ctype)
> +     headers['Content-Length'] =3D pdict['CONTENT-LENGTH']
> +     fs =3D FieldStorage(fp, headers=3Dheaders, encoding=3Dencoding,
> errors=3Derrors,
> +-        environ=3D{'REQUEST_METHOD': 'POST'})
> ++        environ=3D{'REQUEST_METHOD': 'POST'}, separator=3Dseparator)
> +     return {k: fs.getlist(k) for k in fs}
> +
> + def _parseparam(s):
> +@@ -303,7 +307,7 @@ class FieldStorage:
> +     def __init__(self, fp=3DNone, headers=3DNone, outerboundary=3Db'',
> +                  environ=3Dos.environ, keep_blank_values=3D0,
> strict_parsing=3D0,
> +                  limit=3DNone, encoding=3D'utf-8', errors=3D'replace',
> +-                 max_num_fields=3DNone):
> ++                 max_num_fields=3DNone, separator=3D'&'):
> +         """Constructor.  Read multipart/* until last part.
> +
> +         Arguments, all optional:
> +@@ -351,6 +355,7 @@ class FieldStorage:
> +         self.keep_blank_values =3D keep_blank_values
> +         self.strict_parsing =3D strict_parsing
> +         self.max_num_fields =3D max_num_fields
> ++        self.separator =3D separator
> +         if 'REQUEST_METHOD' in environ:
> +             method =3D environ['REQUEST_METHOD'].upper()
> +         self.qs_on_post =3D None
> +@@ -577,7 +582,7 @@ class FieldStorage:
> +         query =3D urllib.parse.parse_qsl(
> +             qs, self.keep_blank_values, self.strict_parsing,
> +             encoding=3Dself.encoding, errors=3Dself.errors,
> +-            max_num_fields=3Dself.max_num_fields)
> ++            max_num_fields=3Dself.max_num_fields, separator=3Dself.sep=
arator)
> +         self.list =3D [MiniFieldStorage(key, value) for key, value in
> query]
> +         self.skip_lines()
> +
> +@@ -593,7 +598,7 @@ class FieldStorage:
> +             query =3D urllib.parse.parse_qsl(
> +                 self.qs_on_post, self.keep_blank_values,
> self.strict_parsing,
> +                 encoding=3Dself.encoding, errors=3Dself.errors,
> +-                max_num_fields=3Dself.max_num_fields)
> ++                max_num_fields=3Dself.max_num_fields,
> separator=3Dself.separator)
> +             self.list.extend(MiniFieldStorage(key, value) for key, val=
ue
> in query)
> +
> +         klass =3D self.FieldStorageClass or self.__class__
> +@@ -637,7 +642,7 @@ class FieldStorage:
> +                 else self.limit - self.bytes_read
> +             part =3D klass(self.fp, headers, ib, environ,
> keep_blank_values,
> +                          strict_parsing, limit,
> +-                         self.encoding, self.errors, max_num_fields)
> ++                         self.encoding, self.errors, max_num_fields,
> self.separator)
> +
> +             if max_num_fields is not None:
> +                 max_num_fields -=3D 1
> +diff --git a/Lib/test/test_cgi.py b/Lib/test/test_cgi.py
> +index ab86771..bda03ee 100644
> +--- a/Lib/test/test_cgi.py
> ++++ b/Lib/test/test_cgi.py
> +@@ -53,12 +53,9 @@ parse_strict_test_cases =3D [
> +     ("", ValueError("bad query field: ''")),
> +     ("&", ValueError("bad query field: ''")),
> +     ("&&", ValueError("bad query field: ''")),
> +-    (";", ValueError("bad query field: ''")),
> +-    (";&;", ValueError("bad query field: ''")),
> +     # Should the next few really be valid?
> +     ("=3D", {}),
> +     ("=3D&=3D", {}),
> +-    ("=3D;=3D", {}),
> +     # This rest seem to make sense
> +     ("=3Da", {'': ['a']}),
> +     ("&=3Da", ValueError("bad query field: ''")),
> +@@ -73,8 +70,6 @@ parse_strict_test_cases =3D [
> +     ("a=3Da+b&b=3Db+c", {'a': ['a b'], 'b': ['b c']}),
> +     ("a=3Da+b&a=3Db+a", {'a': ['a b', 'b a']}),
> +     ("x=3D1&y=3D2.0&z=3D2-3.%2b0", {'x': ['1'], 'y': ['2.0'], 'z':
> ['2-3.+0']}),
> +-    ("x=3D1;y=3D2.0&z=3D2-3.%2b0", {'x': ['1'], 'y': ['2.0'], 'z':
> ['2-3.+0']}),
> +-    ("x=3D1;y=3D2.0;z=3D2-3.%2b0", {'x': ['1'], 'y': ['2.0'], 'z':
> ['2-3.+0']}),
> +
>  ("Hbc5161168c542333633315dee1182227:key_store_seqid=3D400006&cuyer=3Dr&=
view=3Dbustomer&order_id=3D0bb2e248638833d48cb7fed300000f1b&expire=3D964546=
263&lobale=3Den-US&kid=3D130003.300038&ss=3Denv",
> +      {'Hbc5161168c542333633315dee1182227:key_store_seqid': ['400006'],
> +       'cuyer': ['r'],
> +@@ -187,6 +182,30 @@ Content-Length: 3
> +                     else:
> +                         self.assertEqual(fs.getvalue(key), expect_val[=
0])
> +
> ++    def test_separator(self):
> ++        parse_semicolon =3D [
> ++            ("x=3D1;y=3D2.0", {'x': ['1'], 'y': ['2.0']}),
> ++            ("x=3D1;y=3D2.0;z=3D2-3.%2b0", {'x': ['1'], 'y': ['2.0'], =
'z':
> ['2-3.+0']}),
> ++            (";", ValueError("bad query field: ''")),
> ++            (";;", ValueError("bad query field: ''")),
> ++            ("=3D;a", ValueError("bad query field: 'a'")),
> ++            (";b=3Da", ValueError("bad query field: ''")),
> ++            ("b;=3Da", ValueError("bad query field: 'b'")),
> ++            ("a=3Da+b;b=3Db+c", {'a': ['a b'], 'b': ['b c']}),
> ++            ("a=3Da+b;a=3Db+a", {'a': ['a b', 'b a']}),
> ++        ]
> ++        for orig, expect in parse_semicolon:
> ++            env =3D {'QUERY_STRING': orig}
> ++            fs =3D cgi.FieldStorage(separator=3D';', environ=3Denv)
> ++            if isinstance(expect, dict):
> ++                for key in expect.keys():
> ++                    expect_val =3D expect[key]
> ++                    self.assertIn(key, fs)
> ++                    if len(expect_val) > 1:
> ++                        self.assertEqual(fs.getvalue(key), expect_val)
> ++                    else:
> ++                        self.assertEqual(fs.getvalue(key), expect_val[=
0])
> ++
> +     def test_log(self):
> +         cgi.log("Testing")
> +
> +diff --git a/Lib/test/test_urlparse.py b/Lib/test/test_urlparse.py
> +index 4ae6ed3..90c8d69 100644
> +--- a/Lib/test/test_urlparse.py
> ++++ b/Lib/test/test_urlparse.py
> +@@ -32,16 +32,10 @@ parse_qsl_test_cases =3D [
> +     (b"&a=3Db", [(b'a', b'b')]),
> +     (b"a=3Da+b&b=3Db+c", [(b'a', b'a b'), (b'b', b'b c')]),
> +     (b"a=3D1&a=3D2", [(b'a', b'1'), (b'a', b'2')]),
> +-    (";", []),
> +-    (";;", []),
> +-    (";a=3Db", [('a', 'b')]),
> +-    ("a=3Da+b;b=3Db+c", [('a', 'a b'), ('b', 'b c')]),
> +-    ("a=3D1;a=3D2", [('a', '1'), ('a', '2')]),
> +-    (b";", []),
> +-    (b";;", []),
> +-    (b";a=3Db", [(b'a', b'b')]),
> +-    (b"a=3Da+b;b=3Db+c", [(b'a', b'a b'), (b'b', b'b c')]),
> +-    (b"a=3D1;a=3D2", [(b'a', b'1'), (b'a', b'2')]),
> ++    (";a=3Db", [(';a', 'b')]),
> ++    ("a=3Da+b;b=3Db+c", [('a', 'a b;b=3Db c')]),
> ++    (b";a=3Db", [(b';a', b'b')]),
> ++    (b"a=3Da+b;b=3Db+c", [(b'a', b'a b;b=3Db c')]),
> + ]
> +
> + # Each parse_qs testcase is a two-tuple that contains
> +@@ -68,16 +62,10 @@ parse_qs_test_cases =3D [
> +     (b"&a=3Db", {b'a': [b'b']}),
> +     (b"a=3Da+b&b=3Db+c", {b'a': [b'a b'], b'b': [b'b c']}),
> +     (b"a=3D1&a=3D2", {b'a': [b'1', b'2']}),
> +-    (";", {}),
> +-    (";;", {}),
> +-    (";a=3Db", {'a': ['b']}),
> +-    ("a=3Da+b;b=3Db+c", {'a': ['a b'], 'b': ['b c']}),
> +-    ("a=3D1;a=3D2", {'a': ['1', '2']}),
> +-    (b";", {}),
> +-    (b";;", {}),
> +-    (b";a=3Db", {b'a': [b'b']}),
> +-    (b"a=3Da+b;b=3Db+c", {b'a': [b'a b'], b'b': [b'b c']}),
> +-    (b"a=3D1;a=3D2", {b'a': [b'1', b'2']}),
> ++    (";a=3Db", {';a': ['b']}),
> ++    ("a=3Da+b;b=3Db+c", {'a': ['a b;b=3Db c']}),
> ++    (b";a=3Db", {b';a': [b'b']}),
> ++    (b"a=3Da+b;b=3Db+c", {b'a':[ b'a b;b=3Db c']}),
> + ]
> +
> + class UrlParseTestCase(unittest.TestCase):
> +@@ -884,10 +872,46 @@ class UrlParseTestCase(unittest.TestCase):
> +     def test_parse_qsl_max_num_fields(self):
> +         with self.assertRaises(ValueError):
> +             urllib.parse.parse_qs('&'.join(['a=3Da']*11),
> max_num_fields=3D10)
> +-        with self.assertRaises(ValueError):
> +-            urllib.parse.parse_qs(';'.join(['a=3Da']*11),
> max_num_fields=3D10)
> +         urllib.parse.parse_qs('&'.join(['a=3Da']*10), max_num_fields=
=3D10)
> +
> ++    def test_parse_qs_separator(self):
> ++        parse_qs_semicolon_cases =3D [
> ++            (";", {}),
> ++            (";;", {}),
> ++            (";a=3Db", {'a': ['b']}),
> ++            ("a=3Da+b;b=3Db+c", {'a': ['a b'], 'b': ['b c']}),
> ++            ("a=3D1;a=3D2", {'a': ['1', '2']}),
> ++            (b";", {}),
> ++            (b";;", {}),
> ++            (b";a=3Db", {b'a': [b'b']}),
> ++            (b"a=3Da+b;b=3Db+c", {b'a': [b'a b'], b'b': [b'b c']}),
> ++            (b"a=3D1;a=3D2", {b'a': [b'1', b'2']}),
> ++        ]
> ++        for orig, expect in parse_qs_semicolon_cases:
> ++            with self.subTest(f"Original: {orig!r}, Expected:
> {expect!r}"):
> ++                result =3D urllib.parse.parse_qs(orig, separator=3D';'=
)
> ++                self.assertEqual(result, expect, "Error parsing %r" %
> orig)
> ++
> ++
> ++    def test_parse_qsl_separator(self):
> ++        parse_qsl_semicolon_cases =3D [
> ++            (";", []),
> ++            (";;", []),
> ++            (";a=3Db", [('a', 'b')]),
> ++            ("a=3Da+b;b=3Db+c", [('a', 'a b'), ('b', 'b c')]),
> ++            ("a=3D1;a=3D2", [('a', '1'), ('a', '2')]),
> ++            (b";", []),
> ++            (b";;", []),
> ++            (b";a=3Db", [(b'a', b'b')]),
> ++            (b"a=3Da+b;b=3Db+c", [(b'a', b'a b'), (b'b', b'b c')]),
> ++            (b"a=3D1;a=3D2", [(b'a', b'1'), (b'a', b'2')]),
> ++        ]
> ++        for orig, expect in parse_qsl_semicolon_cases:
> ++            with self.subTest(f"Original: {orig!r}, Expected:
> {expect!r}"):
> ++                result =3D urllib.parse.parse_qsl(orig, separator=3D';=
')
> ++                self.assertEqual(result, expect, "Error parsing %r" %
> orig)
> ++
> ++
> +     def test_urlencode_sequences(self):
> +         # Other tests incidentally urlencode things; test non-covered
> cases:
> +         # Sequence and object values.
> +diff --git a/Lib/urllib/parse.py b/Lib/urllib/parse.py
> +index e2b6f13..5a3e847 100644
> +--- a/Lib/urllib/parse.py
> ++++ b/Lib/urllib/parse.py
> +@@ -648,7 +648,7 @@ def unquote(string, encoding=3D'utf-8',
> errors=3D'replace'):
> +
> +
> + def parse_qs(qs, keep_blank_values=3DFalse, strict_parsing=3DFalse,
> +-             encoding=3D'utf-8', errors=3D'replace', max_num_fields=3D=
None):
> ++             encoding=3D'utf-8', errors=3D'replace', max_num_fields=3D=
None,
> separator=3D'&'):
> +     """Parse a query given as a string argument.
> +
> +         Arguments:
> +@@ -672,12 +672,15 @@ def parse_qs(qs, keep_blank_values=3DFalse,
> strict_parsing=3DFalse,
> +         max_num_fields: int. If set, then throws a ValueError if there
> +             are more than n fields read by parse_qsl().
> +
> ++        separator: str. The symbol to use for separating the query
> arguments.
> ++            Defaults to &.
> ++
> +         Returns a dictionary.
> +     """
> +     parsed_result =3D {}
> +     pairs =3D parse_qsl(qs, keep_blank_values, strict_parsing,
> +                       encoding=3Dencoding, errors=3Derrors,
> +-                      max_num_fields=3Dmax_num_fields)
> ++                      max_num_fields=3Dmax_num_fields, separator=3Dsep=
arator)
> +     for name, value in pairs:
> +         if name in parsed_result:
> +             parsed_result[name].append(value)
> +@@ -687,7 +690,7 @@ def parse_qs(qs, keep_blank_values=3DFalse,
> strict_parsing=3DFalse,
> +
> +
> + def parse_qsl(qs, keep_blank_values=3DFalse, strict_parsing=3DFalse,
> +-              encoding=3D'utf-8', errors=3D'replace', max_num_fields=
=3DNone):
> ++              encoding=3D'utf-8', errors=3D'replace', max_num_fields=
=3DNone,
> separator=3D'&'):
> +     """Parse a query given as a string argument.
> +
> +         Arguments:
> +@@ -710,19 +713,25 @@ def parse_qsl(qs, keep_blank_values=3DFalse,
> strict_parsing=3DFalse,
> +         max_num_fields: int. If set, then throws a ValueError
> +             if there are more than n fields read by parse_qsl().
> +
> ++        separator: str. The symbol to use for separating the query
> arguments.
> ++            Defaults to &.
> ++
> +         Returns a list, as G-d intended.
> +     """
> +     qs, _coerce_result =3D _coerce_args(qs)
> +
> ++    if not separator or (not isinstance(separator, (str, bytes))):
> ++        raise ValueError("Separator must be of type string or bytes.")
> ++
> +     # If max_num_fields is defined then check that the number of field=
s
> +     # is less than max_num_fields. This prevents a memory exhaustion D=
OS
> +     # attack via post bodies with many fields.
> +     if max_num_fields is not None:
> +-        num_fields =3D 1 + qs.count('&') + qs.count(';')
> ++        num_fields =3D 1 + qs.count(separator)
> +         if max_num_fields < num_fields:
> +             raise ValueError('Max number of fields exceeded')
> +
> +-    pairs =3D [s2 for s1 in qs.split('&') for s2 in s1.split(';')]
> ++    pairs =3D [s1 for s1 in qs.split(separator)]
> +     r =3D []
> +     for name_value in pairs:
> +         if not name_value and not strict_parsing:
> +diff --git
> a/Misc/NEWS.d/next/Security/2021-02-14-15-59-16.bpo-42967.YApqDS.rst
> b/Misc/NEWS.d/next/Security/2021-02-14-15-59-16.bpo-42967.YApqDS.rst
> +new file mode 100644
> +index 0000000..f08489b
> +--- /dev/null
> ++++ b/Misc/NEWS.d/next/Security/2021-02-14-15-59-16.bpo-42967.YApqDS.rs=
t
> +@@ -0,0 +1 @@
> ++Fix web cache poisoning vulnerability by defaulting the query args
> separator to ``&``, and allowing the user to choose a custom separator.
> diff --git a/meta/recipes-devtools/python/python3/CVE-2021-23336.patch
> b/meta/recipes-devtools/python/python3/CVE-2021-23336.patch
> new file mode 100644
> index 0000000000..2a885b9d37
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3/CVE-2021-23336.patch
> @@ -0,0 +1,530 @@
> +From 3ab6f812653e79d008d5eba31dc25d34f3ca7170 Mon Sep 17 00:00:00 2001
> +From: Senthil Kumaran <senthil@uthcode.com>
> +Date: Mon, 15 Feb 2021 10:15:02 -0800
> +Subject: [PATCH] bpo-42967: only use '&' as a query string separator
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> + (GH-24297)  (#24529)
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +* bpo-42967: only use '&' as a query string separator (#24297)
> +
> +bpo-42967: [security] Address a web cache-poisoning issue reported in
> +urllib.parse.parse_qsl().
> +
> +urllib.parse will only us "&" as query string separator by default
> +instead of both ";" and "&" as allowed in earlier versions. An optional
> +argument seperator with default value "&" is added to specify the
> +separator.
> +
> +Co-authored-by: =C3=89ric Araujo <merwok@netwok.org>
> +Co-authored-by: blurb-it[bot] <43283697+blurb-it[bot]@
> users.noreply.github.com>
> +Co-authored-by: Ken Jin <28750310+Fidget-Spinner@users.noreply.github.c=
om
> >
> +Co-authored-by: =C3=89ric Araujo <merwok@netwok.org>
> +(cherry picked from commit fcbe0cb04d35189401c0c880ebfb4311e952d776)
> +
> +* [3.8] bpo-42967: only use '&' as a query string separator (GH-24297)
> +
> +bpo-42967: [security] Address a web cache-poisoning issue reported in
> urllib.parse.parse_qsl().
> +
> +urllib.parse will only us "&" as query string separator by default
> instead of both ";" and "&" as allowed in earlier versions. An optional
> argument seperator with default value "&" is added to specify the separa=
tor.
> +
> +Co-authored-by: =C3=89ric Araujo <merwok@netwok.org>
> +Co-authored-by: blurb-it[bot] <43283697+blurb-it[bot]@
> users.noreply.github.com>
> +Co-authored-by: Ken Jin <28750310+Fidget-Spinner@users.noreply.github.c=
om
> >
> +Co-authored-by: =C3=89ric Araujo <merwok@netwok.org>.
> +(cherry picked from commit fcbe0cb04d35189401c0c880ebfb4311e952d776)
> +
> +Co-authored-by: Adam Goldschmidt <adamgold7@gmail.com>
> +
> +* Update correct version information.
> +
> +* fix docs and make logic clearer
> +
> +Co-authored-by: Adam Goldschmidt <adamgold7@gmail.com>
> +Co-authored-by: Fidget-Spinner <
> 28750310+Fidget-Spinner@users.noreply.github.com>
> +
> +Upstream-Status: Backport [
> https://github.com/python/cpython/commit/e3110c3cfbb7daa690d54d0eff6c264=
c870a71bf
> ]
> +CVE: CVE-2020-23336
> +Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
> +
> +---
> + Doc/library/cgi.rst                           | 11 ++-
> + Doc/library/urllib.parse.rst                  | 22 +++++-
> + Doc/whatsnew/3.6.rst                          | 13 ++++
> + Doc/whatsnew/3.7.rst                          | 13 ++++
> + Lib/cgi.py                                    | 23 ++++---
> + Lib/test/test_cgi.py                          | 29 ++++++--
> + Lib/test/test_urlparse.py                     | 68 +++++++++++++------
> + Lib/urllib/parse.py                           | 19 ++++--
> + .../2021-02-14-15-59-16.bpo-42967.YApqDS.rst  |  1 +
> + 9 files changed, 153 insertions(+), 46 deletions(-)
> + create mode 100644
> Misc/NEWS.d/next/Security/2021-02-14-15-59-16.bpo-42967.YApqDS.rst
> +
> +diff --git a/Doc/library/cgi.rst b/Doc/library/cgi.rst
> +index 4048592..880074b 100644
> +--- a/Doc/library/cgi.rst
> ++++ b/Doc/library/cgi.rst
> +@@ -277,14 +277,16 @@ These are useful if you want more control, or if
> you want to employ some of the
> + algorithms implemented in this module in other circumstances.
> +
> +
> +-.. function:: parse(fp=3DNone, environ=3Dos.environ,
> keep_blank_values=3DFalse, strict_parsing=3DFalse)
> ++.. function:: parse(fp=3DNone, environ=3Dos.environ,
> keep_blank_values=3DFalse, strict_parsing=3DFalse, separator=3D"&")
> +
> +    Parse a query in the environment or from a file (the file defaults =
to
> +-   ``sys.stdin``).  The *keep_blank_values* and *strict_parsing*
> parameters are
> ++   ``sys.stdin``).  The *keep_blank_values*, *strict_parsing* and
> *separator* parameters are
> +    passed to :func:`urllib.parse.parse_qs` unchanged.
> +
> ++   .. versionchanged:: 3.8.8
> ++      Added the *separator* parameter.
> +
> +-.. function:: parse_multipart(fp, pdict, encoding=3D"utf-8",
> errors=3D"replace")
> ++.. function:: parse_multipart(fp, pdict, encoding=3D"utf-8",
> errors=3D"replace", separator=3D"&")
> +
> +    Parse input of type :mimetype:`multipart/form-data` (for  file
> uploads).
> +    Arguments are *fp* for the input file, *pdict* for a dictionary
> containing
> +@@ -303,6 +305,9 @@ algorithms implemented in this module in other
> circumstances.
> +       Added the *encoding* and *errors* parameters.  For non-file
> fields, the
> +       value is now a list of strings, not bytes.
> +
> ++   .. versionchanged:: 3.8.8
> ++      Added the *separator* parameter.
> ++
> +
> + .. function:: parse_header(string)
> +
> +diff --git a/Doc/library/urllib.parse.rst b/Doc/library/urllib.parse.rs=
t
> +index 52f98ef..45ca03a 100644
> +--- a/Doc/library/urllib.parse.rst
> ++++ b/Doc/library/urllib.parse.rst
> +@@ -165,7 +165,7 @@ or on combining URL components into a URL string.
> +       now raise :exc:`ValueError`.
> +
> +
> +-.. function:: parse_qs(qs, keep_blank_values=3DFalse,
> strict_parsing=3DFalse, encoding=3D'utf-8', errors=3D'replace',
> max_num_fields=3DNone)
> ++.. function:: parse_qs(qs, keep_blank_values=3DFalse,
> strict_parsing=3DFalse, encoding=3D'utf-8', errors=3D'replace',
> max_num_fields=3DNone, separator=3D'&')
> +
> +    Parse a query string given as a string argument (data of type
> +    :mimetype:`application/x-www-form-urlencoded`).  Data are returned =
as
> a
> +@@ -190,6 +190,9 @@ or on combining URL components into a URL string.
> +    read. If set, then throws a :exc:`ValueError` if there are more tha=
n
> +    *max_num_fields* fields read.
> +
> ++   The optional argument *separator* is the symbol to use for separati=
ng
> the
> ++   query arguments. It defaults to ``&``.
> ++
> +    Use the :func:`urllib.parse.urlencode` function (with the ``doseq``
> +    parameter set to ``True``) to convert such dictionaries into query
> +    strings.
> +@@ -201,8 +204,14 @@ or on combining URL components into a URL string.
> +    .. versionchanged:: 3.8
> +       Added *max_num_fields* parameter.
> +
> ++   .. versionchanged:: 3.8.8
> ++      Added *separator* parameter with the default value of ``&``. Pyt=
hon
> ++      versions earlier than Python 3.8.8 allowed using both ``;`` and
> ``&`` as
> ++      query parameter separator. This has been changed to allow only a
> single
> ++      separator key, with ``&`` as the default separator.
> ++
> +
> +-.. function:: parse_qsl(qs, keep_blank_values=3DFalse,
> strict_parsing=3DFalse, encoding=3D'utf-8', errors=3D'replace',
> max_num_fields=3DNone)
> ++.. function:: parse_qsl(qs, keep_blank_values=3DFalse,
> strict_parsing=3DFalse, encoding=3D'utf-8', errors=3D'replace',
> max_num_fields=3DNone, separator=3D'&')
> +
> +    Parse a query string given as a string argument (data of type
> +    :mimetype:`application/x-www-form-urlencoded`).  Data are returned =
as
> a list of
> +@@ -226,6 +235,9 @@ or on combining URL components into a URL string.
> +    read. If set, then throws a :exc:`ValueError` if there are more tha=
n
> +    *max_num_fields* fields read.
> +
> ++   The optional argument *separator* is the symbol to use for separati=
ng
> the
> ++   query arguments. It defaults to ``&``.
> ++
> +    Use the :func:`urllib.parse.urlencode` function to convert such lis=
ts
> of pairs into
> +    query strings.
> +
> +@@ -235,6 +247,12 @@ or on combining URL components into a URL string.
> +    .. versionchanged:: 3.8
> +       Added *max_num_fields* parameter.
> +
> ++   .. versionchanged:: 3.8.8
> ++      Added *separator* parameter with the default value of ``&``. Pyt=
hon
> ++      versions earlier than Python 3.8.8 allowed using both ``;`` and
> ``&`` as
> ++      query parameter separator. This has been changed to allow only a
> single
> ++      separator key, with ``&`` as the default separator.
> ++
> +
> + .. function:: urlunparse(parts)
> +
> +diff --git a/Doc/whatsnew/3.6.rst b/Doc/whatsnew/3.6.rst
> +index 04c1f7e..4409a3a 100644
> +--- a/Doc/whatsnew/3.6.rst
> ++++ b/Doc/whatsnew/3.6.rst
> +@@ -2443,3 +2443,16 @@ because of the behavior of the socket option
> ``SO_REUSEADDR`` in UDP. For more
> + details, see the documentation for ``loop.create_datagram_endpoint()``=
.
> + (Contributed by Kyle Stanley, Antoine Pitrou, and Yury Selivanov in
> + :issue:`37228`.)
> ++
> ++Notable changes in Python 3.6.13
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ++
> ++Earlier Python versions allowed using both ``;`` and ``&`` as
> ++query parameter separators in :func:`urllib.parse.parse_qs` and
> ++:func:`urllib.parse.parse_qsl`.  Due to security concerns, and to
> conform with
> ++newer W3C recommendations, this has been changed to allow only a singl=
e
> ++separator key, with ``&`` as the default.  This change also affects
> ++:func:`cgi.parse` and :func:`cgi.parse_multipart` as they use the
> affected
> ++functions internally. For more details, please see their respective
> ++documentation.
> ++(Contributed by Adam Goldschmidt, Senthil Kumaran and Ken Jin in
> :issue:`42967`.)
> +diff --git a/Doc/whatsnew/3.7.rst b/Doc/whatsnew/3.7.rst
> +index b9b5021..8f47a9f 100644
> +--- a/Doc/whatsnew/3.7.rst
> ++++ b/Doc/whatsnew/3.7.rst
> +@@ -2556,3 +2556,16 @@ because of the behavior of the socket option
> ``SO_REUSEADDR`` in UDP. For more
> + details, see the documentation for ``loop.create_datagram_endpoint()``=
.
> + (Contributed by Kyle Stanley, Antoine Pitrou, and Yury Selivanov in
> + :issue:`37228`.)
> ++
> ++Notable changes in Python 3.7.10
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ++
> ++Earlier Python versions allowed using both ``;`` and ``&`` as
> ++query parameter separators in :func:`urllib.parse.parse_qs` and
> ++:func:`urllib.parse.parse_qsl`.  Due to security concerns, and to
> conform with
> ++newer W3C recommendations, this has been changed to allow only a singl=
e
> ++separator key, with ``&`` as the default.  This change also affects
> ++:func:`cgi.parse` and :func:`cgi.parse_multipart` as they use the
> affected
> ++functions internally. For more details, please see their respective
> ++documentation.
> ++(Contributed by Adam Goldschmidt, Senthil Kumaran and Ken Jin in
> :issue:`42967`.)
> +diff --git a/Lib/cgi.py b/Lib/cgi.py
> +index 5ace46a..13255a9 100755
> +--- a/Lib/cgi.py
> ++++ b/Lib/cgi.py
> +@@ -106,7 +106,8 @@ log =3D initlog           # The current logging fun=
ction
> + # 0 =3D=3D> unlimited input
> + maxlen =3D 0
> +
> +-def parse(fp=3DNone, environ=3Dos.environ, keep_blank_values=3D0,
> strict_parsing=3D0):
> ++def parse(fp=3DNone, environ=3Dos.environ, keep_blank_values=3D0,
> ++          strict_parsing=3D0, separator=3D'&'):
> +     """Parse a query in the environment or from a file (default stdin)
> +
> +         Arguments, all optional:
> +@@ -125,6 +126,9 @@ def parse(fp=3DNone, environ=3Dos.environ,
> keep_blank_values=3D0, strict_parsing=3D0):
> +         strict_parsing: flag indicating what to do with parsing errors=
.
> +             If false (the default), errors are silently ignored.
> +             If true, errors raise a ValueError exception.
> ++
> ++        separator: str. The symbol to use for separating the query
> arguments.
> ++            Defaults to &.
> +     """
> +     if fp is None:
> +         fp =3D sys.stdin
> +@@ -145,7 +149,7 @@ def parse(fp=3DNone, environ=3Dos.environ,
> keep_blank_values=3D0, strict_parsing=3D0):
> +     if environ['REQUEST_METHOD'] =3D=3D 'POST':
> +         ctype, pdict =3D parse_header(environ['CONTENT_TYPE'])
> +         if ctype =3D=3D 'multipart/form-data':
> +-            return parse_multipart(fp, pdict)
> ++            return parse_multipart(fp, pdict, separator=3Dseparator)
> +         elif ctype =3D=3D 'application/x-www-form-urlencoded':
> +             clength =3D int(environ['CONTENT_LENGTH'])
> +             if maxlen and clength > maxlen:
> +@@ -169,10 +173,10 @@ def parse(fp=3DNone, environ=3Dos.environ,
> keep_blank_values=3D0, strict_parsing=3D0):
> +             qs =3D ""
> +         environ['QUERY_STRING'] =3D qs    # XXX Shouldn't, really
> +     return urllib.parse.parse_qs(qs, keep_blank_values, strict_parsing=
,
> +-                                 encoding=3Dencoding)
> ++                                 encoding=3Dencoding, separator=3Dsepa=
rator)
> +
> +
> +-def parse_multipart(fp, pdict, encoding=3D"utf-8", errors=3D"replace")=
:
> ++def parse_multipart(fp, pdict, encoding=3D"utf-8", errors=3D"replace",
> separator=3D'&'):
> +     """Parse multipart input.
> +
> +     Arguments:
> +@@ -193,7 +197,7 @@ def parse_multipart(fp, pdict, encoding=3D"utf-8",
> errors=3D"replace"):
> +     headers.set_type(ctype)
> +     headers['Content-Length'] =3D pdict['CONTENT-LENGTH']
> +     fs =3D FieldStorage(fp, headers=3Dheaders, encoding=3Dencoding,
> errors=3Derrors,
> +-        environ=3D{'REQUEST_METHOD': 'POST'})
> ++        environ=3D{'REQUEST_METHOD': 'POST'}, separator=3Dseparator)
> +     return {k: fs.getlist(k) for k in fs}
> +
> + def _parseparam(s):
> +@@ -303,7 +307,7 @@ class FieldStorage:
> +     def __init__(self, fp=3DNone, headers=3DNone, outerboundary=3Db'',
> +                  environ=3Dos.environ, keep_blank_values=3D0,
> strict_parsing=3D0,
> +                  limit=3DNone, encoding=3D'utf-8', errors=3D'replace',
> +-                 max_num_fields=3DNone):
> ++                 max_num_fields=3DNone, separator=3D'&'):
> +         """Constructor.  Read multipart/* until last part.
> +
> +         Arguments, all optional:
> +@@ -351,6 +355,7 @@ class FieldStorage:
> +         self.keep_blank_values =3D keep_blank_values
> +         self.strict_parsing =3D strict_parsing
> +         self.max_num_fields =3D max_num_fields
> ++        self.separator =3D separator
> +         if 'REQUEST_METHOD' in environ:
> +             method =3D environ['REQUEST_METHOD'].upper()
> +         self.qs_on_post =3D None
> +@@ -577,7 +582,7 @@ class FieldStorage:
> +         query =3D urllib.parse.parse_qsl(
> +             qs, self.keep_blank_values, self.strict_parsing,
> +             encoding=3Dself.encoding, errors=3Dself.errors,
> +-            max_num_fields=3Dself.max_num_fields)
> ++            max_num_fields=3Dself.max_num_fields, separator=3Dself.sep=
arator)
> +         self.list =3D [MiniFieldStorage(key, value) for key, value in
> query]
> +         self.skip_lines()
> +
> +@@ -593,7 +598,7 @@ class FieldStorage:
> +             query =3D urllib.parse.parse_qsl(
> +                 self.qs_on_post, self.keep_blank_values,
> self.strict_parsing,
> +                 encoding=3Dself.encoding, errors=3Dself.errors,
> +-                max_num_fields=3Dself.max_num_fields)
> ++                max_num_fields=3Dself.max_num_fields,
> separator=3Dself.separator)
> +             self.list.extend(MiniFieldStorage(key, value) for key, val=
ue
> in query)
> +
> +         klass =3D self.FieldStorageClass or self.__class__
> +@@ -637,7 +642,7 @@ class FieldStorage:
> +                 else self.limit - self.bytes_read
> +             part =3D klass(self.fp, headers, ib, environ,
> keep_blank_values,
> +                          strict_parsing, limit,
> +-                         self.encoding, self.errors, max_num_fields)
> ++                         self.encoding, self.errors, max_num_fields,
> self.separator)
> +
> +             if max_num_fields is not None:
> +                 max_num_fields -=3D 1
> +diff --git a/Lib/test/test_cgi.py b/Lib/test/test_cgi.py
> +index ab86771..bda03ee 100644
> +--- a/Lib/test/test_cgi.py
> ++++ b/Lib/test/test_cgi.py
> +@@ -53,12 +53,9 @@ parse_strict_test_cases =3D [
> +     ("", ValueError("bad query field: ''")),
> +     ("&", ValueError("bad query field: ''")),
> +     ("&&", ValueError("bad query field: ''")),
> +-    (";", ValueError("bad query field: ''")),
> +-    (";&;", ValueError("bad query field: ''")),
> +     # Should the next few really be valid?
> +     ("=3D", {}),
> +     ("=3D&=3D", {}),
> +-    ("=3D;=3D", {}),
> +     # This rest seem to make sense
> +     ("=3Da", {'': ['a']}),
> +     ("&=3Da", ValueError("bad query field: ''")),
> +@@ -73,8 +70,6 @@ parse_strict_test_cases =3D [
> +     ("a=3Da+b&b=3Db+c", {'a': ['a b'], 'b': ['b c']}),
> +     ("a=3Da+b&a=3Db+a", {'a': ['a b', 'b a']}),
> +     ("x=3D1&y=3D2.0&z=3D2-3.%2b0", {'x': ['1'], 'y': ['2.0'], 'z':
> ['2-3.+0']}),
> +-    ("x=3D1;y=3D2.0&z=3D2-3.%2b0", {'x': ['1'], 'y': ['2.0'], 'z':
> ['2-3.+0']}),
> +-    ("x=3D1;y=3D2.0;z=3D2-3.%2b0", {'x': ['1'], 'y': ['2.0'], 'z':
> ['2-3.+0']}),
> +
>  ("Hbc5161168c542333633315dee1182227:key_store_seqid=3D400006&cuyer=3Dr&=
view=3Dbustomer&order_id=3D0bb2e248638833d48cb7fed300000f1b&expire=3D964546=
263&lobale=3Den-US&kid=3D130003.300038&ss=3Denv",
> +      {'Hbc5161168c542333633315dee1182227:key_store_seqid': ['400006'],
> +       'cuyer': ['r'],
> +@@ -187,6 +182,30 @@ Content-Length: 3
> +                     else:
> +                         self.assertEqual(fs.getvalue(key), expect_val[=
0])
> +
> ++    def test_separator(self):
> ++        parse_semicolon =3D [
> ++            ("x=3D1;y=3D2.0", {'x': ['1'], 'y': ['2.0']}),
> ++            ("x=3D1;y=3D2.0;z=3D2-3.%2b0", {'x': ['1'], 'y': ['2.0'], =
'z':
> ['2-3.+0']}),
> ++            (";", ValueError("bad query field: ''")),
> ++            (";;", ValueError("bad query field: ''")),
> ++            ("=3D;a", ValueError("bad query field: 'a'")),
> ++            (";b=3Da", ValueError("bad query field: ''")),
> ++            ("b;=3Da", ValueError("bad query field: 'b'")),
> ++            ("a=3Da+b;b=3Db+c", {'a': ['a b'], 'b': ['b c']}),
> ++            ("a=3Da+b;a=3Db+a", {'a': ['a b', 'b a']}),
> ++        ]
> ++        for orig, expect in parse_semicolon:
> ++            env =3D {'QUERY_STRING': orig}
> ++            fs =3D cgi.FieldStorage(separator=3D';', environ=3Denv)
> ++            if isinstance(expect, dict):
> ++                for key in expect.keys():
> ++                    expect_val =3D expect[key]
> ++                    self.assertIn(key, fs)
> ++                    if len(expect_val) > 1:
> ++                        self.assertEqual(fs.getvalue(key), expect_val)
> ++                    else:
> ++                        self.assertEqual(fs.getvalue(key), expect_val[=
0])
> ++
> +     def test_log(self):
> +         cgi.log("Testing")
> +
> +diff --git a/Lib/test/test_urlparse.py b/Lib/test/test_urlparse.py
> +index 4ae6ed3..90c8d69 100644
> +--- a/Lib/test/test_urlparse.py
> ++++ b/Lib/test/test_urlparse.py
> +@@ -32,16 +32,10 @@ parse_qsl_test_cases =3D [
> +     (b"&a=3Db", [(b'a', b'b')]),
> +     (b"a=3Da+b&b=3Db+c", [(b'a', b'a b'), (b'b', b'b c')]),
> +     (b"a=3D1&a=3D2", [(b'a', b'1'), (b'a', b'2')]),
> +-    (";", []),
> +-    (";;", []),
> +-    (";a=3Db", [('a', 'b')]),
> +-    ("a=3Da+b;b=3Db+c", [('a', 'a b'), ('b', 'b c')]),
> +-    ("a=3D1;a=3D2", [('a', '1'), ('a', '2')]),
> +-    (b";", []),
> +-    (b";;", []),
> +-    (b";a=3Db", [(b'a', b'b')]),
> +-    (b"a=3Da+b;b=3Db+c", [(b'a', b'a b'), (b'b', b'b c')]),
> +-    (b"a=3D1;a=3D2", [(b'a', b'1'), (b'a', b'2')]),
> ++    (";a=3Db", [(';a', 'b')]),
> ++    ("a=3Da+b;b=3Db+c", [('a', 'a b;b=3Db c')]),
> ++    (b";a=3Db", [(b';a', b'b')]),
> ++    (b"a=3Da+b;b=3Db+c", [(b'a', b'a b;b=3Db c')]),
> + ]
> +
> + # Each parse_qs testcase is a two-tuple that contains
> +@@ -68,16 +62,10 @@ parse_qs_test_cases =3D [
> +     (b"&a=3Db", {b'a': [b'b']}),
> +     (b"a=3Da+b&b=3Db+c", {b'a': [b'a b'], b'b': [b'b c']}),
> +     (b"a=3D1&a=3D2", {b'a': [b'1', b'2']}),
> +-    (";", {}),
> +-    (";;", {}),
> +-    (";a=3Db", {'a': ['b']}),
> +-    ("a=3Da+b;b=3Db+c", {'a': ['a b'], 'b': ['b c']}),
> +-    ("a=3D1;a=3D2", {'a': ['1', '2']}),
> +-    (b";", {}),
> +-    (b";;", {}),
> +-    (b";a=3Db", {b'a': [b'b']}),
> +-    (b"a=3Da+b;b=3Db+c", {b'a': [b'a b'], b'b': [b'b c']}),
> +-    (b"a=3D1;a=3D2", {b'a': [b'1', b'2']}),
> ++    (";a=3Db", {';a': ['b']}),
> ++    ("a=3Da+b;b=3Db+c", {'a': ['a b;b=3Db c']}),
> ++    (b";a=3Db", {b';a': [b'b']}),
> ++    (b"a=3Da+b;b=3Db+c", {b'a':[ b'a b;b=3Db c']}),
> + ]
> +
> + class UrlParseTestCase(unittest.TestCase):
> +@@ -884,10 +872,46 @@ class UrlParseTestCase(unittest.TestCase):
> +     def test_parse_qsl_max_num_fields(self):
> +         with self.assertRaises(ValueError):
> +             urllib.parse.parse_qs('&'.join(['a=3Da']*11),
> max_num_fields=3D10)
> +-        with self.assertRaises(ValueError):
> +-            urllib.parse.parse_qs(';'.join(['a=3Da']*11),
> max_num_fields=3D10)
> +         urllib.parse.parse_qs('&'.join(['a=3Da']*10), max_num_fields=
=3D10)
> +
> ++    def test_parse_qs_separator(self):
> ++        parse_qs_semicolon_cases =3D [
> ++            (";", {}),
> ++            (";;", {}),
> ++            (";a=3Db", {'a': ['b']}),
> ++            ("a=3Da+b;b=3Db+c", {'a': ['a b'], 'b': ['b c']}),
> ++            ("a=3D1;a=3D2", {'a': ['1', '2']}),
> ++            (b";", {}),
> ++            (b";;", {}),
> ++            (b";a=3Db", {b'a': [b'b']}),
> ++            (b"a=3Da+b;b=3Db+c", {b'a': [b'a b'], b'b': [b'b c']}),
> ++            (b"a=3D1;a=3D2", {b'a': [b'1', b'2']}),
> ++        ]
> ++        for orig, expect in parse_qs_semicolon_cases:
> ++            with self.subTest(f"Original: {orig!r}, Expected:
> {expect!r}"):
> ++                result =3D urllib.parse.parse_qs(orig, separator=3D';'=
)
> ++                self.assertEqual(result, expect, "Error parsing %r" %
> orig)
> ++
> ++
> ++    def test_parse_qsl_separator(self):
> ++        parse_qsl_semicolon_cases =3D [
> ++            (";", []),
> ++            (";;", []),
> ++            (";a=3Db", [('a', 'b')]),
> ++            ("a=3Da+b;b=3Db+c", [('a', 'a b'), ('b', 'b c')]),
> ++            ("a=3D1;a=3D2", [('a', '1'), ('a', '2')]),
> ++            (b";", []),
> ++            (b";;", []),
> ++            (b";a=3Db", [(b'a', b'b')]),
> ++            (b"a=3Da+b;b=3Db+c", [(b'a', b'a b'), (b'b', b'b c')]),
> ++            (b"a=3D1;a=3D2", [(b'a', b'1'), (b'a', b'2')]),
> ++        ]
> ++        for orig, expect in parse_qsl_semicolon_cases:
> ++            with self.subTest(f"Original: {orig!r}, Expected:
> {expect!r}"):
> ++                result =3D urllib.parse.parse_qsl(orig, separator=3D';=
')
> ++                self.assertEqual(result, expect, "Error parsing %r" %
> orig)
> ++
> ++
> +     def test_urlencode_sequences(self):
> +         # Other tests incidentally urlencode things; test non-covered
> cases:
> +         # Sequence and object values.
> +diff --git a/Lib/urllib/parse.py b/Lib/urllib/parse.py
> +index e2b6f13..5a3e847 100644
> +--- a/Lib/urllib/parse.py
> ++++ b/Lib/urllib/parse.py
> +@@ -648,7 +648,7 @@ def unquote(string, encoding=3D'utf-8',
> errors=3D'replace'):
> +
> +
> + def parse_qs(qs, keep_blank_values=3DFalse, strict_parsing=3DFalse,
> +-             encoding=3D'utf-8', errors=3D'replace', max_num_fields=3D=
None):
> ++             encoding=3D'utf-8', errors=3D'replace', max_num_fields=3D=
None,
> separator=3D'&'):
> +     """Parse a query given as a string argument.
> +
> +         Arguments:
> +@@ -672,12 +672,15 @@ def parse_qs(qs, keep_blank_values=3DFalse,
> strict_parsing=3DFalse,
> +         max_num_fields: int. If set, then throws a ValueError if there
> +             are more than n fields read by parse_qsl().
> +
> ++        separator: str. The symbol to use for separating the query
> arguments.
> ++            Defaults to &.
> ++
> +         Returns a dictionary.
> +     """
> +     parsed_result =3D {}
> +     pairs =3D parse_qsl(qs, keep_blank_values, strict_parsing,
> +                       encoding=3Dencoding, errors=3Derrors,
> +-                      max_num_fields=3Dmax_num_fields)
> ++                      max_num_fields=3Dmax_num_fields, separator=3Dsep=
arator)
> +     for name, value in pairs:
> +         if name in parsed_result:
> +             parsed_result[name].append(value)
> +@@ -687,7 +690,7 @@ def parse_qs(qs, keep_blank_values=3DFalse,
> strict_parsing=3DFalse,
> +
> +
> + def parse_qsl(qs, keep_blank_values=3DFalse, strict_parsing=3DFalse,
> +-              encoding=3D'utf-8', errors=3D'replace', max_num_fields=
=3DNone):
> ++              encoding=3D'utf-8', errors=3D'replace', max_num_fields=
=3DNone,
> separator=3D'&'):
> +     """Parse a query given as a string argument.
> +
> +         Arguments:
> +@@ -710,19 +713,25 @@ def parse_qsl(qs, keep_blank_values=3DFalse,
> strict_parsing=3DFalse,
> +         max_num_fields: int. If set, then throws a ValueError
> +             if there are more than n fields read by parse_qsl().
> +
> ++        separator: str. The symbol to use for separating the query
> arguments.
> ++            Defaults to &.
> ++
> +         Returns a list, as G-d intended.
> +     """
> +     qs, _coerce_result =3D _coerce_args(qs)
> +
> ++    if not separator or (not isinstance(separator, (str, bytes))):
> ++        raise ValueError("Separator must be of type string or bytes.")
> ++
> +     # If max_num_fields is defined then check that the number of field=
s
> +     # is less than max_num_fields. This prevents a memory exhaustion D=
OS
> +     # attack via post bodies with many fields.
> +     if max_num_fields is not None:
> +-        num_fields =3D 1 + qs.count('&') + qs.count(';')
> ++        num_fields =3D 1 + qs.count(separator)
> +         if max_num_fields < num_fields:
> +             raise ValueError('Max number of fields exceeded')
> +
> +-    pairs =3D [s2 for s1 in qs.split('&') for s2 in s1.split(';')]
> ++    pairs =3D [s1 for s1 in qs.split(separator)]
> +     r =3D []
> +     for name_value in pairs:
> +         if not name_value and not strict_parsing:
> +diff --git
> a/Misc/NEWS.d/next/Security/2021-02-14-15-59-16.bpo-42967.YApqDS.rst
> b/Misc/NEWS.d/next/Security/2021-02-14-15-59-16.bpo-42967.YApqDS.rst
> +new file mode 100644
> +index 0000000..f08489b
> +--- /dev/null
> ++++ b/Misc/NEWS.d/next/Security/2021-02-14-15-59-16.bpo-42967.YApqDS.rs=
t
> +@@ -0,0 +1 @@
> ++Fix web cache poisoning vulnerability by defaulting the query args
> separator to ``&``, and allowing the user to choose a custom separator.
> diff --git a/meta/recipes-devtools/python/python3/CVE-2021-3177.patch
> b/meta/recipes-devtools/python/python3/CVE-2021-3177.patch
> new file mode 100644
> index 0000000000..af95b5eee1
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3/CVE-2021-3177.patch
> @@ -0,0 +1,191 @@
> +From ece5dfd403dac211f8d3c72701fe7ba7b7aa5b5f Mon Sep 17 00:00:00 2001
> +From: "Miss Islington (bot)"
> + <31488909+miss-islington@users.noreply.github.com>
> +Date: Mon, 18 Jan 2021 13:28:52 -0800
> +Subject: [PATCH] closes bpo-42938: Replace snprintf with Python unicode
> + formatting in ctypes param reprs. (GH-24248)
> +
> +(cherry picked from commit 916610ef90a0d0761f08747f7b0905541f0977c7)
> +
> +Co-authored-by: Benjamin Peterson <benjamin@python.org>
> +
> +Co-authored-by: Benjamin Peterson <benjamin@python.org>
> +
> +Upstream-Status: Backport [
> https://github.com/python/cpython/commit/ece5dfd403dac211f8d3c72701fe7ba=
7b7aa5b5f
> ]
> +CVE: CVE-2021-3177
> +Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
> +---
> + Lib/ctypes/test/test_parameters.py            | 43 ++++++++++++++++
> + .../2021-01-18-09-27-31.bpo-42938.4Zn4Mp.rst  |  2 +
> + Modules/_ctypes/callproc.c                    | 51 +++++++------------
> + 3 files changed, 64 insertions(+), 32 deletions(-)
> + create mode 100644
> Misc/NEWS.d/next/Security/2021-01-18-09-27-31.bpo-42938.4Zn4Mp.rst
> +
> +diff --git a/Lib/ctypes/test/test_parameters.py
> b/Lib/ctypes/test/test_parameters.py
> +index e4c25fd880cef..531894fdec838 100644
> +--- a/Lib/ctypes/test/test_parameters.py
> ++++ b/Lib/ctypes/test/test_parameters.py
> +@@ -201,6 +201,49 @@ def __dict__(self):
> +         with self.assertRaises(ZeroDivisionError):
> +             WorseStruct().__setstate__({}, b'foo')
> +
> ++    def test_parameter_repr(self):
> ++        from ctypes import (
> ++            c_bool,
> ++            c_char,
> ++            c_wchar,
> ++            c_byte,
> ++            c_ubyte,
> ++            c_short,
> ++            c_ushort,
> ++            c_int,
> ++            c_uint,
> ++            c_long,
> ++            c_ulong,
> ++            c_longlong,
> ++            c_ulonglong,
> ++            c_float,
> ++            c_double,
> ++            c_longdouble,
> ++            c_char_p,
> ++            c_wchar_p,
> ++            c_void_p,
> ++        )
> ++        self.assertRegex(repr(c_bool.from_param(True)), r"^<cparam '\?=
'
> at 0x[A-Fa-f0-9]+>$")
> ++        self.assertEqual(repr(c_char.from_param(97)), "<cparam 'c'
> ('a')>")
> ++        self.assertRegex(repr(c_wchar.from_param('a')), r"^<cparam 'u'
> at 0x[A-Fa-f0-9]+>$")
> ++        self.assertEqual(repr(c_byte.from_param(98)), "<cparam 'b'
> (98)>")
> ++        self.assertEqual(repr(c_ubyte.from_param(98)), "<cparam 'B'
> (98)>")
> ++        self.assertEqual(repr(c_short.from_param(511)), "<cparam 'h'
> (511)>")
> ++        self.assertEqual(repr(c_ushort.from_param(511)), "<cparam 'H'
> (511)>")
> ++        self.assertRegex(repr(c_int.from_param(20000)), r"^<cparam
> '[li]' \(20000\)>$")
> ++        self.assertRegex(repr(c_uint.from_param(20000)), r"^<cparam
> '[LI]' \(20000\)>$")
> ++        self.assertRegex(repr(c_long.from_param(20000)), r"^<cparam
> '[li]' \(20000\)>$")
> ++        self.assertRegex(repr(c_ulong.from_param(20000)), r"^<cparam
> '[LI]' \(20000\)>$")
> ++        self.assertRegex(repr(c_longlong.from_param(20000)), r"^<cpara=
m
> '[liq]' \(20000\)>$")
> ++        self.assertRegex(repr(c_ulonglong.from_param(20000)), r"^<cpar=
am
> '[LIQ]' \(20000\)>$")
> ++        self.assertEqual(repr(c_float.from_param(1.5)), "<cparam 'f'
> (1.5)>")
> ++        self.assertEqual(repr(c_double.from_param(1.5)), "<cparam 'd'
> (1.5)>")
> ++        self.assertEqual(repr(c_double.from_param(1e300)), "<cparam 'd=
'
> (1e+300)>")
> ++        self.assertRegex(repr(c_longdouble.from_param(1.5)), r"^<cpara=
m
> ('d' \(1.5\)|'g' at 0x[A-Fa-f0-9]+)>$")
> ++        self.assertRegex(repr(c_char_p.from_param(b'hihi')), "^<cparam
> 'z' \(0x[A-Fa-f0-9]+\)>$")
> ++        self.assertRegex(repr(c_wchar_p.from_param('hihi')), "^<cparam
> 'Z' \(0x[A-Fa-f0-9]+\)>$")
> ++        self.assertRegex(repr(c_void_p.from_param(0x12)), r"^<cparam '=
P'
> \(0x0*12\)>$")
> ++
> + ################################################################
> +
> + if __name__ =3D=3D '__main__':
> +diff --git
> a/Misc/NEWS.d/next/Security/2021-01-18-09-27-31.bpo-42938.4Zn4Mp.rst
> b/Misc/NEWS.d/next/Security/2021-01-18-09-27-31.bpo-42938.4Zn4Mp.rst
> +new file mode 100644
> +index 0000000000000..7df65a156feab
> +--- /dev/null
> ++++ b/Misc/NEWS.d/next/Security/2021-01-18-09-27-31.bpo-42938.4Zn4Mp.rs=
t
> +@@ -0,0 +1,2 @@
> ++Avoid static buffers when computing the repr of :class:`ctypes.c_doubl=
e`
> and
> ++:class:`ctypes.c_longdouble` values.
> +diff --git a/Modules/_ctypes/callproc.c b/Modules/_ctypes/callproc.c
> +index a9b8675cd951b..de75918d49f37 100644
> +--- a/Modules/_ctypes/callproc.c
> ++++ b/Modules/_ctypes/callproc.c
> +@@ -484,58 +484,47 @@ is_literal_char(unsigned char c)
> + static PyObject *
> + PyCArg_repr(PyCArgObject *self)
> + {
> +-    char buffer[256];
> +     switch(self->tag) {
> +     case 'b':
> +     case 'B':
> +-        sprintf(buffer, "<cparam '%c' (%d)>",
> ++        return PyUnicode_FromFormat("<cparam '%c' (%d)>",
> +             self->tag, self->value.b);
> +-        break;
> +     case 'h':
> +     case 'H':
> +-        sprintf(buffer, "<cparam '%c' (%d)>",
> ++        return PyUnicode_FromFormat("<cparam '%c' (%d)>",
> +             self->tag, self->value.h);
> +-        break;
> +     case 'i':
> +     case 'I':
> +-        sprintf(buffer, "<cparam '%c' (%d)>",
> ++        return PyUnicode_FromFormat("<cparam '%c' (%d)>",
> +             self->tag, self->value.i);
> +-        break;
> +     case 'l':
> +     case 'L':
> +-        sprintf(buffer, "<cparam '%c' (%ld)>",
> ++        return PyUnicode_FromFormat("<cparam '%c' (%ld)>",
> +             self->tag, self->value.l);
> +-        break;
> +
> +     case 'q':
> +     case 'Q':
> +-        sprintf(buffer,
> +-#ifdef MS_WIN32
> +-            "<cparam '%c' (%I64d)>",
> +-#else
> +-            "<cparam '%c' (%lld)>",
> +-#endif
> ++        return PyUnicode_FromFormat("<cparam '%c' (%lld)>",
> +             self->tag, self->value.q);
> +-        break;
> +     case 'd':
> +-        sprintf(buffer, "<cparam '%c' (%f)>",
> +-            self->tag, self->value.d);
> +-        break;
> +-    case 'f':
> +-        sprintf(buffer, "<cparam '%c' (%f)>",
> +-            self->tag, self->value.f);
> +-        break;
> +-
> ++    case 'f': {
> ++        PyObject *f =3D PyFloat_FromDouble((self->tag =3D=3D 'f') ?
> self->value.f : self->value.d);
> ++        if (f =3D=3D NULL) {
> ++            return NULL;
> ++        }
> ++        PyObject *result =3D PyUnicode_FromFormat("<cparam '%c' (%R)>"=
,
> self->tag, f);
> ++        Py_DECREF(f);
> ++        return result;
> ++    }
> +     case 'c':
> +         if (is_literal_char((unsigned char)self->value.c)) {
> +-            sprintf(buffer, "<cparam '%c' ('%c')>",
> ++            return PyUnicode_FromFormat("<cparam '%c' ('%c')>",
> +                 self->tag, self->value.c);
> +         }
> +         else {
> +-            sprintf(buffer, "<cparam '%c' ('\\x%02x')>",
> ++            return PyUnicode_FromFormat("<cparam '%c' ('\\x%02x')>",
> +                 self->tag, (unsigned char)self->value.c);
> +         }
> +-        break;
> +
> + /* Hm, are these 'z' and 'Z' codes useful at all?
> +    Shouldn't they be replaced by the functionality of c_string
> +@@ -544,22 +533,20 @@ PyCArg_repr(PyCArgObject *self)
> +     case 'z':
> +     case 'Z':
> +     case 'P':
> +-        sprintf(buffer, "<cparam '%c' (%p)>",
> ++        return PyUnicode_FromFormat("<cparam '%c' (%p)>",
> +             self->tag, self->value.p);
> +         break;
> +
> +     default:
> +         if (is_literal_char((unsigned char)self->tag)) {
> +-            sprintf(buffer, "<cparam '%c' at %p>",
> ++            return PyUnicode_FromFormat("<cparam '%c' at %p>",
> +                 (unsigned char)self->tag, (void *)self);
> +         }
> +         else {
> +-            sprintf(buffer, "<cparam 0x%02x at %p>",
> ++            return PyUnicode_FromFormat("<cparam 0x%02x at %p>",
> +                 (unsigned char)self->tag, (void *)self);
> +         }
> +-        break;
> +     }
> +-    return PyUnicode_FromString(buffer);
> + }
> +
> + static PyMemberDef PyCArgType_members[] =3D {
> +
> diff --git a/meta/recipes-devtools/python/python3_3.8.2.bb
> b/meta/recipes-devtools/python/python3_3.8.2.bb
> index a448b3ed97..c870fc4f05 100644
> --- a/meta/recipes-devtools/python/python3_3.8.2.bb
> +++ b/meta/recipes-devtools/python/python3_3.8.2.bb
> @@ -37,6 +37,8 @@ SRC_URI =3D "
> http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
>             file://CVE-2020-14422.patch \
>             file://CVE-2020-26116.patch \
>             file://CVE-2020-27619.patch \
> +           file://CVE-2021-3177.patch \
> +           file://CVE-2021-23336.patch \
>             "
>
>  SRC_URI_append_class-native =3D " \
> --
> 2.17.1
>
>
>=20
>
>

--00000000000045121805bc906108
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>CVE-2021-3177.patch is already on its way to dunfell =
in:<br></div><a href=3D"https://git.openembedded.org/openembedded-core-cont=
rib/commit/?h=3Dstable/dunfell-nut&amp;id=3D1e01cf0c4edc82a0a0160ce376d502c=
b3eed54ea">https://git.openembedded.org/openembedded-core-contrib/commit/?h=
=
=3Dstable/dunfell-nut&amp;id=3D1e01cf0c4edc82a0a0160ce376d502cb3eed54ea</a=
><br><div><br></div><div>it would be better if you rebase on top of that an=
d while doing that please delete the first CVE-2021-23336.patch as you&#39;=
re adding it twice as:</div><div>=C2=A0.../python/CVE-2021-23336.patch<br>=
=C2=A0.../python/python3/CVE-2021-23336.patch<br></div><div><br></div><div=
><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Tue, Mar 2, 2021 at 5:12 PM Lee Chee Yang &lt;<a href=3D"mail=
to:chee.yang.lee@intel.com">chee.yang.lee@intel.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">From: Lee Chee Yang &lt;=
<a href=3D"mailto:chee.yang.lee@intel.com" target=3D"_blank">chee.yang.lee@=
intel.com</a>&gt;<br>
<br>
Signed-off-by: Lee Chee Yang &lt;<a href=3D"mailto:chee.yang.lee@intel.com=
" target=3D"_blank">chee.yang.lee@intel.com</a>&gt;<br>
---<br>
=C2=A0.../python/CVE-2021-23336.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 530 ++++++++++++++++++<br>
=C2=A0.../python/python3/CVE-2021-23336.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0| =
530 ++++++++++++++++++<br>
=C2=A0.../python/python3/CVE-2021-3177.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 | =
191 +++++++<br>
=C2=A0meta/recipes-devtools/python/<a href=3D"http://python3_3.8.2.bb" rel=
=
=3D"noreferrer" target=3D"_blank">python3_3.8.2.bb</a> |=C2=A0 =C2=A02 +<b=
r>
=C2=A04 files changed, 1253 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/python/CVE-2021-23336.patch=
<br>
=C2=A0create mode 100644 meta/recipes-devtools/python/python3/CVE-2021-233=
36.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/python/python3/CVE-2021-317=
7.patch<br>
<br>
diff --git a/meta/recipes-devtools/python/CVE-2021-23336.patch b/meta/reci=
pes-devtools/python/CVE-2021-23336.patch<br>
new file mode 100644<br>
index 0000000000..2a885b9d37<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/python/CVE-2021-23336.patch<br>
@@ -0,0 +1,530 @@<br>
+From 3ab6f812653e79d008d5eba31dc25d34f3ca7170 Mon Sep 17 00:00:00 2001<br=
>
+From: Senthil Kumaran &lt;<a href=3D"mailto:senthil@uthcode.com" target=
=3D"_blank">senthil@uthcode.com</a>&gt;<br>
+Date: Mon, 15 Feb 2021 10:15:02 -0800<br>
+Subject: [PATCH] bpo-42967: only use &#39;&amp;&#39; as a query string se=
parator<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+ (GH-24297)=C2=A0 (#24529)<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+* bpo-42967: only use &#39;&amp;&#39; as a query string separator (#24297=
)<br>
+<br>
+bpo-42967: [security] Address a web cache-poisoning issue reported in<br>
+urllib.parse.parse_qsl().<br>
+<br>
+urllib.parse will only us &quot;&amp;&quot; as query string separator by =
default<br>
+instead of both &quot;;&quot; and &quot;&amp;&quot; as allowed in earlier=
 versions. An optional<br>
+argument seperator with default value &quot;&amp;&quot; is added to speci=
fy the<br>
+separator.<br>
+<br>
+Co-authored-by: =C3=89ric Araujo &lt;<a href=3D"mailto:merwok@netwok.org"=
 target=3D"_blank">merwok@netwok.org</a>&gt;<br>
+Co-authored-by: blurb-it[bot] &lt;43283697+blurb-it[bot]@<a href=3D"http:=
//users.noreply.github.com" rel=3D"noreferrer" target=3D"_blank">users.nore=
ply.github.com</a>&gt;<br>
+Co-authored-by: Ken Jin &lt;<a href=3D"mailto:28750310%2BFidget-Spinner@u=
sers.noreply.github.com" target=3D"_blank">28750310+Fidget-Spinner@users.no=
reply.github.com</a>&gt;<br>
+Co-authored-by: =C3=89ric Araujo &lt;<a href=3D"mailto:merwok@netwok.org"=
 target=3D"_blank">merwok@netwok.org</a>&gt;<br>
+(cherry picked from commit fcbe0cb04d35189401c0c880ebfb4311e952d776)<br>
+<br>
+* [3.8] bpo-42967: only use &#39;&amp;&#39; as a query string separator (=
GH-24297)<br>
+<br>
+bpo-42967: [security] Address a web cache-poisoning issue reported in url=
lib.parse.parse_qsl().<br>
+<br>
+urllib.parse will only us &quot;&amp;&quot; as query string separator by =
default instead of both &quot;;&quot; and &quot;&amp;&quot; as allowed in e=
arlier versions. An optional argument seperator with default value &quot;&a=
mp;&quot; is added to specify the separator.<br>
+<br>
+Co-authored-by: =C3=89ric Araujo &lt;<a href=3D"mailto:merwok@netwok.org"=
 target=3D"_blank">merwok@netwok.org</a>&gt;<br>
+Co-authored-by: blurb-it[bot] &lt;43283697+blurb-it[bot]@<a href=3D"http:=
//users.noreply.github.com" rel=3D"noreferrer" target=3D"_blank">users.nore=
ply.github.com</a>&gt;<br>
+Co-authored-by: Ken Jin &lt;<a href=3D"mailto:28750310%2BFidget-Spinner@u=
sers.noreply.github.com" target=3D"_blank">28750310+Fidget-Spinner@users.no=
reply.github.com</a>&gt;<br>
+Co-authored-by: =C3=89ric Araujo &lt;<a href=3D"mailto:merwok@netwok.org"=
 target=3D"_blank">merwok@netwok.org</a>&gt;.<br>
+(cherry picked from commit fcbe0cb04d35189401c0c880ebfb4311e952d776)<br>
+<br>
+Co-authored-by: Adam Goldschmidt &lt;<a href=3D"mailto:adamgold7@gmail.co=
m" target=3D"_blank">adamgold7@gmail.com</a>&gt;<br>
+<br>
+* Update correct version information.<br>
+<br>
+* fix docs and make logic clearer<br>
+<br>
+Co-authored-by: Adam Goldschmidt &lt;<a href=3D"mailto:adamgold7@gmail.co=
m" target=3D"_blank">adamgold7@gmail.com</a>&gt;<br>
+Co-authored-by: Fidget-Spinner &lt;<a href=3D"mailto:28750310%2BFidget-Sp=
inner@users.noreply.github.com" target=3D"_blank">28750310+Fidget-Spinner@u=
sers.noreply.github.com</a>&gt;<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/python/cpython/c=
ommit/e3110c3cfbb7daa690d54d0eff6c264c870a71bf" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/python/cpython/commit/e3110c3cfbb7daa690d54=
d0eff6c264c870a71bf</a>]<br>
+CVE: CVE-2020-23336<br>
+Signed-off-by: Chee Yang Lee &lt;<a href=3D"mailto:chee.yang.lee@intel.co=
m" target=3D"_blank">chee.yang.lee@intel.com</a>&gt;<br>
+<br>
+---<br>
+ Doc/library/cgi.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 11 ++-<br>
+ Doc/library/urllib.parse.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 22 +++++-<br>
+ Doc/whatsnew/3.6.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 13 ++++<br>
+ Doc/whatsnew/3.7.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 13 ++++<br>
+ Lib/cgi.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 23 ++++--=
-<br>
+ Lib/test/test_cgi.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 29 ++++++--<br>
+ Lib/test/test_urlparse.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 68 +++++++++++++------<br>
+ Lib/urllib/parse.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 19 ++++--<br>
+ .../2021-02-14-15-59-16.bpo-42967.YApqDS.rst=C2=A0 |=C2=A0 1 +<br>
+ 9 files changed, 153 insertions(+), 46 deletions(-)<br>
+ create mode 100644 Misc/NEWS.d/next/Security/2021-02-14-15-59-16.bpo-429=
67.YApqDS.rst<br>
+<br>
+diff --git a/Doc/library/cgi.rst b/Doc/library/cgi.rst<br>
+index 4048592..880074b 100644<br>
+--- a/Doc/library/cgi.rst<br>
++++ b/Doc/library/cgi.rst<br>
+@@ -277,14 +277,16 @@ These are useful if you want more control, or if yo=
u want to employ some of the<br>
+ algorithms implemented in this module in other circumstances.<br>
+ <br>
+ <br>
+-.. function:: parse(fp=3DNone, environ=3Dos.environ, keep_blank_values=
=3DFalse, strict_parsing=3DFalse)<br>
++.. function:: parse(fp=3DNone, environ=3Dos.environ, keep_blank_values=
=3DFalse, strict_parsing=3DFalse, separator=3D&quot;&amp;&quot;)<br>
+ <br>
+=C2=A0 =C2=A0 Parse a query in the environment or from a file (the file d=
efaults to<br>
+-=C2=A0 =C2=A0``sys.stdin``).=C2=A0 The *keep_blank_values* and *strict_p=
arsing* parameters are<br>
++=C2=A0 =C2=A0``sys.stdin``).=C2=A0 The *keep_blank_values*, *strict_pars=
ing* and *separator* parameters are<br>
+=C2=A0 =C2=A0 passed to :func:`urllib.parse.parse_qs` unchanged.<br>
+ <br>
++=C2=A0 =C2=A0.. versionchanged:: 3.8.8<br>
++=C2=A0 =C2=A0 =C2=A0 Added the *separator* parameter.<br>
+ <br>
+-.. function:: parse_multipart(fp, pdict, encoding=3D&quot;utf-8&quot;, e=
rrors=3D&quot;replace&quot;)<br>
++.. function:: parse_multipart(fp, pdict, encoding=3D&quot;utf-8&quot;, e=
rrors=3D&quot;replace&quot;, separator=3D&quot;&amp;&quot;)<br>
+ <br>
+=C2=A0 =C2=A0 Parse input of type :mimetype:`multipart/form-data` (for=C2=
=
=A0 file uploads).<br>
+=C2=A0 =C2=A0 Arguments are *fp* for the input file, *pdict* for a dictio=
nary containing<br>
+@@ -303,6 +305,9 @@ algorithms implemented in this module in other circum=
stances.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Added the *encoding* and *errors* parameters.=
=C2=A0 For non-file fields, the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0value is now a list of strings, not bytes.<br>
+ <br>
++=C2=A0 =C2=A0.. versionchanged:: 3.8.8<br>
++=C2=A0 =C2=A0 =C2=A0 Added the *separator* parameter.<br>
++<br>
+ <br>
+ .. function:: parse_header(string)<br>
+ <br>
+diff --git a/Doc/library/urllib.parse.rst b/Doc/library/urllib.parse.rst<=
br>
+index 52f98ef..45ca03a 100644<br>
+--- a/Doc/library/urllib.parse.rst<br>
++++ b/Doc/library/urllib.parse.rst<br>
+@@ -165,7 +165,7 @@ or on combining URL components into a URL string.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0now raise :exc:`ValueError`.<br>
+ <br>
+ <br>
+-.. function:: parse_qs(qs, keep_blank_values=3DFalse, strict_parsing=3DF=
alse, encoding=3D&#39;utf-8&#39;, errors=3D&#39;replace&#39;, max_num_field=
s=3DNone)<br>
++.. function:: parse_qs(qs, keep_blank_values=3DFalse, strict_parsing=3DF=
alse, encoding=3D&#39;utf-8&#39;, errors=3D&#39;replace&#39;, max_num_field=
s=3DNone, separator=3D&#39;&amp;&#39;)<br>
+ <br>
+=C2=A0 =C2=A0 Parse a query string given as a string argument (data of ty=
pe<br>
+=C2=A0 =C2=A0 :mimetype:`application/x-www-form-urlencoded`).=C2=A0 Data =
are returned as a<br>
+@@ -190,6 +190,9 @@ or on combining URL components into a URL string.<br>
+=C2=A0 =C2=A0 read. If set, then throws a :exc:`ValueError` if there are =
more than<br>
+=C2=A0 =C2=A0 *max_num_fields* fields read.<br>
+ <br>
++=C2=A0 =C2=A0The optional argument *separator* is the symbol to use for =
separating the<br>
++=C2=A0 =C2=A0query arguments. It defaults to ``&amp;``.<br>
++<br>
+=C2=A0 =C2=A0 Use the :func:`urllib.parse.urlencode` function (with the `=
`doseq``<br>
+=C2=A0 =C2=A0 parameter set to ``True``) to convert such dictionaries int=
o query<br>
+=C2=A0 =C2=A0 strings.<br>
+@@ -201,8 +204,14 @@ or on combining URL components into a URL string.<br=
>
+=C2=A0 =C2=A0 .. versionchanged:: 3.8<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Added *max_num_fields* parameter.<br>
+ <br>
++=C2=A0 =C2=A0.. versionchanged:: 3.8.8<br>
++=C2=A0 =C2=A0 =C2=A0 Added *separator* parameter with the default value =
of ``&amp;``. Python<br>
++=C2=A0 =C2=A0 =C2=A0 versions earlier than Python 3.8.8 allowed using bo=
th ``;`` and ``&amp;`` as<br>
++=C2=A0 =C2=A0 =C2=A0 query parameter separator. This has been changed to=
 allow only a single<br>
++=C2=A0 =C2=A0 =C2=A0 separator key, with ``&amp;`` as the default separa=
tor.<br>
++<br>
+ <br>
+-.. function:: parse_qsl(qs, keep_blank_values=3DFalse, strict_parsing=3D=
False, encoding=3D&#39;utf-8&#39;, errors=3D&#39;replace&#39;, max_num_fiel=
ds=3DNone)<br>
++.. function:: parse_qsl(qs, keep_blank_values=3DFalse, strict_parsing=3D=
False, encoding=3D&#39;utf-8&#39;, errors=3D&#39;replace&#39;, max_num_fiel=
ds=3DNone, separator=3D&#39;&amp;&#39;)<br>
+ <br>
+=C2=A0 =C2=A0 Parse a query string given as a string argument (data of ty=
pe<br>
+=C2=A0 =C2=A0 :mimetype:`application/x-www-form-urlencoded`).=C2=A0 Data =
are returned as a list of<br>
+@@ -226,6 +235,9 @@ or on combining URL components into a URL string.<br>
+=C2=A0 =C2=A0 read. If set, then throws a :exc:`ValueError` if there are =
more than<br>
+=C2=A0 =C2=A0 *max_num_fields* fields read.<br>
+ <br>
++=C2=A0 =C2=A0The optional argument *separator* is the symbol to use for =
separating the<br>
++=C2=A0 =C2=A0query arguments. It defaults to ``&amp;``.<br>
++<br>
+=C2=A0 =C2=A0 Use the :func:`urllib.parse.urlencode` function to convert =
such lists of pairs into<br>
+=C2=A0 =C2=A0 query strings.<br>
+ <br>
+@@ -235,6 +247,12 @@ or on combining URL components into a URL string.<br=
>
+=C2=A0 =C2=A0 .. versionchanged:: 3.8<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Added *max_num_fields* parameter.<br>
+ <br>
++=C2=A0 =C2=A0.. versionchanged:: 3.8.8<br>
++=C2=A0 =C2=A0 =C2=A0 Added *separator* parameter with the default value =
of ``&amp;``. Python<br>
++=C2=A0 =C2=A0 =C2=A0 versions earlier than Python 3.8.8 allowed using bo=
th ``;`` and ``&amp;`` as<br>
++=C2=A0 =C2=A0 =C2=A0 query parameter separator. This has been changed to=
 allow only a single<br>
++=C2=A0 =C2=A0 =C2=A0 separator key, with ``&amp;`` as the default separa=
tor.<br>
++<br>
+ <br>
+ .. function:: urlunparse(parts)<br>
+ <br>
+diff --git a/Doc/whatsnew/3.6.rst b/Doc/whatsnew/3.6.rst<br>
+index 04c1f7e..4409a3a 100644<br>
+--- a/Doc/whatsnew/3.6.rst<br>
++++ b/Doc/whatsnew/3.6.rst<br>
+@@ -2443,3 +2443,16 @@ because of the behavior of the socket option ``SO_=
REUSEADDR`` in UDP. For more<br>
+ details, see the documentation for ``loop.create_datagram_endpoint()``.<=
br>
+ (Contributed by Kyle Stanley, Antoine Pitrou, and Yury Selivanov in<br>
+ :issue:`37228`.)<br>
++<br>
++Notable changes in Python 3.6.13<br>
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=
=3D=3D=3D=3D=3D=3D=3D=3D<br>
++<br>
++Earlier Python versions allowed using both ``;`` and ``&amp;`` as<br>
++query parameter separators in :func:`urllib.parse.parse_qs` and<br>
++:func:`urllib.parse.parse_qsl`.=C2=A0 Due to security concerns, and to c=
onform with<br>
++newer W3C recommendations, this has been changed to allow only a single<=
br>
++separator key, with ``&amp;`` as the default.=C2=A0 This change also aff=
ects<br>
++:func:`cgi.parse` and :func:`cgi.parse_multipart` as they use the affect=
ed<br>
++functions internally. For more details, please see their respective<br>
++documentation.<br>
++(Contributed by Adam Goldschmidt, Senthil Kumaran and Ken Jin in :issue:=
`42967`.)<br>
+diff --git a/Doc/whatsnew/3.7.rst b/Doc/whatsnew/3.7.rst<br>
+index b9b5021..8f47a9f 100644<br>
+--- a/Doc/whatsnew/3.7.rst<br>
++++ b/Doc/whatsnew/3.7.rst<br>
+@@ -2556,3 +2556,16 @@ because of the behavior of the socket option ``SO_=
REUSEADDR`` in UDP. For more<br>
+ details, see the documentation for ``loop.create_datagram_endpoint()``.<=
br>
+ (Contributed by Kyle Stanley, Antoine Pitrou, and Yury Selivanov in<br>
+ :issue:`37228`.)<br>
++<br>
++Notable changes in Python 3.7.10<br>
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=
=3D=3D=3D=3D=3D=3D=3D=3D<br>
++<br>
++Earlier Python versions allowed using both ``;`` and ``&amp;`` as<br>
++query parameter separators in :func:`urllib.parse.parse_qs` and<br>
++:func:`urllib.parse.parse_qsl`.=C2=A0 Due to security concerns, and to c=
onform with<br>
++newer W3C recommendations, this has been changed to allow only a single<=
br>
++separator key, with ``&amp;`` as the default.=C2=A0 This change also aff=
ects<br>
++:func:`cgi.parse` and :func:`cgi.parse_multipart` as they use the affect=
ed<br>
++functions internally. For more details, please see their respective<br>
++documentation.<br>
++(Contributed by Adam Goldschmidt, Senthil Kumaran and Ken Jin in :issue:=
`42967`.)<br>
+diff --git a/Lib/cgi.py b/Lib/cgi.py<br>
+index 5ace46a..13255a9 100755<br>
+--- a/Lib/cgi.py<br>
++++ b/Lib/cgi.py<br>
+@@ -106,7 +106,8 @@ log =3D initlog=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0# The current logging function<br>
+ # 0 =3D=3D&gt; unlimited input<br>
+ maxlen =3D 0<br>
+ <br>
+-def parse(fp=3DNone, environ=3Dos.environ, keep_blank_values=3D0, strict=
_parsing=3D0):<br>
++def parse(fp=3DNone, environ=3Dos.environ, keep_blank_values=3D0,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 strict_parsing=3D0, separator=3D&#39;=
&amp;&#39;):<br>
+=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;Parse a query in the environment or=
 from a file (default stdin)<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Arguments, all optional:<br>
+@@ -125,6 +126,9 @@ def parse(fp=3DNone, environ=3Dos.environ, keep_blank=
_values=3D0, strict_parsing=3D0):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strict_parsing: flag indicating what to=
 do with parsing errors.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0If false (the default), e=
rrors are silently ignored.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0If true, errors raise a V=
alueError exception.<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 separator: str. The symbol to use for separa=
ting the query arguments.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Defaults to &amp;.<br>
+=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0if fp is None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fp =3D sys.stdin<br>
+@@ -145,7 +149,7 @@ def parse(fp=3DNone, environ=3Dos.environ, keep_blank=
_values=3D0, strict_parsing=3D0):<br>
+=C2=A0 =C2=A0 =C2=A0if environ[&#39;REQUEST_METHOD&#39;] =3D=3D &#39;POST=
&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctype, pdict =3D parse_header(environ[&=
#39;CONTENT_TYPE&#39;])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ctype =3D=3D &#39;multipart/form-dat=
a&#39;:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return parse_multipart(fp, pdi=
ct)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return parse_multipart(fp, pdi=
ct, separator=3Dseparator)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif ctype =3D=3D &#39;application/x-ww=
w-form-urlencoded&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clength =3D int(environ[&=
#39;CONTENT_LENGTH&#39;])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if maxlen and clength &gt=
; maxlen:<br>
+@@ -169,10 +173,10 @@ def parse(fp=3DNone, environ=3Dos.environ, keep_bla=
nk_values=3D0, strict_parsing=3D0):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qs =3D &quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0environ[&#39;QUERY_STRING&#39;] =3D qs=
=C2=A0 =C2=A0 # XXX Shouldn&#39;t, really<br>
+=C2=A0 =C2=A0 =C2=A0return urllib.parse.parse_qs(qs, keep_blank_values, s=
trict_parsing,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0encoding=3Dencoding)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0encoding=3Dencoding, separ=
ator=3Dseparator)<br>
+ <br>
+ <br>
+-def parse_multipart(fp, pdict, encoding=3D&quot;utf-8&quot;, errors=3D&q=
uot;replace&quot;):<br>
++def parse_multipart(fp, pdict, encoding=3D&quot;utf-8&quot;, errors=3D&q=
uot;replace&quot;, separator=3D&#39;&amp;&#39;):<br>
+=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;Parse multipart input.<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0Arguments:<br>
+@@ -193,7 +197,7 @@ def parse_multipart(fp, pdict, encoding=3D&quot;utf-8=
&quot;, errors=3D&quot;replace&quot;):<br>
+=C2=A0 =C2=A0 =C2=A0headers.set_type(ctype)<br>
+=C2=A0 =C2=A0 =C2=A0headers[&#39;Content-Length&#39;] =3D pdict[&#39;CONT=
ENT-LENGTH&#39;]<br>
+=C2=A0 =C2=A0 =C2=A0fs =3D FieldStorage(fp, headers=3Dheaders, encoding=
=3Dencoding, errors=3Derrors,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 environ=3D{&#39;REQUEST_METHOD&#39;: &#39;PO=
ST&#39;})<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 environ=3D{&#39;REQUEST_METHOD&#39;: &#39;PO=
ST&#39;}, separator=3Dseparator)<br>
+=C2=A0 =C2=A0 =C2=A0return {k: fs.getlist(k) for k in fs}<br>
+ <br>
+ def _parseparam(s):<br>
+@@ -303,7 +307,7 @@ class FieldStorage:<br>
+=C2=A0 =C2=A0 =C2=A0def __init__(self, fp=3DNone, headers=3DNone, outerbo=
undary=3Db&#39;&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 environ=3D=
os.environ, keep_blank_values=3D0, strict_parsing=3D0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 limit=3DNo=
ne, encoding=3D&#39;utf-8&#39;, errors=3D&#39;replace&#39;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0max_num_fi=
elds=3DNone):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0max_num_fi=
elds=3DNone, separator=3D&#39;&amp;&#39;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;Constructor.=C2=A0 Re=
ad multipart/* until last part.<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Arguments, all optional:<br>
+@@ -351,6 +355,7 @@ class FieldStorage:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.keep_blank_values =3D keep_blank_v=
alues<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.strict_parsing =3D strict_parsing<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.max_num_fields =3D max_num_fields<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.separator =3D separator<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if &#39;REQUEST_METHOD&#39; in environ:=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0method =3D environ[&#39;R=
EQUEST_METHOD&#39;].upper()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.qs_on_post =3D None<br>
+@@ -577,7 +582,7 @@ class FieldStorage:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0query =3D urllib.parse.parse_qsl(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qs, self.keep_blank_value=
s, self.strict_parsing,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0encoding=3Dself.encoding,=
 errors=3Dself.errors,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 max_num_fields=3Dself.max_num_=
fields)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 max_num_fields=3Dself.max_num_=
fields, separator=3Dself.separator)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.list =3D [MiniFieldStorage(key, va=
lue) for key, value in query]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.skip_lines()<br>
+ <br>
+@@ -593,7 +598,7 @@ class FieldStorage:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0query =3D urllib.parse.pa=
rse_qsl(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.qs_on_=
post, self.keep_blank_values, self.strict_parsing,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0encoding=3D=
self.encoding, errors=3Dself.errors,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 max_num_fields=
=3Dself.max_num_fields)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 max_num_fields=
=3Dself.max_num_fields, separator=3Dself.separator)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.list.extend(MiniFiel=
dStorage(key, value) for key, value in query)<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0klass =3D self.FieldStorageClass or sel=
f.__class__<br>
+@@ -637,7 +642,7 @@ class FieldStorage:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else self.l=
imit - self.bytes_read<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0part =3D klass(self.fp, h=
eaders, ib, environ, keep_blank_values,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 strict_parsing, limit,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0self.encoding, self.errors, max_num_fields)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0self.encoding, self.errors, max_num_fields, self.separ=
ator)<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if max_num_fields is not =
None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0max_num_fie=
lds -=3D 1<br>
+diff --git a/Lib/test/test_cgi.py b/Lib/test/test_cgi.py<br>
+index ab86771..bda03ee 100644<br>
+--- a/Lib/test/test_cgi.py<br>
++++ b/Lib/test/test_cgi.py<br>
+@@ -53,12 +53,9 @@ parse_strict_test_cases =3D [<br>
+=C2=A0 =C2=A0 =C2=A0(&quot;&quot;, ValueError(&quot;bad query field: &#39=
;&#39;&quot;)),<br>
+=C2=A0 =C2=A0 =C2=A0(&quot;&amp;&quot;, ValueError(&quot;bad query field:=
 &#39;&#39;&quot;)),<br>
+=C2=A0 =C2=A0 =C2=A0(&quot;&amp;&amp;&quot;, ValueError(&quot;bad query f=
ield: &#39;&#39;&quot;)),<br>
+-=C2=A0 =C2=A0 (&quot;;&quot;, ValueError(&quot;bad query field: &#39;&#3=
9;&quot;)),<br>
+-=C2=A0 =C2=A0 (&quot;;&amp;;&quot;, ValueError(&quot;bad query field: &#=
39;&#39;&quot;)),<br>
+=C2=A0 =C2=A0 =C2=A0# Should the next few really be valid?<br>
+=C2=A0 =C2=A0 =C2=A0(&quot;=3D&quot;, {}),<br>
+=C2=A0 =C2=A0 =C2=A0(&quot;=3D&amp;=3D&quot;, {}),<br>
+-=C2=A0 =C2=A0 (&quot;=3D;=3D&quot;, {}),<br>
+=C2=A0 =C2=A0 =C2=A0# This rest seem to make sense<br>
+=C2=A0 =C2=A0 =C2=A0(&quot;=3Da&quot;, {&#39;&#39;: [&#39;a&#39;]}),<br>
+=C2=A0 =C2=A0 =C2=A0(&quot;&amp;=3Da&quot;, ValueError(&quot;bad query fi=
eld: &#39;&#39;&quot;)),<br>
+@@ -73,8 +70,6 @@ parse_strict_test_cases =3D [<br>
+=C2=A0 =C2=A0 =C2=A0(&quot;a=3Da+b&amp;b=3Db+c&quot;, {&#39;a&#39;: [&#39=
;a b&#39;], &#39;b&#39;: [&#39;b c&#39;]}),<br>
+=C2=A0 =C2=A0 =C2=A0(&quot;a=3Da+b&amp;a=3Db+a&quot;, {&#39;a&#39;: [&#39=
;a b&#39;, &#39;b a&#39;]}),<br>
+=C2=A0 =C2=A0 =C2=A0(&quot;x=3D1&amp;y=3D2.0&amp;z=3D2-3.%2b0&quot;, {&#3=
9;x&#39;: [&#39;1&#39;], &#39;y&#39;: [&#39;2.0&#39;], &#39;z&#39;: [&#39;2=
-3.+0&#39;]}),<br>
+-=C2=A0 =C2=A0 (&quot;x=3D1;y=3D2.0&amp;z=3D2-3.%2b0&quot;, {&#39;x&#39;:=
 [&#39;1&#39;], &#39;y&#39;: [&#39;2.0&#39;], &#39;z&#39;: [&#39;2-3.+0&#39=
;]}),<br>
+-=C2=A0 =C2=A0 (&quot;x=3D1;y=3D2.0;z=3D2-3.%2b0&quot;, {&#39;x&#39;: [&#=
39;1&#39;], &#39;y&#39;: [&#39;2.0&#39;], &#39;z&#39;: [&#39;2-3.+0&#39;]})=
,<br>
+=C2=A0 =C2=A0 =C2=A0(&quot;Hbc5161168c542333633315dee1182227:key_store_se=
qid=3D400006&amp;cuyer=3Dr&amp;view=3Dbustomer&amp;order_id=3D0bb2e24863883=
3d48cb7fed300000f1b&amp;expire=3D964546263&amp;lobale=3Den-US&amp;kid=3D130=
003.300038&amp;ss=3Denv&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 {&#39;Hbc5161168c542333633315dee1182227:key_store_se=
qid&#39;: [&#39;400006&#39;],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;cuyer&#39;: [&#39;r&#39;],<br>
+@@ -187,6 +182,30 @@ Content-Length: 3<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0self.assertEqual(fs.getvalue(key), expect_val[0])<br>
+ <br>
++=C2=A0 =C2=A0 def test_separator(self):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 parse_semicolon =3D [<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (&quot;x=3D1;y=3D2.0&quot;, {&=
#39;x&#39;: [&#39;1&#39;], &#39;y&#39;: [&#39;2.0&#39;]}),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (&quot;x=3D1;y=3D2.0;z=3D2-3.%=
2b0&quot;, {&#39;x&#39;: [&#39;1&#39;], &#39;y&#39;: [&#39;2.0&#39;], &#39;=
z&#39;: [&#39;2-3.+0&#39;]}),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (&quot;;&quot;, ValueError(&qu=
ot;bad query field: &#39;&#39;&quot;)),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (&quot;;;&quot;, ValueError(&q=
uot;bad query field: &#39;&#39;&quot;)),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (&quot;=3D;a&quot;, ValueError=
(&quot;bad query field: &#39;a&#39;&quot;)),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (&quot;;b=3Da&quot;, ValueErro=
r(&quot;bad query field: &#39;&#39;&quot;)),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (&quot;b;=3Da&quot;, ValueErro=
r(&quot;bad query field: &#39;b&#39;&quot;)),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (&quot;a=3Da+b;b=3Db+c&quot;, =
{&#39;a&#39;: [&#39;a b&#39;], &#39;b&#39;: [&#39;b c&#39;]}),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (&quot;a=3Da+b;a=3Db+a&quot;, =
{&#39;a&#39;: [&#39;a b&#39;, &#39;b a&#39;]}),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ]<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 for orig, expect in parse_semicolon:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env =3D {&#39;QUERY_STRING&#39=
;: orig}<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fs =3D cgi.FieldStorage(separa=
tor=3D&#39;;&#39;, environ=3Denv)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if isinstance(expect, dict):<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for key in expec=
t.keys():<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ex=
pect_val =3D expect[key]<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 se=
lf.assertIn(key, fs)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if=
 len(expect_val) &gt; 1:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 self.assertEqual(fs.getvalue(key), expect_val)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 el=
se:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 self.assertEqual(fs.getvalue(key), expect_val[0])<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0def test_log(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cgi.log(&quot;Testing&quot;)<br>
+ <br>
+diff --git a/Lib/test/test_urlparse.py b/Lib/test/test_urlparse.py<br>
+index 4ae6ed3..90c8d69 100644<br>
+--- a/Lib/test/test_urlparse.py<br>
++++ b/Lib/test/test_urlparse.py<br>
+@@ -32,16 +32,10 @@ parse_qsl_test_cases =3D [<br>
+=C2=A0 =C2=A0 =C2=A0(b&quot;&amp;a=3Db&quot;, [(b&#39;a&#39;, b&#39;b&#39=
;)]),<br>
+=C2=A0 =C2=A0 =C2=A0(b&quot;a=3Da+b&amp;b=3Db+c&quot;, [(b&#39;a&#39;, b&=
#39;a b&#39;), (b&#39;b&#39;, b&#39;b c&#39;)]),<br>
+=C2=A0 =C2=A0 =C2=A0(b&quot;a=3D1&amp;a=3D2&quot;, [(b&#39;a&#39;, b&#39;=
1&#39;), (b&#39;a&#39;, b&#39;2&#39;)]),<br>
+-=C2=A0 =C2=A0 (&quot;;&quot;, []),<br>
+-=C2=A0 =C2=A0 (&quot;;;&quot;, []),<br>
+-=C2=A0 =C2=A0 (&quot;;a=3Db&quot;, [(&#39;a&#39;, &#39;b&#39;)]),<br>
+-=C2=A0 =C2=A0 (&quot;a=3Da+b;b=3Db+c&quot;, [(&#39;a&#39;, &#39;a b&#39;=
), (&#39;b&#39;, &#39;b c&#39;)]),<br>
+-=C2=A0 =C2=A0 (&quot;a=3D1;a=3D2&quot;, [(&#39;a&#39;, &#39;1&#39;), (&#=
39;a&#39;, &#39;2&#39;)]),<br>
+-=C2=A0 =C2=A0 (b&quot;;&quot;, []),<br>
+-=C2=A0 =C2=A0 (b&quot;;;&quot;, []),<br>
+-=C2=A0 =C2=A0 (b&quot;;a=3Db&quot;, [(b&#39;a&#39;, b&#39;b&#39;)]),<br>
+-=C2=A0 =C2=A0 (b&quot;a=3Da+b;b=3Db+c&quot;, [(b&#39;a&#39;, b&#39;a b&#=
39;), (b&#39;b&#39;, b&#39;b c&#39;)]),<br>
+-=C2=A0 =C2=A0 (b&quot;a=3D1;a=3D2&quot;, [(b&#39;a&#39;, b&#39;1&#39;), =
(b&#39;a&#39;, b&#39;2&#39;)]),<br>
++=C2=A0 =C2=A0 (&quot;;a=3Db&quot;, [(&#39;;a&#39;, &#39;b&#39;)]),<br>
++=C2=A0 =C2=A0 (&quot;a=3Da+b;b=3Db+c&quot;, [(&#39;a&#39;, &#39;a b;b=3D=
b c&#39;)]),<br>
++=C2=A0 =C2=A0 (b&quot;;a=3Db&quot;, [(b&#39;;a&#39;, b&#39;b&#39;)]),<br=
>
++=C2=A0 =C2=A0 (b&quot;a=3Da+b;b=3Db+c&quot;, [(b&#39;a&#39;, b&#39;a b;b=
=
=3Db c&#39;)]),<br>
+ ]<br>
+ <br>
+ # Each parse_qs testcase is a two-tuple that contains<br>
+@@ -68,16 +62,10 @@ parse_qs_test_cases =3D [<br>
+=C2=A0 =C2=A0 =C2=A0(b&quot;&amp;a=3Db&quot;, {b&#39;a&#39;: [b&#39;b&#39=
;]}),<br>
+=C2=A0 =C2=A0 =C2=A0(b&quot;a=3Da+b&amp;b=3Db+c&quot;, {b&#39;a&#39;: [b&=
#39;a b&#39;], b&#39;b&#39;: [b&#39;b c&#39;]}),<br>
+=C2=A0 =C2=A0 =C2=A0(b&quot;a=3D1&amp;a=3D2&quot;, {b&#39;a&#39;: [b&#39;=
1&#39;, b&#39;2&#39;]}),<br>
+-=C2=A0 =C2=A0 (&quot;;&quot;, {}),<br>
+-=C2=A0 =C2=A0 (&quot;;;&quot;, {}),<br>
+-=C2=A0 =C2=A0 (&quot;;a=3Db&quot;, {&#39;a&#39;: [&#39;b&#39;]}),<br>
+-=C2=A0 =C2=A0 (&quot;a=3Da+b;b=3Db+c&quot;, {&#39;a&#39;: [&#39;a b&#39;=
], &#39;b&#39;: [&#39;b c&#39;]}),<br>
+-=C2=A0 =C2=A0 (&quot;a=3D1;a=3D2&quot;, {&#39;a&#39;: [&#39;1&#39;, &#39=
;2&#39;]}),<br>
+-=C2=A0 =C2=A0 (b&quot;;&quot;, {}),<br>
+-=C2=A0 =C2=A0 (b&quot;;;&quot;, {}),<br>
+-=C2=A0 =C2=A0 (b&quot;;a=3Db&quot;, {b&#39;a&#39;: [b&#39;b&#39;]}),<br>
+-=C2=A0 =C2=A0 (b&quot;a=3Da+b;b=3Db+c&quot;, {b&#39;a&#39;: [b&#39;a b&#=
39;], b&#39;b&#39;: [b&#39;b c&#39;]}),<br>
+-=C2=A0 =C2=A0 (b&quot;a=3D1;a=3D2&quot;, {b&#39;a&#39;: [b&#39;1&#39;, b=
&#39;2&#39;]}),<br>
++=C2=A0 =C2=A0 (&quot;;a=3Db&quot;, {&#39;;a&#39;: [&#39;b&#39;]}),<br>
++=C2=A0 =C2=A0 (&quot;a=3Da+b;b=3Db+c&quot;, {&#39;a&#39;: [&#39;a b;b=3D=
b c&#39;]}),<br>
++=C2=A0 =C2=A0 (b&quot;;a=3Db&quot;, {b&#39;;a&#39;: [b&#39;b&#39;]}),<br=
>
++=C2=A0 =C2=A0 (b&quot;a=3Da+b;b=3Db+c&quot;, {b&#39;a&#39;:[ b&#39;a b;b=
=
=3Db c&#39;]}),<br>
+ ]<br>
+ <br>
+ class UrlParseTestCase(unittest.TestCase):<br>
+@@ -884,10 +872,46 @@ class UrlParseTestCase(unittest.TestCase):<br>
+=C2=A0 =C2=A0 =C2=A0def test_parse_qsl_max_num_fields(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with self.assertRaises(ValueError):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0urllib.parse.parse_qs(&#3=
9;&amp;&#39;.join([&#39;a=3Da&#39;]*11), max_num_fields=3D10)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 with self.assertRaises(ValueError):<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 urllib.parse.parse_qs(&#39;;&#=
39;.join([&#39;a=3Da&#39;]*11), max_num_fields=3D10)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0urllib.parse.parse_qs(&#39;&amp;&#39;.j=
oin([&#39;a=3Da&#39;]*10), max_num_fields=3D10)<br>
+ <br>
++=C2=A0 =C2=A0 def test_parse_qs_separator(self):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 parse_qs_semicolon_cases =3D [<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (&quot;;&quot;, {}),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (&quot;;;&quot;, {}),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (&quot;;a=3Db&quot;, {&#39;a&#=
39;: [&#39;b&#39;]}),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (&quot;a=3Da+b;b=3Db+c&quot;, =
{&#39;a&#39;: [&#39;a b&#39;], &#39;b&#39;: [&#39;b c&#39;]}),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (&quot;a=3D1;a=3D2&quot;, {&#3=
9;a&#39;: [&#39;1&#39;, &#39;2&#39;]}),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (b&quot;;&quot;, {}),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (b&quot;;;&quot;, {}),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (b&quot;;a=3Db&quot;, {b&#39;a=
&#39;: [b&#39;b&#39;]}),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (b&quot;a=3Da+b;b=3Db+c&quot;,=
 {b&#39;a&#39;: [b&#39;a b&#39;], b&#39;b&#39;: [b&#39;b c&#39;]}),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (b&quot;a=3D1;a=3D2&quot;, {b&=
#39;a&#39;: [b&#39;1&#39;, b&#39;2&#39;]}),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ]<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 for orig, expect in parse_qs_semicolon_cases=
:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with self.subTest(f&quot;Origi=
nal: {orig!r}, Expected: {expect!r}&quot;):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D urlli=
b.parse.parse_qs(orig, separator=3D&#39;;&#39;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual=
(result, expect, &quot;Error parsing %r&quot; % orig)<br>
++<br>
++<br>
++=C2=A0 =C2=A0 def test_parse_qsl_separator(self):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 parse_qsl_semicolon_cases =3D [<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (&quot;;&quot;, []),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (&quot;;;&quot;, []),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (&quot;;a=3Db&quot;, [(&#39;a&=
#39;, &#39;b&#39;)]),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (&quot;a=3Da+b;b=3Db+c&quot;, =
[(&#39;a&#39;, &#39;a b&#39;), (&#39;b&#39;, &#39;b c&#39;)]),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (&quot;a=3D1;a=3D2&quot;, [(&#=
39;a&#39;, &#39;1&#39;), (&#39;a&#39;, &#39;2&#39;)]),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (b&quot;;&quot;, []),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (b&quot;;;&quot;, []),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (b&quot;;a=3Db&quot;, [(b&#39;=
a&#39;, b&#39;b&#39;)]),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (b&quot;a=3Da+b;b=3Db+c&quot;,=
 [(b&#39;a&#39;, b&#39;a b&#39;), (b&#39;b&#39;, b&#39;b c&#39;)]),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (b&quot;a=3D1;a=3D2&quot;, [(b=
&#39;a&#39;, b&#39;1&#39;), (b&#39;a&#39;, b&#39;2&#39;)]),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ]<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 for orig, expect in parse_qsl_semicolon_case=
s:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with self.subTest(f&quot;Origi=
nal: {orig!r}, Expected: {expect!r}&quot;):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D urlli=
b.parse.parse_qsl(orig, separator=3D&#39;;&#39;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual=
(result, expect, &quot;Error parsing %r&quot; % orig)<br>
++<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0def test_urlencode_sequences(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Other tests incidentally urlencode th=
ings; test non-covered cases:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Sequence and object values.<br>
+diff --git a/Lib/urllib/parse.py b/Lib/urllib/parse.py<br>
+index e2b6f13..5a3e847 100644<br>
+--- a/Lib/urllib/parse.py<br>
++++ b/Lib/urllib/parse.py<br>
+@@ -648,7 +648,7 @@ def unquote(string, encoding=3D&#39;utf-8&#39;, error=
s=3D&#39;replace&#39;):<br>
+ <br>
+ <br>
+ def parse_qs(qs, keep_blank_values=3DFalse, strict_parsing=3DFalse,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0encoding=3D&#39;utf-8&#3=
9;, errors=3D&#39;replace&#39;, max_num_fields=3DNone):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0encoding=3D&#39;utf-8&#3=
9;, errors=3D&#39;replace&#39;, max_num_fields=3DNone, separator=3D&#39;&am=
p;&#39;):<br>
+=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;Parse a query given as a string arg=
ument.<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Arguments:<br>
+@@ -672,12 +672,15 @@ def parse_qs(qs, keep_blank_values=3DFalse, strict_=
parsing=3DFalse,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0max_num_fields: int. If set, then throw=
s a ValueError if there<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0are more than n fields re=
ad by parse_qsl().<br>
+ <br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 separator: str. The symbol to use for separa=
ting the query arguments.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Defaults to &amp;.<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Returns a dictionary.<br>
+=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0parsed_result =3D {}<br>
+=C2=A0 =C2=A0 =C2=A0pairs =3D parse_qsl(qs, keep_blank_values, strict_par=
sing,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0encoding=3Dencoding, errors=3Derrors,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 max_num_fields=3Dmax_num_fields)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 max_num_fields=3Dmax_num_fields, separator=3Dseparator)<br>
+=C2=A0 =C2=A0 =C2=A0for name, value in pairs:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if name in parsed_result:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0parsed_result[name].appen=
d(value)<br>
+@@ -687,7 +690,7 @@ def parse_qs(qs, keep_blank_values=3DFalse, strict_pa=
rsing=3DFalse,<br>
+ <br>
+ <br>
+ def parse_qsl(qs, keep_blank_values=3DFalse, strict_parsing=3DFalse,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 encoding=3D&#39;utf-8&#=
39;, errors=3D&#39;replace&#39;, max_num_fields=3DNone):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 encoding=3D&#39;utf-8&#=
39;, errors=3D&#39;replace&#39;, max_num_fields=3DNone, separator=3D&#39;&a=
mp;&#39;):<br>
+=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;Parse a query given as a string arg=
ument.<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Arguments:<br>
+@@ -710,19 +713,25 @@ def parse_qsl(qs, keep_blank_values=3DFalse, strict=
_parsing=3DFalse,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0max_num_fields: int. If set, then throw=
s a ValueError<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if there are more than n =
fields read by parse_qsl().<br>
+ <br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 separator: str. The symbol to use for separa=
ting the query arguments.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Defaults to &amp;.<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Returns a list, as G-d intended.<br>
+=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0qs, _coerce_result =3D _coerce_args(qs)<br>
+ <br>
++=C2=A0 =C2=A0 if not separator or (not isinstance(separator, (str, bytes=
))):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise ValueError(&quot;Separator must be of =
type string or bytes.&quot;)<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0# If max_num_fields is defined then check that the nu=
mber of fields<br>
+=C2=A0 =C2=A0 =C2=A0# is less than max_num_fields. This prevents a memory=
 exhaustion DOS<br>
+=C2=A0 =C2=A0 =C2=A0# attack via post bodies with many fields.<br>
+=C2=A0 =C2=A0 =C2=A0if max_num_fields is not None:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 num_fields =3D 1 + qs.count(&#39;&amp;&#39;)=
 + qs.count(&#39;;&#39;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 num_fields =3D 1 + qs.count(separator)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if max_num_fields &lt; num_fields:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise ValueError(&#39;Max=
 number of fields exceeded&#39;)<br>
+ <br>
+-=C2=A0 =C2=A0 pairs =3D [s2 for s1 in qs.split(&#39;&amp;&#39;) for s2 i=
n s1.split(&#39;;&#39;)]<br>
++=C2=A0 =C2=A0 pairs =3D [s1 for s1 in qs.split(separator)]<br>
+=C2=A0 =C2=A0 =C2=A0r =3D []<br>
+=C2=A0 =C2=A0 =C2=A0for name_value in pairs:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not name_value and not strict_parsin=
g:<br>
+diff --git a/Misc/NEWS.d/next/Security/2021-02-14-15-59-16.bpo-42967.YApq=
DS.rst b/Misc/NEWS.d/next/Security/2021-02-14-15-59-16.bpo-42967.YApqDS.rst=
<br>
+new file mode 100644<br>
+index 0000000..f08489b<br>
+--- /dev/null<br>
++++ b/Misc/NEWS.d/next/Security/2021-02-14-15-59-16.bpo-42967.YApqDS.rst<=
br>
+@@ -0,0 +1 @@<br>
++Fix web cache poisoning vulnerability by defaulting the query args separ=
ator to ``&amp;``, and allowing the user to choose a custom separator.<br>
diff --git a/meta/recipes-devtools/python/python3/CVE-2021-23336.patch b/m=
eta/recipes-devtools/python/python3/CVE-2021-23336.patch<br>
new file mode 100644<br>
index 0000000000..2a885b9d37<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/python/python3/CVE-2021-23336.patch<br>
@@ -0,0 +1,530 @@<br>
+From 3ab6f812653e79d008d5eba31dc25d34f3ca7170 Mon Sep 17 00:00:00 2001<br=
>
+From: Senthil Kumaran &lt;<a href=3D"mailto:senthil@uthcode.com" target=
=3D"_blank">senthil@uthcode.com</a>&gt;<br>
+Date: Mon, 15 Feb 2021 10:15:02 -0800<br>
+Subject: [PATCH] bpo-42967: only use &#39;&amp;&#39; as a query string se=
parator<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+ (GH-24297)=C2=A0 (#24529)<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+* bpo-42967: only use &#39;&amp;&#39; as a query string separator (#24297=
)<br>
+<br>
+bpo-42967: [security] Address a web cache-poisoning issue reported in<br>
+urllib.parse.parse_qsl().<br>
+<br>
+urllib.parse will only us &quot;&amp;&quot; as query string separator by =
default<br>
+instead of both &quot;;&quot; and &quot;&amp;&quot; as allowed in earlier=
 versions. An optional<br>
+argument seperator with default value &quot;&amp;&quot; is added to speci=
fy the<br>
+separator.<br>
+<br>
+Co-authored-by: =C3=89ric Araujo &lt;<a href=3D"mailto:merwok@netwok.org"=
 target=3D"_blank">merwok@netwok.org</a>&gt;<br>
+Co-authored-by: blurb-it[bot] &lt;43283697+blurb-it[bot]@<a href=3D"http:=
//users.noreply.github.com" rel=3D"noreferrer" target=3D"_blank">users.nore=
ply.github.com</a>&gt;<br>
+Co-authored-by: Ken Jin &lt;<a href=3D"mailto:28750310%2BFidget-Spinner@u=
sers.noreply.github.com" target=3D"_blank">28750310+Fidget-Spinner@users.no=
reply.github.com</a>&gt;<br>
+Co-authored-by: =C3=89ric Araujo &lt;<a href=3D"mailto:merwok@netwok.org"=
 target=3D"_blank">merwok@netwok.org</a>&gt;<br>
+(cherry picked from commit fcbe0cb04d35189401c0c880ebfb4311e952d776)<br>
+<br>
+* [3.8] bpo-42967: only use &#39;&amp;&#39; as a query string separator (=
GH-24297)<br>
+<br>
+bpo-42967: [security] Address a web cache-poisoning issue reported in url=
lib.parse.parse_qsl().<br>
+<br>
+urllib.parse will only us &quot;&amp;&quot; as query string separator by =
default instead of both &quot;;&quot; and &quot;&amp;&quot; as allowed in e=
arlier versions. An optional argument seperator with default value &quot;&a=
mp;&quot; is added to specify the separator.<br>
+<br>
+Co-authored-by: =C3=89ric Araujo &lt;<a href=3D"mailto:merwok@netwok.org"=
 target=3D"_blank">merwok@netwok.org</a>&gt;<br>
+Co-authored-by: blurb-it[bot] &lt;43283697+blurb-it[bot]@<a href=3D"http:=
//users.noreply.github.com" rel=3D"noreferrer" target=3D"_blank">users.nore=
ply.github.com</a>&gt;<br>
+Co-authored-by: Ken Jin &lt;<a href=3D"mailto:28750310%2BFidget-Spinner@u=
sers.noreply.github.com" target=3D"_blank">28750310+Fidget-Spinner@users.no=
reply.github.com</a>&gt;<br>
+Co-authored-by: =C3=89ric Araujo &lt;<a href=3D"mailto:merwok@netwok.org"=
 target=3D"_blank">merwok@netwok.org</a>&gt;.<br>
+(cherry picked from commit fcbe0cb04d35189401c0c880ebfb4311e952d776)<br>
+<br>
+Co-authored-by: Adam Goldschmidt &lt;<a href=3D"mailto:adamgold7@gmail.co=
m" target=3D"_blank">adamgold7@gmail.com</a>&gt;<br>
+<br>
+* Update correct version information.<br>
+<br>
+* fix docs and make logic clearer<br>
+<br>
+Co-authored-by: Adam Goldschmidt &lt;<a href=3D"mailto:adamgold7@gmail.co=
m" target=3D"_blank">adamgold7@gmail.com</a>&gt;<br>
+Co-authored-by: Fidget-Spinner &lt;<a href=3D"mailto:28750310%2BFidget-Sp=
inner@users.noreply.github.com" target=3D"_blank">28750310+Fidget-Spinner@u=
sers.noreply.github.com</a>&gt;<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/python/cpython/c=
ommit/e3110c3cfbb7daa690d54d0eff6c264c870a71bf" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/python/cpython/commit/e3110c3cfbb7daa690d54=
d0eff6c264c870a71bf</a>]<br>
+CVE: CVE-2020-23336<br>
+Signed-off-by: Chee Yang Lee &lt;<a href=3D"mailto:chee.yang.lee@intel.co=
m" target=3D"_blank">chee.yang.lee@intel.com</a>&gt;<br>
+<br>
+---<br>
+ Doc/library/cgi.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 11 ++-<br>
+ Doc/library/urllib.parse.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 22 +++++-<br>
+ Doc/whatsnew/3.6.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 13 ++++<br>
+ Doc/whatsnew/3.7.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 13 ++++<br>
+ Lib/cgi.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 23 ++++--=
-<br>
+ Lib/test/test_cgi.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 29 ++++++--<br>
+ Lib/test/test_urlparse.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 68 +++++++++++++------<br>
+ Lib/urllib/parse.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 19 ++++--<br>
+ .../2021-02-14-15-59-16.bpo-42967.YApqDS.rst=C2=A0 |=C2=A0 1 +<br>
+ 9 files changed, 153 insertions(+), 46 deletions(-)<br>
+ create mode 100644 Misc/NEWS.d/next/Security/2021-02-14-15-59-16.bpo-429=
67.YApqDS.rst<br>
+<br>
+diff --git a/Doc/library/cgi.rst b/Doc/library/cgi.rst<br>
+index 4048592..880074b 100644<br>
+--- a/Doc/library/cgi.rst<br>
++++ b/Doc/library/cgi.rst<br>
+@@ -277,14 +277,16 @@ These are useful if you want more control, or if yo=
u want to employ some of the<br>
+ algorithms implemented in this module in other circumstances.<br>
+ <br>
+ <br>
+-.. function:: parse(fp=3DNone, environ=3Dos.environ, keep_blank_values=
=3DFalse, strict_parsing=3DFalse)<br>
++.. function:: parse(fp=3DNone, environ=3Dos.environ, keep_blank_values=
=3DFalse, strict_parsing=3DFalse, separator=3D&quot;&amp;&quot;)<br>
+ <br>
+=C2=A0 =C2=A0 Parse a query in the environment or from a file (the file d=
efaults to<br>
+-=C2=A0 =C2=A0``sys.stdin``).=C2=A0 The *keep_blank_values* and *strict_p=
arsing* parameters are<br>
++=C2=A0 =C2=A0``sys.stdin``).=C2=A0 The *keep_blank_values*, *strict_pars=
ing* and *separator* parameters are<br>
+=C2=A0 =C2=A0 passed to :func:`urllib.parse.parse_qs` unchanged.<br>
+ <br>
++=C2=A0 =C2=A0.. versionchanged:: 3.8.8<br>
++=C2=A0 =C2=A0 =C2=A0 Added the *separator* parameter.<br>
+ <br>
+-.. function:: parse_multipart(fp, pdict, encoding=3D&quot;utf-8&quot;, e=
rrors=3D&quot;replace&quot;)<br>
++.. function:: parse_multipart(fp, pdict, encoding=3D&quot;utf-8&quot;, e=
rrors=3D&quot;replace&quot;, separator=3D&quot;&amp;&quot;)<br>
+ <br>
+=C2=A0 =C2=A0 Parse input of type :mimetype:`multipart/form-data` (for=C2=
=
=A0 file uploads).<br>
+=C2=A0 =C2=A0 Arguments are *fp* for the input file, *pdict* for a dictio=
nary containing<br>
+@@ -303,6 +305,9 @@ algorithms implemented in this module in other circum=
stances.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Added the *encoding* and *errors* parameters.=
=C2=A0 For non-file fields, the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0value is now a list of strings, not bytes.<br>
+ <br>
++=C2=A0 =C2=A0.. versionchanged:: 3.8.8<br>
++=C2=A0 =C2=A0 =C2=A0 Added the *separator* parameter.<br>
++<br>
+ <br>
+ .. function:: parse_header(string)<br>
+ <br>
+diff --git a/Doc/library/urllib.parse.rst b/Doc/library/urllib.parse.rst<=
br>
+index 52f98ef..45ca03a 100644<br>
+--- a/Doc/library/urllib.parse.rst<br>
++++ b/Doc/library/urllib.parse.rst<br>
+@@ -165,7 +165,7 @@ or on combining URL components into a URL string.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0now raise :exc:`ValueError`.<br>
+ <br>
+ <br>
+-.. function:: parse_qs(qs, keep_blank_values=3DFalse, strict_parsing=3DF=
alse, encoding=3D&#39;utf-8&#39;, errors=3D&#39;replace&#39;, max_num_field=
s=3DNone)<br>
++.. function:: parse_qs(qs, keep_blank_values=3DFalse, strict_parsing=3DF=
alse, encoding=3D&#39;utf-8&#39;, errors=3D&#39;replace&#39;, max_num_field=
s=3DNone, separator=3D&#39;&amp;&#39;)<br>
+ <br>
+=C2=A0 =C2=A0 Parse a query string given as a string argument (data of ty=
pe<br>
+=C2=A0 =C2=A0 :mimetype:`application/x-www-form-urlencoded`).=C2=A0 Data =
are returned as a<br>
+@@ -190,6 +190,9 @@ or on combining URL components into a URL string.<br>
+=C2=A0 =C2=A0 read. If set, then throws a :exc:`ValueError` if there are =
more than<br>
+=C2=A0 =C2=A0 *max_num_fields* fields read.<br>
+ <br>
++=C2=A0 =C2=A0The optional argument *separator* is the symbol to use for =
separating the<br>
++=C2=A0 =C2=A0query arguments. It defaults to ``&amp;``.<br>
++<br>
+=C2=A0 =C2=A0 Use the :func:`urllib.parse.urlencode` function (with the `=
`doseq``<br>
+=C2=A0 =C2=A0 parameter set to ``True``) to convert such dictionaries int=
o query<br>
+=C2=A0 =C2=A0 strings.<br>
+@@ -201,8 +204,14 @@ or on combining URL components into a URL string.<br=
>
+=C2=A0 =C2=A0 .. versionchanged:: 3.8<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Added *max_num_fields* parameter.<br>
+ <br>
++=C2=A0 =C2=A0.. versionchanged:: 3.8.8<br>
++=C2=A0 =C2=A0 =C2=A0 Added *separator* parameter with the default value =
of ``&amp;``. Python<br>
++=C2=A0 =C2=A0 =C2=A0 versions earlier than Python 3.8.8 allowed using bo=
th ``;`` and ``&amp;`` as<br>
++=C2=A0 =C2=A0 =C2=A0 query parameter separator. This has been changed to=
 allow only a single<br>
++=C2=A0 =C2=A0 =C2=A0 separator key, with ``&amp;`` as the default separa=
tor.<br>
++<br>
+ <br>
+-.. function:: parse_qsl(qs, keep_blank_values=3DFalse, strict_parsing=3D=
False, encoding=3D&#39;utf-8&#39;, errors=3D&#39;replace&#39;, max_num_fiel=
ds=3DNone)<br>
++.. function:: parse_qsl(qs, keep_blank_values=3DFalse, strict_parsing=3D=
False, encoding=3D&#39;utf-8&#39;, errors=3D&#39;replace&#39;, max_num_fiel=
ds=3DNone, separator=3D&#39;&amp;&#39;)<br>
+ <br>
+=C2=A0 =C2=A0 Parse a query string given as a string argument (data of ty=
pe<br>
+=C2=A0 =C2=A0 :mimetype:`application/x-www-form-urlencoded`).=C2=A0 Data =
are returned as a list of<br>
+@@ -226,6 +235,9 @@ or on combining URL components into a URL string.<br>
+=C2=A0 =C2=A0 read. If set, then throws a :exc:`ValueError` if there are =
more than<br>
+=C2=A0 =C2=A0 *max_num_fields* fields read.<br>
+ <br>
++=C2=A0 =C2=A0The optional argument *separator* is the symbol to use for =
separating the<br>
++=C2=A0 =C2=A0query arguments. It defaults to ``&amp;``.<br>
++<br>
+=C2=A0 =C2=A0 Use the :func:`urllib.parse.urlencode` function to convert =
such lists of pairs into<br>
+=C2=A0 =C2=A0 query strings.<br>
+ <br>
+@@ -235,6 +247,12 @@ or on combining URL components into a URL string.<br=
>
+=C2=A0 =C2=A0 .. versionchanged:: 3.8<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Added *max_num_fields* parameter.<br>
+ <br>
++=C2=A0 =C2=A0.. versionchanged:: 3.8.8<br>
++=C2=A0 =C2=A0 =C2=A0 Added *separator* parameter with the default value =
of ``&amp;``. Python<br>
++=C2=A0 =C2=A0 =C2=A0 versions earlier than Python 3.8.8 allowed using bo=
th ``;`` and ``&amp;`` as<br>
++=C2=A0 =C2=A0 =C2=A0 query parameter separator. This has been changed to=
 allow only a single<br>
++=C2=A0 =C2=A0 =C2=A0 separator key, with ``&amp;`` as the default separa=
tor.<br>
++<br>
+ <br>
+ .. function:: urlunparse(parts)<br>
+ <br>
+diff --git a/Doc/whatsnew/3.6.rst b/Doc/whatsnew/3.6.rst<br>
+index 04c1f7e..4409a3a 100644<br>
+--- a/Doc/whatsnew/3.6.rst<br>
++++ b/Doc/whatsnew/3.6.rst<br>
+@@ -2443,3 +2443,16 @@ because of the behavior of the socket option ``SO_=
REUSEADDR`` in UDP. For more<br>
+ details, see the documentation for ``loop.create_datagram_endpoint()``.<=
br>
+ (Contributed by Kyle Stanley, Antoine Pitrou, and Yury Selivanov in<br>
+ :issue:`37228`.)<br>
++<br>
++Notable changes in Python 3.6.13<br>
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=
=3D=3D=3D=3D=3D=3D=3D=3D<br>
++<br>
++Earlier Python versions allowed using both ``;`` and ``&amp;`` as<br>
++query parameter separators in :func:`urllib.parse.parse_qs` and<br>
++:func:`urllib.parse.parse_qsl`.=C2=A0 Due to security concerns, and to c=
onform with<br>
++newer W3C recommendations, this has been changed to allow only a single<=
br>
++separator key, with ``&amp;`` as the default.=C2=A0 This change also aff=
ects<br>
++:func:`cgi.parse` and :func:`cgi.parse_multipart` as they use the affect=
ed<br>
++functions internally. For more details, please see their respective<br>
++documentation.<br>
++(Contributed by Adam Goldschmidt, Senthil Kumaran and Ken Jin in :issue:=
`42967`.)<br>
+diff --git a/Doc/whatsnew/3.7.rst b/Doc/whatsnew/3.7.rst<br>
+index b9b5021..8f47a9f 100644<br>
+--- a/Doc/whatsnew/3.7.rst<br>
++++ b/Doc/whatsnew/3.7.rst<br>
+@@ -2556,3 +2556,16 @@ because of the behavior of the socket option ``SO_=
REUSEADDR`` in UDP. For more<br>
+ details, see the documentation for ``loop.create_datagram_endpoint()``.<=
br>
+ (Contributed by Kyle Stanley, Antoine Pitrou, and Yury Selivanov in<br>
+ :issue:`37228`.)<br>
++<br>
++Notable changes in Python 3.7.10<br>
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=
=3D=3D=3D=3D=3D=3D=3D=3D<br>
++<br>
++Earlier Python versions allowed using both ``;`` and ``&amp;`` as<br>
++query parameter separators in :func:`urllib.parse.parse_qs` and<br>
++:func:`urllib.parse.parse_qsl`.=C2=A0 Due to security concerns, and to c=
onform with<br>
++newer W3C recommendations, this has been changed to allow only a single<=
br>
++separator key, with ``&amp;`` as the default.=C2=A0 This change also aff=
ects<br>
++:func:`cgi.parse` and :func:`cgi.parse_multipart` as they use the affect=
ed<br>
++functions internally. For more details, please see their respective<br>
++documentation.<br>
++(Contributed by Adam Goldschmidt, Senthil Kumaran and Ken Jin in :issue:=
`42967`.)<br>
+diff --git a/Lib/cgi.py b/Lib/cgi.py<br>
+index 5ace46a..13255a9 100755<br>
+--- a/Lib/cgi.py<br>
++++ b/Lib/cgi.py<br>
+@@ -106,7 +106,8 @@ log =3D initlog=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0# The current logging function<br>
+ # 0 =3D=3D&gt; unlimited input<br>
+ maxlen =3D 0<br>
+ <br>
+-def parse(fp=3DNone, environ=3Dos.environ, keep_blank_values=3D0, strict=
_parsing=3D0):<br>
++def parse(fp=3DNone, environ=3Dos.environ, keep_blank_values=3D0,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 strict_parsing=3D0, separator=3D&#39;=
&amp;&#39;):<br>
+=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;Parse a query in the environment or=
 from a file (default stdin)<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Arguments, all optional:<br>
+@@ -125,6 +126,9 @@ def parse(fp=3DNone, environ=3Dos.environ, keep_blank=
_values=3D0, strict_parsing=3D0):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strict_parsing: flag indicating what to=
 do with parsing errors.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0If false (the default), e=
rrors are silently ignored.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0If true, errors raise a V=
alueError exception.<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 separator: str. The symbol to use for separa=
ting the query arguments.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Defaults to &amp;.<br>
+=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0if fp is None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fp =3D sys.stdin<br>
+@@ -145,7 +149,7 @@ def parse(fp=3DNone, environ=3Dos.environ, keep_blank=
_values=3D0, strict_parsing=3D0):<br>
+=C2=A0 =C2=A0 =C2=A0if environ[&#39;REQUEST_METHOD&#39;] =3D=3D &#39;POST=
&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctype, pdict =3D parse_header(environ[&=
#39;CONTENT_TYPE&#39;])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ctype =3D=3D &#39;multipart/form-dat=
a&#39;:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return parse_multipart(fp, pdi=
ct)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return parse_multipart(fp, pdi=
ct, separator=3Dseparator)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif ctype =3D=3D &#39;application/x-ww=
w-form-urlencoded&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clength =3D int(environ[&=
#39;CONTENT_LENGTH&#39;])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if maxlen and clength &gt=
; maxlen:<br>
+@@ -169,10 +173,10 @@ def parse(fp=3DNone, environ=3Dos.environ, keep_bla=
nk_values=3D0, strict_parsing=3D0):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qs =3D &quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0environ[&#39;QUERY_STRING&#39;] =3D qs=
=C2=A0 =C2=A0 # XXX Shouldn&#39;t, really<br>
+=C2=A0 =C2=A0 =C2=A0return urllib.parse.parse_qs(qs, keep_blank_values, s=
trict_parsing,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0encoding=3Dencoding)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0encoding=3Dencoding, separ=
ator=3Dseparator)<br>
+ <br>
+ <br>
+-def parse_multipart(fp, pdict, encoding=3D&quot;utf-8&quot;, errors=3D&q=
uot;replace&quot;):<br>
++def parse_multipart(fp, pdict, encoding=3D&quot;utf-8&quot;, errors=3D&q=
uot;replace&quot;, separator=3D&#39;&amp;&#39;):<br>
+=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;Parse multipart input.<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0Arguments:<br>
+@@ -193,7 +197,7 @@ def parse_multipart(fp, pdict, encoding=3D&quot;utf-8=
&quot;, errors=3D&quot;replace&quot;):<br>
+=C2=A0 =C2=A0 =C2=A0headers.set_type(ctype)<br>
+=C2=A0 =C2=A0 =C2=A0headers[&#39;Content-Length&#39;] =3D pdict[&#39;CONT=
ENT-LENGTH&#39;]<br>
+=C2=A0 =C2=A0 =C2=A0fs =3D FieldStorage(fp, headers=3Dheaders, encoding=
=3Dencoding, errors=3Derrors,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 environ=3D{&#39;REQUEST_METHOD&#39;: &#39;PO=
ST&#39;})<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 environ=3D{&#39;REQUEST_METHOD&#39;: &#39;PO=
ST&#39;}, separator=3Dseparator)<br>
+=C2=A0 =C2=A0 =C2=A0return {k: fs.getlist(k) for k in fs}<br>
+ <br>
+ def _parseparam(s):<br>
+@@ -303,7 +307,7 @@ class FieldStorage:<br>
+=C2=A0 =C2=A0 =C2=A0def __init__(self, fp=3DNone, headers=3DNone, outerbo=
undary=3Db&#39;&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 environ=3D=
os.environ, keep_blank_values=3D0, strict_parsing=3D0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 limit=3DNo=
ne, encoding=3D&#39;utf-8&#39;, errors=3D&#39;replace&#39;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0max_num_fi=
elds=3DNone):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0max_num_fi=
elds=3DNone, separator=3D&#39;&amp;&#39;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;Constructor.=C2=A0 Re=
ad multipart/* until last part.<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Arguments, all optional:<br>
+@@ -351,6 +355,7 @@ class FieldStorage:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.keep_blank_values =3D keep_blank_v=
alues<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.strict_parsing =3D strict_parsing<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.max_num_fields =3D max_num_fields<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.separator =3D separator<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if &#39;REQUEST_METHOD&#39; in environ:=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0method =3D environ[&#39;R=
EQUEST_METHOD&#39;].upper()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.qs_on_post =3D None<br>
+@@ -577,7 +582,7 @@ class FieldStorage:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0query =3D urllib.parse.parse_qsl(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qs, self.keep_blank_value=
s, self.strict_parsing,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0encoding=3Dself.encoding,=
 errors=3Dself.errors,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 max_num_fields=3Dself.max_num_=
fields)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 max_num_fields=3Dself.max_num_=
fields, separator=3Dself.separator)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.list =3D [MiniFieldStorage(key, va=
lue) for key, value in query]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.skip_lines()<br>
+ <br>
+@@ -593,7 +598,7 @@ class FieldStorage:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0query =3D urllib.parse.pa=
rse_qsl(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.qs_on_=
post, self.keep_blank_values, self.strict_parsing,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0encoding=3D=
self.encoding, errors=3Dself.errors,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 max_num_fields=
=3Dself.max_num_fields)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 max_num_fields=
=3Dself.max_num_fields, separator=3Dself.separator)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.list.extend(MiniFiel=
dStorage(key, value) for key, value in query)<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0klass =3D self.FieldStorageClass or sel=
f.__class__<br>
+@@ -637,7 +642,7 @@ class FieldStorage:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else self.l=
imit - self.bytes_read<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0part =3D klass(self.fp, h=
eaders, ib, environ, keep_blank_values,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 strict_parsing, limit,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0self.encoding, self.errors, max_num_fields)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0self.encoding, self.errors, max_num_fields, self.separ=
ator)<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if max_num_fields is not =
None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0max_num_fie=
lds -=3D 1<br>
+diff --git a/Lib/test/test_cgi.py b/Lib/test/test_cgi.py<br>
+index ab86771..bda03ee 100644<br>
+--- a/Lib/test/test_cgi.py<br>
++++ b/Lib/test/test_cgi.py<br>
+@@ -53,12 +53,9 @@ parse_strict_test_cases =3D [<br>
+=C2=A0 =C2=A0 =C2=A0(&quot;&quot;, ValueError(&quot;bad query field: &#39=
;&#39;&quot;)),<br>
+=C2=A0 =C2=A0 =C2=A0(&quot;&amp;&quot;, ValueError(&quot;bad query field:=
 &#39;&#39;&quot;)),<br>
+=C2=A0 =C2=A0 =C2=A0(&quot;&amp;&amp;&quot;, ValueError(&quot;bad query f=
ield: &#39;&#39;&quot;)),<br>
+-=C2=A0 =C2=A0 (&quot;;&quot;, ValueError(&quot;bad query field: &#39;&#3=
9;&quot;)),<br>
+-=C2=A0 =C2=A0 (&quot;;&amp;;&quot;, ValueError(&quot;bad query field: &#=
39;&#39;&quot;)),<br>
+=C2=A0 =C2=A0 =C2=A0# Should the next few really be valid?<br>
+=C2=A0 =C2=A0 =C2=A0(&quot;=3D&quot;, {}),<br>
+=C2=A0 =C2=A0 =C2=A0(&quot;=3D&amp;=3D&quot;, {}),<br>
+-=C2=A0 =C2=A0 (&quot;=3D;=3D&quot;, {}),<br>
+=C2=A0 =C2=A0 =C2=A0# This rest seem to make sense<br>
+=C2=A0 =C2=A0 =C2=A0(&quot;=3Da&quot;, {&#39;&#39;: [&#39;a&#39;]}),<br>
+=C2=A0 =C2=A0 =C2=A0(&quot;&amp;=3Da&quot;, ValueError(&quot;bad query fi=
eld: &#39;&#39;&quot;)),<br>
+@@ -73,8 +70,6 @@ parse_strict_test_cases =3D [<br>
+=C2=A0 =C2=A0 =C2=A0(&quot;a=3Da+b&amp;b=3Db+c&quot;, {&#39;a&#39;: [&#39=
;a b&#39;], &#39;b&#39;: [&#39;b c&#39;]}),<br>
+=C2=A0 =C2=A0 =C2=A0(&quot;a=3Da+b&amp;a=3Db+a&quot;, {&#39;a&#39;: [&#39=
;a b&#39;, &#39;b a&#39;]}),<br>
+=C2=A0 =C2=A0 =C2=A0(&quot;x=3D1&amp;y=3D2.0&amp;z=3D2-3.%2b0&quot;, {&#3=
9;x&#39;: [&#39;1&#39;], &#39;y&#39;: [&#39;2.0&#39;], &#39;z&#39;: [&#39;2=
-3.+0&#39;]}),<br>
+-=C2=A0 =C2=A0 (&quot;x=3D1;y=3D2.0&amp;z=3D2-3.%2b0&quot;, {&#39;x&#39;:=
 [&#39;1&#39;], &#39;y&#39;: [&#39;2.0&#39;], &#39;z&#39;: [&#39;2-3.+0&#39=
;]}),<br>
+-=C2=A0 =C2=A0 (&quot;x=3D1;y=3D2.0;z=3D2-3.%2b0&quot;, {&#39;x&#39;: [&#=
39;1&#39;], &#39;y&#39;: [&#39;2.0&#39;], &#39;z&#39;: [&#39;2-3.+0&#39;]})=
,<br>
+=C2=A0 =C2=A0 =C2=A0(&quot;Hbc5161168c542333633315dee1182227:key_store_se=
qid=3D400006&amp;cuyer=3Dr&amp;view=3Dbustomer&amp;order_id=3D0bb2e24863883=
3d48cb7fed300000f1b&amp;expire=3D964546263&amp;lobale=3Den-US&amp;kid=3D130=
003.300038&amp;ss=3Denv&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 {&#39;Hbc5161168c542333633315dee1182227:key_store_se=
qid&#39;: [&#39;400006&#39;],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;cuyer&#39;: [&#39;r&#39;],<br>
+@@ -187,6 +182,30 @@ Content-Length: 3<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0self.assertEqual(fs.getvalue(key), expect_val[0])<br>
+ <br>
++=C2=A0 =C2=A0 def test_separator(self):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 parse_semicolon =3D [<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (&quot;x=3D1;y=3D2.0&quot;, {&=
#39;x&#39;: [&#39;1&#39;], &#39;y&#39;: [&#39;2.0&#39;]}),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (&quot;x=3D1;y=3D2.0;z=3D2-3.%=
2b0&quot;, {&#39;x&#39;: [&#39;1&#39;], &#39;y&#39;: [&#39;2.0&#39;], &#39;=
z&#39;: [&#39;2-3.+0&#39;]}),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (&quot;;&quot;, ValueError(&qu=
ot;bad query field: &#39;&#39;&quot;)),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (&quot;;;&quot;, ValueError(&q=
uot;bad query field: &#39;&#39;&quot;)),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (&quot;=3D;a&quot;, ValueError=
(&quot;bad query field: &#39;a&#39;&quot;)),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (&quot;;b=3Da&quot;, ValueErro=
r(&quot;bad query field: &#39;&#39;&quot;)),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (&quot;b;=3Da&quot;, ValueErro=
r(&quot;bad query field: &#39;b&#39;&quot;)),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (&quot;a=3Da+b;b=3Db+c&quot;, =
{&#39;a&#39;: [&#39;a b&#39;], &#39;b&#39;: [&#39;b c&#39;]}),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (&quot;a=3Da+b;a=3Db+a&quot;, =
{&#39;a&#39;: [&#39;a b&#39;, &#39;b a&#39;]}),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ]<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 for orig, expect in parse_semicolon:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env =3D {&#39;QUERY_STRING&#39=
;: orig}<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fs =3D cgi.FieldStorage(separa=
tor=3D&#39;;&#39;, environ=3Denv)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if isinstance(expect, dict):<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for key in expec=
t.keys():<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ex=
pect_val =3D expect[key]<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 se=
lf.assertIn(key, fs)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if=
 len(expect_val) &gt; 1:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 self.assertEqual(fs.getvalue(key), expect_val)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 el=
se:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 self.assertEqual(fs.getvalue(key), expect_val[0])<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0def test_log(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cgi.log(&quot;Testing&quot;)<br>
+ <br>
+diff --git a/Lib/test/test_urlparse.py b/Lib/test/test_urlparse.py<br>
+index 4ae6ed3..90c8d69 100644<br>
+--- a/Lib/test/test_urlparse.py<br>
++++ b/Lib/test/test_urlparse.py<br>
+@@ -32,16 +32,10 @@ parse_qsl_test_cases =3D [<br>
+=C2=A0 =C2=A0 =C2=A0(b&quot;&amp;a=3Db&quot;, [(b&#39;a&#39;, b&#39;b&#39=
;)]),<br>
+=C2=A0 =C2=A0 =C2=A0(b&quot;a=3Da+b&amp;b=3Db+c&quot;, [(b&#39;a&#39;, b&=
#39;a b&#39;), (b&#39;b&#39;, b&#39;b c&#39;)]),<br>
+=C2=A0 =C2=A0 =C2=A0(b&quot;a=3D1&amp;a=3D2&quot;, [(b&#39;a&#39;, b&#39;=
1&#39;), (b&#39;a&#39;, b&#39;2&#39;)]),<br>
+-=C2=A0 =C2=A0 (&quot;;&quot;, []),<br>
+-=C2=A0 =C2=A0 (&quot;;;&quot;, []),<br>
+-=C2=A0 =C2=A0 (&quot;;a=3Db&quot;, [(&#39;a&#39;, &#39;b&#39;)]),<br>
+-=C2=A0 =C2=A0 (&quot;a=3Da+b;b=3Db+c&quot;, [(&#39;a&#39;, &#39;a b&#39;=
), (&#39;b&#39;, &#39;b c&#39;)]),<br>
+-=C2=A0 =C2=A0 (&quot;a=3D1;a=3D2&quot;, [(&#39;a&#39;, &#39;1&#39;), (&#=
39;a&#39;, &#39;2&#39;)]),<br>
+-=C2=A0 =C2=A0 (b&quot;;&quot;, []),<br>
+-=C2=A0 =C2=A0 (b&quot;;;&quot;, []),<br>
+-=C2=A0 =C2=A0 (b&quot;;a=3Db&quot;, [(b&#39;a&#39;, b&#39;b&#39;)]),<br>
+-=C2=A0 =C2=A0 (b&quot;a=3Da+b;b=3Db+c&quot;, [(b&#39;a&#39;, b&#39;a b&#=
39;), (b&#39;b&#39;, b&#39;b c&#39;)]),<br>
+-=C2=A0 =C2=A0 (b&quot;a=3D1;a=3D2&quot;, [(b&#39;a&#39;, b&#39;1&#39;), =
(b&#39;a&#39;, b&#39;2&#39;)]),<br>
++=C2=A0 =C2=A0 (&quot;;a=3Db&quot;, [(&#39;;a&#39;, &#39;b&#39;)]),<br>
++=C2=A0 =C2=A0 (&quot;a=3Da+b;b=3Db+c&quot;, [(&#39;a&#39;, &#39;a b;b=3D=
b c&#39;)]),<br>
++=C2=A0 =C2=A0 (b&quot;;a=3Db&quot;, [(b&#39;;a&#39;, b&#39;b&#39;)]),<br=
>
++=C2=A0 =C2=A0 (b&quot;a=3Da+b;b=3Db+c&quot;, [(b&#39;a&#39;, b&#39;a b;b=
=
=3Db c&#39;)]),<br>
+ ]<br>
+ <br>
+ # Each parse_qs testcase is a two-tuple that contains<br>
+@@ -68,16 +62,10 @@ parse_qs_test_cases =3D [<br>
+=C2=A0 =C2=A0 =C2=A0(b&quot;&amp;a=3Db&quot;, {b&#39;a&#39;: [b&#39;b&#39=
;]}),<br>
+=C2=A0 =C2=A0 =C2=A0(b&quot;a=3Da+b&amp;b=3Db+c&quot;, {b&#39;a&#39;: [b&=
#39;a b&#39;], b&#39;b&#39;: [b&#39;b c&#39;]}),<br>
+=C2=A0 =C2=A0 =C2=A0(b&quot;a=3D1&amp;a=3D2&quot;, {b&#39;a&#39;: [b&#39;=
1&#39;, b&#39;2&#39;]}),<br>
+-=C2=A0 =C2=A0 (&quot;;&quot;, {}),<br>
+-=C2=A0 =C2=A0 (&quot;;;&quot;, {}),<br>
+-=C2=A0 =C2=A0 (&quot;;a=3Db&quot;, {&#39;a&#39;: [&#39;b&#39;]}),<br>
+-=C2=A0 =C2=A0 (&quot;a=3Da+b;b=3Db+c&quot;, {&#39;a&#39;: [&#39;a b&#39;=
], &#39;b&#39;: [&#39;b c&#39;]}),<br>
+-=C2=A0 =C2=A0 (&quot;a=3D1;a=3D2&quot;, {&#39;a&#39;: [&#39;1&#39;, &#39=
;2&#39;]}),<br>
+-=C2=A0 =C2=A0 (b&quot;;&quot;, {}),<br>
+-=C2=A0 =C2=A0 (b&quot;;;&quot;, {}),<br>
+-=C2=A0 =C2=A0 (b&quot;;a=3Db&quot;, {b&#39;a&#39;: [b&#39;b&#39;]}),<br>
+-=C2=A0 =C2=A0 (b&quot;a=3Da+b;b=3Db+c&quot;, {b&#39;a&#39;: [b&#39;a b&#=
39;], b&#39;b&#39;: [b&#39;b c&#39;]}),<br>
+-=C2=A0 =C2=A0 (b&quot;a=3D1;a=3D2&quot;, {b&#39;a&#39;: [b&#39;1&#39;, b=
&#39;2&#39;]}),<br>
++=C2=A0 =C2=A0 (&quot;;a=3Db&quot;, {&#39;;a&#39;: [&#39;b&#39;]}),<br>
++=C2=A0 =C2=A0 (&quot;a=3Da+b;b=3Db+c&quot;, {&#39;a&#39;: [&#39;a b;b=3D=
b c&#39;]}),<br>
++=C2=A0 =C2=A0 (b&quot;;a=3Db&quot;, {b&#39;;a&#39;: [b&#39;b&#39;]}),<br=
>
++=C2=A0 =C2=A0 (b&quot;a=3Da+b;b=3Db+c&quot;, {b&#39;a&#39;:[ b&#39;a b;b=
=
=3Db c&#39;]}),<br>
+ ]<br>
+ <br>
+ class UrlParseTestCase(unittest.TestCase):<br>
+@@ -884,10 +872,46 @@ class UrlParseTestCase(unittest.TestCase):<br>
+=C2=A0 =C2=A0 =C2=A0def test_parse_qsl_max_num_fields(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with self.assertRaises(ValueError):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0urllib.parse.parse_qs(&#3=
9;&amp;&#39;.join([&#39;a=3Da&#39;]*11), max_num_fields=3D10)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 with self.assertRaises(ValueError):<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 urllib.parse.parse_qs(&#39;;&#=
39;.join([&#39;a=3Da&#39;]*11), max_num_fields=3D10)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0urllib.parse.parse_qs(&#39;&amp;&#39;.j=
oin([&#39;a=3Da&#39;]*10), max_num_fields=3D10)<br>
+ <br>
++=C2=A0 =C2=A0 def test_parse_qs_separator(self):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 parse_qs_semicolon_cases =3D [<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (&quot;;&quot;, {}),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (&quot;;;&quot;, {}),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (&quot;;a=3Db&quot;, {&#39;a&#=
39;: [&#39;b&#39;]}),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (&quot;a=3Da+b;b=3Db+c&quot;, =
{&#39;a&#39;: [&#39;a b&#39;], &#39;b&#39;: [&#39;b c&#39;]}),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (&quot;a=3D1;a=3D2&quot;, {&#3=
9;a&#39;: [&#39;1&#39;, &#39;2&#39;]}),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (b&quot;;&quot;, {}),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (b&quot;;;&quot;, {}),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (b&quot;;a=3Db&quot;, {b&#39;a=
&#39;: [b&#39;b&#39;]}),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (b&quot;a=3Da+b;b=3Db+c&quot;,=
 {b&#39;a&#39;: [b&#39;a b&#39;], b&#39;b&#39;: [b&#39;b c&#39;]}),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (b&quot;a=3D1;a=3D2&quot;, {b&=
#39;a&#39;: [b&#39;1&#39;, b&#39;2&#39;]}),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ]<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 for orig, expect in parse_qs_semicolon_cases=
:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with self.subTest(f&quot;Origi=
nal: {orig!r}, Expected: {expect!r}&quot;):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D urlli=
b.parse.parse_qs(orig, separator=3D&#39;;&#39;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual=
(result, expect, &quot;Error parsing %r&quot; % orig)<br>
++<br>
++<br>
++=C2=A0 =C2=A0 def test_parse_qsl_separator(self):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 parse_qsl_semicolon_cases =3D [<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (&quot;;&quot;, []),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (&quot;;;&quot;, []),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (&quot;;a=3Db&quot;, [(&#39;a&=
#39;, &#39;b&#39;)]),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (&quot;a=3Da+b;b=3Db+c&quot;, =
[(&#39;a&#39;, &#39;a b&#39;), (&#39;b&#39;, &#39;b c&#39;)]),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (&quot;a=3D1;a=3D2&quot;, [(&#=
39;a&#39;, &#39;1&#39;), (&#39;a&#39;, &#39;2&#39;)]),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (b&quot;;&quot;, []),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (b&quot;;;&quot;, []),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (b&quot;;a=3Db&quot;, [(b&#39;=
a&#39;, b&#39;b&#39;)]),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (b&quot;a=3Da+b;b=3Db+c&quot;,=
 [(b&#39;a&#39;, b&#39;a b&#39;), (b&#39;b&#39;, b&#39;b c&#39;)]),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (b&quot;a=3D1;a=3D2&quot;, [(b=
&#39;a&#39;, b&#39;1&#39;), (b&#39;a&#39;, b&#39;2&#39;)]),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ]<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 for orig, expect in parse_qsl_semicolon_case=
s:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with self.subTest(f&quot;Origi=
nal: {orig!r}, Expected: {expect!r}&quot;):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D urlli=
b.parse.parse_qsl(orig, separator=3D&#39;;&#39;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual=
(result, expect, &quot;Error parsing %r&quot; % orig)<br>
++<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0def test_urlencode_sequences(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Other tests incidentally urlencode th=
ings; test non-covered cases:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Sequence and object values.<br>
+diff --git a/Lib/urllib/parse.py b/Lib/urllib/parse.py<br>
+index e2b6f13..5a3e847 100644<br>
+--- a/Lib/urllib/parse.py<br>
++++ b/Lib/urllib/parse.py<br>
+@@ -648,7 +648,7 @@ def unquote(string, encoding=3D&#39;utf-8&#39;, error=
s=3D&#39;replace&#39;):<br>
+ <br>
+ <br>
+ def parse_qs(qs, keep_blank_values=3DFalse, strict_parsing=3DFalse,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0encoding=3D&#39;utf-8&#3=
9;, errors=3D&#39;replace&#39;, max_num_fields=3DNone):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0encoding=3D&#39;utf-8&#3=
9;, errors=3D&#39;replace&#39;, max_num_fields=3DNone, separator=3D&#39;&am=
p;&#39;):<br>
+=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;Parse a query given as a string arg=
ument.<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Arguments:<br>
+@@ -672,12 +672,15 @@ def parse_qs(qs, keep_blank_values=3DFalse, strict_=
parsing=3DFalse,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0max_num_fields: int. If set, then throw=
s a ValueError if there<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0are more than n fields re=
ad by parse_qsl().<br>
+ <br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 separator: str. The symbol to use for separa=
ting the query arguments.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Defaults to &amp;.<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Returns a dictionary.<br>
+=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0parsed_result =3D {}<br>
+=C2=A0 =C2=A0 =C2=A0pairs =3D parse_qsl(qs, keep_blank_values, strict_par=
sing,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0encoding=3Dencoding, errors=3Derrors,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 max_num_fields=3Dmax_num_fields)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 max_num_fields=3Dmax_num_fields, separator=3Dseparator)<br>
+=C2=A0 =C2=A0 =C2=A0for name, value in pairs:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if name in parsed_result:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0parsed_result[name].appen=
d(value)<br>
+@@ -687,7 +690,7 @@ def parse_qs(qs, keep_blank_values=3DFalse, strict_pa=
rsing=3DFalse,<br>
+ <br>
+ <br>
+ def parse_qsl(qs, keep_blank_values=3DFalse, strict_parsing=3DFalse,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 encoding=3D&#39;utf-8&#=
39;, errors=3D&#39;replace&#39;, max_num_fields=3DNone):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 encoding=3D&#39;utf-8&#=
39;, errors=3D&#39;replace&#39;, max_num_fields=3DNone, separator=3D&#39;&a=
mp;&#39;):<br>
+=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;Parse a query given as a string arg=
ument.<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Arguments:<br>
+@@ -710,19 +713,25 @@ def parse_qsl(qs, keep_blank_values=3DFalse, strict=
_parsing=3DFalse,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0max_num_fields: int. If set, then throw=
s a ValueError<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if there are more than n =
fields read by parse_qsl().<br>
+ <br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 separator: str. The symbol to use for separa=
ting the query arguments.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Defaults to &amp;.<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Returns a list, as G-d intended.<br>
+=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0qs, _coerce_result =3D _coerce_args(qs)<br>
+ <br>
++=C2=A0 =C2=A0 if not separator or (not isinstance(separator, (str, bytes=
))):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise ValueError(&quot;Separator must be of =
type string or bytes.&quot;)<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0# If max_num_fields is defined then check that the nu=
mber of fields<br>
+=C2=A0 =C2=A0 =C2=A0# is less than max_num_fields. This prevents a memory=
 exhaustion DOS<br>
+=C2=A0 =C2=A0 =C2=A0# attack via post bodies with many fields.<br>
+=C2=A0 =C2=A0 =C2=A0if max_num_fields is not None:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 num_fields =3D 1 + qs.count(&#39;&amp;&#39;)=
 + qs.count(&#39;;&#39;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 num_fields =3D 1 + qs.count(separator)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if max_num_fields &lt; num_fields:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise ValueError(&#39;Max=
 number of fields exceeded&#39;)<br>
+ <br>
+-=C2=A0 =C2=A0 pairs =3D [s2 for s1 in qs.split(&#39;&amp;&#39;) for s2 i=
n s1.split(&#39;;&#39;)]<br>
++=C2=A0 =C2=A0 pairs =3D [s1 for s1 in qs.split(separator)]<br>
+=C2=A0 =C2=A0 =C2=A0r =3D []<br>
+=C2=A0 =C2=A0 =C2=A0for name_value in pairs:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not name_value and not strict_parsin=
g:<br>
+diff --git a/Misc/NEWS.d/next/Security/2021-02-14-15-59-16.bpo-42967.YApq=
DS.rst b/Misc/NEWS.d/next/Security/2021-02-14-15-59-16.bpo-42967.YApqDS.rst=
<br>
+new file mode 100644<br>
+index 0000000..f08489b<br>
+--- /dev/null<br>
++++ b/Misc/NEWS.d/next/Security/2021-02-14-15-59-16.bpo-42967.YApqDS.rst<=
br>
+@@ -0,0 +1 @@<br>
++Fix web cache poisoning vulnerability by defaulting the query args separ=
ator to ``&amp;``, and allowing the user to choose a custom separator.<br>
diff --git a/meta/recipes-devtools/python/python3/CVE-2021-3177.patch b/me=
ta/recipes-devtools/python/python3/CVE-2021-3177.patch<br>
new file mode 100644<br>
index 0000000000..af95b5eee1<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/python/python3/CVE-2021-3177.patch<br>
@@ -0,0 +1,191 @@<br>
+From ece5dfd403dac211f8d3c72701fe7ba7b7aa5b5f Mon Sep 17 00:00:00 2001<br=
>
+From: &quot;Miss Islington (bot)&quot;<br>
+ &lt;<a href=3D"mailto:31488909%2Bmiss-islington@users.noreply.github.com=
" target=3D"_blank">31488909+miss-islington@users.noreply.github.com</a>&gt=
;<br>
+Date: Mon, 18 Jan 2021 13:28:52 -0800<br>
+Subject: [PATCH] closes bpo-42938: Replace snprintf with Python unicode<b=
r>
+ formatting in ctypes param reprs. (GH-24248)<br>
+<br>
+(cherry picked from commit 916610ef90a0d0761f08747f7b0905541f0977c7)<br>
+<br>
+Co-authored-by: Benjamin Peterson &lt;<a href=3D"mailto:benjamin@python.o=
rg" target=3D"_blank">benjamin@python.org</a>&gt;<br>
+<br>
+Co-authored-by: Benjamin Peterson &lt;<a href=3D"mailto:benjamin@python.o=
rg" target=3D"_blank">benjamin@python.org</a>&gt;<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/python/cpython/c=
ommit/ece5dfd403dac211f8d3c72701fe7ba7b7aa5b5f" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/python/cpython/commit/ece5dfd403dac211f8d3c=
72701fe7ba7b7aa5b5f</a>]<br>
+CVE: CVE-2021-3177<br>
+Signed-off-by: Chee Yang Lee &lt;<a href=3D"mailto:chee.yang.lee@intel.co=
m" target=3D"_blank">chee.yang.lee@intel.com</a>&gt;<br>
+---<br>
+ Lib/ctypes/test/test_parameters.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 | 43 ++++++++++++++++<br>
+ .../2021-01-18-09-27-31.bpo-42938.4Zn4Mp.rst=C2=A0 |=C2=A0 2 +<br>
+ Modules/_ctypes/callproc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 51 +++++++------------<br>
+ 3 files changed, 64 insertions(+), 32 deletions(-)<br>
+ create mode 100644 Misc/NEWS.d/next/Security/2021-01-18-09-27-31.bpo-429=
38.4Zn4Mp.rst<br>
+<br>
+diff --git a/Lib/ctypes/test/test_parameters.py b/Lib/ctypes/test/test_pa=
rameters.py<br>
+index e4c25fd880cef..531894fdec838 100644<br>
+--- a/Lib/ctypes/test/test_parameters.py<br>
++++ b/Lib/ctypes/test/test_parameters.py<br>
+@@ -201,6 +201,49 @@ def __dict__(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with self.assertRaises(ZeroDivisionErro=
r):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0WorseStruct().__setstate_=
_({}, b&#39;foo&#39;)<br>
+ <br>
++=C2=A0 =C2=A0 def test_parameter_repr(self):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 from ctypes import (<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c_bool,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c_char,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c_wchar,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c_byte,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c_ubyte,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c_short,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c_ushort,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c_int,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c_uint,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c_long,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c_ulong,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c_longlong,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c_ulonglong,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c_float,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c_double,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c_longdouble,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c_char_p,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c_wchar_p,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c_void_p,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertRegex(repr(c_bool.from_param(True=
)), r&quot;^&lt;cparam &#39;\?&#39; at 0x[A-Fa-f0-9]+&gt;$&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(repr(c_char.from_param(97))=
, &quot;&lt;cparam &#39;c&#39; (&#39;a&#39;)&gt;&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertRegex(repr(c_wchar.from_param(&#3=
9;a&#39;)), r&quot;^&lt;cparam &#39;u&#39; at 0x[A-Fa-f0-9]+&gt;$&quot;)<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(repr(c_byte.from_param(98))=
, &quot;&lt;cparam &#39;b&#39; (98)&gt;&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(repr(c_ubyte.from_param(98)=
), &quot;&lt;cparam &#39;B&#39; (98)&gt;&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(repr(c_short.from_param(511=
)), &quot;&lt;cparam &#39;h&#39; (511)&gt;&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(repr(c_ushort.from_param(51=
1)), &quot;&lt;cparam &#39;H&#39; (511)&gt;&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertRegex(repr(c_int.from_param(20000=
)), r&quot;^&lt;cparam &#39;[li]&#39; \(20000\)&gt;$&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertRegex(repr(c_uint.from_param(2000=
0)), r&quot;^&lt;cparam &#39;[LI]&#39; \(20000\)&gt;$&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertRegex(repr(c_long.from_param(2000=
0)), r&quot;^&lt;cparam &#39;[li]&#39; \(20000\)&gt;$&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertRegex(repr(c_ulong.from_param(200=
00)), r&quot;^&lt;cparam &#39;[LI]&#39; \(20000\)&gt;$&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertRegex(repr(c_longlong.from_param(=
20000)), r&quot;^&lt;cparam &#39;[liq]&#39; \(20000\)&gt;$&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertRegex(repr(c_ulonglong.from_param=
(20000)), r&quot;^&lt;cparam &#39;[LIQ]&#39; \(20000\)&gt;$&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(repr(c_float.from_param(1.5=
)), &quot;&lt;cparam &#39;f&#39; (1.5)&gt;&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(repr(c_double.from_param(1.=
5)), &quot;&lt;cparam &#39;d&#39; (1.5)&gt;&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(repr(c_double.from_param(1e=
300)), &quot;&lt;cparam &#39;d&#39; (1e+300)&gt;&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertRegex(repr(c_longdouble.from_para=
m(1.5)), r&quot;^&lt;cparam (&#39;d&#39; \(1.5\)|&#39;g&#39; at 0x[A-Fa-f0-=
9]+)&gt;$&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertRegex(repr(c_char_p.from_param(b&=
#39;hihi&#39;)), &quot;^&lt;cparam &#39;z&#39; \(0x[A-Fa-f0-9]+\)&gt;$&quot=
;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertRegex(repr(c_wchar_p.from_param(&=
#39;hihi&#39;)), &quot;^&lt;cparam &#39;Z&#39; \(0x[A-Fa-f0-9]+\)&gt;$&quot=
;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertRegex(repr(c_void_p.from_param(0x=
12)), r&quot;^&lt;cparam &#39;P&#39; \(0x0*12\)&gt;$&quot;)<br>
++<br>
+ ################################################################<br>
+ <br>
+ if __name__ =3D=3D &#39;__main__&#39;:<br>
+diff --git a/Misc/NEWS.d/next/Security/2021-01-18-09-27-31.bpo-42938.4Zn4=
Mp.rst b/Misc/NEWS.d/next/Security/2021-01-18-09-27-31.bpo-42938.4Zn4Mp.rst=
<br>
+new file mode 100644<br>
+index 0000000000000..7df65a156feab<br>
+--- /dev/null<br>
++++ b/Misc/NEWS.d/next/Security/2021-01-18-09-27-31.bpo-42938.4Zn4Mp.rst<=
br>
+@@ -0,0 +1,2 @@<br>
++Avoid static buffers when computing the repr of :class:`ctypes.c_double`=
 and<br>
++:class:`ctypes.c_longdouble` values.<br>
+diff --git a/Modules/_ctypes/callproc.c b/Modules/_ctypes/callproc.c<br>
+index a9b8675cd951b..de75918d49f37 100644<br>
+--- a/Modules/_ctypes/callproc.c<br>
++++ b/Modules/_ctypes/callproc.c<br>
+@@ -484,58 +484,47 @@ is_literal_char(unsigned char c)<br>
+ static PyObject *<br>
+ PyCArg_repr(PyCArgObject *self)<br>
+ {<br>
+-=C2=A0 =C2=A0 char buffer[256];<br>
+=C2=A0 =C2=A0 =C2=A0switch(self-&gt;tag) {<br>
+=C2=A0 =C2=A0 =C2=A0case &#39;b&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0case &#39;B&#39;:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 sprintf(buffer, &quot;&lt;cparam &#39;%c&#39=
; (%d)&gt;&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return PyUnicode_FromFormat(&quot;&lt;cparam=
 &#39;%c&#39; (%d)&gt;&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self-&gt;tag, self-&gt;va=
lue.b);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0case &#39;h&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0case &#39;H&#39;:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 sprintf(buffer, &quot;&lt;cparam &#39;%c&#39=
; (%d)&gt;&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return PyUnicode_FromFormat(&quot;&lt;cparam=
 &#39;%c&#39; (%d)&gt;&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self-&gt;tag, self-&gt;va=
lue.h);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0case &#39;i&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0case &#39;I&#39;:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 sprintf(buffer, &quot;&lt;cparam &#39;%c&#39=
; (%d)&gt;&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return PyUnicode_FromFormat(&quot;&lt;cparam=
 &#39;%c&#39; (%d)&gt;&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self-&gt;tag, self-&gt;va=
lue.i);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0case &#39;l&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0case &#39;L&#39;:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 sprintf(buffer, &quot;&lt;cparam &#39;%c&#39=
; (%ld)&gt;&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return PyUnicode_FromFormat(&quot;&lt;cparam=
 &#39;%c&#39; (%ld)&gt;&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self-&gt;tag, self-&gt;va=
lue.l);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0case &#39;q&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0case &#39;Q&#39;:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 sprintf(buffer,<br>
+-#ifdef MS_WIN32<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&lt;cparam &#39;%c&#39; =
(%I64d)&gt;&quot;,<br>
+-#else<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&lt;cparam &#39;%c&#39; =
(%lld)&gt;&quot;,<br>
+-#endif<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return PyUnicode_FromFormat(&quot;&lt;cparam=
 &#39;%c&#39; (%lld)&gt;&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self-&gt;tag, self-&gt;va=
lue.q);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0case &#39;d&#39;:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 sprintf(buffer, &quot;&lt;cparam &#39;%c&#39=
; (%f)&gt;&quot;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self-&gt;tag, self-&gt;value.d=
);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+-=C2=A0 =C2=A0 case &#39;f&#39;:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 sprintf(buffer, &quot;&lt;cparam &#39;%c&#39=
; (%f)&gt;&quot;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self-&gt;tag, self-&gt;value.f=
);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+-<br>
++=C2=A0 =C2=A0 case &#39;f&#39;: {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 PyObject *f =3D PyFloat_FromDouble((self-&gt=
;tag =3D=3D &#39;f&#39;) ? self-&gt;value.f : self-&gt;value.d);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (f =3D=3D NULL) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 PyObject *result =3D PyUnicode_FromFormat(&q=
uot;&lt;cparam &#39;%c&#39; (%R)&gt;&quot;, self-&gt;tag, f);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 Py_DECREF(f);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return result;<br>
++=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0case &#39;c&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (is_literal_char((unsigned char)self=
-&gt;value.c)) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sprintf(buffer, &quot;&lt;cpar=
am &#39;%c&#39; (&#39;%c&#39;)&gt;&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return PyUnicode_FromFormat(&q=
uot;&lt;cparam &#39;%c&#39; (&#39;%c&#39;)&gt;&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self-&gt;ta=
g, self-&gt;value.c);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sprintf(buffer, &quot;&lt;cpar=
am &#39;%c&#39; (&#39;\\x%02x&#39;)&gt;&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return PyUnicode_FromFormat(&q=
uot;&lt;cparam &#39;%c&#39; (&#39;\\x%02x&#39;)&gt;&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self-&gt;ta=
g, (unsigned char)self-&gt;value.c);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+ <br>
+ /* Hm, are these &#39;z&#39; and &#39;Z&#39; codes useful at all?<br>
+=C2=A0 =C2=A0 Shouldn&#39;t they be replaced by the functionality of c_st=
ring<br>
+@@ -544,22 +533,20 @@ PyCArg_repr(PyCArgObject *self)<br>
+=C2=A0 =C2=A0 =C2=A0case &#39;z&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0case &#39;Z&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0case &#39;P&#39;:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 sprintf(buffer, &quot;&lt;cparam &#39;%c&#39=
; (%p)&gt;&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return PyUnicode_FromFormat(&quot;&lt;cparam=
 &#39;%c&#39; (%p)&gt;&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self-&gt;tag, self-&gt;va=
lue.p);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (is_literal_char((unsigned char)self=
-&gt;tag)) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sprintf(buffer, &quot;&lt;cpar=
am &#39;%c&#39; at %p&gt;&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return PyUnicode_FromFormat(&q=
uot;&lt;cparam &#39;%c&#39; at %p&gt;&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(unsigned c=
har)self-&gt;tag, (void *)self);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sprintf(buffer, &quot;&lt;cpar=
am 0x%02x at %p&gt;&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return PyUnicode_FromFormat(&q=
uot;&lt;cparam 0x%02x at %p&gt;&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(unsigned c=
har)self-&gt;tag, (void *)self);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 return PyUnicode_FromString(buffer);<br>
+ }<br>
+ <br>
+ static PyMemberDef PyCArgType_members[] =3D {<br>
+<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3_3.8.2.=
bb" rel=3D"noreferrer" target=3D"_blank">python3_3.8.2.bb</a> b/meta/recipe=
s-devtools/python/<a href=3D"http://python3_3.8.2.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">python3_3.8.2.bb</a><br>
index a448b3ed97..c870fc4f05 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3_3.8.2.bb" rel=
=
=3D"noreferrer" target=3D"_blank">python3_3.8.2.bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3_3.8.2.bb" rel=
=
=3D"noreferrer" target=3D"_blank">python3_3.8.2.bb</a><br>
@@ -37,6 +37,8 @@ SRC_URI =3D &quot;<a href=3D"http://www.python.org/ftp/p=
ython/$%7BPV%7D/Python-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blan=
k">http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2020-14422.patch \<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2020-26116.patch \<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2020-27619.patch \<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2021-3177.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2021-23336.patch \<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI_append_class-native =3D &quot; \<br>
-- <br>
2.17.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000045121805bc906108--
