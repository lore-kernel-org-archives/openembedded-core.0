Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id B898476FF2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 13:54:50 +0000 (UTC)
Received: by igbkq10 with SMTP id kq10so12871931igb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 06:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=75bZaw8nZWszEraeSaOYOgB/XocypM3OGVpLQQiXcMo=;
	b=eYrFuF3Cdf2Th/tOx1u6TtVqyPQ0Z52zILc266Ls5OqMmDuIEYY5Zx8P5FCBoySnp7
	lNbUMS+STsljL2aYzvZ9hnVKqYi7HF8LaJ34HvyLIxTkSMZGsF83H9QnWo259e36F8Ph
	SuNaFFYk5FZQAo6qxnwOj3FHV5TUDtg11h40EBEODCQxroo3ds5JwDYLhVg57qxnlQN0
	6ko8z6vpeVfmvd8QKoNr+ae3Au3EUJ/aqh+EdQE284w+pZuJbgdiOXSHXyd+LWLdTLXy
	YaT4qENqMXAD6gFyfZU40emOWUSNBwbP42NxcE5jyosjGqWh3oS4FNkAbojwXl+VZT2O
	3qTA==
MIME-Version: 1.0
X-Received: by 10.50.88.37 with SMTP id bd5mr861047igb.77.1442498091193; Thu,
	17 Sep 2015 06:54:51 -0700 (PDT)
Received: by 10.107.142.130 with HTTP; Thu, 17 Sep 2015 06:54:51 -0700 (PDT)
In-Reply-To: <1442496086-1994-1-git-send-email-otavio@ossystems.com.br>
References: <1442496086-1994-1-git-send-email-otavio@ossystems.com.br>
Date: Thu, 17 Sep 2015 06:54:51 -0700
Message-ID: <CAMKF1sqNCr5FZOnhetkihHHqLAdkP5EX3YJgO7guM2REX+Oudw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] Rename 'BRANCH' variable to 'SRCBRANCH' for clearness
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
X-List-Received-Date: Thu, 17 Sep 2015 13:54:52 -0000
Content-Type: multipart/alternative; boundary=089e011777ff509d91051ff1c29c

--089e011777ff509d91051ff1c29c
Content-Type: text/plain; charset=UTF-8

On Thursday, September 17, 2015, Otavio Salvador <otavio@ossystems.com.br>
wrote:

> The 'BRANCH' variable name has no explicit relation with the
> SRC_URI. Using 'SRCBRANCH' makes it more obvious and easier to
> identify.
>
> This patch makes the use consistent across the metadata.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br <javascript:;>>
> ---
>
> Changes in v2:
> - Use SRCBRANCH instead of SRC_BRANCH (Khem)
>
>  meta/recipes-core/glibc/cross-localedef-native_2.22.bb | 4 ++--
>  meta/recipes-core/glibc/glibc_2.22.bb                  | 4 ++--
>  meta/recipes-devtools/mmc/mmc-utils_git.bb             | 4 ++--


Did you cover all the recipes



