Return-Path: <christrobridge@hotmail.com>
Received: from DUB004-OMC3S36.hotmail.com (dub004-omc3s36.hotmail.com
	[157.55.2.45])
	by mail.openembedded.org (Postfix) with ESMTP id 0873E6FFE5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 11:13:56 +0000 (UTC)
Received: from DUB130-W17 ([157.55.2.7]) by DUB004-OMC3S36.hotmail.com over
	TLS secured channel with Microsoft SMTPSVC(7.5.7601.23008); 
	Mon, 11 Jan 2016 03:13:56 -0800
X-TMN: [E7oqH2+kaHg03COBQYdmCv6HN0USmuR8]
X-Originating-Email: [christrobridge@hotmail.com]
Message-ID: <DUB130-W1779730C543EF8ECE041E9DAC90@phx.gbl>
From: Chris Trobridge <christrobridge@hotmail.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Mon, 11 Jan 2016 11:13:56 +0000
Importance: Normal
MIME-Version: 1.0
X-OriginalArrivalTime: 11 Jan 2016 11:13:56.0928 (UTC)
	FILETIME=[29EB4C00:01D14C61]
Subject: Handliong Duplicate Files
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
X-List-Received-Date: Mon, 11 Jan 2016 11:13:57 -0000
Content-Type: multipart/alternative;
	boundary="_87cba88e-0661-44a9-953d-d7fbc57f3dca_"

--_87cba88e-0661-44a9-953d-d7fbc57f3dca_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi=2C
I have been looking into producing a 'python3-dbus' recipe=2C based on the =
python-dbus recipe.
This recipe outputs a couple of files that are version independent but end =
up overlapping and causing the build to fail:/usr/lib/pkgconfig/dbus-python=
.pc/usr/include/dbus-1.0/dbus/dbus-python.h
These files are currently marked as python-version independent - the header=
 file has #ifdefs for python3.
The immediate 'fix' was to follow the advice in the error text to add the f=
ile paths to SSTATE_DUPWHITELIST.
SSTATE_DUPWHITELIST is not mentioned much elsewhere and does not seem like =
a scalable solution.  Is there a preferred method to resolve the situation =
where two recipes install the same files?
Thanks=2CChris
 		 	   		  =

--_87cba88e-0661-44a9-953d-d7fbc57f3dca_
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
been looking into producing a 'python3-dbus' recipe=2C based on the&nbsp=3B=
python-dbus recipe.</div><div><br></div><div>This recipe outputs a couple o=
f files that are version independent but end up overlapping and causing the=
 build to fail:</div><div><div>/usr/lib/pkgconfig/dbus-python.pc</div></div=
><div><div>/usr/include/dbus-1.0/dbus/dbus-python.h</div></div><div><br></d=
iv><div>These files are currently marked as python-version independent - th=
e header file has #ifdefs for python3.</div><div><br></div><div>The immedia=
te 'fix' was to follow the advice in the error text to add the file paths t=
o&nbsp=3BSSTATE_DUPWHITELIST.</div><div><br></div><div>SSTATE_DUPWHITELIST =
is not mentioned much elsewhere and does not seem like a scalable solution.=
 &nbsp=3BIs there a preferred method to resolve the situation where two rec=
ipes install the same files?</div><div><br></div><div>Thanks=2C</div><div>C=
hris</div><div><br></div> 		 	   		  </div></body>
</html>=

--_87cba88e-0661-44a9-953d-d7fbc57f3dca_--
