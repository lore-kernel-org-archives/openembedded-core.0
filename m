Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8F6A86C397
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Apr 2019 16:31:01 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id v20so3914824qtv.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Apr 2019 09:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=OR2kn5eZzKvJ70lkCErPpYMXdYUzijRHGTO7R8nVna4=;
	b=i9x75NCDgbAKlPgS8j4vZALzgievVfKP+gcmQNxpWcugwsek/ZkZ7+j4lYnx83bl1P
	sIjsNk5XfC2Wf9cbNNZ3J3vtUK5E6MRmKRyn9jR63akU3VPHqJY21LfQxmzXTKQu171X
	g0+yBSeg96V/5JSyr13mTN7kq4iJ0eNz3k9w73ZmznGHfEZHP5riSUnWavsqoMQzD6OS
	PO5R3L2h31I8g71sWE2c5CXX9B1pUzjhYY3Pdb6k3B2SLlMqMzKhR/HsLPRrrGR0pTq/
	gS2x6AT2JrnzCLvQOvvwc78FQiMBy5Y0STJ4Eb1Db3pJYN5cmbVEu4C62zE4EYeFWokZ
	HlVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OR2kn5eZzKvJ70lkCErPpYMXdYUzijRHGTO7R8nVna4=;
	b=PZ/U0RlbSVAaJ0jyqph1lj7oju+FUN5XIkyXS1LAN/tMOYmOyqdRXdjTJTlDGiNmCu
	9bvE1wYthKXFB4+zyorFXuOMzYSpklE/TpLOep+oXvsJTpXQVFhj66mH8hxFruUeOJd1
	+zTtpFL2rqmuJQbWd2pQfpF7WqLgeHQoJMAQGtxdSbpBCqh7v0iT0ZT/s1w6eV72PB6s
	IaLdy11vX+5ZbN0vlJKG+nlVRI96bBdq/Gc2KkQnWLnHVTUK4mfRcA/mSTtMswftOKqb
	sV3vkRUlUEd7L1qrFLzPkXhJETBn7yCa/gdWR9QGejK7LoAdlrnm55hi+iDFGc31bo0X
	+BeA==
X-Gm-Message-State: APjAAAXiOxxMVzMoSRlSh8A7cbwbzpOJu+8lsb0gH3Pea/WUAoTtuqzu
	1spreCA2S7k1x4QmgokQYOjADVTZjo29+vD002w=
X-Google-Smtp-Source: APXvYqwhzxweLxfoRzqBW8OQqsxkcIzhD8aHx81kxe4jRK/tIRiccxQXLqgFbmDsU/EHz4Ywxwc/cS8qFmSM4H4aIbQ=
X-Received: by 2002:ac8:f86:: with SMTP id b6mr6393752qtk.330.1554395461853;
	Thu, 04 Apr 2019 09:31:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190403053702.10672-1-nathan@nathanrossi.com>
	<355BE46A91031048906B695426A8D8E62EA2ECD4@DENBGAT9EL2MSX.ww902.siemens.net>
	<CAMKF1spfUupA_BL1s7Aim+UsBK4anGFPpdsnQhyH18CVdmo-pw@mail.gmail.com>
	<CA+aJhH3narCCOSiWCPPLvoxF3P5pCkCGo--tc2s6n2hyXrrPMQ@mail.gmail.com>
	<CAMKF1sqpzE5DMM-M3qbDG+Z9C=_bZm23++d9MLWsUPm9k+0SbQ@mail.gmail.com>
	<CA+aJhH0x40-RNdF61G-i+dY9kMA3w=sr9AnBEFhhARB8uYfdSw@mail.gmail.com>
