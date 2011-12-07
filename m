Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RYIcU-0004fn-PF
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Dec 2011 15:37:14 +0100
Received: by eekb15 with SMTP id b15so477085eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Dec 2011 06:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=7KhgbPG6ImCSJq/h8pQPkK4M9PUSDtiIPOP74SJEKLY=;
	b=TnJil9s448NFJdhQaW9cKBzmNMa9SnoatEBKO3ZOzUugMQC+tzbgFIX8zsBr51julb
	TptzWNsOQgwqhTjSR6mi63pYzxo5wTIUjQD47UNGxJYD1r1gp098L1or2zUOh4wpWlpd
	K8jLJb8lNOJYlJLk/H6TzwfOqbMEOlwtXBgac=
MIME-Version: 1.0
Received: by 10.14.2.3 with SMTP id 3mr3479368eee.155.1323268226164; Wed, 07
	Dec 2011 06:30:26 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.113.132 with HTTP; Wed, 7 Dec 2011 06:30:26 -0800 (PST)
In-Reply-To: <1323261242.19363.86.camel@ted>
References: <cover.1323187516.git.otavio@ossystems.com.br>
	<1323261242.19363.86.camel@ted>
Date: Wed, 7 Dec 2011 12:30:26 -0200
X-Google-Sender-Auth: Y_LGqXwLpSa946geAuVc9l2QT_g
Message-ID: <CAP9ODKqYNbmHDFYxXXG_5xGC4KY6rYQEWXw6QHAkWbnqD+tF+A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/5] Provides a framework and initial modules for initramfs
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
X-List-Received-Date: Wed, 07 Dec 2011 14:37:14 -0000
Content-Type: multipart/alternative; boundary=0016363ba55a9028cf04b3816441

--0016363ba55a9028cf04b3816441
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Dec 7, 2011 at 10:34, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> Rather than add five different recipes for this, could we have one
> recipe with five different packages? I'm a little bit sensitive to
> parsing speed and whilst its a detail, small details add up :)
>

Yes; that works for me.

Besides that, are you OK with that?

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--0016363ba55a9028cf04b3816441
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Wed, Dec 7, 2011 at 10:34, Richard Purdie <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">ri=
chard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex;">
<div class=3D"im">Rather than add five different recipes for this, could we=
 have one</div>
recipe with five different packages? I&#39;m a little bit sensitive to<br>
parsing speed and whilst its a detail, small details add up :)<br></blockqu=
ote><div><br></div><div>Yes; that works for me.</div><div><br></div><div>Be=
sides that, are you OK with that?=A0</div></div><div><br></div>-- <br>Otavi=
o Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. S=
ystems<br>
E-mail: <a href=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio=
@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystems.com.br" target=3D"=
_blank">http://www.ossystems.com.br</a><br>Mobile: +55 53 9981-7854=A0 =A0 =
=A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://projetos.ossystems.com.br" target=
=3D"_blank">http://projetos.ossystems.com.br</a><br>
<br>

--0016363ba55a9028cf04b3816441--
