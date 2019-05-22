Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
	[209.85.160.176])
	by mail.openembedded.org (Postfix) with ESMTP id 9380D6BA10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 13:48:35 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id o7so2389363qtp.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 06:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5os/GSpRObxdjTvIlHBZg5pIEYv0kokQuNIJVKDgSmk=;
	b=hT/sHxHuSel110i3vIFBHUziOWuJZvSZxqZayr30mY4R/PaUSbj+Ex8W8tBPc6V/Sr
	9LddUKEAY32q/OaT1s9fHnRlGj56BFXEo27ZwrdVAzWNjJTGzcZV6RhO10Spn+ii3B6Y
	VUE2KJ24kDow+kdbBpxtXyqUYjuaGqRPLOFL7Vz3dkCaECN51Arq0WRUPJVcL9qNG0vL
	OEiNymtJRpMm0340s0zOAO/zSvcQ38TdZaDQEP7eRQ64Kxg0hW+Aa6lDf8Cp0UuSSUM7
	4gDXZIkTi9iALbTGPagM6hS9WBQW4gOQpob+D8J2GC0zZWNzpzFQvAAgYoFS5wRVpRQr
	askg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5os/GSpRObxdjTvIlHBZg5pIEYv0kokQuNIJVKDgSmk=;
	b=EbcKZwuUaqUFpYI4uA51Wfehy/mJ78t9LHFwso2zDiFbn1plO+xn0hjsZ7EX3wkwPH
	SkqEoxfkOKt6bqwQEozuoHCw4Oy6vT7GMK0tTnO8UcYbeSpaJOWqZ4mlMCWqhnsywCdO
	aiV/ngySlXj2LAExF0e09FvUjSn/T6A0OeJvRtzSWsH4eBHUqUXLofp297Nh+mGgPPf3
	+1jdupRA5DYHd394VvxVoJA/fxwX1Jzd14m0GtKY0uAV8rtB9Df2jZWnDWeJSu1aJcIS
	InNTUwMJvDwENfxMi+S7bqnbrKkRmzCKYWaWt6CiZcho6Hfp5Pz1ityjinY9qXdICk4U
	FS2g==
X-Gm-Message-State: APjAAAXMxyUhuGcFoHCrUJGcgUNAh4VGr6ulBE0hnXJT/3NNthHmKxt2
	rOPVQNh2iSy1d34ez8B7L9qA+bWwKjQjDnr4gDg=
X-Google-Smtp-Source: APXvYqzdLbbTLqQzKzkDd1mFXQyzT164AYPVEnkfX2sE5OGMUsNhXpR318BcGYFikr9wc1ccI6A1CCwElPv/MFt5NUg=
X-Received: by 2002:a0c:d251:: with SMTP id o17mr69688562qvh.181.1558532916203;
	Wed, 22 May 2019 06:48:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190521161158.45329-1-alex.kanavin@gmail.com>
	<CAMKF1so7ASfBEknz4t727WGHvSOvJ2z=v87m0o=iZW4VdqFztw@mail.gmail.com>
	<CANNYZj8cSb0_7fRhG=bbizctTnaQg53hVwSzOu5WoWr9ywbMKQ@mail.gmail.com>
	<33700e11097f8b98ea98acfce06977e24c3bfb8d.camel@linuxfoundation.org>
	<CANNYZj-v5GzbKcoX1_WF=nUosLPkXBT3tovmHvXZ2hFLocu0+g@mail.gmail.com>
In-Reply-To: <CANNYZj-v5GzbKcoX1_WF=nUosLPkXBT3tovmHvXZ2hFLocu0+g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 May 2019 06:48:10 -0700
Message-ID: <CAMKF1spjL+ZYrpkSGNcFOJuTF8XLcYUHPu=vvHXjY0XQ4Z8GtQ@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libmodulemd: fix erroneous linking against v2 library when v1 was requested
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
X-List-Received-Date: Wed, 22 May 2019 13:48:35 -0000
Content-Type: multipart/alternative; boundary="000000000000d7559d05897a38d6"

--000000000000d7559d05897a38d6
Content-Type: text/plain; charset="UTF-8"

On Wed, May 22, 2019 at 4:21 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> I'm not sure that would work, as at do_rootfs time both createrepo_c
> (v2 user) and libdnf (v1 user) need to be present in the
> sysroot-native, and so v1 and v2 files would clash at that point
> (libmodulemd.so would be provided by both).
>
> I am kind of hoping that libdnf would migrate off v1 to v2, and we
> could then simply disable v1 altogether. So far it hasn't happened,
> and libdnf update is now also blocked by the c++ code that older
> compilers don't like, so I'd leave thing as they are for now.
>
>
conflicts will happen only when dev packages
are bundled into image.

we probably need something like libusb for this case and then remove the
compat package when its
no longer needed.



