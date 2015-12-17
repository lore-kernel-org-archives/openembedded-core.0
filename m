Return-Path: <christrobridge@hotmail.com>
X-Greylist: delayed 305 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 17 Dec 2015 09:21:51 UTC
Received: from DUB004-OMC3S27.hotmail.com (dub004-omc3s27.hotmail.com
	[157.55.2.36])
	by mail.openembedded.org (Postfix) with ESMTP id 06355605B3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 09:21:50 +0000 (UTC)
Received: from DUB130-W63 ([157.55.2.9]) by DUB004-OMC3S27.hotmail.com over
	TLS secured channel with Microsoft SMTPSVC(7.5.7601.23008); 
	Thu, 17 Dec 2015 01:16:46 -0800
X-TMN: [1+J1aL6o8zg6WYgqoCJZ8u1MWDIiR8zJ]
X-Originating-Email: [christrobridge@hotmail.com]
Message-ID: <DUB130-W63DCB3C4CAD84E460BB03FDAE00@phx.gbl>
From: Chris Trobridge <christrobridge@hotmail.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Thu, 17 Dec 2015 09:16:46 +0000
Importance: Normal
MIME-Version: 1.0
X-OriginalArrivalTime: 17 Dec 2015 09:16:46.0680 (UTC)
	FILETIME=[A73CD580:01D138AB]
Subject: gobject introspection to oe-core
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Dec 2015 09:21:51 -0000
Content-Type: multipart/alternative;
	boundary="_5262bd08-2f4f-4c23-99ca-26d540637fb5_"

--_5262bd08-2f4f-4c23-99ca-26d540637fb5_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi=2C
I have done some testing of Alex's branch "akanavin/gobject-introspection-e=
xperimental"=2C originally http://patchwork.openembedded.org/patch/107089/=
=20
I have built this successfully for x86 and x64 targets on an x64 build mach=
ine:
meta              meta-yocto        meta-yocto-bsp    =3D "akanavin/gobject=
-introspection-experimental:04c7746ce90abc14604dec3328b9472c53cccf98"meta-n=
etworking   meta-oe           meta-python       =3D "master:47f7d287a093297=
34629cb9d194ef4e077117d79"meta-haswell-wc   meta-intel        =3D "master:6=
e91701dcf68f9351db8bb0b92eb2d26af1b8f7f"meta-systemd      =3D "master:47f7d=
287a09329734629cb9d194ef4e077117d79"
Specifically=2C it built for the qemux86=2C qemux86-64 and hasell-wc machin=
es.
I have successfully run my own python3 service=2C which uses python3 dbus a=
nd GObject from gi.repository.
I have also inherited gobject-introspection into modemmanager_1.4.2.bb from=
 meta-oe=2C which fixed the recipe building and I have checked that the tar=
get executable runs but not tested its dbus interface yet.
Regards=2CChris
 		 	   		  =

--_5262bd08-2f4f-4c23-99ca-26d540637fb5_
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
<body class=3D'hmmessage'><div dir=3D'ltr'>Hi=2C<div><br></div><div>I have =
done some testing of Alex's branch "akanavin/gobject-introspection-experime=
ntal"=2C originally&nbsp=3B<a href=3D"http://patchwork.openembedded.org/pat=
ch/107089/=0A=
" target=3D"_blank" style=3D"font-size: 12pt=3B">http://patchwork.openembed=
ded.org/patch/107089/</a><a href=3D"http://patchwork.openembedded.org/patch=
/107089/=0A=
" target=3D"_blank" style=3D"font-size: 12pt=3B">&nbsp=3B</a></div><div><br=
></div><div>I have built this successfully for x86 and x64 targets on an x6=
4 build machine:</div><div><br></div><div><div>meta &nbsp=3B &nbsp=3B &nbsp=
=3B &nbsp=3B &nbsp=3B &nbsp=3B &nbsp=3B</div><div>meta-yocto &nbsp=3B &nbsp=
=3B &nbsp=3B &nbsp=3B</div><div>meta-yocto-bsp &nbsp=3B &nbsp=3B=3D "akanav=
in/gobject-introspection-experimental:04c7746ce90abc14604dec3328b9472c53ccc=
f98"</div><div>meta-networking &nbsp=3B&nbsp=3B</div><div>meta-oe &nbsp=3B =
&nbsp=3B &nbsp=3B &nbsp=3B &nbsp=3B&nbsp=3B</div><div>meta-python &nbsp=3B =
&nbsp=3B &nbsp=3B =3D "master:47f7d287a09329734629cb9d194ef4e077117d79"</di=
v><div><span style=3D"font-size: 12pt=3B">meta-haswell-wc &nbsp=3B&nbsp=3B<=
/span></div><div>meta-intel &nbsp=3B &nbsp=3B &nbsp=3B &nbsp=3B=3D "master:=
6e91701dcf68f9351db8bb0b92eb2d26af1b8f7f"</div><div>meta-systemd &nbsp=3B &=
nbsp=3B &nbsp=3B=3D "master:47f7d287a09329734629cb9d194ef4e077117d79"</div>=
</div><div><br></div><div>Specifically=2C it built for the&nbsp=3Bqemux86=
=2C&nbsp=3Bqemux86-64 and hasell-wc machines.</div><div><br></div><div>I ha=
ve successfully run my own python3 service=2C which uses python3 dbus and G=
Object from gi.repository.</div><div><br></div><div>I have also inherited&n=
bsp=3Bgobject-introspection into&nbsp=3Bmodemmanager_1.4.2.bb from meta-oe=
=2C which fixed the recipe building and I have checked that the target exec=
utable runs but not tested its dbus interface yet.</div><div><br></div><div=
>Regards=2C</div><div>Chris</div><div><br></div> 		 	   		  </div></body>
</html>=

--_5262bd08-2f4f-4c23-99ca-26d540637fb5_--
