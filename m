Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com
	[209.85.218.46])
	by mail.openembedded.org (Postfix) with ESMTP id 8A7787732C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 18:46:27 +0000 (UTC)
Received: by mail-oi0-f46.google.com with SMTP id v84so153861671oie.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 10:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=gko9WxsknoiBx1ER2pZLWiIZEINDO+/APSVl9gYrzGw=;
	b=NrR54I6CC4X1UIr7JLJaObE18nKbpDexYJ2o/270ZSf2mycE3EFSx87b+J1SyACftB
	u7j3STiEEKJo7a/CNy519da+YEWt28dYIOq/DaMaw+yIX20X3Pp/rm/g8SCJl2HhMci+
	7FnRDOb0W/DljPY+GYVO6qAIHYw8fUWIwjGRSgeeSzY3TrgdTmYIWXDphFAWyJxYyT1P
	hI8GgkpH8mR31zquVhhlbAzweY/twJjQis48qGKITSYFdItfCow+1sJ1OO3L2VKiYlae
	mA7azuCC/S1fGEAN2qd6+GfiqKETIUN1GtXBIntt2NWBv0Dmfa2hCSqQuMvtP+PsAwSU
	1AwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=gko9WxsknoiBx1ER2pZLWiIZEINDO+/APSVl9gYrzGw=;
	b=jeDIlPhG9ez3ubYCuUHUoozHVwBO0kf66EM8eHLD/oj0Lb8+uLBuc8YVjra2UkSyfy
	xaZ3k/PvxYb1wQo9d3M6Yv53cvKag5+DAEAZiWaCeJSbWXQxcWJd2HVn5aAS+yxuM+TT
	UgF+cJL10stM5G+W9dZrB7EAaXoQERth+uNj0K/Ti3ANadBPg2Gb8Gf9ivGVxlxD+Ufx
	bsg1qMeCg6FDrIS6GVt3R6xBcpL38753rQKRkcYYGcj3Z+rZ7Rn5Jh0qOMI8zNemlb6u
	BwB6A9GAR0KKUWtB7BhxlLz2jiuWJIGw4s86zrnFG9Zz5eb39Q9ioyF+PUL+QLb83a8i
	o/Nw==
X-Gm-Message-State: AKaTC01ZjpBfOf28eEHtt1Sc+ohMTMH/TB5is7L3hcr7e6nbnyaC3HpKF/WiITOglAPRpAysqevJLZ5XXkVPug==
X-Received: by 10.157.17.174 with SMTP id v43mr9072996otf.251.1482173188748;
	Mon, 19 Dec 2016 10:46:28 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.19.10 with HTTP; Mon, 19 Dec 2016 10:46:08 -0800 (PST)
In-Reply-To: <alpine.LFD.2.20.1612191246350.4848@localhost.localdomain>
References: <alpine.LFD.2.20.1612190527590.8267@localhost.localdomain>
	<CABcZANnv7=zxZ7MNT4kDPKxScTYkJa44qAxt5Lvfc-L4=-Kb0A@mail.gmail.com>
	<CABcZAN=X+O23y=utG3iBvsdPNo1g9qM7H2JAT1PUpt-R=AYCBg@mail.gmail.com>
	<alpine.LFD.2.20.1612191246350.4848@localhost.localdomain>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 19 Dec 2016 11:46:08 -0700
X-Google-Sender-Auth: rRgi3_39qhRZxATwRMqfQc7IjCU
Message-ID: <CABcZANnkk64RWAw4vHVc92QXQmuaBXD9yK0x95u2fw=SOh7jUQ@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: a few questions about "COMPATIBLE_MACHINE" variable
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
X-List-Received-Date: Mon, 19 Dec 2016 18:46:27 -0000
Content-Type: multipart/alternative; boundary=94eb2c18fcd4693bba0544075694

--94eb2c18fcd4693bba0544075694
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 19, 2016 at 10:56 AM, Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

> i suspected as much. still, would consistency dictate using
> parentheses or not? just a style thing.
>

I think it=E2=80=99s largely personal preference. Personally, using a captu=
re when
we don=E2=80=99t need one is ugly to me, so I=E2=80=99d rather see it only =
used when
needed, but that=E2=80=99s just my opinion. The upside to always using a ca=
pture is
it makes it clearer, at a glance, to a new user that it=E2=80=99s not just =
a word
or list of words, but a regular expression.


> >       next, if the possibilities in a list are REs, what is the
> >       point of explicitly listing, say, "qemuarm|qemuarm64"? would
> >       not the RE "qemuarm" subsume the more explicit "qemuarm64"?
> >       same for the other architectures. (one could suggest that that
> >       entire line could be shortened to "... =3D (^qemu)".)
> >
> > Just qemu would potentially match future qemu machines which aren=E2=80=
=99t
> > actually supported, so I don=E2=80=99t think that would be appropriate.=
 It=E2=80=99d
> > match too much.
>
>   i realized that, i was just being technical. :-) in any event, as it
> is, it would *still* match too much, anything starting with
> "qemuarm", for example.
>

Good point, yes.

