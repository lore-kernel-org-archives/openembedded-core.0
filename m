Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id C024A72A78
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 15:46:58 +0000 (UTC)
Received: by pdea3 with SMTP id a3so167665414pde.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 08:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=lP90x9Ep/vGJFjDSb3Kxp7WNIMqQ8nnCvE8diBB+EIs=;
	b=loBHVfyNzVE2OLAHhdiX9VFA/E4d1QC2FsSOZsNPdwtJZce3BHqHfd9A1vEzeTnGIn
	qiVqDPtYaelxIEYRO+G76E6OINM4bTYslhIq9NY8dwMUHXCJosIuTDBsBJrRQkaKPqZO
	zb/qdzVkl81B4jcXMqYAZQ9KXp9xhlBsshoinHEtNHFbnwk/5uKZfAgm54oZ36YY2fiH
	bdVVupFL5Dpw2mZ8lBj2KXJ4joZdjQAtJZ61GFconpxAPmje1KCs6VqPbrsYwfe2RhDh
	HQ/9TnCFPvq/j9+REmrthp6fV6/31BMyn8MV5H4Ue4HsQW2gkQOSdc3qtXWbGVSE40jJ
	E4eA==
X-Received: by 10.66.179.81 with SMTP id de17mr33100240pac.59.1430236020216;
	Tue, 28 Apr 2015 08:47:00 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:7813:a361:335f:d8e1?
	([2601:9:3580:84c:7813:a361:335f:d8e1])
	by mx.google.com with ESMTPSA id
	id2sm22746480pbb.56.2015.04.28.08.46.59
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 28 Apr 2015 08:46:59 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CANx9H-COq8yNzRKWhksM88QiuKFbCCfHKPUEtsqsqMjpGMnXVQ@mail.gmail.com>
Date: Tue, 28 Apr 2015 08:46:58 -0700
Message-Id: <73D9548F-A53A-4223-B028-D116F8EDF929@gmail.com>
References: <CANx9H-COq8yNzRKWhksM88QiuKFbCCfHKPUEtsqsqMjpGMnXVQ@mail.gmail.com>
To: Tim Orling <ticotimo@gmail.com>
X-Mailer: Apple Mail (2.2098)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [WIP][RFT] cogl/clutter/libinput/wayland/weston updates
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
X-List-Received-Date: Tue, 28 Apr 2015 15:47:00 -0000
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_06D06824-0447-46FC-BCBA-F0E47ADC456F"

--Apple-Mail=_06D06824-0447-46FC-BCBA-F0E47ADC456F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Apr 28, 2015, at 8:25 AM, Tim Orling <ticotimo@gmail.com> wrote:
>=20
> The following branch includes updates to the latest releases for cogl, =
clutter, wayland, weston and libinput:
>=20
> =
http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dtimo/cogl-c=
lutter-wayland-weston-updates =
<http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dtimo/cogl-=
clutter-wayland-weston-updates>
>=20
> wayland and weston appear to be fine as tested on nuc.

I have had wayland/weston updates lying on my tree for some time now

=
http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dkraj/mas=
ter&id=3Deb52e9e6756641cd5b1ebbff0e82dcf6f1aa5c9b =
<http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dkraj/ma=
ster&id=3Deb52e9e6756641cd5b1ebbff0e82dcf6f1aa5c9b>

tried git versions too
=
http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dkraj/mas=
ter&id=3D992c13dcd4b79fe64f4f9b8122627f918257ccef =
<http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dkraj/ma=
ster&id=3D992c13dcd4b79fe64f4f9b8122627f918257ccef>

There are problem with emulator with 1.7 and libinput I guess where the =
mouse does not work
in qemux86 as well as qemux86-64, it works fine with 1.6, I have tested =
all versions 0.8 and newer of lib input
for no success. That was the reason I did not propose those patches.

> clutter ptests pass, but all examples segfault...possibly a problem in =
cogl.
>=20
> I would appreciate tests on other platforms and any insight into the =
segfaults.
>=20
> --Tim
>=20
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_06D06824-0447-46FC-BCBA-F0E47ADC456F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Apr 28, 2015, at 8:25 AM, Tim Orling &lt;<a =
href=3D"mailto:ticotimo@gmail.com" class=3D"">ticotimo@gmail.com</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><div =
dir=3D"ltr" class=3D""><div class=3D""><div class=3D""><div class=3D"">The=
 following branch includes updates to the latest releases for cogl, =
clutter, wayland, weston and libinput:<br class=3D""><br class=3D""><a =
href=3D"http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dtim=
o/cogl-clutter-wayland-weston-updates" target=3D"_blank" =
class=3D"">http://git.openembedded.org/openembedded-core-contrib/log/?h=3D=
timo/cogl-clutter-wayland-weston-updates</a><br class=3D""><br =
class=3D""></div>wayland and weston appear to be fine as tested on =
nuc.<br class=3D""></div></div></div></div></blockquote><div><br =
class=3D""></div><div>I have had wayland/weston updates lying on my tree =
for some time now</div><div><br class=3D""></div><div></div><div><a =
href=3D"http://git.openembedded.org/openembedded-core-contrib/commit/?h=3D=
kraj/master&amp;id=3Deb52e9e6756641cd5b1ebbff0e82dcf6f1aa5c9b" =
class=3D"">http://git.openembedded.org/openembedded-core-contrib/commit/?h=
=3Dkraj/master&amp;id=3Deb52e9e6756641cd5b1ebbff0e82dcf6f1aa5c9b</a></div>=
<div><br class=3D""></div><div>tried git versions too</div><div><a =
href=3D"http://git.openembedded.org/openembedded-core-contrib/commit/?h=3D=
kraj/master&amp;id=3D992c13dcd4b79fe64f4f9b8122627f918257ccef" =
class=3D"">http://git.openembedded.org/openembedded-core-contrib/commit/?h=
=3Dkraj/master&amp;id=3D992c13dcd4b79fe64f4f9b8122627f918257ccef</a></div>=
<div><br class=3D""></div><div>There are problem with emulator with 1.7 =
and libinput I guess where the mouse does not work</div><div>in qemux86 =
as well as qemux86-64, it works fine with 1.6, I have tested all =
versions 0.8 and newer of lib input</div><div>for no success. That was =
the reason I did not propose those patches.</div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D""><div =
dir=3D"ltr" class=3D""><div class=3D"">clutter ptests pass, but all =
examples segfault...possibly a problem in cogl.<br class=3D""><br =
class=3D""></div><div class=3D"">I would appreciate tests on other =
platforms and any insight into the segfaults.<br class=3D""><br =
class=3D""></div><div class=3D"">--Tim<br class=3D""></div><div =
class=3D""><br class=3D""><br class=3D""></div></div>
-- <br class=3D"">_______________________________________________<br =
class=3D"">Openembedded-core mailing list<br class=3D""><a =
href=3D"mailto:Openembedded-core@lists.openembedded.org" =
class=3D"">Openembedded-core@lists.openembedded.org</a><br =
class=3D"">http://lists.openembedded.org/mailman/listinfo/openembedded-cor=
e<br class=3D""></div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_06D06824-0447-46FC-BCBA-F0E47ADC456F--
