Received: from dub0-omc3-s9.dub0.hotmail.com ([157.55.2.18])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric_edwin@hotmail.com>) id 1UWk9R-0007ml-J6
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Apr 2013 11:13:44 +0200
Received: from DUB112-W69 ([157.55.2.8]) by dub0-omc3-s9.dub0.hotmail.com with
	Microsoft SMTPSVC(6.0.3790.4675); Mon, 29 Apr 2013 01:54:46 -0700
X-EIP: [dc30IFtxM+464KovxmwFHSgNzGxUnSYH]
X-Originating-Email: [eric_edwin@hotmail.com]
Message-ID: <DUB112-W69B3F36AA18FADCBA02FB2FCB20@phx.gbl>
From: Eric Edwin <eric_edwin@hotmail.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Mon, 29 Apr 2013 08:54:46 +0000
Importance: Normal
MIME-Version: 1.0
X-OriginalArrivalTime: 29 Apr 2013 08:54:46.0074 (UTC)
	FILETIME=[32B4D9A0:01CE44B7]
Subject: libdrm_2.4.42.bb Error, MACHINE = "spitz"
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Apr 2013 09:13:51 -0000
Content-Type: multipart/alternative;
	boundary="_fb0f8374-a982-4d64-9738-def13be263bc_"

--_fb0f8374-a982-4d64-9738-def13be263bc_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi=2C
I'd appreciate any help=3B I have a recipe I've been using for ~1 year (but=
 haven't built for ~2 months) which when I have tried to build over the pas=
t week has consistently failed with exit code '1'
Details are=3B

bblayers.conf   http://pastebin.com/1ktExTLi=20
error log           http://pastebin.com/gWFH9ZC5=20
console log       http://pastebin.com/5tQetFXB

$ bitbake core-image-x11=20
Build Configuration:BB_VERSION        =3D "1.19.0"BUILD_SYS         =3D "x8=
6_64-linux"NATIVELSBSTRING   =3D "Ubuntu-12.04"TARGET_SYS        =3D "arm-o=
e-linux-gnueabi"MACHINE           =3D "spitz"DISTRO_VERSION    =3D "oe-core=
.0"TUNE_FEATURES     =3D "armv5 thumb dsp"TARGET_FPU        =3D "soft"meta =
             =3D "master:5c8277610ae84740e0724b27f10dba3895d40c05"meta-hand=
held     =3D "master:e74f4a49fa49a9f95dbec7b3f8baaa27ef1347dc"meta-initramf=
s    =3D "master:452d98eb26b798e25be8c49f1a1f798f43da5284"
Summary: 1 task failed:  /home/eric/oe-core/meta/recipes-graphics/drm/libdr=
m_2.4.42.bb=2C do_compileSummary: There was 1 ERROR message shown=2C return=
ing a non-zero exit code.

Best regards=2C=20
Eric=20

 		 	   		  =

--_fb0f8374-a982-4d64-9738-def13be263bc_
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
font-size: 12pt=3B
font-family:Calibri
}
--></style></head>
<body class=3D'hmmessage'><div dir=3D'ltr'>Hi=2C<br>I'd appreciate any help=
=3B I have a recipe I've been using for ~1 year (but haven't built for ~2 m=
onths) which when I have tried to build over the past week has consistently=
 failed with exit code '1'<br>Details are=3B<br><br>bblayers.conf&nbsp=3B&n=
bsp=3B http://pastebin.com/1ktExTLi <br>error log&nbsp=3B&nbsp=3B&nbsp=3B&n=
bsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B http://pastebin.com/=
gWFH9ZC5 <br>console log&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B ht=
tp://pastebin.com/5tQetFXB<br><br><blockquote>$ bitbake core-image-x11&nbsp=
=3B<div class=3D"de1"><br>Build Configuration:</div><div class=3D"de2">BB_V=
ERSION &nbsp=3B &nbsp=3B &nbsp=3B &nbsp=3B=3D "1.19.0"</div><div class=3D"d=
e1">BUILD_SYS &nbsp=3B &nbsp=3B &nbsp=3B &nbsp=3B =3D "x86_64-linux"</div><=
div class=3D"de2">NATIVELSBSTRING &nbsp=3B =3D "Ubuntu-12.04"</div><div cla=
ss=3D"de1">TARGET_SYS &nbsp=3B &nbsp=3B &nbsp=3B &nbsp=3B=3D "arm-oe-linux-=
gnueabi"</div><div class=3D"de2">MACHINE &nbsp=3B &nbsp=3B &nbsp=3B &nbsp=
=3B &nbsp=3B =3D "spitz"</div><div class=3D"de1">DISTRO_VERSION &nbsp=3B &n=
bsp=3B=3D "oe-core.0"</div><div class=3D"de2">TUNE_FEATURES &nbsp=3B &nbsp=
=3B =3D "armv5 thumb dsp"</div><div class=3D"de1">TARGET_FPU &nbsp=3B &nbsp=
=3B &nbsp=3B &nbsp=3B=3D "soft"</div><div class=3D"de2">meta &nbsp=3B &nbsp=
=3B &nbsp=3B &nbsp=3B &nbsp=3B &nbsp=3B &nbsp=3B=3D "master:5c8277610ae8474=
0e0724b27f10dba3895d40c05"</div><div class=3D"de1">meta-handheld &nbsp=3B &=
nbsp=3B =3D "master:e74f4a49fa49a9f95dbec7b3f8baaa27ef1347dc"</div><div cla=
ss=3D"de2">meta-initramfs &nbsp=3B &nbsp=3B=3D "master:452d98eb26b798e25be8=
c49f1a1f798f43da5284"</div><br><div class=3D"de2">Summary: 1 task failed:</=
div><div class=3D"de1">&nbsp=3B /home/eric/oe-core/meta/recipes-graphics/dr=
m/libdrm_2.4.42.bb=2C do_compile</div><div class=3D"de2">Summary: There was=
 1 ERROR message shown=2C returning a non-zero exit code.</div></blockquote=
><br><br>Best regards=2C <br>Eric <br><br> 		 	   		  </div></body>
</html>=

--_fb0f8374-a982-4d64-9738-def13be263bc_--
