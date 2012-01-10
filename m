Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RkibK-0002q2-Cp
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 21:47:22 +0100
Received: by lami14 with SMTP id i14so2134295lam.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2012 12:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=y8Tz85BmW3mmyIrJlGNq3i2T0gfkb7RW8SOn7aPJ2+o=;
	b=rU1JMYFqJHYsEbtKZ1khm5QHbC63fUKf2LSXQgGnVQ9vjUSYH3tYxBh+f3jX5eOs3a
	14rjt5Pg1sq9PMWP4nhcrzlmma8oPFwJZVHsGXIT3wa5PL0QT1I/fkynFV/l1jCMVhnS
	mOGdZrNOUv/ph40wBHvTajVNRtjEUl5gqQImI=
MIME-Version: 1.0
Received: by 10.152.111.201 with SMTP id ik9mr9458324lab.8.1326227989209; Tue,
	10 Jan 2012 12:39:49 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.112.54.104 with HTTP; Tue, 10 Jan 2012 12:39:49 -0800 (PST)
In-Reply-To: <1326226959-21371-1-git-send-email-ferlandm@sonatest.com>
References: <1326226959-21371-1-git-send-email-ferlandm@sonatest.com>
Date: Tue, 10 Jan 2012 18:39:49 -0200
X-Google-Sender-Auth: bNlbf-LZa6xsDcXldiNlk0r0Ki8
Message-ID: <CAP9ODKoaK1hZsbhQMBgdGmFw_Mru9s6aOgqrm0MMqgMU0hiNVA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Add grep to RDEPENDS to avoid command failures.
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
X-List-Received-Date: Tue, 10 Jan 2012 20:47:22 -0000
Content-Type: multipart/alternative; boundary=f46d04083f2130238e04b6328477

--f46d04083f2130238e04b6328477
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jan 10, 2012 at 18:22, Marc Ferland <ferlandm@sonatest.com> wrote:

> ...

+PR = "r1"
> +RDEPENDS = "grep"
>

Busybox ought to provide it; what is missing?

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--f46d04083f2130238e04b6328477
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Tue, Jan 10, 2012 at 18:22, Marc Ferland <spa=
n dir=3D"ltr">&lt;<a href=3D"mailto:ferlandm@sonatest.com">ferlandm@sonates=
t.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
...=A0</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">+PR =3D &quot;r1&quot;<br=
>
+RDEPENDS =3D &quot;grep&quot;<br></blockquote><div><br></div><div>Busybox =
ought to provide it; what is missing?</div><div>=A0</div></div>-- <br>Otavi=
o Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. S=
ystems<br>E-mail: <a href=3D"mailto:otavio@ossystems.com.br" target=3D"_bla=
nk">otavio@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystems.com.br" =
target=3D"_blank">http://www.ossystems.com.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--f46d04083f2130238e04b6328477--
