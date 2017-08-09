Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f42.google.com (mail-it0-f42.google.com
	[209.85.214.42])
	by mail.openembedded.org (Postfix) with ESMTP id EF90B77E24
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Aug 2017 20:47:58 +0000 (UTC)
Received: by mail-it0-f42.google.com with SMTP id 77so3862581itj.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Aug 2017 13:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=adSi4IUHamzOHkjeYzY8HG3m3AhuWkr300wKePW+47o=;
	b=cLng+hSKR/0cbDMpWrO7f1jaUpAcVwDNux8NzF2TZha6iBksr/EXSXMRfXMO/7b/t2
	yPV/DXE7Dp93obWC8UeEXsxQGfodvGQORo//3Qh7ZPaeDYcCKrcDhpg2VTqDYcig60HG
	vswZ4g9dnPV3H0wPpZLixBdPCnGoushTs+howJ6YUVvFAM5neGxL7r2UEfFMwWdCOMu2
	xVISbrnmUq3Ac/ZL6NgAKh2gTDxXFsNfKmYUOdHNCVe4twdhnol0Dqh2R2MEyIjhp3sS
	lMuVTjAF0scekGTMI4zTSJaKeHQt7s9gUGmz9yPZnxNZOA1YPRadD5HmVU5lTxv2q3FU
	L3Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=adSi4IUHamzOHkjeYzY8HG3m3AhuWkr300wKePW+47o=;
	b=XObQ8106MgIGS1JyzdBFey162Ez3s/GQglBuefqeRgctxRF9GVpeXwu9Zhudcd0E20
	0VkQogn2i6GdNaX2km12iyqd7MqTUr9T0vTFxTaDxeByirVA5znao/XEUld2a+RfVi5a
	TwavqO1kJ3EyQ7hEqNOEB4E+mXTX1AROg6tpUHgg+99go8EUBQhLBu0mjbK2nGNRhqma
	Hq+5ylyZS5IxDkbMV5RZTSiq54aXq21THi5eYUPEV1NU24e+HJMD79UPsGUoERkUpnVZ
	ti/NjdlBb58CGhiwGwFS1B9KShnO9miaUWeD70KnhT2LnhibhC9ShlqJ+8EGec0qXz02
	K5TA==
X-Gm-Message-State: AIVw112QCdM2RTTzsyl2icHG4dIkrv3WCkkuRME4qrhFWHhG+Bt81UW/
	kFaPxXg56xeTfX8CKW/Q/Yku0G+XHuVP
X-Received: by 10.36.166.75 with SMTP id r11mr7513682iti.55.1502311679883;
	Wed, 09 Aug 2017 13:47:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.234 with HTTP; Wed, 9 Aug 2017 13:47:39 -0700 (PDT)
In-Reply-To: <20170807114504.28410-6-alexander.kanavin@linux.intel.com>
References: <20170807114504.28410-1-alexander.kanavin@linux.intel.com>
	<20170807114504.28410-6-alexander.kanavin@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 9 Aug 2017 21:47:39 +0100
Message-ID: <CAJTo0La5aPZ711UmGoXpvLxoQ3cJPQ1aPjD8EtBdyVaaoeyv5A@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/7] oprofile: update to 1.2.0
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
X-List-Received-Date: Wed, 09 Aug 2017 20:47:59 -0000
Content-Type: multipart/alternative; boundary="f403045fae040591640556583294"

--f403045fae040591640556583294
Content-Type: text/plain; charset="UTF-8"

Breaks with musl:

http://errors.yoctoproject.org/Errors/Details/150200/

Ross

