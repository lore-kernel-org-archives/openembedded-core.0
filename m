Return-Path: <scott@jumpnowtek.com>
X-Greylist: delayed 480 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 09 Aug 2017 14:11:40 UTC
Received: from smtp117.iad3a.emailsrvr.com (smtp117.iad3a.emailsrvr.com
	[173.203.187.117])
	by mail.openembedded.org (Postfix) with ESMTP id BA36771A35
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Aug 2017 14:11:40 +0000 (UTC)
Received: from smtp7.relay.iad3a.emailsrvr.com (localhost [127.0.0.1])
	by smtp7.relay.iad3a.emailsrvr.com (SMTP Server) with ESMTP id
	455F85160 for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Aug 2017 10:03:42 -0400 (EDT)
Received: from app15.wa-webapps.iad3a (relay-webapps.rsapps.net
	[172.27.255.140])
	by smtp7.relay.iad3a.emailsrvr.com (SMTP Server) with ESMTP id
	30E294F1F for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Aug 2017 10:03:42 -0400 (EDT)
X-Sender-Id: scott@jumpnowtek.com
Received: from app15.wa-webapps.iad3a (relay-webapps.rsapps.net
	[172.27.255.140]) by 0.0.0.0:25 (trex/5.7.12);
	Wed, 09 Aug 2017 10:03:42 -0400
Received: from jumpnowtek.com (localhost [127.0.0.1])
	by app15.wa-webapps.iad3a (Postfix) with ESMTP id 205B9E0060
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Aug 2017 10:03:42 -0400 (EDT)
Received: by apps.rackspace.com (Authenticated sender: scott@jumpnowtek.com,
	from: scott@jumpnowtek.com) 
	with HTTP; Wed, 9 Aug 2017 10:03:42 -0400 (EDT)
X-Auth-ID: scott@jumpnowtek.com
Date: Wed, 9 Aug 2017 10:03:42 -0400 (EDT)
From: "Scott Ellis" <scott@jumpnowtek.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Importance: Normal
X-Priority: 3 (Normal)
X-Type: plain
Message-ID: <1502287422.130517799@apps.rackspace.com>
X-Mailer: webmail/12.9.5-RC
Subject: [meta-qt5] Host paths show up in target qmake environment
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
X-List-Received-Date: Wed, 09 Aug 2017 14:11:41 -0000
Content-Type: text/plain;charset=UTF-8
Content-Transfer-Encoding: quoted-printable