> Alex
>
> On Wed, 22 May 2019 at 13:08, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Wed, 2019-05-22 at 12:28 +0200, Alexander Kanavin wrote:
> > > On Wed, 22 May 2019 at 04:04, Khem Raj <raj.khem@gmail.com> wrote:
> > > > > +
> > > > > + pkg.generate(
> > > > > +-    libraries : modulemd_v1_lib,
> > > > > ++    libraries : '-l:libmodulemd.so.1',
> > > >
> > > > shouldn't it be generating a separate package for v1 ?
> > > > hardcoding linker paths seems a bit hackish here, is it going
> > > > to generate a .pc file with .so.1 version ?
> > >
> > > The problem is that both v2 and v1 are installed into the sysroot; we
> > > don't have a mechanism to choose one or the other via DEPENDS (unlike
> > > desktop distros where you can install -v1-dev or -v2-dev package for
> > > your build).
> > > Then both v2 and v1 .pc files (without this patch) refer to
> > > '-lmodulemd' which in our case always resolves to v2 library.
> > >
> > > Wth the patch the generated v1 .pc will look like this, while v2
> > > continues to use the original '-lmodlulemd' in Libs:
> > >
> > > prefix=${pcfiledir}/../../../usr
> > > libdir=${prefix}/lib
> > > includedir=${prefix}/include
> > >
> > > Name: modulemd
> > > Description: Module metadata manipulation library
> > > Version: 1.8.10
> > > Requires: glib-2.0, gobject-2.0
> > > Libs: -l:libmodulemd.so.1
> > > Cflags: -I${includedir}/modulemd
> >
> > FWIW I think if there were two different recipes we could select which
> > was in the sysroot through DEPENDS?
> >
> > Cheers,
> >
> > Richard
> >
>

--000000000000d7559d05897a38d6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"auto"><br></div></div><div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, =
May 22, 2019 at 4:21 AM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavi=
n@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">I&#39;m not sure that =
would work, as at do_rootfs time both createrepo_c<br>
(v2 user) and libdnf (v1 user) need to be present in the<br>
sysroot-native, and so v1 and v2 files would clash at that point<br>
(libmodulemd.so would be provided by both).<br>
<br>
I am kind of hoping that libdnf would migrate off v1 to v2, and we<br>
could then simply disable v1 altogether. So far it hasn&#39;t happened,<br>
and libdnf update is now also blocked by the c++ code that older<br>
compilers don&#39;t like, so I&#39;d leave thing as they are for now.<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-family:monospace,monospace">conflicts will happen only when dev packag=
es</div><div class=3D"gmail_default" style=3D"font-family:monospace,monospa=
ce">are bundled into image.</div><br></div><div><div class=3D"gmail_default=
" style=3D"font-family:monospace,monospace">we probably need something like=
 libusb for this case and then remove the compat package when its</div><div=
 class=3D"gmail_default" style=3D"font-family:monospace,monospace">no longe=
r needed.</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
Alex<br>
<br>
On Wed, 22 May 2019 at 13:08, Richard Purdie<br>
&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank"=
>richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On Wed, 2019-05-22 at 12:28 +0200, Alexander Kanavin wrote:<br>
&gt; &gt; On Wed, 22 May 2019 at 04:04, Khem Raj &lt;<a href=3D"mailto:raj.=
khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; + pkg.generate(<br>
&gt; &gt; &gt; &gt; +-=C2=A0 =C2=A0 libraries : modulemd_v1_lib,<br>
&gt; &gt; &gt; &gt; ++=C2=A0 =C2=A0 libraries : &#39;-l:libmodulemd.so.1&#3=
9;,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; shouldn&#39;t it be generating a separate package for v1 ?<b=
r>
&gt; &gt; &gt; hardcoding linker paths seems a bit hackish here, is it goin=
g<br>
&gt; &gt; &gt; to generate a .pc file with .so.1 version ?<br>
&gt; &gt;<br>
&gt; &gt; The problem is that both v2 and v1 are installed into the sysroot=
; we<br>
&gt; &gt; don&#39;t have a mechanism to choose one or the other via DEPENDS=
 (unlike<br>
&gt; &gt; desktop distros where you can install -v1-dev or -v2-dev package =
for<br>
&gt; &gt; your build).<br>
&gt; &gt; Then both v2 and v1 .pc files (without this patch) refer to<br>
&gt; &gt; &#39;-lmodulemd&#39; which in our case always resolves to v2 libr=
ary.<br>
&gt; &gt;<br>
&gt; &gt; Wth the patch the generated v1 .pc will look like this, while v2<=
br>
&gt; &gt; continues to use the original &#39;-lmodlulemd&#39; in Libs:<br>
&gt; &gt;<br>
&gt; &gt; prefix=3D${pcfiledir}/../../../usr<br>
&gt; &gt; libdir=3D${prefix}/lib<br>
&gt; &gt; includedir=3D${prefix}/include<br>
&gt; &gt;<br>
&gt; &gt; Name: modulemd<br>
&gt; &gt; Description: Module metadata manipulation library<br>
&gt; &gt; Version: 1.8.10<br>
&gt; &gt; Requires: glib-2.0, gobject-2.0<br>
&gt; &gt; Libs: -l:libmodulemd.so.1<br>
&gt; &gt; Cflags: -I${includedir}/modulemd<br>
&gt;<br>
&gt; FWIW I think if there were two different recipes we could select which=
<br>
&gt; was in the sysroot through DEPENDS?<br>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; Richard<br>
&gt;<br>
</blockquote></div></div>
</div>

--000000000000d7559d05897a38d6--
