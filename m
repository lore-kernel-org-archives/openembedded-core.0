Return-Path: <martin.jansa@gmail.com>
Received: from mail-ua0-f171.google.com (mail-ua0-f171.google.com
	[209.85.217.171])
	by mail.openembedded.org (Postfix) with ESMTP id 0FFA578491;
	Mon, 11 Sep 2017 22:59:05 +0000 (UTC)
Received: by mail-ua0-f171.google.com with SMTP id q29so13051002uaf.3;
	Mon, 11 Sep 2017 15:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rVUACGWzkH/2U5FpufDd/cijepIgy/a60aFiWzVJpbA=;
	b=TEcArrAGps3EK2MnD6XArODee+khunsXACFIGf3p3bZTUQWbl6Z8TaHU10YCp5ztbA
	a9JqdSKrC+V2qYG4fQGIxiPcbx3QQNkkXQcfIQfQ2O4fhpuC1uH7zlv8EtmUEn1xF98O
	GGH/C/J/JTxarnKhZQDWRe+7ce/ijWVT5RwUjkJwqnmXmOQElDBGu1azHkAyFU38jnl7
	tCJRHUN0fVK4M5rkATBOCnA3tBMEJii5a86mzXcvyicmFlzW4/Uo7kxdCy1s2NHJPa36
	IE7mq5GnqyGaT6K+n7u55CMu4KbXBVhkaiU8GBaSXk3JElNcIcmKWmETutvUf/AeKYfJ
	cGHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rVUACGWzkH/2U5FpufDd/cijepIgy/a60aFiWzVJpbA=;
	b=g7FYcK00c1F3yIP/MJ1VkX0yN3DuDmX0DulEIy76CJTpTlaog+odcB7lPdfoWthnqD
	QxsPk6UmYsvGq0UuDq94A8550S+SJeSTdFJ/q2i81WuWRdR2Jq9K222m19vv5NkTuhRf
	PGzHw6rZ/uqm8PGxXt4ztPJ504wOo4mVV8mL2m3mvGYvGQWixTzSy7sEn/LIIVMpD4Vu
	0tXvcd5T+GPPPGPoMQdcu1UQKGQNF4DQ6q8Hj8+xOUiqMcYvIMkPp331eLfy8guS72h3
	VqRZOKqqzflSAQqUjZpHUBBWt67ffNHVkR4Iua+an8UUmfuzOSyHgWF9eu5KTAHXKZUX
	sX3w==
X-Gm-Message-State: AHPjjUgCdDOvRBLa5LSLGRyjYisCxfDZNyMaleiySRWdxMtqr1d6T73c
	BWgJzADMMLbdZeSEM/wY0ypr0APFnw==
X-Google-Smtp-Source: ADKCNb4HZHXXalnoOaBMuajoVO2Uv1fGxKzqHp5ql0gNUbN6fBnFQY+geqQlU1jY69Ij+02AH6YrnjlGAQd895B0SUI=
X-Received: by 10.159.51.236 with SMTP id y44mr9415676uab.2.1505170746871;
	Mon, 11 Sep 2017 15:59:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.15.69 with HTTP; Mon, 11 Sep 2017 15:59:06 -0700 (PDT)
In-Reply-To: <20170911211634.41CC12328C6@git.openembedded.org>
References: <150516459382.22444.17771288767469847708@git.openembedded.org>
	<20170911211634.41CC12328C6@git.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 12 Sep 2017 00:59:06 +0200
Message-ID: <CA+chaQeR_DWL++fj+R3VC5bhwm7vie0vji10Zisg-zLozUC_+g@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 01/36: expat: Don't use getrandom() in the -native case
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
X-List-Received-Date: Mon, 11 Sep 2017 22:59:06 -0000
Content-Type: multipart/alternative; boundary="f403043ef77cb1932e0558f1df84"

--f403043ef77cb1932e0558f1df84
Content-Type: text/plain; charset="UTF-8"

Was this tested with the version in pyro? The patch fails to apply:


http://errors.yoctoproject.org/Errors/Build/46432/

NOTE: Applying patch 'autotools.patch'
(oe-core/meta/recipes-core/expat/expat/autotools.patch)
NOTE: Applying patch 'no_getrandom.patch'
(oe-core/meta/recipes-core/expat/expat/no_getrandom.patch)
ERROR: Command Error: 'quilt --quiltrc
TOPDIR/BUILD/work/x86_64-linux/expat-native/2.2.0-r0/recipe-sysroot-native/etc/quiltrc
push' exited with 0  Output:
Applying patch no_getrandom.patch
patching file configure.ac
Hunk #1 FAILED at 151.
1 out of 1 hunk FAILED -- rejects in file configure.ac
Patch no_getrandom.patch does not apply (enforce with -f)

