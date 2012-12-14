Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1TjYxH-0004wR-Vh
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Dec 2012 18:22:04 +0100
Received: by mail-ob0-f175.google.com with SMTP id vb8so3524929obc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2012 09:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=pUuPdimz5eB7uBcsemJ5I28BpVaPkXwIqcLPFqC5GXI=;
	b=F5qPHxSsCfC9ak04+DCIWe072UcDYZs5Y/PQoeafa0Dp1VWLXec509tINqPFPeIEm1
	ATsQ9cqkKLUCz6+YO3lJvSx+tK7KsZoF64cihoZdMIvDwkbquz2kzjGboxWF4TjYgY72
	JCYQtxDedwtbh1lzyfUF4aAjvFV3eQZZ10FEjrX2TSEwEGMGzq9hz27lAsiuTEOEqBD1
	hgJLRiht8O4Txk5INF9OCl4pH+0CgOXo1NzDoXXWGRJ/PS/Z7SKixsz2QpYdUIolkbI7
	t0+yl468dDfcyMD45NrdMGGQagtY+IDjwDq2m8lojRSQgvUOg5beMt2Cgjvt2/ckNE/B
	2qBQ==
MIME-Version: 1.0
Received: by 10.182.162.69 with SMTP id xy5mr5104477obb.95.1355504831071; Fri,
	14 Dec 2012 09:07:11 -0800 (PST)
Received: by 10.60.8.39 with HTTP; Fri, 14 Dec 2012 09:07:11 -0800 (PST)
In-Reply-To: <alpine.DEB.2.02.1212141152280.9381@oneiric>
References: <CAOHjBZvW_wovoRDXuk=sbc-sgf64zLjsZYwDv+1UnXgkrLE_Nw@mail.gmail.com>
	<1355503781.9104.27.camel@dromedary>
	<alpine.DEB.2.02.1212141152280.9381@oneiric>
Date: Fri, 14 Dec 2012 18:07:11 +0100
Message-ID: <CAOHjBZscjW1kKU1TUNmPRL=OwdF0BA89mtuEaD_DVSU1yTx5Rw@mail.gmail.com>
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
X-List-Received-Date: Fri, 14 Dec 2012 17:22:09 -0000
Content-Type: multipart/alternative; boundary=e89a8f83a717f285b704d0d30f3f

--e89a8f83a717f285b704d0d30f3f
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2012/12/14 Robert P. J. Day <rpjday@crashcourse.ca>

> On Fri, 14 Dec 2012, Marko Kati=C4=87 wrote:
>
> > On Fri, 2012-12-14 at 17:41 +0100, Giuseppe Condorelli wrote:
> > > Hi All,
> > >
> > > I've seen that, in the given .inc file, the FILESPATH is statically
> > > set to
> > >
> > > FILESPATH =3D "${FILE_DIRNAME}/gcc-4.7"
> > >
> > > This seems to avoid any FILESEXTRAPATHS_prepend usage on append file.
> > > I need to add further patches for gcc-4.7.2 in my own meta layer but
> > > if I set the FILESEXTRAPATHS_prepend as usual
> > > nothing happens, sources are taken only from the directory set by
> > > FILESPATH.
> > > Also I saw this setting was different in the past
> > >
> > > FILESPATH =3D "${@base_set_filespath([ '${FILE_DIRNAME}/gcc-4.7' ], d=
)}"
>
>   i'm fairly sure i posted on this recently.  base.bbclass
> *explicitly* sets FILESPATH to a set of variations thusly:
>
> FILESPATH =3D "${@base_set_filespath(["${FILE_DIRNAME}/${BP}",
> "${FILE_DIRNAME}/${BPN}", "${FILE_DIRNAME}/files"], d)}"
>
> which works fine with the recipes in the underlying oe-core layer.
>
>   however, when you use FILESEXTRAPATHS_prepend, you get additional
> directories based on *only* the name you specify.  so if you do:
>
> FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
>
> are you thinking you should also get all variations of "gcc-4.7"?
> because that's not what's going to happen.
>
> I'm sorry, I've not catched your last sentence. I set (as in the past) th=
e
FILESEXTRAPATHS_prepend :=3D "${THISDIR}/files:"
also updating the SRC_URI inside the .bbappend file to use the sources
available in the gcc directory available in my own layer.


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
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>

--e89a8f83a717f285b704d0d30f3f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">2012/12/14 Robert P. J. Day <span dir=3D=
"ltr">&lt;<a href=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday=
@crashcourse.ca</a>&gt;</span><br><blockquote style=3D"margin:0px 0px 0px 0=
.8ex;padding-left:1ex;border-left-color:rgb(204,204,204);border-left-width:=
1px;border-left-style:solid" class=3D"gmail_quote">
<div class=3D"im">On Fri, 14 Dec 2012, Marko Kati=C4=87 wrote:<br>
<br>
&gt; On Fri, 2012-12-14 at 17:41 +0100, Giuseppe Condorelli wrote:<br>
&gt; &gt; Hi All,<br>
&gt; &gt;<br>
&gt; &gt; I&#39;ve seen that, in the given .inc file, the FILESPATH is stat=
ically<br>
&gt; &gt; set to<br>
&gt; &gt;<br>
&gt; &gt; FILESPATH =3D &quot;${FILE_DIRNAME}/gcc-4.7&quot;<br>
&gt; &gt;<br>
&gt; &gt; This seems to avoid any FILESEXTRAPATHS_prepend usage on append f=
ile.<br>
&gt; &gt; I need to add further patches for gcc-4.7.2 in my own meta layer =
but<br>
&gt; &gt; if I set the FILESEXTRAPATHS_prepend as usual<br>
&gt; &gt; nothing happens, sources are taken only from the directory set by=
<br>
&gt; &gt; FILESPATH.<br>
&gt; &gt; Also I saw this setting was different in the past<br>
&gt; &gt;<br>
&gt; &gt; FILESPATH =3D &quot;${@base_set_filespath([ &#39;${FILE_DIRNAME}/=
gcc-4.7&#39; ], d)}&quot;<br>
<br>
</div>=C2=A0 i&#39;m fairly sure i posted on this recently. =C2=A0base.bbcl=
ass<br>
*explicitly* sets FILESPATH to a set of variations thusly:<br>
<br>
FILESPATH =3D &quot;${@base_set_filespath([&quot;${FILE_DIRNAME}/${BP}&quot=
;, &quot;${FILE_DIRNAME}/${BPN}&quot;, &quot;${FILE_DIRNAME}/files&quot;], =
d)}&quot;<br>
<br>
which works fine with the recipes in the underlying oe-core layer.<br>
<br>
=C2=A0 however, when you use FILESEXTRAPATHS_prepend, you get additional<br=
>
directories based on *only* the name you specify. =C2=A0so if you do:<br>
<br>
FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/${PN}:&quot;<br>
<br>
are you thinking you should also get all variations of &quot;gcc-4.7&quot;?=
<br>
because that&#39;s not what&#39;s going to happen.<br>
<br></blockquote><div>I&#39;m sorry, I&#39;ve not catched your last sentenc=
e. I set (as in the past) the FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}=
/files:&quot;</div><div>also=C2=A0updating the SRC_URI inside the .bbappend=
 file to use the sources available in the gcc directory available in my own=
 layer.</div>
<div>=C2=A0</div><blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left=
:1ex;border-left-color:rgb(204,204,204);border-left-width:1px;border-left-s=
tyle:solid" class=3D"gmail_quote">
rday<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
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
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</font></=
span><br>_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
<br></blockquote></div><br>

--e89a8f83a717f285b704d0d30f3f--
