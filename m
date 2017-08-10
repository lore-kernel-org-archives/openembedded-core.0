Return-Path: <martin.jansa@gmail.com>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8F987781E1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Aug 2017 20:18:28 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id 80so936002uas.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Aug 2017 13:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hLEowgVeQU2yA5+Z8rwFAqQizxLqs+oAXqAEUXruAVw=;
	b=cmKgD1Zr2rxihVwIQAjPgB57tpfY95RKdnC057ois0bjVy8eSgEwE9jhCRgq8ZSmDk
	g+8t4nBO9T5F/qZh7PyU9fn8/tRRzv2V22FeveLCiW8Q57qcz0Fj0zKQeUc2tKJ0z2yd
	Gq59Pe0vh8AB4fzEW79MSNOakMN2OH4CLWu5d8/dEvbx1lHckRNe3C3Y8tO3/AZUbl6s
	rxo6vxEfhmlCfvSiXzK5+/lZbI46TrhDfKApSKwqHs7yz1pFc7ZJMgh4v0aJad3Gfotx
	0N93vI6Kcd71SuNV2fzsoZjqH0/tD4gqQD/vjn7imedGJsZJc+PNF51fotmyHV8L+fsW
	Yfqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hLEowgVeQU2yA5+Z8rwFAqQizxLqs+oAXqAEUXruAVw=;
	b=L2vYhwJDf7V4Rne0ekNTQVdZlmEsJdzuIHPUsWXW2uQQxYB3zWn8pBf/syqiT5kHFs
	YTjR1DadhR5yi/jDdSHhcBtsNmhd6y9LHGl/lOubIR4UxxktvWihdsj5tZTYog9VEq+j
	Ym8vB/Of94FEjMPeV6nuFSU8Ut0HZJ8CWZQhd1hB2yqmjdHVE89ky6LGvLMXHFuzSHrv
	kiSusEF1L5cRqYexCaf99geKHyrA5q2Qb5zplrFimPyzXxIlnTpZQqZx1G+JRxiokM/G
	WLhmA2nzJUZS2G/3ddeGL0uJXDFAcJoE/BJ/uNbVSm7LkcmzL3AYKyG3ldjTK3HbvHIa
	6kvQ==
X-Gm-Message-State: AHYfb5gCEKiTs4k1bF2s+zUOf09ox3KC8lOhWaAyC2KjhA6n7u1mYgqP
	6Ty6cpIex8ljB5FOq2SLRIbJTWCjoA==
X-Received: by 10.176.80.193 with SMTP id d1mr9169099uaa.124.1502396309278;
	Thu, 10 Aug 2017 13:18:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.122.88 with HTTP; Thu, 10 Aug 2017 13:18:28 -0700 (PDT)
In-Reply-To: <CAMKF1sq98x8jpV_A0Fz2doMO25Cii9v4Ez178ex4uUoPqnnB8A@mail.gmail.com>
References: <f05e1212a87f739cf27fe9a6c32f45ef92a6fdab.1501250341.git-series.patrick.ohly@intel.com>
	<CAMKF1sq98x8jpV_A0Fz2doMO25Cii9v4Ez178ex4uUoPqnnB8A@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 10 Aug 2017 22:18:28 +0200
Message-ID: <CA+chaQetLEuL79Utj_C+e7yQpg9Hw1ZhVQsOdCEeLZNziAzMqQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] autoconf-archive: move from meta-oe to OE-core
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
X-List-Received-Date: Thu, 10 Aug 2017 20:18:29 -0000
Content-Type: multipart/alternative; boundary="94eb2c19211e53951c05566be648"

--94eb2c19211e53951c05566be648
Content-Type: text/plain; charset="UTF-8"

-2

LBTM


If gnome-common should depend on TUNE_PKGARCH autoconf-archive, then
it cannot inherit allarch anymore, see:


ERROR: gnome-common different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemuarm
runtaskdeps changed:
autoconf-archive/autoconf-archive_2016.09.16.bb.do_packagedata with
hash e26a8076711b7e88a3ffcda74a9e5332
 changed to
