Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com
	[209.85.217.54])
	by mail.openembedded.org (Postfix) with ESMTP id 78F786D7C1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 11:48:05 +0000 (UTC)
Received: by mail-vs1-f54.google.com with SMTP id q16so13233076vsm.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 04:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=tVnCpfOTD9YW3bdIF3c+knqU+doj1qfheV5crO5kD3U=;
	b=lZdfFDoeS8uLsAm5oQvx2X6w0l3mrfqaOSeX2nz7q1CpFerps/carc//WY2MrzlFGu
	yG46p7lVZClbElz6yAj64T1aELuzxFOKLgdO6druBYWmHos6jhtHtTP6A80eh/dk2qJi
	5MM/vaxX2f59EhACdom85o/sGHzZtsh88f6CC2kSWEQ5Z3k6vy+Q32HlMDLDGpo/UQX8
	GRSR1n0lyQD9ZVEZ+vW+0ZWBpl3cZzXUjdvwnlrjesCWIbUg2T3ICWwHfglb2abA8uVW
	jD2JOJH8qfgpBWkcccmburdfE2zb16wYBm+emtZmwiVSmcd8piyzn/mmANGN5w9m7IrF
	ICvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tVnCpfOTD9YW3bdIF3c+knqU+doj1qfheV5crO5kD3U=;
	b=FJK5NLncvZHpEjgqSVsLKckIFt1RqdHgoIr0vin2r9dPYaD8aYEkxkbpljY6HDF7E9
	vN0m/ozR8/NzP5fWRpJTfAwITuFE0UV2zQGx3R6gkcd7rtYecRgvtlW6ZNNOovEkmon2
	niiOwrJIQyVcSpq2/BZYkYmOzHGo72m5N9HZei64VvuAgkTboXRx2r/lytUyREu4dXBt
	UbhhBL8cGYGBiaPi1sVF2l2FOoFDdRw1fjzYOrM5uSMNF9R2P8C0qxLYhrJ8qMcLyqww
	y680Bu7POqVOeiYcarCGcwq/uBbocBq4GY5obPX8O9tQR2FXgPA1KqViDkk7QPWZNnU8
	O0Yg==
X-Gm-Message-State: APjAAAXs3X8UJBipsKemLq2VGg2o4h7/qnsfp4WeyRsyLXp2qMr5my26
	tj91wwz8ROwQDXY0K0OURJZzqIGiNGjzfe85n7s=
X-Google-Smtp-Source: APXvYqwq7uFCn2z/F6oeJ391gvyxO6P6fhweQ3844TX1AouO+rVvhkRHl/ugKjYYtucVM5E5q4Aa2ANvs3eBf46Ncro=
X-Received: by 2002:a67:1c87:: with SMTP id c129mr13820683vsc.23.1566906486395;
	Tue, 27 Aug 2019 04:48:06 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1566872499.git.Qi.Chen@windriver.com>
	<5f8198b68f123e1e47451a70d8bc3bb5ae893ac2.1566872499.git.Qi.Chen@windriver.com>
	<5a1eb3164dda6d0fac071fb443a14c9af72931f8.camel@linuxfoundation.org>
In-Reply-To: <5a1eb3164dda6d0fac071fb443a14c9af72931f8.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 27 Aug 2019 13:47:55 +0200
Message-ID: <CANNYZj9xzw-yd3DJm62FX7RtXiOwt=DF64sr4F6NvPyaFKeCJw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] gettext: avoid useless RPATH QA issue
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
X-List-Received-Date: Tue, 27 Aug 2019 11:48:05 -0000
Content-Type: multipart/alternative; boundary="00000000000084957a059117d853"

--00000000000084957a059117d853
Content-Type: text/plain; charset="UTF-8"

I also have to point out that a new release of gettext (0.20.x) has been
out for a while now, so maybe it's better to upgrade to that first.

Alex