This breaks qmake on target.=0A=0ASame behavior in both pyro and master bra=
nches of meta-qt5.=0A=0AThis differs from earlier branches of meta-qt5, usi=
ng earlier versions of Qt.=0A=0Aroot@rpi3:~# qmake -query=0AQT_SYSROOT:/oe4=
/rpi/tmp-pyro/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/qtbase/5.8.0+gi=
tAUTOINC+49dc9aa409-r0/recipe-sysroot=0AQT_INSTALL_PREFIX:/oe4/rpi/tmp-pyro=
/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/qtbase/5.8.0+gitAUTOINC+49dc=
9aa409-r0/recipe-sysroot/usr=0AQT_INSTALL_PREFIX/raw:/usr=0AQT_INSTALL_ARCH=
DATA:/oe4/rpi/tmp-pyro/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/qtbase=
/5.8.0+gitAUTOINC+49dc9aa409-r0/recipe-sysroot/usr/lib/qt5=0AQT_INSTALL_ARC=
HDATA/raw:/usr/lib/qt5=0AQT_INSTALL_DATA:/oe4/rpi/tmp-pyro/work/cortexa7hf-=
neon-vfpv4-poky-linux-gnueabi/qtbase/5.8.0+gitAUTOINC+49dc9aa409-r0/recipe-=
sysroot/usr/share/qt5=0AQT_INSTALL_DATA/raw:/usr/share/qt5=0AQT_INSTALL_DOC=
S:/oe4/rpi/tmp-pyro/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/qtbase/5.=
8.0+gitAUTOINC+49dc9aa409-r0/recipe-sysroot/usr/share/doc/qt5=0AQT_INSTALL_=
DOCS/raw:/usr/share/doc/qt5=0AQT_INSTALL_HEADERS:/oe4/rpi/tmp-pyro/work/cor=
texa7hf-neon-vfpv4-poky-linux-gnueabi/qtbase/5.8.0+gitAUTOINC+49dc9aa409-r0=
/recipe-sysroot/usr/include/qt5=0AQT_INSTALL_HEADERS/raw:/usr/include/qt5=
=0AQT_INSTALL_LIBS:/oe4/rpi/tmp-pyro/work/cortexa7hf-neon-vfpv4-poky-linux-=
gnueabi/qtbase/5.8.0+gitAUTOINC+49dc9aa409-r0/recipe-sysroot/usr/lib=0AQT_I=
NSTALL_LIBS/raw:/usr/lib=0AQT_INSTALL_LIBEXECS:/oe4/rpi/tmp-pyro/work/corte=
xa7hf-neon-vfpv4-poky-linux-gnueabi/qtbase/5.8.0+gitAUTOINC+49dc9aa409-r0/r=
ecipe-sysroot/usr/lib/qt5/libexec=0AQT_INSTALL_LIBEXECS/raw:/usr/lib/qt5/li=
bexec=0AQT_INSTALL_BINS:/oe4/rpi/tmp-pyro/work/cortexa7hf-neon-vfpv4-poky-l=
inux-gnueabi/qtbase/5.8.0+gitAUTOINC+49dc9aa409-r0/recipe-sysroot/usr/bin/q=
t5=0AQT_INSTALL_BINS/raw:/usr/bin/qt5=0AQT_INSTALL_TESTS:/oe4/rpi/tmp-pyro/=
work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/qtbase/5.8.0+gitAUTOINC+49dc9=
aa409-r0/recipe-sysroot/usr/share/qt5/tests=0AQT_INSTALL_TESTS/raw:/usr/sha=
re/qt5/tests=0AQT_INSTALL_PLUGINS:/oe4/rpi/tmp-pyro/work/cortexa7hf-neon-vf=
pv4-poky-linux-gnueabi/qtbase/5.8.0+gitAUTOINC+49dc9aa409-r0/recipe-sysroot=
/usr/lib/qt5/plugins=0AQT_INSTALL_PLUGINS/raw:/usr/lib/qt5/plugins=0AQT_INS=
TALL_IMPORTS:/oe4/rpi/tmp-pyro/work/cortexa7hf-neon-vfpv4-poky-linux-gnueab=
i/qtbase/5.8.0+gitAUTOINC+49dc9aa409-r0/recipe-sysroot/usr/lib/qt5/imports=
=0AQT_INSTALL_IMPORTS/raw:/usr/lib/qt5/imports=0AQT_INSTALL_QML:/oe4/rpi/tm=
p-pyro/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/qtbase/5.8.0+gitAUTOIN=
C+49dc9aa409-r0/recipe-sysroot/usr/lib/qt5/qml=0AQT_INSTALL_QML/raw:/usr/li=
b/qt5/qml=0AQT_INSTALL_TRANSLATIONS:/oe4/rpi/tmp-pyro/work/cortexa7hf-neon-=
vfpv4-poky-linux-gnueabi/qtbase/5.8.0+gitAUTOINC+49dc9aa409-r0/recipe-sysro=
ot/usr/share/qt5/translations=0AQT_INSTALL_TRANSLATIONS/raw:/usr/share/qt5/=
translations=0AQT_INSTALL_CONFIGURATION:/oe4/rpi/tmp-pyro/work/cortexa7hf-n=
eon-vfpv4-poky-linux-gnueabi/qtbase/5.8.0+gitAUTOINC+49dc9aa409-r0/recipe-s=
ysroot/etc/qt5=0AQT_INSTALL_CONFIGURATION/raw:/etc/qt5=0AQT_INSTALL_EXAMPLE=
S:/oe4/rpi/tmp-pyro/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/qtbase/5.=
8.0+gitAUTOINC+49dc9aa409-r0/recipe-sysroot/usr/share/qt5/examples=0AQT_INS=
TALL_EXAMPLES/raw:/usr/share/qt5/examples=0AQT_INSTALL_DEMOS:/oe4/rpi/tmp-p=
yro/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/qtbase/5.8.0+gitAUTOINC+4=
9dc9aa409-r0/recipe-sysroot/usr/share/qt5/examples=0AQT_INSTALL_DEMOS/raw:/=
usr/share/qt5/examples=0AQT_HOST_PREFIX:/oe4/rpi/tmp-pyro/work/cortexa7hf-n=
eon-vfpv4-poky-linux-gnueabi/qtbase/5.8.0+gitAUTOINC+49dc9aa409-r0/recipe-s=
ysroot-native=0AQT_HOST_DATA:/oe4/rpi/tmp-pyro/work/cortexa7hf-neon-vfpv4-p=
oky-linux-gnueabi/qtbase/5.8.0+gitAUTOINC+49dc9aa409-r0/recipe-sysroot/usr/=
lib/qt5=0AQT_HOST_BINS:/usr/bin/qt5=0AQT_HOST_LIBS:/oe4/rpi/tmp-pyro/work/c=
ortexa7hf-neon-vfpv4-poky-linux-gnueabi/qtbase/5.8.0+gitAUTOINC+49dc9aa409-=
r0/recipe-sysroot/usr/lib=0AQMAKE_SPEC:linux-oe-g++=0AQMAKE_XSPEC:linux-oe-=
g++=0AQMAKE_VERSION:3.1=0AQT_VERSION:5.8.0=0A=0A=0AThe error you see on the=
 target processing a simple Qt .pro file=0A=0Aroot@rpi3:~/tspress# qmake=0A=
Could not find qmake configuration file linux-oe-g++.=0AError processing pr=
oject file: /home/root/tspress/tspress.pro=0A