On 7 August 2017 at 12:45, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> Drop upstreamed 0001-Fix-FTBFS-problem-with-GCC-6.patch
>
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/recipes-kernel/oprofile/oprofile.inc          |  1 -
>  .../0001-Fix-FTBFS-problem-with-GCC-6.patch        | 51
> ----------------------
>  meta/recipes-kernel/oprofile/oprofile_1.1.0.bb     | 10 -----
>  meta/recipes-kernel/oprofile/oprofile_1.2.0.bb     | 10 +++++
>  4 files changed, 10 insertions(+), 62 deletions(-)
>  delete mode 100644 meta/recipes-kernel/oprofile/oprofile/0001-Fix-FTBFS-
> problem-with-GCC-6.patch
>  delete mode 100644 meta/recipes-kernel/oprofile/oprofile_1.1.0.bb
>  create mode 100644 meta/recipes-kernel/oprofile/oprofile_1.2.0.bb
>
> diff --git a/meta/recipes-kernel/oprofile/oprofile.inc
> b/meta/recipes-kernel/oprofile/oprofile.inc
> index 4b01654fa3e..83fc8435cbd 100644
> --- a/meta/recipes-kernel/oprofile/oprofile.inc
> +++ b/meta/recipes-kernel/oprofile/oprofile.inc
> @@ -25,7 +25,6 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz
> \
>             file://run-ptest \
>             file://root-home-dir.patch \
>             file://0001-Add-rmb-definition-for-NIOS2-architecture.patch \
> -           file://0001-Fix-FTBFS-problem-with-GCC-6.patch \
>  "
>  UPSTREAM_CHECK_REGEX = "oprofile-(?P<pver>\d+(\.\d+)+)/"
>  UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/oprofile/files/
> oprofile/"
> diff --git a/meta/recipes-kernel/oprofile/oprofile/0001-Fix-FTBFS-problem-with-GCC-6.patch
> b/meta/recipes-kernel/oprofile/oprofile/0001-Fix-
> FTBFS-problem-with-GCC-6.patch
> deleted file mode 100644
> index d372fd527ba..00000000000
> --- a/meta/recipes-kernel/oprofile/oprofile/0001-Fix-
> FTBFS-problem-with-GCC-6.patch
> +++ /dev/null
> @@ -1,51 +0,0 @@
> -From 39d4d46a0bd504ac708ffe72df87bf74cd12ad30 Mon Sep 17 00:00:00 2001
> -From: William Cohen <wcohen@redhat.com>
> -Date: Fri, 5 Feb 2016 17:30:19 -0500
> -Subject: [PATCH] Fix FTBFS problem with GCC-6
> -
> -GCC-6 is pickier about some of the type conversions causing the Fedora
> -24 mass rebuild the build of oprofile failed with:
> -
> -make[3]: Entering directory '/builddir/build/BUILD/
> oprofile-1.1.0/libutil++'
> -g++ -DHAVE_CONFIG_H -I. -I..  -I ../libutil -I ../libop -I ../libpp   -W
> -Wall -fno-common -ftemplate-depth-50 -O2 -g -pipe -Wall
> -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -fexceptions
> -fstack-protector-strong --param=ssp-buffer-size=4 -grecord-gcc-switches
> -specs=/usr/lib/rpm/redhat/redhat-hardened-cc1 -m32 -march=i686
> -mtune=atom -fasynchronous-unwind-tables -c -o op_bfd.o op_bfd.cpp
> -op_bfd.cpp: In member function 'void op_bfd::get_symbol_range(symbol_index_t,
> long long unsigned int&, long long unsigned int&) const':
> -op_bfd.cpp:538:47: error: cannot convert 'std::ostream {aka
> std::basic_ostream<char>}' to 'const bool' in initialization
> -  bool const verbose = cverb << (vbfd & vlevel1);
> -                                               ^
> -op_bfd.cpp:546:7: error: in argument to unary !
> -  if (!verbose)
> -       ^~~~~~~
> -
> -Avoid the intermediate bool type to make GCC-6 happy.
> -
> -Signed-off-by: William Cohen <wcohen@redhat.com>
> ----
> -Upstream-Status: Backport
> -
> - libutil++/op_bfd.cpp | 4 +---
> - 1 file changed, 1 insertion(+), 3 deletions(-)
> -
> -diff --git a/libutil++/op_bfd.cpp b/libutil++/op_bfd.cpp
> -index 389c920..f2eb42b 100644
> ---- a/libutil++/op_bfd.cpp
> -+++ b/libutil++/op_bfd.cpp
> -@@ -535,15 +535,13 @@ void op_bfd::get_symbol_range(symbol_index_t
> sym_idx,
> - {
> -       op_bfd_symbol const & sym = syms[sym_idx];
> -
> --      bool const verbose = cverb << (vbfd & vlevel1);
> --
> -       if (anon_obj)
> -               start = sym.vma();
> -       else
> -               start = sym.filepos();
> -       end = start + sym.size();
> -
> --      if (!verbose)
> -+      if (!(cverb << (vbfd & vlevel1)))
> -               return;
> -
> -       io_state state(cverb << (vbfd & vlevel1));
> ---
> -1.9.1
> -
> diff --git a/meta/recipes-kernel/oprofile/oprofile_1.1.0.bb
> b/meta/recipes-kernel/oprofile/oprofile_1.1.0.bb
> deleted file mode 100644
> index 92a94ad0d4d..00000000000
> --- a/meta/recipes-kernel/oprofile/oprofile_1.1.0.bb
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -require oprofile.inc
> -
> -DEPENDS += "virtual/kernel"
> -DEPENDS_append_powerpc64 = " libpfm4"
> -
> -SRC_URI[md5sum] = "248c4c069f9476f427fa7195563f9867"
> -SRC_URI[sha256sum] = "cf759a6de1a6033d5dfc93bda129a9
> f2e128aecc4238cc657feb0801d1b0366c"
> -
> -S = "${WORKDIR}/oprofile-${PV}"
> -
> diff --git a/meta/recipes-kernel/oprofile/oprofile_1.2.0.bb
> b/meta/recipes-kernel/oprofile/oprofile_1.2.0.bb
> new file mode 100644
> index 00000000000..e85e805c37c
> --- /dev/null
> +++ b/meta/recipes-kernel/oprofile/oprofile_1.2.0.bb
> @@ -0,0 +1,10 @@
> +require oprofile.inc
> +
> +DEPENDS += "virtual/kernel"
> +DEPENDS_append_powerpc64 = " libpfm4"
> +
> +SRC_URI[md5sum] = "4fcd3920984dcb607314b2e225086c3a"
> +SRC_URI[sha256sum] = "eb95f98c40b7d0ee29b45fba3565d9
> f8381747528aa6b6159e37d4fa0c8ca57d"
> +
> +S = "${WORKDIR}/oprofile-${PV}"
> +
> --
> 2.13.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--f403045fae040591640556583294
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Breaks with musl:<div><br></div><div><a href=3D"http://err=
ors.yoctoproject.org/Errors/Details/150200/">http://errors.yoctoproject.org=
/Errors/Details/150200/</a><br></div><div><br></div><div>Ross</div></div><d=
iv class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 7 August 2017 at=
 12:45, Alexander Kanavin <span dir=3D"ltr">&lt;<a href=3D"mailto:alexander=
.kanavin@linux.intel.com" target=3D"_blank">alexander.kanavin@linux.intel.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Drop upstreamed =
0001-Fix-FTBFS-problem-with-<wbr>GCC-6.patch<br>
<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alexander.kanavin@li=
nux.intel.com">alexander.kanavin@linux.<wbr>intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/oprofile/<wbr>oprofile.inc=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 1 -<br>
=C2=A0.../0001-Fix-FTBFS-problem-<wbr>with-GCC-6.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 51 ----------------------<br>
=C2=A0meta/recipes-kernel/oprofile/<a href=3D"http://oprofile_1.1.0.bb" rel=
=3D"noreferrer" target=3D"_blank">o<wbr>profile_1.1.0.bb</a>=C2=A0 =C2=A0 =
=C2=A0| 10 -----<br>
=C2=A0meta/recipes-kernel/oprofile/<a href=3D"http://oprofile_1.2.0.bb" rel=
=3D"noreferrer" target=3D"_blank">o<wbr>profile_1.2.0.bb</a>=C2=A0 =C2=A0 =
=C2=A0| 10 +++++<br>
=C2=A04 files changed, 10 insertions(+), 62 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-kernel/oprofile/<wbr>oprofile/0001-Fi=
x-FTBFS-<wbr>problem-with-GCC-6.patch<br>
=C2=A0delete mode 100644 meta/recipes-kernel/oprofile/<a href=3D"http://opr=
ofile_1.1.0.bb" rel=3D"noreferrer" target=3D"_blank">o<wbr>profile_1.1.0.bb=
</a><br>
=C2=A0create mode 100644 meta/recipes-kernel/oprofile/<a href=3D"http://opr=
ofile_1.2.0.bb" rel=3D"noreferrer" target=3D"_blank">o<wbr>profile_1.2.0.bb=
</a><br>
<br>
diff --git a/meta/recipes-kernel/<wbr>oprofile/oprofile.inc b/meta/recipes-=
kernel/<wbr>oprofile/oprofile.inc<br>
index 4b01654fa3e..83fc8435cbd 100644<br>
--- a/meta/recipes-kernel/<wbr>oprofile/oprofile.inc<br>
+++ b/meta/recipes-kernel/<wbr>oprofile/oprofile.inc<br>
@@ -25,7 +25,6 @@ SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/${BPN}/<wbr>${BPN=
}-${PV}.tar.gz \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://root-home-dir.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Add-rmb-<wbr>definiti=
on-for-NIOS2-<wbr>architecture.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Fix-FTBFS-problem-<wb=
r>with-GCC-6.patch \<br>
=C2=A0&quot;<br>
=C2=A0UPSTREAM_CHECK_REGEX =3D &quot;oprofile-(?P&lt;pver&gt;\d+(\.\d+)+<wb=
r>)/&quot;<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://sourceforge.net/proje=
cts/oprofile/files/oprofile/" rel=3D"noreferrer" target=3D"_blank">https://=
sourceforge.net/<wbr>projects/oprofile/files/<wbr>oprofile/</a>&quot;<br>
diff --git a/meta/recipes-kernel/<wbr>oprofile/oprofile/0001-Fix-<wbr>FTBFS=
-problem-with-GCC-6.patch b/meta/recipes-kernel/<wbr>oprofile/oprofile/0001=
-Fix-<wbr>FTBFS-problem-with-GCC-6.patch<br>
deleted file mode 100644<br>
index d372fd527ba..00000000000<br>
--- a/meta/recipes-kernel/<wbr>oprofile/oprofile/0001-Fix-<wbr>FTBFS-proble=
m-with-GCC-6.patch<br>
+++ /dev/null<br>
@@ -1,51 +0,0 @@<br>
-From 39d4d46a0bd504ac708ffe72df87bf<wbr>74cd12ad30 Mon Sep 17 00:00:00 200=
1<br>
-From: William Cohen &lt;<a href=3D"mailto:wcohen@redhat.com">wcohen@redhat=
.com</a>&gt;<br>
-Date: Fri, 5 Feb 2016 17:30:19 -0500<br>
-Subject: [PATCH] Fix FTBFS problem with GCC-6<br>
-<br>
-GCC-6 is pickier about some of the type conversions causing the Fedora<br>
-24 mass rebuild the build of oprofile failed with:<br>
-<br>
-make[3]: Entering directory &#39;/builddir/build/BUILD/<wbr>oprofile-1.1.0=
/libutil++&#39;<br>
-g++ -DHAVE_CONFIG_H -I. -I..=C2=A0 -I ../libutil -I ../libop -I ../libpp=
=C2=A0 =C2=A0-W -Wall -fno-common -ftemplate-depth-50 -O2 -g -pipe -Wall -W=
error=3Dformat-security -Wp,-D_FORTIFY_SOURCE=3D2 -fexceptions -fstack-prot=
ector-strong --param=3Dssp-buffer-size=3D4 -grecord-gcc-switches -specs=3D/=
usr/lib/rpm/redhat/<wbr>redhat-hardened-cc1 -m32 -march=3Di686 -mtune=3Dato=
m -fasynchronous-unwind-tables -c -o op_bfd.o op_bfd.cpp<br>
-op_bfd.cpp: In member function &#39;void op_bfd::get_symbol_range(<wbr>sym=
bol_index_t, long long unsigned int&amp;, long long unsigned int&amp;) cons=
t&#39;:<br>
-op_bfd.cpp:538:47: error: cannot convert &#39;std::ostream {aka std::basic=
_ostream&lt;char&gt;}&#39; to &#39;const bool&#39; in initialization<br>
-=C2=A0 bool const verbose =3D cverb &lt;&lt; (vbfd &amp; vlevel1);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0^<br>
-op_bfd.cpp:546:7: error: in argument to unary !<br>
-=C2=A0 if (!verbose)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~<br>
-<br>
-Avoid the intermediate bool type to make GCC-6 happy.<br>
-<br>
-Signed-off-by: William Cohen &lt;<a href=3D"mailto:wcohen@redhat.com">wcoh=
en@redhat.com</a>&gt;<br>
----<br>
-Upstream-Status: Backport<br>
-<br>
- libutil++/op_bfd.cpp | 4 +---<br>
- 1 file changed, 1 insertion(+), 3 deletions(-)<br>
-<br>
-diff --git a/libutil++/op_bfd.cpp b/libutil++/op_bfd.cpp<br>
-index 389c920..f2eb42b 100644<br>
---- a/libutil++/op_bfd.cpp<br>
-+++ b/libutil++/op_bfd.cpp<br>
-@@ -535,15 +535,13 @@ void op_bfd::get_symbol_range(<wbr>symbol_index_t sy=
m_idx,<br>
- {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0op_bfd_symbol const &amp; sym =3D syms[sym_idx]=
;<br>
-<br>
--=C2=A0 =C2=A0 =C2=A0 bool const verbose =3D cverb &lt;&lt; (vbfd &amp; vl=
evel1);<br>
--<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (anon_obj)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0start =3D sym.vma()=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0start =3D sym.filep=
os();<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0end =3D start + sym.size();<br>
-<br>
--=C2=A0 =C2=A0 =C2=A0 if (!verbose)<br>
-+=C2=A0 =C2=A0 =C2=A0 if (!(cverb &lt;&lt; (vbfd &amp; vlevel1)))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0io_state state(cverb &lt;&lt; (vbfd &amp; vleve=
l1));<br>
---<br>
-1.9.1<br>
-<br>
diff --git a/meta/recipes-kernel/<wbr>oprofile/<a href=3D"http://oprofile_1=
.1.0.bb" rel=3D"noreferrer" target=3D"_blank">oprofile_1.1.0.bb</a> b/meta/=
recipes-kernel/<wbr>oprofile/<a href=3D"http://oprofile_1.1.0.bb" rel=3D"no=
referrer" target=3D"_blank">oprofile_1.1.0.bb</a><br>
deleted file mode 100644<br>
index 92a94ad0d4d..00000000000<br>
--- a/meta/recipes-kernel/<wbr>oprofile/<a href=3D"http://oprofile_1.1.0.bb=
" rel=3D"noreferrer" target=3D"_blank">oprofile_1.1.0.bb</a><br>
+++ /dev/null<br>
@@ -1,10 +0,0 @@<br>
-require oprofile.inc<br>
-<br>
-DEPENDS +=3D &quot;virtual/kernel&quot;<br>
-DEPENDS_append_powerpc64 =3D &quot; libpfm4&quot;<br>
-<br>
-SRC_URI[md5sum] =3D &quot;<wbr>248c4c069f9476f427fa7195563f98<wbr>67&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>cf759a6de1a6033d5dfc93bda129a9<wbr>f2e12=
8aecc4238cc657feb0801d1b0<wbr>366c&quot;<br>
-<br>
-S =3D &quot;${WORKDIR}/oprofile-${PV}&quot;<br>
-<br>
diff --git a/meta/recipes-kernel/<wbr>oprofile/<a href=3D"http://oprofile_1=
.2.0.bb" rel=3D"noreferrer" target=3D"_blank">oprofile_1.2.0.bb</a> b/meta/=
recipes-kernel/<wbr>oprofile/<a href=3D"http://oprofile_1.2.0.bb" rel=3D"no=
referrer" target=3D"_blank">oprofile_1.2.0.bb</a><br>
new file mode 100644<br>
index 00000000000..e85e805c37c<br>
--- /dev/null<br>
+++ b/meta/recipes-kernel/<wbr>oprofile/<a href=3D"http://oprofile_1.2.0.bb=
" rel=3D"noreferrer" target=3D"_blank">oprofile_1.2.0.bb</a><br>
@@ -0,0 +1,10 @@<br>
+require oprofile.inc<br>
+<br>
+DEPENDS +=3D &quot;virtual/kernel&quot;<br>
+DEPENDS_append_powerpc64 =3D &quot; libpfm4&quot;<br>
+<br>
+SRC_URI[md5sum] =3D &quot;<wbr>4fcd3920984dcb607314b2e225086c<wbr>3a&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>eb95f98c40b7d0ee29b45fba3565d9<wbr>f8381=
747528aa6b6159e37d4fa0c8c<wbr>a57d&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/oprofile-${PV}&quot;<br>
+<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.13.2<br>
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

--f403045fae040591640556583294--
