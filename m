Received: from mail-la0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1Tvfur-0005RB-BY
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Jan 2013 04:13:57 +0100
Received: by mail-la0-f47.google.com with SMTP id fh20so2096478lab.20
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2013 18:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=19Bod+k2POVCK8gkzXultdUHTRtM8GkhuLVL083ug5A=;
	b=XDt32UDaNeBXD0CXEvSRG6AbbWEsXQ3g80cyVLTJApIrTSKf7jny4lkxFuAfudunlY
	q+N9+evRNiTHfy8qPq4kXw/A64IsN0Hslu1mTYKH8R4A1aiqdyPWTFrOPAFoyNXKbOgE
	6iz1C0SPmmLICIjaLKFT0qroje3dJI69C7TKiuJKrJIqZ9x9GcsVSnjKhrzWF8Kz5YI9
	diKn5JMKe5ipcCNPbf2YwKP/nW/BNsv0/o24DAzU4QJRTLFi/86gG7SABerUaejRqKXM
	hMr5o4wn1Axxcngoc3pbO+Xn9VX8iWrgix9PsCMHHe8TZw0+n1kVIZyThiPdGimNp1oz
	c1rQ==
MIME-Version: 1.0
X-Received: by 10.152.127.202 with SMTP id ni10mr3281091lab.6.1358391478845;
	Wed, 16 Jan 2013 18:57:58 -0800 (PST)
Received: by 10.112.127.35 with HTTP; Wed, 16 Jan 2013 18:57:58 -0800 (PST)
In-Reply-To: <CAP9ODKq7C0-Ntnehdo3qK7QsptD8B_8X0UCaMmjCR+jT8vxBAg@mail.gmail.com>
References: <CAP9ODKoRws=EzHxyNumYnj-F2S5h_66wkCfL42-yrJK7KGYBOQ@mail.gmail.com>
	<20121216185215.GE3448@jama>
	<CAP9ODKq7C0-Ntnehdo3qK7QsptD8B_8X0UCaMmjCR+jT8vxBAg@mail.gmail.com>
Date: Wed, 16 Jan 2013 21:57:58 -0500
Message-ID: <CADkTA4PHFrXbLL24Fwvz+WSux4X2aX-JQ035HZLM40Fr_bndag@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Build fail in kconfig-frontends
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
X-List-Received-Date: Thu, 17 Jan 2013 03:13:58 -0000
Content-Type: multipart/alternative; boundary=f46d042c6aeb9001a504d3732977

--f46d042c6aeb9001a504d3732977
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Dec 16, 2012 at 1:57 PM, Otavio Salvador <otavio@ossystems.com.br>wrote:

> On Sun, Dec 16, 2012 at 4:52 PM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> > On Sun, Dec 16, 2012 at 04:16:40PM -0200, Otavio Salvador wrote:
> >> Hello,
> >>
> >> Today I did a sync and kconfig-frontends fails to build. I submitted a
> >> bug report (https://bugzilla.yoctoproject.org/show_bug.cgi?id=3610).
> >>
> >> I am sending it here as well so people can confirm if it is
> >> reproducable in some other environment?
> >
> > It failed exactly the same here, but only once (on Friday) after
> cleansstate
> > it built OK.
>
> Confusing ... it works here as well after cleansstate.
>

kicking this old thread. I'm now hitting exactly this issue on my up to
date master.
Except for some reason I'm not able to work around it at all, and all my
builds
are failing. I'm avoiding purging sstate completely, but that seems to be
where
I'm heading.

Cheers,

Bruce


>
> --
> Otavio Salvador                             O.S. Systems
> E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
> Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--f46d042c6aeb9001a504d3732977
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Sun, Dec 16, 2012 at 1:57 PM, Otavio Salvador <span dir=3D"ltr">=
&lt;<a href=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio@oss=
ystems.com.br</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Sun, Dec 16, 2012 at 4:=
52 PM, Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com">martin.ja=
nsa@gmail.com</a>&gt; wrote:<br>

&gt; On Sun, Dec 16, 2012 at 04:16:40PM -0200, Otavio Salvador wrote:<br>
&gt;&gt; Hello,<br>
&gt;&gt;<br>
&gt;&gt; Today I did a sync and kconfig-frontends fails to build. I submitt=
ed a<br>
&gt;&gt; bug report (<a href=3D"https://bugzilla.yoctoproject.org/show_bug.=
cgi?id=3D3610" target=3D"_blank">https://bugzilla.yoctoproject.org/show_bug=
.cgi?id=3D3610</a>).<br>
&gt;&gt;<br>
&gt;&gt; I am sending it here as well so people can confirm if it is<br>
&gt;&gt; reproducable in some other environment?<br>
&gt;<br>
&gt; It failed exactly the same here, but only once (on Friday) after clean=
sstate<br>
&gt; it built OK.<br>
<br>
</div>Confusing ... it works here as well after cleansstate.<br></blockquot=
e><div><br></div><div style>kicking this old thread. I&#39;m now hitting ex=
actly this issue on my up to date master.</div><div style>Except for some r=
eason I&#39;m not able to work around it at all, and all my builds</div>
<div style>are failing. I&#39;m avoiding purging sstate completely, but tha=
t seems to be where</div><div style>I&#39;m heading.</div><div style><br></=
div><div style>Cheers,</div><div style><br></div><div style>Bruce</div>
<div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"HOEnZb"><div class=3D"h5"><br>
--<br>
Otavio Salvador =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 O.S=
. Systems<br>
E-mail: <a href=3D"mailto:otavio@ossystems.com.br">otavio@ossystems.com.br<=
/a> =A0<a href=3D"http://www.ossystems.com.br" target=3D"_blank">http://www=
.ossystems.com.br</a><br>
Mobile: <a href=3D"tel:%2B55%2053%209981-7854" value=3D"+555399817854">+55 =
53 9981-7854</a> =A0 =A0 =A0 =A0 =A0 =A0 =A0<a href=3D"http://projetos.ossy=
stems.com.br" target=3D"_blank">http://projetos.ossystems.com.br</a><br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
&quot;Thou shalt not follow the NULL pointer, for chaos and madness await t=
hee at its end&quot;
</div></div>

--f46d042c6aeb9001a504d3732977--
