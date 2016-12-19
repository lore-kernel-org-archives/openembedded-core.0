Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com
	[209.85.218.46])
	by mail.openembedded.org (Postfix) with ESMTP id ADB457731D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 15:28:55 +0000 (UTC)
Received: by mail-oi0-f46.google.com with SMTP id w63so148290526oiw.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 07:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=xMlvb6aimhOUHayuucySdRMdZ0nygOu0yf0nWaRvBEQ=;
	b=XQwGoSwPvNrG1uCLfla/Z4fokkPxnk588NYvLINvnvosi+L4MUMaHT6a4HimKBxEyP
	E0QMZ7g4HmShgx+YMe2aasHJ4vxXoWnyns41G76TfxE3TFmaAgNML/VT+RaIqcC9npeV
	1gntttPoVkX8khubwbI6AwiuWAZPbHcZuE9OIbUi1YM1thvvKBkaZBgy5HVVGz1NtXbc
	Uci4e9FwcC5C860BA0VHxHM0VBqgxFYC+DuBf0VOTstkI25HwvFb4Wbbv2DQWBGzeWh7
	cgzbhu+4Ctrpxp/pvKFy55F+JWxJf+MxKd8S55Jv559YA4y4Pnl8T7cdl6YaROgG4aHh
	97ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=xMlvb6aimhOUHayuucySdRMdZ0nygOu0yf0nWaRvBEQ=;
	b=uY0AWxuQfguJcUvPfAYFeCak0uurVAWAY51f8yuqPXKd6fismfnIq7hjDPofIGZ9Yo
	y7h/00XCsWwg+2DAleXx1MRrnZaaqeBbJ4IxWcibnwndIX4DBymRyFqpoC6XOnWjp/8g
	nNue7UFJrhbr1NwkI76ad2H+hQMDzL2ksDNQkcDiJVdvnZCgPpWn7YxIO+eW0m0X3Cr2
	baaf1POICSQIxkxyu7KJWcLZyGwQbkyVeOySXkvIZKBjkNl2TVyJbfrehQGkeABGeOtr
	FRNfj1qMo8y0WHbDJWgVyOZobndB3sY5NiN2+hKVNjqENckYHT1n/k0Yj85RV7S/bkdR
	i46A==
X-Gm-Message-State: AIkVDXJhApu/r64DofaH0XugnkReTLqlwkbmPChIq1Z9qVBCH8AuZMvjXKBmgYivyTBDVKNOg2ri8+vCOQPiHQ==
X-Received: by 10.202.79.7 with SMTP id d7mr8482293oib.199.1482161336417; Mon,
	19 Dec 2016 07:28:56 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.19.10 with HTTP; Mon, 19 Dec 2016 07:28:36 -0800 (PST)
In-Reply-To: <alpine.LFD.2.20.1612190527590.8267@localhost.localdomain>
References: <alpine.LFD.2.20.1612190527590.8267@localhost.localdomain>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 19 Dec 2016 08:28:36 -0700
X-Google-Sender-Auth: y0MyhgoYfSpzi-vWOQ1MrSD1ZkY
Message-ID: <CABcZANnv7=zxZ7MNT4kDPKxScTYkJa44qAxt5Lvfc-L4=-Kb0A@mail.gmail.com>
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
X-List-Received-Date: Mon, 19 Dec 2016 15:28:56 -0000
Content-Type: multipart/alternative; boundary=001a113d720ef5038c0544049373

--001a113d720ef5038c0544049373
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 19, 2016 at 8:17 AM, Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

