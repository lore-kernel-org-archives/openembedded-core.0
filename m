Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id D887C7199E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Feb 2018 20:23:32 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id 30so147101iog.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Feb 2018 12:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:cc:date:in-reply-to:references
	:mime-version; bh=LH9fQS2y4zpBPnju1hTLFs5oHVB0TLDw5B8ngd8e3hQ=;
	b=O0lfTyO/Ad2BqNZaQiOgVpSmWY2vmOssNWWx7JWCGTPA5LMVRwxMiHx6nt26J0s/2h
	3I/IOglqCK1YJDadDnsGvpwkJHTqYYKuuBXhhL35mZbcyU9gSkf+7gVAYliAH1EHpLGK
	RSNBtZ5qoD/Ohe2ZKKruGeTtVugM/xwQAxDAu1Cmy3OSjNirC7so71NjPKTeQwq//pcr
	YV3RkbZKgrfpoaa5xUGwpQNNX0Jy4PsI11+PRDsf1ZLAC9eljCoSXROcPlKOzJgiCxP9
	jlMyxN2YMK+5DJe4XmV1RxFFYfwggtkROKyDkak6x3lpszGgcxmHR1f1uRwNw23gR0rr
	Sw9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:cc:date:in-reply-to
	:references:mime-version;
	bh=LH9fQS2y4zpBPnju1hTLFs5oHVB0TLDw5B8ngd8e3hQ=;
	b=VggvQeHSb4dsz9TSIIqWh1Ny1CNzPBiKsOxLYSjdBre18VcjnEtkrMJbR8GsXbIrI7
	qoel/L4l6Ai9szTtxlJ7UrHtTZcrHi8lG1qrEgmGExg409DOLGGosXFLX0EwmrqoUiM5
	Eau15KX5dClYOMEWvzKDbaC7fr1P5YmFiSn4pSNAb13RUGylWkpMofzTBanBBZx3BWGy
	gsHMnte8Piklmi82Y2mH7T2h+FPQ4fguM4DbrCS2sfFFB7czzsMYcxLyWTa6SrzP+hsw
	yRIr0o3vKCfQmC1mzvJkSMc2zuAner+m1OWREoHiCdgWo7wjKOGZY8aJVap5geWO3wTm
	UC9g==
X-Gm-Message-State: APf1xPArHMnea9BvYMaJfCTVUZPDLMP735W8vvYb0IrDIZJ2Uk5VhNVE
	Na1K1VHQo6bRhHm1Rp1+cBA=
X-Google-Smtp-Source: AH8x224nOPh+l0S9NDZwW4b89AItELbOHSelVtPVW4SjrODn4uydTDLJqktuEHc6E7CcBt29TjAAEw==
X-Received: by 10.107.12.32 with SMTP id w32mr9974915ioi.132.1518812613787;
	Fri, 16 Feb 2018 12:23:33 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	z75sm2514560ita.3.2018.02.16.12.23.33
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 16 Feb 2018 12:23:33 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <1518812612.6900.48.camel@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 16 Feb 2018 14:23:32 -0600
In-Reply-To: <CA+chaQfqemdC3a70o9sjGRb+RWfb-Uoaea6a2apYkTaz2uomyA@mail.gmail.com>
References: <20180212193958.19804-1-JPEWhacker@gmail.com>
	<CA+chaQfqemdC3a70o9sjGRb+RWfb-Uoaea6a2apYkTaz2uomyA@mail.gmail.com>
X-Mailer: Evolution 3.26.4 (3.26.4-1.fc27) 
Mime-Version: 1.0
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
X-List-Received-Date: Fri, 16 Feb 2018 20:23:33 -0000
Content-Type: multipart/alternative; boundary="=-o8C6Hkui8/T9FUnOZqNe"

--=-o8C6Hkui8/T9FUnOZqNe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-02-16 at 21:14 +0100, Martin Jansa wrote:
> +            v = max(limit, v)
> 
> 
> this seems to be doing the opposite of what the limit was used for
> before:
> 
> 
> -                v = min(64, int(v))
> 

Hmm, you're right


On Mon, Feb 12, 2018 at 8:39 PM, Joshua Watt <jpewhacker@gmail.com> wrote:
The code to extract the integer number of parallel build threads and

construct a new argument from them has started to be copied in multiple

locations, so create two new helper utilities to aid recipes.


The first helper (parallel_make()) extracts the integer number of