On Mon, Sep 11, 2017 at 11:16 PM, <git@git.openembedded.org> wrote:

> This is an automated email from the git hooks/post-receive script.
>
> rpurdie pushed a commit to branch pyro
> in repository openembedded-core.
>
> commit 450942db7f4638eba7ec262901fe1d7e1b1f6070
> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> AuthorDate: Mon Aug 14 11:06:33 2017 +0100
>
>     expat: Don't use getrandom() in the -native case
>
>     getrandom() is only available in glibc 2.25+ and uninative may relocate
>     binaries onto systems that don't have this function. For now, force
>     the code to the older codepath until we can come up with a better
> solution
>     for this kind of issue.
>
>     (From OE-Core rev: da9ac8092497c3f2c246d3534f47e42cb2d9e4e8)
>
>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-core/expat/expat.inc                |  3 +++
>  meta/recipes-core/expat/expat/no_getrandom.patch | 23
> +++++++++++++++++++++++
>  2 files changed, 26 insertions(+)
>
> diff --git a/meta/recipes-core/expat/expat.inc b/meta/recipes-core/expat/
> expat.inc
> index 9fa0ca2..8bfd0bf 100644
> --- a/meta/recipes-core/expat/expat.inc
> +++ b/meta/recipes-core/expat/expat.inc
> @@ -7,6 +7,9 @@ LICENSE = "MIT"
>  SRC_URI = "${SOURCEFORGE_MIRROR}/expat/expat-${PV}.tar.bz2 \
>             file://autotools.patch \
>           "
> +
> +SRC_URI_append_class-native = " file://no_getrandom.patch"
> +
>  inherit autotools lib_package
>
>  # This package uses an archive format known to have issue with some
> diff --git a/meta/recipes-core/expat/expat/no_getrandom.patch
> b/meta/recipes-core/expat/expat/no_getrandom.patch
> new file mode 100644
> index 0000000..d64f1bf
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/no_getrandom.patch
> @@ -0,0 +1,23 @@
> +The native version of expat may be used on older systems which dont have
> glibc 2.25
> +and hence don't have getrandom() thanks to uninative. Disable the libc
> call and
> +use the syscall instead to avoid a compatibility issue until we have 2.25
> everywhere
> +we support with uninative.
> +
> +RP
> +2017/8/14
> +
> +Upstream-Status: Inappropriate
> +
> +Index: expat-2.2.3/configure.ac
> +===================================================================
> +--- expat-2.2.3.orig/configure.ac
> ++++ expat-2.2.3/configure.ac
> +@@ -151,7 +151,7 @@ AC_LINK_IFELSE([AC_LANG_SOURCE([
> +   #include <stdlib.h>  /* for NULL */
> +   #include <sys/random.h>
> +   int main() {
> +-    return getrandom(NULL, 0U, 0U);
> ++    return getrandomBREAKME(NULL, 0U, 0U);
> +   }
> + ])], [
> +     AC_DEFINE([HAVE_GETRANDOM], [1],
>
> --
> To stop receiving notification emails like this one, please contact
> the administrator of this repository.
> --
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>

--f403043ef77cb1932e0558f1df84
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Was this tested with the version in pyro? The patch f=
ails to apply:</div><div><br></div><div><br></div><div><a href=3D"http://er=
rors.yoctoproject.org/Errors/Build/46432/">http://errors.yoctoproject.org/E=
rrors/Build/46432/</a><br></div><div><br></div><div>NOTE: Applying patch &#=
39;autotools.patch&#39; (oe-core/meta/recipes-core/expat/expat/autotools.pa=
tch)</div><div>NOTE: Applying patch &#39;no_getrandom.patch&#39; (oe-core/m=
eta/recipes-core/expat/expat/no_getrandom.patch)</div><div>ERROR: Command E=
rror: &#39;quilt --quiltrc TOPDIR/BUILD/work/x86_64-linux/expat-native/2.2.=
0-r0/recipe-sysroot-native/etc/quiltrc push&#39; exited with 0=C2=A0 Output=
:</div><div>Applying patch no_getrandom.patch</div><div>patching file <a hr=
ef=3D"http://configure.ac">configure.ac</a></div><div>Hunk #1 FAILED at 151=
.</div><div>1 out of 1 hunk FAILED -- rejects in file <a href=3D"http://con=
figure.ac">configure.ac</a></div><div>Patch no_getrandom.patch does not app=
ly (enforce with -f)</div></div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On Mon, Sep 11, 2017 at 11:16 PM,  <span dir=3D"ltr">&lt;<=
a href=3D"mailto:git@git.openembedded.org" target=3D"_blank">git@git.openem=
bedded.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">This is =
an automated email from the git hooks/post-receive script.<br>
<br>
rpurdie pushed a commit to branch pyro<br>
in repository openembedded-core.<br>
<br>
commit 450942db7f4638eba7ec262901fe1d<wbr>7e1b1f6070<br>
Author: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation=
.org">richard.purdie@<wbr>linuxfoundation.org</a>&gt;<br>
AuthorDate: Mon Aug 14 11:06:33 2017 +0100<br>
<br>
=C2=A0 =C2=A0 expat: Don&#39;t use getrandom() in the -native case<br>
<br>
=C2=A0 =C2=A0 getrandom() is only available in glibc 2.25+ and uninative ma=
y relocate<br>
=C2=A0 =C2=A0 binaries onto systems that don&#39;t have this function. For =
now, force<br>
=C2=A0 =C2=A0 the code to the older codepath until we can come up with a be=
tter solution<br>
=C2=A0 =C2=A0 for this kind of issue.<br>
<br>
=C2=A0 =C2=A0 (From OE-Core rev: da9ac8092497c3f2c246d3534f47e4<wbr>2cb2d9e=
4e8)<br>
<br>
=C2=A0 =C2=A0 Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.p=
urdie@linuxfoundation.org">richard.purdie@<wbr>linuxfoundation.org</a>&gt;<=
br>
---<br>
=C2=A0meta/recipes-core/expat/expat.<wbr>inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 +++<br>
=C2=A0meta/recipes-core/expat/expat/<wbr>no_getrandom.patch | 23 ++++++++++=
+++++++++++++<br>
=C2=A02 files changed, 26 insertions(+)<br>
<br>
diff --git a/meta/recipes-core/expat/<wbr>expat.inc b/meta/recipes-core/exp=
at/<wbr>expat.inc<br>
index 9fa0ca2..8bfd0bf 100644<br>
--- a/meta/recipes-core/expat/<wbr>expat.inc<br>
+++ b/meta/recipes-core/expat/<wbr>expat.inc<br>
@@ -7,6 +7,9 @@ LICENSE =3D &quot;MIT&quot;<br>
=C2=A0SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/expat/<wbr>expat-${PV}.tar.bz=
2 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://autotools.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
+<br>
+SRC_URI_append_class-native =3D &quot; file://no_getrandom.patch&quot;<br>
+<br>
=C2=A0inherit autotools lib_package<br>
<br>
=C2=A0# This package uses an archive format known to have issue with some<b=
r>
diff --git a/meta/recipes-core/expat/<wbr>expat/no_getrandom.patch b/meta/r=
ecipes-core/expat/<wbr>expat/no_getrandom.patch<br>
new file mode 100644<br>
index 0000000..d64f1bf<br>
--- /dev/null<br>
+++ b/meta/recipes-core/expat/<wbr>expat/no_getrandom.patch<br>
@@ -0,0 +1,23 @@<br>
+The native version of expat may be used on older systems which dont have g=
libc 2.25<br>
+and hence don&#39;t have getrandom() thanks to uninative. Disable the libc=
 call and<br>
+use the syscall instead to avoid a compatibility issue until we have 2.25 =
everywhere<br>
+we support with uninative.<br>
+<br>
+RP<br>
+2017/8/14<br>
+<br>
+Upstream-Status: Inappropriate<br>
+<br>
+Index: expat-2.2.3/<a href=3D"http://configure.ac" rel=3D"noreferrer" targ=
et=3D"_blank">configure.ac</a><br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- expat-2.2.3.orig/<a href=3D"http://configure.ac" rel=3D"noreferrer" ta=
rget=3D"_blank">configure.ac</a><br>
++++ expat-2.2.3/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=
=3D"_blank">configure.ac</a><br>
+@@ -151,7 +151,7 @@ AC_LINK_IFELSE([AC_LANG_<wbr>SOURCE([<br>
+=C2=A0 =C2=A0#include &lt;stdlib.h&gt;=C2=A0 /* for NULL */<br>
+=C2=A0 =C2=A0#include &lt;sys/random.h&gt;<br>
+=C2=A0 =C2=A0int main() {<br>
+-=C2=A0 =C2=A0 return getrandom(NULL, 0U, 0U);<br>
++=C2=A0 =C2=A0 return getrandomBREAKME(NULL, 0U, 0U);<br>
+=C2=A0 =C2=A0}<br>
+ ])], [<br>
+=C2=A0 =C2=A0 =C2=A0AC_DEFINE([HAVE_GETRANDOM], [1],<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
To stop receiving notification emails like this one, please contact<br>
the administrator of this repository.<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-commits mailing list<br>
<a href=3D"mailto:Openembedded-commits@lists.openembedded.org">Openembedded=
-commits@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-comm=
its" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wb=
r>mailman/listinfo/openembedded-<wbr>commits</a><br>
</font></span></blockquote></div><br></div>

--f403043ef77cb1932e0558f1df84--
