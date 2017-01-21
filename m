Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 3974C771EA
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jan 2017 00:13:13 +0000 (UTC)
Received: by mail-qk0-f170.google.com with SMTP id s140so25901622qke.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 16:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Aa3h4WaQIYNiyz5dXSToKNdTrvSUkzdRl08YJ6/9H0I=;
	b=py+Z28J83M4atfYaYpADKtllr6g+jP19xKGLQMO8w4lepP0Q8wQ0KzfCK0HXJFiEZp
	sGVZjimTPB0kiKZK4ZNtu8TmF9EuekMVsOdZYA1wyaWKWCAksr5P6g5K4fnKwH1AuVG+
	ClnwjuJBoh6ohjbb1yC+cFbbvaL3V9W5xuvwVhI0sMhzQv35UKl5AKXfpbWjsx+et1lo
	JtV7BLQMBkyuFZKIe4g84QWid+UD7kawECsyeHf9RRIReLInbhI8DSE0SvRhfCST/TPP
	8ddL8z2vgGmai9gVgqj7wQA6akZAsY9r/u+fQGnwQFtfpvmOvTMp+ADUaOcUSX9PT9E5
	PEeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Aa3h4WaQIYNiyz5dXSToKNdTrvSUkzdRl08YJ6/9H0I=;
	b=sqI7Nm1PwRFUNKVRMWouaFY2tEFyD/880paERtqhNLdNYaVl3iuqOtLzUf6qmkZafb
	qVV+ROtjXna9f6Bxa/7ODWcu/sAlJh/YitKtouu/kNNrQcUitNYOqPT3qjJrmBnrb3Kt
	UabHmnUCWwiUYQOZ3LztzRQ1ULC1ouW5c1m7qi6s1jtzNKfsdE/D/Ne0LKunSzuQlzKR
	0Zi1M62wKPFzKNOEbT8yMjgYQ9sLV4Br0pN0AM9TybQ//1QVK+dhZuukpYhQWRmqKv+I
	GNVpFMlTET5gvQGr/KLn629W53uQWlc5dO+qnkWxBi/wI5BqN/jSyGiB3IN/Cujb7tFC
	W7Nw==
X-Gm-Message-State: AIkVDXJcwUHAsL3bRstsXolGFsu4HdDtMJmfsdzhu+pWukoXyeWm1dTFU6yClNvTixO1MkQ6G/WuWw6ZJ0nUUbER
X-Received: by 10.55.16.11 with SMTP id a11mr15600848qkh.3.1484957593996; Fri,
	20 Jan 2017 16:13:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Fri, 20 Jan 2017 16:12:53 -0800 (PST)
In-Reply-To: <1484917866-24351-1-git-send-email-schnitzeltony@googlemail.com>
References: <1484917866-24351-1-git-send-email-schnitzeltony@googlemail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 21 Jan 2017 00:12:53 +0000
Message-ID: <CAJTo0LbjMd+wJtgGePXRTy7YZVBb4rfr69jhcfeawiUGAYLrCQ@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] alsa-lib: update 1.1.2 -> 1.1.3
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
X-List-Received-Date: Sat, 21 Jan 2017 00:13:14 -0000
Content-Type: multipart/alternative; boundary=001a11475cbce5c55f05468fa182

--001a11475cbce5c55f05468fa182
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

For some reason the autobuilder is having a meltdown with this error
message:

Computing transaction...warning: Can't install
alsa-lib-dev-1.1.3-r0.0@core2_32: Can't install
alsa-lib-dev-1.1.3-r0.0@core2_32: no package provides alsa-lib =3D 1.1.3-r0=
.0

I'm guessing a new file sneaked into the build which changes library names,
or something?  If you can get a moment to compare buildhistory-diff with
1.1.2 and 1.1.3 then that would be much appreciated.  I'll have a look
later, but right now I'm going to bed.. :)

Ross

On 20 January 2017 at 13:11, Andreas M=C3=BCller <schnitzeltony@googlemail.=
com>
wrote:

> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  .../alsa-lib/0001-ucm-parser-needs-limits.h.patch  | 33
> ++++++++++++++++++++++
>  .../alsa/{alsa-lib_1.1.2.bb =3D> alsa-lib_1.1.3.bb}  |  5 ++--
>  2 files changed, 36 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/0001-ucm-parser=
-
> needs-limits.h.patch
>  rename meta/recipes-multimedia/alsa/{alsa-lib_1.1.2.bb =3D>
> alsa-lib_1.1.3.bb} (87%)
>
> diff --git a/meta/recipes-multimedia/alsa/alsa-lib/0001-ucm-parser-needs-=
limits.h.patch
> b/meta/recipes-multimedia/alsa/alsa-lib/0001-ucm-parser-
> needs-limits.h.patch
> new file mode 100644
> index 0000000..9d464f4
> --- /dev/null
> +++ b/meta/recipes-multimedia/alsa/alsa-lib/0001-ucm-parser-
> needs-limits.h.patch
> @@ -0,0 +1,33 @@
> +From 9ed4075f05a4242f32331f7f2c365767970f5003 Mon Sep 17 00:00:00 2001
> +From: Gustavo Zacarias <gustavo@zacarias.com.ar>
> +Date: Wed, 21 Dec 2016 19:46:34 -0300
> +Subject: [PATCH] ucm: parser needs limits.h
> +
> +It's using PATH_MAX which is defined there, otherwise the build fails on
> +musl libc.
> +
> +Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> +Signed-off-by: Takashi Iwai <tiwai@suse.de>
> +
> +Upstream-Status: Backport [1]
> +
> +[1] http://git.alsa-project.org/?p=3Dalsa-lib.git;a=3Dcommit;h=3D
> 9ed4075f05a4242f32331f7f2c365767970f5003
> +---
> + src/ucm/parser.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/src/ucm/parser.c b/src/ucm/parser.c
> +index c98373a..f520abc 100644
> +--- a/src/ucm/parser.c
> ++++ b/src/ucm/parser.c
> +@@ -32,6 +32,7 @@
> +
> + #include "ucm_local.h"
> + #include <dirent.h>
> ++#include <limits.h>
> +
> + /** The name of the environment variable containing the UCM directory *=
/
> + #define ALSA_CONFIG_UCM_VAR "ALSA_CONFIG_UCM"
> +--
> +2.7.4
> +
> diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.1.2.bb
> b/meta/recipes-multimedia/alsa/alsa-lib_1.1.3.bb
> similarity index 87%
> rename from meta/recipes-multimedia/alsa/alsa-lib_1.1.2.bb
> rename to meta/recipes-multimedia/alsa/alsa-lib_1.1.3.bb
> index e313da7..9a8a167 100644
> --- a/meta/recipes-multimedia/alsa/alsa-lib_1.1.2.bb
> +++ b/meta/recipes-multimedia/alsa/alsa-lib_1.1.3.bb
> @@ -11,9 +11,10 @@ BBCLASSEXTEND =3D "native nativesdk"
>  SRC_URI =3D "ftp://ftp.alsa-project.org/pub/lib/${BP}.tar.bz2 \
>             file://Check-if-wordexp-function-is-supported.patch \
>             file://avoid-including-sys-poll.h-directly.patch \
> +           file://0001-ucm-parser-needs-limits.h.patch \
>  "
> -SRC_URI[md5sum] =3D "1946e6438b8262a7b8fdadacd0e06ba7"
> -SRC_URI[sha256sum] =3D "d38dacd9892b06b8bff04923c380b3
> 8fb2e379ee5538935ff37e45b395d861d6"
> +SRC_URI[md5sum] =3D "eefe5992567ba00d6110a540657aaf5c"
> +SRC_URI[sha256sum] =3D "71282502184c592c1a008e256c22ed
> 0ba5728ca65e05273ceb480c70f515969c"
>
>  inherit autotools pkgconfig
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11475cbce5c55f05468fa182
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">For some reason the autobuilder is having a meltdown with =
this error message:<br><br>Computing transaction...warning: Can&#39;t insta=
ll alsa-lib-dev-1.1.3-r0.0@core2_32: Can&#39;t install alsa-lib-dev-1.1.3-r=
0.0@core2_32: no package provides alsa-lib =3D 1.1.3-r0.0<br><br><div>I&#39=
;m guessing a new file sneaked into the build which changes library names, =
or something?=C2=A0 If you can get a moment to compare buildhistory-diff wi=
th 1.1.2 and 1.1.3 then that would be much appreciated.=C2=A0 I&#39;ll have=
 a look later, but right now I&#39;m going to bed.. :)</div><div><br></div>=
<div>Ross</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 20 January 2017 at 13:11, Andreas M=C3=BCller <span dir=3D"ltr">&lt;=
<a href=3D"mailto:schnitzeltony@googlemail.com" target=3D"_blank">schnitzel=
tony@googlemail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>Signed-off-by: Andreas M=C3=BCller &lt;<a href=3D"mailto:schnitzeltony@goo=
glemail.com">schnitzeltony@googlemail.com</a>&gt;<br>
---<br>
=C2=A0.../alsa-lib/0001-ucm-parser-<wbr>needs-limits.h.patch=C2=A0 | 33 +++=
+++++++++++++++++++<br>
=C2=A0.../alsa/{<a href=3D"http://alsa-lib_1.1.2.bb" rel=3D"noreferrer" tar=
get=3D"_blank">alsa-lib_1.1.2.bb</a> =3D&gt; <a href=3D"http://alsa-lib_1.1=
.3.bb" rel=3D"noreferrer" target=3D"_blank">alsa-lib_1.1.3.bb</a>}=C2=A0 |=
=C2=A0 5 ++--<br>
=C2=A02 files changed, 36 insertions(+), 2 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-multimedia/alsa/<wbr>alsa-lib/0001-uc=
m-parser-<wbr>needs-limits.h.patch<br>
=C2=A0rename meta/recipes-multimedia/alsa/{<a href=3D"http://alsa-lib_1.1.2=
.bb" rel=3D"noreferrer" target=3D"_blank"><wbr>alsa-lib_1.1.2.bb</a> =3D&gt=
; <a href=3D"http://alsa-lib_1.1.3.bb" rel=3D"noreferrer" target=3D"_blank"=
>alsa-lib_1.1.3.bb</a>} (87%)<br>
<br>
diff --git a/meta/recipes-multimedia/<wbr>alsa/alsa-lib/0001-ucm-parser-<wb=
r>needs-limits.h.patch b/meta/recipes-multimedia/<wbr>alsa/alsa-lib/0001-uc=
m-parser-<wbr>needs-limits.h.patch<br>
new file mode 100644<br>
index 0000000..9d464f4<br>
--- /dev/null<br>
+++ b/meta/recipes-multimedia/<wbr>alsa/alsa-lib/0001-ucm-parser-<wbr>needs=
-limits.h.patch<br>
@@ -0,0 +1,33 @@<br>
+From 9ed4075f05a4242f32331f7f2c3657<wbr>67970f5003 Mon Sep 17 00:00:00 200=
1<br>
+From: Gustavo Zacarias &lt;<a href=3D"mailto:gustavo@zacarias.com.ar">gust=
avo@zacarias.com.ar</a>&gt;<br>
+Date: Wed, 21 Dec 2016 19:46:34 -0300<br>
+Subject: [PATCH] ucm: parser needs limits.h<br>
+<br>
+It&#39;s using PATH_MAX which is defined there, otherwise the build fails =
on<br>
+musl libc.<br>
+<br>
+Signed-off-by: Gustavo Zacarias &lt;<a href=3D"mailto:gustavo@zacarias.com=
.ar">gustavo@zacarias.com.ar</a>&gt;<br>
+Signed-off-by: Takashi Iwai &lt;<a href=3D"mailto:tiwai@suse.de">tiwai@sus=
e.de</a>&gt;<br>
+<br>
+Upstream-Status: Backport [1]<br>
+<br>
+[1] <a href=3D"http://git.alsa-project.org/?p=3Dalsa-lib.git;a=3Dcommit;h=
=3D9ed4075f05a4242f32331f7f2c365767970f5003" rel=3D"noreferrer" target=3D"_=
blank">http://git.alsa-project.org/?<wbr>p=3Dalsa-lib.git;a=3Dcommit;h=3D<w=
br>9ed4075f05a4242f32331f7f2c3657<wbr>67970f5003</a><br>
+---<br>
+ src/ucm/parser.c | 1 +<br>
+ 1 file changed, 1 insertion(+)<br>
+<br>
+diff --git a/src/ucm/parser.c b/src/ucm/parser.c<br>
+index c98373a..f520abc 100644<br>
+--- a/src/ucm/parser.c<br>
++++ b/src/ucm/parser.c<br>
+@@ -32,6 +32,7 @@<br>
+<br>
+ #include &quot;ucm_local.h&quot;<br>
+ #include &lt;dirent.h&gt;<br>
++#include &lt;limits.h&gt;<br>
+<br>
+ /** The name of the environment variable containing the UCM directory */<=
br>
+ #define ALSA_CONFIG_UCM_VAR &quot;ALSA_CONFIG_UCM&quot;<br>
+--<br>
+2.7.4<br>
+<br>
diff --git a/meta/recipes-multimedia/<wbr>alsa/<a href=3D"http://alsa-lib_1=
.1.2.bb" rel=3D"noreferrer" target=3D"_blank">alsa-lib_1.1.2.bb</a> b/meta/=
recipes-multimedia/<wbr>alsa/<a href=3D"http://alsa-lib_1.1.3.bb" rel=3D"no=
referrer" target=3D"_blank">alsa-lib_1.1.3.bb</a><br>
similarity index 87%<br>
rename from meta/recipes-multimedia/alsa/<a href=3D"http://alsa-lib_1.1.2.b=
b" rel=3D"noreferrer" target=3D"_blank">a<wbr>lsa-lib_1.1.2.bb</a><br>
rename to meta/recipes-multimedia/alsa/<a href=3D"http://alsa-lib_1.1.3.bb"=
 rel=3D"noreferrer" target=3D"_blank">a<wbr>lsa-lib_1.1.3.bb</a><br>
