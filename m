Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>)
	id 1RuYZQ-0000xu-O4; Tue, 07 Feb 2012 01:06:05 +0100
Received: by eekd41 with SMTP id d41so2004647eek.6
	for <multiple recipients>; Mon, 06 Feb 2012 15:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=VgOgQvx2Yrp8rJcv94p/rYfk3DIAufL6eFn8+7oLF1U=;
	b=LXJ9n28+FbdlDTIfpeIeguX+8LI51rcrEpGgkYlAL8e/vh7yJUTB0p3cyfhosNdIYU
	YTa2tHKYJYimMVBbPKCwlljSeFLbFG0LWvaQ8wOjtTQaJqiRzc0l+14j5n10eRIY4rUh
	JAzTg7W6o7NKVDrV81AG9wcJz8Mvv6nuxajgk=
MIME-Version: 1.0
Received: by 10.14.52.17 with SMTP id d17mr6120637eec.56.1328572681900; Mon,
	06 Feb 2012 15:58:01 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.14.96.129 with HTTP; Mon, 6 Feb 2012 15:58:01 -0800 (PST)
In-Reply-To: <CA+YB3rZD5QS=aVtAiA_Jiqqfu4Pg3G6ojF=o2iYN4b1r3ZOXvw@mail.gmail.com>
References: <CA+YB3rZD5QS=aVtAiA_Jiqqfu4Pg3G6ojF=o2iYN4b1r3ZOXvw@mail.gmail.com>
Date: Mon, 6 Feb 2012 21:58:01 -0200
X-Google-Sender-Auth: moLH6DLWk33Xx4vZSvjkfn0IojM
Message-ID: <CAP9ODKrHEwrq_29ZGDXjykwF8MSf4M_2XP=x+k3Q5nz-SfwAfQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: tsc <tsc@lists.openembedded.org>, openembedded-devel@lists.openembedded.org
Subject: Re: OE TSC Minutes: 30 January 2012
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
X-List-Received-Date: Tue, 07 Feb 2012 00:06:06 -0000
Content-Type: multipart/alternative; boundary=002354477cd0c354e704b8546eb0

--002354477cd0c354e704b8546eb0
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Feb 6, 2012 at 21:47, Jeff Osier-Mixon <jefro@jefro.net> wrote:

> ...
>
  d. gitpkgv.bbclass merge
>       good functionality, needs some work to be accepted
>

As this has been cited I'd like to reiterate that I intend to work on
refactoring later but would like to git it as is for now into OE-core as
other layers wants to use it (meta-ti is one). I don't have the need time
to learn bitbake fetcher2 code to work on the refactoring right now,
besides adding it on fetcher2 means needing to wait to a newer bitbake
release to use it in OE-core thus more delay for it to be usable by layers.

Cheers,

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--002354477cd0c354e704b8546eb0
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Mon, Feb 6, 2012 at 21:47, Jeff Osier-Mixon <=
span dir=3D"ltr">&lt;<a href=3D"mailto:jefro@jefro.net">jefro@jefro.net</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<span style=3D"border-collapse:collapse;color:rgb(34,34,34);font-family:ari=
al,sans-serif;font-size:13px"><div>...=A0</div></span></blockquote><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">
<span style=3D"border-collapse:collapse;color:rgb(34,34,34);font-family:ari=
al,sans-serif;font-size:13px"><div> =A0 d. gitpkgv.bbclass merge</div><div>=
=A0 =A0 =A0 good functionality, needs some work to be accepted</div></span>=
</blockquote>
<div><br></div><div>As this has been cited I&#39;d like to reiterate that I=
 intend to work on refactoring later but would like to git it as is for now=
 into OE-core as other layers wants to use it (meta-ti is one). I don&#39;t=
 have the need time to learn bitbake fetcher2 code to work on the refactori=
ng right now, besides adding it on fetcher2 means needing to wait to a newe=
r bitbake release to use it in OE-core thus more delay for it to be usable =
by layers.</div>
<div><br></div><div>Cheers,</div><div>=A0</div></div>-- <br>Otavio Salvador=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>=
E-mail: <a href=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio=
@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystems.com.br" target=3D"=
_blank">http://www.ossystems.com.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--002354477cd0c354e704b8546eb0--
