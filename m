Return-Path: <jpewhacker@gmail.com>
Received: from mail-ot0-f175.google.com (mail-ot0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id 9EECC60017
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Feb 2018 00:48:37 +0000 (UTC)
Received: by mail-ot0-f175.google.com with SMTP id q12so5814477otg.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Feb 2018 16:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nOBAXgSWbUvZIS/C/l8m70Xj/Rs9vvAtec13PEw+DYo=;
	b=uZPxujiddj8Xcgp1qc9eaVKgwNBwbh6KqJEaTehXCEhHyMk02QkAzkCrVYVH147e7F
	N6B+X8W9TmESIWGw8QKgpeqbEmBWRr+Uk6COsqbjvEYIu80A10avqvdIfB23TIvChiUl
	kiu5DNPKgr8oTwgOri2AQDvPR34Kk6WAH9JuhbKo6lxzgoC80HBL3GbBWaj5E5uJVwfI
	rF6GajfQ8GSj5sW1meRPtiqLMkA7CwfxXKKmZLVCATd+YH+A078/ktMssRphA8x4ikz3
	J2KHK+e6BJka2i8TbXLv9Ca8G9kykms41rxI/qQhSLzituWuSlNL25xFMjrZSRjSl8pA
	9OfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nOBAXgSWbUvZIS/C/l8m70Xj/Rs9vvAtec13PEw+DYo=;
	b=lkgr4aTjrC9Qb/aLZ8Rvl4jMHyGhiophUGs22ZOkTY/BwK4VmmqOVNxUU5iMiFPZR5
	UOLZZDNBA09J1a47VVI76JeG9h6n5P2fXBgc4/5fVXhU/gwm8vUpn0CETKWvHadonnct
	EMZOSFqt6ToX1PNtgPmgagVCcA+cEucHEqGOaNule7zAdT3k+OICms5DpSsnkjYCER+f
	NqBH2MKh9ureqc5CI2WgUNlpSvirNYD+FXeXhMztF3yLwxa2E/ubXlRxrhZaf6VuahIL
	WOPjyv9omKK+2pE4ZJSvPJJRT7Az8CeeIEGJpMtotgBNR0rmKPgOs910pNwU+AYcsydp
	0yRg==
X-Gm-Message-State: APf1xPDrH/KWWfWxHOIUMCyXByjG/vlMd3K0wLxIF94Bg6pyhteRGVni
	5nn+58mh2saIyBK817zewi8f/mxdNociFFZsZ88=
X-Google-Smtp-Source: AH8x227T1ULJUKODL1kneI8Tx56B7+gpVi9NPxIjGNAmmbgjk5vSVMrYdQbRWTJEI41lhmy/Tr+Xk0QkTXjNOx7uWsY=
X-Received: by 10.157.53.84 with SMTP id l20mr6235202ote.58.1518914918388;
	Sat, 17 Feb 2018 16:48:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.48.29 with HTTP; Sat, 17 Feb 2018 16:48:37 -0800 (PST)
Received: by 10.157.48.29 with HTTP; Sat, 17 Feb 2018 16:48:37 -0800 (PST)
In-Reply-To: <9db4e509-5581-aebe-5d6c-292dce4b5498@gmail.com>
References: <20180212193958.19804-1-JPEWhacker@gmail.com>
	<CA+chaQfqemdC3a70o9sjGRb+RWfb-Uoaea6a2apYkTaz2uomyA@mail.gmail.com>
	<9db4e509-5581-aebe-5d6c-292dce4b5498@gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Sat, 17 Feb 2018 18:48:37 -0600
Message-ID: <CAJdd5GZNasv+MU3KBN25FaxY82wa4VN8JxU2UyKaewon4BG0JQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Sun, 18 Feb 2018 00:48:37 -0000
Content-Type: multipart/alternative; boundary="001a113e13b027997b056571f0eb"

--001a113e13b027997b056571f0eb
Content-Type: text/plain; charset="UTF-8"

On Feb 17, 2018 18:25, "Khem Raj" <raj.khem@gmail.com> wrote:



On 2/16/18 12:14 PM, Martin Jansa wrote:

> +            v = max(limit, v)
>
> this seems to be doing the opposite of what the limit was used for before:
>
> -                v = min(64, int(v))
>
>
moreover, I think the limit should be based on ncpu() instead of hard
coding it.


I don't know about that. Doesn't PARALLEL_MAKE already default to something
based on ncpu()? My understanding of the limit was that some recipes
(boost? waf?) have a limit on the amount of parallism they can reasonably
stand, and you don't want those recipes to break if someone sets
PARALLEL_MAKE="-j
1000".

As long as that is true I think this is correct. Whether those recipes
still need to limit their parallism is another discussion.


On Mon, Feb 12, 2018 at 8:39 PM, Joshua Watt <jpewhacker@gmail.com <mailto:
> jpewhacker@gmail.com>> wrote:
>
>     The code to extract the integer number of parallel build threads and
>     construct a new argument from them has started to be copied in multiple
>     locations, so create two new helper utilities to aid recipes.
>
>     The first helper (parallel_make()) extracts the integer number of
>     parallel build threads from PARALLEL_MAKE. The second
>     (parallel_make_argument()) does the same and then puts the result back
>     into a format string, optionally clamping it to some maximum value.
>
>     Additionally, rework the oe-core recipes that were manually doing this
>     to use the new helper utilities.
>
>     Signed-off-by: Joshua Watt <JPEWhacker@gmail.com
>     <mailto:JPEWhacker@gmail.com>>
>
>     ---
>       meta/classes/go.bbclass              | 19 +---------------
>       meta/classes/waf.bbclass             | 24 +-------------------
>       meta/lib/oe/utils.py                 | 43
>     ++++++++++++++++++++++++++++++++++++
>       meta/recipes-core/ovmf/ovmf_git.bb <http://ovmf_git.bb>   |  2 +-
>
>       meta/recipes-support/boost/boost.inc | 24 +-------------------
>       5 files changed, 47 insertions(+), 65 deletions(-)
>
>     diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
>     index 09b01a84c37..7ecd8c92541 100644
>     --- a/meta/classes/go.bbclass
>     +++ b/meta/classes/go.bbclass
>     @@ -1,23 +1,6 @@
>       inherit goarch ptest
>
>     -def get_go_parallel_make(d):
>     -    pm = (d.getVar('PARALLEL_MAKE') or '').split()
>     -    # look for '-j' and throw other options (e.g. '-l') away
>     -    # because they might have a different meaning in golang
>     -    while pm:
>     -        opt = pm.pop(0)
>     -        if opt == '-j':
>     -            v = pm.pop(0)
>     -        elif opt.startswith('-j'):
>     -            v = opt[2:].strip()
>     -        else:
>     -            continue
>     -
>     -        return '-p %d' % int(v)
>     -
>     -    return ""
>     -
>     -GO_PARALLEL_BUILD ?= "${@get_go_parallel_make(d)}"
>     +GO_PARALLEL_BUILD ?= "${@oe.utils.parallel_make_argument(d, '-p
> %d')}"
>
>       GOROOT_class-native = "${STAGING_LIBDIR_NATIVE}/go"
>       GOROOT_class-nativesdk = "${STAGING_DIR_TARGET}${libdir}/go"
>     diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
>     index bdbdc56767c..f9a851d0759 100644
>     --- a/meta/classes/waf.bbclass
>     +++ b/meta/classes/waf.bbclass
>     @@ -3,28 +3,6 @@ DISABLE_STATIC = ""
>
>       EXTRA_OECONF_append = " ${PACKAGECONFIG_CONFARGS}"
>
>     -def get_waf_parallel_make(d):
>     -    pm = d.getVar('PARALLEL_MAKE')
>     -    if pm:
>     -        # look for '-j' and throw other options (e.g. '-l') away
>     -        # because they might have different meaning in bjam
>     -        pm = pm.split()
>     -        while pm:
>     -            v = None
>     -            opt = pm.pop(0)
>     -            if opt == '-j':
>     -                v = pm.pop(0)
>     -            elif opt.startswith('-j'):
>     -                v = opt[2:].strip()
>     -            else:
>     -                v = None
>     -
>     -            if v:
>     -                v = min(64, int(v))
>     -                return '-j' + str(v)
>     -
>     -    return ""
>     -
>       python waf_preconfigure() {
>           import subprocess
>           from distutils.version import StrictVersion
>     @@ -47,7 +25,7 @@ waf_do_configure() {
>
>       do_compile[progress] = "outof:^\[\s*(\d+)/\s*(\d+)\]\s+"
>       waf_do_compile()  {
>     -       ${S}/waf build ${@get_waf_parallel_make(d)}
>     +       ${S}/waf build ${@oe.utils.parallel_make_argument(d, '-j%d',
>     limit=64)}
>       }
>
>       waf_do_install() {
>     diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
>     index 7a79d752b69..ec91927233a 100644
>     --- a/meta/lib/oe/utils.py
>     +++ b/meta/lib/oe/utils.py
>     @@ -156,6 +156,49 @@ def any_distro_features(d, features,
>     truevalue="1", falsevalue=""):
>           """
>           return bb.utils.contains_any("DISTRO_FEATURES", features,
>     truevalue, falsevalue, d)
>
>     +def parallel_make(d):
>     +    """
>     +    Return the integer value for the number of parallel threads to
>     use when
>     +    building, scraped out of PARALLEL_MAKE. If no parallelization
>     option is
>     +    found, returns None
>     +
>     +    e.g. if PARALLEL_MAKE = "-j 10", this will return 10 as an
> integer.
>     +    """
>     +    pm = (d.getVar('PARALLEL_MAKE') or '').split()
>     +    # look for '-j' and throw other options (e.g. '-l') away
>     +    while pm:
>     +        opt = pm.pop(0)
>     +        if opt == '-j':
>     +            v = pm.pop(0)
>     +        elif opt.startswith('-j'):
>     +            v = opt[2:].strip()
>     +        else:
>     +            continue
>     +
>     +        return int(v)
>     +
>     +    return None
>     +
>     +def parallel_make_argument(d, fmt, limit=None):
>     +    """
>     +    Helper utility to construct a parallel make argument from the
>     number of
>     +    parallel threads specified in PARALLEL_MAKE.
>     +
>     +    Returns the input format string `fmt` where a single '%d' will
>     be expanded
>     +    with the number of parallel threads to use. If `limit` is
>     specified, the
>     +    number of parallel threads will be no larger than it. If no
>     parallelization
>     +    option is found in PARALLEL_MAKE, returns an empty string
>     +
>     +    e.g. if PARALLEL_MAKE = "-j 10", parallel_make_argument(d, "-n
>     %d") will return
>     +    "-n 10"
>     +    """
>     +    v = parallel_make(d)
>     +    if v:
>     +        if limit:
>     +            v = max(limit, v)
>     +        return fmt % v
>     +    return ''
>     +
>       def packages_filter_out_system(d):
>           """
>           Return a list of packages from PACKAGES with the "system"
>     packages such as
>     diff --git a/meta/recipes-core/ovmf/ovmf_git.bb <http://ovmf_git.bb>
>     b/meta/recipes-core/ovmf/ovmf_git.bb <http://ovmf_git.bb>
>     index fa0d66291d1..8750b3c528d 100644
>     --- a/meta/recipes-core/ovmf/ovmf_git.bb <http://ovmf_git.bb>
>     +++ b/meta/recipes-core/ovmf/ovmf_git.bb <http://ovmf_git.bb>
>
>     @@ -151,7 +151,7 @@ do_compile_class-native() {
>
>       do_compile_class-target() {
>           export LFLAGS="${LDFLAGS}"
>     -    PARALLEL_JOBS="${@ '${PARALLEL_MAKE}'.replace('-j', '-n ')}"
>     +    PARALLEL_JOBS="${@oe.utils.parallel_make_argument(d, '-n %d')}"
>           OVMF_ARCH="X64"
>           if [ "${TARGET_ARCH}" != "x86_64" ] ; then
>               OVMF_ARCH="IA32"
>     diff --git a/meta/recipes-support/boost/boost.inc
>     b/meta/recipes-support/boost/boost.inc
>     index 41fc90fb211..0461ec6fcf1 100644
>     --- a/meta/recipes-support/boost/boost.inc
>     +++ b/meta/recipes-support/boost/boost.inc
>     @@ -135,29 +135,7 @@ BJAM_TOOLS   = "--ignore-site-config \
>
>       # use PARALLEL_MAKE to speed up the build, but limit it by -j 64,
>     greater parallelism causes bjam to segfault or to ignore -j
>       # https://svn.boost.org/trac/boost/ticket/7634
>     <https://svn.boost.org/trac/boost/ticket/7634>
>     -def get_boost_parallel_make(d):
>     -    pm = d.getVar('PARALLEL_MAKE')
>     -    if pm:
>     -        # look for '-j' and throw other options (e.g. '-l') away
>     -        # because they might have different meaning in bjam
>     -        pm = pm.split()
>     -        while pm:
>     -            v = None
>     -            opt = pm.pop(0)
>     -            if opt == '-j':
>     -                v = pm.pop(0)
>     -            elif opt.startswith('-j'):
>     -                v = opt[2:].strip()
>     -            else:
>     -                v = None
>     -
>     -            if v:
>     -                v = min(64, int(v))
>     -                return '-j' + str(v)
>     -
>     -    return ""
>     -
>     -BOOST_PARALLEL_MAKE = "${@get_boost_parallel_make(d)}"
>     +BOOST_PARALLEL_MAKE = "${@oe.utils.parallel_make_argument(d,
>     '-j%d', limit=64)}"
>       BJAM_OPTS    = '${BOOST_PARALLEL_MAKE} -d+2 -q \
>                      ${BJAM_TOOLS} \
>                      -sBOOST_BUILD_USER_CONFIG=${WORKDIR}/user-config.jam
> \
>     --
>     2.14.3
>
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>
>
>
> --
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

--001a113e13b027997b056571f0eb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><div class=3D"gmail_extra"><br><div class=3D"gma=
il_quote">On Feb 17, 2018 18:25, &quot;Khem Raj&quot; &lt;<a href=3D"mailto=
:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br type=3D"attributi=
on"><blockquote class=3D"quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex"><div class=3D"quoted-text"><br>
<br>
On 2/16/18 12:14 PM, Martin Jansa wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v =3D max(limit, v)<br>
<br>
this seems to be doing the opposite of what the limit was used for before:<=
br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v =3D min(64, int(=
v))<br>
<br>
</blockquote>
<br></div>
moreover, I think the limit should be based on ncpu() instead of hard codin=
g it.<br></blockquote></div></div></div><div dir=3D"auto"><br></div><div di=
r=3D"auto">I don&#39;t know about that. Doesn&#39;t PARALLEL_MAKE already d=
efault to something based on ncpu()? My understanding of the limit was that=
 some recipes (boost? waf?) have a limit on the amount of parallism they ca=
n reasonably stand, and you don&#39;t want those recipes to break if someon=
e sets=C2=A0<span style=3D"font-family:sans-serif">PARALLEL_MAKE=3D&quot;-j=
 1000&quot;.</span></div><div dir=3D"auto"><span style=3D"font-family:sans-=
serif"><br></span></div><div dir=3D"auto">As long as that is true I think t=
his is correct. Whether those recipes still need to limit their parallism i=
s another discussion.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><d=
iv class=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"quoted-text">
On Mon, Feb 12, 2018 at 8:39 PM, Joshua Watt &lt;<a href=3D"mailto:jpewhack=
er@gmail.com" target=3D"_blank">jpewhacker@gmail.com</a> &lt;mailto:<a href=
=3D"mailto:jpewhacker@gmail.com" target=3D"_blank">jpewhacker@gmail.com</a>=
&gt;&gt; wrote:<br>
<br>
=C2=A0 =C2=A0 The code to extract the integer number of parallel build thre=
ads and<br>
=C2=A0 =C2=A0 construct a new argument from them has started to be copied i=
n multiple<br>
=C2=A0 =C2=A0 locations, so create two new helper utilities to aid recipes.=
<br>
<br>
=C2=A0 =C2=A0 The first helper (parallel_make()) extracts the integer numbe=
r of<br>
=C2=A0 =C2=A0 parallel build threads from PARALLEL_MAKE. The second<br>
=C2=A0 =C2=A0 (parallel_make_argument()) does the same and then puts the re=
sult back<br>
=C2=A0 =C2=A0 into a format string, optionally clamping it to some maximum =
value.<br>
<br>
=C2=A0 =C2=A0 Additionally, rework the oe-core recipes that were manually d=
oing this<br>
=C2=A0 =C2=A0 to use the new helper utilities.<br>
<br>
=C2=A0 =C2=A0 Signed-off-by: Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@g=
mail.com" target=3D"_blank">JPEWhacker@gmail.com</a><br></div>
=C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:JPEWhacker@gmail.com" target=3D"=
_blank">JPEWhacker@gmail.com</a>&gt;&gt;<div class=3D"quoted-text"><br>
=C2=A0 =C2=A0 ---<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0meta/classes/go.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 19 +---------------<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0meta/classes/waf.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 24 +-------------------<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0meta/lib/oe/utils.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 43<br>
=C2=A0 =C2=A0 ++++++++++++++++++++++++++++++<wbr>++++++<br></div>
=C2=A0 =C2=A0 =C2=A0=C2=A0meta/recipes-core/ovmf/<a href=3D"http://ovmf_git=
.bb" rel=3D"noreferrer" target=3D"_blank">ovmf_<wbr>git.bb</a> &lt;<a href=
=3D"http://ovmf_git.bb" rel=3D"noreferrer" target=3D"_blank">http://ovmf_gi=
t.bb</a>&gt;=C2=A0 =C2=A0|=C2=A0 2 +-<div class=3D"elided-text"><br>
=C2=A0 =C2=A0 =C2=A0=C2=A0meta/recipes-support/boost/b<wbr>oost.inc | 24 +-=
------------------<br>
=C2=A0 =C2=A0 =C2=A0=C2=A05 files changed, 47 insertions(+), 65 deletions(-=
)<br>
<br>
=C2=A0 =C2=A0 diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclas=
s<br>
=C2=A0 =C2=A0 index 09b01a84c37..7ecd8c92541 100644<br>
=C2=A0 =C2=A0 --- a/meta/classes/go.bbclass<br>
=C2=A0 =C2=A0 +++ b/meta/classes/go.bbclass<br>
=C2=A0 =C2=A0 @@ -1,23 +1,6 @@<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0inherit goarch ptest<br>
<br>
=C2=A0 =C2=A0 -def get_go_parallel_make(d):<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 pm =3D (d.getVar(&#39;PARALLEL_MAKE&#39;) or &=
#39;&#39;).split()<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 # look for &#39;-j&#39; and throw other option=
s (e.g. &#39;-l&#39;) away<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 # because they might have a different meaning =
in golang<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 while pm:<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 opt =3D pm.pop(0)<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if opt =3D=3D &#39;-j&#39;:<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v =3D pm.pop(0)<br=
>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif opt.startswith(&#39;-j&#39;=
):<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v =3D opt[2:].stri=
p()<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
=C2=A0 =C2=A0 -<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;-p %d&#39; % int(v)<=
br>
=C2=A0 =C2=A0 -<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 return &quot;&quot;<br>
=C2=A0 =C2=A0 -<br>
=C2=A0 =C2=A0 -GO_PARALLEL_BUILD ?=3D &quot;${@get_go_parallel_make(d)}&quo=
t;<br>
=C2=A0 =C2=A0 +GO_PARALLEL_BUILD ?=3D &quot;${@oe.utils.parallel_make_arg<w=
br>ument(d, &#39;-p %d&#39;)}&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0GOROOT_class-native =3D &quot;${STAGING_LIBDIR_NA=
TIVE}/go&quot;<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0GOROOT_class-nativesdk =3D &quot;${STAGING_DIR_TA=
RGET}${libdir<wbr>}/go&quot;<br>
=C2=A0 =C2=A0 diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbcl=
ass<br>
=C2=A0 =C2=A0 index bdbdc56767c..f9a851d0759 100644<br>
=C2=A0 =C2=A0 --- a/meta/classes/waf.bbclass<br>
=C2=A0 =C2=A0 +++ b/meta/classes/waf.bbclass<br>
=C2=A0 =C2=A0 @@ -3,28 +3,6 @@ DISABLE_STATIC =3D &quot;&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0EXTRA_OECONF_append =3D &quot; ${PACKAGECONFIG_CO=
NFARGS}&quot;<br>
<br>
=C2=A0 =C2=A0 -def get_waf_parallel_make(d):<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 pm =3D d.getVar(&#39;PARALLEL_MAKE&#39;)<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 if pm:<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 # look for &#39;-j&#39; and thro=
w other options (e.g. &#39;-l&#39;) away<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 # because they might have differ=
ent meaning in bjam<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 pm =3D pm.split()<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 while pm:<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v =3D None<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 opt =3D pm.pop(0)<=
br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if opt =3D=3D &#39=
;-j&#39;:<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v =
=3D pm.pop(0)<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif opt.startswit=
h(&#39;-j&#39;):<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v =
=3D opt[2:].strip()<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v =
=3D None<br>
=C2=A0 =C2=A0 -<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if v:<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v =
=3D min(64, int(v))<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retu=
rn &#39;-j&#39; + str(v)<br>
=C2=A0 =C2=A0 -<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 return &quot;&quot;<br>
=C2=A0 =C2=A0 -<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0python waf_preconfigure() {<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0import subprocess<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0from distutils.version import Stric=
tVersion<br>
=C2=A0 =C2=A0 @@ -47,7 +25,7 @@ waf_do_configure() {<br>
<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0do_compile[progress] =3D &quot;outof:^\[\s*(\d+)/=
\s*(\d+)\]\<wbr>s+&quot;<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0waf_do_compile()=C2=A0 {<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0${S}/waf build ${@get_waf_paralle=
l_make(d)}<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0${S}/waf build ${@oe.utils.parall=
el_make_argu<wbr>ment(d, &#39;-j%d&#39;,<br>
=C2=A0 =C2=A0 limit=3D64)}<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0waf_do_install() {<br>
=C2=A0 =C2=A0 diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py<br>
=C2=A0 =C2=A0 index 7a79d752b69..ec91927233a 100644<br>
=C2=A0 =C2=A0 --- a/meta/lib/oe/utils.py<br>
=C2=A0 =C2=A0 +++ b/meta/lib/oe/utils.py<br>
=C2=A0 =C2=A0 @@ -156,6 +156,49 @@ def any_distro_features(d, features,<br>
=C2=A0 =C2=A0 truevalue=3D&quot;1&quot;, falsevalue=3D&quot;&quot;):<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0return bb.utils.contains_any(&quot;=
DISTRO_<wbr>FEATURES&quot;, features,<br>
=C2=A0 =C2=A0 truevalue, falsevalue, d)<br>
<br>
=C2=A0 =C2=A0 +def parallel_make(d):<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 Return the integer value for the number of par=
allel threads to<br>
=C2=A0 =C2=A0 use when<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 building, scraped out of PARALLEL_MAKE. If no =
parallelization<br>
=C2=A0 =C2=A0 option is<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 found, returns None<br>
=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 e.g. if PARALLEL_MAKE =3D &quot;-j 10&quot;, t=
his will return 10 as an integer.<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 pm =3D (d.getVar(&#39;PARALLEL_MAKE&#39;) or &=
#39;&#39;).split()<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 # look for &#39;-j&#39; and throw other option=
s (e.g. &#39;-l&#39;) away<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 while pm:<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 opt =3D pm.pop(0)<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if opt =3D=3D &#39;-j&#39;:<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v =3D pm.pop(0)<br=
>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif opt.startswith(&#39;-j&#39;=
):<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v =3D opt[2:].stri=
p()<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return int(v)<br>
=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 return None<br>
=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 +def parallel_make_argument(d, fmt, limit=3DNone):<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 Helper utility to construct a parallel make ar=
gument from the<br>
=C2=A0 =C2=A0 number of<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 parallel threads specified in PARALLEL_MAKE.<b=
r>
=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 Returns the input format string `fmt` where a =
single &#39;%d&#39; will<br>
=C2=A0 =C2=A0 be expanded<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 with the number of parallel threads to use. If=
 `limit` is<br>
=C2=A0 =C2=A0 specified, the<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 number of parallel threads will be no larger t=
han it. If no<br>
=C2=A0 =C2=A0 parallelization<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 option is found in PARALLEL_MAKE, returns an e=
mpty string<br>
=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 e.g. if PARALLEL_MAKE =3D &quot;-j 10&quot;, p=
arallel_make_argument(d, &quot;-n<br>
=C2=A0 =C2=A0 %d&quot;) will return<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 &quot;-n 10&quot;<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 v =3D parallel_make(d)<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 if v:<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if limit:<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v =3D max(limit, v=
)<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return fmt % v<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 return &#39;&#39;<br>
=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0def packages_filter_out_system(d):<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0Return a list of packages from PACK=
AGES with the &quot;system&quot;<br>
=C2=A0 =C2=A0 packages such as<br></div>
=C2=A0 =C2=A0 diff --git a/meta/recipes-core/ovmf/<a href=3D"http://ovmf_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">ovmf_<wbr>git.bb</a> &lt;<a href=
=3D"http://ovmf_git.bb" rel=3D"noreferrer" target=3D"_blank">http://ovmf_gi=
t.bb</a>&gt;<br>
=C2=A0 =C2=A0 b/meta/recipes-core/ovmf/<a href=3D"http://ovmf_git.bb" rel=
=3D"noreferrer" target=3D"_blank">ovmf_<wbr>git.bb</a> &lt;<a href=3D"http:=
//ovmf_git.bb" rel=3D"noreferrer" target=3D"_blank">http://ovmf_git.bb</a>&=
gt;<br>
=C2=A0 =C2=A0 index fa0d66291d1..8750b3c528d 100644<br>
=C2=A0 =C2=A0 --- a/meta/recipes-core/ovmf/<a href=3D"http://ovmf_git.bb" r=
el=3D"noreferrer" target=3D"_blank">ovmf_<wbr>git.bb</a> &lt;<a href=3D"htt=
p://ovmf_git.bb" rel=3D"noreferrer" target=3D"_blank">http://ovmf_git.bb</a=
>&gt;<br>
=C2=A0 =C2=A0 +++ b/meta/recipes-core/ovmf/<a href=3D"http://ovmf_git.bb" r=
el=3D"noreferrer" target=3D"_blank">ovmf_<wbr>git.bb</a> &lt;<a href=3D"htt=
p://ovmf_git.bb" rel=3D"noreferrer" target=3D"_blank">http://ovmf_git.bb</a=
>&gt;<div class=3D"elided-text"><br>
=C2=A0 =C2=A0 @@ -151,7 +151,7 @@ do_compile_class-native() {<br>
<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0do_compile_class-target() {<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0export LFLAGS=3D&quot;${LDFLAGS}&qu=
ot;<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 PARALLEL_JOBS=3D&quot;${@ &#39;${PARALLEL_MAKE=
}&#39;.replace(&#39;-j<wbr>&#39;, &#39;-n &#39;)}&quot;<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 PARALLEL_JOBS=3D&quot;${@oe.utils.par<wbr>alle=
l_make_argument(d, &#39;-n %d&#39;)}&quot;<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0OVMF_ARCH=3D&quot;X64&quot;<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0if [ &quot;${TARGET_ARCH}&quot; !=
=3D &quot;x86_64&quot; ] ; then<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OVMF_ARCH=3D&quot;IA3=
2&quot;<br>
=C2=A0 =C2=A0 diff --git a/meta/recipes-support/boost/b<wbr>oost.inc<br>
=C2=A0 =C2=A0 b/meta/recipes-support/boost/b<wbr>oost.inc<br>
=C2=A0 =C2=A0 index 41fc90fb211..0461ec6fcf1 100644<br>
=C2=A0 =C2=A0 --- a/meta/recipes-support/boost/b<wbr>oost.inc<br>
=C2=A0 =C2=A0 +++ b/meta/recipes-support/boost/b<wbr>oost.inc<br>
=C2=A0 =C2=A0 @@ -135,29 +135,7 @@ BJAM_TOOLS=C2=A0 =C2=A0=3D &quot;--ignor=
e-site-config \<br>
<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0# use PARALLEL_MAKE to speed up the build, but li=
mit it by -j 64,<br>
=C2=A0 =C2=A0 greater parallelism causes bjam to segfault or to ignore -j<b=
r>
=C2=A0 =C2=A0 =C2=A0=C2=A0# <a href=3D"https://svn.boost.org/trac/boost/tic=
ket/7634" rel=3D"noreferrer" target=3D"_blank">https://svn.boost.org/trac/b=
oo<wbr>st/ticket/7634</a><br>
=C2=A0 =C2=A0 &lt;<a href=3D"https://svn.boost.org/trac/boost/ticket/7634" =
rel=3D"noreferrer" target=3D"_blank">https://svn.boost.org/trac/bo<wbr>ost/=
ticket/7634</a>&gt;<br>
=C2=A0 =C2=A0 -def get_boost_parallel_make(d):<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 pm =3D d.getVar(&#39;PARALLEL_MAKE&#39;)<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 if pm:<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 # look for &#39;-j&#39; and thro=
w other options (e.g. &#39;-l&#39;) away<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 # because they might have differ=
ent meaning in bjam<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 pm =3D pm.split()<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 while pm:<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v =3D None<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 opt =3D pm.pop(0)<=
br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if opt =3D=3D &#39=
;-j&#39;:<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v =
=3D pm.pop(0)<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif opt.startswit=
h(&#39;-j&#39;):<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v =
=3D opt[2:].strip()<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v =
=3D None<br>
=C2=A0 =C2=A0 -<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if v:<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v =
=3D min(64, int(v))<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retu=
rn &#39;-j&#39; + str(v)<br>
=C2=A0 =C2=A0 -<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 return &quot;&quot;<br>
=C2=A0 =C2=A0 -<br>
=C2=A0 =C2=A0 -BOOST_PARALLEL_MAKE =3D &quot;${@get_boost_parallel_make(d)<=
wbr>}&quot;<br>
=C2=A0 =C2=A0 +BOOST_PARALLEL_MAKE =3D &quot;${@oe.utils.parallel_make_arg<=
wbr>ument(d,<br>
=C2=A0 =C2=A0 &#39;-j%d&#39;, limit=3D64)}&quot;<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0BJAM_OPTS=C2=A0 =C2=A0 =3D &#39;${BOOST_PARALLEL_=
MAKE} -d+2 -q \<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 ${BJAM_TOOLS} \<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 -sBOOST_BUILD_USER_CONFIG=3D${WO<wbr>RKDIR}/user-config.jam \<br>
=C2=A0 =C2=A0 --<br>
=C2=A0 =C2=A0 2.14.3<br>
<br>
=C2=A0 =C2=A0 --<br>
=C2=A0 =C2=A0 ______________________________<wbr>_________________<br>
=C2=A0 =C2=A0 Openembedded-core mailing list<br>
=C2=A0 =C2=A0 <a href=3D"mailto:Openembedded-core@lists.openembedded.org" t=
arget=3D"_blank">Openembedded-core@lists.openem<wbr>bedded.org</a><br></div=
>
=C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:Openembedded-core@lists.openembe=
dded.org" target=3D"_blank">Openembedded-core@list<wbr>s.openembedded.org</=
a>&gt;<br>
=C2=A0 =C2=A0 <a href=3D"http://lists.openembedded.org/mailman/listinfo/ope=
nembedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembed=
ded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
=C2=A0 =C2=A0 &lt;<a href=3D"http://lists.openembedded.org/mailman/listinfo=
/openembedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.opene=
mbedded.org<wbr>/mailman/listinfo/openembedded<wbr>-core</a>&gt;<br>
<br>
<br>
<br>
</blockquote><div class=3D"elided-text">
-- <br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></blockquote></div><br></div></div></div>

--001a113e13b027997b056571f0eb--
