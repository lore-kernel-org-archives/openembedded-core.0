Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SZo2H-0004CS-5j
	for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 20:54:21 +0200
Received: by dalh21 with SMTP id h21so163201dal.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2012 11:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=NpMiA2HDBAHhUA1x3/sYq3oxe7ZW9uwKY3G9pXO3w7A=;
	b=VXo4J0gFuBw0UBPQgggUtq+Dxqk1l2sCixxScJ5gYhztFXj7pcIjitqCrTNs7cqCy9
	4P6Nwm62RHeNJKt1gdkr4D7cRVI90f8HjudKUxHMw9rlXxv4t3XWB83ew5fA3nXzfgz+
	wPALbLXCmzJJbjw+FrcCr1shPFWDtGwRfUTrOz0WqbZincR0blS/bF+v0Y6HsSsyA4da
	UQzYDVQfNbaue85AWhPIxRa52hfWBYRw4UOaSeBOvNAlqs/c8erZ9l9nQxNofF/G3GxG
	pGHWUGXkywquuSgFP8KT2M+Rp6mVdGHkjQsM3bWo75uaCJsN4NYIisaIRaHVLfnG2sMg
	uY/g==
MIME-Version: 1.0
Received: by 10.68.213.104 with SMTP id nr8mr52382963pbc.26.1338403441170;
	Wed, 30 May 2012 11:44:01 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.25.42 with HTTP; Wed, 30 May 2012 11:44:01 -0700 (PDT)
In-Reply-To: <4FC6686B.20904@palm.com>
References: <4FC6686B.20904@palm.com>
Date: Wed, 30 May 2012 15:44:01 -0300
X-Google-Sender-Auth: 73T-BJ9zgk7rkPw1S1YsM3Z3ahI
Message-ID: <CAP9ODKrFYmfAzt_ASAMxunp6MS_7O63_WZuDGkm7p3z7nJttuA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: On the possibility of using upstart...
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
X-List-Received-Date: Wed, 30 May 2012 18:54:21 -0000
Content-Type: multipart/alternative; boundary=e89a8ff1c3d0ad57db04c14555e8

--e89a8ff1c3d0ad57db04c14555e8
Content-Type: text/plain; charset=ISO-8859-1

Dear Rich,

On Wed, May 30, 2012 at 3:35 PM, Rich Pixley <rich.pixley@palm.com> wrote:

> Has anyone considered the possibility of introducing upstart to oe-core,
> perhaps as an alternative?
>
> How would people feel about patches to do that?
>
> I ask because "classic", (read, "former" and "proprietary"), WebOS used
> upstart and we're considering whether to attempt to continue to do so as we
> move to oe-core, or whether to attempt to convert all of our components
> over.  Either way, we have to convert a bunch of service scripts.  And if
> we're going to convert a bunch of service scripts for oe-core components,
> (as distinct from porting service scripts for Palm components), then it
> would be much easier of those patches were to find their way into oe-core
> rather than needing to be maintained separately.
>

The support for Upstart would be welcome for sure however we need to avoid
the same mistakes we did in Systemd support; I'd say it ought to start as a
separate layer in meta-oe for the beggining and after it has been properly
polished we can evaluate the possibility to merge it onto oe-core.

Current systemd classes can give you a good work base.

Regards,

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--e89a8ff1c3d0ad57db04c14555e8
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Dear Rich,<br><br><div class=3D"gmail_quote">On Wed, May 30, 2012 at 3:35 P=
M, Rich Pixley <span dir=3D"ltr">&lt;<a href=3D"mailto:rich.pixley@palm.com=
" target=3D"_blank">rich.pixley@palm.com</a>&gt;</span> wrote:<br><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">
Has anyone considered the possibility of introducing upstart to oe-core, pe=
rhaps as an alternative?<br>
<br>
How would people feel about patches to do that?<br>
<br>
I ask because &quot;classic&quot;, (read, &quot;former&quot; and &quot;prop=
rietary&quot;), WebOS used upstart and we&#39;re considering whether to att=
empt to continue to do so as we move to oe-core, or whether to attempt to c=
onvert all of our components over. =A0Either way, we have to convert a bunc=
h of service scripts. =A0And if we&#39;re going to convert a bunch of servi=
ce scripts for oe-core components, (as distinct from porting service script=
s for Palm components), then it would be much easier of those patches were =
to find their way into oe-core rather than needing to be maintained separat=
ely.<br>
</blockquote><div><br></div><div>The support for Upstart would be welcome f=
or sure however we need to avoid the same mistakes we did in Systemd suppor=
t; I&#39;d say it ought to start as a separate layer in meta-oe for the beg=
gining and after it has been properly polished we can evaluate the possibil=
ity to merge it onto oe-core.</div>
<div><br></div><div>Current systemd classes can give you a good work base.<=
/div><div><br></div><div>Regards,</div><div><br></div></div>-- <br>Otavio S=
alvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Syst=
ems<br>E-mail: <a href=3D"mailto:otavio@ossystems.com.br" target=3D"_blank"=
>otavio@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystems.com.br" tar=
get=3D"_blank">http://www.ossystems.com.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--e89a8ff1c3d0ad57db04c14555e8--
