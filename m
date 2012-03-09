Received: from col0-omc3-s3.col0.hotmail.com ([65.55.34.141])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kyoonn@hotmail.com>) id 1S64AD-00051G-Fe
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Mar 2012 19:03:37 +0100
Received: from COL120-W1 ([65.55.34.135]) by col0-omc3-s3.col0.hotmail.com
	with Microsoft SMTPSVC(6.0.3790.4675); 
	Fri, 9 Mar 2012 09:53:50 -0800
Message-ID: <COL120-W1082BA92A18C841CACE26DD540@phx.gbl>
X-Originating-IP: [70.137.142.215]
From: simran singh <kyoonn@hotmail.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 9 Mar 2012 09:53:49 -0800
Importance: Normal
In-Reply-To: <4F4F1B36.7020504@gmail.com>
References: <COL120-W40B503FFC0574E4957B971DD6B0@phx.gbl>,
	<4F4F1B36.7020504@gmail.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 09 Mar 2012 17:53:50.0036 (UTC)
	FILETIME=[955DC940:01CCFE1D]
Subject: Re: BOTAN crypto library
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
X-List-Received-Date: Fri, 09 Mar 2012 18:03:37 -0000
Content-Type: multipart/alternative;
	boundary="_6dee23e6-a826-48b0-84bf-beca98682f6d_"

--_6dee23e6-a826-48b0-84bf-beca98682f6d_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


Hello Raj=2C
Sorry about the late response.
I think it was just that my path to the linker was the thing causing the pr=
oblem here.
However=2C the botan makefile does work with those standard variables.
I tried changing these variables inside the botan recipe but I suppose they=
 were getting
written over by the makefile.
Thanks.

Simran Gill=20

> Date: Wed=2C 29 Feb 2012 22:46:14 -0800
> From: raj.khem@gmail.com
> To: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] BOTAN crypto library
>=20
> On 02/24/2012 04:15 PM=2C simran singh wrote:
> > Hello=2C
> >=20
> > I hope this is right place to ask for help regarding this. I am trying
> > to build the Botan crytpo library using
> > system builder. I created a recipe for this and I am getting an error
> > when I try to $make the library.
> > This is the error I am getting:
> >=20
> > | /usr/bin/ld:
> > /home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/build_p408=
0ds_release/sysroots/
> > ppce500mc-linux/usr/lib/crti.o: Relocations in generic ELF (EM: 20)
> > | /usr/bin/ld:
> > /home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/build_p408=
0ds_release/sysroots/
> > ppce500mc-linux/usr/lib/crti.o: Relocations in generic ELF (EM: 20)
> > |
> > /home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/build_p408=
0ds_release/sysroots/
> > ppce500mc-linux/usr/lib/crti.o: could not read symbols: File in wrong f=
ormat
> > | collect2: ld returned 1 exit status
> > | make: *** [libbotan-1.10.so.0.1] Error 1
> > | ERROR: Function do_install failed
> >=20
> > I am guessing this has to do something with the linking of the
> > libbotan-1.10.so.0.1 file. Please advice. I have attached
> > the recipe that I created
> > Thank you for any help.
>=20
> so its using your host ld to link target library thats totally broken
> Does botan's makefile system honor standard variables like LD=2C CC=2C CX=
X
> etc. ?
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
 		 	   		  =

--_6dee23e6-a826-48b0-84bf-beca98682f6d_
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
Hello Raj=2C<br>Sorry about the late response.<br>I think it was just that =
my path to the linker was the thing causing the problem here.<br>However=2C=
 the botan makefile does work with those standard variables.<br>I tried cha=
nging these variables inside the botan recipe but I suppose they were getti=
ng<br>written over by the makefile.<br>Thanks.<br><br>Simran Gill <br><br><=
div><div id=3D"ecxSkyDrivePlaceholder"></div>&gt=3B Date: Wed=2C 29 Feb 201=
2 22:46:14 -0800<br>&gt=3B From: raj.khem@gmail.com<br>&gt=3B To: openembed=
ded-core@lists.openembedded.org<br>&gt=3B Subject: Re: [OE-core] BOTAN cryp=
to library<br>&gt=3B <br>&gt=3B On 02/24/2012 04:15 PM=2C simran singh wrot=
e:<br>&gt=3B &gt=3B Hello=2C<br>&gt=3B &gt=3B <br>&gt=3B &gt=3B I hope this=
 is right place to ask for help regarding this. I am trying<br>&gt=3B &gt=
=3B to build the Botan crytpo library using<br>&gt=3B &gt=3B system builder=
. I created a recipe for this and I am getting an error<br>&gt=3B &gt=3B wh=
en I try to $make the library.<br>&gt=3B &gt=3B This is the error I am gett=
ing:<br>&gt=3B &gt=3B <br>&gt=3B &gt=3B | /usr/bin/ld:<br>&gt=3B &gt=3B /ho=
me/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/build_p4080ds_rel=
ease/sysroots/<br>&gt=3B &gt=3B ppce500mc-linux/usr/lib/crti.o: Relocations=
 in generic ELF (EM: 20)<br>&gt=3B &gt=3B | /usr/bin/ld:<br>&gt=3B &gt=3B /=
home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/build_p4080ds_r=
elease/sysroots/<br>&gt=3B &gt=3B ppce500mc-linux/usr/lib/crti.o: Relocatio=
ns in generic ELF (EM: 20)<br>&gt=3B &gt=3B |<br>&gt=3B &gt=3B /home/Simran=
/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/build_p4080ds_release/sysr=
oots/<br>&gt=3B &gt=3B ppce500mc-linux/usr/lib/crti.o: could not read symbo=
ls: File in wrong format<br>&gt=3B &gt=3B | collect2: ld returned 1 exit st=
atus<br>&gt=3B &gt=3B | make: *** [libbotan-1.10.so.0.1] Error 1<br>&gt=3B =
&gt=3B | ERROR: Function do_install failed<br>&gt=3B &gt=3B <br>&gt=3B &gt=
=3B I am guessing this has to do something with the linking of the<br>&gt=
=3B &gt=3B libbotan-1.10.so.0.1 file. Please advice. I have attached<br>&gt=
=3B &gt=3B the recipe that I created<br>&gt=3B &gt=3B Thank you for any hel=
p.<br>&gt=3B <br>&gt=3B so its using your host ld to link target library th=
ats totally broken<br>&gt=3B Does botan's makefile system honor standard va=
riables like LD=2C CC=2C CXX<br>&gt=3B etc. ?<br>&gt=3B <br>&gt=3B <br>&gt=
=3B _______________________________________________<br>&gt=3B Openembedded-=
core mailing list<br>&gt=3B Openembedded-core@lists.openembedded.org<br>&gt=
=3B http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core<b=
r></div> 		 	   		  </div></body>
</html>=

--_6dee23e6-a826-48b0-84bf-beca98682f6d_--
