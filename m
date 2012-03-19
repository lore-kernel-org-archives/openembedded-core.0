Received: from col0-omc3-s10.col0.hotmail.com ([65.55.34.148])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kyoonn@hotmail.com>) id 1S9kMa-0004FX-TA
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Mar 2012 22:43:37 +0100
Received: from COL120-W27 ([65.55.34.136]) by col0-omc3-s10.col0.hotmail.com
	with Microsoft SMTPSVC(6.0.3790.4675); 
	Mon, 19 Mar 2012 14:33:37 -0700
Message-ID: <COL120-W278115027639B2C6CC9F7BDD420@phx.gbl>
X-Originating-IP: [70.137.142.215]
From: simran singh <kyoonn@hotmail.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 19 Mar 2012 14:33:36 -0700
Importance: Normal
In-Reply-To: <1332192150.9740.72.camel@ted>
References: <COL120-W391CDA1CEF0C6CE16540C8DD420@phx.gbl>,
	<1332192150.9740.72.camel@ted>
MIME-Version: 1.0
X-OriginalArrivalTime: 19 Mar 2012 21:33:37.0223 (UTC)
	FILETIME=[F1AC5570:01CD0617]
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
X-List-Received-Date: Mon, 19 Mar 2012 21:43:37 -0000
Content-Type: multipart/alternative;
	boundary="_a65b718c-4bb8-47bd-829f-80815a4fd876_"

--_a65b718c-4bb8-47bd-829f-80815a4fd876_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



Hello Richard=2C
I did try the DEPENDS variable before but still doesnt solve the problem.A =
configure script in recipe B has to run a program that is built under ${D}/=
usr/botan by recipe A. Even if i pass the path to the configure script=2C i=
t is unable to find the script. ./configure --with-botan=3D............./us=
r/botanThanks.
Simran

> From: richard.purdie@linuxfoundation.org
> To: openembedded-core@lists.openembedded.org
> Date: Mon=2C 19 Mar 2012 21:22:30 +0000
> Subject: Re: [OE-core] Linking two recipes
>=20
> On Mon=2C 2012-03-19 at 13:59 -0700=2C simran singh wrote:
> > Hello=2C
> > I have recipes for two applications Recipe A and Recipe B. Recipe B
> > requires a lib.so file and init.h file which are installed by Recipe
> > A.
> > How do I acknowledge this dependency in Recipe B. I tried doing
> > do_stage() function in recipe A with no success. Please advice.
> > I am attaching the two recipes.
> > Thank you for any help.
>=20
> recipe B needs to do:
>=20
> DEPENDS +=3D "recipeA"
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

--_a65b718c-4bb8-47bd-829f-80815a4fd876_
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

Hello Richard=2C<div><br></div><div>I did try the DEPENDS variable before b=
ut still doesnt solve the problem.</div><div>A configure script in recipe B=
 has to run a program that is built under ${D}/usr/botan by recipe A.&nbsp=
=3B</div><div>Even if i pass the path to the configure script=2C it is unab=
le to find the script. ./configure --with-botan=3D............./usr/botan</=
div><div>Thanks.</div><div><br></div><div>Simran</div><div><br><br><div><di=
v id=3D"ecxSkyDrivePlaceholder"></div>&gt=3B From: richard.purdie@linuxfoun=
dation.org<br>&gt=3B To: openembedded-core@lists.openembedded.org<br>&gt=3B=
 Date: Mon=2C 19 Mar 2012 21:22:30 +0000<br>&gt=3B Subject: Re: [OE-core] L=
inking two recipes<br>&gt=3B <br>&gt=3B On Mon=2C 2012-03-19 at 13:59 -0700=
=2C simran singh wrote:<br>&gt=3B &gt=3B Hello=2C<br>&gt=3B &gt=3B I have r=
ecipes for two applications Recipe A and Recipe B. Recipe B<br>&gt=3B &gt=
=3B requires a lib.so file and init.h file which are installed by Recipe<br=
>&gt=3B &gt=3B A.<br>&gt=3B &gt=3B How do I acknowledge this dependency in =
Recipe B. I tried doing<br>&gt=3B &gt=3B do_stage() function in recipe A wi=
th no success. Please advice.<br>&gt=3B &gt=3B I am attaching the two recip=
es.<br>&gt=3B &gt=3B Thank you for any help.<br>&gt=3B <br>&gt=3B recipe B =
needs to do:<br>&gt=3B <br>&gt=3B DEPENDS +=3D "recipeA"<br>&gt=3B <br>&gt=
=3B Cheers=2C<br>&gt=3B <br>&gt=3B Richard<br>&gt=3B <br>&gt=3B <br>&gt=3B =
<br>&gt=3B _______________________________________________<br>&gt=3B Openem=
bedded-core mailing list<br>&gt=3B Openembedded-core@lists.openembedded.org=
<br>&gt=3B http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core<br></div></div> 		 	   		  </div></body>
</html>=

--_a65b718c-4bb8-47bd-829f-80815a4fd876_--
