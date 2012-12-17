Received: from mail-oa0-f47.google.com ([209.85.219.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1TkbL6-0001ZD-Nq
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Dec 2012 15:06:44 +0100
Received: by mail-oa0-f47.google.com with SMTP id h1so5796159oag.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2012 05:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=s3jr3eXj0KaroyHVvbVQuB1FlkI1A6F0BY5CfV9leus=;
	b=iCX4oM58RjaFzyVYDy0r7knLD7S3NEtiyXlVmRFm0nAhOWGmPEOJeNUns1vfYo/9j7
	k6Gtqrpow04uyqqG+ajr+ZDezHLpOA5QyoRjH9YlmitSbDik2AbtueJiBH2YLApPiuG5
	J6jpUxfmrSM69uw9VxGlHYqplVYHaysEzHWSQgyBw3HYMByHYpXBZc/HmzphJMKEm2HP
	DY18ZI2QrMiIztnxPYCivGDgfpVFqz+hL7O/2WW+4f/dyjv8DPfz1vdzZ8N79AtzgA5g
	SAdF00UEK6GzH0PO7LZEQk0GmfmQdHGs+7KDHigjvDY2WeseKEypzBFosBiWTuGMLU+m
	GcAw==
MIME-Version: 1.0
Received: by 10.182.64.70 with SMTP id m6mr11762444obs.15.1355752319656; Mon,
	17 Dec 2012 05:51:59 -0800 (PST)
Received: by 10.60.8.39 with HTTP; Mon, 17 Dec 2012 05:51:59 -0800 (PST)
In-Reply-To: <alpine.DEB.2.02.1212141209200.9553@oneiric>
References: <CAOHjBZvW_wovoRDXuk=sbc-sgf64zLjsZYwDv+1UnXgkrLE_Nw@mail.gmail.com>
	<1355503781.9104.27.camel@dromedary>
	<alpine.DEB.2.02.1212141152280.9381@oneiric>
	<CAOHjBZscjW1kKU1TUNmPRL=OwdF0BA89mtuEaD_DVSU1yTx5Rw@mail.gmail.com>
	<alpine.DEB.2.02.1212141209200.9553@oneiric>
Date: Mon, 17 Dec 2012 14:51:59 +0100
Message-ID: <CAOHjBZsawyuAo4zrzoSd3R5GypV=BiNEHc-JD5STmz1mR80G3Q@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: gcc-4.7.inc wrong FILESPATH setting?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Dec 2012 14:06:44 -0000
Content-Type: multipart/alternative; boundary=14dae93a16996aa39104d10cafbd

--14dae93a16996aa39104d10cafbd
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2012/12/14 Robert P. J. Day <rpjday@crashcourse.ca>

> On Fri, 14 Dec 2012, Giuseppe Condorelli wrote:
>
> >
> >
> > 2012/12/14 Robert P. J. Day <rpjday@crashcourse.ca>
> >       On Fri, 14 Dec 2012, Marko Kati=C4=87 wrote:
> >
> >       > On Fri, 2012-12-14 at 17:41 +0100, Giuseppe Condorelli wrote:
> >       > > Hi All,
> >       > >
> >       > > I've seen that, in the given .inc file, the FILESPATH is
> statically
> >       > > set to
> >       > >
> >       > > FILESPATH =3D "${FILE_DIRNAME}/gcc-4.7"
> >       > >
> >       > > This seems to avoid any FILESEXTRAPATHS_prepend usage on
> append file.
> >       > > I need to add further patches for gcc-4.7.2 in my own meta
> layer but
> >       > > if I set the FILESEXTRAPATHS_prepend as usual
> >       > > nothing happens, sources are taken only from the directory se=
t
> by
> >       > > FILESPATH.
> >       > > Also I saw this setting was different in the past
> >       > >
> >       > > FILESPATH =3D "${@base_set_filespath([ '${FILE_DIRNAME}/gcc-4=
.7'
> ], d)}"
> >
> >   i'm fairly sure i posted on this recently.  base.bbclass
> > *explicitly* sets FILESPATH to a set of variations thusly:
> >
> > FILESPATH =3D "${@base_set_filespath(["${FILE_DIRNAME}/${BP}",
> "${FILE_DIRNAME}/${BPN}", "${FILE_DIRNAME}/files"], d)}"
> >
> > which works fine with the recipes in the underlying oe-core layer.
> >
> >   however, when you use FILESEXTRAPATHS_prepend, you get additional
> > directories based on *only* the name you specify.  so if you do:
> >
> > FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
> >
> > are you thinking you should also get all variations of "gcc-4.7"?
> > because that's not what's going to happen.
> >
> > I'm sorry, I've not catched your last sentence. I set (as in the
> > past) the FILESEXTRAPATHS_prepend :=3D "${THISDIR}/files:"
> > also updating the SRC_URI inside the .bbappend file to use the
> > sources available in the gcc directory available in my own layer.
>
>   did you also set THISDIR just above that?
>
No, I don't set it. Is it necessary now?


>
> rday
>
> --
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>

