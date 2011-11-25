Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RTtkF-0002NZ-ES
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Nov 2011 12:15:03 +0100
Received: by bkbzs2 with SMTP id zs2so3974149bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2011 03:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=D3lahZs74gZpW62XlFx1K9hBfXX5mSRgKSfKSCW951s=;
	b=L2mWG+N+4g/WRUR/YX7gKj770wMoB9OACpedEQIXAfIjT74D1hp0tEMSZzJl4+Lbot
	1LWy8NZbN5RTfVN1Ubn8o13bIIY+yYW4piqydsCL2yhREGOjG6N28953FXR6+GKw0v09
	ZORknPT/hRFBtx4qeI6j7/0q7LXVoaSRWgC6E=
MIME-Version: 1.0
Received: by 10.205.126.13 with SMTP id gu13mr33404991bkc.114.1322219307322;
	Fri, 25 Nov 2011 03:08:27 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.113.148 with HTTP; Fri, 25 Nov 2011 03:08:27 -0800 (PST)
In-Reply-To: <1322219018.26081.70.camel@phil-desktop>
References: <cover.1321969615.git.otavio@ossystems.com.br>
	<65caf0c80f03e4fd3710b708541b0a7dd8f310ba.1321969615.git.otavio@ossystems.com.br>
	<1321982105.29435.302.camel@phil-desktop>
	<CAP9ODKrBxULKL=3ZHhGiOU4g7+uM=ke+43sDU=h67CvU_q7bAA@mail.gmail.com>
	<1322179246.10928.38.camel@ted>
	<1322219018.26081.70.camel@phil-desktop>
Date: Fri, 25 Nov 2011 09:08:27 -0200
X-Google-Sender-Auth: KD0kOjW-dpbSEp1jya6oelWZfnA
Message-ID: <CAP9ODKo-iMzKRuTj1YT_9wPUqT3MP2hyegzu5W+jQEekThFskA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] xserver-xorg: do not disable-dga as VESA driver requires it
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
X-List-Received-Date: Fri, 25 Nov 2011 11:15:03 -0000
Content-Type: multipart/alternative; boundary=00151747b74420ccd404b28d2c8f

--00151747b74420ccd404b28d2c8f
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Nov 25, 2011 at 09:03, Phil Blundell <philb@gnu.org> wrote:

> On Fri, 2011-11-25 at 00:00 +0000, Richard Purdie wrote:
> > Looking at vesa.c, there is quite a chunk of code in there depending on
> > DGA.
>
> I guess the question is, is this chunk of code actually doing anything
> useful/important, or is it just there to support DGA on VESA?  If the
> latter then people who don't need/want DGA (which is probably everybody,
> nowadays) can just take it out.
>
> All that said, I would have thought that the VESA driver itself was
> pretty much a fringe interest in this day and age.  Is anybody really
> using that on a shipping system?  If it's just for qemux86 test harness
> purposes then maybe we could turn on the vesafb driver in the kernel and
> use the straight framebuffer driver in Xorg rather than the VESA one.


I do. I use it a lot and that's why I found it was broken.

For me, having it on xserver-xorg and it disabled for xserver-xorg-lite
works for me for now.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--00151747b74420ccd404b28d2c8f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Fri, Nov 25, 2011 at 09:03, Phil Blundell <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:philb@gnu.org">philb@gnu.org</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex;">
<div class=3D"im">On Fri, 2011-11-25 at 00:00 +0000, Richard Purdie wrote:<=
br>
&gt; Looking at vesa.c, there is quite a chunk of code in there depending o=
n<br>
&gt; DGA.<br>
<br>
</div>I guess the question is, is this chunk of code actually doing anythin=
g<br>
useful/important, or is it just there to support DGA on VESA? =A0If the<br>
latter then people who don&#39;t need/want DGA (which is probably everybody=
,<br>
nowadays) can just take it out.<br>
<br>
All that said, I would have thought that the VESA driver itself was<br>
pretty much a fringe interest in this day and age. =A0Is anybody really<br>
using that on a shipping system? =A0If it&#39;s just for qemux86 test harne=
ss<br>
purposes then maybe we could turn on the vesafb driver in the kernel and<br=
>
use the straight framebuffer driver in Xorg rather than the VESA one.</bloc=
kquote><div><br></div><div>I do. I use it a lot and that&#39;s why I found =
it was broken.</div><div><br></div><div>For me, having it on xserver-xorg a=
nd it disabled for xserver-xorg-lite works for me for now.</div>
</div><div><br></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio=
@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=
=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossystems.com=
.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--00151747b74420ccd404b28d2c8f--