In-Reply-To: <CA+aJhH0x40-RNdF61G-i+dY9kMA3w=sr9AnBEFhhARB8uYfdSw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 4 Apr 2019 09:30:50 -0700
Message-ID: <CAMKF1sqcDjd_qhwsSpSrb5AZjzEj47hTOsk1gBWfBiMunnU6Vw@mail.gmail.com>
To: Nathan Rossi <nathan@nathanrossi.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/3] cmake-native: Enable ccmake by default and depend on ncurses
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
X-List-Received-Date: Thu, 04 Apr 2019 16:31:01 -0000
Content-Type: multipart/alternative; boundary="0000000000005830bc0585b6e56e"

--0000000000005830bc0585b6e56e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 3, 2019 at 9:36 PM Nathan Rossi <nathan@nathanrossi.com> wrote:

> On Thu, 4 Apr 2019 at 13:48, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Wed, Apr 3, 2019 at 8:28 PM Nathan Rossi <nathan@nathanrossi.com>
> wrote:
> > >
> > > On Thu, 4 Apr 2019 at 03:02, Khem Raj <raj.khem@gmail.com> wrote:
> > > >
> > > > On Wed, Apr 3, 2019 at 2:26 AM Bach, Pascal <pascal.bach@siemens.co=
m>
> wrote:
> > > > >
> > > > > >
> > > > > > Enable the building of the curses based ui for cmake. This
> depends on
> > > > > > ncurses.
> > > > >
> > > > > I think this is acceptable. It might also be useful for people
> wanting to use ccmake inside an SDK.
> > >
> > > Just to be clear, this change only affects cmake-native, the recipe
> > > for target/nativesdk is unchanged. Although interestingly the cmake
> > > (target/nativesdk) recipe already depends on ncurses (despite
> > > disabling ccmake).
> > >
> > > > >
> > > >
> > > > Adding dependencies do serialize builds and might have penalty on
> > > > build time, better is to turn this into a packageconfig
> > > > option and keep it disabled by default.
> > >
> > > I can rework this patch to make it a PACKAGECONFIG option. However th=
e
> > > reason for enabling ccmake by default is due to the addition of the
> > > ccmake bbclass in this series, which relies on having ccmake availabl=
e
> > > in the native sysroot. Having to override PACKAGECONFIG to use the
> > > ccmake class seemed broken (since it is not particularly a distro
> > > config).
> > >
> > > I could not find a good example of this sort of requirement for
> > > configuration for any other bbclass except for maybe
> > > gobject-introspection (which relies on qemu-native configured
> > > correctly to have linux-user for the target).
> > >
> > > Another approach I considered to have this working without requiring
> > > the user to setup PACKAGECONFIG would be to have a "ccmake-native"
> > > recipe which built the ccmake binary. But this seemed like it would b=
e
> > > extra maintenance burden compared to this patch which has minimal
> > > build time overhead.
> > >
> >
> > this seems fine, if the number of recipes needing this bbclass are far
> less than
> > one the needing cmake bbclass.
>
> Just to clarify, are you suggesting that making a ccmake-native recipe
> would be fine? Or that requiring the PACKAGECONFIG setup would be
> acceptable/preferred?


I don=E2=80=99t have enough of data to lean on either way
Are we adding this to every cmake using recipes benefit or is it only a
handful

