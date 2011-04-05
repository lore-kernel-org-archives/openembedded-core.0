Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Q77B0-0007UN-J6
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Apr 2011 16:24:16 +0200
Received: by wye20 with SMTP id 20so394850wye.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Apr 2011 07:21:59 -0700 (PDT)
Received: by 10.216.68.193 with SMTP id l43mr5298405wed.53.1302013319791;
	Tue, 05 Apr 2011 07:21:59 -0700 (PDT)
Received: from [172.20.0.255] (ip545070eb.adsl-surfen.hetnet.nl
	[84.80.112.235])
	by mx.google.com with ESMTPS id g32sm2802153wej.3.2011.04.05.07.21.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 05 Apr 2011 07:21:59 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 5 Apr 2011 16:21:58 +0200
Message-Id: <9A5D9D9C-17D4-44A0-8E20-E7BA913A4678@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1084)
X-Mailer: Apple Mail (2.1084)
Subject: shared-mime-info-native fails to build
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
X-List-Received-Date: Tue, 05 Apr 2011 14:24:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

I've noticed this a few days ago, but it persists with builds from =
scratch:

| CREATED freedesktop.org.xml
| if test -n =
/OE/tentacle/build/tmp-angstrom_2010_x/sysroots/x86_64-linux/usr/bin/xmlli=
nt ; then \
|               if test -e ./freedesktop.org.xml; then \
|               xmllint --noout --valid ./freedesktop.org.xml;  \
|               else \|               xmllint --noout --valid =
./freedesktop.org.xml;  \
|               fi \
|       fi
| ./freedesktop.org.xml:5516: parser error : Extra content at the end of =
the document| </mime-info>-Zeichnung</comment>
|             ^
| make: *** [check] Error 1
| + die 'oe_runmake failed'
| + oefatal 'oe_runmake failed'
| + echo FATAL: 'oe_runmake failed'
| FATAL: oe_runmake failed

Did our xmllint get more strict or have we never run it before?

This is with:

OE Build Configuration:
BB_VERSION        =3D "1.13.0"
METADATA_BRANCH   =3D "master"
METADATA_REVISION =3D "694db055f3729662e0e0193a31f2098be599877f"
TARGET_ARCH       =3D "arm"
TARGET_OS         =3D "linux-gnueabi"
MACHINE           =3D "beagleboard"
DISTRO            =3D "angstrom"
DISTRO_VERSION    =3D "v20110405-core"
TARGET_FPU        =3D "hard"


regards,

Koen=