autoconf-archive/autoconf-archive_2016.09.16.bb.do_packagedata with
hash ee3f5138593bed3feb8519cf3c26aa7b
Hash for dependent task
autoconf-archive/autoconf-archive_2016.09.16.bb.do_packagedata changed
from e26a8076711b7e88a3ffcda74a9e5332 to
ee3f5138593bed3feb8519cf3c26aa7b



On Fri, Jul 28, 2017 at 6:45 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Fri, Jul 28, 2017 at 7:01 AM, Patrick Ohly <patrick.ohly@intel.com>
> wrote:
> > Having common macros in OE-core that are needed by autotools based
> > projects makes sense. For example, tpm2.0-tools in meta-measured
> > depended on meta-oe only because of autoconf-archive.
> >
> > This is a verbatim copy of the autoconf-archive recipe in
> > meta-openembedded rev 1cbd1bc1, with just one change: the patch which
> > disabled the installation of ax_code_coverage.m4 and
> > ax_check_enable_debug.m4 was removed.
> >
> > So now autoconf-archive in OE-core provides them. gnome-common in
> > meta-oe will be changed to not install them and instead depend on
> > autoconf-archive.
>
> +1
> LGTM
>
> >
> > Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
> > ---
> >  meta/recipes-devtools/autoconf-archive/autoconf-archive.inc
>  | 15 +++++++++++++++
> >  meta/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb
> | 13 +++++++++++++
> >  2 files changed, 28 insertions(+)
> >  create mode 100644 meta/recipes-devtools/autoconf-archive/autoconf-
> archive.inc
> >  create mode 100644 meta/recipes-devtools/autoconf-archive/autoconf-
> archive_2016.09.16.bb
> >
> > diff --git a/meta/recipes-devtools/autoconf-archive/autoconf-archive.inc
> b/meta/recipes-devtools/autoconf-archive/autoconf-archive.inc
> > new file mode 100644
> > index 0000000..9684d1f
> > --- /dev/null
> > +++ b/meta/recipes-devtools/autoconf-archive/autoconf-archive.inc
> > @@ -0,0 +1,15 @@
> > +LICENSE = "GPLv3"
> > +HOMEPAGE = "http://www.gnu.org/software/autoconf-archive/"
> > +SECTION = "devel"
> > +
> > +DEPENDS += "m4-native"
> > +DEPENDS_class-native = "m4-native gnu-config-native"
> > +DEPENDS_class-nativesdk = "m4-nativesdk gnu-config-nativesdk"
> > +
> > +RDEPENDS_${PN} = "m4 gnu-config gnome-common"
> > +RDEPENDS_${PN}_class-native = "m4-native gnu-config-native"
> > +RDEPENDS_${PN}_class-nativesdk = "m4-nativesdk gnu-config-nativesdk"
> > +
> > +SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
> > +
> > +inherit autotools
> > diff --git a/meta/recipes-devtools/autoconf-archive/autoconf-
> archive_2016.09.16.bb b/meta/recipes-devtools/autoconf-archive/autoconf-
> archive_2016.09.16.bb
> > new file mode 100644
> > index 0000000..0a1a771
> > --- /dev/null
> > +++ b/meta/recipes-devtools/autoconf-archive/autoconf-
> archive_2016.09.16.bb
> > @@ -0,0 +1,13 @@
> > +require autoconf-archive.inc
> > +
> > +
> > +PARALLEL_MAKE = ""
> > +
> > +LICENSE = "GPLv2 & GPLv3"
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae5
> 04"
> > +
> > +SRC_URI[md5sum] = "bf19d4cddce260b3c3e1d51d42509071"
> > +SRC_URI[sha256sum] = "e8f2efd235f842bad2f6938bf4a722
> 40a5e5fcd248e8444335e63beb60fabd82"
> > +
> > +EXTRA_OECONF += "ac_cv_path_M4=m4"
> > +BBCLASSEXTEND = "native nativesdk"
> >
> > base-commit: d3a41fbd94462efc8c6f1b55f6fb54001b447c45
> > --
> > git-series 0.9.1
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c19211e53951c05566be648
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><pre class=3D"gmail-console-output" style=3D"box-sizing:bo=
rder-box;white-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-bo=
ttom:0px;color:rgb(51,51,51);font-size:14px">-2</pre><pre class=3D"gmail-co=
nsole-output" style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap=
:break-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:=
14px">LBTM</pre><pre class=3D"gmail-console-output" style=3D"box-sizing:bor=
der-box;white-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-bot=
tom:0px;color:rgb(51,51,51);font-size:14px"><br></pre><pre class=3D"gmail-c=
onsole-output" style=3D"box-sizing:border-box;white-space:pre-wrap;word-wra=
p:break-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size=
:14px">If gnome-common should depend on TUNE_PKGARCH autoconf-archive, then=
 it cannot inherit allarch anymore, see:</pre><pre class=3D"gmail-console-o=
