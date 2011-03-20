Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Q1GUi-0005Rz-0z
	for openembedded-core@lists.openembedded.org;
	Sun, 20 Mar 2011 12:08:24 +0100
Received: by wwi18 with SMTP id 18so2445028wwi.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Mar 2011 04:06:36 -0700 (PDT)
Received: by 10.216.239.200 with SMTP id c50mr3061581wer.8.1300619195980;
	Sun, 20 Mar 2011 04:06:35 -0700 (PDT)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id
	a50sm2198870wer.18.2011.03.20.04.06.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 20 Mar 2011 04:06:35 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sun, 20 Mar 2011 12:06:34 +0100
Message-Id: <71E89804-8B25-4810-95EE-C9B1880C0103@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1082)
X-Mailer: Apple Mail (2.1082)
Subject: Qemu-native requires alsa-libs-native
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
X-List-Received-Date: Sun, 20 Mar 2011 11:08:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

While attempting to build the qemuarm machine in oe-core I get this:

| + =
/OE/tentacle/build/tmp-angstrom_2010_x/work/x86_64-linux/qemu-native-0.13.=
0-r1/qemu-0.13.0/configure =
--prefix=3D/OE/tentacle/build/tmp-angstrom_2010_x/sysroots/x86_64-linux/us=
r =
--target-list=3Darm-linux-user,arm-softmmu,i386-linux-user,i386-softmmu,x8=
6_64-linux-user,x86_64-softmmu,mips-linux-user,mips-softmmu,ppc-linux-user=
,ppc-softmmu,mipsel-linux-user --disable-werror --disable-vnc-tls =
--enable-kvm --audio-drv-list=3Doss,alsa --audio-card-list=3Dac97,es1370
|=20
| Error: alsa check failed
| Make sure to have the alsa libs and headers installed.

But there's not alsa-libs-native in OE-core. Should we add such a recipe =
or disable also in qemu?

That's with:

OE Build Configuration:
BB_VERSION        =3D "1.13.0"
METADATA_BRANCH   =3D "master"
METADATA_REVISION =3D "f0afe5827570eff5442d2f9a9846b4098e5c3333"
TARGET_ARCH       =3D "arm"
TARGET_OS         =3D "linux-gnueabi"
MACHINE           =3D "qemuarm"
DISTRO            =3D "angstrom"
DISTRO_VERSION    =3D "v20110320-core"
TARGET_FPU        =3D "soft"


regards,

Koen=


