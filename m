Return-Path: <christrobridge@hotmail.com>
Received: from DUB004-OMC3S34.hotmail.com (dub004-omc3s34.hotmail.com
	[157.55.2.43])
	by mail.openembedded.org (Postfix) with ESMTP id BBDD77318F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jan 2016 07:56:24 +0000 (UTC)
Received: from DUB130-W34 ([157.55.2.9]) by DUB004-OMC3S34.hotmail.com over
	TLS secured channel with Microsoft SMTPSVC(7.5.7601.23008); 
	Mon, 4 Jan 2016 23:56:25 -0800
X-TMN: [GD/MqLjBHa1Xke39PsLCCNGvYxX8/a13]
X-Originating-Email: [christrobridge@hotmail.com]
Message-ID: <DUB130-W34172069DFA8C7DAAB8590DAF30@phx.gbl>
From: Chris Trobridge <christrobridge@hotmail.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Tue, 5 Jan 2016 07:56:24 +0000
Importance: Normal
In-Reply-To: <568A6A49.7030508@linux.intel.com>
References: <DUB130-W63DCB3C4CAD84E460BB03FDAE00@phx.gbl>,
	<DUB130-W169AB1FBDD4284EB42D7DBDAF20@phx.gbl>,
	<CAJTo0LY6MpvHRaZ9teS088jaoSrgb5NLMF32uo7KmXJK0nGppA@mail.gmail.com>,
	<DUB130-W21AF20AA18BC334FB9E61BDAF20@phx.gbl>,
	<568A6A49.7030508@linux.intel.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 05 Jan 2016 07:56:25.0452 (UTC)
	FILETIME=[936912C0:01D1478E]
Subject: Re: gobject introspection - distccd?
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
X-List-Received-Date: Tue, 05 Jan 2016 07:56:26 -0000
Content-Type: multipart/alternative;
	boundary="_1a9fbae6-d4b9-4ded-8f13-c099a14373f6_"

--_1a9fbae6-d4b9-4ded-8f13-c099a14373f6_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Problem solved - nothing to do with gobject introspection but from the othe=
r change I had made=2C to build for qemu.
packagegroup-core-device-devel is pulled in for qemu targets in poky.conf a=
nd packagegroup-core-device-devel rdepends on distcc-config.
> To: openembedded-core@lists.openembedded.org> From: alexander.kanavin@lin=
ux.intel.com
> Date: Mon=2C 4 Jan 2016 14:49:13 +0200
> Subject: Re: [OE-core] gobject introspection - distccd?
>=20
> On 01/04/2016 02:24 PM=2C Chris Trobridge wrote:
> > That's what I was thinking: gobject-introspection doesn't call it in
> > directly but it does require compilation to be performed on the 'target=
'
> > system and that could pull it in indirectly.
>=20
> g-introspection does not require compilation to be performed on the=20
> target. It requires running binaries that were cross-compiled for the=20
> target architecture=2C which is achieved by running them using qemu.

That's what I meant to imply by putting target in quotes.
> > distcc (and hence avahi) are not required=2C so is this a general probl=
em
> > or just something I should explicitly remove from my image?
>=20
> I think it's a problem of your local setup=3B the g-o patchset definitely=
=20
> doesn't involve distcc at any point. You can build against a clean=20
> directory with only basic poky layers to verify that.
>=20
>=20
> Alex

Thanks=2CChris
 		 	   		  =

--_1a9fbae6-d4b9-4ded-8f13-c099a14373f6_
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
<body class=3D'hmmessage'><div dir=3D'ltr'>Problem solved - nothing to do w=
ith gobject introspection but from the other change I had made=2C to build =
for qemu.<div><br></div><div><span style=3D"font-size: 12pt=3B">packagegrou=
p-core-device-devel is pulled in for qemu targets in&nbsp=3B</span>poky.con=
f and&nbsp=3B<span style=3D"font-size: 12pt=3B">packagegroup-core-device-de=
vel rdepends on distcc-config.</span></div><div><br></div><div><span style=
=3D"font-size: 12pt=3B">&gt=3B To: openembedded-core@lists.openembedded.org=
</span></div><div>&gt=3B From: alexander.kanavin@linux.intel.com<br>&gt=3B =
Date: Mon=2C 4 Jan 2016 14:49:13 +0200<br>&gt=3B Subject: Re: [OE-core] gob=
ject introspection - distccd?<br>&gt=3B <br>&gt=3B On 01/04/2016 02:24 PM=
=2C Chris Trobridge wrote:<br>&gt=3B &gt=3B That's what I was thinking: gob=
ject-introspection doesn't call it in<br>&gt=3B &gt=3B directly but it does=
 require compilation to be performed on the 'target'<br>&gt=3B &gt=3B syste=
m and that could pull it in indirectly.<br>&gt=3B <br>&gt=3B g-introspectio=
n does not require compilation to be performed on the <br>&gt=3B target. It=
 requires running binaries that were cross-compiled for the <br>&gt=3B targ=
et architecture=2C which is achieved by running them using qemu.<br><br></d=
iv><div>That's what I meant to imply by putting target in quotes.</div><div=
><br></div><div>&gt=3B &gt=3B distcc (and hence avahi) are not required=2C =
so is this a general problem<br>&gt=3B &gt=3B or just something I should ex=
plicitly remove from my image?<br>&gt=3B <br>&gt=3B I think it's a problem =
of your local setup=3B the g-o patchset definitely <br>&gt=3B doesn't invol=
ve distcc at any point. You can build against a clean <br>&gt=3B directory =
with only basic poky layers to verify that.<br>&gt=3B <br>&gt=3B <br>&gt=3B=
 Alex<br><br></div><div><div>Thanks=2C</div><div>Chris</div><div><br></div>=
</div> 		 	   		  </div></body>
</html>=

--_1a9fbae6-d4b9-4ded-8f13-c099a14373f6_--
