Return-Path: <christrobridge@hotmail.com>
Received: from DUB004-OMC3S12.hotmail.com (dub004-omc3s12.hotmail.com
	[157.55.2.21])
	by mail.openembedded.org (Postfix) with ESMTP id B79F471E63
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 10:30:29 +0000 (UTC)
Received: from DUB130-W67 ([157.55.2.7]) by DUB004-OMC3S12.hotmail.com over
	TLS secured channel with Microsoft SMTPSVC(7.5.7601.23008); 
	Tue, 9 Feb 2016 02:30:29 -0800
X-TMN: [6/01//+XtjCDKb/WsP719AUmMprtoD8Q]
X-Originating-Email: [christrobridge@hotmail.com]
Message-ID: <DUB130-W6784E5708A3084D22AA513DAD60@phx.gbl>
From: Chris Trobridge <christrobridge@hotmail.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Tue, 9 Feb 2016 10:30:29 +0000
Importance: Normal
In-Reply-To: <CAJTo0LYW=LbsM8kaaqUnukH_p7U1i-EpXcPsekjbjwFooxXW9g@mail.gmail.com>
References: <DUB130-W63DCB3C4CAD84E460BB03FDAE00@phx.gbl>,
	<CAJTo0LYW=LbsM8kaaqUnukH_p7U1i-EpXcPsekjbjwFooxXW9g@mail.gmail.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 09 Feb 2016 10:30:29.0758 (UTC)
	FILETIME=[E5E779E0:01D16324]
Subject: Re: gobject introspection to oe-core
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
X-List-Received-Date: Tue, 09 Feb 2016 10:30:30 -0000
Content-Type: multipart/alternative;
	boundary="_efe3e435-5bc5-4e4e-9803-708e232520a9_"

--_efe3e435-5bc5-4e4e-9803-708e232520a9_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

One thing I failed to mention when I reported on this previously is that I =
needed to patch polkit_0.113.bb:
-DEPENDS =3D "expat glib-2.0 intltool-native gobject-introspection-stub moz=
js"+DEPENDS =3D "expat glib-2.0 intltool-native gobject-introspection mozjs=
"
This seems quite obvious=2C so I am sure you're aware of it.  That was all =
I needed but there are other references to gobject-introspection-stub in:
meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bbmeta-multimedia/recipes-c=
onnectivity/gupnp/gupnp-igd_0.2.2.bbmeta-oe/recipes-devtools/libgee/libgee_=
0.16.1.bbmeta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bbmeta-oe/recipes-su=
pport/upower/upower_0.9.14.bb
Regards=2CChris
 		 	   		  =

--_efe3e435-5bc5-4e4e-9803-708e232520a9_
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
<body class=3D'hmmessage'><div dir=3D'ltr'>One thing I failed to mention wh=
en I reported on this previously is that I needed to patch&nbsp=3B<span sty=
le=3D"font-size: 12pt=3B">polkit_0.113.bb:</span><div><br><div><div><span s=
tyle=3D"font-size: 12pt=3B">-DEPENDS =3D "expat glib-2.0 intltool-native go=
bject-introspection-stub mozjs"</span></div><div>+DEPENDS =3D "expat glib-2=
.0 intltool-native gobject-introspection mozjs"</div></div><div><br></div><=
/div><div>This seems quite obvious=2C so I am sure you're aware of it. &nbs=
p=3BThat was all I needed but there are other references to&nbsp=3B<span st=
yle=3D"font-size: 12pt=3B">gobject-introspection-stub in:</span></div><div>=
<span style=3D"font-size: 12pt=3B"><br></span></div><div><div>meta-gnome/re=
cipes-gnome/libwnck/libwnck_2.31.0.bb</div><div>meta-multimedia/recipes-con=
nectivity/gupnp/gupnp-igd_0.2.2.bb</div><div>meta-oe/recipes-devtools/libge=
e/libgee_0.16.1.bb</div><div>meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.=
bb</div><div>meta-oe/recipes-support/upower/upower_0.9.14.bb</div><div styl=
e=3D"font-size: 12pt=3B"><br></div></div><div style=3D"font-size: 12pt=3B">=
Regards=2C</div><div style=3D"font-size: 12pt=3B">Chris</div><div style=3D"=
font-size: 12pt=3B"><br></div> 		 	   		  </div></body>
</html>=

--_efe3e435-5bc5-4e4e-9803-708e232520a9_--
