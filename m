Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RdKbA-0006ZF-IT
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Dec 2011 12:44:40 +0100
Received: by eaal1 with SMTP id l1so6605740eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2011 03:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=hOOoaPt+GclYyDiZShM445vY5ofqnAsj8nVUnhzZ1hw=;
	b=h34TyNO3DV19mPhNMnbKdEGMc2sYiR9UyOU3rQ4n+jCa8YCxgIFAEIYK03U8qWia8w
	0zYdnoJmqG6Ep/yMLM4D03Ej4tGHBVknjgXSMC9xWFYUCt7MV4DFAa4qY5byFiRKLuYN
	zkg3Nac34T3KaLxS1+o4VoH93WwjypJu4ulhY=
MIME-Version: 1.0
Received: by 10.204.156.219 with SMTP id y27mr1415549bkw.71.1324467451695;
	Wed, 21 Dec 2011 03:37:31 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.78.79 with HTTP; Wed, 21 Dec 2011 03:37:31 -0800 (PST)
In-Reply-To: <1324465882.16323.13.camel@ted>
References: <1324465882.16323.13.camel@ted>
Date: Wed, 21 Dec 2011 09:37:31 -0200
X-Google-Sender-Auth: ndFyKt8DGeJdhZwzPzACSxSdp74
Message-ID: <CAP9ODKoktx1ByHFbizz7-Dcs3_cS3T5nrytFLcvU=O4imkN13A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RFC: nativesdk and native recipe names
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
X-List-Received-Date: Wed, 21 Dec 2011 11:44:40 -0000
Content-Type: multipart/alternative; boundary=0015175cfc86f993a304b4989be8

--0015175cfc86f993a304b4989be8
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Dec 21, 2011 at 09:11, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> If we change nativesdk to become a prefix, the problem can share the
> same code as multilib and become much more widely usable rather than the
> current special cases. Its obviously a fairly major change in recipe
> naming though. Would changing this be acceptable?
>

I second this as this makes it more consistent and predictable (with the
plus of avoiding naming hacks too).

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--0015175cfc86f993a304b4989be8
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Wed, Dec 21, 2011 at 09:11, Richard Purdie <s=
pan dir=3D"ltr">&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">r=
ichard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">
<div id=3D":2cq">If we change nativesdk to become a prefix, the problem can=
 share the<br>
same code as multilib and become much more widely usable rather than the<br=
>
current special cases. Its obviously a fairly major change in recipe<br>
naming though. Would changing this be acceptable?</div></blockquote></div><=
br>I second this as this makes it more consistent and predictable (with the=
 plus of avoiding naming hacks too).<br clear=3D"all"><div><br></div>-- <br=
>
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems<br>E-mail: <a href=3D"mailto:otavio@ossystems.com.br" target=3D=
"_blank">otavio@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystems.com=
.br" target=3D"_blank">http://www.ossystems.com.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--0015175cfc86f993a304b4989be8--
