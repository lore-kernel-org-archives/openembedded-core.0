Received: from mail-yw0-f41.google.com ([209.85.213.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1Skz1C-0001j2-JM
	for openembedded-core@lists.openembedded.org;
	Sat, 30 Jun 2012 16:51:26 +0200
Received: by yhr47 with SMTP id 47so4849242yhr.28
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jun 2012 07:40:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=zKjuXXo40RTYQTYjwvlsAYvyStL2XMC1nS57J/RotlE=;
	b=FvqdV518a+oMp78frbO+YPeH/656HrIsiiRMtE8Wi9WbVGiWDdeRBe0vDTNKuJa4Ar
	4ckz3CM+xjhqdVUDTym0rs2087teFANGTrdzEVkpTfXKlRDEiCN+Rvycegh7VEvWRxxn
	bbBO7fEdcCmInhYFzpvhD49fmvQTVO4PZx6TAcBFlFqvGk97I7Yq/ZClKrGTgzlqtY+G
	gE73yzBkcHvcTlDL1B5wZG6RKab3665deZaZUA5qwa12wzphNg//QashSQy69K8+I+Wx
	JMEElVSoMsyRhJUrhDxXpfhGucJV/6ZqV8R85vw0eB2ksAk2gO/JifmnzRQ/KUNPzRdh
	LHAw==
Received: by 10.42.10.73 with SMTP id p9mr2942136icp.43.1341067228796; Sat, 30
	Jun 2012 07:40:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.69.170 with HTTP; Sat, 30 Jun 2012 07:40:08 -0700 (PDT)
X-Originating-IP: [79.117.115.156]
In-Reply-To: <alpine.DEB.2.02.1206300847330.17264@oneiric>
References: <alpine.DEB.2.02.1206300847330.17264@oneiric>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Sat, 30 Jun 2012 17:40:08 +0300
Message-ID: <CAK18fxGKQrqrtZK2m3Qi9qECSXMVpzhOGzbua3or19UAoGrUSw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQmgo2GiF8FYSnkKYm8s85AUvhnEan9Y5exQRjTs/kpmKdTjAPdEm6Nuzekd6tznvZPC/NM7
Subject: Re: does it make sense to define INITSCRIPT_* without inheriting update-rc.d?
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
X-List-Received-Date: Sat, 30 Jun 2012 14:51:26 -0000
Content-Type: multipart/alternative; boundary=20cf30244ca3cad6ed04c3b18bc3

--20cf30244ca3cad6ed04c3b18bc3
Content-Type: text/plain; charset=ISO-8859-1

No. It won't make a difference. Or actually it makes a tiny difference:
check package.bbclass, function named gen_packagevar.

@g


On Sat, Jun 30, 2012 at 3:50 PM, Robert P. J. Day <rpjday@crashcourse.ca>wrote:

>
>  currently figuring out details of INITSCRIPT_*, and noticed that the
> recipe file irda-utils_0.9.18.bb assigned values to both
> INITSCRIPT_NAME and INITSCRIPT_PARAMS without inheriting update-rc.d.
>
>  is that allowed?  does it make sense?  unless the explicit
> do_install() routine in that recipe file somehow takes care of things.
>
> rday
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                        http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--20cf30244ca3cad6ed04c3b18bc3
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

No. It won&#39;t make a difference. Or actually it makes a tiny difference:=
 check package.bbclass, function named=A0gen_packagevar.<div><br></div><div=
>@g<br>
<br><br><div class=3D"gmail_quote">On Sat, Jun 30, 2012 at 3:50 PM, Robert =
P. J. Day <span dir=3D"ltr">&lt;<a href=3D"mailto:rpjday@crashcourse.ca" ta=
rget=3D"_blank">rpjday@crashcourse.ca</a>&gt;</span> wrote:<br><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">

<br>
 =A0currently figuring out details of INITSCRIPT_*, and noticed that the<br=
>
recipe file <a href=3D"http://irda-utils_0.9.18.bb" target=3D"_blank">irda-=
utils_0.9.18.bb</a> assigned values to both<br>
INITSCRIPT_NAME and INITSCRIPT_PARAMS without inheriting update-rc.d.<br>
<br>
 =A0is that allowed? =A0does it make sense? =A0unless the explicit<br>
do_install() routine in that recipe file somehow takes care of things.<br>
<br>
rday<br>
<br>
--<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
Robert P. J. Day =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 Ottawa, Ontario, CANADA<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<a href=3D"http://crashcour=
se.ca" target=3D"_blank">http://crashcourse.ca</a><br>
<br>
Twitter: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 <a href=3D"http://twitter.com/rpjday" target=3D"_blank">http://=
twitter.com/rpjday</a><br>
LinkedIn: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 <a hr=
ef=3D"http://ca.linkedin.com/in/rpjday" target=3D"_blank">http://ca.linkedi=
n.com/in/rpjday</a><br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</blockquote></div><br></div>

--20cf30244ca3cad6ed04c3b18bc3--