--14dae93a16996aa39104d10cafbd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">2012/12/14 Robert P. J. Day <span dir=3D=
"ltr">&lt;<a href=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday=
@crashcourse.ca</a>&gt;</span><br><blockquote style=3D"margin:0px 0px 0px 0=
.8ex;padding-left:1ex;border-left-color:rgb(204,204,204);border-left-width:=
1px;border-left-style:solid" class=3D"gmail_quote">
<div class=3D"HOEnZb"><div class=3D"h5">On Fri, 14 Dec 2012, Giuseppe Condo=
relli wrote:<br>
<br>
&gt;<br>
&gt;<br>
&gt; 2012/12/14 Robert P. J. Day &lt;<a href=3D"mailto:rpjday@crashcourse.c=
a">rpjday@crashcourse.ca</a>&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 On Fri, 14 Dec 2012, Marko Kati=C4=87 wrote:<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 &gt; On Fri, 2012-12-14 at 17:41 +0100, Giuseppe =
Condorelli wrote:<br>
&gt; =C2=A0 =C2=A0 =C2=A0 &gt; &gt; Hi All,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 &gt; &gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 &gt; &gt; I&#39;ve seen that, in the given .inc f=
ile, the FILESPATH is statically<br>
&gt; =C2=A0 =C2=A0 =C2=A0 &gt; &gt; set to<br>
&gt; =C2=A0 =C2=A0 =C2=A0 &gt; &gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 &gt; &gt; FILESPATH =3D &quot;${FILE_DIRNAME}/gcc=
-4.7&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 &gt; &gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 &gt; &gt; This seems to avoid any FILESEXTRAPATHS=
_prepend usage on append file.<br>
&gt; =C2=A0 =C2=A0 =C2=A0 &gt; &gt; I need to add further patches for gcc-4=
.7.2 in my own meta layer but<br>
&gt; =C2=A0 =C2=A0 =C2=A0 &gt; &gt; if I set the FILESEXTRAPATHS_prepend as=
 usual<br>
&gt; =C2=A0 =C2=A0 =C2=A0 &gt; &gt; nothing happens, sources are taken only=
 from the directory set by<br>
&gt; =C2=A0 =C2=A0 =C2=A0 &gt; &gt; FILESPATH.<br>
&gt; =C2=A0 =C2=A0 =C2=A0 &gt; &gt; Also I saw this setting was different i=
n the past<br>
&gt; =C2=A0 =C2=A0 =C2=A0 &gt; &gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 &gt; &gt; FILESPATH =3D &quot;${@base_set_filespa=
th([ &#39;${FILE_DIRNAME}/gcc-4.7&#39; ], d)}&quot;<br>
&gt;<br>
&gt; =C2=A0 i&#39;m fairly sure i posted on this recently. =C2=A0base.bbcla=
ss<br>
&gt; *explicitly* sets FILESPATH to a set of variations thusly:<br>
&gt;<br>
&gt; FILESPATH =3D &quot;${@base_set_filespath([&quot;${FILE_DIRNAME}/${BP}=
&quot;, &quot;${FILE_DIRNAME}/${BPN}&quot;, &quot;${FILE_DIRNAME}/files&quo=
t;], d)}&quot;<br>
&gt;<br>
&gt; which works fine with the recipes in the underlying oe-core layer.<br>
&gt;<br>
&gt; =C2=A0 however, when you use FILESEXTRAPATHS_prepend, you get addition=
al<br>
&gt; directories based on *only* the name you specify. =C2=A0so if you do:<=
br>
&gt;<br>
&gt; FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/${PN}:&quot;<br>
&gt;<br>
&gt; are you thinking you should also get all variations of &quot;gcc-4.7&q=
uot;?<br>
&gt; because that&#39;s not what&#39;s going to happen.<br>
&gt;<br>
&gt; I&#39;m sorry, I&#39;ve not catched your last sentence. I set (as in t=
he<br>
&gt; past) the FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/files:&quot;<b=
r>
&gt; also=C2=A0updating the SRC_URI inside the .bbappend file to use the<br=
>
&gt; sources available in the gcc directory available in my own layer. =C2=
=A0<br>
<br>
</div></div>=C2=A0 did you also set THISDIR just above that?<br></blockquot=
e><div>No, I don&#39;t set it. Is it necessary now?=C2=A0</div><div>=C2=A0<=
/div><blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-=
left-color:rgb(204,204,204);border-left-width:1px;border-left-style:solid" =
class=3D"gmail_quote">

<div class=3D"HOEnZb"><div class=3D"h5"><br>
rday<br>
<br>
--<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
Robert P. J. Day =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Ottawa, Ontario, CA=
NADA<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 <a href=3D"http://crashcourse.ca" target=3D"_blank">http://crash=
course.ca</a><br>
<br>
Twitter: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=
=3D"http://twitter.com/rpjday" target=3D"_blank">http://twitter.com/rpjday<=
/a><br>
LinkedIn: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://ca.linkedin.com=
/in/rpjday" target=3D"_blank">http://ca.linkedin.com/in/rpjday</a><br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</div></d=
iv></blockquote></div><br>

--14dae93a16996aa39104d10cafbd--
