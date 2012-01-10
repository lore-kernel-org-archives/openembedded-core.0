Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RkjJc-0004Qt-RP
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 22:33:08 +0100
Received: by lami14 with SMTP id i14so19613lam.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2012 13:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=4wnvuiUcqmohxxM2V0VEBeIwdvmSw2wgdAukpWSDAT4=;
	b=l6FKH/Z0NVa54zU2PQbYil4k1pNX0+1PIvjNYV2MXmbBuQEkXor8nbvVh7qznLkgrB
	/SzXp45wCZ84wjA5BZOtBs7v+mAvf+9HVYuuNFoMYyctzGvxIGdoEfztIezuyFheJAV5
	RzQg3tuBxSGVaUjAWXZRoy6MJ1eq9ks4q8j9s=
MIME-Version: 1.0
Received: by 10.152.148.227 with SMTP id tv3mr9534875lab.15.1326230736176;
	Tue, 10 Jan 2012 13:25:36 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.112.54.104 with HTTP; Tue, 10 Jan 2012 13:25:36 -0800 (PST)
In-Reply-To: <87vcojmf8w.fsf@sonatest.com>
References: <CAP9ODKoaK1hZsbhQMBgdGmFw_Mru9s6aOgqrm0MMqgMU0hiNVA@mail.gmail.com>
	<87vcojmf8w.fsf@sonatest.com>
Date: Tue, 10 Jan 2012 19:25:36 -0200
X-Google-Sender-Auth: 4iMeTgKp2JZBreAzqJGJVKurbK4
Message-ID: <CAP9ODKprc01W9sStwMubMziZThj31C5Qn379AHA508rDJW9v9A@mail.gmail.com>
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
X-List-Received-Date: Tue, 10 Jan 2012 21:33:08 -0000
Content-Type: multipart/alternative; boundary=e89a8f22c691eb863d04b633279d

--e89a8f22c691eb863d04b633279d
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jan 10, 2012 at 19:14, Marc Ferland <ferlandm@sonatest.com> wrote:

> I was having trouble running the pm-suspend command. See:
> http://bugzilla.pokylinux.org/show_bug.cgi?id=1887
>
> Basically the '-x' option is missing from busybox's grep.


Can't pm-suspend be patched to avoid using the -x option? Maybe making the
regexp more strict, for example?

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--e89a8f22c691eb863d04b633279d
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Tue, Jan 10, 2012 at 19:14, Marc Ferland <spa=
n dir=3D"ltr">&lt;<a href=3D"mailto:ferlandm@sonatest.com">ferlandm@sonates=
t.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
I was having trouble running the pm-suspend command. See:<br>
<a href=3D"http://bugzilla.pokylinux.org/show_bug.cgi?id=3D1887" target=3D"=
_blank">http://bugzilla.pokylinux.org/show_bug.cgi?id=3D1887</a><br>
<br>
Basically the &#39;-x&#39; option is missing from busybox&#39;s grep.</bloc=
kquote><div><br></div><div>Can&#39;t pm-suspend be patched to avoid using t=
he -x option? Maybe making the regexp more strict, for example?</div><div>
=A0</div></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio@oss=
ystems.com.br" target=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=3D"=
http://www.ossystems.com.br" target=3D"_blank">http://www.ossystems.com.br<=
/a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--e89a8f22c691eb863d04b633279d--
