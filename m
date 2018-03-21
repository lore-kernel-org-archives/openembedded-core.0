Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id 7853078967
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 10:44:18 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id b136-v6so6274775iti.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 03:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=m/UtM8qvOlgZplvDnqYkmYN3eq9xLpfskRK9HvbLg/I=;
	b=I0J2aoEOMBl4Y3Y4SHXqMF1hay/4z+vgp9K5FJKAcDMsq5jaT6UNfuc7Z89Nk9eXTw
	a2YRg+gBtm1TbgnUrYE2ciwINLUqWkjE5bc0HB53C/KimTfxstl3DysG2Kn8/d0vVPMl
	V5fFewbkJRnYLuXqtLq0TeIY/lp984Xf+yHUeyrSotDU4lS3wd+vCAa4kf78gSsEN4dZ
	FIkSz1liN72rQO2qDDuRU+sAXHMwdOUKJVrqhC3FC5+DuEiL406RIuiDqNF8ClIIo3kM
	rCPnDAn9Pj0X16KeMIkHbDeJrNFEW7ilTfDWvJLorEb0T7g97kE1+m8gFj8+YwN0tepv
	R8Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=m/UtM8qvOlgZplvDnqYkmYN3eq9xLpfskRK9HvbLg/I=;
	b=qMfouSitw1KIi+jb3YsgNkxKogFU0Q8l/1A0LvDR4abxelJZ6UrZALnpa9SZUHZGlB
	LWS/1cgz1vVEnslU0fwUW5AsBalUB2uKVrau/p2o6blBkb9TcQqtoIyvgV9qhereSKA6
	avOY7c9A54s6ZEXQXS0EOseJjDDLAQSjoFT3KbjkkZXnjhCL36/I4E4lAe4c27duTHqR
	5vEgFVOv7k7WlN5o41zf9HXwVxKg1ostPte1dPRljVUCRNor9Pz1ql3VX90DFAte/ZVv
	pWsUffxakRQGiv8bQOAsco0REXj0ArpVX3J3cfZSK3XYXKShutNrujXI9pH0w1WsGEUR
	R21g==
X-Gm-Message-State: AElRT7G6KIxp6juwLdAU3sHTODoOWmmWxygw5zeqGD1n/jiSRn7U8GAW
	1DZdOcp3cqc8nGcOuIpEDSU6n3Tt9LCwooUygBaH2A==
X-Google-Smtp-Source: AG47ELuN+cdlybwRDnUQxsUEupVIslC+dLqdVCaUkdwrw/iQiIDABEkOWRQViWOw0kvogdRnOLDEGnaLTl8i7QDoE/U=
X-Received: by 2002:a24:22c2:: with SMTP id
	o185-v6mr3618198ito.60.1521629059515; 
	Wed, 21 Mar 2018 03:44:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Wed, 21 Mar 2018 03:43:59 -0700 (PDT)
In-Reply-To: <20180315082445.8104-1-jackie.huang@windriver.com>
References: <20180315082445.8104-1-jackie.huang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 21 Mar 2018 10:43:59 +0000
Message-ID: <CAJTo0LavpHe=+2uJ=9JatGE_Yr1kLLwNA+v-kWNxmt=ReuLcnw@mail.gmail.com>
To: "Huang, Jie (Jackie)" <jackie.huang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] distcc: update to 3.3
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
X-List-Received-Date: Wed, 21 Mar 2018 10:44:18 -0000
Content-Type: multipart/alternative; boundary="000000000000929e050567e9dfe9"

--000000000000929e050567e9dfe9
Content-Type: text/plain; charset="UTF-8"

This fails to start under systemd so caused the QA to fail:

https://autobuilder.yocto.io/builders/nightly-qa-extras/builds/882/steps/Running%20Sanity%20Tests_7/logs/stdio

Ross

On 15 March 2018 at 08:24, <jackie.huang@windriver.com> wrote:

> From: Jackie Huang <jackie.huang@windriver.com>
>
> * update to version 3.3
> * Remove 0001-zeroconf-Include-fcntl.h.patch since it's
>   included in v3.3
> * Add update-distcc-symlinks into FILES.
>
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  .../distcc/{distcc_3.2.bb => distcc_3.3.bb}        | 10 +++++---
>  .../files/0001-zeroconf-Include-fcntl.h.patch      | 29
> ----------------------
>  2 files changed, 6 insertions(+), 33 deletions(-)
>  rename meta/recipes-devtools/distcc/{distcc_3.2.bb => distcc_3.3.bb}
> (91%)
>  delete mode 100644 meta/recipes-devtools/distcc/
> files/0001-zeroconf-Include-fcntl.h.patch
>
> diff --git a/meta/recipes-devtools/distcc/distcc_3.2.bb
> b/meta/recipes-devtools/distcc/distcc_3.3.bb
> similarity index 91%
> rename from meta/recipes-devtools/distcc/distcc_3.2.bb
> rename to meta/recipes-devtools/distcc/distcc_3.3.bb
> index b6da65a582a..a266e7dde9b 100644
> --- a/meta/recipes-devtools/distcc/distcc_3.2.bb
> +++ b/meta/recipes-devtools/distcc/distcc_3.3.bb
> @@ -14,14 +14,15 @@ PACKAGECONFIG[popt] = "--without-included-popt,--
> with-included-popt,popt"
>
>  RRECOMMENDS_${PN} = "avahi-daemon"
>
> -SRC_URI = "git://github.com/distcc/distcc.git;branch=${PV} \
> +SRC_URI = "git://github.com/distcc/distcc.git;branch=master \
>             file://separatebuilddir.patch \
> -           file://0001-zeroconf-Include-fcntl.h.patch \
>             file://default \
>             file://distccmon-gnome.desktop \
>             file://distcc \
>             file://distcc.service"
> -SRCREV = "d8b18df3e9dcbe4f092bed565835d3975e99432c"
> +
> +SRCREV = "002e68b766ccd7ad05551e67d162b71a7a773d0d"
> +
>  S = "${WORKDIR}/git"
>  UPSTREAM_VERSION_UNKNOWN = "1"
>
> @@ -60,9 +61,10 @@ PACKAGES += "distcc-distmon-gnome"
>
>  FILES_${PN} = " ${sysconfdir} \
>                 ${bindir}/distcc \
> -    ${bindir}/lsdistcc \
> +               ${bindir}/lsdistcc \
>                 ${bindir}/distccd \
>                 ${bindir}/distccmon-text \
> +               ${sbindir}/update-distcc-symlinks \
>                 ${systemd_unitdir}/system/distcc.service"
>  FILES_distcc-distmon-gnome = "  ${bindir}/distccmon-gnome \
>                                 ${datadir}/distcc"
> diff --git a/meta/recipes-devtools/distcc/files/0001-zeroconf-Include-fcntl.h.patch
> b/meta/recipes-devtools/distcc/files/0001-zeroconf-Include-fcntl.h.patch
> deleted file mode 100644
> index b17ec9c9599..00000000000
> --- a/meta/recipes-devtools/distcc/files/0001-zeroconf-
> Include-fcntl.h.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -From 8331fc4759d809512f404e7a27f817ad6d616450 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Mon, 13 Apr 2015 18:00:33 -0700
> -Subject: [PATCH] zeroconf: Include fcntl.h
> -
> -We need it for getting deinitions for O_* e.g. O_CREAT
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - src/zeroconf.c | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/src/zeroconf.c b/src/zeroconf.c
> -index 414ddc4..31bd33f 100644
> ---- a/src/zeroconf.c
> -+++ b/src/zeroconf.c
> -@@ -33,6 +33,7 @@
> - #include <unistd.h>
> - #include <stdlib.h>
> - #include <limits.h>
> -+#include <fcntl.h>
> -
> - #include <avahi-common/domain.h>
> - #include <avahi-common/error.h>
> ---
> -2.1.4
> -
> --
> 2.13.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000929e050567e9dfe9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This fails to start under systemd so caused the QA to fail=
:<div><br></div><div><a href=3D"https://autobuilder.yocto.io/builders/night=
ly-qa-extras/builds/882/steps/Running%20Sanity%20Tests_7/logs/stdio">https:=
//autobuilder.yocto.io/builders/nightly-qa-extras/builds/882/steps/Running%=
20Sanity%20Tests_7/logs/stdio</a><br></div><div><br></div><div>Ross</div></=
div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 15 March 2=
018 at 08:24,  <span dir=3D"ltr">&lt;<a href=3D"mailto:jackie.huang@windriv=
er.com" target=3D"_blank">jackie.huang@windriver.com</a>&gt;</span> wrote:<=
br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">From: Jackie Huang &lt;<a href=3D"mailto:=
jackie.huang@windriver.com">jackie.huang@windriver.com</a>&gt;<br>
<br>
* update to version 3.3<br>
* Remove 0001-zeroconf-Include-fcntl.h.<wbr>patch since it&#39;s<br>
=C2=A0 included in v3.3<br>
* Add update-distcc-symlinks into FILES.<br>
<br>
Signed-off-by: Jackie Huang &lt;<a href=3D"mailto:jackie.huang@windriver.co=
m">jackie.huang@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../distcc/{<a href=3D"http://distcc_3.2.bb" rel=3D"noreferrer" targe=
t=3D"_blank">distcc_3.2.bb</a> =3D&gt; <a href=3D"http://distcc_3.3.bb" rel=
=3D"noreferrer" target=3D"_blank">distcc_3.3.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 10 +++++---<br>
=C2=A0.../files/0001-zeroconf-<wbr>Include-fcntl.h.patch=C2=A0 =C2=A0 =C2=
=A0 | 29 ----------------------<br>
=C2=A02 files changed, 6 insertions(+), 33 deletions(-)<br>
=C2=A0rename meta/recipes-devtools/distcc/{<a href=3D"http://distcc_3.2.bb"=
 rel=3D"noreferrer" target=3D"_blank"><wbr>distcc_3.2.bb</a> =3D&gt; <a hre=
f=3D"http://distcc_3.3.bb" rel=3D"noreferrer" target=3D"_blank">distcc_3.3.=
bb</a>} (91%)<br>
=C2=A0delete mode 100644 meta/recipes-devtools/distcc/<wbr>files/0001-zeroc=
onf-Include-<wbr>fcntl.h.patch<br>
<br>
diff --git a/meta/recipes-devtools/<wbr>distcc/<a href=3D"http://distcc_3.2=
.bb" rel=3D"noreferrer" target=3D"_blank">distcc_3.2.bb</a> b/meta/recipes-=
devtools/<wbr>distcc/<a href=3D"http://distcc_3.3.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">distcc_3.3.bb</a><br>
similarity index 91%<br>
rename from meta/recipes-devtools/distcc/<a href=3D"http://distcc_3.2.bb" r=
el=3D"noreferrer" target=3D"_blank">d<wbr>istcc_3.2.bb</a><br>
rename to meta/recipes-devtools/distcc/<a href=3D"http://distcc_3.3.bb" rel=
=3D"noreferrer" target=3D"_blank">d<wbr>istcc_3.3.bb</a><br>
index b6da65a582a..a266e7dde9b 100644<br>
--- a/meta/recipes-devtools/<wbr>distcc/<a href=3D"http://distcc_3.2.bb" re=
l=3D"noreferrer" target=3D"_blank">distcc_3.2.bb</a><br>
+++ b/meta/recipes-devtools/<wbr>distcc/<a href=3D"http://distcc_3.3.bb" re=
l=3D"noreferrer" target=3D"_blank">distcc_3.3.bb</a><br>
@@ -14,14 +14,15 @@ PACKAGECONFIG[popt] =3D &quot;--without-included-popt,-=
-<wbr>with-included-popt,popt&quot;<br>
<br>
=C2=A0RRECOMMENDS_${PN} =3D &quot;avahi-daemon&quot;<br>
<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/distcc/distcc.git;bra=
nch=3D${PV}" rel=3D"noreferrer" target=3D"_blank">github.com/distcc/<wbr>di=
stcc.git;branch=3D${PV}</a> \<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/distcc/distcc.git;bra=
nch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">github.com/distcc/<wbr>d=
istcc.git;branch=3Dmaster</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://separatebuilddir.patch \<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-zeroconf-Include-<wbr=
>fcntl.h.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://default \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://distccmon-gnome.desktop \<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://distcc \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://distcc.service&quot;<br>
-SRCREV =3D &quot;<wbr>d8b18df3e9dcbe4f092bed565835d3<wbr>975e99432c&quot;<=
br>
+<br>
+SRCREV =3D &quot;<wbr>002e68b766ccd7ad05551e67d162b7<wbr>1a7a773d0d&quot;<=
br>
+<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
=C2=A0UPSTREAM_VERSION_UNKNOWN =3D &quot;1&quot;<br>
<br>
@@ -60,9 +61,10 @@ PACKAGES +=3D &quot;distcc-distmon-gnome&quot;<br>
<br>
=C2=A0FILES_${PN} =3D &quot; ${sysconfdir} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${bindir}/distcc \<=
br>
-=C2=A0 =C2=A0 ${bindir}/lsdistcc \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${bindir}/lsdistcc =
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${bindir}/distccd \=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${bindir}/distccmon=
-text \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${sbindir}/update-d=
istcc-<wbr>symlinks \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${systemd_unitdir}/=
system/<wbr>distcc.service&quot;<br>
=C2=A0FILES_distcc-distmon-gnome =3D &quot;=C2=A0 ${bindir}/distccmon-gnome=
 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${datadir}/distcc&quot;<br>
