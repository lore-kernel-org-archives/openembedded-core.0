Return-Path: <gerharddeclercq@outlook.com>
X-Greylist: delayed 303 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 06 Dec 2015 14:53:25 UTC
Received: from DUB004-OMC3S30.hotmail.com (dub004-omc3s30.hotmail.com
	[157.55.2.39])
	by mail.openembedded.org (Postfix) with ESMTP id DEB75605BB
	for <openembedded-core@lists.openembedded.org>;
	Sun,  6 Dec 2015 14:53:25 +0000 (UTC)
Received: from DUB127-W35 ([157.55.2.9]) by DUB004-OMC3S30.hotmail.com over
	TLS secured channel with Microsoft SMTPSVC(7.5.7601.23008); 
	Sun, 6 Dec 2015 06:48:22 -0800
X-TMN: [I9ZiFoG16i6gv0GO9slEmmxU65vPRR3IeXS6TYw/4pE=]
X-Originating-Email: [gerharddeclercq@outlook.com]
Message-ID: <DUB127-W3511BD769D66A53690A1DEB80A0@phx.gbl>
From: Gerhard de Clercq <gerharddeclercq@outlook.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Sun, 6 Dec 2015 14:48:22 +0000
Importance: Normal
MIME-Version: 1.0
X-OriginalArrivalTime: 06 Dec 2015 14:48:22.0753 (UTC)
	FILETIME=[27AD6510:01D13035]
Subject: Packagegroup breaking sdk
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
X-List-Received-Date: Sun, 06 Dec 2015 14:53:28 -0000
Content-Type: multipart/alternative;
	boundary="_b2da9613-9a9a-469d-b28c-b8f2644678a4_"

--_b2da9613-9a9a-469d-b28c-b8f2644678a4_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I am not sure why this is happening but it seems as if though the packagegr=
oup class is causing generated SDKs to be corrupt on my system. I could run=
 -c populate_sdk just fine on my system and image and the resulting SDK was=
 just fine too.  The problem was that it did not include the needed Qt file=
s. Now I know there is another mailing list for that but I don't think the =
problem lies there. I managed to get the Qt files added by adding TOOLCHAIN=
_HOST_TASK +=3D "nativesdk-packagegroup-qt5-toolchain-host" to my image rec=
ipe. The problem is that this seems to corrupt the SDK installer script bec=
ause with that it fails with "Setting it up...ls: cannot access /usr/local/=
simon/environment-setup-*: No such file or directory" before completing the=
 install thereby rendering it useless. The contents of that file can be see=
n at https://github.com/meta-qt5/meta-qt5/blob/master/recipes-qt/packagegro=
ups/nativesdk-packagegroup-qt5-toolchain-host.bb but I don't think it's imp=
ortant. I tried too delete parts of it in order to determine what was causi=
ng the problem and it seems that the "inherit packagegroup" line was causin=
g the trouble and therefore there must be something wrong that class in oe-=
core. In other words any packagegroup recipe seems to cause this on my syst=
em. Now I realize that if this were a serious problem with openembedded-cor=
e that someone should have picked up on it already and I am therefore led t=
o believe that it comes as a result of some peculiarity in my system. Does =
anyone have any idea what could cause the base recipe to behave like this?
 		 	   		  =

--_b2da9613-9a9a-469d-b28c-b8f2644678a4_
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
<body class=3D'hmmessage'><div dir=3D'ltr'>I am not sure why this is happen=
ing but it seems as if though the packagegroup class is causing generated S=
DKs to be corrupt on my system. I could run -c populate_sdk just fine on my=
 system and image and the resulting SDK was just fine too.&nbsp=3B The prob=
lem was that it did not include the needed Qt files. Now I know there is an=
other mailing list for that but I don't think the problem lies there. I man=
aged to get the Qt files added by adding TOOLCHAIN_HOST_TASK +=3D "nativesd=
k-packagegroup-qt5-toolchain-host" to my image recipe. The problem is that =
this seems to corrupt the SDK installer script because with that it fails w=
ith "Setting it up...ls: cannot access /usr/local/simon/environment-setup-*=
: No such file or directory" before completing the install thereby renderin=
g it useless. The contents of that file can be seen at https://github.com/m=
eta-qt5/meta-qt5/blob/master/recipes-qt/packagegroups/nativesdk-packagegrou=
p-qt5-toolchain-host.bb but I don't think it's important. I tried too delet=
e parts of it in order to determine what was causing the problem and it see=
ms that the "inherit packagegroup" line was causing the trouble and therefo=
re there must be something wrong that class in oe-core. In other words any =
packagegroup recipe seems to cause this on my system. Now I realize that if=
 this were a serious problem with openembedded-core that someone should hav=
e picked up on it already and I am therefore led to believe that it comes a=
s a result of some peculiarity in my system. Does anyone have any idea what=
 could cause the base recipe to behave like this?<br> 		 	   		  </div></bo=
dy>
</html>=

--_b2da9613-9a9a-469d-b28c-b8f2644678a4_--
