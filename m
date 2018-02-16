Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 7D31771C54
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Feb 2018 20:14:53 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id 141so5104670wme.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Feb 2018 12:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9K01R/Q+bBqNK34W0Nf6JCNExvFcXcOtOtus3ZFJlxk=;
	b=tNA/Mc7AUglHLNLD318cfWp3t8bmJGyf1jRfFnWsJDKu2s5/SUyo7NHhJqb4Jf5CDh
	8bw4ZmWGUqrptpGg3BFneMj8OqoIB0VixoVpwVo0xnCsyThXD3Yn/TCeEvdMxT7fb3r6
	1GXEsxENxtl2SYWUFYAqK7LzmExy2dHs4f9Js0cLu26brrXfCF6oG3ko7HfZ2kKlBxhw
	036YMfuh0bmiiCeJZW+Ybrepzi80RAFfa12wRUPhAy/ze2z7RSKEVk/VGaz4FcnjmpdU
	ThuSS52+VXqDwn822Z24LJxbCKssN5r1t2YQzoWfsXgz6ud0tImDIyCpzoD31kn/Vwr7
	x2mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9K01R/Q+bBqNK34W0Nf6JCNExvFcXcOtOtus3ZFJlxk=;
	b=H+1dn5HBU/AK3K7B2+Yfi7sksp6TrkRJVCt+xNSEOmIwf2v3vY8cvPC/JAvXJ6+E/v
	Zl40IPJXmPYXCNO5NaHM6R+uHvzQmyxLXL71t/A9EIXlKOyxIonZvpnyq3s9EVbJyk4t
	tCo0RnOdSfQkcbnIizB4r3sCTgbRrf1h+dwKM7+lZVFQ8SpNJwq0LnMM4unr8HKWf8nY
	dBDwXdEuxUAt33zQ2KUcj/ty4gAe3kxxOb3ByhQ+al5EN7y0lgyq7UddmUgPzY4liKhi
	NaVCfQR9djnzCyVogWwHzR/MVNhsoDWFuDzwPK5xFTJnWsos9dhWaalTtFPTmmGOwH3L
	dbhg==
X-Gm-Message-State: APf1xPAgK6lE3sOGy5wYfSRNAlQFNKrx2Nbj/6VuO90xe4pckipUqqfS
	E8MPwmmkV1H5jCQNgJlk3eLLQbr/GH2c1mmeHp4=
X-Google-Smtp-Source: AH8x227Wx8pUxp0GfRN0Z9w+riUzv/6AL4ckN9Vky+J+qr5xYmBo55gh1yqO65Kl6ZhRGqZW3iOE9XZhBMUq/GxAwVo=
X-Received: by 10.28.207.201 with SMTP id f192mr4491878wmg.81.1518812094243;
	Fri, 16 Feb 2018 12:14:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Fri, 16 Feb 2018 12:14:53 -0800 (PST)
In-Reply-To: <20180212193958.19804-1-JPEWhacker@gmail.com>
References: <20180212193958.19804-1-JPEWhacker@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 16 Feb 2018 21:14:53 +0100
Message-ID: <CA+chaQfqemdC3a70o9sjGRb+RWfb-Uoaea6a2apYkTaz2uomyA@mail.gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] utils.py: add parallel make helpers
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
X-List-Received-Date: Fri, 16 Feb 2018 20:14:53 -0000
Content-Type: multipart/alternative; boundary="94eb2c0d6dd65ba915056559ff6d"

--94eb2c0d6dd65ba915056559ff6d
Content-Type: text/plain; charset="UTF-8"

+            v = max(limit, v)

this seems to be doing the opposite of what the limit was used for before:

-                v = min(64, int(v))

On Mon, Feb 12, 2018 at 8:39 PM, Joshua Watt <jpewhacker@gmail.com> wrote:

