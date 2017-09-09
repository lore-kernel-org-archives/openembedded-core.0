Return-Path: <yahiafarghaly@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id E275B7309A
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Sep 2017 16:06:23 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id l9so3165466oib.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Sep 2017 09:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DKOW1/XR94FAnWWEwcpPKCQZKIfRh4CKxnkZXkCuBeU=;
	b=kG+qCKrsafKi8yuPIsoAXtD2Ef49eOVNB7qVqKTl1zrvYLXOARdg+96/IYU0f4B4iA
	8Cb67PS3+a8Tbj8Bs++avrzEjmAr4kKg0s7m3Jmj1qoLaRC4/CbQVijmaaCGJFjgkshm
	nevyBtH38I2um4HFTzTH+FxPik+Fg80FkeFDGvCy2hqf2TLvlYcBNtZeFFk36mPpY4PK
	F+knKmX3okaBX2f68/EMWQ+2qq9GsGD8XHYVk8ScqDUkswkd6TcAfjmCy29t2T8bGgpR
	+lYbcRqNx9i818VKHCfFKlEouvP21OpyrFFOGATfUCldDwMpcW26w2bHGynDGlY4/yBN
	hqOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DKOW1/XR94FAnWWEwcpPKCQZKIfRh4CKxnkZXkCuBeU=;
	b=nr+GwlgZYerOqZz5jSzmuCVsYLe9qSETkODnr2rj2ocy7eYPW4RtYWRFh3jqoCRkSJ
	fhYzUBYD+tjxRR07ykmoTapM6pE6finIkvVxA4Nvp6iUJLUKSqz3pQMcJJ2GXvzj4eQ5
	38FKvFhvBjc8c9Xgi8+7UsGzpNsFN+RyJqx82N9V3mcK9dSyF9SwoPQ6vyoLMvHWHpNI
	1zSxqzGcnm8efukLToCkPDUZn8TMcMKwwOzyoIApiaAqFeTeGaJjfiWzRjXXtVKruA/2
	hT8MpqY3fhvnHWyAKmSuyxLFdCopbwwQCGpjxhlk6yiu/d/hjBJEr5wa8OPvBoSWGyCc
	rIxQ==
X-Gm-Message-State: AHPjjUh1Jrpxevm7nhGbsvX8xVtF20FDO3QENmemKhQZkIO4fTiDgTJC
	Lwhy1KZo6mwhJ6qO1nVt7mqrnBdtYQ==
X-Google-Smtp-Source: AOwi7QByJJOLbFT/b3/b+Cm9O9sHGxB26CpIB2UdCwxNNOUcZNqU/YQXLcdXKVIktjL0OH62bCCJdm+gtP6i3/itslo=
X-Received: by 10.202.104.151 with SMTP id o23mr6624602oik.98.1504973184935;
	Sat, 09 Sep 2017 09:06:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.82.15 with HTTP; Sat, 9 Sep 2017 09:06:24 -0700 (PDT)
In-Reply-To: <CABFXn3FR++eBBpHB3FWWAEEcnb2ksJatZ92foU+7mX8+HRMo-g@mail.gmail.com>
References: <1504909055-29659-1-git-send-email-yahiacommunication@yahoo.com>
	<CAMKF1sqQaLDQwN2q8FaT4Xo_pA=x4=G4k49G2x8OxpmAZyEYJw@mail.gmail.com>
	<CABFXn3FR++eBBpHB3FWWAEEcnb2ksJatZ92foU+7mX8+HRMo-g@mail.gmail.com>
From: yahia farghaly <yahiafarghaly@gmail.com>
Date: Sat, 9 Sep 2017 18:06:24 +0200
Message-ID: <CABFXn3HMDoJWd2NrxkhRohEOfoGt5z-scTzn21UY=Mg59HCf1g@mail.gmail.com>
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
X-List-Received-Date: Sat, 09 Sep 2017 16:06:24 -0000
Content-Type: multipart/alternative; boundary="001a11c00be615b18c0558c3e072"

--001a11c00be615b18c0558c3e072
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

sorry if my question is naive, this is my first time working with yocto and
the first patch i submit in an open source project

=E2=80=8C

On 9 September 2017 at 03:51, yahia farghaly <yahiafarghaly@gmail.com>
wrote:

>
> Ok, this is a nice idea what i think is i may take only comm.c and its
> depends then compiling it and try to produce package. is this idea good  =
?
>
> Mr.Chen Qi, what do you think about making a specific package for 'comm'
> which is a part of coreutils ?
>
> =E2=80=8C
>
> On 9 September 2017 at 01:07, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Fri, Sep 8, 2017 at 3:17 PM, Yahia Farghaly <yahiafarghaly@gmail.com>
>> wrote:
>> > From: yahiafarghaly <yahiafarghaly@gmail.com>
>> >
>> > When using 'apt-key add' on the target image, the gnupg is required
>> > but for gnupg to be fully functional, the coreutils is required to be
>> exist with the gnupg.
>> > Otherwise, it may throw an error in runtime as one of components of
>> coreutils is missing.
>> > For 'apt-key add', i faced the error of 'comm: command not found' so a=
s
>> proper solution, i submit this change.
>> >
>> > Signed-off-by: yahiafarghaly <yahiafarghaly@gmail.com>
>> > ---
>> >  meta/recipes-support/gnupg/gnupg_2.2.0.bb | 2 ++
>> >  1 file changed, 2 insertions(+)
>> >
>> > diff --git a/meta/recipes-support/gnupg/gnupg_2.2.0.bb
>> b/meta/recipes-support/gnupg/gnupg_2.2.0.bb
>> > index 0176ddd..8aa0951 100644
>> > --- a/meta/recipes-support/gnupg/gnupg_2.2.0.bb
>> > +++ b/meta/recipes-support/gnupg/gnupg_2.2.0.bb
>> > @@ -44,3 +44,5 @@ do_install_append() {
>> >  PACKAGECONFIG ??=3D "gnutls"
>> >  PACKAGECONFIG[gnutls] =3D "--enable-gnutls, --disable-gnutls, gnutls"
>> >  PACKAGECONFIG[sqlite3] =3D "--enable-sqlite, --disable-sqlite, sqlite=
3"
>> > +
>> > +RDEPENDS_${PN} =3D "coreutils"
>>
>> can we make the packaging more granular where comm is packages into a
>> package of its
>> own e.g. coreutils-comm and then create specific rdep on coreutils-comm
>>
>> > --
>> > 2.7.4
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>
>
> --
> Yahia Farghaly
> Graduated from Faculty of Engineering - Electronics and Communications
> Department at Cairo University.
> Linkedin <https://linkedin.com/in/yahiafarghaly> - GitHub
> <https://github.com/yahiafarghaly>
>



--=20
Yahia Farghaly
Graduated from Faculty of Engineering - Electronics and Communications
Department at Cairo University.
Linkedin <https://linkedin.com/in/yahiafarghaly> - GitHub
<https://github.com/yahiafarghaly>

--001a11c00be615b18c0558c3e072
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><img width=3D"0" height=3D"0" class=3D"mailtrack-img" alt=
=3D"" style=3D"display:flex" src=3D"https://mailtrack.io/trace/mail/406b278=
65b964d4c84f6b1d44165f7409c2327f0.png?u=3D1822760"><br><br>sorry if my ques=
tion is naive, this is my first time working with yocto and the first patch=
 i submit in an open source project<br><br>=E2=80=8C</div><div class=3D"gma=
il_extra"><br><div class=3D"gmail_quote">On 9 September 2017 at 03:51, yahi=
a farghaly <span dir=3D"ltr">&lt;<a href=3D"mailto:yahiafarghaly@gmail.com"=
 target=3D"_blank">yahiafarghaly@gmail.com</a>&gt;</span> wrote:<br><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex"><div dir=3D"ltr"><br>Ok, this is a nice idea what i=
 think is i may take only comm.c and its depends then compiling it and try =
to produce package. is this idea good =C2=A0?=C2=A0<div><br></div><div>Mr.C=
hen Qi, what do you think about making a specific package for &#39;comm&#39=
; which is a part of coreutils ?<br><br>=E2=80=8C</div></div><div class=3D"=
gmail_extra"><div><div class=3D"h5"><br><div class=3D"gmail_quote">On 9 Sep=
tember 2017 at 01:07, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:raj.=
khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrote:<=
br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex"><span>On Fri, Sep 8, 2017 at 3:17 PM, Yah=
ia Farghaly &lt;<a href=3D"mailto:yahiafarghaly@gmail.com" target=3D"_blank=
">yahiafarghaly@gmail.com</a>&gt; wrote:<br>
&gt; From: yahiafarghaly &lt;<a href=3D"mailto:yahiafarghaly@gmail.com" tar=
get=3D"_blank">yahiafarghaly@gmail.com</a>&gt;<br>
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
.com" target=3D"_blank">yahiafarghaly@gmail.com</a>&gt;<br>
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
<span class=3D"m_-4680655382244237000HOEnZb"><font color=3D"#888888"><br>
&gt; --<br>
&gt; 2.7.4<br>
&gt;<br>
&gt; --<br>
&gt; ______________________________<wbr>_________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<=
wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div></div=
></div><span class=3D"HOEnZb"><font color=3D"#888888">-- <br><div class=3D"=
m_-4680655382244237000gmail_signature" data-smartmail=3D"gmail_signature"><=
div dir=3D"ltr"><div><div dir=3D"ltr"><font size=3D"1" color=3D"#777777" st=
yle=3D"font-family:Tahoma,sans-serif,Arial,serif,EmojiFont"><span style=3D"=
font-size:13px">Yahia Farghaly=C2=A0</span></font><span style=3D"color:rgb(=
0,0,0);font-family:Calibri,Arial,Helvetica,sans-serif,serif,EmojiFont;font-=
size:16px"></span><div><font color=3D"#777777" face=3D"Tahoma, sans-serif, =
Arial, serif, EmojiFont"><span style=3D"font-size:13px">Graduated from Facu=
lty of Engineering - Electronics and Communications Department at Cairo Uni=
versity.</span></font><br></div><div style=3D"color:rgb(0,0,0);font-family:=
Calibri,Arial,Helvetica,sans-serif,serif,EmojiFont;font-size:16px"><div><a =
href=3D"https://linkedin.com/in/yahiafarghaly" rel=3D"noopener noreferrer" =
target=3D"_blank"><font size=3D"1" style=3D"font-family:Tahoma,sans-serif,A=
rial,serif,EmojiFont"><span style=3D"font-size:13px">Linkedin</span></font>=
</a><font size=3D"1" color=3D"#777777" style=3D"font-family:Tahoma,sans-ser=
if,Arial,serif,EmojiFont"><span style=3D"font-size:13px">=C2=A0-=C2=A0</spa=
n></font><a href=3D"https://github.com/yahiafarghaly" rel=3D"noopener noref=
errer" target=3D"_blank"><font size=3D"1" style=3D"font-family:Tahoma,sans-=
serif,Arial,serif,EmojiFont"><span style=3D"font-size:13px">GitHub</span></=
font></a></div></div></div></div></div></div>
</font></span></div>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><d=
iv><div dir=3D"ltr"><font size=3D"1" color=3D"#777777" style=3D"font-family=
:Tahoma,sans-serif,Arial,serif,EmojiFont"><span style=3D"font-size:13px">Ya=
hia Farghaly=C2=A0</span></font><span style=3D"color:rgb(0,0,0);font-family=
:Calibri,Arial,Helvetica,sans-serif,serif,EmojiFont;font-size:16px"></span>=
<div><font color=3D"#777777" face=3D"Tahoma, sans-serif, Arial, serif, Emoj=
iFont"><span style=3D"font-size:13px">Graduated from Faculty of Engineering=
 - Electronics and Communications Department at Cairo University.</span></f=
ont><br></div><div style=3D"color:rgb(0,0,0);font-family:Calibri,Arial,Helv=
etica,sans-serif,serif,EmojiFont;font-size:16px"><div><a href=3D"https://li=
nkedin.com/in/yahiafarghaly" rel=3D"noopener noreferrer" target=3D"_blank">=
<font size=3D"1" style=3D"font-family:Tahoma,sans-serif,Arial,serif,EmojiFo=
nt"><span style=3D"font-size:13px">Linkedin</span></font></a><font size=3D"=
1" color=3D"#777777" style=3D"font-family:Tahoma,sans-serif,Arial,serif,Emo=
jiFont"><span style=3D"font-size:13px">=C2=A0-=C2=A0</span></font><a href=
=3D"https://github.com/yahiafarghaly" rel=3D"noopener noreferrer" target=3D=
"_blank"><font size=3D"1" style=3D"font-family:Tahoma,sans-serif,Arial,seri=
f,EmojiFont"><span style=3D"font-size:13px">GitHub</span></font></a></div><=
/div></div></div></div></div>
</div>

--001a11c00be615b18c0558c3e072--