index e313da7..9a8a167 100644<br>
--- a/meta/recipes-multimedia/<wbr>alsa/<a href=3D"http://alsa-lib_1.1.2.bb=
" rel=3D"noreferrer" target=3D"_blank">alsa-lib_1.1.2.bb</a><br>
+++ b/meta/recipes-multimedia/<wbr>alsa/<a href=3D"http://alsa-lib_1.1.3.bb=
" rel=3D"noreferrer" target=3D"_blank">alsa-lib_1.1.3.bb</a><br>
@@ -11,9 +11,10 @@ BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"ftp://ftp.alsa-project.org/pub/lib/${BP}=
.tar.bz2" rel=3D"noreferrer" target=3D"_blank">ftp://ftp.alsa-project.org/<=
wbr>pub/lib/${BP}.tar.bz2</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://Check-if-wordexp-<wbr>func=
tion-is-supported.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://avoid-including-sys-<wbr>p=
oll.h-directly.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-ucm-parser-needs-<wbr=
>limits.h.patch \<br>
=C2=A0&quot;<br>
-SRC_URI[md5sum] =3D &quot;<wbr>1946e6438b8262a7b8fdadacd0e06b<wbr>a7&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>d38dacd9892b06b8bff04923c380b3<wbr>8fb2e=
379ee5538935ff37e45b395d8<wbr>61d6&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>eefe5992567ba00d6110a540657aaf<wbr>5c&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>71282502184c592c1a008e256c22ed<wbr>0ba57=
28ca65e05273ceb480c70f515<wbr>969c&quot;<br>
<br>
=C2=A0inherit autotools pkgconfig<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.7.4<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--001a11475cbce5c55f05468fa182--
