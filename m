Received: from 1.mo5.mail-out.ovh.net ([188.165.57.91]
	helo=mo5.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1R6MTf-000629-8d
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Sep 2011 15:04:39 +0200
Received: from mail434.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo5.mail-out.ovh.net (Postfix) with SMTP id 022B610085CE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2011 14:57:09 +0200 (CEST)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 21 Sep 2011 14:52:48 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 21 Sep 2011 14:52:46 +0200
Message-ID: <4E79DE1D.5000303@eukrea.com>
Date: Wed, 21 Sep 2011 14:52:45 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.2) Gecko/20110902 Thunderbird/6.0.2
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Ovh-Mailout: 178.32.228.5 (mo5.mail-out.ovh.net)
References: <20110911172241.GA3674@chargestorm.se>
	<4E7246EB.2070607@eukrea.com>
	<CAP9ODKqCc3zAuwBoL7Yiet0GKuJKFymZMtStkpwAq88b=ZGibw@mail.gmail.com>
	<201109161212.19780.paul.eggleton@linux.intel.com>
	<4E733F7D.6090109@eukrea.com>
	<CAP9ODKo9-6qHhCWfWS5_GXrNxw38VCXjzih2hdoWRQ9vY3MVFg@mail.gmail.com>
	<DD23E745-87D9-4831-85D4-C038CD79DCF7@dominion.thruhere.net>
	<CAP9ODKoemW81Sob3uUe-1LedWXcoJqEdkUGTj-+ZjgrUsytb_Q@mail.gmail.com>
	<49A59D49-5FF1-4F8D-A259-F6F8CA42ADC9@dominion.thruhere.net>
	<CAP9ODKpbVD-2AyXEMQG9D=6=F1n2kC-J=jOU7EPc2hWa_bjq6A@mail.gmail.com>
	<1316437421.14488.13.camel@ted> <4E77990A.5080504@eukrea.com>
	<4E790328.2010604@eukrea.com>
	<CFEB0FCC-7E86-49A1-87AB-E9E43FBAA094@dominion.thruhere.net>
In-Reply-To: <CFEB0FCC-7E86-49A1-87AB-E9E43FBAA094@dominion.thruhere.net>
X-Ovh-Tracer-Id: 16004948650911575490
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -80
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeftddrvddtucetggdotefuucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegfrhhlucfvnfffucdlvddtmd
Subject: Re: [PATCH] qt4: update to latest version 4.7.4
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Sep 2011 13:04:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Koen,

Le 21/09/2011 12:44, Koen Kooi a =E9crit :
> Op 20 sep. 2011, om 23:18 heeft Eric B=E9nard het volgende geschreven:
>> ok 2 branches are available here : git://github.com/eukrea/oe-core.git
>> - qt4_improve for improvement to existing qt 4.7.3,
>> - qt4_upgrade for adding qt 4.7.4 (with DEFAULT_PREFERENCE=3D-1 as sug=
gested by Koen.
>>
>> Please test them so that we can fix potential failures and send the pu=
ll request (I have compile test actually running with the latest changes =
in qt4_upgrade branch so this one is not yet fully tested).
>
> I'm building the qt4_upgrade branch + http://patches.openembedded.org/p=
atch/11289/ + PREFERRED_VERSION change in angstrom. If you don't hear any=
thing the test went OK :)

in angstrom you also need to add :
+PREFERRED_VERSION_qt4-native =3D "${ANGSTROM_QT_VERSION}"
else qt4-native 4.7.3 will be used.

Eric

diff --git a/conf/distro/include/angstrom-2010-preferred-versions.inc b/c=
onf/dis
index 2fee7f1..8bbdb4d 100644
--- a/conf/distro/include/angstrom-2010-preferred-versions.inc
+++ b/conf/distro/include/angstrom-2010-preferred-versions.inc
@@ -1,5 +1,5 @@
  ANGSTROM_MESA_VERSION =3D "7.10.2"
-ANGSTROM_QT_VERSION ?=3D "4.7.3"
+ANGSTROM_QT_VERSION ?=3D "4.7.4"
  ANGSTROM_LIBTOOL_VERSION =3D "2.4"
  # Use new sysroot feature
  LIBTOOL_HAS_SYSROOT =3D "yes"
@@ -49,6 +49,7 @@ PREFERRED_VERSION_pkgconfig   =3D "0.25"
  PREFERRED_VERSION_pkgconfig-native =3D "0.25"
  PREFERRED_VERSION_pulseaudio   =3D "0.9.23"
  PREFERRED_VERSION_python-pycairo =3D "1.8.0"
+PREFERRED_VERSION_qt4-native =3D "${ANGSTROM_QT_VERSION}"
  PREFERRED_VERSION_qt4-tools-native =3D "${ANGSTROM_QT_VERSION}"
  PREFERRED_VERSION_qt4-tools-sdk =3D "${ANGSTROM_QT_VERSION}"
  PREFERRED_VERSION_qt4-embedded =3D "${ANGSTROM_QT_VERSION}"


