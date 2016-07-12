Return-Path: <bounce+8e2b5a.3a5685-openembedded-core=lists.openembedded.org@asterius.io>
Received: from mail4.static.mgsend.net (mail4.static.mgsend.net
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id 5FE01731A9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 03:31:10 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1468294270; h=Content-Type: To: Subject: Message-ID: Date:
	From: References: In-Reply-To: MIME-Version: Sender;
	bh=EfQByfdZJ43D/pzdc8OjrXTuKhA4TZ4oCibBrATUVJc=;
	b=ZnrWDt3hqcmaWpEneRfjF9T80ikP7l+4hnMKhPTm1ANtSUZWr7qRM+N9ErZaZ/QXeK7pFRQp
	qMI5iVRhftQ8iuijGL3APDWOdjQfN5r0iRbla7bnzrCP35Cm5YYkqgTmh2Zq2U0KyDakXdKD
	kV+Q0hHfaW+xKG3yW1NkEGCcIWw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=asterius.io; s=mailo;
	q=dns; h=Sender: MIME-Version: In-Reply-To: References: From: Date:
	Message-ID: Subject: To: Content-Type;
	b=Tkp0SyUv3TCSrJUlt9DmDBC7061IDK6v6Gi10/i3DiNZt9pxfY44fT7LeKzXNpJBTcE7D6
	pJ1Lq1ZYAxrL7RZ63KjEUM5tEDDevClqjEF/icdla6idqpVqTkmvBXtR1XZjCbUagYzdFosL
	U8GCyFiYPif04M267AmUSLuA3NDKQ=
Sender: derek@asterius.io
X-Mailgun-Sid: WyJiMTQwMSIsICJvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIiwgIjNhNTY4NSJd
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com
	[209.85.214.48])
	by mxa.mailgun.org with ESMTP id 5784647e.7f7e740c7470-in02;
	Tue, 12 Jul 2016 03:31:10 -0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id f6so5130240ith.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2016 20:31:10 -0700 (PDT)
X-Gm-Message-State: ALyK8tJOXPQtEt22+T5fUqVdbfYbxgN2Utscv2Ty29h9gYT6Qii/eBNGQY9tcrLTayPNJ102pPxMkpe03yYFWQ==
X-Received: by 10.36.155.68 with SMTP id o65mr457198itd.96.1468294270174; Mon,
	11 Jul 2016 20:31:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.178.215 with HTTP; Mon, 11 Jul 2016 20:31:09 -0700 (PDT)
In-Reply-To: <1468260322-693-1-git-send-email-derek@asterius.io>
References: <1468260322-693-1-git-send-email-derek@asterius.io>
From: Derek Straka <derek@asterius.io>
Date: Mon, 11 Jul 2016 23:31:09 -0400
X-Gmail-Original-Message-ID: <CADNbA1rRGnZjkjbaz=UTFe5tY=bB_X1O_tKPhMCvyrpxkJW31g@mail.gmail.com>
Message-ID: <CADNbA1rRGnZjkjbaz=UTFe5tY=bB_X1O_tKPhMCvyrpxkJW31g@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] python3: update manifest RDEPENDS for importlib and compression packages
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
X-List-Received-Date: Tue, 12 Jul 2016 03:31:11 -0000
Content-Type: multipart/alternative; boundary=94eb2c05f4986651a4053767e6d2

--94eb2c05f4986651a4053767e6d2
Content-Type: text/plain; charset=UTF-8

In going through the meta-python RDEPENDS for the python3 packages, I've
found a fair number of modules/files missing from the expected packages
that have fallen through to -misc (compression libs, crypt items, etc).
I'm planning on taking a stab at getting the -misc items placed in their
appropriate places unless someone else is already working this.  I'll
resubmit another patch set pull request since that will be a bit more in
depth than what is in this patch set.  Thanks.

-Derek

On Mon, Jul 11, 2016 at 2:05 PM, Derek Straka <derek@asterius.io> wrote:

> zipfile.py has dependencies on importlib, threading, and shell
> importlib has a dependency on lang
> operator and contextlib added to the lang package instead of falling into
> misc
>
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  meta/recipes-devtools/python/python-3.5-manifest.inc | 6 +++---
>  scripts/contrib/python/generate-manifest-3.5.py      | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/meta/recipes-devtools/python/python-3.5-manifest.inc
> b/meta/recipes-devtools/python/python-3.5-manifest.inc
> index b14d567..8de6f03 100644
> --- a/meta/recipes-devtools/python/python-3.5-manifest.inc
> +++ b/meta/recipes-devtools/python/python-3.5-manifest.inc
> @@ -30,7 +30,7 @@ RDEPENDS_${PN}-compile="${PN}-core"
>  FILES_${PN}-compile="${libdir}/python3.5/py_compile.*
> ${libdir}/python3.5/compileall.* "
>
>  SUMMARY_${PN}-compression="Python high-level compression support"
> -RDEPENDS_${PN}-compression="${PN}-core ${PN}-codecs"
> +RDEPENDS_${PN}-compression="${PN}-core ${PN}-codecs ${PN}-importlib
> ${PN}-threading ${PN}-shell"
>  FILES_${PN}-compression="${libdir}/python3.5/gzip.*
> ${libdir}/python3.5/zipfile.* ${libdir}/python3.5/tarfile.*
> ${libdir}/python3.5/lib-dynload/bz2.*.so "
>
>  SUMMARY_${PN}-core="Python interpreter and core modules"
> @@ -106,7 +106,7 @@ RDEPENDS_${PN}-image="${PN}-core"
>  FILES_${PN}-image="${libdir}/python3.5/colorsys.*
> ${libdir}/python3.5/imghdr.* ${libdir}/python3.5/lib-dynload/imageop.*.so
> ${libdir}/python3.5/lib-dynload/rgbimg.*.so "
>
>  SUMMARY_${PN}-importlib="Python import implementation library"
> -RDEPENDS_${PN}-importlib="${PN}-core"
> +RDEPENDS_${PN}-importlib="${PN}-core ${PN}-lang"
>  FILES_${PN}-importlib="${libdir}/python3.5/importlib "
>
>  SUMMARY_${PN}-io="Python low-level I/O"
> @@ -119,7 +119,7 @@ FILES_${PN}-json="${libdir}/python3.5/json
> ${libdir}/python3.5/lib-dynload/_json
>
>  SUMMARY_${PN}-lang="Python low-level language support"
>  RDEPENDS_${PN}-lang="${PN}-core"
> -FILES_${PN}-lang="${libdir}/python3.5/lib-dynload/_bisect.*.so
> ${libdir}/python3.5/lib-dynload/_collections.*.so
> ${libdir}/python3.5/lib-dynload/_heapq.*.so
> ${libdir}/python3.5/lib-dynload/_weakref.*.so
> ${libdir}/python3.5/lib-dynload/_functools.*.so
> ${libdir}/python3.5/lib-dynload/array.*.so
> ${libdir}/python3.5/lib-dynload/itertools.*.so
> ${libdir}/python3.5/lib-dynload/operator.*.so
> ${libdir}/python3.5/lib-dynload/parser.*.so ${libdir}/python3.5/atexit.*
> ${libdir}/python3.5/bisect.* ${libdir}/python3.5/code.*
> ${libdir}/python3.5/codeop.* ${libdir}/python3.5/collections.*
> ${libdir}/python3.5/_collections_abc.* ${libdir}/python3.5/dis.*
> ${libdir}/python3.5/functools.* ${libdir}/python3.5/heapq.*
> ${libdir}/python3.5/inspect.* ${libdir}/python3.5/keyword.*
> ${libdir}/python3.5/opcode.* ${libdir}/python3.5/symbol.*
> ${libdir}/python3.5/repr.* ${libdir}/python3.5/token.*
> ${libdir}/python3.5/tokenize.* ${libdir}/python3.5/traceback.*
> ${libdir}/python3.5/weakref.* "
> +FILES_${PN}-lang="${libdir}/python3.5/lib-dynload/_bisect.*.so
> ${libdir}/python3.5/lib-dynload/_collections.*.so
> ${libdir}/python3.5/lib-dynload/_heapq.*.so
> ${libdir}/python3.5/lib-dynload/_weakref.*.so
> ${libdir}/python3.5/lib-dynload/_functools.*.so
> ${libdir}/python3.5/lib-dynload/array.*.so
> ${libdir}/python3.5/lib-dynload/itertools.*.so
> ${libdir}/python3.5/lib-dynload/operator.*.so
> ${libdir}/python3.5/lib-dynload/parser.*.so ${libdir}/python3.5/atexit.*
> ${libdir}/python3.5/bisect.* ${libdir}/python3.5/code.*
> ${libdir}/python3.5/codeop.* ${libdir}/python3.5/collections.*
> ${libdir}/python3.5/_collections_abc.* ${libdir}/python3.5/contextlib.*
> ${libdir}/python3.5/dis.* ${libdir}/python3.5/functools.*
> ${libdir}/python3.5/heapq.* ${libdir}/python3.5/inspect.*
> ${libdir}/python3.5/keyword.* ${libdir}/python3.5/opcode.*
> ${libdir}/python3.5/operator.* ${libdir}/python3.5/symbol.*
> ${libdir}/python3.5/repr.* ${libdir}/python3.5/token.*
> ${libdir}/python3.5/tokenize.* ${libdir}/python3.5/traceback.*
> ${libdir}/python3.5/weakref.* "
>
>  SUMMARY_${PN}-logging="Python logging support"
>  RDEPENDS_${PN}-logging="${PN}-core ${PN}-io ${PN}-lang ${PN}-pickle
> ${PN}-stringold"
> diff --git a/scripts/contrib/python/generate-manifest-3.5.py
> b/scripts/contrib/python/generate-manifest-3.5.py
> index e04da1d..775f0c2 100755
> --- a/scripts/contrib/python/generate-manifest-3.5.py
> +++ b/scripts/contrib/python/generate-manifest-3.5.py
> @@ -217,7 +217,7 @@ if __name__ == "__main__":
>      m.addPackage( "${PN}-compile", "Python bytecode compilation support",
> "${PN}-core",
>      "py_compile.* compileall.*" )
>
> -    m.addPackage( "${PN}-compression", "Python high-level compression
> support", "${PN}-core ${PN}-codecs",
> +    m.addPackage( "${PN}-compression", "Python high-level compression
> support", "${PN}-core ${PN}-codecs ${PN}-importlib ${PN}-threading
> ${PN}-shell",
>      "gzip.* zipfile.* tarfile.* lib-dynload/bz2.*.so" )
>
>      m.addPackage( "${PN}-crypt", "Python basic cryptographic and hashing
> support", "${PN}-core",
> @@ -262,7 +262,7 @@ if __name__ == "__main__":
>      m.addPackage( "${PN}-html", "Python HTML processing support",
> "${PN}-core",
>      "formatter.* htmlentitydefs.* htmllib.* markupbase.* sgmllib.*
> HTMLParser.* " )
>
> -    m.addPackage( "${PN}-importlib", "Python import implementation
> library", "${PN}-core",
> +    m.addPackage( "${PN}-importlib", "Python import implementation
> library", "${PN}-core ${PN}-lang",
>      "importlib" )
>
>      m.addPackage( "${PN}-gdbm", "Python GNU database support",
> "${PN}-core",
> @@ -281,7 +281,7 @@ if __name__ == "__main__":
>      m.addPackage( "${PN}-lang", "Python low-level language support",
> "${PN}-core",
>      "lib-dynload/_bisect.*.so lib-dynload/_collections.*.so
> lib-dynload/_heapq.*.so lib-dynload/_weakref.*.so
> lib-dynload/_functools.*.so " +
>      "lib-dynload/array.*.so lib-dynload/itertools.*.so
> lib-dynload/operator.*.so lib-dynload/parser.*.so " +
> -    "atexit.* bisect.* code.* codeop.* collections.* _collections_abc.*
> dis.* functools.* heapq.* inspect.* keyword.* opcode.* symbol.* repr.*
> token.* " +
> +    "atexit.* bisect.* code.* codeop.* collections.* _collections_abc.*
> contextlib.* dis.* functools.* heapq.* inspect.* keyword.* opcode.*
> operator.* symbol.* repr.* token.* " +
>      "tokenize.* traceback.* weakref.*" )
>
>      m.addPackage( "${PN}-logging", "Python logging support", "${PN}-core
> ${PN}-io ${PN}-lang ${PN}-pickle ${PN}-stringold",
> --
> 1.9.1
>
>

--94eb2c05f4986651a4053767e6d2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">In going through the meta-python RDEPENDS for the python3 =
packages, I&#39;ve found a fair number of modules/files missing from the ex=
pected packages that have fallen through to -misc (compression libs, crypt =
items, etc).=C2=A0 I&#39;m planning on taking a stab at getting the -misc i=
tems placed in their appropriate places unless someone else is already work=
ing this.=C2=A0 I&#39;ll resubmit another patch set pull request since that=
 will be a bit more in depth than what is in this patch set.=C2=A0 Thanks.<=
div><br></div><div>-Derek=C2=A0</div></div><div class=3D"gmail_extra"><br><=
div class=3D"gmail_quote">On Mon, Jul 11, 2016 at 2:05 PM, Derek Straka <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:derek@asterius.io" target=3D"_blank">d=
erek@asterius.io</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">zi=
pfile.py has dependencies on importlib, threading, and shell<br>
importlib has a dependency on lang<br>
operator and contextlib added to the lang package instead of falling into m=
isc<br>
<span class=3D""><br>
Signed-off-by: Derek Straka &lt;<a href=3D"mailto:derek@asterius.io">derek@=
asterius.io</a>&gt;<br>
---<br>
</span>=C2=A0meta/recipes-devtools/python/python-3.5-manifest.inc | 6 +++--=
-<br>
=C2=A0scripts/contrib/python/<a href=3D"http://generate-manifest-3.5.py" re=
l=3D"noreferrer" target=3D"_blank">generate-manifest-3.5.py</a>=C2=A0 =C2=
=A0 =C2=A0 | 6 +++---<br>
=C2=A02 files changed, 6 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/meta/recipes-devtools/python/python-3.5-manifest.inc b/meta/re=
cipes-devtools/python/python-3.5-manifest.inc<br>
index b14d567..8de6f03 100644<br>
<span class=3D"">--- a/meta/recipes-devtools/python/python-3.5-manifest.inc=
<br>
+++ b/meta/recipes-devtools/python/python-3.5-manifest.inc<br>
@@ -30,7 +30,7 @@ RDEPENDS_${PN}-compile=3D&quot;${PN}-core&quot;<br>
=C2=A0FILES_${PN}-compile=3D&quot;${libdir}/python3.5/py_compile.* ${libdir=
}/python3.5/compileall.* &quot;<br>
<br>
=C2=A0SUMMARY_${PN}-compression=3D&quot;Python high-level compression suppo=
rt&quot;<br>
-RDEPENDS_${PN}-compression=3D&quot;${PN}-core ${PN}-codecs&quot;<br>
</span>+RDEPENDS_${PN}-compression=3D&quot;${PN}-core ${PN}-codecs ${PN}-im=
portlib ${PN}-threading ${PN}-shell&quot;<br>
<span class=3D"">=C2=A0FILES_${PN}-compression=3D&quot;${libdir}/python3.5/=
gzip.* ${libdir}/python3.5/zipfile.* ${libdir}/python3.5/tarfile.* ${libdir=
}/python3.5/lib-dynload/bz2.*.so &quot;<br>
<br>
=C2=A0SUMMARY_${PN}-core=3D&quot;Python interpreter and core modules&quot;<=
br>
@@ -106,7 +106,7 @@ RDEPENDS_${PN}-image=3D&quot;${PN}-core&quot;<br>
</span>=C2=A0FILES_${PN}-image=3D&quot;${libdir}/python3.5/colorsys.* ${lib=
dir}/python3.5/imghdr.* ${libdir}/python3.5/lib-dynload/imageop.*.so ${libd=
ir}/python3.5/lib-dynload/rgbimg.*.so &quot;<br>
<span class=3D""><br>
=C2=A0SUMMARY_${PN}-importlib=3D&quot;Python import implementation library&=
quot;<br>
-RDEPENDS_${PN}-importlib=3D&quot;${PN}-core&quot;<br>
</span>+RDEPENDS_${PN}-importlib=3D&quot;${PN}-core ${PN}-lang&quot;<br>
<span class=3D"">=C2=A0FILES_${PN}-importlib=3D&quot;${libdir}/python3.5/im=
portlib &quot;<br>
<br>
</span><span class=3D"">=C2=A0SUMMARY_${PN}-io=3D&quot;Python low-level I/O=
&quot;<br>
</span>@@ -119,7 +119,7 @@ FILES_${PN}-json=3D&quot;${libdir}/python3.5/jso=
n ${libdir}/python3.5/lib-dynload/_json<br>
<br>
=C2=A0SUMMARY_${PN}-lang=3D&quot;Python low-level language support&quot;<br=
>
=C2=A0RDEPENDS_${PN}-lang=3D&quot;${PN}-core&quot;<br>
-FILES_${PN}-lang=3D&quot;${libdir}/python3.5/lib-dynload/_bisect.*.so ${li=
bdir}/python3.5/lib-dynload/_collections.*.so ${libdir}/python3.5/lib-dynlo=
ad/_heapq.*.so ${libdir}/python3.5/lib-dynload/_weakref.*.so ${libdir}/pyth=
on3.5/lib-dynload/_functools.*.so ${libdir}/python3.5/lib-dynload/array.*.s=
o ${libdir}/python3.5/lib-dynload/itertools.*.so ${libdir}/python3.5/lib-dy=
nload/operator.*.so ${libdir}/python3.5/lib-dynload/parser.*.so ${libdir}/p=
ython3.5/atexit.* ${libdir}/python3.5/bisect.* ${libdir}/python3.5/code.* $=
{libdir}/python3.5/codeop.* ${libdir}/python3.5/collections.* ${libdir}/pyt=
hon3.5/_collections_abc.* ${libdir}/python3.5/dis.* ${libdir}/python3.5/fun=
ctools.* ${libdir}/python3.5/heapq.* ${libdir}/python3.5/inspect.* ${libdir=
}/python3.5/keyword.* ${libdir}/python3.5/opcode.* ${libdir}/python3.5/symb=
ol.* ${libdir}/python3.5/repr.* ${libdir}/python3.5/token.* ${libdir}/pytho=
n3.5/tokenize.* ${libdir}/python3.5/traceback.* ${libdir}/python3.5/weakref=
.* &quot;<br>
+FILES_${PN}-lang=3D&quot;${libdir}/python3.5/lib-dynload/_bisect.*.so ${li=
bdir}/python3.5/lib-dynload/_collections.*.so ${libdir}/python3.5/lib-dynlo=
ad/_heapq.*.so ${libdir}/python3.5/lib-dynload/_weakref.*.so ${libdir}/pyth=
on3.5/lib-dynload/_functools.*.so ${libdir}/python3.5/lib-dynload/array.*.s=
o ${libdir}/python3.5/lib-dynload/itertools.*.so ${libdir}/python3.5/lib-dy=
nload/operator.*.so ${libdir}/python3.5/lib-dynload/parser.*.so ${libdir}/p=
ython3.5/atexit.* ${libdir}/python3.5/bisect.* ${libdir}/python3.5/code.* $=
{libdir}/python3.5/codeop.* ${libdir}/python3.5/collections.* ${libdir}/pyt=
hon3.5/_collections_abc.* ${libdir}/python3.5/contextlib.* ${libdir}/python=
3.5/dis.* ${libdir}/python3.5/functools.* ${libdir}/python3.5/heapq.* ${lib=
dir}/python3.5/inspect.* ${libdir}/python3.5/keyword.* ${libdir}/python3.5/=
opcode.* ${libdir}/python3.5/operator.* ${libdir}/python3.5/symbol.* ${libd=
ir}/python3.5/repr.* ${libdir}/python3.5/token.* ${libdir}/python3.5/tokeni=
ze.* ${libdir}/python3.5/traceback.* ${libdir}/python3.5/weakref.* &quot;<b=
r>
<br>
=C2=A0SUMMARY_${PN}-logging=3D&quot;Python logging support&quot;<br>
=C2=A0RDEPENDS_${PN}-logging=3D&quot;${PN}-core ${PN}-io ${PN}-lang ${PN}-p=
ickle ${PN}-stringold&quot;<br>
diff --git a/scripts/contrib/python/<a href=3D"http://generate-manifest-3.5=
.py" rel=3D"noreferrer" target=3D"_blank">generate-manifest-3.5.py</a> b/sc=
ripts/contrib/python/<a href=3D"http://generate-manifest-3.5.py" rel=3D"nor=
eferrer" target=3D"_blank">generate-manifest-3.5.py</a><br>
index e04da1d..775f0c2 100755<br>
<span class=3D"">--- a/scripts/contrib/python/<a href=3D"http://generate-ma=
nifest-3.5.py" rel=3D"noreferrer" target=3D"_blank">generate-manifest-3.5.p=
y</a><br>
+++ b/scripts/contrib/python/<a href=3D"http://generate-manifest-3.5.py" re=
l=3D"noreferrer" target=3D"_blank">generate-manifest-3.5.py</a><br>
@@ -217,7 +217,7 @@ if __name__ =3D=3D &quot;__main__&quot;:<br>
=C2=A0 =C2=A0 =C2=A0m.addPackage( &quot;${PN}-compile&quot;, &quot;Python b=
ytecode compilation support&quot;, &quot;${PN}-core&quot;,<br>
=C2=A0 =C2=A0 =C2=A0&quot;py_compile.* compileall.*&quot; )<br>
<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-compression&quot;, &quot;Python hi=
gh-level compression support&quot;, &quot;${PN}-core ${PN}-codecs&quot;,<br=
>
</span>+=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-compression&quot;, &quot;Py=
thon high-level compression support&quot;, &quot;${PN}-core ${PN}-codecs ${=
PN}-importlib ${PN}-threading ${PN}-shell&quot;,<br>
<span class=3D"">=C2=A0 =C2=A0 =C2=A0&quot;gzip.* zipfile.* tarfile.* lib-d=
ynload/bz2.*.so&quot; )<br>
<br>
=C2=A0 =C2=A0 =C2=A0m.addPackage( &quot;${PN}-crypt&quot;, &quot;Python bas=
ic cryptographic and hashing support&quot;, &quot;${PN}-core&quot;,<br>
@@ -262,7 +262,7 @@ if __name__ =3D=3D &quot;__main__&quot;:<br>
=C2=A0 =C2=A0 =C2=A0m.addPackage( &quot;${PN}-html&quot;, &quot;Python HTML=
 processing support&quot;, &quot;${PN}-core&quot;,<br>
=C2=A0 =C2=A0 =C2=A0&quot;formatter.* htmlentitydefs.* htmllib.* markupbase=
.* sgmllib.* HTMLParser.* &quot; )<br>
<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-importlib&quot;, &quot;Python impo=
rt implementation library&quot;, &quot;${PN}-core&quot;,<br>
</span>+=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-importlib&quot;, &quot;Pyth=
on import implementation library&quot;, &quot;${PN}-core ${PN}-lang&quot;,<=
br>
<span class=3D"">=C2=A0 =C2=A0 =C2=A0&quot;importlib&quot; )<br>
<br>
=C2=A0 =C2=A0 =C2=A0m.addPackage( &quot;${PN}-gdbm&quot;, &quot;Python GNU =
database support&quot;, &quot;${PN}-core&quot;,<br>
</span>@@ -281,7 +281,7 @@ if __name__ =3D=3D &quot;__main__&quot;:<br>
=C2=A0 =C2=A0 =C2=A0m.addPackage( &quot;${PN}-lang&quot;, &quot;Python low-=
level language support&quot;, &quot;${PN}-core&quot;,<br>
=C2=A0 =C2=A0 =C2=A0&quot;lib-dynload/_bisect.*.so lib-dynload/_collections=
.*.so lib-dynload/_heapq.*.so lib-dynload/_weakref.*.so lib-dynload/_functo=
ols.*.so &quot; +<br>
=C2=A0 =C2=A0 =C2=A0&quot;lib-dynload/array.*.so lib-dynload/itertools.*.so=
 lib-dynload/operator.*.so lib-dynload/parser.*.so &quot; +<br>
-=C2=A0 =C2=A0 &quot;atexit.* bisect.* code.* codeop.* collections.* _colle=
ctions_abc.* dis.* functools.* heapq.* inspect.* keyword.* opcode.* symbol.=
* repr.* token.* &quot; +<br>
+=C2=A0 =C2=A0 &quot;atexit.* bisect.* code.* codeop.* collections.* _colle=
ctions_abc.* contextlib.* dis.* functools.* heapq.* inspect.* keyword.* opc=
ode.* operator.* symbol.* repr.* token.* &quot; +<br>
=C2=A0 =C2=A0 =C2=A0&quot;tokenize.* traceback.* weakref.*&quot; )<br>
<br>
=C2=A0 =C2=A0 =C2=A0m.addPackage( &quot;${PN}-logging&quot;, &quot;Python l=
ogging support&quot;, &quot;${PN}-core ${PN}-io ${PN}-lang ${PN}-pickle ${P=
N}-stringold&quot;,<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.1<br>
<br>
</font></span></blockquote></div><br></div>

--94eb2c05f4986651a4053767e6d2--