>
>
> Thanks,
> Nathan
>
> >
> > > Regards,
> > > Nathan
> > >
> > > >
> > > > > > Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
> > > > > > ---
> > > > > > This patch suggests enabling this in the cmake-native recipe,
> however this
> > > > > > might be undesirable for bootstrapping reasons. Whilst ccmake i=
s
> not used
> > > > > > normally the added dependency on ncurses is likely required for
> other parts
> > > > > > of the build so impact on build ordering and time should be
> relatively
> > > > > > minimal.
> > > > > >
> > > > > > Changes in v2:
> > > > > > - None
> > > > > > ---
> > > > > >  meta/recipes-devtools/cmake/cmake-native_3.14.0.bb | 5 ++---
> > > > > >  1 file changed, 2 insertions(+), 3 deletions(-)
> > > > > >
> > > > > > diff --git a/meta/recipes-devtools/cmake/cmake-native_3.14.0.bb
> > > > > > b/meta/recipes-devtools/cmake/cmake-native_3.14.0.bb
> > > > > > index fedcf3d4bd..b2952ee5f5 100644
> > > > > > --- a/meta/recipes-devtools/cmake/cmake-native_3.14.0.bb
> > > > > > +++ b/meta/recipes-devtools/cmake/cmake-native_3.14.0.bb
> > > > > > @@ -1,7 +1,7 @@
> > > > > >  require cmake.inc
> > > > > >  inherit native
> > > > > >
> > > > > > -DEPENDS +=3D "bzip2-replacement-native expat-native xz-native
> zlib-native
> > > > > > curl-native"
> > > > > > +DEPENDS +=3D "bzip2-replacement-native expat-native xz-native
> zlib-native
> > > > > > curl-native ncurses-native"
> > > > > >
> > > > > >  SRC_URI +=3D "file://OEToolchainConfig.cmake \
> > > > > >              file://environment.d-cmake.sh \ @@ -13,10 +13,9 @@
> SRC_URI +=3D
> > > > > > "file://OEToolchainConfig.cmake \  B =3D "${WORKDIR}/build"
> > > > > >  do_configure[cleandirs] =3D "${B}"
> > > > > >
> > > > > > -# Disable ccmake since we don't depend on ncurses
> CMAKE_EXTRACONF =3D
> > > > > > "\
> > > > > >      -DCMAKE_LIBRARY_PATH=3D${STAGING_LIBDIR_NATIVE} \
> > > > > > -    -DBUILD_CursesDialog=3D0 \
> > > > > > +    -DBUILD_CursesDialog=3D1 \
> > > > > >      -DCMAKE_USE_SYSTEM_LIBRARIES=3D1 \
> > > > > >      -DCMAKE_USE_SYSTEM_LIBRARY_JSONCPP=3D0 \
> > > > > >      -DCMAKE_USE_SYSTEM_LIBRARY_LIBARCHIVE=3D0 \
> > > > > > ---
> > > > > > 2.20.1
> > > > > > --
> > > > > > _______________________________________________
> > > > > > Openembedded-core mailing list
> > > > > > Openembedded-core@lists.openembedded.org
> > > > > > http://lists.openembedded.org/mailman/listinfo/openembedded-cor=
e
> > > > > --
> > > > > _______________________________________________
> > > > > Openembedded-core mailing list
> > > > > Openembedded-core@lists.openembedded.org
> > > > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000005830bc0585b6e56e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Apr 3, 2019 at 9:36 PM Nathan Rossi &lt;<a href=3D"=
mailto:nathan@nathanrossi.com">nathan@nathanrossi.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">On Thu, 4 Apr 2019 at 13:48, Khem Raj &lt=
;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com=
</a>&gt; wrote:<br>
&gt;<br>
&gt; On Wed, Apr 3, 2019 at 8:28 PM Nathan Rossi &lt;<a href=3D"mailto:nath=
an@nathanrossi.com" target=3D"_blank">nathan@nathanrossi.com</a>&gt; wrote:=
<br>
&gt; &gt;<br>
&gt; &gt; On Thu, 4 Apr 2019 at 03:02, Khem Raj &lt;<a href=3D"mailto:raj.k=
hem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Wed, Apr 3, 2019 at 2:26 AM Bach, Pascal &lt;<a href=3D"m=
ailto:pascal.bach@siemens.com" target=3D"_blank">pascal.bach@siemens.com</a=
>&gt; wrote:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Enable the building of the curses based ui for cma=
ke. This depends on<br>
&gt; &gt; &gt; &gt; &gt; ncurses.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; I think this is acceptable. It might also be useful for=
 people wanting to use ccmake inside an SDK.<br>