utput" style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:break-=
word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:14px"><=
br></pre><pre class=3D"gmail-console-output" style=3D"box-sizing:border-box=
;white-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-bottom:0px=
;color:rgb(51,51,51);font-size:14px">ERROR: gnome-common different signatur=
e for task do_package_write_ipk.sigdata between qemux86copy and qemuarm
runtaskdeps changed:
autoconf-archive/autoconf-archive_2016.09.16.bb.do_packagedata with hash e2=
6a8076711b7e88a3ffcda74a9e5332
 changed to
autoconf-archive/autoconf-archive_2016.09.16.bb.do_packagedata with hash ee=
3f5138593bed3feb8519cf3c26aa7b
Hash for dependent task autoconf-archive/autoconf-archive_2016.09.16.bb.do_=
packagedata changed from e26a8076711b7e88a3ffcda74a9e5332 to ee3f5138593bed=
3feb8519cf3c26aa7b
</pre><div><br></div></div><div class=3D"gmail_extra"><br><div class=3D"gma=
il_quote">On Fri, Jul 28, 2017 at 6:45 PM, Khem Raj <span dir=3D"ltr">&lt;<=
a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On =
Fri, Jul 28, 2017 at 7:01 AM, Patrick Ohly &lt;<a href=3D"mailto:patrick.oh=
ly@intel.com">patrick.ohly@intel.com</a>&gt; wrote:<br>
&gt; Having common macros in OE-core that are needed by autotools based<br>
&gt; projects makes sense. For example, tpm2.0-tools in meta-measured<br>
&gt; depended on meta-oe only because of autoconf-archive.<br>
&gt;<br>
&gt; This is a verbatim copy of the autoconf-archive recipe in<br>
&gt; meta-openembedded rev 1cbd1bc1, with just one change: the patch which<=
br>
&gt; disabled the installation of ax_code_coverage.m4 and<br>
&gt; ax_check_enable_debug.m4 was removed.<br>
&gt;<br>
&gt; So now autoconf-archive in OE-core provides them. gnome-common in<br>
&gt; meta-oe will be changed to not install them and instead depend on<br>
&gt; autoconf-archive.<br>
<br>
</span>+1<br>
LGTM<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;<br>
&gt; Signed-off-by: Patrick Ohly &lt;<a href=3D"mailto:patrick.ohly@intel.c=
om">patrick.ohly@intel.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-devtools/<wbr>autoconf-archive/autoconf-<wbr>archiv=
e.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 15 +++++++++++++++<br>
&gt;=C2=A0 meta/recipes-devtools/<wbr>autoconf-archive/<a href=3D"http://au=
toconf-archive_2016.09.16.bb" rel=3D"noreferrer" target=3D"_blank">autoconf=
-<wbr>archive_2016.09.16.bb</a> | 13 +++++++++++++<br>
&gt;=C2=A0 2 files changed, 28 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-devtools/<wbr>autoconf-archive/a=
utoconf-<wbr>archive.inc<br>
&gt;=C2=A0 create mode 100644 meta/recipes-devtools/<wbr>autoconf-archive/<=
a href=3D"http://autoconf-archive_2016.09.16.bb" rel=3D"noreferrer" target=
=3D"_blank">autoconf-<wbr>archive_2016.09.16.bb</a><br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/<wbr>autoconf-archive/autoconf-<wbr=
>archive.inc b/meta/recipes-devtools/<wbr>autoconf-archive/autoconf-<wbr>ar=
chive.inc<br>
&gt; new file mode 100644<br>
&gt; index 0000000..9684d1f<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/<wbr>autoconf-archive/autoconf-<wbr>archiv=
e.inc<br>
&gt; @@ -0,0 +1,15 @@<br>
&gt; +LICENSE =3D &quot;GPLv3&quot;<br>
&gt; +HOMEPAGE =3D &quot;<a href=3D"http://www.gnu.org/software/autoconf-ar=
chive/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.org/software/<w=
br>autoconf-archive/</a>&quot;<br>
&gt; +SECTION =3D &quot;devel&quot;<br>
&gt; +<br>
&gt; +DEPENDS +=3D &quot;m4-native&quot;<br>
&gt; +DEPENDS_class-native =3D &quot;m4-native gnu-config-native&quot;<br>
&gt; +DEPENDS_class-nativesdk =3D &quot;m4-nativesdk gnu-config-nativesdk&q=
uot;<br>
&gt; +<br>
&gt; +RDEPENDS_${PN} =3D &quot;m4 gnu-config gnome-common&quot;<br>
&gt; +RDEPENDS_${PN}_class-native =3D &quot;m4-native gnu-config-native&quo=
t;<br>
&gt; +RDEPENDS_${PN}_class-<wbr>nativesdk =3D &quot;m4-nativesdk gnu-config=
-nativesdk&quot;<br>
&gt; +<br>
&gt; +SRC_URI =3D &quot;${GNU_MIRROR}/${BPN}/${BPN}-$<wbr>{PV}.tar.xz&quot;=
<br>
&gt; +<br>
&gt; +inherit autotools<br>
&gt; diff --git a/meta/recipes-devtools/<wbr>autoconf-archive/<a href=3D"ht=
tp://autoconf-archive_2016.09.16.bb" rel=3D"noreferrer" target=3D"_blank">a=
utoconf-<wbr>archive_2016.09.16.bb</a> b/meta/recipes-devtools/<wbr>autocon=
f-archive/<a href=3D"http://autoconf-archive_2016.09.16.bb" rel=3D"noreferr=
er" target=3D"_blank">autoconf-<wbr>archive_2016.09.16.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000..0a1a771<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/<wbr>autoconf-archive/<a href=3D"http://au=
toconf-archive_2016.09.16.bb" rel=3D"noreferrer" target=3D"_blank">autoconf=
-<wbr>archive_2016.09.16.bb</a><br>
&gt; @@ -0,0 +1,13 @@<br>
&gt; +require autoconf-archive.inc<br>
&gt; +<br>
&gt; +<br>
&gt; +PARALLEL_MAKE =3D &quot;&quot;<br>
&gt; +<br>
&gt; +LICENSE =3D &quot;GPLv2 &amp; GPLv3&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>d32239bcb673463a=
b874e80d47fae5<wbr>04&quot;<br>
&gt; +<br>
&gt; +SRC_URI[md5sum] =3D &quot;<wbr>bf19d4cddce260b3c3e1d51d425090<wbr>71&=
quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;<wbr>e8f2efd235f842bad2f6938bf4a722<wbr>=
40a5e5fcd248e8444335e63beb60fa<wbr>bd82&quot;<br>
&gt; +<br>
&gt; +EXTRA_OECONF +=3D &quot;ac_cv_path_M4=3Dm4&quot;<br>
&gt; +BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt;<br>
&gt; base-commit: d3a41fbd94462efc8c6f1b55f6fb54<wbr>001b447c45<br>
&gt; --<br>
&gt; git-series 0.9.1<br>
&gt; --<br>
&gt; ______________________________<wbr>_________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.<wbr>openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<=
wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--94eb2c19211e53951c05566be648--
