Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 7BBD6731BD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jan 2016 17:02:18 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id o67so440324097iof.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Jan 2016 09:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=UpkP4pjSD7hLQM+RrPZuwD2AIhrwLlz8OgUUqvqNs8M=;
	b=OBofptX77El8iw42nivGdIhRugvVE6VAcul10dHX1mEPSkMP8uiI92LYXcGMEX4z5n
	NCCO3zO8OcokFGxfquy3gnvbMU1oPWZWL5MgbnInWcnbSE/3bavL1x8GxhFAZKC5Wtna
	w84dHHF1gVU0JE3WSR99as9FUBjJV/pD5xVI2GoVPgqeHZRqCJTGcHSMUozrn2Car556
	psAuR8u5b8GujR6aAi5bJZyYys004FmEmQMv7thKEP8xl9FLbeiVkOSACFyjxA4Gbg2L
	gnMhTdr2oiHohH243ehN05wHBTb+LesTdUcTCetUIpfmph3oMIK2K+BWp/V0HlBmecMz
	SQ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=UpkP4pjSD7hLQM+RrPZuwD2AIhrwLlz8OgUUqvqNs8M=;
	b=RG755aWFjU+EY4CQK3lSdzmCmQwPu6NsiOfUfleoYHpwGuhdeGSCn1eAZBcaeGwIta
	atFW/DjNIwoV7d+hlcCkCv7/wKRUNhgCzC1HY/X/iMMiuaanf7w+YNnGKDucE5yV8XrV
	ZKdqNQYV2TC3929PyjvaxAxjg6iMwb1jIEip4bAqvt04pvMmWnzy5EnUVPRLwaoMEthn
	NLq1OzJ+PbqC8jR9WXE0DTnGgmurCYZx5jcz8i64hG3pHWe2iHPIVlQPGZrtQ7Dvp59w
	a04mNoQT/m2tIb7acPeT3OL9trnc+KeiJx6Vx7R+KvvE90ppvqgzhJFKRXAxUKU+ehjT
	Voow==
X-Gm-Message-State: ALoCoQm59TTnfl7j3BilqpJgs8rODkSG4uaQH+YZokk20f6cJkcZBz5slW8VeP9I7O0NoCQCAv9nNp6mGlpT58Qi6gqDmSGQf98Jj5kWQZkUs7Qy0vS3mVs=
X-Received: by 10.107.135.104 with SMTP id j101mr51812230iod.133.1451926938795;
	Mon, 04 Jan 2016 09:02:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 4 Jan 2016 09:01:59 -0800 (PST)
In-Reply-To: <1B56A49860EB2D45ADE3731B15C959FDFE3FDEC8@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1450429709-32736-1-git-send-email-leimaohui@cn.fujitsu.com>
	<1B56A49860EB2D45ADE3731B15C959FDFE3FDEC8@G08CNEXMBPEKD01.g08.fujitsu.local>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 4 Jan 2016 17:01:59 +0000
Message-ID: <CAJTo0La6X_4sWfDMtQ8EopGB0_zn7Tb9JmhJnOYh771wNx7aiA@mail.gmail.com>
To: "Lei, Maohui" <leimaohui@cn.fujitsu.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] jpeg: To enable non-JPEG file formats for djpeg/cjpeg command.
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
X-List-Received-Date: Mon, 04 Jan 2016 17:02:18 -0000
Content-Type: multipart/alternative; boundary=001a113ebe926d488c05288515fc

--001a113ebe926d488c05288515fc
Content-Type: text/plain; charset=UTF-8

Hi,

oe-core is about to move to libjpeg-turbo (see ross/mut and the recent
patches), so this will need to be retested and rebased if required.

Ross

On 30 December 2015 at 01:07, Lei, Maohui <leimaohui@cn.fujitsu.com> wrote:

