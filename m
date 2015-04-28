Return-Path: <ticotimo@gmail.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 076C872A85
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 15:25:40 +0000 (UTC)
Received: by igbhj9 with SMTP id hj9so23907851igb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 08:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=9jjj/XGH5/yPeRIxZfsD2h0QscMK7DfA8DouH7dVgQ0=;
	b=RAmD6oYbWIcDvUvVDOUIvhfxOba+kNWnzqloBEFgEcKdAHMWMLFIyim0VRgsmJLEPa
	B9gfTKVvLdbAiKZs+2QEs232h7+h+L52AZHIHsQ9iNpLv2gFgVdLOEx1SkIgYFxTPauk
	tKLwqdTl0IlOPA9Tgb/fhCz2OWaMsF6lFNIy0PhFImKp37m4y6BVBlg/g4M/tzFMw/jg
	Rpj+LUKTMW5dcGqbYvHH3Q4KKBZK3AF803mKyqtM/g76MQOeafjoItCxWTR96FXfVOKc
	3Y6pZUUPVjhbFSphSvbhFS+3e+1KvPHeuARYfnBWQXJurhT/bYpp90rRdGNjobho6/5d
	noSQ==
MIME-Version: 1.0
X-Received: by 10.107.154.70 with SMTP id c67mr21369177ioe.22.1430234741760;
	Tue, 28 Apr 2015 08:25:41 -0700 (PDT)
Received: by 10.36.106.202 with HTTP; Tue, 28 Apr 2015 08:25:41 -0700 (PDT)
Date: Tue, 28 Apr 2015 08:25:41 -0700
Message-ID: <CANx9H-COq8yNzRKWhksM88QiuKFbCCfHKPUEtsqsqMjpGMnXVQ@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: [WIP][RFT] cogl/clutter/libinput/wayland/weston updates
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
X-List-Received-Date: Tue, 28 Apr 2015 15:25:42 -0000
Content-Type: multipart/alternative; boundary=001a1140fafaba67920514ca795e

--001a1140fafaba67920514ca795e
Content-Type: text/plain; charset=UTF-8

The following branch includes updates to the latest releases for cogl,
clutter, wayland, weston and libinput:

http://git.openembedded.org/openembedded-core-contrib/log/?h=timo/cogl-clutter-wayland-weston-updates

wayland and weston appear to be fine as tested on nuc.
clutter ptests pass, but all examples segfault...possibly a problem in cogl.

I would appreciate tests on other platforms and any insight into the
segfaults.

--Tim

--001a1140fafaba67920514ca795e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>The following branch includes updates to th=
e latest releases for cogl, clutter, wayland, weston and libinput:<br><br><=
a href=3D"http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dti=
mo/cogl-clutter-wayland-weston-updates" target=3D"_blank">http://git.openem=
bedded.org/openembedded-core-contrib/log/?h=3Dtimo/cogl-clutter-wayland-wes=
ton-updates</a><br><br></div>wayland and weston appear to be fine as tested=
 on nuc.<br></div>clutter ptests pass, but all examples segfault...possibly=
 a problem in cogl.<br><br></div><div>I would appreciate tests on other pla=
tforms and any insight into the segfaults.<br><br></div><div>--Tim<br></div=
><div><br><br></div></div>

--001a1140fafaba67920514ca795e--
