Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f174.google.com (mail-ie0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id DD7CA6CFF9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2013 22:52:09 +0000 (UTC)
Received: by mail-ie0-f174.google.com with SMTP id qd12so326697ieb.19
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2013 15:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=XuqdPERvsM3wq6nuO82dErsZtw0E1y7otgJLDRzeLM0=;
	b=Ml1gvscgb21KfS2EUdlb96X7/sDShe3an9YCI7BuL3pAyVuFDsPIkg1ruleycA2vTl
	M9abashiTQaix0jdbjibTDa1L211EKjwRZh/RhIDU4xTJ/1Qy/wNgBtktCQs5LVj1FJE
	pYrBwCvKtoZ9gHO8PeaHcMJz7PhQNfjzEgEQ9KjphMP2S5qMXdculrA/0WfH82wzI24w
	Q4FSBZLpqaetArkOuUwKrE9QD5KqFN2TnTK+OlEcQbcSai2cfXDNphvZyfNiSgR+HYj1
	2b7q1ulOxfukZL9Tk6b/72NYWbiRvCxZVUExWUihrq/9fy+vUn3Ih9M0E9SRuqeyiRjt
	OYVg==
MIME-Version: 1.0
X-Received: by 10.42.189.201 with SMTP id df9mr319736icb.54.1382395931657;
	Mon, 21 Oct 2013 15:52:11 -0700 (PDT)
Received: by 10.50.5.225 with HTTP; Mon, 21 Oct 2013 15:52:11 -0700 (PDT)
In-Reply-To: <1382360321-37920-1-git-send-email-maxin.john@enea.com>
References: <1382360321-37920-1-git-send-email-maxin.john@enea.com>
Date: Mon, 21 Oct 2013 15:52:11 -0700
Message-ID: <CAMKF1sqtbX9iKkKHv8gZu9zqZzKjbFvadpFSro4JB9k+_CAzcg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: "maxin.john@enea.com" <maxin.john@enea.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pigz: bump to 2.3.1
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
X-List-Received-Date: Mon, 21 Oct 2013 22:52:10 -0000
Content-Type: multipart/alternative; boundary=20cf303bfb1e720e9a04e94822e5

--20cf303bfb1e720e9a04e94822e5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Monday, October 21, 2013,  <maxin.john@enea.com> wrote:
> From: "Maxin B. John" <maxin.john@enea.com>
>
> Update pigz to latest release - 2.3.1
> Drop ldflags.patch as it has been merged upstream
>
> Signed-off-by: Maxin B. John <maxin.john@enea.com>
> ---
looks ok althouh
git format-patch -M would have detected renaming a bit better inturn making
it easier to review it

>  meta/recipes-extended/pigz/files/ldflags.patch |   19 ------------------=
-
>  meta/recipes-extended/pigz/pigz.inc            |    5 ++---
>  meta/recipes-extended/pigz/pigz_2.3.1.bb       |   10 ++++++++++
>  meta/recipes-extended/pigz/pigz_2.3.bb         |   10 ----------
>  4 files changed, 12 insertions(+), 32 deletions(-)
>  delete mode 100644 meta/recipes-extended/pigz/files/ldflags.patch
>  create mode 100644 meta/recipes-extended/pigz/pigz_2.3.1.bb
>  delete mode 100644 meta/recipes-extended/pigz/pigz_2.3.bb
>
> diff --git a/meta/recipes-extended/pigz/files/ldflags.patch
b/meta/recipes-extended/pigz/files/ldflags.patch
> deleted file mode 100644
> index 8e531cc..0000000
> --- a/meta/recipes-extended/pigz/files/ldflags.patch
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -Link using the bitbake LDFLAGS.
> -
> -Signed-off-by: Bj=C3=B6rn Stenberg <bjst@enea.com>
> -
> -Upstream-Status: Pending
> -
> -Index: pigz-2.3/Makefile
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- pigz-2.3.orig/Makefile
> -+++ pigz-2.3/Makefile
> -@@ -3,7 +3,7 @@ CFLAGS=3D-O3 -Wall -Wextra
> -
> -
> - pigz: pigz.o yarn.o zopfli/deflate.o zopfli/blocksplitter.o
zopfli/tree.o zopfli/lz77.o zopfli/cache.o zopfli/hash.o zopfli/util.o
zopfli/squeeze.o zopfli/katajainen.o
> --      $(CC) -o pigz $^ -lpthread -lz
> -+      $(CC) ${LDFLAGS} -o pigz $^ -lpthread -lz -lm
> -       ln -f pigz unpigz
> -
> - pigz.o: pigz.c yarn.h zopfli/deflate.h zopfli/util.h
> diff --git a/meta/recipes-extended/pigz/pigz.inc
b/meta/recipes-extended/pigz/pigz.inc
> index 5ceaef2..984f9ea 100644
> --- a/meta/recipes-extended/pigz/pigz.inc
> +++ b/meta/recipes-extended/pigz/pigz.inc
> @@ -7,10 +7,9 @@ HOMEPAGE =3D "http://zlib.net/pigz/"
>  SECTION =3D "console/utils"
>  LICENSE =3D "Zlib"
>
> -PR =3D "r1"
> +PR =3D "r0"
>
> -SRC_URI =3D "http://zlib.net/pigz/pigz-${PV}.tar.gz \
> -           file://ldflags.patch"
> +SRC_URI =3D "http://zlib.net/pigz/pigz-${PV}.tar.gz"
>
>  PROVIDES_class-native +=3D "gzip-native"
>
> diff --git a/meta/recipes-extended/pigz/pigz_2.3.1.bbb/meta/recipes-exten=
ded/pigz/
pigz_2.3.1.bb
> new file mode 100644
> index 0000000..6e7c7f1
> --- /dev/null
> +++ b/meta/recipes-extended/pigz/pigz_2.3.1.bb
> @@ -0,0 +1,10 @@
> +require pigz.inc
> +LIC_FILES_CHKSUM =3D
"file://pigz.c;beginline=3D7;endline=3D21;md5=3Da21d4075cb00ab4ca17fce5e753=
4ca95"
> +
> +SRC_URI[md5sum] =3D "e803f8bc0770c7a5e96dccb1d2dd2aab"
> +SRC_URI[sha256sum] =3D
"629b0ce5422a3978f31742bf8275d0be2f84987140d18f390f1e3b4e46e0af54"
> +
> +NATIVE_PACKAGE_PATH_SUFFIX =3D "/${PN}"
> +
> +BBCLASSEXTEND =3D "native"
> +
> diff --git a/meta/recipes-extended/pigz/pigz_2.3.bbb/meta/recipes-extende=
d/pigz/
pigz_2.3.bb
> deleted file mode 100644
> index 724d00b..0000000
> --- a/meta/recipes-extended/pigz/pigz_2.3.bb
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -require pigz.inc
> -LIC_FILES_CHKSUM =3D
"file://pigz.c;beginline=3D7;endline=3D21;md5=3Da21d4075cb00ab4ca17fce5e753=
4ca95"
> -
> -SRC_URI[md5sum] =3D "042e3322534f2c3d761736350cac303f"
> -SRC_URI[sha256sum] =3D
"74bbd5962f9420549fc987ddd1ccda692ec2b29d2d612fbbe26edf3fa348ff21"
> -
> -NATIVE_PACKAGE_PATH_SUFFIX =3D "/${PN}"
> -
> -BBCLASSEXTEND =3D "native"
> -
> --
> 1.7.10.4
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--20cf303bfb1e720e9a04e94822e5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Monday, October 21, 2013, =C2=A0&lt;<a href=3D"mailto:maxin.john=
@enea.com">maxin.john@enea.com</a>&gt; wrote:<br>&gt; From: &quot;Maxin B. =
John&quot; &lt;<a href=3D"mailto:maxin.john@enea.com">maxin.john@enea.com</=
a>&gt;<br>
&gt;<br>&gt; Update pigz to latest release - 2.3.1<br>&gt; Drop ldflags.pat=
ch as it has been merged upstream<br>&gt;<br>&gt; Signed-off-by: Maxin B. J=
ohn &lt;<a href=3D"mailto:maxin.john@enea.com">maxin.john@enea.com</a>&gt;<=
br>
&gt; ---<br>looks ok althouh<br>git format-patch -M would have detected ren=
aming a bit better inturn making it easier to review it<br><br>&gt; =C2=A0m=
eta/recipes-extended/pigz/files/ldflags.patch | =C2=A0 19 -----------------=
--<br>
&gt; =C2=A0meta/recipes-extended/pigz/pigz.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| =C2=A0 =C2=A05 ++---<br>&gt; =C2=A0meta/recipes-extended/pig=
z/<a href=3D"http://pigz_2.3.1.bb">pigz_2.3.1.bb</a> =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0 10 ++++++++++<br>&gt; =C2=A0meta/recipes-extended/pigz/<a href=3D"h=
ttp://pigz_2.3.bb">pigz_2.3.bb</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 10 =
----------<br>
&gt; =C2=A04 files changed, 12 insertions(+), 32 deletions(-)<br>&gt; =C2=
=A0delete mode 100644 meta/recipes-extended/pigz/files/ldflags.patch<br>&gt=
; =C2=A0create mode 100644 meta/recipes-extended/pigz/<a href=3D"http://pig=
z_2.3.1.bb">pigz_2.3.1.bb</a><br>
&gt; =C2=A0delete mode 100644 meta/recipes-extended/pigz/<a href=3D"http://=
pigz_2.3.bb">pigz_2.3.bb</a><br>&gt;<br>&gt; diff --git a/meta/recipes-exte=
nded/pigz/files/ldflags.patch b/meta/recipes-extended/pigz/files/ldflags.pa=
tch<br>
&gt; deleted file mode 100644<br>&gt; index 8e531cc..0000000<br>&gt; --- a/=
meta/recipes-extended/pigz/files/ldflags.patch<br>&gt; +++ /dev/null<br>&gt=
; @@ -1,19 +0,0 @@<br>&gt; -Link using the bitbake LDFLAGS.<br>&gt; -<br>
&gt; -Signed-off-by: Bj=C3=B6rn Stenberg &lt;<a href=3D"mailto:bjst@enea.co=
m">bjst@enea.com</a>&gt;<br>&gt; -<br>&gt; -Upstream-Status: Pending<br>&gt=
; -<br>&gt; -Index: pigz-2.3/Makefile<br>&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ---- pigz-2.3.orig/Makefile<br>&gt; -+++ pigz-2.3/Makefile<br>&gt; -@@=
 -3,7 +3,7 @@ CFLAGS=3D-O3 -Wall -Wextra<br>&gt; -<br>&gt; -<br>&gt; - pigz=
: pigz.o yarn.o zopfli/deflate.o zopfli/blocksplitter.o zopfli/tree.o zopfl=
i/lz77.o zopfli/cache.o zopfli/hash.o zopfli/util.o zopfli/squeeze.o zopfli=
/katajainen.o<br>
&gt; -- =C2=A0 =C2=A0 =C2=A0$(CC) -o pigz $^ -lpthread -lz<br>&gt; -+ =C2=
=A0 =C2=A0 =C2=A0$(CC) ${LDFLAGS} -o pigz $^ -lpthread -lz -lm<br>&gt; - =
=C2=A0 =C2=A0 =C2=A0 ln -f pigz unpigz<br>&gt; -<br>&gt; - pigz.o: pigz.c y=
arn.h zopfli/deflate.h zopfli/util.h<br>&gt; diff --git a/meta/recipes-exte=
nded/pigz/pigz.inc b/meta/recipes-extended/pigz/pigz.inc<br>
&gt; index 5ceaef2..984f9ea 100644<br>&gt; --- a/meta/recipes-extended/pigz=
/pigz.inc<br>&gt; +++ b/meta/recipes-extended/pigz/pigz.inc<br>&gt; @@ -7,1=
0 +7,9 @@ HOMEPAGE =3D &quot;<a href=3D"http://zlib.net/pigz/">http://zlib.=
net/pigz/</a>&quot;<br>
&gt; =C2=A0SECTION =3D &quot;console/utils&quot;<br>&gt; =C2=A0LICENSE =3D =
&quot;Zlib&quot;<br>&gt;<br>&gt; -PR =3D &quot;r1&quot;<br>&gt; +PR =3D &qu=
ot;r0&quot;<br>&gt;<br>&gt; -SRC_URI =3D &quot;<a href=3D"http://zlib.net/p=
igz/pigz-${PV}.tar.gz">http://zlib.net/pigz/pigz-${PV}.tar.gz</a> \<br>
&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://ldflags.patch&quot;<br>&gt=
; +SRC_URI =3D &quot;<a href=3D"http://zlib.net/pigz/pigz-${PV}.tar.gz">htt=
p://zlib.net/pigz/pigz-${PV}.tar.gz</a>&quot;<br>&gt;<br>&gt; =C2=A0PROVIDE=
S_class-native +=3D &quot;gzip-native&quot;<br>
&gt;<br>&gt; diff --git a/meta/recipes-extended/pigz/<a href=3D"http://pigz=
_2.3.1.bb">pigz_2.3.1.bb</a> b/meta/recipes-extended/pigz/<a href=3D"http:/=
/pigz_2.3.1.bb">pigz_2.3.1.bb</a><br>&gt; new file mode 100644<br>&gt; inde=
x 0000000..6e7c7f1<br>
&gt; --- /dev/null<br>&gt; +++ b/meta/recipes-extended/pigz/<a href=3D"http=
://pigz_2.3.1.bb">pigz_2.3.1.bb</a><br>&gt; @@ -0,0 +1,10 @@<br>&gt; +requi=
re pigz.inc<br>&gt; +LIC_FILES_CHKSUM =3D &quot;file://pigz.c;beginline=3D7=
;endline=3D21;md5=3Da21d4075cb00ab4ca17fce5e7534ca95&quot;<br>
&gt; +<br>&gt; +SRC_URI[md5sum] =3D &quot;e803f8bc0770c7a5e96dccb1d2dd2aab&=
quot;<br>&gt; +SRC_URI[sha256sum] =3D &quot;629b0ce5422a3978f31742bf8275d0b=
e2f84987140d18f390f1e3b4e46e0af54&quot;<br>&gt; +<br>&gt; +NATIVE_PACKAGE_P=
ATH_SUFFIX =3D &quot;/${PN}&quot;<br>
&gt; +<br>&gt; +BBCLASSEXTEND =3D &quot;native&quot;<br>&gt; +<br>&gt; diff=
 --git a/meta/recipes-extended/pigz/<a href=3D"http://pigz_2.3.bb">pigz_2.3=
.bb</a> b/meta/recipes-extended/pigz/<a href=3D"http://pigz_2.3.bb">pigz_2.=
3.bb</a><br>
&gt; deleted file mode 100644<br>&gt; index 724d00b..0000000<br>&gt; --- a/=
meta/recipes-extended/pigz/<a href=3D"http://pigz_2.3.bb">pigz_2.3.bb</a><b=
r>&gt; +++ /dev/null<br>&gt; @@ -1,10 +0,0 @@<br>&gt; -require pigz.inc<br>
&gt; -LIC_FILES_CHKSUM =3D &quot;file://pigz.c;beginline=3D7;endline=3D21;m=
d5=3Da21d4075cb00ab4ca17fce5e7534ca95&quot;<br>&gt; -<br>&gt; -SRC_URI[md5s=
um] =3D &quot;042e3322534f2c3d761736350cac303f&quot;<br>&gt; -SRC_URI[sha25=
6sum] =3D &quot;74bbd5962f9420549fc987ddd1ccda692ec2b29d2d612fbbe26edf3fa34=
8ff21&quot;<br>
&gt; -<br>&gt; -NATIVE_PACKAGE_PATH_SUFFIX =3D &quot;/${PN}&quot;<br>&gt; -=
<br>&gt; -BBCLASSEXTEND =3D &quot;native&quot;<br>&gt; -<br>&gt; --<br>&gt;=
 1.7.10.4<br>&gt;<br>&gt; _______________________________________________<b=
r>
&gt; Openembedded-core mailing list<br>&gt; <a href=3D"mailto:Openembedded-=
core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a><b=
r>&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedd=
ed-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</=
a><br>
&gt;

--20cf303bfb1e720e9a04e94822e5--
