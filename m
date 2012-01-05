Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Riqst-0007P7-Mm
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 18:13:47 +0100
Received: by bkbzt4 with SMTP id zt4so121818bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jan 2012 09:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=lm4DPIPHa+OgeMbgU+0v8hV+ieRObbnLBRTDp5wHo0g=;
	b=H9Pr5Rc1ZQ2Gb63bHf2Za/pX4fs/CRutdalo+H9MmdM0QvJfbUw8+hLts+318i37N8
	mhNU+EZCsKj2j8hAdQqpR8bTKuiJFo2IuDuV0Uf8rQ4CIJxA3dDfic6aTnEmUS+35yjD
	j0kc4lzWZ69mmlxZRxoMSvpFqF4Y4OzCl+K1w=
MIME-Version: 1.0
Received: by 10.204.151.195 with SMTP id d3mr1087305bkw.73.1325783184687; Thu,
	05 Jan 2012 09:06:24 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.78.79 with HTTP; Thu, 5 Jan 2012 09:06:23 -0800 (PST)
In-Reply-To: <1325697252.20759.39.camel@ted>
References: <cover.1325101673.git.otavio@ossystems.com.br>
	<434061cd08c919cbabd78bf875d5f3e24233ef84.1325101674.git.otavio@ossystems.com.br>
	<1325697252.20759.39.camel@ted>
Date: Thu, 5 Jan 2012 15:06:23 -0200
X-Google-Sender-Auth: i5Xy6SL3n85T6wAOI7qPfprieOA
Message-ID: <CAP9ODKrRum6EK1iv_=eJSgoz9sd9AahpfJ=OB1b3Ubkxj6i4NA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 12/16] udev: improve udev-cache robustness
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
X-List-Received-Date: Thu, 05 Jan 2012 17:13:47 -0000
Content-Type: multipart/alternative; boundary=0015175cae4ec5c2e504b5caf32f

--0015175cae4ec5c2e504b5caf32f
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jan 4, 2012 at 15:14, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> You're adding a ton of exec calls into the boot process here :(
>
> Please can we find some better way to do this without all the exec()
> calls?
>

I really don't want to waste too much time on this as I don't use it; I did
a brief look and it might be put onto a sub directory and use diff to
compare avoiding the use of multiple cmp calls but I can't test it myself
as I am working at newer udev updating.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--0015175cae4ec5c2e504b5caf32f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Wed, Jan 4, 2012 at 15:14, Richard Purdie <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">ri=
chard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
<div class=3D"HOEnZb"><div class=3D"h5">You&#39;re adding a ton of exec cal=
ls into the boot process here :(</div></div>
<br>
Please can we find some better way to do this without all the exec()<br>
calls?<br></blockquote><div><br></div><div>I really don&#39;t want to waste=
 too much time on this as I don&#39;t use it; I did a brief look and it mig=
ht be put onto a sub directory and use diff to compare avoiding the use of =
multiple cmp calls but I can&#39;t test it myself as I am working at newer =
udev updating.</div>
<div>=A0</div></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio=
@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=
=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossystems.com=
.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--0015175cae4ec5c2e504b5caf32f--
