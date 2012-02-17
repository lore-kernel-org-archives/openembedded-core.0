Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RyTGo-0006Cd-5R
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Feb 2012 20:15:04 +0100
Received: by vcqp1 with SMTP id p1so509339vcq.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2012 11:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=Rwo/XclL3PFmLAHFaVogSLxVahdgPkpqxf9KxjQAIJ4=;
	b=Yh25HI5IHhRzm8HhXzH+AjmjfIK93Us2owyMyNxp3IE+2T8QjblP8KGTrW7lAjlJmm
	x/ozCUnPKr7TYQUJ1heWivYhLmYe5taLyKXfquCGU+VzZ5nmdEobr8ahOx/U+LVL1k/g
	F7Kqy9GmPtsdpp7kFlf3UjKkJr18govqhWIjw=
MIME-Version: 1.0
Received: by 10.220.116.2 with SMTP id k2mr1867119vcq.44.1329505607394; Fri,
	17 Feb 2012 11:06:47 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.3.84 with HTTP; Fri, 17 Feb 2012 11:06:47 -0800 (PST)
In-Reply-To: <1329501107.14363.205.camel@phil-desktop>
References: <cover.1329500798.git.otavio@ossystems.com.br>
	<a186127453b155d8f35a32fac48a56dad98aad7f.1329500798.git.otavio@ossystems.com.br>
	<1329501107.14363.205.camel@phil-desktop>
Date: Fri, 17 Feb 2012 17:06:47 -0200
X-Google-Sender-Auth: Hdkx8Nid61bciErqnM4wA-m2vy0
Message-ID: <CAP9ODKqd=j7wye-W2ZGtS5eC+ALf_i9X7F0BWiN-VaY+SkRB2A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] rootfs_ipk.bbclass: fix unpacked postinst support if no package management
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
X-List-Received-Date: Fri, 17 Feb 2012 19:15:04 -0000
Content-Type: multipart/alternative; boundary=f46d04388dfd74a4d404b92da525

--f46d04388dfd74a4d404b92da525
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Feb 17, 2012 at 15:51, Phil Blundell <philb@gnu.org> wrote:

> On Fri, 2012-02-17 at 17:47 +0000, Otavio Salvador wrote:
> > When building without package management we can end with a system
> > without opkg and thus without support for running unfinished postinsts
> > on first boot, we fix this providing a S98configure script for this
> > use case.
>
> Isn't this what run-postinsts is meant to be doing?
>

Except it calls opkg-cl configure; that's why I check if opkg-cl is not
available.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--f46d04388dfd74a4d404b92da525
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Fri, Feb 17, 2012 at 15:51, Phil Blundell <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:philb@gnu.org">philb@gnu.org</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"im">On Fri, 2012-02-17 at 17:47 +0000, Otavio Salvador wrote:=
<br>
&gt; When building without package management we can end with a system<br>
&gt; without opkg and thus without support for running unfinished postinsts=
<br>
&gt; on first boot, we fix this providing a S98configure script for this<br=
>
&gt; use case.<br>
<br>
</div>Isn&#39;t this what run-postinsts is meant to be doing?<br></blockquo=
te><div><br></div><div>Except it calls opkg-cl configure; that&#39;s why I =
check if opkg-cl is not available.</div><div>=A0</div></div>-- <br>Otavio S=
alvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Syst=
ems<br>
E-mail: <a href=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio=
@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystems.com.br" target=3D"=
_blank">http://www.ossystems.com.br</a><br>Mobile: +55 53 9981-7854=A0 =A0 =
=A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://projetos.ossystems.com.br" target=
=3D"_blank">http://projetos.ossystems.com.br</a><br>
<br>

--f46d04388dfd74a4d404b92da525--