&gt; &gt;<br>
&gt; &gt; Just to be clear, this change only affects cmake-native, the reci=
pe<br>
&gt; &gt; for target/nativesdk is unchanged. Although interestingly the cma=
ke<br>
&gt; &gt; (target/nativesdk) recipe already depends on ncurses (despite<br>
&gt; &gt; disabling ccmake).<br>
&gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Adding dependencies do serialize builds and might have penal=
ty on<br>
&gt; &gt; &gt; build time, better is to turn this into a packageconfig<br>
&gt; &gt; &gt; option and keep it disabled by default.<br>
&gt; &gt;<br>
&gt; &gt; I can rework this patch to make it a PACKAGECONFIG option. Howeve=
r the<br>
&gt; &gt; reason for enabling ccmake by default is due to the addition of t=
he<br>
&gt; &gt; ccmake bbclass in this series, which relies on having ccmake avai=
lable<br>
&gt; &gt; in the native sysroot. Having to override PACKAGECONFIG to use th=
e<br>
&gt; &gt; ccmake class seemed broken (since it is not particularly a distro=
<br>
&gt; &gt; config).<br>
&gt; &gt;<br>
&gt; &gt; I could not find a good example of this sort of requirement for<b=
r>
&gt; &gt; configuration for any other bbclass except for maybe<br>
&gt; &gt; gobject-introspection (which relies on qemu-native configured<br>
&gt; &gt; correctly to have linux-user for the target).<br>
&gt; &gt;<br>
&gt; &gt; Another approach I considered to have this working without requir=
ing<br>
&gt; &gt; the user to setup PACKAGECONFIG would be to have a &quot;ccmake-n=
ative&quot;<br>
&gt; &gt; recipe which built the ccmake binary. But this seemed like it wou=
ld be<br>
&gt; &gt; extra maintenance burden compared to this patch which has minimal=
<br>
&gt; &gt; build time overhead.<br>
&gt; &gt;<br>
&gt;<br>
&gt; this seems fine, if the number of recipes needing this bbclass are far=
 less than<br>
&gt; one the needing cmake bbclass.<br>
<br>
Just to clarify, are you suggesting that making a ccmake-native recipe<br>
would be fine? Or that requiring the PACKAGECONFIG setup would be<br>
acceptable/preferred?</blockquote><div dir=3D"auto"><br></div><div dir=3D"a=
uto">I don=E2=80=99t have enough of data to lean on either way</div><div di=
r=3D"auto">Are we adding this to every cmake using recipes benefit or is it=
 only a handful=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
Thanks,<br>
Nathan<br>
<br>
&gt;<br>
&gt; &gt; Regards,<br>
&gt; &gt; Nathan<br>
&gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Signed-off-by: Nathan Rossi &lt;<a href=3D"mailto:=
nathan@nathanrossi.com" target=3D"_blank">nathan@nathanrossi.com</a>&gt;<br=
>
&gt; &gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt; &gt; This patch suggests enabling this in the cmake-nat=
ive recipe, however this<br>
&gt; &gt; &gt; &gt; &gt; might be undesirable for bootstrapping reasons. Wh=
ilst ccmake is not used<br>
&gt; &gt; &gt; &gt; &gt; normally the added dependency on ncurses is likely=
 required for other parts<br>