>         the above seems pretty clear since the following lines would
> appear
> >       to say that *only* the qemux86 is compatible:
> >
> >         linux-yocto-tiny_4.1.bb:COMPATIBLE_MACHINE =3D "(qemux86$)"
> >         linux-yocto-tiny_4.4.bb:COMPATIBLE_MACHINE =3D "(qemux86$)"
> >         linux-yocto-tiny_4.8.bb:COMPATIBLE_MACHINE =3D "(qemux86$)"
> >
> >       which suggests the following passage from the YP kernel dev manua=
l
> is
> >       a bit misleading:
> >
> >         "You must change it to match a list of the machines that your n=
ew
> >         recipe supports. For example, to support the qemux86 and
> qemux86-64
> >         machines, use the following form:
> >
> >              COMPATIBLE_MACHINE =3D "qemux86|qemux86-64"
> >
> >       and if all this is true, then if you're introducing a new machine=
,
> to
> >       be magnificently pedantic, one should not use:
> >
> >         COMPATIBLE_MACHINE_machinename =3D "machinename"
> >
> >       but
> >
> >         COMPATIBLE_MACHINE_machinename =3D "^machinename$"
> >
> >       just to play it safe. am i reading all this correctly?
> >
> >
> > Yes, that=E2=80=99s correct, though we need the trailing $ but not the
> > leading ^, as it=E2=80=99s using re.match, not re.search =E2=80=94 mean=
ing it only
> > matches at the beginning of the string, it doesn=E2=80=99t search the s=
tring
> > to find a match.
>
>   ah, quite right, i had forgotten that. again, in any event, both the
> code and documentation could probably be tweaked to make all of this
> more obvious.
>

Absolutely agreed. For this regex specifically, an argument could be made
that a lack of a trailing $ is almost certainly a bug. I could argue that
it should either be implicit, though that would be limiting, or failing to
include it could trigger a warning unless you explicitly state you know
what you=E2=80=99re doing :) Hmm..
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--94eb2c18fcd4693bba0544075694
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Dec 19, 2016 at 10:56 AM, Robert P. J. Day <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse=
.ca</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":34m=
" class=3D"a3s aXjCH m159183ba2b4bc17d">i suspected as much. still, would c=
onsistency dictate using<br>
parentheses or not? just a style thing.<br></div></blockquote><div><br></di=
v><div>I think it=E2=80=99s largely personal preference. Personally, using =
a capture when we don=E2=80=99t need one is ugly to me, so I=E2=80=99d rath=
er see it only used when needed, but that=E2=80=99s just my opinion. The up=
side to always using a capture is it makes it clearer, at a glance, to a ne=
w user that it=E2=80=99s not just a word or list of words, but a regular ex=
pression.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":=
34m" class=3D"a3s aXjCH m159183ba2b4bc17d"><span class=3D"">
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 next, if the possibilities in a list are REs=
, what is the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0point of explicitly listing, say, &quot;qemu=
arm|qemuarm64&quot;? would<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0not the RE &quot;qemuarm&quot; subsume the m=
ore explicit &quot;qemuarm64&quot;?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0same for the other architectures. (one could=
 suggest that that<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0entire line could be shortened to &quot;... =
=3D (^qemu)&quot;.)<br>
&gt;<br>
&gt; Just qemu would potentially match future qemu machines which aren=E2=
=80=99t<br>
&gt; actually supported, so I don=E2=80=99t think that would be appropriate=
. It=E2=80=99d<br>
&gt; match too much.<br>
<br>
</span>=C2=A0 i realized that, i was just being technical. :-) in any event=
, as it<br>
is, it would *still* match too much, anything starting with<br>
&quot;qemuarm&quot;, for example.<br></div></blockquote><div><br></div><div=
>Good point, yes.=C2=A0</div><div><br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
<div id=3D":34m" class=3D"a3s aXjCH m159183ba2b4bc17d"><span class=3D"">
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 the above seems pretty clear since th=
e following lines would appear<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0to say that *only* the qemux86 is compatible=
:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 linux-yocto-tiny_4.1.bb:COMPAT<wbr>IB=
LE_MACHINE =3D &quot;(qemux86$)&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 linux-yocto-tiny_4.4.bb:COMPAT<wbr>IB=
LE_MACHINE =3D &quot;(qemux86$)&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 linux-yocto-tiny_4.8.bb:COMPAT<wbr>IB=
LE_MACHINE =3D &quot;(qemux86$)&quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0which suggests the following passage from th=
e YP kernel dev manual is<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0a bit misleading:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 &quot;You must change it to match a l=
ist of the machines that your new<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 recipe supports. For example, to supp=
ort the qemux86 and qemux86-64<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 machines, use the following form:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0COMPATIBLE_MACHIN=
E =3D &quot;qemux86|qemux86-64&quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0and if all this is true, then if you&#39;re =
introducing a new machine, to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0be magnificently pedantic, one should not us=
e:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 COMPATIBLE_MACHINE_machinename =3D &q=
uot;machinename&quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0but<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 COMPATIBLE_MACHINE_machinename =3D &q=
uot;^machinename$&quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0just to play it safe. am i reading all this =
correctly?<br>
&gt;<br>
&gt;<br>
&gt; Yes, that=E2=80=99s correct, though we need the trailing $ but not the=
<br>
&gt; leading ^, as it=E2=80=99s using re.match, not re.search =E2=80=94 mea=
ning it only<br>
&gt; matches at the beginning of the string, it doesn=E2=80=99t search the =
string<br>
&gt; to find a match.<br>
<br>
</span>=C2=A0 ah, quite right, i had forgotten that. again, in any event, b=
oth the<br>
code and documentation could probably be tweaked to make all of this<br>
more obvious.</div></blockquote></div><br>Absolutely agreed. For this regex=
 specifically, an argument could be made that a lack of a trailing $ is alm=
ost certainly a bug. I could argue that it should either be implicit, thoug=
h that would be limiting, or failing to include it could trigger a warning =
unless you explicitly state you know what you=E2=80=99re doing :) Hmm..<br>=
-- <br><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">Ch=
ristopher Larson<br>clarson at kergoth dot com<br>Founder - BitBake, OpenEm=
bedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, Mento=
r Graphics</div>
</div></div>

--94eb2c18fcd4693bba0544075694--
