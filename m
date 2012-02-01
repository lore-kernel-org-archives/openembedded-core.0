Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RshQZ-0006LU-LO
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Feb 2012 22:09:15 +0100
Received: by lahc1 with SMTP id c1so897976lah.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Feb 2012 13:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=YWDyx17pjiygwaLA2d7mJc39YGuMNTNgVW/AuZlG3s4=;
	b=fGmE32bRtXN9YtfH8xiTHD32+ejKqGpXIlbrnmhr6RFpdYUg32OP1mYwtmhUItXXbI
	lXi7/QEVzFe1h2aFmVqdDOq53DV1BKpl+uwUAqmbBdHIOP+HQIZi4JoyBZXkGpY1KSVZ
	FfByTMhG+0vkeTHmG0aMnyTKtjQZbxU7OZKIk=
MIME-Version: 1.0
Received: by 10.152.122.38 with SMTP id lp6mr105023lab.13.1328130080235; Wed,
	01 Feb 2012 13:01:20 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.112.46.199 with HTTP; Wed, 1 Feb 2012 13:01:20 -0800 (PST)
In-Reply-To: <1328129842.2716.156.camel@x121e.pbcl.net>
References: <cover.1328127940.git.otavio@ossystems.com.br>
	<429ddbe3779c6957e6ecad5ae37200865e19fa0f.1328127940.git.otavio@ossystems.com.br>
	<1328129842.2716.156.camel@x121e.pbcl.net>
Date: Wed, 1 Feb 2012 19:01:20 -0200
X-Google-Sender-Auth: 6PqsQysxojFbqunAk3lXDP3DL2M
Message-ID: <CAP9ODKqgPLHzPo6cNdx-9pijqW1wx2Pd5QejF-HaYax8F71Dqw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] dhcp: move dhcp leases files handling to postinst/postrm
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
X-List-Received-Date: Wed, 01 Feb 2012 21:09:15 -0000
Content-Type: multipart/alternative; boundary=f46d042f92b0a5e27a04b7ed6102

--f46d042f92b0a5e27a04b7ed6102
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Feb 1, 2012 at 18:57, Phil Blundell <philb@gnu.org> wrote:

> On Wed, 2012-02-01 at 20:27 +0000, Otavio Salvador wrote:
> >  pkg_postinst_dhcp-server() {
> > +    install -d $D/${localstatedir}/lib/dhcp
>
> Is "install" guaranteed to be available on the target?  I would have
> thought "mkdir -p" would be better.
>

It worked on all images I tested. I have no strong opinions about it.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--f46d042f92b0a5e27a04b7ed6102
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Wed, Feb 1, 2012 at 18:57, Phil Blundell <spa=
n dir=3D"ltr">&lt;<a href=3D"mailto:philb@gnu.org">philb@gnu.org</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"im">On Wed, 2012-02-01 at 20:27 +0000, Otavio Salvador wrote:=
<br>
&gt; =A0pkg_postinst_dhcp-server() {<br>
&gt; + =A0 =A0install -d $D/${localstatedir}/lib/dhcp<br>
<br>
</div>Is &quot;install&quot; guaranteed to be available on the target? =A0I=
 would have<br>
thought &quot;mkdir -p&quot; would be better.<br></blockquote><div><br></di=
v><div>It worked on all images I tested. I have no strong opinions about it=
.=A0</div></div><div><br></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>
E-mail: <a href=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio=
@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystems.com.br" target=3D"=
_blank">http://www.ossystems.com.br</a><br>Mobile: +55 53 9981-7854=A0 =A0 =
=A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://projetos.ossystems.com.br" target=
=3D"_blank">http://projetos.ossystems.com.br</a><br>
<br>

--f46d042f92b0a5e27a04b7ed6102--