&gt; &gt; &gt; &gt; &gt; of the build so impact on build ordering and time =
should be relatively<br>
&gt; &gt; &gt; &gt; &gt; minimal.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Changes in v2:<br>
&gt; &gt; &gt; &gt; &gt; - None<br>
&gt; &gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 meta/recipes-devtools/cmake/<a href=3D"http:=
//cmake-native_3.14.0.bb" rel=3D"noreferrer" target=3D"_blank">cmake-native=
_3.14.0.bb</a> | 5 ++---<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 1 file changed, 2 insertions(+), 3 deletions=
(-)<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; diff --git a/meta/recipes-devtools/cmake/<a href=
=3D"http://cmake-native_3.14.0.bb" rel=3D"noreferrer" target=3D"_blank">cma=
ke-native_3.14.0.bb</a><br>
&gt; &gt; &gt; &gt; &gt; b/meta/recipes-devtools/cmake/<a href=3D"http://cm=
ake-native_3.14.0.bb" rel=3D"noreferrer" target=3D"_blank">cmake-native_3.1=
4.0.bb</a><br>
&gt; &gt; &gt; &gt; &gt; index fedcf3d4bd..b2952ee5f5 100644<br>
&gt; &gt; &gt; &gt; &gt; --- a/meta/recipes-devtools/cmake/<a href=3D"http:=
//cmake-native_3.14.0.bb" rel=3D"noreferrer" target=3D"_blank">cmake-native=
_3.14.0.bb</a><br>
&gt; &gt; &gt; &gt; &gt; +++ b/meta/recipes-devtools/cmake/<a href=3D"http:=
//cmake-native_3.14.0.bb" rel=3D"noreferrer" target=3D"_blank">cmake-native=
_3.14.0.bb</a><br>
&gt; &gt; &gt; &gt; &gt; @@ -1,7 +1,7 @@<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 require cmake.inc<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 inherit native<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; -DEPENDS +=3D &quot;bzip2-replacement-native expat=
-native xz-native zlib-native<br>
&gt; &gt; &gt; &gt; &gt; curl-native&quot;<br>
&gt; &gt; &gt; &gt; &gt; +DEPENDS +=3D &quot;bzip2-replacement-native expat=
-native xz-native zlib-native<br>
&gt; &gt; &gt; &gt; &gt; curl-native ncurses-native&quot;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 SRC_URI +=3D &quot;file://OEToolchainConfig.=
cmake \<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi=
le://<a href=3D"http://environment.d-cmake.sh" rel=3D"noreferrer" target=3D=
"_blank">environment.d-cmake.sh</a> \ @@ -13,10 +13,9 @@ SRC_URI +=3D<br>
&gt; &gt; &gt; &gt; &gt; &quot;file://OEToolchainConfig.cmake \=C2=A0 B =3D=
 &quot;${WORKDIR}/build&quot;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 do_configure[cleandirs] =3D &quot;${B}&quot;=
<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; -# Disable ccmake since we don&#39;t depend on ncu=
rses=C2=A0 CMAKE_EXTRACONF =3D<br>
&gt; &gt; &gt; &gt; &gt; &quot;\<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 -DCMAKE_LIBRARY_PATH=3D${STAGI=
NG_LIBDIR_NATIVE} \<br>
&gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 -DBUILD_CursesDialog=3D0 \<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 -DBUILD_CursesDialog=3D1 \<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 -DCMAKE_USE_SYSTEM_LIBRARIES=
=3D1 \<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 -DCMAKE_USE_SYSTEM_LIBRARY_JSO=
NCPP=3D0 \<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 -DCMAKE_USE_SYSTEM_LIBRARY_LIB=
ARCHIVE=3D0 \<br>
&gt; &gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt; &gt; 2.20.1<br>
&gt; &gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; &gt; _______________________________________________<br=
>
&gt; &gt; &gt; &gt; &gt; Openembedded-core mailing list<br>
&gt; &gt; &gt; &gt; &gt; <a href=3D"mailto:Openembedded-core@lists.openembe=
dded.org" target=3D"_blank">Openembedded-core@lists.openembedded.org</a><br=
>
&gt; &gt; &gt; &gt; &gt; <a href=3D"http://lists.openembedded.org/mailman/l=
istinfo/openembedded-core" rel=3D"noreferrer" target=3D"_blank">http://list=
s.openembedded.org/mailman/listinfo/openembedded-core</a><br>
&gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; _______________________________________________<br>
&gt; &gt; &gt; &gt; Openembedded-core mailing list<br>
&gt; &gt; &gt; &gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.=
org" target=3D"_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; &gt; &gt; &gt; <a href=3D"http://lists.openembedded.org/mailman/listin=
fo/openembedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.ope=
nembedded.org/mailman/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--0000000000005830bc0585b6e56e--
