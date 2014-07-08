Return-Path: <ticotimo@gmail.com>
Received: from mail-la0-f41.google.com (mail-la0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id A3F766FED8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jul 2014 04:54:26 +0000 (UTC)
Received: by mail-la0-f41.google.com with SMTP id hz20so3607434lab.28
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jul 2014 21:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=PjzDutIrGSl2Z3vuvGkJ/zBtNORAIQSsJVYZ63qyfzQ=;
	b=WolhzsJi4+N7A28SkggiqGPOkgfVzRqbIx05T7xg2K+OQpJoF4dLzdo4yeEMMXmT6X
	r8f3QG+S4Hbki+m7ky2mhWNf7k2X9a1QCMcuGpNoqSYXlInolTX/Rs5bZJcF2vU2j7Ui
	MMSIcilqz3O1pssomnY99IJ7UYIi9VMxOGZ3iu2CwFQli/AIDFIGSgeuVH20eHEMvF7U
	sG/ww0qGmbZG+u4GnFK+/hx7S0N6x4BrKIzeoAss56qneSLxKae4ekX6CvB6ViKf4zsH
	YR3DM7oGXanm5r7mRTnrrqyl494zt9dkqkEO0iiJug34zGpV20IiXoSdwtHPmqh3RXtq
	8l/w==
MIME-Version: 1.0
X-Received: by 10.152.204.102 with SMTP id kx6mr26799836lac.32.1404795267450; 
	Mon, 07 Jul 2014 21:54:27 -0700 (PDT)
Received: by 10.114.216.35 with HTTP; Mon, 7 Jul 2014 21:54:27 -0700 (PDT)
Date: Mon, 7 Jul 2014 21:54:27 -0700
Message-ID: <CANx9H-BF_O_+YVW7V4XBVLBn3mQWGhVaN+FjZQ_YGxOTeMpcNg@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: [WIP] cpanm.bbclass: need help with paths
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
X-List-Received-Date: Tue, 08 Jul 2014 04:54:30 -0000
Content-Type: multipart/alternative; boundary=001a1134386ae60cb704fda76233

--001a1134386ae60cb704fda76233
Content-Type: text/plain; charset=UTF-8

DO NOT MERGE

In the following branch, I am trying to create a bbclass for cpanm (aka
cpanminus), based heavily on cpan_build.bbclass:
http://git.openembedded.org/openembedded-core-contrib/log/?h=timo/cpanminus

However, as it stands, it always seems to use host paths, not even
perl-native. Ultimately, it needs to install in both perl-native and
target's vendor_perl.

Any insight is appreciated!

--Tim

P.S. The class is to be used to build Slic3r. Currently the cpanm version
of the recipe is only local WIP, but I have a building non-cpanm (XS only)
version publicly available:
http://git.openembedded.org/meta-openembedded-contrib/log/?h=timo/meta-maker

--001a1134386ae60cb704fda76233
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div>DO NOT MERGE<br><br></div><div>In=
 the following branch, I am trying to create a bbclass for cpanm (aka cpanm=
inus), based heavily on cpan_build.bbclass:<br></div><a href=3D"http://git.=
openembedded.org/openembedded-core-contrib/log/?h=3Dtimo/cpanminus">http://=
git.openembedded.org/openembedded-core-contrib/log/?h=3Dtimo/cpanminus</a><=
br>
<br></div>However, as it stands, it always seems to use host paths, not eve=
n perl-native. Ultimately, it needs to install in both perl-native and targ=
et&#39;s vendor_perl.<br><br></div>Any insight is appreciated!<br><br></div=
>
--Tim<br><br></div><div>P.S. The class is to be used to build Slic3r. Curre=
ntly the cpanm version of the recipe is only local WIP, but I have a buildi=
ng non-cpanm (XS only) version publicly available:<br><a href=3D"http://git=
.openembedded.org/meta-openembedded-contrib/log/?h=3Dtimo/meta-maker">http:=
//git.openembedded.org/meta-openembedded-contrib/log/?h=3Dtimo/meta-maker</=
a><br>
</div></div>

--001a1134386ae60cb704fda76233--