parallel build threads from PARALLEL_MAKE. The second

(parallel_make_argument()) does the same and then puts the result back

into a format string, optionally clamping it to some maximum value.


Additionally, rework the oe-core recipes that were manually doing this

to use the new helper utilities.


Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>

---

 meta/classes/go.bbclass              | 19 +---------------

 meta/classes/waf.bbclass             | 24 +-------------------

 meta/lib/oe/utils.py                 | 43 ++++++++++++++++++++++++++++++++++++

 meta/recipes-core/ovmf/ovmf_git.bb   |  2 +-

 meta/recipes-support/boost/boost.inc | 24 +-------------------

 5 files changed, 47 insertions(+), 65 deletions(-)


diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass

index 09b01a84c37..7ecd8c92541 100644

--- a/meta/classes/go.bbclass

+++ b/meta/classes/go.bbclass

@@ -1,23 +1,6 @@

 inherit goarch ptest


-def get_go_parallel_make(d):

-    pm = (d.getVar('PARALLEL_MAKE') or '').split()

-    # look for '-j' and throw other options (e.g. '-l') away

-    # because they might have a different meaning in golang

-    while pm:

-        opt = pm.pop(0)

-        if opt == '-j':

-            v = pm.pop(0)

-        elif opt.startswith('-j'):

-            v = opt[2:].strip()

-        else:

-            continue

-

-        return '-p %d' % int(v)

-

-    return ""

-

-GO_PARALLEL_BUILD ?= "${@get_go_parallel_make(d)}"

+GO_PARALLEL_BUILD ?= "${@oe.utils.parallel_make_argument(d, '-p %d')}"


 GOROOT_class-native = "${STAGING_LIBDIR_NATIVE}/go"

 GOROOT_class-nativesdk = "${STAGING_DIR_TARGET}${libdir}/go"

diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass

index bdbdc56767c..f9a851d0759 100644

--- a/meta/classes/waf.bbclass

+++ b/meta/classes/waf.bbclass

@@ -3,28 +3,6 @@ DISABLE_STATIC = ""


 EXTRA_OECONF_append = " ${PACKAGECONFIG_CONFARGS}"


-def get_waf_parallel_make(d):

-    pm = d.getVar('PARALLEL_MAKE')

-    if pm:

-        # look for '-j' and throw other options (e.g. '-l') away

-        # because they might have different meaning in bjam

-        pm = pm.split()

-        while pm:

-            v = None

-            opt = pm.pop(0)

-            if opt == '-j':

-                v = pm.pop(0)

-            elif opt.startswith('-j'):

-                v = opt[2:].strip()

-            else:

-                v = None

-

-            if v:

-                v = min(64, int(v))

-                return '-j' + str(v)

-

-    return ""

