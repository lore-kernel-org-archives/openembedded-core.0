Received: from col0-omc3-s12.col0.hotmail.com ([65.55.34.150])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kyoonn@hotmail.com>) id 1S9kjE-0004uo-C5
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Mar 2012 23:07:00 +0100
Received: from COL120-W63 ([65.55.34.137]) by col0-omc3-s12.col0.hotmail.com
	with Microsoft SMTPSVC(6.0.3790.4675); 
	Mon, 19 Mar 2012 14:57:04 -0700
Message-ID: <COL120-W6346678F9768AEFEA35D5EDD420@phx.gbl>
X-Originating-IP: [70.137.142.215]
From: simran singh <kyoonn@hotmail.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 19 Mar 2012 14:57:03 -0700
Importance: Normal
In-Reply-To: <EBB81F82C91641E49DD69302B85DB8BF@gmail.com>
References: <COL120-W391CDA1CEF0C6CE16540C8DD420@phx.gbl>
	<, >, <1332192150.9740.72.camel@ted>,
	<COL120-W278115027639B2C6CC9F7BDD420@phx.gbl>,
	<EBB81F82C91641E49DD69302B85DB8BF@gmail.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 19 Mar 2012 21:57:04.0487 (UTC)
	FILETIME=[3877C770:01CD061B]
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
X-List-Received-Date: Mon, 19 Mar 2012 22:07:00 -0000
Content-Type: multipart/alternative;
	boundary="_958b6297-23a8-499b-b115-91087db38fe9_"

--_958b6297-23a8-499b-b115-91087db38fe9_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


So install something along the lines:
do_install(){       python configure.py --prefix=3D${libdir}/botan}

When I do that=2C I get a permission denied error:mkdir: cannot create dire=
ctory /usr/lib/botan
Sorry I am still significantly new to open embedded and bitbake.
Thanks=2CSimran

Date: Mon=2C 19 Mar 2012 14:39:13 -0700
From: kergoth@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] Linking two recipes


                /usr/botan isn't a path that'll be placed into the sysroot=
=2C which is the standard mechanism by which files from dependencies are ac=
cessed (e.g. headers=2C shared libraries=2C native scripts). You should ins=
tall to more standard system locations.

               =20
-- Christopher Larson

                =20
                On Monday=2C March 19=2C 2012 at 2:33 PM=2C simran singh wr=
ote:
               =20
                   =20




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
 		 	   		 =20
_______________________________________________Openembedded-core mailing li=
stOpenembedded-core@lists.openembedded.orghttp://lists.linuxtogo.org/cgi-bi=
n/mailman/listinfo/openembedded-core
                =20
                =20
                =20
                =20
               =20
                =20
               =20
                   =20

               =20
           =20
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core 		 	 =
  		  =

--_958b6297-23a8-499b-b115-91087db38fe9_
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
So install something along the lines:<div><br></div><div>do_install(){</div=
><div>&nbsp=3B &nbsp=3B &nbsp=3B &nbsp=3Bpython configure.py --prefix=3D${l=
ibdir}/botan</div><div>}<br><br>When I do that=2C I get a permission denied=
 error:</div><div>mkdir: cannot create directory /usr/lib/botan</div><div><=
br></div><div>Sorry I am still significantly new to open embedded and bitba=
ke.</div><div><br></div><div>Thanks=2C</div><div>Simran<br><br><div><div id=
=3D"SkyDrivePlaceholder"></div><hr id=3D"stopSpelling">Date: Mon=2C 19 Mar =
2012 14:39:13 -0700<br>From: kergoth@gmail.com<br>To: openembedded-core@lis=
ts.openembedded.org<br>Subject: Re: [OE-core] Linking two recipes<br><br>
                <div style=3D"font-family:Helvetica=3Bfont-size:13px">/usr/=
botan isn't a path that'll be placed into the sysroot=2C which is the stand=
ard mechanism by which files from dependencies are accessed (e.g. headers=
=2C shared libraries=2C native scripts). You should install to more standar=
d system locations.<br></div>
                <div><div><br></div><div>--&nbsp=3B</div><div>Christopher L=
arson</div><div><br></div></div>
                =20
                <p style=3D"color:#A0A0A8">On Monday=2C March 19=2C 2012 at=
 2:33 PM=2C simran singh wrote:</p>
                <blockquote style=3D"border-left-style:solid=3Bborder-width=
:1px=3Bmargin-left:0px=3Bpadding-left:10px">
                    <span><div><div>


<div dir=3D"ltr">

Hello Richard=2C<div><br></div><div>I did try the DEPENDS variable before b=
ut still doesnt solve the problem.</div><div>A configure script in recipe B=
 has to run a program that is built under ${D}/usr/botan by recipe A.&nbsp=
=3B</div><div>Even if i pass the path to the configure script=2C it is unab=
le to find the script. ./configure --with-botan=3D............./usr/botan</=
div><div>Thanks.</div><div><br></div><div>Simran</div><div><br><br><div>&gt=
=3B From: <a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.pur=
die@linuxfoundation.org</a><br>&gt=3B To: <a href=3D"mailto:openembedded-co=
re@lists.openembedded.org">openembedded-core@lists.openembedded.org</a><br>=
&gt=3B Date: Mon=2C 19 Mar 2012 21:22:30 +0000<br>&gt=3B Subject: Re: [OE-c=
ore] Linking two recipes<br>&gt=3B <br>&gt=3B On Mon=2C 2012-03-19 at 13:59=
 -0700=2C simran singh wrote:<br>&gt=3B &gt=3B Hello=2C<br>&gt=3B &gt=3B I =
have recipes for two applications Recipe A and Recipe B. Recipe B<br>&gt=3B=
 &gt=3B requires a lib.so file and init.h file which are installed by Recip=
e<br>&gt=3B &gt=3B A.<br>&gt=3B &gt=3B How do I acknowledge this dependency=
 in Recipe B. I tried doing<br>&gt=3B &gt=3B do_stage() function in recipe =
A with no success. Please advice.<br>&gt=3B &gt=3B I am attaching the two r=
ecipes.<br>&gt=3B &gt=3B Thank you for any help.<br>&gt=3B <br>&gt=3B recip=
e B needs to do:<br>&gt=3B <br>&gt=3B DEPENDS +=3D "recipeA"<br>&gt=3B <br>=
&gt=3B Cheers=2C<br>&gt=3B <br>&gt=3B Richard<br>&gt=3B <br>&gt=3B <br>&gt=
=3B <br>&gt=3B _______________________________________________<br>&gt=3B Op=
enembedded-core mailing list<br>&gt=3B <a href=3D"mailto:Openembedded-core@=
lists.openembedded.org">Openembedded-core@lists.openembedded.org</a><br>&gt=
=3B <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembe=
dded-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/lis=
tinfo/openembedded-core</a><br></div></div> 		 	   		  </div>
</div><div><div>_______________________________________________</div><div>O=
penembedded-core mailing list</div><div><a href=3D"mailto:Openembedded-core=
@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a></div>=
<div><a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openemb=
edded-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/li=
stinfo/openembedded-core</a></div></div></div></span>
                =20
                =20
                =20
                =20
                </blockquote>
                =20
                <div>
                    <br>
                </div>
            <br>_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core</div>=
</div> 		 	   		  </div></body>
</html>=

--_958b6297-23a8-499b-b115-91087db38fe9_--
