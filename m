Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RSuBq-0008SR-Gz
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Nov 2011 18:31:26 +0100
Received: by faat2 with SMTP id t2so688142faa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2011 09:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=FOUzoOmpjnOdyHXFr+8BrVHWM5C990pA8VJ4wiXxPis=;
	b=jx7kE85cJeMZbQHSiEsmxV2/SCN2jy0YZV4zpkdDNH9sZGP2D3wHYBCxwkTtN2kusZ
	T7r3/vTJHcGf06daY+tBFkxaBcnOsaYQkXpkOTWgRVbAH2VsvUIZF5s1wHxa3I7Qvm9b
	ktQVb1x4CN0KiTokTd5koowIeKYuPetAa6XPc=
MIME-Version: 1.0
Received: by 10.205.128.19 with SMTP id hc19mr20407008bkc.9.1321982695516;
	Tue, 22 Nov 2011 09:24:55 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.26.143 with HTTP; Tue, 22 Nov 2011 09:24:55 -0800 (PST)
In-Reply-To: <1321982105.29435.302.camel@phil-desktop>
References: <cover.1321969615.git.otavio@ossystems.com.br>
	<65caf0c80f03e4fd3710b708541b0a7dd8f310ba.1321969615.git.otavio@ossystems.com.br>
	<1321982105.29435.302.camel@phil-desktop>
Date: Tue, 22 Nov 2011 15:24:55 -0200
X-Google-Sender-Auth: XoYxhAcfKqIKimcLLFuY97B-awY
Message-ID: <CAP9ODKrBxULKL=3ZHhGiOU4g7+uM=ke+43sDU=h67CvU_q7bAA@mail.gmail.com>
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
X-List-Received-Date: Tue, 22 Nov 2011 17:31:26 -0000
Content-Type: multipart/alternative; boundary=000e0ce03bb8f72a8d04b256148a

--000e0ce03bb8f72a8d04b256148a
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Nov 22, 2011 at 15:14, Phil Blundell <philb@gnu.org> wrote:

> On Tue, 2011-11-22 at 13:47 +0000, Otavio Salvador wrote:
> > Xorg VESA driver calls DGAInit enforcing this symbol to be available
> > to the driver to work.
>
> Maybe it would be better to patch vesa.c to not require this symbol
> rather than forcing it on in the server for everyone.  Or alternatively,
> if you genuinely want DGA, maybe make it a PACKAGECONFIG option.
>

What worries me is that this changed lately as it were working fine.

When xserver-xorg were update to 1.11 this has changed behind the scenes.
This used to be disabled on lite flavour only.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--000e0ce03bb8f72a8d04b256148a
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Tue, Nov 22, 2011 at 15:14, Phil Blundell <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:philb@gnu.org">philb@gnu.org</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex;">
<div class=3D"im">On Tue, 2011-11-22 at 13:47 +0000, Otavio Salvador wrote:=
<br>
&gt; Xorg VESA driver calls DGAInit enforcing this symbol to be available<b=
r>
&gt; to the driver to work.<br>
<br>
</div>Maybe it would be better to patch vesa.c to not require this symbol<b=
r>
rather than forcing it on in the server for everyone. =A0Or alternatively,<=
br>
if you genuinely want DGA, maybe make it a PACKAGECONFIG option.<br></block=
quote><div><br></div><div>What worries me is that this changed lately as it=
 were working fine.</div><div><br></div><div>When xserver-xorg were update =
to 1.11 this has changed behind the scenes. This used to be disabled on lit=
e flavour only.</div>
<div>=A0</div></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio=
@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=
=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossystems.com=
.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--000e0ce03bb8f72a8d04b256148a--
