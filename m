Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QBm9K-0003gw-70
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Apr 2011 12:57:46 +0200
Received: by wye20 with SMTP id 20so4203016wye.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2011 03:55:22 -0700 (PDT)
Received: by 10.216.65.142 with SMTP id f14mr4789072wed.2.1303124122674;
	Mon, 18 Apr 2011 03:55:22 -0700 (PDT)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id t5sm2512908wes.33.2011.04.18.03.55.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Apr 2011 03:55:22 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 18 Apr 2011 12:55:21 +0200
Message-Id: <43EE53C2-2A83-4F54-B8CF-F0614AB390B0@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1084)
X-Mailer: Apple Mail (2.1084)
Subject: Is BBCLASSEXTEND in .bbappend supposed to work?
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
X-List-Received-Date: Mon, 18 Apr 2011 10:57:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

Martin did some Xorg cleanup in meta-oe today and we're seeing some =
strange behaviour.  The recipe in question:

koen@dominion:/OE/tentacle/sources/meta-openembedded/meta-oe$ cat =
recipes-graphics/xorg-lib/libxrender_0.9.6.bbappend
BBCLASSEXTEND =3D "native nativesdk"
koen@dominion:/OE/tentacle/sources/meta-openembedded/meta-oe$=20

Bitbake-layers tells me:

INFO: libxrender_0.9.6.bb:
INFO:   =
/OE/tentacle/sources/meta-openembedded/meta-oe/recipes-graphics/xorg-lib/l=
ibxrender_0.9.6.bbappend

So the append is getting picked up, but bitbake gives me:

ERROR: Nothing PROVIDES 'libxrender-native'
NOTE: Runtime target 'libnss-mdns' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['libnss-mdns', 'avahi', =
'gtk+', 'gtk+-native', 'libxrender-native']

This is with HEAD of bitbake master.

regards,

Koen=


