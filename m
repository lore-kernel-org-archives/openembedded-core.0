Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
 by mx.groups.io with SMTP id smtpd.web11.98.1624296141499382336
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jun 2021 10:22:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LTdI8w70;
 spf=pass (domain: gmail.com, ip: 209.85.166.41, mailfrom: ticotimo@gmail.com)
Received: by mail-io1-f41.google.com with SMTP id v3so10961590ioq.9
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Jun 2021 10:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iNRmiEd5zSOcBd1fUW8ggNMg9v/w2R4kCOWza2EfK8A=;
        b=LTdI8w70whb7P+N68F9VmdZW08bCuZFFf0QF8qxM+cvfmK4ukQS5yXkLpmPA1LL+Hp
         eAaW8Nlj5lc7pJ9gDqLRKl943tItQxpx0dYBkbf0vSLHjC0aPjU6Hk8O16pcdkQ733fh
         KfttWUN3wgoYnKmc89YlBYxoLe6PUsAvkRmO/15HKuNH477Wp4JQ1W6CCGxdWyM8meMc
         FIPmaNxupH0dwKsc6zf9TnWeLoRqimnu6kTxz9rI2Q8+p6zk4aqX4dxkGuC5BYTZMOqa
         pE/LKDp+czr2XX//FRpzKmQihigg2wv3lmhYloQ2Xr4Y7MUV79fKwzBRnGydFGPmk/LN
         uSKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iNRmiEd5zSOcBd1fUW8ggNMg9v/w2R4kCOWza2EfK8A=;
        b=lzK8w9Lt6QID+8oAEf9gJgn0fizTN16TVNzHjoBKjfMQnGxB5zlRu+4eFFSWt3vTqN
         eaa5zdBEc9Ak2VMMgvb8XKF/JNtS8MwCXXX9LGejzVAF6Mrtln8HNCrsj67ak6ybv3sZ
         bCJhc4duqE+6mpCUFqA2jjsjy34dvkXMbKx6AdMFDSO4vXiq2T4d/Ri7JdT5LcJdau2Y
         qKnYTGLDrVopeqF1GMT/9PFhdtYqcrjBfpLY2JYhbqWfvPGl7qWGYHhErq+gdllQhBFg
         v1GkbQzSmEBvimcHnGU+1Y/7sBlpzmGDlRawSrDAI1hRdXoL8EyqxpC2kXtpE6HOp0BD
         yTJg==
X-Gm-Message-State: AOAM532R0FYB0BtV1zNAq1YrWZdyb5feb+0D2RwySwoWzLM7/hfyfGfD
	EqKn84yVVa7eRYbysALdkqtCknAhdpg3pdC1Ny4=
X-Google-Smtp-Source: ABdhPJwNmi2C4j8JN7sgLssW2p7HPcSM0YbmZq5Ofq4pqG5q04xe4quZmPIf17GuYRR+j4Wk1BL6HAM3Tq73lJTat6Y=
X-Received: by 2002:a5d:80cf:: with SMTP id h15mr20794011ior.30.1624296140670;
 Mon, 21 Jun 2021 10:22:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210621144901.1480-1-flowergom@gmail.com> <CAOSpxdYEXvu8rJTg6=LV3UO+-jiEKkkpfA=sshXdLOrxwAMJJQ@mail.gmail.com>
In-Reply-To: <CAOSpxdYEXvu8rJTg6=LV3UO+-jiEKkkpfA=sshXdLOrxwAMJJQ@mail.gmail.com>
From: "Tim Orling" <ticotimo@gmail.com>
Date: Mon, 21 Jun 2021 10:22:08 -0700
Message-ID: <CANx9H-Ca2GUf2J8DzgvPLDDBjmqwL8piFZzsDhjzxBP0T1PWCg@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] python3: fix CVE-2021-3426
To: Steve Sakoman <steve@sakoman.com>
Cc: Minjae Kim <flowergom@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000798b4705c549eabf"

--000000000000798b4705c549eabf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 21, 2021 at 9:07 AM Steve Sakoman <steve@sakoman.com> wrote:

> Thanks for the patch!
>
> I'm going to wait a bit on merging this because we are evaluating
> doing a series of bug fix version bumps for python.  If successful
> this CVE would be among those fixed by the version bumps.
>
>  https://lists.openembedded.org/g/openembedded-core/message/153147

Steve
>
> On Mon, Jun 21, 2021 at 4:49 AM Minjae Kim <flowergom@gmail.com> wrote:
> >
> > Remove the pydoc getfile feature
> >
> > CVE-2021-3426: Remove the "getfile" feature of the pydoc module which
> > could be abused to read arbitrary files on the disk (directory
> > traversal vulnerability). Moreover, even source code of Python
> > modules can contain sensitive data like passwords. Vulnerability
> > reported by David Schw=C3=83=C2=B6rer.
> >
> > reference:
> > https://nvd.nist.gov/vuln/detail/CVE-2021-3426
> >
> https://github.com/python/cpython/pull/25015/commits/dc9580949cc82c51022=
a882ba43dad937ff929a8
> > ---
> >  .../python/python3/CVE-2021-3426.patch        | 105 +++++++++++++++++=
+
> >  meta/recipes-devtools/python/python3_3.8.2.bb |   1 +
> >  2 files changed, 106 insertions(+)
> >  create mode 100644
> meta/recipes-devtools/python/python3/CVE-2021-3426.patch
> >
> > diff --git a/meta/recipes-devtools/python/python3/CVE-2021-3426.patch
> b/meta/recipes-devtools/python/python3/CVE-2021-3426.patch
> > new file mode 100644
> > index 0000000000..68bd7d9296
> > --- /dev/null
> > +++ b/meta/recipes-devtools/python/python3/CVE-2021-3426.patch
> > @@ -0,0 +1,105 @@
> > +From 9b999479c0022edfc9835a8a1f06e046f3881048 Mon Sep 17 00:00:00 200=
1
> > +From: Victor Stinner <vstinner@python.org>
> > +Date: Mon, 29 Mar 2021 14:40:40 +0200
> > +Subject: [PATCH] bpo-42988: Remove the pydoc getfile feature (GH-2501=
5)
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=3DUTF-8
> > +Content-Transfer-Encoding: 8bit
> > +
> > +CVE-2021-3426: Remove the "getfile" feature of the pydoc module which
> > +could be abused to read arbitrary files on the disk (directory
> > +traversal vulnerability). Moreover, even source code of Python
> > +modules can contain sensitive data like passwords. Vulnerability
> > +reported by David Schw=C3=83=C2=B6rer.
> > +
> > +Upstream-Status: Acepted
> > +[
> https://github.com/python/cpython/pull/25015/commits/dc9580949cc82c51022=
a882ba43dad937ff929a8
> ]
> > +CVE: CVE-2021-3426
> > +Signed-off-by: Minjae Kim <flowergom@gmail.com>
> > +
> > +---
> > + Lib/pydoc.py                                   | 18 ----------------=
--
> > + Lib/test/test_pydoc.py                         |  6 ------
> > + .../2021-03-24-14-16-56.bpo-42988.P2aNco.rst   |  4 ++++
> > + 3 files changed, 4 insertions(+), 24 deletions(-)
> > + create mode 100644
> Misc/NEWS.d/next/Security/2021-03-24-14-16-56.bpo-42988.P2aNco.rst
> > +
> > +diff --git a/Lib/pydoc.py b/Lib/pydoc.py
> > +index 282a917998..753ea97ba0 100755
> > +--- a/Lib/pydoc.py
> > ++++ b/Lib/pydoc.py
> > +@@ -2456,9 +2456,6 @@ def page(self, title, contents):
> > + %s</head><body bgcolor=3D"#f0f0f8">%s<div
> style=3D"clear:both;padding-top:.5em;">%s</div>
> > + </body></html>''' % (title, css_link, html_navbar(), contents)
> > +
> > +-        def filelink(self, url, path):
> > +-            return '<a href=3D"getfile?key=3D%s">%s</a>' % (url, pat=
h)
> > +-
> > +
> > +     html =3D _HTMLDoc()
> > +
> > +@@ -2544,19 +2541,6 @@ def bltinlink(name):
> > +             'key =3D %s' % key, '#ffffff', '#ee77aa',
> '<br>'.join(results))
> > +         return 'Search Results', contents
> > +
> > +-    def html_getfile(path):
> > +-        """Get and display a source file listing safely."""
> > +-        path =3D urllib.parse.unquote(path)
> > +-        with tokenize.open(path) as fp:
> > +-            lines =3D html.escape(fp.read())
> > +-        body =3D '<pre>%s</pre>' % lines
> > +-        heading =3D html.heading(
> > +-            '<big><big><strong>File Listing</strong></big></big>',
> > +-            '#ffffff', '#7799ee')
> > +-        contents =3D heading + html.bigsection(
> > +-            'File: %s' % path, '#ffffff', '#ee77aa', body)
> > +-        return 'getfile %s' % path, contents
> > +-
> > +     def html_topics():
> > +         """Index of topic texts available."""
> > +
> > +@@ -2648,8 +2632,6 @@ def get_html_page(url):
> > +                 op, _, url =3D url.partition('=3D')
> > +                 if op =3D=3D "search?key":
> > +                     title, content =3D html_search(url)
> > +-                elif op =3D=3D "getfile?key":
> > +-                    title, content =3D html_getfile(url)
> > +                 elif op =3D=3D "topic?key":
> > +                     # try topics first, then objects.
> > +                     try:
> > +diff --git a/Lib/test/test_pydoc.py b/Lib/test/test_pydoc.py
> > +index 2f502627f4..3bc0e9e6b5 100644
> > +--- a/Lib/test/test_pydoc.py
> > ++++ b/Lib/test/test_pydoc.py
> > +@@ -1374,18 +1374,12 @@ def test_url_requests(self):
> > +             ("topic?key=3Ddef", "Pydoc: KEYWORD def"),
> > +             ("topic?key=3DSTRINGS", "Pydoc: TOPIC STRINGS"),
> > +             ("foobar", "Pydoc: Error - foobar"),
> > +-            ("getfile?key=3Dfoobar", "Pydoc: Error -
> getfile?key=3Dfoobar"),
> > +             ]
> > +
> > +         with self.restrict_walk_packages():
> > +             for url, title in requests:
> > +                 self.call_url_handler(url, title)
> > +
> > +-            path =3D string.__file__
> > +-            title =3D "Pydoc: getfile " + path
> > +-            url =3D "getfile?key=3D" + path
> > +-            self.call_url_handler(url, title)
> > +-
> > +
> > + class TestHelper(unittest.TestCase):
> > +     def test_keywords(self):
> > +diff --git
> a/Misc/NEWS.d/next/Security/2021-03-24-14-16-56.bpo-42988.P2aNco.rst
> b/Misc/NEWS.d/next/Security/2021-03-24-14-16-56.bpo-42988.P2aNco.rst
> > +new file mode 100644
> > +index 0000000000..4b42dd0530
> > +--- /dev/null
> > ++++ b/Misc/NEWS.d/next/Security/2021-03-24-14-16-56.bpo-42988.P2aNco.=
rst
> > +@@ -0,0 +1,4 @@
> > ++CVE-2021-3426: Remove the ``getfile`` feature of the :mod:`pydoc`
> module which
> > ++could be abused to read arbitrary files on the disk (directory
> traversal
> > ++vulnerability). Moreover, even source code of Python modules can
> contain
> > ++sensitive data like passwords. Vulnerability reported by David
> Schw=C3=83=C2=B6rer.
> > +--
> > +2.17.1
> > +
> > diff --git a/meta/recipes-devtools/python/python3_3.8.2.bb
> b/meta/recipes-devtools/python/python3_3.8.2.bb
> > index 072ce97472..cbeb599705 100644
> > --- a/meta/recipes-devtools/python/python3_3.8.2.bb
> > +++ b/meta/recipes-devtools/python/python3_3.8.2.bb
> > @@ -39,6 +39,7 @@ SRC_URI =3D "
> http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
> >             file://CVE-2020-26116.patch \
> >             file://CVE-2020-27619.patch \
> >             file://CVE-2021-3177.patch \
> > +           file://CVE-2021-3426.patch \
> >             "
> >
> >  SRC_URI_append_class-native =3D " \
> > --
> > 2.24.3 (Apple Git-128)
> >
> >
> >
> >
>
>=20
>
>

--000000000000798b4705c549eabf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 21, 2021 at 9:07 AM Steve=
 Sakoman &lt;<a href=3D"mailto:steve@sakoman.com">steve@sakoman.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Thanks f=
or the patch!<br>
<br>
I&#39;m going to wait a bit on merging this because we are evaluating<br>
doing a series of bug fix version bumps for python.=C2=A0 If successful<br=
>
this CVE would be among those fixed by the version bumps.<br>
<br></blockquote><div>=C2=A0<a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/153147">https://lists.openembedded.org/g/openembedd=
ed-core/message/153147</a></div><div><br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
Steve<br>
<br>
On Mon, Jun 21, 2021 at 4:49 AM Minjae Kim &lt;<a href=3D"mailto:flowergom=
@gmail.com" target=3D"_blank">flowergom@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Remove the pydoc getfile feature<br>
&gt;<br>
&gt; CVE-2021-3426: Remove the &quot;getfile&quot; feature of the pydoc mo=
dule which<br>
&gt; could be abused to read arbitrary files on the disk (directory<br>
&gt; traversal vulnerability). Moreover, even source code of Python<br>
&gt; modules can contain sensitive data like passwords. Vulnerability<br>
&gt; reported by David Schw=C3=83=C2=B6rer.<br>
&gt;<br>
&gt; reference:<br>
&gt; <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2021-3426" rel=3D"nor=
eferrer" target=3D"_blank">https://nvd.nist.gov/vuln/detail/CVE-2021-3426</=
a><br>
&gt; <a href=3D"https://github.com/python/cpython/pull/25015/commits/dc958=
0949cc82c51022a882ba43dad937ff929a8" rel=3D"noreferrer" target=3D"_blank">h=
ttps://github.com/python/cpython/pull/25015/commits/dc9580949cc82c51022a882=
ba43dad937ff929a8</a><br>
&gt; ---<br>
&gt;=C2=A0 .../python/python3/CVE-2021-3426.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 105 ++++++++++++++++++<br>
&gt;=C2=A0 meta/recipes-devtools/python/<a href=3D"http://python3_3.8.2.bb=
" rel=3D"noreferrer" target=3D"_blank">python3_3.8.2.bb</a> |=C2=A0 =C2=A01=
 +<br>
&gt;=C2=A0 2 files changed, 106 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-devtools/python/python3/CVE-202=
1-3426.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/python/python3/CVE-2021-3426.patch=
 b/meta/recipes-devtools/python/python3/CVE-2021-3426.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..68bd7d9296<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/python/python3/CVE-2021-3426.patch<br>
&gt; @@ -0,0 +1,105 @@<br>
&gt; +From 9b999479c0022edfc9835a8a1f06e046f3881048 Mon Sep 17 00:00:00 20=
01<br>
&gt; +From: Victor Stinner &lt;<a href=3D"mailto:vstinner@python.org" targ=
et=3D"_blank">vstinner@python.org</a>&gt;<br>
&gt; +Date: Mon, 29 Mar 2021 14:40:40 +0200<br>
&gt; +Subject: [PATCH] bpo-42988: Remove the pydoc getfile feature (GH-250=
15)<br>
&gt; +MIME-Version: 1.0<br>
&gt; +Content-Type: text/plain; charset=3DUTF-8<br>
&gt; +Content-Transfer-Encoding: 8bit<br>
&gt; +<br>
&gt; +CVE-2021-3426: Remove the &quot;getfile&quot; feature of the pydoc m=
odule which<br>
&gt; +could be abused to read arbitrary files on the disk (directory<br>
&gt; +traversal vulnerability). Moreover, even source code of Python<br>
&gt; +modules can contain sensitive data like passwords. Vulnerability<br>
&gt; +reported by David Schw=C3=83=C2=B6rer.<br>
&gt; +<br>
&gt; +Upstream-Status: Acepted<br>
&gt; +[<a href=3D"https://github.com/python/cpython/pull/25015/commits/dc9=
580949cc82c51022a882ba43dad937ff929a8" rel=3D"noreferrer" target=3D"_blank"=
>https://github.com/python/cpython/pull/25015/commits/dc9580949cc82c51022a8=
82ba43dad937ff929a8</a>]<br>
&gt; +CVE: CVE-2021-3426<br>
&gt; +Signed-off-by: Minjae Kim &lt;<a href=3D"mailto:flowergom@gmail.com"=
 target=3D"_blank">flowergom@gmail.com</a>&gt;<br>
&gt; +<br>
&gt; +---<br>
&gt; + Lib/pydoc.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 18 =
------------------<br>
&gt; + Lib/test/test_pydoc.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 ------<br>
&gt; + .../2021-03-24-14-16-56.bpo-42988.P2aNco.rst=C2=A0 =C2=A0|=C2=A0 4 =
++++<br>
&gt; + 3 files changed, 4 insertions(+), 24 deletions(-)<br>
&gt; + create mode 100644 Misc/NEWS.d/next/Security/2021-03-24-14-16-56.bp=
o-42988.P2aNco.rst<br>
&gt; +<br>
&gt; +diff --git a/Lib/pydoc.py b/Lib/pydoc.py<br>
&gt; +index 282a917998..753ea97ba0 100755<br>
&gt; +--- a/Lib/pydoc.py<br>
&gt; ++++ b/Lib/pydoc.py<br>
&gt; +@@ -2456,9 +2456,6 @@ def page(self, title, contents):<br>
&gt; + %s&lt;/head&gt;&lt;body bgcolor=3D&quot;#f0f0f8&quot;&gt;%s&lt;div =
style=3D&quot;clear:both;padding-top:.5em;&quot;&gt;%s&lt;/div&gt;<br>
&gt; + &lt;/body&gt;&lt;/html&gt;&#39;&#39;&#39; % (title, css_link, html_=
navbar(), contents)<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 def filelink(self, url, path):<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;&lt;a href=3D=
&quot;getfile?key=3D%s&quot;&gt;%s&lt;/a&gt;&#39; % (url, path)<br>
&gt; +-<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0html =3D _HTMLDoc()<br>
&gt; +<br>
&gt; +@@ -2544,19 +2541,6 @@ def bltinlink(name):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;key =3D %s&#39;=
 % key, &#39;#ffffff&#39;, &#39;#ee77aa&#39;, &#39;&lt;br&gt;&#39;.join(res=
ults))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return &#39;Search Results&#39;, c=
ontents<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 def html_getfile(path):<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Get and display a sou=
rce file listing safely.&quot;&quot;&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 path =3D urllib.parse.unquote(path)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 with tokenize.open(path) as fp:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lines =3D html.escape(fp.=
read())<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 body =3D &#39;&lt;pre&gt;%s&lt;/pre&gt;=
&#39; % lines<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 heading =3D html.heading(<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;&lt;big&gt;&lt;big&g=
t;&lt;strong&gt;File Listing&lt;/strong&gt;&lt;/big&gt;&lt;/big&gt;&#39;,<b=
r>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;#ffffff&#39;, &#39;#=
7799ee&#39;)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 contents =3D heading + html.bigsection(=
<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;File: %s&#39; % path=
, &#39;#ffffff&#39;, &#39;#ee77aa&#39;, body)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;getfile %s&#39; % path, con=
tents<br>
&gt; +-<br>
&gt; +=C2=A0 =C2=A0 =C2=A0def html_topics():<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;Index of topic t=
exts available.&quot;&quot;&quot;<br>
&gt; +<br>
&gt; +@@ -2648,8 +2632,6 @@ def get_html_page(url):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0op, _,=
 url =3D url.partition(&#39;=3D&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if op =
=
=3D=3D &quot;search?key&quot;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0title, content =3D html_search(url)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif op =3D=
=
=3D &quot;getfile?key&quot;:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 title, content =3D html_getfile(url)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif o=
p =3D=3D &quot;topic?key&quot;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0# try topics first, then objects.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0try:<br>
&gt; +diff --git a/Lib/test/test_pydoc.py b/Lib/test/test_pydoc.py<br>
&gt; +index 2f502627f4..3bc0e9e6b5 100644<br>
&gt; +--- a/Lib/test/test_pydoc.py<br>
&gt; ++++ b/Lib/test/test_pydoc.py<br>
&gt; +@@ -1374,18 +1374,12 @@ def test_url_requests(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(&quot;topic?key=3Dd=
ef&quot;, &quot;Pydoc: KEYWORD def&quot;),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(&quot;topic?key=3DS=
TRINGS&quot;, &quot;Pydoc: TOPIC STRINGS&quot;),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(&quot;foobar&quot;,=
 &quot;Pydoc: Error - foobar&quot;),<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (&quot;getfile?key=3Dfoob=
ar&quot;, &quot;Pydoc: Error - getfile?key=3Dfoobar&quot;),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0]<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with self.restrict_walk_packages()=
:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for url, title in re=
quests:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.c=
all_url_handler(url, title)<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 path =3D string.__file__<=
br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 title =3D &quot;Pydoc: ge=
tfile &quot; + path<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 url =3D &quot;getfile?key=
=
=3D&quot; + path<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.call_url_handler(url=
, title)<br>
&gt; +-<br>
&gt; +<br>
&gt; + class TestHelper(unittest.TestCase):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0def test_keywords(self):<br>
&gt; +diff --git a/Misc/NEWS.d/next/Security/2021-03-24-14-16-56.bpo-42988=
.P2aNco.rst b/Misc/NEWS.d/next/Security/2021-03-24-14-16-56.bpo-42988.P2aNc=
o.rst<br>
&gt; +new file mode 100644<br>
&gt; +index 0000000000..4b42dd0530<br>
&gt; +--- /dev/null<br>
&gt; ++++ b/Misc/NEWS.d/next/Security/2021-03-24-14-16-56.bpo-42988.P2aNco=
.rst<br>
&gt; +@@ -0,0 +1,4 @@<br>
&gt; ++CVE-2021-3426: Remove the ``getfile`` feature of the :mod:`pydoc` m=
odule which<br>
&gt; ++could be abused to read arbitrary files on the disk (directory trav=
ersal<br>
&gt; ++vulnerability). Moreover, even source code of Python modules can co=
ntain<br>
&gt; ++sensitive data like passwords. Vulnerability reported by David Schw=
=
=C3=83=C2=B6rer.<br>
&gt; +--<br>
&gt; +2.17.1<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3_3=
.8.2.bb" rel=3D"noreferrer" target=3D"_blank">python3_3.8.2.bb</a> b/meta/r=
ecipes-devtools/python/<a href=3D"http://python3_3.8.2.bb" rel=3D"noreferre=
r" target=3D"_blank">python3_3.8.2.bb</a><br>
&gt; index 072ce97472..cbeb599705 100644<br>
&gt; --- a/meta/recipes-devtools/python/<a href=3D"http://python3_3.8.2.bb=
" rel=3D"noreferrer" target=3D"_blank">python3_3.8.2.bb</a><br>
&gt; +++ b/meta/recipes-devtools/python/<a href=3D"http://python3_3.8.2.bb=
" rel=3D"noreferrer" target=3D"_blank">python3_3.8.2.bb</a><br>
&gt; @@ -39,6 +39,7 @@ SRC_URI =3D &quot;<a href=3D"http://www.python.org/=
ftp/python/$%7BPV%7D/Python-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"=
_blank">http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz</a> \<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2020-26116.=
patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2020-27619.=
patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2021-3177.p=
atch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2021-3426.patch =
\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI_append_class-native =3D &quot; \<br>
&gt; --<br>
&gt; 2.24.3 (Apple Git-128)<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
<br>
<br>
</blockquote></div></div>

--000000000000798b4705c549eabf--