On Tue, 27 Aug 2019 at 13:38, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2019-08-27 at 10:22 +0800, Chen Qi wrote:
> > We are getting useless rpath QA error when enabling libunistring
> > and msgcat-curses PACKAGECONFIG. Use chrpath to delete the redundant
> > RPATH in binaries.
> >
> > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > ---
> >  meta/recipes-core/gettext/gettext_0.19.8.1.bb | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/meta/recipes-core/gettext/gettext_0.19.8.1.bb
> > b/meta/recipes-core/gettext/gettext_0.19.8.1.bb
> > index 30121ad..4ce47a6 100644
> > --- a/meta/recipes-core/gettext/gettext_0.19.8.1.bb
> > +++ b/meta/recipes-core/gettext/gettext_0.19.8.1.bb
> > @@ -118,6 +118,14 @@ FILES_gettext-runtime-doc =
> > "${mandir}/man1/gettext.* \
> >
> >  do_install_append() {
> >      rm -f ${D}${libdir}/preloadable_libintl.so
> > +    # remove useless rpath to avoid QA issue
> > +    useless_rpath_list="${D}${libdir}/gettext/urlget
> > ${D}${libdir}/gettext/cldr-plurals \
> > +                        ${D}${libdir}/gettext/hostname
> > ${D}${bindir}/recode-sr-latin"
> > +    for f in $useless_rpath_list; do
> > +     if [ -e $f ]; then
> > +         chrpath -d $f
> > +     fi
> > +    done
> >  }
> >
> >  do_install_append_class-native () {
> > @@ -163,6 +171,8 @@ do_install_ptest() {
> >          find ${D}${PTEST_PATH}/ -name "*.o" -exec rm {} \;
> >          chmod 0755 ${D}${PTEST_PATH}/tests/lang-vala
> > ${D}${PTEST_PATH}/tests/plural-1 ${D}${PTEST_PATH}/tests/xgettext-
> > tcl-4 \
> >                     ${D}${PTEST_PATH}/tests/xgettext-vala-
> > 1  ${D}${PTEST_PATH}/tests/xgettext-po-2
> > +        # avoid useless rpath
> > +        [ -e ${D}${PTEST_PATH}/src/cldr-plurals ] && chrpath -d
> > ${D}${PTEST_PATH}/src/cldr-plurals
> >      fi
> >  }
>
> In general we try and fix the reason they're getting included in the
> first place as it means the compiler flags are incorrect. Any idea why
> that is happening and if we can fix it?
>
> Cheers,
>
> Richard
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000084957a059117d853
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I also have to point out that a new release of gettex=
t (0.20.x) has been out for a while now, so maybe it&#39;s better to upgrad=
e to that first.</div><div><br></div><div>Alex<br></div></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 27 Aug 2019=
 at 13:38, Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundat=
ion.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">On Tue, 2019-08-27 at 10:22 +080=
0, Chen Qi wrote:<br>
&gt; We are getting useless rpath QA error when enabling libunistring<br>
&gt; and msgcat-curses PACKAGECONFIG. Use chrpath to delete the redundant<b=
r>
&gt; RPATH in binaries.<br>
&gt; <br>
&gt; Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" ta=
rget=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-core/gettext/<a href=3D"http://gettext_0.19.8.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">gettext_0.19.8.1.bb</a> | 10 ++++++++=
++<br>
&gt;=C2=A0 1 file changed, 10 insertions(+)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-core/gettext/<a href=3D"http://gettext_0.19.=
8.1.bb" rel=3D"noreferrer" target=3D"_blank">gettext_0.19.8.1.bb</a><br>
&gt; b/meta/recipes-core/gettext/<a href=3D"http://gettext_0.19.8.1.bb" rel=
=3D"noreferrer" target=3D"_blank">gettext_0.19.8.1.bb</a><br>
&gt; index 30121ad..4ce47a6 100644<br>
&gt; --- a/meta/recipes-core/gettext/<a href=3D"http://gettext_0.19.8.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">gettext_0.19.8.1.bb</a><br>
&gt; +++ b/meta/recipes-core/gettext/<a href=3D"http://gettext_0.19.8.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">gettext_0.19.8.1.bb</a><br>
&gt; @@ -118,6 +118,14 @@ FILES_gettext-runtime-doc =3D<br>
&gt; &quot;${mandir}/man1/gettext.* \<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 do_install_append() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 rm -f ${D}${libdir}/preloadable_libintl.so<br>
&gt; +=C2=A0 =C2=A0 # remove useless rpath to avoid QA issue<br>
&gt; +=C2=A0 =C2=A0 useless_rpath_list=3D&quot;${D}${libdir}/gettext/urlget=
<br>
&gt; ${D}${libdir}/gettext/cldr-plurals \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 ${D}${libdir}/gettext/hostname<br>
&gt; ${D}${bindir}/recode-sr-latin&quot;<br>
&gt; +=C2=A0 =C2=A0 for f in $useless_rpath_list; do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if [ -e $f ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0chrpath -d $f<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fi<br>
&gt; +=C2=A0 =C2=A0 done<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 do_install_append_class-native () {<br>
&gt; @@ -163,6 +171,8 @@ do_install_ptest() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 find ${D}${PTEST_PATH}/ -name &quot;=
*.o&quot; -exec rm {} \;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 chmod 0755 ${D}${PTEST_PATH}/tests/l=
ang-vala<br>
&gt; ${D}${PTEST_PATH}/tests/plural-1 ${D}${PTEST_PATH}/tests/xgettext-<br>
&gt; tcl-4 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0${D}${PTEST_PATH}/tests/xgettext-vala-<br>
&gt; 1=C2=A0 ${D}${PTEST_PATH}/tests/xgettext-po-2<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # avoid useless rpath<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 [ -e ${D}${PTEST_PATH}/src/cldr-plurals ]=
 &amp;&amp; chrpath -d<br>
&gt; ${D}${PTEST_PATH}/src/cldr-plurals<br>
&gt;=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt;=C2=A0 }<br>
<br>
In general we try and fix the reason they&#39;re getting included in the<br=
>
first place as it means the compiler flags are incorrect. Any idea why<br>
that is happening and if we can fix it?<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--00000000000084957a059117d853--
