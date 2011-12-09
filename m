Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RZ7Bt-000190-Vg
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 21:37:10 +0100
Received: by bkbzt4 with SMTP id zt4so3449328bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Dec 2011 12:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=Qg6LmpyUdRGCSo3BYx1jJ4T6sBedv2RbnNzSSAkO+rs=;
	b=ZufJ2n5WsKtiPMFkL50NbiGTe6fZQbyO5ju1ySNhDg7A5o1cpxEhcy0crtYcsfho8j
	g173I5j3Gu0Wki2I5vHla001CGtLRw4gFcWPRparlDeO13r1/GjqgTmjSvsUJl44vlWg
	UesMLL/2sDnIcSZi2aME04raLBuSd4o8QrKOk=
MIME-Version: 1.0
Received: by 10.205.142.4 with SMTP id jg4mr4873404bkc.119.1323462617459; Fri,
	09 Dec 2011 12:30:17 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.113.132 with HTTP; Fri, 9 Dec 2011 12:30:17 -0800 (PST)
In-Reply-To: <CAMKF1sqk78Du5cphwfusxFOjpGBrOpOXtK2zpn-6AmToBav-BQ@mail.gmail.com>
References: <1323460893-30873-1-git-send-email-otavio@ossystems.com.br>
	<CAMKF1spbr_wVbi7tLToDF3bPhg28cAGz_JVVWFg59iGHEM5quA@mail.gmail.com>
	<CAP9ODKozBigWbmZZFX9AESZpms+4cNWKUx20uhZsfCYjURNHZA@mail.gmail.com>
	<CAMKF1sqk78Du5cphwfusxFOjpGBrOpOXtK2zpn-6AmToBav-BQ@mail.gmail.com>
Date: Fri, 9 Dec 2011 18:30:17 -0200
X-Google-Sender-Auth: sULBA9hUjxM2cCClMIB3X3xd-wU
Message-ID: <CAP9ODKoRr9nQwrjEj=uTASq38P5_U_K0EXAu_D5TfapJQa1J4g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] connman: avoid checking for linux/if_alg.h header
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
X-List-Received-Date: Fri, 09 Dec 2011 20:37:10 -0000
Content-Type: multipart/alternative; boundary=e0cb4efe30522febd204b3aea78f

--e0cb4efe30522febd204b3aea78f
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Dec 9, 2011 at 18:23, Khem Raj <raj.khem@gmail.com> wrote:

> > I'm willing to try to drop this in a next patch but I'd prefer this to
> get
> > in before and get connman in a working shape again before focusing on
> > improvements for it.
>
> your patch is already available for who are in hurry.


The problem is that fails to build for some people (it works for me) and
thus I would prefer it to be in a working state before doing more cleanups.

This was being done on meta-oe so connman works fine and we are using it
here with this change. As I said I will fix it soon.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--e0cb4efe30522febd204b3aea78f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Fri, Dec 9, 2011 at 18:23, Khem Raj <span dir=
=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex;">
<div class=3D"im">&gt; I&#39;m willing to try to drop this in a next patch =
but I&#39;d prefer this to get<br>
&gt; in before and get connman in a working shape again before focusing on<=
br>
&gt; improvements for it.<br>
<br>
</div>your patch is already available for who are in hurry.</blockquote><di=
v><br></div><div>The problem is that fails to build for some people (it wor=
ks for me) and thus I would prefer it to be in a working state before doing=
 more cleanups.</div>
<div><br></div><div>This was being done on meta-oe so connman works fine an=
d we are using it here with this change. As I said I will fix it soon.</div=
><div>=A0</div></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>
E-mail: <a href=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio=
@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystems.com.br" target=3D"=
_blank">http://www.ossystems.com.br</a><br>Mobile: +55 53 9981-7854=A0 =A0 =
=A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://projetos.ossystems.com.br" target=
=3D"_blank">http://projetos.ossystems.com.br</a><br>
<br>

--e0cb4efe30522febd204b3aea78f--