>   as a starting point, COMPATIBLE_MACHINE is processed on a per-recipe
> basis, and if it has no value, then there is no machine restriction
> being applied to that recipe, correct? that's based on this snippet
> from base.bbclass:
>
>   need_machine =3D d.getVar('COMPATIBLE_MACHINE')
>   if need_machine:
>       import re
>       compat_machines =3D (d.getVar('MACHINEOVERRIDES') or "").split(":")
>       for m in compat_machines:
>           if re.match(need_machine, m):
>               break
>       else:
>           raise bb.parse.SkipPackage("incompatible with machine %s (not
> in COMPATIBLE_MACHINE)" % d.getVar('MACHINE'))
>
> so far, so good?
>
>   next, the documentation describes the value of that variable as a
> regular expression, so the values are processed as RE patterns, but
> some of the actual uses are confusing. from
> poky/meta/recipes-kernel/linux:
>
> $ grep -r COMPATIBLE_MACHINE *
> linux-dummy.bb:#COMPATIBLE_MACHINE =3D "your_machine"
> linux-yocto_4.1.bb:COMPATIBLE_MACHINE =3D "qemuarm|qemuarm64|qemux86|
> qemuppc|qemumips|qemumips64|qemux86-64"
> linux-yocto_4.4.bb:COMPATIBLE_MACHINE =3D "qemuarm|qemuarm64|qemux86|
> qemuppc|qemumips|qemumips64|qemux86-64"
> linux-yocto_4.8.bb:COMPATIBLE_MACHINE =3D "qemuarm|qemuarm64|qemux86|
> qemuppc|qemumips|qemumips64|qemux86-64"
> linux-yocto-dev.bb:COMPATIBLE_MACHINE =3D "(qemuarm|qemux86|qemuppc|
> qemumips|qemumips64|qemux86-64)"
> linux-yocto-rt_4.1.bb:COMPATIBLE_MACHINE =3D "(qemux86|qemux86-64|qemuarm=
|
> qemuppc|qemumips)"
> linux-yocto-rt_4.4.bb:COMPATIBLE_MACHINE =3D "(qemux86|qemux86-64|qemuarm=
|
> qemuppc|qemumips)"
> linux-yocto-rt_4.8.bb:COMPATIBLE_MACHINE =3D "(qemux86|qemux86-64|qemuarm=
|
> qemuppc|qemumips)"
> linux-yocto-tiny_4.1.bb:COMPATIBLE_MACHINE =3D "(qemux86$)"
> linux-yocto-tiny_4.4.bb:COMPATIBLE_MACHINE =3D "(qemux86$)"
> linux-yocto-tiny_4.8.bb:COMPATIBLE_MACHINE =3D "(qemux86$)"
> $
>
>   first, what is best practice -- to use parentheses or not? i'm
> assuming it makes no difference, but it does seem inconsistent and
> could cause some confusion.
>

They=E2=80=99re not needed in a case like this.

  next, if the possibilities in a list are REs, what is the point of
> explicitly listing, say, "qemuarm|qemuarm64"? would not the RE
> "qemuarm" subsume the more explicit "qemuarm64"? same for the other
> architectures. (one could suggest that that entire line could be
> shortened to "... =3D (^qemu)".)
>

Just qemu would potentially match future qemu machines which aren=E2=80=99t
actually supported, so I don=E2=80=99t think that would be appropriate. It=
=E2=80=99d match
too much.

  the above seems pretty clear since the following lines would appear
> to say that *only* the qemux86 is compatible:
>
>   linux-yocto-tiny_4.1.bb:COMPATIBLE_MACHINE =3D "(qemux86$)"
>   linux-yocto-tiny_4.4.bb:COMPATIBLE_MACHINE =3D "(qemux86$)"
>   linux-yocto-tiny_4.8.bb:COMPATIBLE_MACHINE =3D "(qemux86$)"
>
> which suggests the following passage from the YP kernel dev manual is
> a bit misleading:
>
>   "You must change it to match a list of the machines that your new
>   recipe supports. For example, to support the qemux86 and qemux86-64
>   machines, use the following form:
>
>        COMPATIBLE_MACHINE =3D "qemux86|qemux86-64"
>
> and if all this is true, then if you're introducing a new machine, to
> be magnificently pedantic, one should not use:
>
>   COMPATIBLE_MACHINE_machinename =3D "machinename"
>
> but
>
>   COMPATIBLE_MACHINE_machinename =3D "^machinename$"
>
> just to play it safe. am i reading all this correctly?
>

