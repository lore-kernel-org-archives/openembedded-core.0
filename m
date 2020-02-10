Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com
	[209.85.217.41])
	by mail.openembedded.org (Postfix) with ESMTP id 9F1F960B8E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Feb 2020 11:42:09 +0000 (UTC)
Received: by mail-vs1-f41.google.com with SMTP id v141so3856347vsv.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Feb 2020 03:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=6LnHIVqoxPsECkWEti1ZpQYAvcZWBlRlISmQmbDQBCI=;
	b=P7BbOyH3b4xsPTquHotzvkDsAgHelONqHX77DJ40gOU73GP49cRLa0gfKlMxePavJu
	E+ESYtFckphtvaKFw6afafMtUVI64Ps5goZjq4K03m/pBUunJIHr+eejldV6XvsLC8lg
	CBUUCB9KLPLTn5C3a0LQN+JUlbIDt8YRsQbRsAyR5i0yFr5OFahdB/P6ZAZFslueP+qM
	kb8D13chrybHnkz8f1HKklEYRUCQI9ZR89FawYpRqQUo2HITOLHaGDLZorpQYoQFc1iy
	7Sh4/zXY5vuGjQ757ZVWDwckfZgcDtyhRTGH1HRNVHNJYyxTL+TzMRXWZugp4Lp8P6jB
	XZ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6LnHIVqoxPsECkWEti1ZpQYAvcZWBlRlISmQmbDQBCI=;
	b=RwBSOqoZThcKk0M0BHhsfMxREfOvqzV7PbYMd4eU6tIJLe5emly7YIm4I6BNQOpbD9
	/8d/QaPtpejGxsn6F9qwYj63F8E4jz/oDMppSdroxvB9XphfI0UF+Cz6r5UieaN7bdID
	EplWkA3W5DdGnaw2s1UNyjVCVvcxKjEj3h/zMDQzzaM2cu7/3eCgb+Fp1T27IjoQajP1
	AUfOXvEsv46ZrKTlh/iSEHHnCp0DOTU9TJp2mNdMBXOob4qOaK/DfS3UQXQS0Qtf5p/e
	P6N81APOGlMZyiE+9XSF7m/UHVz5H/zpAelz6Gb2exYInku/E05cZPSQshtROomlUIvN
	a7ZQ==
X-Gm-Message-State: APjAAAWxMPN/pGYCxI1vzI2jhWtB7Ac6GrdQ6xDDIS8f5VWA75Tj852y
	5rq3e0sPb9GE/ZSat6c3dOe+pW6tw+p5xKy+Gco=
X-Google-Smtp-Source: APXvYqzKqN24DobBlD1OZaYH5QenQEVTmOwCCBKEIdcm3O8gB/u/pglLMdAYDUAt+YZMRHwJat4DV9ndYxWZChkxRD0=
X-Received: by 2002:a05:6102:757:: with SMTP id
	v23mr6140087vsg.35.1581334930516; 
	Mon, 10 Feb 2020 03:42:10 -0800 (PST)
MIME-Version: 1.0
References: <20200208000110.29065-1-scott.branden@broadcom.com>
	<CAMKF1spdaO+wpwowYzfu=vigB+tSJPtwS46eimFenj=0hmhLFA@mail.gmail.com>
	<55bb9c66-a419-c43d-111b-e5442db8df91@broadcom.com>
	<CAMKF1spFfVojndyrOXa6TFXHUO-DNR3xr3Dj7jwGa8g--Pdz1Q@mail.gmail.com>
	<2159565f-eaca-697d-0711-e39aeccb1ba2@broadcom.com>
	<CAMKF1srW_aR=4TZBxTdnTXwRWZg0u7TDhiNme9JsE8NSzXy_sw@mail.gmail.com>
	<6cf5b86f-5055-0573-61ab-ad4717af5c2d@broadcom.com>
In-Reply-To: <6cf5b86f-5055-0573-61ab-ad4717af5c2d@broadcom.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 10 Feb 2020 12:42:41 +0100
Message-ID: <CANNYZj_HaQAVfJ0f8jK2NXePovceXSZwJFdBMMVBSL4Fs_MqTw@mail.gmail.com>
To: Scott Branden <scott.branden@broadcom.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/2] x265: add x265 recipe
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
X-List-Received-Date: Mon, 10 Feb 2020 11:42:09 -0000
Content-Type: multipart/alternative; boundary="000000000000cdeef8059e373a2b"