> The code to extract the integer number of parallel build threads and
> construct a new argument from them has started to be copied in multiple
> locations, so create two new helper utilities to aid recipes.
>
> The first helper (parallel_make()) extracts the integer number of
> parallel build threads from PARALLEL_MAKE. The second
> (parallel_make_argument()) does the same and then puts the result back
> into a format string, optionally clamping it to some maximum value.
>
> Additionally, rework the oe-core recipes that were manually doing this
> to use the new helper utilities.
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/classes/go.bbclass              | 19 +---------------
>  meta/classes/waf.bbclass             | 24 +-------------------
>  meta/lib/oe/utils.py                 | 43 ++++++++++++++++++++++++++++++
> ++++++
>  meta/recipes-core/ovmf/ovmf_git.bb   |  2 +-
>  meta/recipes-support/boost/boost.inc | 24 +-------------------
>  5 files changed, 47 insertions(+), 65 deletions(-)
>
> diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
> index 09b01a84c37..7ecd8c92541 100644
> --- a/meta/classes/go.bbclass
> +++ b/meta/classes/go.bbclass
> @@ -1,23 +1,6 @@
>  inherit goarch ptest
>
> -def get_go_parallel_make(d):
> -    pm = (d.getVar('PARALLEL_MAKE') or '').split()
> -    # look for '-j' and throw other options (e.g. '-l') away
> -    # because they might have a different meaning in golang
> -    while pm:
> -        opt = pm.pop(0)
> -        if opt == '-j':
> -            v = pm.pop(0)
> -        elif opt.startswith('-j'):
> -            v = opt[2:].strip()
> -        else:
> -            continue
> -
> -        return '-p %d' % int(v)
> -
> -    return ""
> -
> -GO_PARALLEL_BUILD ?= "${@get_go_parallel_make(d)}"
> +GO_PARALLEL_BUILD ?= "${@oe.utils.parallel_make_argument(d, '-p %d')}"
>
>  GOROOT_class-native = "${STAGING_LIBDIR_NATIVE}/go"
>  GOROOT_class-nativesdk = "${STAGING_DIR_TARGET}${libdir}/go"
> diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
> index bdbdc56767c..f9a851d0759 100644
> --- a/meta/classes/waf.bbclass
> +++ b/meta/classes/waf.bbclass
> @@ -3,28 +3,6 @@ DISABLE_STATIC = ""
>
>  EXTRA_OECONF_append = " ${PACKAGECONFIG_CONFARGS}"
>
> -def get_waf_parallel_make(d):
> -    pm = d.getVar('PARALLEL_MAKE')
> -    if pm:
> -        # look for '-j' and throw other options (e.g. '-l') away
> -        # because they might have different meaning in bjam
> -        pm = pm.split()
> -        while pm:
> -            v = None
> -            opt = pm.pop(0)
> -            if opt == '-j':
> -                v = pm.pop(0)
> -            elif opt.startswith('-j'):
> -                v = opt[2:].strip()
> -            else:
> -                v = None
> -
> -            if v:
> -                v = min(64, int(v))
> -                return '-j' + str(v)
> -
> -    return ""
> -
>  python waf_preconfigure() {
>      import subprocess
>      from distutils.version import StrictVersion
> @@ -47,7 +25,7 @@ waf_do_configure() {
>
>  do_compile[progress] = "outof:^\[\s*(\d+)/\s*(\d+)\]\s+"
>  waf_do_compile()  {
> -       ${S}/waf build ${@get_waf_parallel_make(d)}
> +       ${S}/waf build ${@oe.utils.parallel_make_argument(d, '-j%d',
> limit=64)}
>  }
>
>  waf_do_install() {
> diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
> index 7a79d752b69..ec91927233a 100644
> --- a/meta/lib/oe/utils.py
> +++ b/meta/lib/oe/utils.py
> @@ -156,6 +156,49 @@ def any_distro_features(d, features, truevalue="1",
> falsevalue=""):
>      """
>      return bb.utils.contains_any("DISTRO_FEATURES", features, truevalue,
> falsevalue, d)
>
> +def parallel_make(d):
> +    """
> +    Return the integer value for the number of parallel threads to use
> when
> +    building, scraped out of PARALLEL_MAKE. If no parallelization option
> is
> +    found, returns None
> +
> +    e.g. if PARALLEL_MAKE = "-j 10", this will return 10 as an integer.
> +    """
> +    pm = (d.getVar('PARALLEL_MAKE') or '').split()
> +    # look for '-j' and throw other options (e.g. '-l') away
> +    while pm:
> +        opt = pm.pop(0)
> +        if opt == '-j':
> +            v = pm.pop(0)
> +        elif opt.startswith('-j'):
> +            v = opt[2:].strip()
> +        else:
> +            continue
> +
> +        return int(v)
> +
> +    return None
> +
> +def parallel_make_argument(d, fmt, limit=None):
> +    """
> +    Helper utility to construct a parallel make argument from the number
> of
> +    parallel threads specified in PARALLEL_MAKE.
> +
> +    Returns the input format string `fmt` where a single '%d' will be
> expanded
> +    with the number of parallel threads to use. If `limit` is specified,
> the
> +    number of parallel threads will be no larger than it. If no
> parallelization
> +    option is found in PARALLEL_MAKE, returns an empty string
> +
> +    e.g. if PARALLEL_MAKE = "-j 10", parallel_make_argument(d, "-n %d")
> will return
> +    "-n 10"
> +    """
> +    v = parallel_make(d)
> +    if v:
> +        if limit:
> +            v = max(limit, v)
> +        return fmt % v
> +    return ''
> +
>  def packages_filter_out_system(d):
>      """
>      Return a list of packages from PACKAGES with the "system" packages
> such as
> diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/
> ovmf_git.bb
> index fa0d66291d1..8750b3c528d 100644
> --- a/meta/recipes-core/ovmf/ovmf_git.bb
> +++ b/meta/recipes-core/ovmf/ovmf_git.bb
> @@ -151,7 +151,7 @@ do_compile_class-native() {
>
>  do_compile_class-target() {
>      export LFLAGS="${LDFLAGS}"
> -    PARALLEL_JOBS="${@ '${PARALLEL_MAKE}'.replace('-j', '-n ')}"
> +    PARALLEL_JOBS="${@oe.utils.parallel_make_argument(d, '-n %d')}"
>      OVMF_ARCH="X64"
>      if [ "${TARGET_ARCH}" != "x86_64" ] ; then
>          OVMF_ARCH="IA32"
> diff --git a/meta/recipes-support/boost/boost.inc
> b/meta/recipes-support/boost/boost.inc
> index 41fc90fb211..0461ec6fcf1 100644
> --- a/meta/recipes-support/boost/boost.inc
> +++ b/meta/recipes-support/boost/boost.inc
> @@ -135,29 +135,7 @@ BJAM_TOOLS   = "--ignore-site-config \
>
>  # use PARALLEL_MAKE to speed up the build, but limit it by -j 64, greater
> parallelism causes bjam to segfault or to ignore -j
>  # https://svn.boost.org/trac/boost/ticket/7634
> -def get_boost_parallel_make(d):
> -    pm = d.getVar('PARALLEL_MAKE')
> -    if pm:
> -        # look for '-j' and throw other options (e.g. '-l') away
> -        # because they might have different meaning in bjam
> -        pm = pm.split()
> -        while pm:
> -            v = None
> -            opt = pm.pop(0)
> -            if opt == '-j':
> -                v = pm.pop(0)
> -            elif opt.startswith('-j'):
> -                v = opt[2:].strip()
> -            else:
> -                v = None
> -
> -            if v:
> -                v = min(64, int(v))
> -                return '-j' + str(v)
> -
> -    return ""
> -
> -BOOST_PARALLEL_MAKE = "${@get_boost_parallel_make(d)}"
> +BOOST_PARALLEL_MAKE = "${@oe.utils.parallel_make_argument(d, '-j%d',
> limit=64)}"
>  BJAM_OPTS    = '${BOOST_PARALLEL_MAKE} -d+2 -q \
>                 ${BJAM_TOOLS} \
>                 -sBOOST_BUILD_USER_CONFIG=${WORKDIR}/user-config.jam \
> --
> 2.14.3
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c0d6dd65ba915056559ff6d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-=
serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font=
-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start=
;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;ba=
ckground-color:rgb(255,255,255);text-decoration-style:initial;text-decorati=
on-color:initial;float:none;display:inline">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 v =3D max(limit, v)</span><br><div><span style=3D"color:rgb(3=
4,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;fo=
nt-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter=
-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-=
space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decora=
tion-style:initial;text-decoration-color:initial;float:none;display:inline"=
><br></span></div><div><span style=3D"color:rgb(34,34,34);font-family:arial=
,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:norma=
l;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align=
:start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:=
0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-de=
coration-color:initial;float:none;display:inline">this seems to be doing th=
e opposite of what the limit was used for before:</span></div><div><span st=
yle=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;fo=
nt-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font=
-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tra=
nsform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,25=
5,255);text-decoration-style:initial;text-decoration-color:initial;float:no=
ne;display:inline"><br></span></div><div><span style=3D"color:rgb(34,34,34)=
;font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-varia=
nt-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing=
:normal;text-align:start;text-indent:0px;text-transform:none;white-space:no=
rmal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-sty=
le:initial;text-decoration-color:initial;float:none;display:inline"><span s=
tyle=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;f=
ont-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;fon=
t-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tr=
ansform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,2=
55,255);text-decoration-style:initial;text-decoration-color:initial;float:n=
one;display:inline">-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 v =3D min(64, int(v))</span><br></span></div></div><div class=3D"gmail_=
extra"><br><div class=3D"gmail_quote">On Mon, Feb 12, 2018 at 8:39 PM, Josh=
ua Watt <span dir=3D"ltr">&lt;<a href=3D"mailto:jpewhacker@gmail.com" targe=
t=3D"_blank">jpewhacker@gmail.com</a>&gt;</span> wrote:<br><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">The code to extract the integer number of parallel build thr=
eads and<br>
construct a new argument from them has started to be copied in multiple<br>
locations, so create two new helper utilities to aid recipes.<br>
<br>
The first helper (parallel_make()) extracts the integer number of<br>
parallel build threads from PARALLEL_MAKE. The second<br>
(parallel_make_argument()) does the same and then puts the result back<br>
into a format string, optionally clamping it to some maximum value.<br>
<br>
Additionally, rework the oe-core recipes that were manually doing this<br>
to use the new helper utilities.<br>
<br>
Signed-off-by: Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com">JPEW=
hacker@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/go.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 19 +---------------<br>
=C2=A0meta/classes/waf.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 24 +-------------------<br>
=C2=A0meta/lib/oe/utils.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 43 ++++++++++++++++++++++++++++++<wbr>++++++<br>
=C2=A0meta/recipes-core/ovmf/<a href=3D"http://ovmf_git.bb" rel=3D"noreferr=
er" target=3D"_blank">ovmf_<wbr>git.bb</a>=C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0meta/recipes-support/boost/<wbr>boost.inc | 24 +-------------------<b=
r>
=C2=A05 files changed, 47 insertions(+), 65 deletions(-)<br>
<br>
diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass<br>
index 09b01a84c37..7ecd8c92541 100644<br>
--- a/meta/classes/go.bbclass<br>
+++ b/meta/classes/go.bbclass<br>
@@ -1,23 +1,6 @@<br>
=C2=A0inherit goarch ptest<br>
<br>
-def get_go_parallel_make(d):<br>
-=C2=A0 =C2=A0 pm =3D (d.getVar(&#39;PARALLEL_MAKE&#39;) or &#39;&#39;).spl=
it()<br>
-=C2=A0 =C2=A0 # look for &#39;-j&#39; and throw other options (e.g. &#39;-=
l&#39;) away<br>
-=C2=A0 =C2=A0 # because they might have a different meaning in golang<br>
-=C2=A0 =C2=A0 while pm:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 opt =3D pm.pop(0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if opt =3D=3D &#39;-j&#39;:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v =3D pm.pop(0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif opt.startswith(&#39;-j&#39;):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v =3D opt[2:].strip()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;-p %d&#39; % int(v)<br>
-<br>
-=C2=A0 =C2=A0 return &quot;&quot;<br>
-<br>
-GO_PARALLEL_BUILD ?=3D &quot;${@get_go_parallel_make(d)}&quot;<br>
+GO_PARALLEL_BUILD ?=3D &quot;${@oe.utils.parallel_make_<wbr>argument(d, &#=
39;-p %d&#39;)}&quot;<br>
<br>
=C2=A0GOROOT_class-native =3D &quot;${STAGING_LIBDIR_NATIVE}/go&quot;<br>
=C2=A0GOROOT_class-nativesdk =3D &quot;${STAGING_DIR_TARGET}${<wbr>libdir}/=
go&quot;<br>
diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass<br>
index bdbdc56767c..f9a851d0759 100644<br>
--- a/meta/classes/waf.bbclass<br>
+++ b/meta/classes/waf.bbclass<br>
@@ -3,28 +3,6 @@ DISABLE_STATIC =3D &quot;&quot;<br>
<br>
=C2=A0EXTRA_OECONF_append =3D &quot; ${PACKAGECONFIG_CONFARGS}&quot;<br>
<br>
-def get_waf_parallel_make(d):<br>
-=C2=A0 =C2=A0 pm =3D d.getVar(&#39;PARALLEL_MAKE&#39;)<br>
-=C2=A0 =C2=A0 if pm:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # look for &#39;-j&#39; and throw other option=
s (e.g. &#39;-l&#39;) away<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # because they might have different meaning in=
 bjam<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 pm =3D pm.split()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 while pm:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v =3D None<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 opt =3D pm.pop(0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if opt =3D=3D &#39;-j&#39;:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v =3D pm.pop(0)<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif opt.startswith(&#39;-j&#39;=
):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v =3D opt[2:].stri=
p()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v =3D None<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if v:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v =3D min(64, int(=
v))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;-j&#39=
; + str(v)<br>
-<br>
-=C2=A0 =C2=A0 return &quot;&quot;<br>
-<br>
=C2=A0python waf_preconfigure() {<br>
=C2=A0 =C2=A0 =C2=A0import subprocess<br>
=C2=A0 =C2=A0 =C2=A0from distutils.version import StrictVersion<br>
@@ -47,7 +25,7 @@ waf_do_configure() {<br>
<br>
=C2=A0do_compile[progress] =3D &quot;outof:^\[\s*(\d+)/\s*(\d+)\]\<wbr>s+&q=
uot;<br>
=C2=A0waf_do_compile()=C2=A0 {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0${S}/waf build ${@get_waf_parallel_make(d)}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${S}/waf build ${@oe.utils.parallel_make_<wbr>a=
rgument(d, &#39;-j%d&#39;, limit=3D64)}<br>
=C2=A0}<br>
<br>
=C2=A0waf_do_install() {<br>
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py<br>
index 7a79d752b69..ec91927233a 100644<br>
--- a/meta/lib/oe/utils.py<br>
+++ b/meta/lib/oe/utils.py<br>
@@ -156,6 +156,49 @@ def any_distro_features(d, features, truevalue=3D&quot=
;1&quot;, falsevalue=3D&quot;&quot;):<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0return bb.utils.contains_any(&quot;DISTRO_<wbr>FEATURES=
&quot;, features, truevalue, falsevalue, d)<br>
<br>
+def parallel_make(d):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 Return the integer value for the number of parallel threads =
to use when<br>
+=C2=A0 =C2=A0 building, scraped out of PARALLEL_MAKE. If no parallelizatio=
n option is<br>
+=C2=A0 =C2=A0 found, returns None<br>
+<br>
+=C2=A0 =C2=A0 e.g. if PARALLEL_MAKE =3D &quot;-j 10&quot;, this will retur=
n 10 as an integer.<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 pm =3D (d.getVar(&#39;PARALLEL_MAKE&#39;) or &#39;&#39;).spl=
it()<br>
+=C2=A0 =C2=A0 # look for &#39;-j&#39; and throw other options (e.g. &#39;-=
l&#39;) away<br>
+=C2=A0 =C2=A0 while pm:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 opt =3D pm.pop(0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if opt =3D=3D &#39;-j&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v =3D pm.pop(0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif opt.startswith(&#39;-j&#39;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v =3D opt[2:].strip()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return int(v)<br>
+<br>
+=C2=A0 =C2=A0 return None<br>
+<br>
+def parallel_make_argument(d, fmt, limit=3DNone):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 Helper utility to construct a parallel make argument from th=
e number of<br>
+=C2=A0 =C2=A0 parallel threads specified in PARALLEL_MAKE.<br>
+<br>
+=C2=A0 =C2=A0 Returns the input format string `fmt` where a single &#39;%d=
&#39; will be expanded<br>
+=C2=A0 =C2=A0 with the number of parallel threads to use. If `limit` is sp=
ecified, the<br>
+=C2=A0 =C2=A0 number of parallel threads will be no larger than it. If no =
parallelization<br>
+=C2=A0 =C2=A0 option is found in PARALLEL_MAKE, returns an empty string<br=
>
+<br>
+=C2=A0 =C2=A0 e.g. if PARALLEL_MAKE =3D &quot;-j 10&quot;, parallel_make_a=
rgument(d, &quot;-n %d&quot;) will return<br>
+=C2=A0 =C2=A0 &quot;-n 10&quot;<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 v =3D parallel_make(d)<br>
+=C2=A0 =C2=A0 if v:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if limit:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v =3D max(limit, v)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return fmt % v<br>
+=C2=A0 =C2=A0 return &#39;&#39;<br>
+<br>
=C2=A0def packages_filter_out_system(d):<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0Return a list of packages from PACKAGES with the &quot;=
system&quot; packages such as<br>
diff --git a/meta/recipes-core/ovmf/<a href=3D"http://ovmf_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">ovmf_<wbr>git.bb</a> b/meta/recipes-core/ovmf/=
<a href=3D"http://ovmf_git.bb" rel=3D"noreferrer" target=3D"_blank">ovmf_<w=
br>git.bb</a><br>
index fa0d66291d1..8750b3c528d 100644<br>
--- a/meta/recipes-core/ovmf/<a href=3D"http://ovmf_git.bb" rel=3D"noreferr=
er" target=3D"_blank">ovmf_<wbr>git.bb</a><br>
+++ b/meta/recipes-core/ovmf/<a href=3D"http://ovmf_git.bb" rel=3D"noreferr=
er" target=3D"_blank">ovmf_<wbr>git.bb</a><br>
@@ -151,7 +151,7 @@ do_compile_class-native() {<br>
<br>
=C2=A0do_compile_class-target() {<br>
=C2=A0 =C2=A0 =C2=A0export LFLAGS=3D&quot;${LDFLAGS}&quot;<br>
-=C2=A0 =C2=A0 PARALLEL_JOBS=3D&quot;${@ &#39;${PARALLEL_MAKE}&#39;.replace=
(&#39;-<wbr>j&#39;, &#39;-n &#39;)}&quot;<br>
+=C2=A0 =C2=A0 PARALLEL_JOBS=3D&quot;${@oe.utils.<wbr>parallel_make_argumen=
t(d, &#39;-n %d&#39;)}&quot;<br>
=C2=A0 =C2=A0 =C2=A0OVMF_ARCH=3D&quot;X64&quot;<br>
=C2=A0 =C2=A0 =C2=A0if [ &quot;${TARGET_ARCH}&quot; !=3D &quot;x86_64&quot;=
 ] ; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OVMF_ARCH=3D&quot;IA32&quot;<br>
diff --git a/meta/recipes-support/boost/<wbr>boost.inc b/meta/recipes-suppo=
rt/boost/<wbr>boost.inc<br>
index 41fc90fb211..0461ec6fcf1 100644<br>
--- a/meta/recipes-support/boost/<wbr>boost.inc<br>
+++ b/meta/recipes-support/boost/<wbr>boost.inc<br>
@@ -135,29 +135,7 @@ BJAM_TOOLS=C2=A0 =C2=A0=3D &quot;--ignore-site-config =
\<br>
<br>
=C2=A0# use PARALLEL_MAKE to speed up the build, but limit it by -j 64, gre=
ater parallelism causes bjam to segfault or to ignore -j<br>
=C2=A0# <a href=3D"https://svn.boost.org/trac/boost/ticket/7634" rel=3D"nor=
eferrer" target=3D"_blank">https://svn.boost.org/trac/<wbr>boost/ticket/763=
4</a><br>
-def get_boost_parallel_make(d):<br>
-=C2=A0 =C2=A0 pm =3D d.getVar(&#39;PARALLEL_MAKE&#39;)<br>
-=C2=A0 =C2=A0 if pm:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # look for &#39;-j&#39; and throw other option=
s (e.g. &#39;-l&#39;) away<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # because they might have different meaning in=
 bjam<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 pm =3D pm.split()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 while pm:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v =3D None<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 opt =3D pm.pop(0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if opt =3D=3D &#39;-j&#39;:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v =3D pm.pop(0)<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif opt.startswith(&#39;-j&#39;=
):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v =3D opt[2:].stri=
p()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v =3D None<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if v:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v =3D min(64, int(=
v))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;-j&#39=
; + str(v)<br>
-<br>
-=C2=A0 =C2=A0 return &quot;&quot;<br>
-<br>
-BOOST_PARALLEL_MAKE =3D &quot;${@get_boost_parallel_make(d)<wbr>}&quot;<br=
>
+BOOST_PARALLEL_MAKE =3D &quot;${@oe.utils.parallel_make_<wbr>argument(d, &=
#39;-j%d&#39;, limit=3D64)}&quot;<br>
=C2=A0BJAM_OPTS=C2=A0 =C2=A0 =3D &#39;${BOOST_PARALLEL_MAKE} -d+2 -q \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${BJAM_TOOLS} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -sBOOST_BUILD_USER_=
CONFIG=3D${<wbr>WORKDIR}/user-config.jam \<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.14.3<br>
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

--94eb2c0d6dd65ba915056559ff6d--