Yes, that=E2=80=99s correct, though we need the trailing $ but not the lead=
ing ^,
as it=E2=80=99s using re.match, not re.search =E2=80=94 meaning it only mat=
ches at the
beginning of the string, it doesn=E2=80=99t search the string to find a mat=
ch.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a113d720ef5038c0544049373
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Dec 19, 2016 at 8:17 AM, Robert P. J. Day <span dir=3D"ltr">&lt;<a =
href=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse.=
ca</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":29s"=
 class=3D"a3s aXjCH m15917a9fa05d4cb7">=C2=A0 as a starting point, COMPATIB=
LE_MACHINE is processed on a per-recipe<br>
basis, and if it has no value, then there is no machine restriction<br>
being applied to that recipe, correct? that&#39;s based on this snippet<br>
from base.bbclass:<br>
<br>
=C2=A0 need_machine =3D d.getVar(&#39;COMPATIBLE_MACHINE&#39;)<br>
=C2=A0 if need_machine:<br>
=C2=A0 =C2=A0 =C2=A0 import re<br>
=C2=A0 =C2=A0 =C2=A0 compat_machines =3D (d.getVar(&#39;MACHINEOVERRIDES&#3=
9;) or &quot;&quot;).split(&quot;:&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 for m in compat_machines:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if re.match(need_machine, m):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break<br>
=C2=A0 =C2=A0 =C2=A0 else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise bb.parse.SkipPackage(&quot;<wbr>in=
compatible with machine %s (not in COMPATIBLE_MACHINE)&quot; % d.getVar(&#3=
9;MACHINE&#39;))<br>
<br>
so far, so good?<br>
<br>
=C2=A0 next, the documentation describes the value of that variable as a<br=
>
regular expression, so the values are processed as RE patterns, but<br>
some of the actual uses are confusing. from<br>
poky/meta/recipes-kernel/<wbr>linux:<br>
<br>
$ grep -r COMPATIBLE_MACHINE *<br>
linux-dummy.bb:#COMPATIBLE_<wbr>MACHINE =3D &quot;your_machine&quot;<br>
linux-yocto_4.1.bb:COMPATIBLE_<wbr>MACHINE =3D &quot;qemuarm|qemuarm64|qemu=
x86|<wbr>qemuppc|qemumips|qemumips64|<wbr>qemux86-64&quot;<br>
linux-yocto_4.4.bb:COMPATIBLE_<wbr>MACHINE =3D &quot;qemuarm|qemuarm64|qemu=
x86|<wbr>qemuppc|qemumips|qemumips64|<wbr>qemux86-64&quot;<br>
linux-yocto_4.8.bb:COMPATIBLE_<wbr>MACHINE =3D &quot;qemuarm|qemuarm64|qemu=
x86|<wbr>qemuppc|qemumips|qemumips64|<wbr>qemux86-64&quot;<br>
linux-yocto-dev.bb:COMPATIBLE_<wbr>MACHINE =3D &quot;(qemuarm|qemux86|qemup=
pc|<wbr>qemumips|qemumips64|qemux86-<wbr>64)&quot;<br>
linux-yocto-rt_4.1.bb:COMPATIB<wbr>LE_MACHINE =3D &quot;(qemux86|qemux86-64=
|qemuarm|<wbr>qemuppc|qemumips)&quot;<br>
linux-yocto-rt_4.4.bb:COMPATIB<wbr>LE_MACHINE =3D &quot;(qemux86|qemux86-64=
|qemuarm|<wbr>qemuppc|qemumips)&quot;<br>
linux-yocto-rt_4.8.bb:COMPATIB<wbr>LE_MACHINE =3D &quot;(qemux86|qemux86-64=
|qemuarm|<wbr>qemuppc|qemumips)&quot;<br>
linux-yocto-tiny_4.1.bb:COMPAT<wbr>IBLE_MACHINE =3D &quot;(qemux86$)&quot;<=
br>
linux-yocto-tiny_4.4.bb:COMPAT<wbr>IBLE_MACHINE =3D &quot;(qemux86$)&quot;<=
br>
linux-yocto-tiny_4.8.bb:COMPAT<wbr>IBLE_MACHINE =3D &quot;(qemux86$)&quot;<=
br>
$<br>
<br>
=C2=A0 first, what is best practice -- to use parentheses or not? i&#39;m<b=
r>
assuming it makes no difference, but it does seem inconsistent and<br>
could cause some confusion.<br></div></blockquote><div><br></div><div>They=
=E2=80=99re not needed in a case like this.=C2=A0</div><div><br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex"><div id=3D":29s" class=3D"a3s aXjCH m15917a9fa05d=
4cb7">
=C2=A0 next, if the possibilities in a list are REs, what is the point of<b=
r>
explicitly listing, say, &quot;qemuarm|qemuarm64&quot;? would not the RE<br=
>
&quot;qemuarm&quot; subsume the more explicit &quot;qemuarm64&quot;? same f=
or the other<br>
architectures. (one could suggest that that entire line could be<br>
shortened to &quot;... =3D (^qemu)&quot;.)<br></div></blockquote><div><br><=
/div><div>Just qemu would potentially match future qemu machines which aren=
=E2=80=99t actually supported, so I don=E2=80=99t think that would be appro=
priate. It=E2=80=99d match too much.</div><div><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div id=3D":29s" class=3D"a3s aXjCH m15917a9fa05d4cb7">
=C2=A0 the above seems pretty clear since the following lines would appear<=
br>
to say that *only* the qemux86 is compatible:<br>
<br>
=C2=A0 linux-yocto-tiny_4.1.bb:COMPAT<wbr>IBLE_MACHINE =3D &quot;(qemux86$)=
&quot;<br>
=C2=A0 linux-yocto-tiny_4.4.bb:COMPAT<wbr>IBLE_MACHINE =3D &quot;(qemux86$)=
&quot;<br>
=C2=A0 linux-yocto-tiny_4.8.bb:COMPAT<wbr>IBLE_MACHINE =3D &quot;(qemux86$)=
&quot;<br>
<br>
which suggests the following passage from the YP kernel dev manual is<br>
a bit misleading:<br>
<br>
=C2=A0 &quot;You must change it to match a list of the machines that your n=
ew<br>
=C2=A0 recipe supports. For example, to support the qemux86 and qemux86-64<=
br>
=C2=A0 machines, use the following form:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0COMPATIBLE_MACHINE =3D &quot;qemux86|qemux86-64&=
quot;<br>
<br>
and if all this is true, then if you&#39;re introducing a new machine, to<b=
r>
be magnificently pedantic, one should not use:<br>
<br>
=C2=A0 COMPATIBLE_MACHINE_machinename =3D &quot;machinename&quot;<br>
<br>
but<br>
<br>
=C2=A0 COMPATIBLE_MACHINE_machinename =3D &quot;^machinename$&quot;<br>
<br>
just to play it safe. am i reading all this correctly?</div></blockquote></=
div><br>Yes, that=E2=80=99s correct, though we need the trailing $ but not =
the leading ^, as it=E2=80=99s using re.match, not re.search =E2=80=94 mean=
ing it only matches at the beginning of the string, it doesn=E2=80=99t sear=
ch the string to find a match.<br>-- <br><div class=3D"gmail_signature" dat=
a-smartmail=3D"gmail_signature">Christopher Larson<br>clarson at kergoth do=
t com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<=
br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--001a113d720ef5038c0544049373--
