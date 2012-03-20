Received: from col0-omc3-s18.col0.hotmail.com ([65.55.34.157])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kyoonn@hotmail.com>) id 1SA4qP-0002Ob-8i
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Mar 2012 20:35:45 +0100
Received: from COL120-W58 ([65.55.34.137]) by col0-omc3-s18.col0.hotmail.com
	with Microsoft SMTPSVC(6.0.3790.4675); 
	Tue, 20 Mar 2012 12:25:44 -0700
Message-ID: <COL120-W589EFDCD1837C8DE58A37FDD430@phx.gbl>
X-Originating-IP: [67.164.104.98]
From: simran singh <kyoonn@hotmail.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 20 Mar 2012 12:25:44 -0700
Importance: Normal
In-Reply-To: <1332197654.9740.73.camel@ted>
References: <COL120-W391CDA1CEF0C6CE16540C8DD420@phx.gbl> <,>
	<,>,,<1332192150.9740.72.camel@ted>
	<,>,,<COL120-W278115027639B2C6CC9F7BDD420@phx.gbl> <, >,,
	<EBB81F82C91641E49DD69302B85DB8BF@gmail.com>,,
	<COL120-W6346678F9768AEFEA35D5EDD420@phx.gbl>,,
	<B0098CE307294E64ABD9A4F359B2382D@gmail.com>,
	<COL120-W436E890CF0879C1F67450CDD420@phx.gbl>,
	<1332197654.9740.73.camel@ted>
MIME-Version: 1.0
X-OriginalArrivalTime: 20 Mar 2012 19:25:44.0487 (UTC)
	FILETIME=[3EC77B70:01CD06CF]
Subject: Re: Linking two recipes
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
X-List-Received-Date: Tue, 20 Mar 2012 19:35:45 -0000
Content-Type: multipart/alternative;
	boundary="_7bff059c-a059-419c-af20-d975a39240af_"

--_7bff059c-a059-419c-af20-d975a39240af_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


Hello=2C
I was able to have the recipes find each other but I think the problem lies=
 somewhere else as to why the build is failing.But thanks for all the help.
Simran

> From: richard.purdie@linuxfoundation.org
> To: openembedded-core@lists.openembedded.org
> Date: Mon=2C 19 Mar 2012 22:54:14 +0000
> Subject: Re: [OE-core] Linking two recipes
>=20
> On Mon=2C 2012-03-19 at 15:10 -0700=2C simran singh wrote:
> > This is how I was able to install it:
> >=20
> >=20
> > do_install(){
> >        python configure.py --prefix=3D${D}/${libdir}/botan
> > }
> >
> >=20
> > But still the other recipe is unable to locate the files.
> >=20
>=20
> In the other recipe=2C look in ${STAGING_LIBDIR}...
>=20
> Cheers=2C
>=20
> Richard
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
 		 	   		  =

--_7bff059c-a059-419c-af20-d975a39240af_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<style><!--
.hmmessage P
{
margin:0px=3B
padding:0px
}
body.hmmessage
{
font-size: 10pt=3B
font-family:Tahoma
}
--></style></head>
<body class=3D'hmmessage'><div dir=3D'ltr'>
Hello=2C<div><br></div><div>I was able to have the recipes find each other =
but I think the problem lies somewhere else as to why the build is failing.=
</div><div>But thanks for all the help.</div><div><br></div><div>Simran<br>=
<br><div><div id=3D"SkyDrivePlaceholder"></div>&gt=3B From: richard.purdie@=
linuxfoundation.org<br>&gt=3B To: openembedded-core@lists.openembedded.org<=
br>&gt=3B Date: Mon=2C 19 Mar 2012 22:54:14 +0000<br>&gt=3B Subject: Re: [O=
E-core] Linking two recipes<br>&gt=3B <br>&gt=3B On Mon=2C 2012-03-19 at 15=
:10 -0700=2C simran singh wrote:<br>&gt=3B &gt=3B This is how I was able to=
 install it:<br>&gt=3B &gt=3B <br>&gt=3B &gt=3B <br>&gt=3B &gt=3B do_instal=
l(){<br>&gt=3B &gt=3B        python configure.py --prefix=3D${D}/${libdir}/=
botan<br>&gt=3B &gt=3B }<br>&gt=3B &gt=3B<br>&gt=3B &gt=3B <br>&gt=3B &gt=
=3B But still the other recipe is unable to locate the files.<br>&gt=3B &gt=
=3B <br>&gt=3B <br>&gt=3B In the other recipe=2C look in ${STAGING_LIBDIR}.=
..<br>&gt=3B <br>&gt=3B Cheers=2C<br>&gt=3B <br>&gt=3B Richard<br>&gt=3B <b=
r>&gt=3B <br>&gt=3B <br>&gt=3B ____________________________________________=
___<br>&gt=3B Openembedded-core mailing list<br>&gt=3B Openembedded-core@li=
sts.openembedded.org<br>&gt=3B http://lists.linuxtogo.org/cgi-bin/mailman/l=
istinfo/openembedded-core<br></div></div> 		 	   		  </div></body>
</html>=

--_7bff059c-a059-419c-af20-d975a39240af_--
