Return-Path: <christrobridge@hotmail.com>
X-Greylist: delayed 307 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 04 Jan 2016 12:29:22 UTC
Received: from DUB004-OMC2S16.hotmail.com (dub004-omc2s16.hotmail.com
	[157.55.1.155])
	by mail.openembedded.org (Postfix) with ESMTP id ECCFA60621
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jan 2016 12:29:22 +0000 (UTC)
Received: from DUB130-W21 ([157.55.1.137]) by DUB004-OMC2S16.hotmail.com over
	TLS secured channel with Microsoft SMTPSVC(7.5.7601.23008); 
	Mon, 4 Jan 2016 04:24:15 -0800
X-TMN: [ahNaeULsFQBWuyn7Okpf0u2xIxBhdKFb]
X-Originating-Email: [christrobridge@hotmail.com]
Message-ID: <DUB130-W21AF20AA18BC334FB9E61BDAF20@phx.gbl>
From: Chris Trobridge <christrobridge@hotmail.com>
To: "Burton, Ross" <ross.burton@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Mon, 4 Jan 2016 12:24:15 +0000
Importance: Normal
In-Reply-To: <CAJTo0LY6MpvHRaZ9teS088jaoSrgb5NLMF32uo7KmXJK0nGppA@mail.gmail.com>
References: <DUB130-W63DCB3C4CAD84E460BB03FDAE00@phx.gbl>,
	<DUB130-W169AB1FBDD4284EB42D7DBDAF20@phx.gbl>,
	<CAJTo0LY6MpvHRaZ9teS088jaoSrgb5NLMF32uo7KmXJK0nGppA@mail.gmail.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 04 Jan 2016 12:24:15.0909 (UTC)
	FILETIME=[D3BC7550:01D146EA]
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
X-List-Received-Date: Mon, 04 Jan 2016 12:29:23 -0000
Content-Type: multipart/alternative;
	boundary="_f63467f3-08e4-4978-b129-189712aece10_"

--_f63467f3-08e4-4978-b129-189712aece10_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

=0A=
=0A=
=0A=
That's what I was thinking: gobject-introspection doesn't call it in direct=
ly but it does require compilation to be performed on the 'target' system a=
nd that could pull it in indirectly.
distcc (and hence avahi) are not required=2C so is this a general problem o=
r just something I should explicitly remove from my image?
Chris

From: ross.burton@intel.comDate: Mon=2C 4 Jan 2016 12:03:44 +0000Subject: R=
e: [OE-core] gobject introspection - distccd?To: christrobridge@hotmail.com=
CC: openembedded-core@lists.openembedded.org

On 4 January 2016 at 11:50=2C Chris Trobridge <christrobridge@hotmail.com> =
wrote:I will test this out more thoroughly when I can build yocto again=2C =
but is it possible the gobject-introspection recipe is somehow causing dist=
cc to be added to the target?
More likely some of the existing packagegroups which add distcc for conveni=
ence=2C such as packagegroup-self-hosted or packagegroup-core-device-devel.
Ross=0A=
 		 	   		  =

--_f63467f3-08e4-4978-b129-189712aece10_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
</head>
<body class=3D'hmmessage'><div dir=3D'ltr'>=0A=
=0A=
<style><!--=0A=
.hmmessage P=0A=
{=0A=
margin:0px=3B=0A=
padding:0px=0A=
}=0A=
body.hmmessage=0A=
{=0A=
font-size: 12pt=3B=0A=
font-family:Calibri=0A=
}=0A=
--></style>=0A=
<div dir=3D"ltr">That's what I was thinking: gobject-introspection doesn't =
call it in directly but it does require compilation to be performed on the =
'target' system and that could pull it in indirectly.<div><br></div><div>di=
stcc (and hence avahi) are not required=2C so is this a general problem or =
just something I should explicitly remove from my image?</div><div><br></di=
v><div>Chris<br></div><br><div><blockquote style=3D"margin: 0 0 0 40px=3B b=
order: none=3B padding: 0px=3B"><div><hr id=3D"stopSpelling"></div><div>Fro=
m: ross.burton@intel.com</div><div>Date: Mon=2C 4 Jan 2016 12:03:44 +0000</=
div><div>Subject: Re: [OE-core] gobject introspection - distccd?</div><div>=
To: christrobridge@hotmail.com</div><div>CC: openembedded-core@lists.openem=
bedded.org</div><div><br></div><div><div dir=3D"ltr"><div class=3D"ecxgmail=
_extra"><br></div></div></div><div><div dir=3D"ltr"><div class=3D"ecxgmail_=
extra"><div class=3D"ecxgmail_quote">On 4 January 2016 at 11:50=2C Chris Tr=
obridge <span dir=3D"ltr">&lt=3B<a href=3D"mailto:christrobridge@hotmail.co=
m" target=3D"_blank">christrobridge@hotmail.com</a>&gt=3B</span> wrote:</di=
v></div></div></div><div><div dir=3D"ltr"><div class=3D"ecxgmail_extra"><di=
v class=3D"ecxgmail_quote"><blockquote class=3D"ecxgmail_quote" style=3D"bo=
rder-left:1px #ccc solid=3Bpadding-left:1ex=3B"><div>I will test this out m=
ore thoroughly when I can build yocto again=2C but is it possible the gobje=
ct-introspection recipe is somehow causing distcc to be added to the target=
?</div></blockquote></div></div></div></div><div><div dir=3D"ltr"><div clas=
s=3D"ecxgmail_extra"><br></div></div></div><div><div dir=3D"ltr"><div class=
=3D"ecxgmail_extra">More likely some of the existing packagegroups which ad=
d distcc for convenience=2C such as packagegroup-self-hosted or packagegrou=
p-core-device-devel.</div></div></div><div><div dir=3D"ltr"><div class=3D"e=
cxgmail_extra"><br></div></div></div><div><div dir=3D"ltr"><div class=3D"ec=
xgmail_extra">Ross</div></div></div></blockquote></div><div><div dir=3D"ltr=
"><div class=3D"ecxgmail_extra"><div class=3D"ecxgmail_quote"><blockquote c=
lass=3D"ecxgmail_quote" style=3D"border-left:1px #ccc solid=3Bpadding-left:=
1ex=3B"><div></div></blockquote></div></div></div></div></div>=0A=
 		 	   		  </div></body>
</html>=

--_f63467f3-08e4-4978-b129-189712aece10_--