--000000000000cdeef8059e373a2b
Content-Type: text/plain; charset="UTF-8"

As long as we're consistent, I'm ok with either option. I think it's
ultimately up to RP to make the call.


Alex

On Mon, 10 Feb 2020 at 07:16, Scott Branden via Openembedded-core <
openembedded-core@lists.openembedded.org> wrote:

>
>
> On 2020-02-09 3:35 p.m., Khem Raj wrote:
> > On Sun, Feb 9, 2020 at 11:27 AM Scott Branden
> > <scott.branden@broadcom.com> wrote:
> >>
> >>
> >> On 2020-02-08 11:18 a.m., Khem Raj wrote:
> >>> On Fri, Feb 7, 2020 at 8:02 PM Scott Branden <
> scott.branden@broadcom.com> wrote:
> >>>> Hi Khem,
> >>>>
> >>>> On 2020-02-07 5:12 p.m., Khem Raj wrote:
> >>>>
> >>>>
> >>>>
> >>>> On Fri, Feb 7, 2020 at 4:01 PM Scott Branden via Openembedded-core <
> openembedded-core@lists.openembedded.org> wrote:
> >>>>> Add x265 recipe from latest revision of stable branch.
> >>>> I wonder if it belongs to core are there deps on it that we need in
> common metadata
> >>>>
> >>>> I simply followed where x264 recipe is located and placed x265 beside
> it.
> >>>> Both are needed when enabled in ffmpeg.
> >>>>
> >>>> I don't know if that answers your question as to where they should be
> located.
> >>> idea is to keep small and therefore we should assess the inclusions in
> core
> >>> we have many packageconfigs which require packages from other layers
> >>> so if ffmpeg needs it and is optional then it should be fine to keep
> >>> it in meta-multimedia and packageconfig in ffmpeg disabled by default.
> >> I don't see why x264 would be in core and x265 in meta-multimedia.
> >> Both should be moved to meta-multimedia then?
> >>
> > I followed the thread a bit and I see there are followups where
> > usecase for other recipes in core is now
> > established, where this seemed a leaf package being added to oe-core,
> > So perhaps it should be added
> > to validation loops as well like x264.
> I leave it to the powers that be to decide where to place this recipe.
> >
> >> I think you would also require a bbappend to fffmpeg recipe to add x264
> >> and x265 to ffmpeg packageconfig.
> >> if that is the case, why not move ffmpeg to meta-multimedia as well?
> >>
> > You would not go down that line of thought since these packages are in
> > the dependency chain for validating reference
> > images in core along with they being used by other packages from other
> layers.
> >
> >>>>> Signed-off-by: Scott Branden <scott.branden@broadcom.com>
> >>>>> ---
> >>>>>    meta/recipes-multimedia/x265/x265_git.bb | 20
> ++++++++++++++++++++
> >>>>>    1 file changed, 20 insertions(+)
> >>>>>    create mode 100644 meta/recipes-multimedia/x265/x265_git.bb
> >>>>>
> >>>>> diff --git a/meta/recipes-multimedia/x265/x265_git.bb
> b/meta/recipes-multimedia/x265/x265_git.bb
> >>>>> new file mode 100644
> >>>>> index 0000000000..796fbbc13a
> >>>>> --- /dev/null
> >>>>> +++ b/meta/recipes-multimedia/x265/x265_git.bb
> >>>>> @@ -0,0 +1,20 @@
> >>>>> +SUMMARY = "H.265/HEVC video encoder"
> >>>>> +DESCRIPTION = "A free software library and application for encoding
> video streams into the H.265/HEVC format."
> >>>>> +HOMEPAGE = "http://www.videolan.org/developers/x265.html"
> >>>>> +
> >>>>> +LICENSE = "GPLv2"
> >>>>> +LICENSE_FLAGS = "commercial"
> >>>>> +LIC_FILES_CHKSUM =
> "file://../COPYING;md5=c9e0427bc58f129f99728c62d4ad4091"
> >>>>> +
> >>>>> +DEPENDS = "gnutls zlib libpcre"
> >>>>> +
> >>>>> +SRC_URI = "git://github.com/videolan/x265;branch=stable \
> >>>>> +          "
> >>>>> +
> >>>>> +SRCREV = "4ef6b67fd46e1584e52a11a264812edcaef02526"
> >>>>> +
> >>>>> +S = "${WORKDIR}/git/source"
> >>>>> +
> >>>>> +inherit lib_package pkgconfig cmake
> >>>>> +
> >>>>> +AS[unexport] = "1"
> >>>>> --
> >>>>> 2.17.1
> >>>>>
> >>>>> --
> >>>>> _______________________________________________
> >>>>> Openembedded-core mailing list
> >>>>> Openembedded-core@lists.openembedded.org
> >>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000cdeef8059e373a2b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">As long as we&#39;re consistent, I&#39;m ok with either op=
tion. I think it&#39;s ultimately up to RP to make the call.<div><br></div>=
<div><br></div><div>Alex</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, 10 Feb 2020 at 07:16, Scott Branden v=
ia Openembedded-core &lt;<a href=3D"mailto:openembedded-core@lists.openembe=
dded.org">openembedded-core@lists.openembedded.org</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,204);p=
adding-left:1ex"><br>
<br>
On 2020-02-09 3:35 p.m., Khem Raj wrote:<br>
&gt; On Sun, Feb 9, 2020 at 11:27 AM Scott Branden<br>
&gt; &lt;<a href=3D"mailto:scott.branden@broadcom.com" target=3D"_blank">sc=
ott.branden@broadcom.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; On 2020-02-08 11:18 a.m., Khem Raj wrote:<br>
&gt;&gt;&gt; On Fri, Feb 7, 2020 at 8:02 PM Scott Branden &lt;<a href=3D"ma=
ilto:scott.branden@broadcom.com" target=3D"_blank">scott.branden@broadcom.c=
om</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt; Hi Khem,<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; On 2020-02-07 5:12 p.m., Khem Raj wrote:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; On Fri, Feb 7, 2020 at 4:01 PM Scott Branden via Openembed=
ded-core &lt;<a href=3D"mailto:openembedded-core@lists.openembedded.org" ta=
rget=3D"_blank">openembedded-core@lists.openembedded.org</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt;&gt; Add x265 recipe from latest revision of stable branch.=
<br>
&gt;&gt;&gt;&gt; I wonder if it belongs to core are there deps on it that w=
e need in common metadata<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; I simply followed where x264 recipe is located and placed =
x265 beside it.<br>
&gt;&gt;&gt;&gt; Both are needed when enabled in ffmpeg.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; I don&#39;t know if that answers your question as to where=
 they should be located.<br>
