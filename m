Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id E0EBE71BEE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2019 05:38:26 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id p26so14037210edr.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2019 22:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=VBXssOHTwKykrKEeCSPFK8LSy1xLwzwgHQTLDcSKwVA=;
	b=DJrkpjKYQasquecHynUbHtg04gFzSgepJFXskmZWENojG4bXZ6Hu6crOUHBDTWPmc4
	WprmetCHF7MNOD2Zsyj9xSImgYu7C7WGMHaYwQTd1eXlHG5lm1k9xe7doiDpAoRZZvz/
	wYd5jDIhO3kUedNWcd4f6j6EdcdTuKFs7ON68EoAYXOg3eJYXO8DKBv3twojl7OX0mxf
	X0hkCGqEntB8i5ltMlNGXsdST5+yNfd3YY0/D2RQF4UTyCYSotmi9daxVMKcR3JyyrcO
	J+wCgcI8P31Huse4RbPdURYYaPzYMTfS09DMs10DnHiw1hUnpVtwHS1Z2ZFHh/ivZXWY
	ONGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=VBXssOHTwKykrKEeCSPFK8LSy1xLwzwgHQTLDcSKwVA=;
	b=H9HCLoGTl52rfXxl6hXKLHXFP/sUwAFkiR7WdwqFWv45FyyBMO9y7+MDKk6fNI3fD7
	/EKX56Dg0fRS4jter3bjVtYSYc+GRyXqB3u38yd9aIr3/2l7HylViKrBRzs1OXH9G+5N
	KpCj45nl4R0UjLkVj9KtjGdacwCYa3aMG1STVyyDRf0pESnAefj7u6wmXLhZQZN7zqE2
	N5qVoPVCJFfeZFfxJx4pHDzQtTgkPyCtigh9oZALHFDOxR1MBBdvdgO7MDsdbicHvQ29
	gYjK13h4Hdji34lnwE1inogBGnJcu9x0VF2WI0j8dfOFj1uLLl2/877QmNZTwWjlcjUi
	10fA==
X-Gm-Message-State: APjAAAVfV4m1V8Veg+HiIaFibEwooxdYjKWD9vliw+qA88wf5qgc5Hs7
	edlBrsICLyRcNMMn3HSsND8A0SQAADt/WYCFZGI=
X-Google-Smtp-Source: APXvYqzhcrt0D9a7QCOc1RMUt+YszUb4WA/sd3R6Im7py/4X/L1l50BaWMOpge9dPZbJMQ50DpeOAHtVd3NnDeo0NPA=
X-Received: by 2002:a50:95d3:: with SMTP id x19mr33031471eda.98.1560231507454; 
	Mon, 10 Jun 2019 22:38:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190611015756.19184-1-douglas.royds@taitradio.com>
In-Reply-To: <20190611015756.19184-1-douglas.royds@taitradio.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 11 Jun 2019 07:38:16 +0200
Message-ID: <CA+chaQe2EcjdXMd3m8DuoXD7NkOC8ek=YXay73pCTQS38peLGQ@mail.gmail.com>
To: Douglas Royds <douglas.royds@taitradio.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] json-c: update to current upstream head, with --disable-werror
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
X-List-Received-Date: Tue, 11 Jun 2019 05:38:27 -0000
Content-Type: multipart/alternative; boundary="000000000000c4ef2c058b05b4d4"

--000000000000c4ef2c058b05b4d4
Content-Type: text/plain; charset="UTF-8"

Also the version went from 0.13.2 to 1.0 which doesn't match with the
sources. Don't forget to set PV when migrating recipes to use git fetcher.

On Tue, Jun 11, 2019 at 3:58 AM Douglas Royds via Openembedded-core <
openembedded-core@lists.openembedded.org> wrote:

