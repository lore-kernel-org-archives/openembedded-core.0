Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RbBjE-0003N8-7Q
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Dec 2011 14:52:08 +0100
Received: by eaal1 with SMTP id l1so1891844eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2011 05:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=snan6VK+GHha3+6nhI3DTG12pCzDhPmVWcroIiruQnI=;
	b=on7ZY5kl6Cz9z4q24KSa1M5oleUNpFVbmYN9kTqll6MDFGXBB308KfeZPNla0vMGsS
	AbZQk0Bej2TjpZC1RMVHqEGYd16eLnoP7pw1DHpIvbFbCGg3AwwneRBDJ0x7krAynFSl
	dg+G550eiGY6+u72Q7Y5ZJ3HzlJ+bQnQR2Zro=
MIME-Version: 1.0
Received: by 10.205.131.13 with SMTP id ho13mr1025870bkc.41.1323956710445;
	Thu, 15 Dec 2011 05:45:10 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.162.76 with HTTP; Thu, 15 Dec 2011 05:45:10 -0800 (PST)
In-Reply-To: <CAP9ODKp-444E+GJO+sqTqu2tvZv-VpwAd+jQ2MyzD7_r3yEufQ@mail.gmail.com>
References: <1323954515-15604-1-git-send-email-otavio@ossystems.com.br>
	<1323954698.24417.211.camel@phil-desktop>
	<CAP9ODKp-444E+GJO+sqTqu2tvZv-VpwAd+jQ2MyzD7_r3yEufQ@mail.gmail.com>
Date: Thu, 15 Dec 2011 11:45:10 -0200
X-Google-Sender-Auth: h4m7-YGlSFgHOViSAW4miBXahEA
Message-ID: <CAP9ODKoN0rdOC6E4QA0=280JEOtMf41OUoT0LBS_VKtX4OzpLA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dropbear: bump epoch to fix upgrade path in meta-oe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Dec 2011 13:52:08 -0000
Content-Type: multipart/alternative; boundary=000e0cdfd6466c928504b421b1c3

--000e0cdfd6466c928504b421b1c3
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Dec 15, 2011 at 11:14, Otavio Salvador <otavio@ossystems.com.br>wrote:

> On Thu, Dec 15, 2011 at 11:11, Phil Blundell <philb@gnu.org> wrote:
>>
>> If it's just a single output binary at issue then setting PKGE for that
>> one package would be less disruptive.  I must admit I don't fully
>> understand why this needs to be in oe-core at all though: what exactly
>> is the "messing up" that would happen otherwise?
>>
>
> I didn't know about PKGE; this works for this case :-D
>

It seems setting:

PKGE_${PN}-systemd = "1" in the bbappend doesn't work.

Any clue?

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--000e0cdfd6466c928504b421b1c3
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Thu, Dec 15, 2011 at 11:14, Otavio Salvador <=
span dir=3D"ltr">&lt;<a href=3D"mailto:otavio@ossystems.com.br">otavio@ossy=
stems.com.br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"gmail_quote"><div class=3D"im">On Thu, Dec 15, 2011 at 11:11,=
 Phil Blundell <span dir=3D"ltr">&lt;<a href=3D"mailto:philb@gnu.org" targe=
t=3D"_blank">philb@gnu.org</a>&gt;</span> wrote:<blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">
If it&#39;s just a single output binary at issue then setting PKGE for that=
<br>
one package would be less disruptive. =A0I must admit I don&#39;t fully<br>
understand why this needs to be in oe-core at all though: what exactly<br>
is the &quot;messing up&quot; that would happen otherwise?<br></blockquote>=
<div><br></div></div><div>I didn&#39;t know about PKGE; this works for this=
 case :-D</div></div></blockquote><div><br></div><div>It seems setting:</di=
v>
<div><br></div><div>PKGE_${PN}-systemd =3D &quot;1&quot; in the bbappend do=
esn&#39;t work.</div><div><br></div><div>Any clue?</div><div>=A0</div></div=
>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio@ossystems.com.br" t=
arget=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=3D"http://www.ossys=
tems.com.br" target=3D"_blank">http://www.ossystems.com.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--000e0cdfd6466c928504b421b1c3--