&gt;&gt;&gt; idea is to keep small and therefore we should assess the inclu=
sions in core<br>
&gt;&gt;&gt; we have many packageconfigs which require packages from other =
layers<br>
&gt;&gt;&gt; so if ffmpeg needs it and is optional then it should be fine t=
o keep<br>
&gt;&gt;&gt; it in meta-multimedia and packageconfig in ffmpeg disabled by =
default.<br>
&gt;&gt; I don&#39;t see why x264 would be in core and x265 in meta-multime=
dia.<br>
&gt;&gt; Both should be moved to meta-multimedia then?<br>
&gt;&gt;<br>
&gt; I followed the thread a bit and I see there are followups where<br>
&gt; usecase for other recipes in core is now<br>
&gt; established, where this seemed a leaf package being added to oe-core,<=
br>
&gt; So perhaps it should be added<br>
&gt; to validation loops as well like x264.<br>
I leave it to the powers that be to decide where to place this recipe.<br>
&gt;<br>
&gt;&gt; I think you would also require a bbappend to fffmpeg recipe to add=
 x264<br>
&gt;&gt; and x265 to ffmpeg packageconfig.<br>
&gt;&gt; if that is the case, why not move ffmpeg to meta-multimedia as wel=
l?<br>
&gt;&gt;<br>
&gt; You would not go down that line of thought since these packages are in=
<br>
&gt; the dependency chain for validating reference<br>
&gt; images in core along with they being used by other packages from other=
 layers.<br>
