Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RyUJw-0001eN-Tt
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Feb 2012 21:22:21 +0100
Received: by vcqp1 with SMTP id p1so561303vcq.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2012 12:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=DnfTDyCVlqd4zr6B+TD+Q5eCyv3qUQUBS1/WjBzEmu4=;
	b=w3Hz19AxD8nNPzs/4ZY9O3r3F0WMSfGqqG+/3V7lfIh0mChMqlo6tMiu0OPU1j7I1R
	5JlkGKREMeODhuJAtT4/7zJpFGfUI+Gxa3NvV1MOrhFGDsqSfKyHxH7YAZ8X7quazrU6
	NuxePMPCtxlk/b3tWg1yMISl842QvOtxGKt+w=
MIME-Version: 1.0
Received: by 10.52.66.225 with SMTP id i1mr3900315vdt.65.1329509646023; Fri,
	17 Feb 2012 12:14:06 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.3.84 with HTTP; Fri, 17 Feb 2012 12:14:05 -0800 (PST)
In-Reply-To: <1329509501.2591.118.camel@x121e.pbcl.net>
References: <cover.1329500798.git.otavio@ossystems.com.br>
	<a186127453b155d8f35a32fac48a56dad98aad7f.1329500798.git.otavio@ossystems.com.br>
	<1329501107.14363.205.camel@phil-desktop>
	<CAP9ODKqd=j7wye-W2ZGtS5eC+ALf_i9X7F0BWiN-VaY+SkRB2A@mail.gmail.com>
	<1329506739.2591.114.camel@x121e.pbcl.net>
	<CAP9ODKq5jiun+bcQZeR2d9Dx2gJM3v=eu2N2WiCuwTb7sb4A-A@mail.gmail.com>
	<1329508773.2591.116.camel@x121e.pbcl.net>
	<CAP9ODKq7u3Vg+YU8GDMQH3vBw_GPH-Wuq9C7fa=DnEuUo0mr1A@mail.gmail.com>
	<1329509501.2591.118.camel@x121e.pbcl.net>
Date: Fri, 17 Feb 2012 18:14:05 -0200
X-Google-Sender-Auth: mNWYmnEpBSD5SnnZRuihwbjdKC0
Message-ID: <CAP9ODKqgFVA5K6DQG-hZXww+fiFX+H4hGcqfWjn691ng3jgGVA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] rootfs_ipk.bbclass: fix unpacked postinst support if no package management
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
X-List-Received-Date: Fri, 17 Feb 2012 20:22:21 -0000
Content-Type: multipart/alternative; boundary=20cf307d02202d3b7c04b92e967c

--20cf307d02202d3b7c04b92e967c
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Feb 17, 2012 at 18:11, Phil Blundell <philb@gnu.org> wrote:

> We seem to be going in circles here but, to go back to what I said at
> the beginning, why can't you use the existing run-postinsts recipe
> rather than adding a new script?


My image didn't end with it installed. I did a very small image and I
expect that independently of what I choose, rootfs behave right.

I think we can check for 98configure and 98run-postinsts, instead of
opkg-cl, but something as I added is still useful as a safe route.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--20cf307d02202d3b7c04b92e967c
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Fri, Feb 17, 2012 at 18:11, Phil Blundell <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:philb@gnu.org">philb@gnu.org</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"im">We seem to be going in circles here but, to go back to wh=
at I said at</div>
the beginning, why can&#39;t you use the existing run-postinsts recipe<br>
rather than adding a new script?</blockquote><div><br></div><div>My image d=
idn&#39;t end with it installed. I did a very small image and I expect that=
 independently of what I choose, rootfs behave right.</div><div><br></div>
<div>I think we can check for 98configure and 98run-postinsts, instead of o=
pkg-cl, but something as I added is still useful as a safe route.</div><div=
>=A0</div></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>
E-mail: <a href=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio=
@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystems.com.br" target=3D"=
_blank">http://www.ossystems.com.br</a><br>Mobile: +55 53 9981-7854=A0 =A0 =
=A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://projetos.ossystems.com.br" target=
=3D"_blank">http://projetos.ossystems.com.br</a><br>
<br>

--20cf307d02202d3b7c04b92e967c--