> ping
>
> > -----Original Message-----
> > From: Lei, Maohui
> > Sent: Friday, December 18, 2015 5:08 PM
> > To: openembedded-core@lists.openembedded.org
> > Cc: Lei, Maohui
> > Subject: [OE-core][PATCH] jpeg: To enable non-JPEG file formats for
> djpeg/cjpeg
> > command.
> >
> > To fix the error as following when use djpeg/cjpeg command:
> > Unsupported output file format
> >
> > Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> > ---
> >  meta/recipes-core/jpeg/jpeg_9a.bb | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/meta/recipes-core/jpeg/jpeg_9a.bb b/meta/recipes-
> > core/jpeg/jpeg_9a.bb
> > index ea2e65d..092057d 100644
> > --- a/meta/recipes-core/jpeg/jpeg_9a.bb
> > +++ b/meta/recipes-core/jpeg/jpeg_9a.bb
> > @@ -21,6 +21,19 @@ FILES_jpeg-tools =         "${bindir}/*"
> >
> >  BBCLASSEXTEND = "native"
> >
> > +#To enable non-JPEG(bmp,gif,ppm and targa) file formats for djpeg/cjpeg
> > command
> > +do_compile_prepend() {
> > +        echo '#ifdef JPEG_CJPEG_DJPEG '
>    >> jconfig.h
> > +        echo '#define BMP_SUPPORTED    /* BMP image file format */'
>    >>
> > jconfig.h
> > +        echo '#define GIF_SUPPORTED    /* GIF image file format */'
>    >> jconfig.h
> > +        echo '#define PPM_SUPPORTED    /* PBMPLUS PPM/PGM image file
> format
> > */' >> jconfig.h
> > +        echo '#undef RLE_SUPPORTED     /* Utah RLE image file format
> */'  >>
> > jconfig.h
> > +        echo '#define TARGA_SUPPORTED  /* Targa image file format */'
>    >>
> > jconfig.h
> > +        echo '#endif /* JPEG_CJPEG_DJPEG */'
>   >> jconfig.h
> > +}
> > +
> > +
> > +
> >  pkg_postinst_${PN}_linuxstdbase () {
> >      if [ ! -e $D${libdir}/libjpeg.so.62 ]; then
> >          JPEG=`find $D${libdir} -type f -name libjpeg.so.\*.\*.\*`
> > --
> > 1.8.4.2
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a113ebe926d488c05288515fc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>oe-core is about to move to libjpeg=
-turbo (see ross/mut and the recent patches), so this will need to be retes=
ted and rebased if required.<div><br></div><div>Ross</div></div></div><div =
class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 30 December 2015 at=
 01:07, Lei, Maohui <span dir=3D"ltr">&lt;<a href=3D"mailto:leimaohui@cn.fu=
jitsu.com" target=3D"_blank">leimaohui@cn.fujitsu.com</a>&gt;</span> wrote:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">ping<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; -----Original Message-----<br>
&gt; From: Lei, Maohui<br>
&gt; Sent: Friday, December 18, 2015 5:08 PM<br>
&gt; To: <a href=3D"mailto:openembedded-core@lists.openembedded.org">openem=
bedded-core@lists.openembedded.org</a><br>
&gt; Cc: Lei, Maohui<br>
&gt; Subject: [OE-core][PATCH] jpeg: To enable non-JPEG file formats for dj=
peg/cjpeg<br>
&gt; command.<br>
&gt;<br>
&gt; To fix the error as following when use djpeg/cjpeg command:<br>
&gt; Unsupported output file format<br>
&gt;<br>
&gt; Signed-off-by: Lei Maohui &lt;<a href=3D"mailto:leimaohui@cn.fujitsu.c=
om">leimaohui@cn.fujitsu.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-core/jpeg/<a href=3D"http://jpeg_9a.bb" rel=3D"nore=
ferrer" target=3D"_blank">jpeg_9a.bb</a> | 13 +++++++++++++<br>
&gt;=C2=A0 1 file changed, 13 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/jpeg/<a href=3D"http://jpeg_9a.bb" rel=
=3D"noreferrer" target=3D"_blank">jpeg_9a.bb</a> b/meta/recipes-<br>
&gt; core/jpeg/<a href=3D"http://jpeg_9a.bb" rel=3D"noreferrer" target=3D"_=
blank">jpeg_9a.bb</a><br>
&gt; index ea2e65d..092057d 100644<br>
&gt; --- a/meta/recipes-core/jpeg/<a href=3D"http://jpeg_9a.bb" rel=3D"nore=
ferrer" target=3D"_blank">jpeg_9a.bb</a><br>
&gt; +++ b/meta/recipes-core/jpeg/<a href=3D"http://jpeg_9a.bb" rel=3D"nore=
ferrer" target=3D"_blank">jpeg_9a.bb</a><br>
&gt; @@ -21,6 +21,19 @@ FILES_jpeg-tools =3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;${bindir}/*&quot;<br>
&gt;<br>
&gt;=C2=A0 BBCLASSEXTEND =3D &quot;native&quot;<br>
&gt;<br>
&gt; +#To enable non-JPEG(bmp,gif,ppm and targa) file formats for djpeg/cjp=
eg<br>
&gt; command<br>
&gt; +do_compile_prepend() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &#39;#ifdef JPEG_CJPEG_DJPEG &#39;=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; jconfig.h<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &#39;#define BMP_SUPPORTED=C2=A0 =C2=
=A0 /* BMP image file format */&#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt; jconfig.h<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &#39;#define GIF_SUPPORTED=C2=A0 =C2=
=A0 /* GIF image file format */&#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; jco=
nfig.h<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &#39;#define PPM_SUPPORTED=C2=A0 =C2=
=A0 /* PBMPLUS PPM/PGM image file format<br>
&gt; */&#39; &gt;&gt; jconfig.h<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &#39;#undef RLE_SUPPORTED=C2=A0 =C2=
=A0 =C2=A0/* Utah RLE image file format */&#39;=C2=A0 &gt;&gt;<br>
&gt; jconfig.h<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &#39;#define TARGA_SUPPORTED=C2=A0 /=
* Targa image file format */&#39;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt; jconfig.h<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &#39;#endif /* JPEG_CJPEG_DJPEG */&#=
39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt; jconfig.h<br>
&gt; +}<br>
&gt; +<br>
&gt; +<br>
&gt; +<br>
&gt;=C2=A0 pkg_postinst_${PN}_linuxstdbase () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if [ ! -e $D${libdir}/libjpeg.so.62 ]; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 JPEG=3D`find $D${libdir} -type f -na=
me libjpeg.so.\*.\*.\*`<br>
&gt; --<br>
&gt; 1.8.4.2<br>
<br>
<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</div></div></blockquote></div><br></div>

--001a113ebe926d488c05288515fc--
