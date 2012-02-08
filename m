Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RvCfD-0006OG-78
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Feb 2012 19:54:43 +0100
Received: by eekd41 with SMTP id d41so240771eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Feb 2012 10:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=r1N5QfFiKDvezvqcCL5NaIeg+APGRSe3nZPXhjSsCLY=;
	b=XDI14T4qSNeFBuu0H/cQ/UebscEmokGZYh6Imsy4lV5bin2BUGkh/v8Pvcy5Q9KxP3
	bOEAy05U+bSUB5AdbZUFlUjWyhNYhSCKjJj4Z4CexLfrVamWbHA9pW8PALCWs5d7pGi9
	m5sOvEv2M6DhQBsQFJDA0av9dMlkiS26Dw2Zk=
MIME-Version: 1.0
Received: by 10.14.53.74 with SMTP id f50mr9026698eec.5.1328726799703; Wed, 08
	Feb 2012 10:46:39 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.14.96.129 with HTTP; Wed, 8 Feb 2012 10:46:39 -0800 (PST)
In-Reply-To: <4F32C1A6.70402@gherzan.ro>
References: <1328717200-13689-1-git-send-email-andrei@gherzan.ro>
	<1328717410.14363.46.camel@phil-desktop>
	<CAP9ODKqUo7qazvdbWxQB_bQh3jpf+Uf=kf1YVp=Y-oB6QQYGGQ@mail.gmail.com>
	<1328720440.14363.56.camel@phil-desktop>
	<4F32C1A6.70402@gherzan.ro>
Date: Wed, 8 Feb 2012 16:46:39 -0200
X-Google-Sender-Auth: YZFyMwVce_qy6Do2qHTmZbDomRY
Message-ID: <CAP9ODKqaWXbWMx7WRgDEDfqpWM1YPEhbPG_V93mYtd_QVqQJ1g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dhcp: Update to 4.2.3-P2
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
X-List-Received-Date: Wed, 08 Feb 2012 18:54:43 -0000
Content-Type: multipart/alternative; boundary=90e6ba6150c6e65e4604b878506a

--90e6ba6150c6e65e4604b878506a
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Feb 8, 2012 at 16:40, Andrei Gherzan <andrei@gherzan.ro> wrote:

> ...
>

In my opinion we ought to merge your patch without handling crypto issue
right now while we set in one way of fixing it.

It seems to me that the fix is to move libcrypto to base_libdir and don't
touch dhcp for this.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--90e6ba6150c6e65e4604b878506a
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Wed, Feb 8, 2012 at 16:40, Andrei Gherzan <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:andrei@gherzan.ro">andrei@gherzan.ro</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">

 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF" text=3D"#000000"><div><div class=3D"h5">...</div=
></div></div></blockquote><div><br></div><div>In my opinion we ought to mer=
ge your patch without handling crypto issue right now while we set in one w=
ay of fixing it.</div>
<div><br></div><div>It seems to me that the fix is to move libcrypto to bas=
e_libdir and don&#39;t touch dhcp for this.=A0</div></div><div><br></div>--=
 <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio@ossystems.com.br" targ=
et=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystem=
s.com.br" target=3D"_blank">http://www.ossystems.com.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--90e6ba6150c6e65e4604b878506a--
