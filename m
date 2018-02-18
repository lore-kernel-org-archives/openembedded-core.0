Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f172.google.com (mail-pf0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 248EA6011B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Feb 2018 01:01:56 +0000 (UTC)
Received: by mail-pf0-f172.google.com with SMTP id b8so722535pfh.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Feb 2018 17:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=QEDeocUBeeFnuwTm/u09Flxv8xZZJc4lbEbnOipc/z4=;
	b=ohQk4FNAwuUqfo73OTFYn8wsqWU3QMk+4IJ/r6oYhmxR7AwK0OC6UnZadescrUenKE
	0x76/aryDxw/7Yc+KWY00ini9J6GqiGd8YKFvLd0wgYiudUqDk1rWrxPqYF7c5h7S/BB
	9PoUY6SbICiCmeiCXeYTxjrE/0QxkF0tDQXX66XpxCGiCgYrmBG3LRWTpABLZfn/toHK
	f7203yekzkFG2SgXlnxSIsqxZMNuCf5udbPRim/IIccUkr3zSteZR8jAEedGCmEfDtcr
	vfnmXlrgCW6df0v1U7tyjBz776irhBPJlxZoM6056GLbp+UYRnuLYhKAmZa3tUfizRQX
	Clfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=QEDeocUBeeFnuwTm/u09Flxv8xZZJc4lbEbnOipc/z4=;
	b=L/EuCpXF7SrTdsY5/86asqAamOf99WMmoE8yC/9NwbPXKsg72WNUtvz4Z6hqNs+VRd
	2vKCYyxqXHaxyAfRDXtECK9iUsOesEdWYg8IuN3S+mS8Iw6xD5J9lyE5nWMKjSQDESZw
	uek7KpDaDQMuGrm/hN1VxBjqstbykLcNXVhh0J/RMs2H8D3GWvKPM+UM8QtLAOwU8n9h
	yVE9TlXmnXYxRpF2bagBXWk/sLHk7NbdKwTCIVNlJxh3SwBjOeSmuQNMdQJsRbGFARpx
	gAA7AcuNSyHbJYSU2i5mnW5SIqBxVJPOwNJzETYrYWdIp2st2CucLwop2KzMLM1WQrMJ
	HIKw==
X-Gm-Message-State: APf1xPBRARGBcqjnDi67hwtYa3VIFZvP74aKuaB4HSnhfFwu4xR3Zbuv
	9ELuJjIpS4ugnen3C1I9CMGoh0QShVSxLbkqxss=
X-Google-Smtp-Source: AH8x224wVSYcmIYHK4doqyamVd59DaUhVB3L8/hwg6bYlrmfvCL0HQDQNeX5QRlNy7fbtdQ7Q+u62xXmS9jw4AgTCcU=
X-Received: by 10.101.92.66 with SMTP id v2mr8779412pgr.341.1518915717968;
	Sat, 17 Feb 2018 17:01:57 -0800 (PST)
MIME-Version: 1.0
References: <20180212193958.19804-1-JPEWhacker@gmail.com>
	<CA+chaQfqemdC3a70o9sjGRb+RWfb-Uoaea6a2apYkTaz2uomyA@mail.gmail.com>
	<9db4e509-5581-aebe-5d6c-292dce4b5498@gmail.com>
	<CAJdd5GZNasv+MU3KBN25FaxY82wa4VN8JxU2UyKaewon4BG0JQ@mail.gmail.com>
In-Reply-To: <CAJdd5GZNasv+MU3KBN25FaxY82wa4VN8JxU2UyKaewon4BG0JQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 18 Feb 2018 01:01:46 +0000
Message-ID: <CAMKF1spOc0aX1SPvtMJVzmYcPvy=Xodm2-wJ48yJXr6sNHdX3Q@mail.gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>
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
X-List-Received-Date: Sun, 18 Feb 2018 01:01:57 -0000
Content-Type: multipart/alternative; boundary="089e0826ee94d038890565721fb5"

--089e0826ee94d038890565721fb5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 17, 2018 at 4:48 PM Joshua Watt <jpewhacker@gmail.com> wrote:

>
>
> On Feb 17, 2018 18:25, "Khem Raj" <raj.khem@gmail.com> wrote:
>
>
>
> On 2/16/18 12:14 PM, Martin Jansa wrote:
>
>> +            v =3D max(limit, v)
>>
>> this seems to be doing the opposite of what the limit was used for befor=
e:
>>
>> -                v =3D min(64, int(v))
>>
>>
> moreover, I think the limit should be based on ncpu() instead of hard
> coding it.
>
>
> I don't know about that. Doesn't PARALLEL_MAKE already default to
> something based on ncpu()? My understanding of the limit was that some
> recipes (boost? waf?) have a limit on the amount of parallism they can
> reasonably stand, and you don't want those recipes to break if someone se=
ts PARALLEL_MAKE=3D"-j
> 1000".
>

Ah yes that=E2=80=99s a fair point

>
> As long as that is true I think this is correct. Whether those recipes
> still need to limit their parallism is another discussion.
>
>
> On Mon, Feb 12, 2018 at 8:39 PM, Joshua Watt <jpewhacker@gmail.com
>> <mailto:jpewhacker@gmail.com>> wrote:
>>
>>     The code to extract the integer number of parallel build threads and
>>     construct a new argument from them has started to be copied in
>> multiple
>>     locations, so create two new helper utilities to aid recipes.
>>
>>     The first helper (parallel_make()) extracts the integer number of
>>     parallel build threads from PARALLEL_MAKE. The second
>>     (parallel_make_argument()) does the same and then puts the result ba=
ck
>>     into a format string, optionally clamping it to some maximum value.
>>
>>     Additionally, rework the oe-core recipes that were manually doing th=
is
>>     to use the new helper utilities.
>>
>>     Signed-off-by: Joshua Watt <JPEWhacker@gmail.com
>>     <mailto:JPEWhacker@gmail.com>>
>>
>>     ---
>>       meta/classes/go.bbclass              | 19 +---------------
>>       meta/classes/waf.bbclass             | 24 +-------------------
>>       meta/lib/oe/utils.py                 | 43
>>     ++++++++++++++++++++++++++++++++++++
>>       meta/recipes-core/ovmf/ovmf_git.bb <http://ovmf_git.bb>   |  2 +-
>>
>>       meta/recipes-support/boost/boost.inc | 24 +-------------------
>>       5 files changed, 47 insertions(+), 65 deletions(-)
>>
>>     diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
>>     index 09b01a84c37..7ecd8c92541 100644
>>     --- a/meta/classes/go.bbclass
>>     +++ b/meta/classes/go.bbclass
>>     @@ -1,23 +1,6 @@
>>       inherit goarch ptest
>>
>>     -def get_go_parallel_make(d):
>>     -    pm =3D (d.getVar('PARALLEL_MAKE') or '').split()
>>     -    # look for '-j' and throw other options (e.g. '-l') away
>>     -    # because they might have a different meaning in golang
>>     -    while pm:
>>     -        opt =3D pm.pop(0)
>>     -        if opt =3D=3D '-j':
>>     -            v =3D pm.pop(0)
>>     -        elif opt.startswith('-j'):
>>     -            v =3D opt[2:].strip()
>>     -        else:
>>     -            continue
>>     -
>>     -        return '-p %d' % int(v)
>>     -
>>     -    return ""
>>     -
>>     -GO_PARALLEL_BUILD ?=3D "${@get_go_parallel_make(d)}"
>>     +GO_PARALLEL_BUILD ?=3D "${@oe.utils.parallel_make_argument(d, '-p
>> %d')}"
>>
>>       GOROOT_class-native =3D "${STAGING_LIBDIR_NATIVE}/go"
>>       GOROOT_class-nativesdk =3D "${STAGING_DIR_TARGET}${libdir}/go"
>>     diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
>>     index bdbdc56767c..f9a851d0759 100644
>>     --- a/meta/classes/waf.bbclass
>>     +++ b/meta/classes/waf.bbclass
>>     @@ -3,28 +3,6 @@ DISABLE_STATIC =3D ""
>>
>>       EXTRA_OECONF_append =3D " ${PACKAGECONFIG_CONFARGS}"
>>
>>     -def get_waf_parallel_make(d):
>>     -    pm =3D d.getVar('PARALLEL_MAKE')
>>     -    if pm:
>>     -        # look for '-j' and throw other options (e.g. '-l') away
>>     -        # because they might have different meaning in bjam
>>     -        pm =3D pm.split()
>>     -        while pm:
>>     -            v =3D None
>>     -            opt =3D pm.pop(0)
>>     -            if opt =3D=3D '-j':
>>     -                v =3D pm.pop(0)
>>     -            elif opt.startswith('-j'):
>>     -                v =3D opt[2:].strip()
>>     -            else:
>>     -                v =3D None
>>     -
>>     -            if v:
>>     -                v =3D min(64, int(v))
>>     -                return '-j' + str(v)
>>     -
>>     -    return ""
>>     -
>>       python waf_preconfigure() {
>>           import subprocess
>>           from distutils.version import StrictVersion
>>     @@ -47,7 +25,7 @@ waf_do_configure() {
>>
>>       do_compile[progress] =3D "outof:^\[\s*(\d+)/\s*(\d+)\]\s+"
>>       waf_do_compile()  {
>>     -       ${S}/waf build ${@get_waf_parallel_make(d)}
>>     +       ${S}/waf build ${@oe.utils.parallel_make_argument(d, '-j%d',
>>     limit=3D64)}
>>       }
>>
>>       waf_do_install() {
>>     diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
>>     index 7a79d752b69..ec91927233a 100644
>>     --- a/meta/lib/oe/utils.py
>>     +++ b/meta/lib/oe/utils.py
>>     @@ -156,6 +156,49 @@ def any_distro_features(d, features,
>>     truevalue=3D"1", falsevalue=3D""):
>>           """
>>           return bb.utils.contains_any("DISTRO_FEATURES", features,
>>     truevalue, falsevalue, d)
>>
>>     +def parallel_make(d):
>>     +    """
>>     +    Return the integer value for the number of parallel threads to
>>     use when
>>     +    building, scraped out of PARALLEL_MAKE. If no parallelization
>>     option is
>>     +    found, returns None
>>     +
>>     +    e.g. if PARALLEL_MAKE =3D "-j 10", this will return 10 as an
>> integer.
>>     +    """
>>     +    pm =3D (d.getVar('PARALLEL_MAKE') or '').split()
>>     +    # look for '-j' and throw other options (e.g. '-l') away
>>     +    while pm:
>>     +        opt =3D pm.pop(0)
>>     +        if opt =3D=3D '-j':
>>     +            v =3D pm.pop(0)
>>     +        elif opt.startswith('-j'):
>>     +            v =3D opt[2:].strip()
>>     +        else:
>>     +            continue
>>     +
>>     +        return int(v)
>>     +
>>     +    return None
>>     +
>>     +def parallel_make_argument(d, fmt, limit=3DNone):
>>     +    """
>>     +    Helper utility to construct a parallel make argument from the
>>     number of
>>     +    parallel threads specified in PARALLEL_MAKE.
>>     +
>>     +    Returns the input format string `fmt` where a single '%d' will
>>     be expanded
>>     +    with the number of parallel threads to use. If `limit` is
>>     specified, the
>>     +    number of parallel threads will be no larger than it. If no
>>     parallelization
>>     +    option is found in PARALLEL_MAKE, returns an empty string
>>     +
>>     +    e.g. if PARALLEL_MAKE =3D "-j 10", parallel_make_argument(d, "-=
n
>>     %d") will return
>>     +    "-n 10"
>>     +    """
>>     +    v =3D parallel_make(d)
>>     +    if v:
>>     +        if limit:
>>     +            v =3D max(limit, v)
>>     +        return fmt % v
>>     +    return ''
>>     +
>>       def packages_filter_out_system(d):
>>           """
>>           Return a list of packages from PACKAGES with the "system"
>>     packages such as
>>     diff --git a/meta/recipes-core/ovmf/ovmf_git.bb <http://ovmf_git.bb>
>>     b/meta/recipes-core/ovmf/ovmf_git.bb <http://ovmf_git.bb>
>>     index fa0d66291d1..8750b3c528d 100644
>>     --- a/meta/recipes-core/ovmf/ovmf_git.bb <http://ovmf_git.bb>
>>     +++ b/meta/recipes-core/ovmf/ovmf_git.bb <http://ovmf_git.bb>
>>
>>     @@ -151,7 +151,7 @@ do_compile_class-native() {
>>
>>       do_compile_class-target() {
>>           export LFLAGS=3D"${LDFLAGS}"
>>     -    PARALLEL_JOBS=3D"${@ '${PARALLEL_MAKE}'.replace('-j', '-n ')}"
>>     +    PARALLEL_JOBS=3D"${@oe.utils.parallel_make_argument(d, '-n %d')=
}"
>>           OVMF_ARCH=3D"X64"
>>           if [ "${TARGET_ARCH}" !=3D "x86_64" ] ; then
>>               OVMF_ARCH=3D"IA32"
>>     diff --git a/meta/recipes-support/boost/boost.inc
>>     b/meta/recipes-support/boost/boost.inc
>>     index 41fc90fb211..0461ec6fcf1 100644
>>     --- a/meta/recipes-support/boost/boost.inc
>>     +++ b/meta/recipes-support/boost/boost.inc
>>     @@ -135,29 +135,7 @@ BJAM_TOOLS   =3D "--ignore-site-config \
>>
>>       # use PARALLEL_MAKE to speed up the build, but limit it by -j 64,
>>     greater parallelism causes bjam to segfault or to ignore -j
>>       # https://svn.boost.org/trac/boost/ticket/7634
>>     <https://svn.boost.org/trac/boost/ticket/7634>
>>     -def get_boost_parallel_make(d):
>>     -    pm =3D d.getVar('PARALLEL_MAKE')
>>     -    if pm:
>>     -        # look for '-j' and throw other options (e.g. '-l') away
>>     -        # because they might have different meaning in bjam
>>     -        pm =3D pm.split()
>>     -        while pm:
>>     -            v =3D None
>>     -            opt =3D pm.pop(0)
>>     -            if opt =3D=3D '-j':
>>     -                v =3D pm.pop(0)
>>     -            elif opt.startswith('-j'):
>>     -                v =3D opt[2:].strip()
>>     -            else:
>>     -                v =3D None
>>     -
>>     -            if v:
>>     -                v =3D min(64, int(v))
>>     -                return '-j' + str(v)
>>     -
>>     -    return ""
>>     -
>>     -BOOST_PARALLEL_MAKE =3D "${@get_boost_parallel_make(d)}"
>>     +BOOST_PARALLEL_MAKE =3D "${@oe.utils.parallel_make_argument(d,
>>     '-j%d', limit=3D64)}"
>>       BJAM_OPTS    =3D '${BOOST_PARALLEL_MAKE} -d+2 -q \
>>                      ${BJAM_TOOLS} \
>>                      -sBOOST_BUILD_USER_CONFIG=3D${WORKDIR}/user-config.=
jam
>> \
>>     --
>>     2.14.3
>>
>>     --
>>     _______________________________________________
>>     Openembedded-core mailing list
>>     Openembedded-core@lists.openembedded.org
>>     <mailto:Openembedded-core@lists.openembedded.org>
>>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>>
>>
>>
>> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
>
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>

--089e0826ee94d038890565721fb5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote"><div dir=3D"auto">On Sat, Feb 17, 2018 =
at 4:48 PM Joshua Watt &lt;<a href=3D"mailto:jpewhacker@gmail.com">jpewhack=
er@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div di=
r=3D"auto"><div><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quot=
e">On Feb 17, 2018 18:25, &quot;Khem Raj&quot; &lt;<a href=3D"mailto:raj.kh=
em@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br type=
=3D"attribution"><blockquote class=3D"m_3334658293791266598quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=
=3D"m_3334658293791266598quoted-text"><br>
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
g it.<br></blockquote></div></div></div><div dir=3D"auto"><br></div></div><=
div dir=3D"auto"><div dir=3D"auto">I don&#39;t know about that. Doesn&#39;t=
 PARALLEL_MAKE already default to something based on ncpu()? My understandi=
ng of the limit was that some recipes (boost? waf?) have a limit on the amo=
unt of parallism they can reasonably stand, and you don&#39;t want those re=
cipes to break if someone sets=C2=A0<span style=3D"font-family:sans-serif">=
PARALLEL_MAKE=3D&quot;-j 1000&quot;.</span></div><div dir=3D"auto"><span st=
yle=3D"font-family:sans-serif"></span></div></div></blockquote><div dir=3D"=
auto"><br></div><div dir=3D"auto">Ah yes that=E2=80=99s a fair point=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex"><div dir=3D"auto"><div dir=3D"auto"><sp=
an style=3D"font-family:sans-serif"><br></span></div><div dir=3D"auto">As l=
ong as that is true I think this is correct. Whether those recipes still ne=
ed to limit their parallism is another discussion.</div><div dir=3D"auto"><=
br></div><div dir=3D"auto"><div class=3D"gmail_extra"><div class=3D"gmail_q=
uote"><blockquote class=3D"m_3334658293791266598quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"></blockquote></div></di=
v></div></div><div dir=3D"auto"><div dir=3D"auto"><div class=3D"gmail_extra=
"><div class=3D"gmail_quote"><blockquote class=3D"m_3334658293791266598quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"m_3334658293791266598quoted-te=
xt">
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
_blank">JPEWhacker@gmail.com</a>&gt;&gt;<div class=3D"m_3334658293791266598=
quoted-text"><br>
=C2=A0 =C2=A0 ---<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0meta/classes/go.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 19 +---------------<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0meta/classes/waf.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 24 +-------------------<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0meta/lib/oe/utils.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 43<br>
=C2=A0 =C2=A0 ++++++++++++++++++++++++++++++++++++<br></div>
=C2=A0 =C2=A0 =C2=A0=C2=A0meta/recipes-core/ovmf/<a href=3D"http://ovmf_git=
.bb" rel=3D"noreferrer" target=3D"_blank">ovmf_git.bb</a> &lt;<a href=3D"ht=
tp://ovmf_git.bb" rel=3D"noreferrer" target=3D"_blank">http://ovmf_git.bb</=
a>&gt;=C2=A0 =C2=A0|=C2=A0 2 +-<div class=3D"m_3334658293791266598elided-te=
xt"><br>
=C2=A0 =C2=A0 =C2=A0=C2=A0meta/recipes-support/boost/boost.inc | 24 +------=
-------------<br>
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
=C2=A0 =C2=A0 +GO_PARALLEL_BUILD ?=3D &quot;${@oe.utils.parallel_make_argum=
ent(d, &#39;-p %d&#39;)}&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0GOROOT_class-native =3D &quot;${STAGING_LIBDIR_NA=
TIVE}/go&quot;<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0GOROOT_class-nativesdk =3D &quot;${STAGING_DIR_TA=
RGET}${libdir}/go&quot;<br>
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
\s*(\d+)\]\s+&quot;<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0waf_do_compile()=C2=A0 {<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0${S}/waf build ${@get_waf_paralle=
l_make(d)}<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0${S}/waf build ${@oe.utils.parall=
el_make_argument(d, &#39;-j%d&#39;,<br>
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
DISTRO_FEATURES&quot;, features,<br>
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
t.bb" rel=3D"noreferrer" target=3D"_blank">ovmf_git.bb</a> &lt;<a href=3D"h=
ttp://ovmf_git.bb" rel=3D"noreferrer" target=3D"_blank">http://ovmf_git.bb<=
/a>&gt;<br>
=C2=A0 =C2=A0 b/meta/recipes-core/ovmf/<a href=3D"http://ovmf_git.bb" rel=
=3D"noreferrer" target=3D"_blank">ovmf_git.bb</a> &lt;<a href=3D"http://ovm=
f_git.bb" rel=3D"noreferrer" target=3D"_blank">http://ovmf_git.bb</a>&gt;<b=
r>
=C2=A0 =C2=A0 index fa0d66291d1..8750b3c528d 100644<br>
=C2=A0 =C2=A0 --- a/meta/recipes-core/ovmf/<a href=3D"http://ovmf_git.bb" r=
el=3D"noreferrer" target=3D"_blank">ovmf_git.bb</a> &lt;<a href=3D"http://o=
vmf_git.bb" rel=3D"noreferrer" target=3D"_blank">http://ovmf_git.bb</a>&gt;=
<br>
=C2=A0 =C2=A0 +++ b/meta/recipes-core/ovmf/<a href=3D"http://ovmf_git.bb" r=
el=3D"noreferrer" target=3D"_blank">ovmf_git.bb</a> &lt;<a href=3D"http://o=
vmf_git.bb" rel=3D"noreferrer" target=3D"_blank">http://ovmf_git.bb</a>&gt;=
<div class=3D"m_3334658293791266598elided-text"><br>
=C2=A0 =C2=A0 @@ -151,7 +151,7 @@ do_compile_class-native() {<br>
<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0do_compile_class-target() {<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0export LFLAGS=3D&quot;${LDFLAGS}&qu=
ot;<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 PARALLEL_JOBS=3D&quot;${@ &#39;${PARALLEL_MAKE=
}&#39;.replace(&#39;-j&#39;, &#39;-n &#39;)}&quot;<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 PARALLEL_JOBS=3D&quot;${@oe.utils.parallel_mak=
e_argument(d, &#39;-n %d&#39;)}&quot;<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0OVMF_ARCH=3D&quot;X64&quot;<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0if [ &quot;${TARGET_ARCH}&quot; !=
=3D &quot;x86_64&quot; ] ; then<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OVMF_ARCH=3D&quot;IA3=
2&quot;<br>
=C2=A0 =C2=A0 diff --git a/meta/recipes-support/boost/boost.inc<br>
=C2=A0 =C2=A0 b/meta/recipes-support/boost/boost.inc<br>
=C2=A0 =C2=A0 index 41fc90fb211..0461ec6fcf1 100644<br>
=C2=A0 =C2=A0 --- a/meta/recipes-support/boost/boost.inc<br>
=C2=A0 =C2=A0 +++ b/meta/recipes-support/boost/boost.inc<br>
=C2=A0 =C2=A0 @@ -135,29 +135,7 @@ BJAM_TOOLS=C2=A0 =C2=A0=3D &quot;--ignor=
e-site-config \<br>
<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0# use PARALLEL_MAKE to speed up the build, but li=
mit it by -j 64,<br>
=C2=A0 =C2=A0 greater parallelism causes bjam to segfault or to ignore -j<b=
r>
=C2=A0 =C2=A0 =C2=A0=C2=A0# <a href=3D"https://svn.boost.org/trac/boost/tic=
ket/7634" rel=3D"noreferrer" target=3D"_blank">https://svn.boost.org/trac/b=
oost/ticket/7634</a><br>
=C2=A0 =C2=A0 &lt;<a href=3D"https://svn.boost.org/trac/boost/ticket/7634" =
rel=3D"noreferrer" target=3D"_blank">https://svn.boost.org/trac/boost/ticke=
t/7634</a>&gt;<br>
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
=C2=A0 =C2=A0 -BOOST_PARALLEL_MAKE =3D &quot;${@get_boost_parallel_make(d)}=
&quot;<br>
=C2=A0 =C2=A0 +BOOST_PARALLEL_MAKE =3D &quot;${@oe.utils.parallel_make_argu=
ment(d,<br>
=C2=A0 =C2=A0 &#39;-j%d&#39;, limit=3D64)}&quot;<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0BJAM_OPTS=C2=A0 =C2=A0 =3D &#39;${BOOST_PARALLEL_=
MAKE} -d+2 -q \<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 ${BJAM_TOOLS} \<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 -sBOOST_BUILD_USER_CONFIG=3D${WORKDIR}/user-config.jam \<br>
=C2=A0 =C2=A0 --<br>
=C2=A0 =C2=A0 2.14.3<br>
<br>
=C2=A0 =C2=A0 --<br>
=C2=A0 =C2=A0 _______________________________________________<br>
=C2=A0 =C2=A0 Openembedded-core mailing list<br>
=C2=A0 =C2=A0 <a href=3D"mailto:Openembedded-core@lists.openembedded.org" t=
arget=3D"_blank">Openembedded-core@lists.openembedded.org</a><br></div>
=C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:Openembedded-core@lists.openembe=
dded.org" target=3D"_blank">Openembedded-core@lists.openembedded.org</a>&gt=
;<br>
=C2=A0 =C2=A0 <a href=3D"http://lists.openembedded.org/mailman/listinfo/ope=
nembedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembed=
ded.org/mailman/listinfo/openembedded-core</a><br>
=C2=A0 =C2=A0 &lt;<a href=3D"http://lists.openembedded.org/mailman/listinfo=
/openembedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.opene=
mbedded.org/mailman/listinfo/openembedded-core</a>&gt;<br>
<br>
<br>
<br>
</blockquote></blockquote></div></div></div></div><div dir=3D"auto"><div di=
r=3D"auto"><div class=3D"gmail_extra"><div class=3D"gmail_quote"><blockquot=
e class=3D"m_3334658293791266598quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex"><div class=3D"m_3334658293791266598elid=
ed-text">
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
</div></blockquote></div></div></div></div><div dir=3D"auto"><div dir=3D"au=
to"><div class=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=
=3D"m_3334658293791266598quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex"><div class=3D"m_3334658293791266598elided-text=
"><a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-co=
re" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mail=
man/listinfo/openembedded-core</a><br>
</div></blockquote></div><br></div></div></div>
</blockquote></div></div>

--089e0826ee94d038890565721fb5--
