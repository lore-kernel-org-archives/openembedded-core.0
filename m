Return-Path: <christrobridge@hotmail.com>
Received: from DUB004-OMC3S26.hotmail.com (dub004-omc3s26.hotmail.com
	[157.55.2.35])
	by mail.openembedded.org (Postfix) with ESMTP id 10F5160796
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jan 2016 11:50:21 +0000 (UTC)
Received: from DUB130-W16 ([157.55.2.7]) by DUB004-OMC3S26.hotmail.com over
	TLS secured channel with Microsoft SMTPSVC(7.5.7601.23008); 
	Mon, 4 Jan 2016 03:50:22 -0800
X-TMN: [gzT7DiSmT5Lmt5RSJd7kElH55p7QMiKF]
X-Originating-Email: [christrobridge@hotmail.com]
Message-ID: <DUB130-W169AB1FBDD4284EB42D7DBDAF20@phx.gbl>
From: Chris Trobridge <christrobridge@hotmail.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Mon, 4 Jan 2016 11:50:21 +0000
Importance: Normal
In-Reply-To: <DUB130-W63DCB3C4CAD84E460BB03FDAE00@phx.gbl>
References: <DUB130-W63DCB3C4CAD84E460BB03FDAE00@phx.gbl>
MIME-Version: 1.0
X-OriginalArrivalTime: 04 Jan 2016 11:50:22.0041 (UTC)
	FILETIME=[1774D490:01D146E6]
Subject: gobject introspection - distccd?
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
X-List-Received-Date: Mon, 04 Jan 2016 11:50:24 -0000
Content-Type: multipart/alternative;
	boundary="_ed56d4b6-1c92-4779-b290-d4fdccc6ea21_"

--_ed56d4b6-1c92-4779-b290-d4fdccc6ea21_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi=2C
I was analysing a target system with gobject-introspection enabled and noti=
ced that it is running 4 instances of distccd.

I can't work out why distcc should be running on the target but it occurred=
 to me that gobject introspection requires target native compilation (using=
 qemu) and that this might be the cause.
I will test this out more thoroughly when I can build yocto again=2C but is=
 it possible the gobject-introspection recipe is somehow causing distcc to =
be added to the target?
Regards=2CChris
 		 	   		  =

--_ed56d4b6-1c92-4779-b290-d4fdccc6ea21_
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
<body class=3D'hmmessage'><div dir=3D'ltr'><div><div dir=3D"ltr">Hi=2C<div>=
<br></div><div>I was analysing a target system with gobject-introspection e=
nabled and noticed that it is running 4 instances of distccd.<br></div><div=
><br></div><div>I can't work out why distcc should be running on the target=
 but it occurred to me that gobject introspection requires target native co=
mpilation (using qemu) and that this might be the cause.</div><div><br></di=
v><div>I will test this out more thoroughly when I can build yocto again=2C=
 but is it possible the gobject-introspection recipe is somehow causing dis=
tcc to be added to the target?</div><div><br></div><div><span style=3D"font=
-size: 12pt=3B">Regards=2C</span></div><div>Chris</div><div><br></div></div=
></div><style><!--=0A=
.ExternalClass .ecxhmmessage P {=0A=
padding:0px=3B=0A=
}=0A=
=0A=
.ExternalClass body.ecxhmmessage {=0A=
font-size:12pt=3B=0A=
font-family:Calibri=3B=0A=
}=0A=
=0A=
--></style> 		 	   		  </div></body>
</html>=

--_ed56d4b6-1c92-4779-b290-d4fdccc6ea21_--