-

 python waf_preconfigure() {

     import subprocess

     from distutils.version import StrictVersion

@@ -47,7 +25,7 @@ waf_do_configure() {


 do_compile[progress] = "outof:^\[\s*(\d+)/\s*(\d+)\]\s+"

 waf_do_compile()  {

-       ${S}/waf build ${@get_waf_parallel_make(d)}

+       ${S}/waf build ${@oe.utils.parallel_make_argument(d, '-j%d', limit=64)}

 }


 waf_do_install() {

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py

index 7a79d752b69..ec91927233a 100644

--- a/meta/lib/oe/utils.py

+++ b/meta/lib/oe/utils.py

@@ -156,6 +156,49 @@ def any_distro_features(d, features, truevalue="1", falsevalue=""):

     """

     return bb.utils.contains_any("DISTRO_FEATURES", features, truevalue, falsevalue, d)


+def parallel_make(d):

+    """

+    Return the integer value for the number of parallel threads to use when

+    building, scraped out of PARALLEL_MAKE. If no parallelization option is

+    found, returns None

+

+    e.g. if PARALLEL_MAKE = "-j 10", this will return 10 as an integer.

+    """

+    pm = (d.getVar('PARALLEL_MAKE') or '').split()

+    # look for '-j' and throw other options (e.g. '-l') away

+    while pm:

+        opt = pm.pop(0)

+        if opt == '-j':

+            v = pm.pop(0)

+        elif opt.startswith('-j'):

+            v = opt[2:].strip()

+        else:

+            continue

+

+        return int(v)

+

+    return None

+

+def parallel_make_argument(d, fmt, limit=None):

+    """

+    Helper utility to construct a parallel make argument from the number of

+    parallel threads specified in PARALLEL_MAKE.

+

+    Returns the input format string `fmt` where a single '%d' will be expanded

+    with the number of parallel threads to use. If `limit` is specified, the

+    number of parallel threads will be no larger than it. If no parallelization

+    option is found in PARALLEL_MAKE, returns an empty string

+

+    e.g. if PARALLEL_MAKE = "-j 10", parallel_make_argument(d, "-n %d") will return

+    "-n 10"

+    """

+    v = parallel_make(d)

+    if v:

+        if limit:

+            v = max(limit, v)

+        return fmt % v

+    return ''

+

 def packages_filter_out_system(d):

     """

     Return a list of packages from PACKAGES with the "system" packages such as

diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb

index fa0d66291d1..8750b3c528d 100644

--- a/meta/recipes-core/ovmf/ovmf_git.bb

+++ b/meta/recipes-core/ovmf/ovmf_git.bb

@@ -151,7 +151,7 @@ do_compile_class-native() {


 do_compile_class-target() {

     export LFLAGS="${LDFLAGS}"

-    PARALLEL_JOBS="${@ '${PARALLEL_MAKE}'.replace('-j', '-n ')}"

+    PARALLEL_JOBS="${@oe.utils.parallel_make_argument(d, '-n %d')}"

     OVMF_ARCH="X64"

     if [ "${TARGET_ARCH}" != "x86_64" ] ; then

         OVMF_ARCH="IA32"

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc

index 41fc90fb211..0461ec6fcf1 100644

--- a/meta/recipes-support/boost/boost.inc

+++ b/meta/recipes-support/boost/boost.inc

@@ -135,29 +135,7 @@ BJAM_TOOLS   = "--ignore-site-config \


 # use PARALLEL_MAKE to speed up the build, but limit it by -j 64, greater parallelism causes bjam to segfault or to ignore -j

 # https://svn.boost.org/trac/boost/ticket/7634

-def get_boost_parallel_make(d):

-    pm = d.getVar('PARALLEL_MAKE')

-    if pm:

-        # look for '-j' and throw other options (e.g. '-l') away

-        # because they might have different meaning in bjam

-        pm = pm.split()

-        while pm:

-            v = None

-            opt = pm.pop(0)

-            if opt == '-j':

-                v = pm.pop(0)

-            elif opt.startswith('-j'):

-                v = opt[2:].strip()

-            else:

-                v = None

-

-            if v:

-                v = min(64, int(v))

-                return '-j' + str(v)

-

-    return ""

-

-BOOST_PARALLEL_MAKE = "${@get_boost_parallel_make(d)}"

+BOOST_PARALLEL_MAKE = "${@oe.utils.parallel_make_argument(d, '-j%d', limit=64)}"

 BJAM_OPTS    = '${BOOST_PARALLEL_MAKE} -d+2 -q \

                ${BJAM_TOOLS} \

                -sBOOST_BUILD_USER_CONFIG=${WORKDIR}/user-config.jam \
--

2.14.3


--

_______________________________________________

Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=-o8C6Hkui8/T9FUnOZqNe
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div>On Fri, 2018-02-16 at 21:14 +0100, Martin Jan=
sa wrote:</div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border=
-left:2px #729fcf solid;padding-left:1ex"><div dir=3D"ltr"><span style=3D"c=
olor:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style=
:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:=
400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:n=
one;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);t=
ext-decoration-style:initial;text-decoration-color:initial;float:none;displ=
ay:inline">+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; v =3D max(limit, v)</=
span><br><div><span style=3D"color:rgb(34,34,34);font-family:arial,sans-ser=
if;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-va=
riant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;te=
xt-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backg=
round-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-=
color:initial;float:none;display:inline"><br></span></div><div><span style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-=
style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-we=
ight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transf=
orm:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,2=
55);text-decoration-style:initial;text-decoration-color:initial;float:none;=
display:inline">this seems to be doing the opposite of what the limit was u=
sed for before:</span></div><div><span style=3D"color:rgb(34,34,34);font-fa=
mily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligat=
ures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;=
text-align:start;text-indent:0px;text-transform:none;white-space:normal;wor=
d-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initi=
al;text-decoration-color:initial;float:none;display:inline"><br></span></di=
v><div><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font=
-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-c=
aps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inde=
nt:0px;text-transform:none;white-space:normal;word-spacing:0px;background-c=
olor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:i=
nitial;float:none;display:inline"><span style=3D"color:rgb(34,34,34);font-f=
amily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-liga=
tures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal=
;text-align:start;text-indent:0px;text-transform:none;white-space:normal;wo=
rd-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:init=
ial;text-decoration-color:initial;float:none;display:inline">-&nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; v =3D min(64, int(v))</span><br>=
</span></div></div></blockquote><div><br></div><div>Hmm, you're right</div>=
<div><br></div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border=
-left:2px #729fcf solid;padding-left:1ex"><div class=3D"gmail_extra"><br><d=
iv class=3D"gmail_quote">On Mon, Feb 12, 2018 at 8:39 PM, Joshua Watt <span=
 dir=3D"ltr">&lt;<a href=3D"mailto:jpewhacker@gmail.com" target=3D"_blank">=
jpewhacker@gmail.com</a>&gt;</span> wrote:<br><blockquote type=3D"cite" sty=
le=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex">Th=
e code to extract the integer number of parallel build threads and<br>
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
&nbsp;meta/classes/go.bbclass&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; | 19 +---------------<br>
&nbsp;meta/classes/waf.bbclass&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;| 24 +-------------------<br>
&nbsp;meta/lib/oe/utils.py&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;| 43 ++++++++++++++++++++++++++++++<wbr>++++++<br>
&nbsp;meta/recipes-core/ovmf/<a href=3D"http://ovmf_git.bb" rel=3D"noreferr=
er" target=3D"_blank">ovmf_<wbr>git.bb</a>&nbsp; &nbsp;|&nbsp; 2 +-<br>
&nbsp;meta/recipes-support/boost/<wbr>boost.inc | 24 +-------------------<b=
r>
&nbsp;5 files changed, 47 insertions(+), 65 deletions(-)<br>
<br>
diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass<br>
index 09b01a84c37..7ecd8c92541 100644<br>
--- a/meta/classes/go.bbclass<br>
+++ b/meta/classes/go.bbclass<br>
@@ -1,23 +1,6 @@<br>
&nbsp;inherit goarch ptest<br>
<br>
-def get_go_parallel_make(d):<br>
-&nbsp; &nbsp; pm =3D (d.getVar('PARALLEL_MAKE') or '').split()<br>
-&nbsp; &nbsp; # look for '-j' and throw other options (e.g. '-l') away<br>
-&nbsp; &nbsp; # because they might have a different meaning in golang<br>
-&nbsp; &nbsp; while pm:<br>
-&nbsp; &nbsp; &nbsp; &nbsp; opt =3D pm.pop(0)<br>
-&nbsp; &nbsp; &nbsp; &nbsp; if opt =3D=3D '-j':<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; v =3D pm.pop(0)<br>
-&nbsp; &nbsp; &nbsp; &nbsp; elif opt.startswith('-j'):<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; v =3D opt[2:].strip()<br>
-&nbsp; &nbsp; &nbsp; &nbsp; else:<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; continue<br>
-<br>
-&nbsp; &nbsp; &nbsp; &nbsp; return '-p %d' % int(v)<br>
-<br>
-&nbsp; &nbsp; return ""<br>
-<br>
-GO_PARALLEL_BUILD ?=3D "${@get_go_parallel_make(d)}"<br>
+GO_PARALLEL_BUILD ?=3D "${@oe.utils.parallel_make_<wbr>argument(d, '-p %d'=
)}"<br>
<br>
&nbsp;GOROOT_class-native =3D "${STAGING_LIBDIR_NATIVE}/go"<br>
&nbsp;GOROOT_class-nativesdk =3D "${STAGING_DIR_TARGET}${<wbr>libdir}/go"<b=
r>
diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass<br>
index bdbdc56767c..f9a851d0759 100644<br>
--- a/meta/classes/waf.bbclass<br>
+++ b/meta/classes/waf.bbclass<br>
@@ -3,28 +3,6 @@ DISABLE_STATIC =3D ""<br>
<br>
&nbsp;EXTRA_OECONF_append =3D " ${PACKAGECONFIG_CONFARGS}"<br>
<br>
-def get_waf_parallel_make(d):<br>
-&nbsp; &nbsp; pm =3D d.getVar('PARALLEL_MAKE')<br>
-&nbsp; &nbsp; if pm:<br>
-&nbsp; &nbsp; &nbsp; &nbsp; # look for '-j' and throw other options (e.g. =
'-l') away<br>
-&nbsp; &nbsp; &nbsp; &nbsp; # because they might have different meaning in=
 bjam<br>