diff --git a/meta/recipes-devtools/<wbr>distcc/files/0001-zeroconf-<wbr>Inc=
lude-fcntl.h.patch b/meta/recipes-devtools/<wbr>distcc/files/0001-zeroconf-=
<wbr>Include-fcntl.h.patch<br>
deleted file mode 100644<br>
index b17ec9c9599..00000000000<br>
--- a/meta/recipes-devtools/<wbr>distcc/files/0001-zeroconf-<wbr>Include-fc=
ntl.h.patch<br>
+++ /dev/null<br>
@@ -1,29 +0,0 @@<br>
-From 8331fc4759d809512f404e7a27f817<wbr>ad6d616450 Mon Sep 17 00:00:00 200=
1<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.co=
m</a>&gt;<br>
-Date: Mon, 13 Apr 2015 18:00:33 -0700<br>
-Subject: [PATCH] zeroconf: Include fcntl.h<br>
-<br>
-We need it for getting deinitions for O_* e.g. O_CREAT<br>
-<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt;<br>
----<br>
- src/zeroconf.c | 1 +<br>
- 1 file changed, 1 insertion(+)<br>
-<br>
-diff --git a/src/zeroconf.c b/src/zeroconf.c<br>
-index 414ddc4..31bd33f 100644<br>
---- a/src/zeroconf.c<br>
-+++ b/src/zeroconf.c<br>
-@@ -33,6 +33,7 @@<br>
- #include &lt;unistd.h&gt;<br>
- #include &lt;stdlib.h&gt;<br>
- #include &lt;limits.h&gt;<br>
-+#include &lt;fcntl.h&gt;<br>
-<br>
- #include &lt;avahi-common/domain.h&gt;<br>
- #include &lt;avahi-common/error.h&gt;<br>
---<br>
-2.1.4<br>
-<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.13.0<br>
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

--000000000000929e050567e9dfe9--