> Upstream json-c haven't made a release since March 2018.
> Adopt the current HEAD revision, pulling it directly from git.
>
> icecc preprocesses source files locally before shipping them off to be
> compiled
> on remote hosts. This preprocessing removes comments, including /*
> fallthough */
> comments in switch statements that normally prevent an implicit-fallthrough
> warning, see https://github.com/icecc/icecream/issues/419
>
> Rather than turning off -Werror by patching configure.ac, the upstream
> project
> has implemented a configure option, --disable-werror, in response to Ross's
> https://github.com/json-c/json-c/issues/489
>
> Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
> ---
>  meta/recipes-devtools/json-c/json-c_0.13.1.bb | 30 -------------------
>  meta/recipes-devtools/json-c/json-c_git.bb    | 19 ++++++++++++
>  2 files changed, 19 insertions(+), 30 deletions(-)
>  delete mode 100644 meta/recipes-devtools/json-c/json-c_0.13.1.bb
>  create mode 100644 meta/recipes-devtools/json-c/json-c_git.bb
>
> diff --git a/meta/recipes-devtools/json-c/json-c_0.13.1.bb
> b/meta/recipes-devtools/json-c/json-c_0.13.1.bb
> deleted file mode 100644
> index 5b10e68297..0000000000
> --- a/meta/recipes-devtools/json-c/json-c_0.13.1.bb
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -SUMMARY = "C bindings for apps which will manipulate JSON data"
> -DESCRIPTION = "JSON-C implements a reference counting object model that
> allows you to easily construct JSON objects in C."
> -HOMEPAGE = "https://github.com/json-c/json-c/wiki"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=de54b60fbbc35123ba193fea8ee216f2"
> -
> -SRC_URI = "https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.gz
> "
> -SRC_URI[md5sum] = "04969ad59cc37bddd83741a08b98f350"
> -SRC_URI[sha256sum] =
> "b87e608d4d3f7bfdd36ef78d56d53c74e66ab278d318b71e6002a369d36f4873"
> -
> -UPSTREAM_CHECK_REGEX = "json-c-(?P<pver>\d+(\.\d+)+).tar"
> -# json-c releases page is fetching the list of releases in some weird XML
> format
> -# from https://s3.amazonaws.com/json-c_releases and processes it with
> javascript :-/
> -#UPSTREAM_CHECK_URI = "
> https://s3.amazonaws.com/json-c_releases/releases/index.html"
> -RECIPE_UPSTREAM_VERSION = "0.13.1"
> -RECIPE_UPSTREAM_DATE = "Mar 04, 2018"
> -CHECK_DATE = "May 02, 2018"
> -
> -RPROVIDES_${PN} = "libjson"
> -
> -inherit autotools
> -
> -EXTRA_OECONF = "--enable-rdrand"
> -
> -do_configure_prepend() {
> -    # Clean up autoconf cruft that should not be in the tarball
> -    rm -f ${S}/config.status
> -}
> -
> -BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta/recipes-devtools/json-c/json-c_git.bb
> b/meta/recipes-devtools/json-c/json-c_git.bb
> new file mode 100644
> index 0000000000..07daa5ba11
> --- /dev/null
> +++ b/meta/recipes-devtools/json-c/json-c_git.bb
> @@ -0,0 +1,19 @@
> +SUMMARY = "C bindings for apps which will manipulate JSON data"
> +DESCRIPTION = "JSON-C implements a reference counting object model that
> allows you to easily construct JSON objects in C."
> +HOMEPAGE = "https://github.com/json-c/json-c/wiki"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=de54b60fbbc35123ba193fea8ee216f2"
> +
> +SRC_URI = "git://github.com/json-c/json-c.git"
> +SRCREV = "07ea04e65193c3e5c902c5b79421d5fa48ff67c7"
> +S = "${WORKDIR}/git"
> +
> +RPROVIDES_${PN} = "libjson"
> +
> +inherit autotools
> +
> +EXTRA_OECONF = "--disable-werror \
> +                --enable-rdrand \
> +                "
> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000c4ef2c058b05b4d4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Also the version went from 0.13.2 to 1.0 which doesn&#39;t=
 match with the sources. Don&#39;t forget to set PV when migrating recipes =
to use git fetcher.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Tue, Jun 11, 2019 at 3:58 AM Douglas Royds via Openem=
bedded-core &lt;<a href=3D"mailto:openembedded-core@lists.openembedded.org"=
>openembedded-core@lists.openembedded.org</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">Upstream json-c haven&#39;t made a=
 release since March 2018.<br>
Adopt the current HEAD revision, pulling it directly from git.<br>
<br>
icecc preprocesses source files locally before shipping them off to be comp=
iled<br>
on remote hosts. This preprocessing removes comments, including /* fallthou=
gh */<br>
comments in switch statements that normally prevent an implicit-fallthrough=
<br>
warning, see <a href=3D"https://github.com/icecc/icecream/issues/419" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/icecc/icecream/issues/=
419</a><br>
<br>
Rather than turning off -Werror by patching <a href=3D"http://configure.ac"=
 rel=3D"noreferrer" target=3D"_blank">configure.ac</a>, the upstream projec=