>  3 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.22.bb
> b/meta/recipes-core/glibc/cross-localedef-native_2.22.bb
> index 2153ece..03be9c0 100644
> --- a/meta/recipes-core/glibc/cross-localedef-native_2.22.bb
> +++ b/meta/recipes-core/glibc/cross-localedef-native_2.22.bb
> @@ -14,10 +14,10 @@ inherit autotools
>
>  FILESEXTRAPATHS =. "${FILE_DIRNAME}/${PN}:${FILE_DIRNAME}/glibc:"
>
> -BRANCH ?= "release/${PV}/master"
> +SRCBRANCH ?= "release/${PV}/master"
>  GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
>
> -SRC_URI = "${GLIBC_GIT_URI};branch=${BRANCH};name=glibc \
> +SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
>             git://
> github.com/kraj/localedef;branch=master;name=localedef;destsuffix=git/localedef
> \
>             file://fix_for_centos_5.8.patch \
>             ${EGLIBCPATCHES} \
> diff --git a/meta/recipes-core/glibc/glibc_2.22.bb
> b/meta/recipes-core/glibc/glibc_2.22.bb
> index f0e1fad..09df3f6 100644
> --- a/meta/recipes-core/glibc/glibc_2.22.bb
> +++ b/meta/recipes-core/glibc/glibc_2.22.bb
> @@ -9,11 +9,11 @@ DEPENDS += "gperf-native kconfig-frontends-native"
>
>  SRCREV ?= "a34d1c6afc86521d6ad17662a3b5362d8481514c"
>
> -BRANCH ?= "release/${PV}/master"
> +SRCBRANCH ?= "release/${PV}/master"
>
>  GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
>
> -SRC_URI = "${GLIBC_GIT_URI};branch=${BRANCH};name=glibc \
> +SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
>
> file://0004-Backport-https-sourceware.org-ml-libc-ports-2007-12-.patch \
>
> file://0005-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch \
>
> file://0006-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch \
> diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb
> b/meta/recipes-devtools/mmc/mmc-utils_git.bb
> index 8950360..546f7f2 100644
> --- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
> +++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
> @@ -3,12 +3,12 @@ HOMEPAGE = "
> http://git.kernel.org/cgit/linux/kernel/git/cjb/mmc-utils.git/"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM =
> "file://mmc.c;beginline=1;endline=17;md5=d7747fc87f1eb22b946ef819969503f0"
>
> -BRANCH ?= "master"
> +SRCBRANCH ?= "master"
>  SRCREV = "f4eb241519f8d500ce6068a70d2389be39ac5189"
>
>  PV = "0.1"
>
> -SRC_URI = "git://
> git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git;branch=${BRANCH}
> \
> +SRC_URI = "git://
> git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git;branch=${SRCBRANCH}
> \
>             file://0001-mmc.h-don-t-include-asm-generic-int-ll64.h.patch"
>
>  S = "${WORKDIR}/git"
> --
> 2.5.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org <javascript:;>
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--089e011777ff509d91051ff1c29c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Thursday, September 17, 2015, Otavio Salvador &lt;<a href=3D"mai=
lto:otavio@ossystems.com.br">otavio@ossystems.com.br</a>&gt; wrote:<br><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">The &#39;BRANCH&#39; variable name has no explic=
it relation with the<br>
SRC_URI. Using &#39;SRCBRANCH&#39; makes it more obvious and easier to<br>
identify.<br>
<br>
This patch makes the use consistent across the metadata.<br>
<br>
Signed-off-by: Otavio Salvador &lt;<a href=3D"javascript:;" onclick=3D"_e(e=
vent, &#39;cvml&#39;, &#39;otavio@ossystems.com.br&#39;)">otavio@ossystems.=
com.br</a>&gt;<br>
---<br>
<br>
Changes in v2:<br>
- Use SRCBRANCH instead of SRC_BRANCH (Khem)<br>
<br>
=C2=A0meta/recipes-core/glibc/<a href=3D"http://cross-localedef-native_2.22=
.bb" target=3D"_blank">cross-localedef-native_2.22.bb</a> | 4 ++--<br>
=C2=A0meta/recipes-core/glibc/<a href=3D"http://glibc_2.22.bb" target=3D"_b=
lank">glibc_2.22.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 4 ++--<br>
=C2=A0meta/recipes-devtools/mmc/<a href=3D"http://mmc-utils_git.bb" target=
=3D"_blank">mmc-utils_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 4 ++--</blockquote><div><br></div><div>Did you cover all the recipe=
s=C2=A0</div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>
=C2=A03 files changed, 6 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/glibc/<a href=3D"http://cross-localedef-nati=
ve_2.22.bb" target=3D"_blank">cross-localedef-native_2.22.bb</a> b/meta/rec=
ipes-core/glibc/<a href=3D"http://cross-localedef-native_2.22.bb" target=3D=
"_blank">cross-localedef-native_2.22.bb</a><br>
index 2153ece..03be9c0 100644<br>
--- a/meta/recipes-core/glibc/<a href=3D"http://cross-localedef-native_2.22=
.bb" target=3D"_blank">cross-localedef-native_2.22.bb</a><br>
+++ b/meta/recipes-core/glibc/<a href=3D"http://cross-localedef-native_2.22=
.bb" target=3D"_blank">cross-localedef-native_2.22.bb</a><br>
@@ -14,10 +14,10 @@ inherit autotools<br>
<br>
=C2=A0FILESEXTRAPATHS =3D. &quot;${FILE_DIRNAME}/${PN}:${FILE_DIRNAME}/glib=
c:&quot;<br>
<br>
-BRANCH ?=3D &quot;release/${PV}/master&quot;<br>
+SRCBRANCH ?=3D &quot;release/${PV}/master&quot;<br>
=C2=A0GLIBC_GIT_URI ?=3D &quot;git://<a href=3D"http://sourceware.org/git/g=
libc.git" target=3D"_blank">sourceware.org/git/glibc.git</a>&quot;<br>
<br>
-SRC_URI =3D &quot;${GLIBC_GIT_URI};branch=3D${BRANCH};name=3Dglibc \<br>
+SRC_URI =3D &quot;${GLIBC_GIT_URI};branch=3D${SRCBRANCH};name=3Dglibc \<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://github.co=
m/kraj/localedef;branch=3Dmaster;name=3Dlocaledef;destsuffix=3Dgit/localede=
f" target=3D"_blank">github.com/kraj/localedef;branch=3Dmaster;name=3Dlocal=
edef;destsuffix=3Dgit/localedef</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://fix_for_centos_5.8.patch \=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${EGLIBCPATCHES} \<br>
diff --git a/meta/recipes-core/glibc/<a href=3D"http://glibc_2.22.bb" targe=
t=3D"_blank">glibc_2.22.bb</a> b/meta/recipes-core/glibc/<a href=3D"http://=
glibc_2.22.bb" target=3D"_blank">glibc_2.22.bb</a><br>
index f0e1fad..09df3f6 100644<br>
--- a/meta/recipes-core/glibc/<a href=3D"http://glibc_2.22.bb" target=3D"_b=
lank">glibc_2.22.bb</a><br>
+++ b/meta/recipes-core/glibc/<a href=3D"http://glibc_2.22.bb" target=3D"_b=
lank">glibc_2.22.bb</a><br>
@@ -9,11 +9,11 @@ DEPENDS +=3D &quot;gperf-native kconfig-frontends-native&=
quot;<br>
<br>
=C2=A0SRCREV ?=3D &quot;a34d1c6afc86521d6ad17662a3b5362d8481514c&quot;<br>
<br>
-BRANCH ?=3D &quot;release/${PV}/master&quot;<br>
+SRCBRANCH ?=3D &quot;release/${PV}/master&quot;<br>
<br>
=C2=A0GLIBC_GIT_URI ?=3D &quot;git://<a href=3D"http://sourceware.org/git/g=
libc.git" target=3D"_blank">sourceware.org/git/glibc.git</a>&quot;<br>
<br>
-SRC_URI =3D &quot;${GLIBC_GIT_URI};branch=3D${BRANCH};name=3Dglibc \<br>
+SRC_URI =3D &quot;${GLIBC_GIT_URI};branch=3D${SRCBRANCH};name=3Dglibc \<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0004-Backport-https-source=
ware.org-ml-libc-ports-2007-12-.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0005-fsl-e500-e5500-e6500-=
603e-fsqrt-implementation.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0006-readlib-Add-OECORE_KN=
OWN_INTERPRETER_NAMES-to-known-.patch \<br>
diff --git a/meta/recipes-devtools/mmc/<a href=3D"http://mmc-utils_git.bb" =
target=3D"_blank">mmc-utils_git.bb</a> b/meta/recipes-devtools/mmc/<a href=
=3D"http://mmc-utils_git.bb" target=3D"_blank">mmc-utils_git.bb</a><br>
index 8950360..546f7f2 100644<br>
--- a/meta/recipes-devtools/mmc/<a href=3D"http://mmc-utils_git.bb" target=
=3D"_blank">mmc-utils_git.bb</a><br>
+++ b/meta/recipes-devtools/mmc/<a href=3D"http://mmc-utils_git.bb" target=
=3D"_blank">mmc-utils_git.bb</a><br>
@@ -3,12 +3,12 @@ HOMEPAGE =3D &quot;<a href=3D"http://git.kernel.org/cgit/=
linux/kernel/git/cjb/mmc-utils.git/" target=3D"_blank">http://git.kernel.or=
g/cgit/linux/kernel/git/cjb/mmc-utils.git/</a>&quot;<br>
=C2=A0LICENSE =3D &quot;GPLv2&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://mmc.c;beginline=3D1;endline=3D17;md=
5=3Dd7747fc87f1eb22b946ef819969503f0&quot;<br>
<br>
-BRANCH ?=3D &quot;master&quot;<br>
+SRCBRANCH ?=3D &quot;master&quot;<br>
=C2=A0SRCREV =3D &quot;f4eb241519f8d500ce6068a70d2389be39ac5189&quot;<br>
<br>
=C2=A0PV =3D &quot;0.1&quot;<br>
<br>
-SRC_URI =3D &quot;git://<a href=3D"http://git.kernel.org/pub/scm/linux/ker=
nel/git/cjb/mmc-utils.git;branch=3D${BRANCH}" target=3D"_blank">git.kernel.=
org/pub/scm/linux/kernel/git/cjb/mmc-utils.git;branch=3D${BRANCH}</a> \<br>
+SRC_URI =3D &quot;git://<a href=3D"http://git.kernel.org/pub/scm/linux/ker=
nel/git/cjb/mmc-utils.git;branch=3D${SRCBRANCH}" target=3D"_blank">git.kern=
el.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git;branch=3D${SRCBRANCH}</a>=
 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-mmc.h-don-t-include-a=
sm-generic-int-ll64.h.patch&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
--<br>
2.5.2<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"javascript:;" onclick=3D"_e(event, &#39;cvml&#39;, &#39;Openembe=
dded-core@lists.openembedded.org&#39;)">Openembedded-core@lists.openembedde=
d.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
</blockquote>

--089e011777ff509d91051ff1c29c--