&gt;<br>
&gt;&gt;&gt;&gt;&gt; Signed-off-by: Scott Branden &lt;<a href=3D"mailto:sco=
tt.branden@broadcom.com" target=3D"_blank">scott.branden@broadcom.com</a>&g=
t;<br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 meta/recipes-multimedia/x265/<a href=3D"h=
ttp://x265_git.bb" rel=3D"noreferrer" target=3D"_blank">x265_git.bb</a> | 2=
0 ++++++++++++++++++++<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 1 file changed, 20 insertions(+)<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 create mode 100644 meta/recipes-multimedi=
a/x265/<a href=3D"http://x265_git.bb" rel=3D"noreferrer" target=3D"_blank">=
x265_git.bb</a><br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; diff --git a/meta/recipes-multimedia/x265/<a href=3D"h=
ttp://x265_git.bb" rel=3D"noreferrer" target=3D"_blank">x265_git.bb</a> b/m=
eta/recipes-multimedia/x265/<a href=3D"http://x265_git.bb" rel=3D"noreferre=
r" target=3D"_blank">x265_git.bb</a><br>
&gt;&gt;&gt;&gt;&gt; new file mode 100644<br>
&gt;&gt;&gt;&gt;&gt; index 0000000000..796fbbc13a<br>
&gt;&gt;&gt;&gt;&gt; --- /dev/null<br>
&gt;&gt;&gt;&gt;&gt; +++ b/meta/recipes-multimedia/x265/<a href=3D"http://x=
265_git.bb" rel=3D"noreferrer" target=3D"_blank">x265_git.bb</a><br>
&gt;&gt;&gt;&gt;&gt; @@ -0,0 +1,20 @@<br>
&gt;&gt;&gt;&gt;&gt; +SUMMARY =3D &quot;H.265/HEVC video encoder&quot;<br>
&gt;&gt;&gt;&gt;&gt; +DESCRIPTION =3D &quot;A free software library and app=
lication for encoding video streams into the H.265/HEVC format.&quot;<br>
&gt;&gt;&gt;&gt;&gt; +HOMEPAGE =3D &quot;<a href=3D"http://www.videolan.org=
/developers/x265.html" rel=3D"noreferrer" target=3D"_blank">http://www.vide=
olan.org/developers/x265.html</a>&quot;<br>
&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt; +LICENSE =3D &quot;GPLv2&quot;<br>
&gt;&gt;&gt;&gt;&gt; +LICENSE_FLAGS =3D &quot;commercial&quot;<br>
&gt;&gt;&gt;&gt;&gt; +LIC_FILES_CHKSUM =3D &quot;file://../COPYING;md5=3Dc9=
e0427bc58f129f99728c62d4ad4091&quot;<br>
&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt; +DEPENDS =3D &quot;gnutls zlib libpcre&quot;<br>
&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt; +SRC_URI =3D &quot;git://<a href=3D"http://github.com/=
videolan/x265;branch=3Dstable" rel=3D"noreferrer" target=3D"_blank">github.=
com/videolan/x265;branch=3Dstable</a> \<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt; +SRCREV =3D &quot;4ef6b67fd46e1584e52a11a264812edcaef0=
2526&quot;<br>
&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt; +S =3D &quot;${WORKDIR}/git/source&quot;<br>
&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt; +inherit lib_package pkgconfig cmake<br>
&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt; +AS[unexport] =3D &quot;1&quot;<br>
&gt;&gt;&gt;&gt;&gt; --<br>
&gt;&gt;&gt;&gt;&gt; 2.17.1<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; --<br>
&gt;&gt;&gt;&gt;&gt; _______________________________________________<br>
&gt;&gt;&gt;&gt;&gt; Openembedded-core mailing list<br>
&gt;&gt;&gt;&gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded=
.org" target=3D"_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt;&gt;&gt;&gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/listi=
nfo/openembedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.op=
enembedded.org/mailman/listinfo/openembedded-core</a><br>
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

--000000000000cdeef8059e373a2b--