t<br>
has implemented a configure option, --disable-werror, in response to Ross&#=
39;s<br>
<a href=3D"https://github.com/json-c/json-c/issues/489" rel=3D"noreferrer" =
target=3D"_blank">https://github.com/json-c/json-c/issues/489</a><br>
<br>
Signed-off-by: Douglas Royds &lt;<a href=3D"mailto:douglas.royds@taitradio.=
com" target=3D"_blank">douglas.royds@taitradio.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/json-c/<a href=3D"http://json-c_0.13.1.bb" rel=
=3D"noreferrer" target=3D"_blank">json-c_0.13.1.bb</a> | 30 ---------------=
----<br>
=C2=A0meta/recipes-devtools/json-c/<a href=3D"http://json-c_git.bb" rel=3D"=
noreferrer" target=3D"_blank">json-c_git.bb</a>=C2=A0 =C2=A0 | 19 +++++++++=
+++<br>
=C2=A02 files changed, 19 insertions(+), 30 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-devtools/json-c/<a href=3D"http://jso=
n-c_0.13.1.bb" rel=3D"noreferrer" target=3D"_blank">json-c_0.13.1.bb</a><br=
>
=C2=A0create mode 100644 meta/recipes-devtools/json-c/<a href=3D"http://jso=
n-c_git.bb" rel=3D"noreferrer" target=3D"_blank">json-c_git.bb</a><br>
<br>
diff --git a/meta/recipes-devtools/json-c/<a href=3D"http://json-c_0.13.1.b=
b" rel=3D"noreferrer" target=3D"_blank">json-c_0.13.1.bb</a> b/meta/recipes=
-devtools/json-c/<a href=3D"http://json-c_0.13.1.bb" rel=3D"noreferrer" tar=
get=3D"_blank">json-c_0.13.1.bb</a><br>
deleted file mode 100644<br>
index 5b10e68297..0000000000<br>
--- a/meta/recipes-devtools/json-c/<a href=3D"http://json-c_0.13.1.bb" rel=
=3D"noreferrer" target=3D"_blank">json-c_0.13.1.bb</a><br>
+++ /dev/null<br>
@@ -1,30 +0,0 @@<br>
-SUMMARY =3D &quot;C bindings for apps which will manipulate JSON data&quot=
;<br>
-DESCRIPTION =3D &quot;JSON-C implements a reference counting object model =
that allows you to easily construct JSON objects in C.&quot;<br>
-HOMEPAGE =3D &quot;<a href=3D"https://github.com/json-c/json-c/wiki" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/json-c/json-c/wiki</a>=
&quot;<br>
-LICENSE =3D &quot;MIT&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dde54b60fbbc35123ba193fea8e=
e216f2&quot;<br>
-<br>
-SRC_URI =3D &quot;<a href=3D"https://s3.amazonaws.com/json-c_releases/rele=
ases/$%7BBP%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">https://s3.amaz=
onaws.com/json-c_releases/releases/${BP}.tar.gz</a>&quot;<br>
-SRC_URI[md5sum] =3D &quot;04969ad59cc37bddd83741a08b98f350&quot;<br>
-SRC_URI[sha256sum] =3D &quot;b87e608d4d3f7bfdd36ef78d56d53c74e66ab278d318b=
71e6002a369d36f4873&quot;<br>
-<br>
-UPSTREAM_CHECK_REGEX =3D &quot;json-c-(?P&lt;pver&gt;\d+(\.\d+)+).tar&quot=
;<br>
-# json-c releases page is fetching the list of releases in some weird XML =
format<br>
-# from <a href=3D"https://s3.amazonaws.com/json-c_releases" rel=3D"norefer=
rer" target=3D"_blank">https://s3.amazonaws.com/json-c_releases</a> and pro=
cesses it with javascript :-/<br>
-#UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://s3.amazonaws.com/json-c_r=
eleases/releases/index.html" rel=3D"noreferrer" target=3D"_blank">https://s=
3.amazonaws.com/json-c_releases/releases/index.html</a>&quot;<br>
-RECIPE_UPSTREAM_VERSION =3D &quot;0.13.1&quot;<br>
-RECIPE_UPSTREAM_DATE =3D &quot;Mar 04, 2018&quot;<br>
-CHECK_DATE =3D &quot;May 02, 2018&quot;<br>
-<br>
-RPROVIDES_${PN} =3D &quot;libjson&quot;<br>
-<br>
-inherit autotools<br>
-<br>
-EXTRA_OECONF =3D &quot;--enable-rdrand&quot;<br>
-<br>
-do_configure_prepend() {<br>
-=C2=A0 =C2=A0 # Clean up autoconf cruft that should not be in the tarball<=
br>
-=C2=A0 =C2=A0 rm -f ${S}/config.status<br>
-}<br>
-<br>
-BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
diff --git a/meta/recipes-devtools/json-c/<a href=3D"http://json-c_git.bb" =
rel=3D"noreferrer" target=3D"_blank">json-c_git.bb</a> b/meta/recipes-devto=
ols/json-c/<a href=3D"http://json-c_git.bb" rel=3D"noreferrer" target=3D"_b=
lank">json-c_git.bb</a><br>
new file mode 100644<br>
index 0000000000..07daa5ba11<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/json-c/<a href=3D"http://json-c_git.bb" rel=3D"=
noreferrer" target=3D"_blank">json-c_git.bb</a><br>
@@ -0,0 +1,19 @@<br>
+SUMMARY =3D &quot;C bindings for apps which will manipulate JSON data&quot=
;<br>
+DESCRIPTION =3D &quot;JSON-C implements a reference counting object model =
that allows you to easily construct JSON objects in C.&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/json-c/json-c/wiki" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/json-c/json-c/wiki</a>=
&quot;<br>
+LICENSE =3D &quot;MIT&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dde54b60fbbc35123ba193fea8e=
e216f2&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/json-c/json-c.git" re=
l=3D"noreferrer" target=3D"_blank">github.com/json-c/json-c.git</a>&quot;<b=
r>
+SRCREV =3D &quot;07ea04e65193c3e5c902c5b79421d5fa48ff67c7&quot;<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+RPROVIDES_${PN} =3D &quot;libjson&quot;<br>
+<br>
+inherit autotools<br>
+<br>
+EXTRA_OECONF =3D &quot;--disable-werror \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --enable-rdrand \<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
+<br>
+BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
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

--000000000000c4ef2c058b05b4d4--
