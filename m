Return-Path: <yahiafarghaly@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 24A9F78230
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Sep 2017 01:51:16 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id z73so2878035oia.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 18:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DOOnOjZMkyLR5zJRqvYuIpOxxO6OV/t8qH5mXsaYEQ0=;
	b=i37hj1q4Jyh40XXHHKFlq7S8/zaZOSDBGRP4m/vb6ifxI1J85a5mENzvuLO29c35bR
	gONyu+ubyJydFqy2fPotF15/dUbJvKw23PBA74hOKqBl5FvL8yxm+T/84sdAuID7OASY
	7oeDXOkGV3tv+WhIcsWtJaTb1Fsm12nWCRsGiWPo9M2aGIIr3RWNgikD90o61+XyP96G
	Cc46B4TeHZNl9xaNcoFqOT/S+gJqi0GKrgKYKkuqmp414DjJf+i2IprgQEG3G7NZuJvU
	vn7u6XXR9oBZSQdhsk9l5GOBD6WjNYE7PCc5L1pjt11XGYxN2yFMtKmhinhZwJqAUyCs
	oBIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DOOnOjZMkyLR5zJRqvYuIpOxxO6OV/t8qH5mXsaYEQ0=;
	b=YpA33MPxwl4rxV2bV3GH+hihrA6zZfU4JqGVufDU0CiUWse2GAPQqJs8usysCXEakU
	O60X7dFk6rwFKMFfLVt8bWvjdj4W5vwQhUAglkxheHy0AE8E1cDtHrbqmMZpQmCaAmxv
	jvefREMrejCDWJA9r7p8H6M9VkPBLwaaEv7PDdISBbygncVv7Y8jBfPxck/zknFnIksO
	Kr3/A+JGxT1MnUR35l7vCWxb+6pIf3cKGTJ1D0CvI6lKqOXcQPBSIswTmYxWh90jq7wE
	MHtxk9S51SAFRKSuK0isMSkKQR3ZdF6aa35cuRI1w28KwGzraxoAfdkNfb8DBzFYU58K
	27nQ==
X-Gm-Message-State: AHPjjUgrXWV8vFLQnD6FqLnlnRVFrIqXwc4VXcJy/iiZVjTJWy1GMCvk
	mo1C3RkTfLf0K8OF8ToCAOwAsTRv1w==
X-Google-Smtp-Source: AOwi7QAnEd6NgPOdgEzxLCjFkXdy3cnxUzv4Fw0cyWe3FtFOlvO8hibyS8CRzABfuBDwcMfS1reEA2TyixeLib4dB4Q=
X-Received: by 10.202.175.137 with SMTP id y131mr4382286oie.114.1504921878197; 
	Fri, 08 Sep 2017 18:51:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.82.15 with HTTP; Fri, 8 Sep 2017 18:51:17 -0700 (PDT)
In-Reply-To: <CAMKF1sqQaLDQwN2q8FaT4Xo_pA=x4=G4k49G2x8OxpmAZyEYJw@mail.gmail.com>
References: <1504909055-29659-1-git-send-email-yahiacommunication@yahoo.com>
	<CAMKF1sqQaLDQwN2q8FaT4Xo_pA=x4=G4k49G2x8OxpmAZyEYJw@mail.gmail.com>
From: yahia farghaly <yahiafarghaly@gmail.com>
Date: Sat, 9 Sep 2017 03:51:17 +0200
Message-ID: <CABFXn3FR++eBBpHB3FWWAEEcnb2ksJatZ92foU+7mX8+HRMo-g@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] gnupg: added a coreutils runtime dependancy to gnupg recipe
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
X-List-Received-Date: Sat, 09 Sep 2017 01:51:17 -0000
Content-Type: multipart/alternative; boundary="001a113cf64cf6f9ef0558b7ed2e"

--001a113cf64cf6f9ef0558b7ed2e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ok, this is a nice idea what i think is i may take only comm.c and its
depends then compiling it and try to produce package. is this idea good  ?