-&nbsp; &nbsp; &nbsp; &nbsp; pm =3D pm.split()<br>
-&nbsp; &nbsp; &nbsp; &nbsp; while pm:<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; v =3D None<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; opt =3D pm.pop(0)<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if opt =3D=3D '-j':<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; v =3D pm.pop(0)<br=
>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; elif opt.startswith('-j'):<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; v =3D opt[2:].stri=
p()<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; else:<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; v =3D None<br>
-<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if v:<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; v =3D min(64, int(=
v))<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return '-j' + str(=
v)<br>
-<br>
-&nbsp; &nbsp; return ""<br>
-<br>
&nbsp;python waf_preconfigure() {<br>
&nbsp; &nbsp; &nbsp;import subprocess<br>
&nbsp; &nbsp; &nbsp;from distutils.version import StrictVersion<br>
@@ -47,7 +25,7 @@ waf_do_configure() {<br>
<br>
&nbsp;do_compile[progress] =3D "outof:^\[\s*(\d+)/\s*(\d+)\]\<wbr>s+"<br>
&nbsp;waf_do_compile()&nbsp; {<br>
-&nbsp; &nbsp; &nbsp; &nbsp;${S}/waf build ${@get_waf_parallel_make(d)}<br>
+&nbsp; &nbsp; &nbsp; &nbsp;${S}/waf build ${@oe.utils.parallel_make_<wbr>a=
rgument(d, '-j%d', limit=3D64)}<br>
&nbsp;}<br>
<br>
&nbsp;waf_do_install() {<br>
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py<br>
index 7a79d752b69..ec91927233a 100644<br>
--- a/meta/lib/oe/utils.py<br>
+++ b/meta/lib/oe/utils.py<br>
@@ -156,6 +156,49 @@ def any_distro_features(d, features, truevalue=3D"1", =
falsevalue=3D""):<br>
&nbsp; &nbsp; &nbsp;"""<br>
&nbsp; &nbsp; &nbsp;return bb.utils.contains_any("DISTRO_<wbr>FEATURES", fe=
atures, truevalue, falsevalue, d)<br>
<br>
+def parallel_make(d):<br>
+&nbsp; &nbsp; """<br>
+&nbsp; &nbsp; Return the integer value for the number of parallel threads =
to use when<br>
+&nbsp; &nbsp; building, scraped out of PARALLEL_MAKE. If no parallelizatio=
n option is<br>
+&nbsp; &nbsp; found, returns None<br>
+<br>
+&nbsp; &nbsp; e.g. if PARALLEL_MAKE =3D "-j 10", this will return 10 as an=
 integer.<br>
+&nbsp; &nbsp; """<br>
+&nbsp; &nbsp; pm =3D (d.getVar('PARALLEL_MAKE') or '').split()<br>
+&nbsp; &nbsp; # look for '-j' and throw other options (e.g. '-l') away<br>
+&nbsp; &nbsp; while pm:<br>
+&nbsp; &nbsp; &nbsp; &nbsp; opt =3D pm.pop(0)<br>
+&nbsp; &nbsp; &nbsp; &nbsp; if opt =3D=3D '-j':<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; v =3D pm.pop(0)<br>
+&nbsp; &nbsp; &nbsp; &nbsp; elif opt.startswith('-j'):<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; v =3D opt[2:].strip()<br>
+&nbsp; &nbsp; &nbsp; &nbsp; else:<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; continue<br>
+<br>
+&nbsp; &nbsp; &nbsp; &nbsp; return int(v)<br>
+<br>
+&nbsp; &nbsp; return None<br>
+<br>
+def parallel_make_argument(d, fmt, limit=3DNone):<br>
+&nbsp; &nbsp; """<br>
+&nbsp; &nbsp; Helper utility to construct a parallel make argument from th=
e number of<br>
+&nbsp; &nbsp; parallel threads specified in PARALLEL_MAKE.<br>
+<br>
+&nbsp; &nbsp; Returns the input format string `fmt` where a single '%d' wi=
ll be expanded<br>
+&nbsp; &nbsp; with the number of parallel threads to use. If `limit` is sp=
ecified, the<br>
+&nbsp; &nbsp; number of parallel threads will be no larger than it. If no =
parallelization<br>
+&nbsp; &nbsp; option is found in PARALLEL_MAKE, returns an empty string<br=
>
+<br>
+&nbsp; &nbsp; e.g. if PARALLEL_MAKE =3D "-j 10", parallel_make_argument(d,=
 "-n %d") will return<br>
+&nbsp; &nbsp; "-n 10"<br>
+&nbsp; &nbsp; """<br>
+&nbsp; &nbsp; v =3D parallel_make(d)<br>
+&nbsp; &nbsp; if v:<br>
+&nbsp; &nbsp; &nbsp; &nbsp; if limit:<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; v =3D max(limit, v)<br>
+&nbsp; &nbsp; &nbsp; &nbsp; return fmt % v<br>
+&nbsp; &nbsp; return ''<br>
+<br>
&nbsp;def packages_filter_out_system(d):<br>
&nbsp; &nbsp; &nbsp;"""<br>
&nbsp; &nbsp; &nbsp;Return a list of packages from PACKAGES with the "syste=
m" packages such as<br>
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
&nbsp;do_compile_class-target() {<br>
&nbsp; &nbsp; &nbsp;export LFLAGS=3D"${LDFLAGS}"<br>
-&nbsp; &nbsp; PARALLEL_JOBS=3D"${@ '${PARALLEL_MAKE}'.replace('-<wbr>j', '=
-n ')}"<br>
+&nbsp; &nbsp; PARALLEL_JOBS=3D"${@oe.utils.<wbr>parallel_make_argument(d, =
'-n %d')}"<br>
&nbsp; &nbsp; &nbsp;OVMF_ARCH=3D"X64"<br>
&nbsp; &nbsp; &nbsp;if [ "${TARGET_ARCH}" !=3D "x86_64" ] ; then<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;OVMF_ARCH=3D"IA32"<br>
diff --git a/meta/recipes-support/boost/<wbr>boost.inc b/meta/recipes-suppo=
rt/boost/<wbr>boost.inc<br>
index 41fc90fb211..0461ec6fcf1 100644<br>
--- a/meta/recipes-support/boost/<wbr>boost.inc<br>
+++ b/meta/recipes-support/boost/<wbr>boost.inc<br>
@@ -135,29 +135,7 @@ BJAM_TOOLS&nbsp; &nbsp;=3D "--ignore-site-config \<br>
<br>
&nbsp;# use PARALLEL_MAKE to speed up the build, but limit it by -j 64, gre=
ater parallelism causes bjam to segfault or to ignore -j<br>
&nbsp;# <a href=3D"https://svn.boost.org/trac/boost/ticket/7634" rel=3D"nor=
eferrer" target=3D"_blank">https://svn.boost.org/trac/<wbr>boost/ticket/763=
4</a><br>
-def get_boost_parallel_make(d):<br>
-&nbsp; &nbsp; pm =3D d.getVar('PARALLEL_MAKE')<br>
-&nbsp; &nbsp; if pm:<br>
-&nbsp; &nbsp; &nbsp; &nbsp; # look for '-j' and throw other options (e.g. =
'-l') away<br>
-&nbsp; &nbsp; &nbsp; &nbsp; # because they might have different meaning in=
 bjam<br>
-&nbsp; &nbsp; &nbsp; &nbsp; pm =3D pm.split()<br>
-&nbsp; &nbsp; &nbsp; &nbsp; while pm:<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; v =3D None<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; opt =3D pm.pop(0)<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if opt =3D=3D '-j':<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; v =3D pm.pop(0)<br=
>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; elif opt.startswith('-j'):<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; v =3D opt[2:].stri=
p()<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; else:<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; v =3D None<br>
-<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if v:<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; v =3D min(64, int(=
v))<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return '-j' + str(=
v)<br>
-<br>
-&nbsp; &nbsp; return ""<br>
-<br>
-BOOST_PARALLEL_MAKE =3D "${@get_boost_parallel_make(d)<wbr>}"<br>
+BOOST_PARALLEL_MAKE =3D "${@oe.utils.parallel_make_<wbr>argument(d, '-j%d'=
, limit=3D64)}"<br>
&nbsp;BJAM_OPTS&nbsp; &nbsp; =3D '${BOOST_PARALLEL_MAKE} -d+2 -q \<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ${BJAM_TOOLS} \<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; -sBOOST_BUILD_USER_=
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
</blockquote></body></html>

--=-o8C6Hkui8/T9FUnOZqNe--
