Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TgHV3-0008Uk-9W
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 17:07:09 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa10so3232398pad.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Dec 2012 07:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=JPuDiEYNxI8A8GjBuLriiRYfWSrTt9HIhcGFGzN4vDQ=;
	b=ArJN5a4u+U1246VdUSC+vbn+x1Qg9t3UoBjlzkonfa7n2n+KZSw1qb/zvaFErOeHao
	b1M7YQH6SNoQA5L0J44NQo8zmjSZpRfM2WkeYeDe/I5Tvx6Ok1nxMjx2SRRWfnJCMnlY
	es5w2kPB2aY1SrzyWsZTcHBcXnWQNgqNGQ89MvX5taO/vwydk0g/lAOi29bZ9j7v/T17
	IUojhYoWTofmMMfIbVrvvIM4VcXXHPZOccFAmyiMkT52hCh69AwKZm8FhIRG2e3/BakN
	hEv0uWDpK584uDiYJ+0lpfauEX0YeRPDaFyqmqSUWTYmOe0kYIhrCZ/to+tWP02b4tn0
	2oQw==
MIME-Version: 1.0
Received: by 10.68.204.103 with SMTP id kx7mr50489201pbc.33.1354722760535;
	Wed, 05 Dec 2012 07:52:40 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Wed, 5 Dec 2012 07:52:40 -0800 (PST)
In-Reply-To: <CAJTo0LatQogGTmc41DMtyJi3mjtNRqWgX65Xw4AfwNra+37bGw@mail.gmail.com>
References: <1354654683-16793-1-git-send-email-ross.burton@intel.com>
	<CAP9ODKr0TG3LRah3rCjwwUCkka=kHW3Ed4LXNpWA+81Eb2t=GA@mail.gmail.com>
	<CAJTo0LatQogGTmc41DMtyJi3mjtNRqWgX65Xw4AfwNra+37bGw@mail.gmail.com>
Date: Wed, 5 Dec 2012 13:52:40 -0200
X-Google-Sender-Auth: g6bWO0bHU42Dd9TNsNJuDwHXJXw
Message-ID: <CAP9ODKq74Q9pcM_T_-q62H3vWJH_Pk3BSGRbx0=7mf8h9UDGAQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gst-meta-base: pull in X11 plugins when using X11
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
X-List-Received-Date: Wed, 05 Dec 2012 16:07:09 -0000
Content-Type: multipart/alternative; boundary=047d7b10d185e92f8904d01cf8e2

--047d7b10d185e92f8904d01cf8e2
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Dec 5, 2012 at 1:16 PM, Burton, Ross <ross.burton@intel.com> wrote:

> On 4 December 2012 21:38, Otavio Salvador <otavio@ossystems.com.br> wrote:
> > Would be better to use a RRECOMMENDS on xvimagesink? It makes more sense.
>
> None of the other dependencies are recommends, so are you suggesting
> they all become recommends or just that xvimagesink in particular?
>

Just xvimagesink as this is an improvement, not a requirement.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--047d7b10d185e92f8904d01cf8e2
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Wed, D=
ec 5, 2012 at 1:16 PM, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mailto=
:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</sp=
an> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On 4 December 2012 21:38, =
Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.com.br">otavio@ossys=
tems.com.br</a>&gt; wrote:<br>

&gt; Would be better to use a RRECOMMENDS on xvimagesink? It makes more sen=
se.<br>
<br>
</div>None of the other dependencies are recommends, so are you suggesting<=
br>
they all become recommends or just that xvimagesink in particular?<br></blo=
ckquote><div><br></div><div>Just xvimagesink as this is an improvement, not=
 a requirement.=A0</div></div><div><br></div>-- <br>Otavio Salvador=A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>
E-mail: <a href=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio=
@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystems.com.br" target=3D"=
_blank">http://www.ossystems.com.br</a><br>Mobile: +55 53 9981-7854=A0 =A0 =
=A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://projetos.ossystems.com.br" target=
=3D"_blank">http://projetos.ossystems.com.br</a><br>
<br>
</div>

--047d7b10d185e92f8904d01cf8e2--