Mr.Chen Qi, what do you think about making a specific package for 'comm'
which is a part of coreutils ?

=E2=80=8C

On 9 September 2017 at 01:07, Khem Raj <raj.khem@gmail.com> wrote:

> On Fri, Sep 8, 2017 at 3:17 PM, Yahia Farghaly <yahiafarghaly@gmail.com>
> wrote:
> > From: yahiafarghaly <yahiafarghaly@gmail.com>
> >
> > When using 'apt-key add' on the target image, the gnupg is required
> > but for gnupg to be fully functional, the coreutils is required to be
> exist with the gnupg.
> > Otherwise, it may throw an error in runtime as one of components of
> coreutils is missing.
> > For 'apt-key add', i faced the error of 'comm: command not found' so as
> proper solution, i submit this change.
> >
> > Signed-off-by: yahiafarghaly <yahiafarghaly@gmail.com>
> > ---
> >  meta/recipes-support/gnupg/gnupg_2.2.0.bb | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta/recipes-support/gnupg/gnupg_2.2.0.bb
> b/meta/recipes-support/gnupg/gnupg_2.2.0.bb
> > index 0176ddd..8aa0951 100644
> > --- a/meta/recipes-support/gnupg/gnupg_2.2.0.bb
> > +++ b/meta/recipes-support/gnupg/gnupg_2.2.0.bb
> > @@ -44,3 +44,5 @@ do_install_append() {
> >  PACKAGECONFIG ??=3D "gnutls"
> >  PACKAGECONFIG[gnutls] =3D "--enable-gnutls, --disable-gnutls, gnutls"
> >  PACKAGECONFIG[sqlite3] =3D "--enable-sqlite, --disable-sqlite, sqlite3=
"
> > +
> > +RDEPENDS_${PN} =3D "coreutils"
>
> can we make the packaging more granular where comm is packages into a
> package of its
> own e.g. coreutils-comm and then create specific rdep on coreutils-comm
>
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



--=20
Yahia Farghaly
Graduated from Faculty of Engineering - Electronics and Communications
Department at Cairo University.
Linkedin <https://linkedin.com/in/yahiafarghaly> - GitHub
<https://github.com/yahiafarghaly>

--001a113cf64cf6f9ef0558b7ed2e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br>Ok, this is a nice idea what i think is i may take onl=
y comm.c and its depends then compiling it and try to produce package. is t=
his idea good =C2=A0?=C2=A0<div><br></div><div>Mr.Chen Qi, what do you thin=
k about making a specific package for &#39;comm&#39; which is a part of cor=
eutils ?<br><br>=E2=80=8C</div></div><div class=3D"gmail_extra"><br><div cl=
ass=3D"gmail_quote">On 9 September 2017 at 01:07, Khem Raj <span dir=3D"ltr=
">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmai=
l.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=
=3D"">On Fri, Sep 8, 2017 at 3:17 PM, Yahia Farghaly &lt;<a href=3D"mailto:=
yahiafarghaly@gmail.com">yahiafarghaly@gmail.com</a>&gt; wrote:<br>
&gt; From: yahiafarghaly &lt;<a href=3D"mailto:yahiafarghaly@gmail.com">yah=
iafarghaly@gmail.com</a>&gt;<br>
&gt;<br>
&gt; When using &#39;apt-key add&#39; on the target image, the gnupg is req=
uired<br>
&gt; but for gnupg to be fully functional, the coreutils is required to be =
exist with the gnupg.<br>
&gt; Otherwise, it may throw an error in runtime as one of components of co=
reutils is missing.<br>
&gt; For &#39;apt-key add&#39;, i faced the error of &#39;comm: command not=
 found&#39; so as proper solution, i submit this change.<br>
&gt;<br>
&gt; Signed-off-by: yahiafarghaly &lt;<a href=3D"mailto:yahiafarghaly@gmail=
.com">yahiafarghaly@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-support/gnupg/<a href=3D"http://gnupg_2.2.0.bb" rel=
=3D"noreferrer" target=3D"_blank">gnu<wbr>pg_2.2.0.bb</a> | 2 ++<br>
&gt;=C2=A0 1 file changed, 2 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-support/gnupg/<a href=3D"http://gnupg_2.2.0.=
bb" rel=3D"noreferrer" target=3D"_blank">g<wbr>nupg_2.2.0.bb</a> b/meta/rec=
ipes-support/gnupg/<a href=3D"http://gnupg_2.2.0.bb" rel=3D"noreferrer" tar=
get=3D"_blank">g<wbr>nupg_2.2.0.bb</a><br>
&gt; index 0176ddd..8aa0951 100644<br>
&gt; --- a/meta/recipes-support/gnupg/<a href=3D"http://gnupg_2.2.0.bb" rel=
=3D"noreferrer" target=3D"_blank">g<wbr>nupg_2.2.0.bb</a><br>
&gt; +++ b/meta/recipes-support/gnupg/<a href=3D"http://gnupg_2.2.0.bb" rel=
=3D"noreferrer" target=3D"_blank">g<wbr>nupg_2.2.0.bb</a><br>
&gt; @@ -44,3 +44,5 @@ do_install_append() {<br>
&gt;=C2=A0 PACKAGECONFIG ??=3D &quot;gnutls&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[gnutls] =3D &quot;--enable-gnutls, --disable-gnutl=
s, gnutls&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[sqlite3] =3D &quot;--enable-sqlite, --disable-sqli=
te, sqlite3&quot;<br>
&gt; +<br>
&gt; +RDEPENDS_${PN} =3D &quot;coreutils&quot;<br>
<br>
</span>can we make the packaging more granular where comm is packages into =
a<br>
package of its<br>
own e.g. coreutils-comm and then create specific rdep on coreutils-comm<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
&gt; --<br>
&gt; 2.7.4<br>
&gt;<br>
&gt; --<br>
&gt; ______________________________<wbr>_________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.<wbr>openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<=
wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div di=
r=3D"ltr"><div><div dir=3D"ltr"><font size=3D"1" color=3D"#777777" style=3D=
"font-family:Tahoma,sans-serif,Arial,serif,EmojiFont"><span style=3D"font-s=
ize:13px">Yahia Farghaly=C2=A0</span></font><span style=3D"color:rgb(0,0,0)=
;font-family:Calibri,Arial,Helvetica,sans-serif,serif,EmojiFont;font-size:1=
6px"></span><div><font color=3D"#777777" face=3D"Tahoma, sans-serif, Arial,=
 serif, EmojiFont"><span style=3D"font-size:13px">Graduated from Faculty of=
 Engineering - Electronics and Communications Department at Cairo Universit=
y.</span></font><br></div><div style=3D"color:rgb(0,0,0);font-family:Calibr=
i,Arial,Helvetica,sans-serif,serif,EmojiFont;font-size:16px"><div><a href=
=3D"https://linkedin.com/in/yahiafarghaly" rel=3D"noopener noreferrer" targ=
et=3D"_blank"><font size=3D"1" style=3D"font-family:Tahoma,sans-serif,Arial=
,serif,EmojiFont"><span style=3D"font-size:13px">Linkedin</span></font></a>=
<font size=3D"1" color=3D"#777777" style=3D"font-family:Tahoma,sans-serif,A=
rial,serif,EmojiFont"><span style=3D"font-size:13px">=C2=A0-=C2=A0</span></=
font><a href=3D"https://github.com/yahiafarghaly" rel=3D"noopener noreferre=
r" target=3D"_blank"><font size=3D"1" style=3D"font-family:Tahoma,sans-seri=
f,Arial,serif,EmojiFont"><span style=3D"font-size:13px">GitHub</span></font=
></a></div></div></div></div></div></div>
</div>

--001a113cf64cf6f9ef0558b7ed2e--
