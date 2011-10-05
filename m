Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <azarnasab@gmail.com>) id 1RBNky-0000LY-LM
	for Openembedded-core@lists.openembedded.org;
	Wed, 05 Oct 2011 11:27:16 +0200
Received: by bke11 with SMTP id 11so1896490bke.6
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 05 Oct 2011 02:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=t6NoZugE5cdT29cza/S3xqQzn5QM0bH8VQ2rVfwGawU=;
	b=uzALqkdzWfhdw8JFJtu3tr+5O3O+cmxEjc9PZRA+EFDqgwHM7WC3GWQAXWT5umkJWd
	aHM/fsKv1s68ECOF3elzqIf5+pZ6tUT9NY5ZXfBbCKWGyenVWUi7ZAfHUznmK5BfFtUS
	nmIMR27u/xarwrdNQapwuN3rBdng1iCEX/Q+o=
MIME-Version: 1.0
Received: by 10.204.156.16 with SMTP id u16mr1399752bkw.54.1317806502121; Wed,
	05 Oct 2011 02:21:42 -0700 (PDT)
Sender: azarnasab@gmail.com
Received: by 10.204.142.154 with HTTP; Wed, 5 Oct 2011 02:21:42 -0700 (PDT)
Date: Wed, 5 Oct 2011 03:21:42 -0600
X-Google-Sender-Auth: 57gCPwu7rb-gExA0rJ9O4JxrOHc
Message-ID: <CADWjqk4pPWNYzO7Cua7xYXa55g=BWqwAY8taHhLwV=xaesDWPA@mail.gmail.com>
From: dashesy <dashesy@gmail.com>
To: Openembedded-core@lists.openembedded.org
Subject: pkg-config bug crashes 'bitbake glib-2.0-native' in FC15.x86_64
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
X-List-Received-Date: Wed, 05 Oct 2011 09:27:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

I am using these in my local.conf with master branch of oe-core:
DISTRO=3D"angstrom-2010.x"
MACHINE=3D"beagleboard"

The build for 'bitbake glib-2.0-native' (or actually 'bitbake
meta-toolchain') will finally reach a run.do_configure for 'package
glib-2.0-native-1_2.28.8-r5: task do_configure: Started'
which runs the "oe-core/build/tmp-eglibc/sysroots/x86_64-linux/usr/bin/pkg-=
config"
 for auto build
This leads to the following chain
pkg-config(cross)->gnome-config->pkg-config->glib-config->pkg-config->...

dashesy  21266 21265 21266  0    1 01:56 pts/0    00:00:00 /bin/sh -e
/home/dashesy/buildroot/oe-core/build/tmp-eglibc/work/x86_64-linux/glib-2.0=
-native-1_2.28.8-r5/temp/run.do_configure.21265
root     21870   935 21870  0    1 01:56 ?        00:00:00 sleep 60
dashesy  22246 21266 22246  0    1 01:56 pts/0    00:00:00 /bin/sh
/home/dashesy/buildroot/oe-core/build/tmp-eglibc/work/x86_64-linux/glib-2.0=
-native-1_2.28.8-r5/glib-2.28.8/configure
--build=3Dx86_64-linux --host=3Dx86_64-linux --target=3Dx86_64-linux
--prefix=3D/home/dashesy/buildroot/oe-core/build/tmp-eglibc/sysroots/x86_64=
-linux/usr
--exec_prefix=3D/home/dashesy/buildroot/oe-core/build/tmp-eglibc/sysroots/x=
86_64-linux/usr
--bindir=3D/home/dashesy/buildroot/oe-core/build/tmp-eglibc/sysroots/x86_64=
-linux/usr/bin
--sbindir=3D/home/dashesy/buildroot/oe-core/build/tmp-eglibc/sysroots/x86_6=
4-linux/usr/sbin
--libexecdir=3D/home/dashesy/buildroot/oe-core/build/tmp-eglibc/sysroots/x8=
6_64-linux/usr/libexec
--datadir=3D/home/dashesy/buildroot/oe-core/build/tmp-eglibc/sysroots/x86_6=
4-linux/usr/share
--sysconfdir=3D/home/dashesy/buildroot/oe-core/build/tmp-eglibc/sysroots/x8=
6_64-linux/etc
--sharedstatedir=3D/home/dashesy/buildroot/oe-core/build/tmp-eglibc/sysroot=
s/x86_64-linux/com
--localstatedir=3D/home/dashesy/buildroot/oe-core/build/tmp-eglibc/sysroots=
/x86_64-linux/var
--libdir=3D/home/dashesy/buildroot/oe-core/build/tmp-eglibc/sysroots/x86_64=
-linux/usr/lib
--includedir=3D/home/dashesy/buildroot/oe-core/build/tmp-eglibc/sysroots/x8=
6_64-linux/usr/include
--oldincludedir=3D/home/dashesy/buildroot/oe-core/build/tmp-eglibc/sysroots=
/x86_64-linux/usr/include
--infodir=3D/home/dashesy/buildroot/oe-core/build/tmp-eglibc/sysroots/x86_6=
4-linux/usr/share/info
--mandir=3D/home/dashesy/buildroot/oe-core/build/tmp-eglibc/sysroots/x86_64=
-linux/usr/share/man
--disable-silent-rules --disable-dependency-tracking --disable-dtrace
--disable-systemtap --enable-nls --enable-dtrace=3Dno
dashesy  22671 22246 22671  0    1 01:56 pts/0    00:00:00
/home/dashesy/buildroot/oe-core/build/tmp-eglibc/sysroots/x86_64-linux/usr/=
bin/pkg-config
--exists --print-errors zlib
dashesy  22672 22671 22672  0    1 01:56 pts/0    00:00:00 sh -c
gnome-config --libs zlib > /dev/null 2>&1
dashesy  22673 22672 22673  0    1 01:56 pts/0    00:00:00 /bin/sh
/usr/bin/gnome-config --libs zlib
dashesy  22674 22673 22674  0    1 01:56 pts/0    00:00:00 pkg-config
--variable=3Dlibdir glib
dashesy  22675 22674 22675  0    1 01:56 pts/0    00:00:00 /bin/sh
/usr/bin/glib-config --version
dashesy  22676 22675 22676  0    1 01:56 pts/0    00:00:00 pkg-config
--variable prefix glib
dashesy  22677 22676 22677  0    1 01:56 pts/0    00:00:00 /bin/sh
/usr/bin/glib-config --version
dashesy  22678 22677 22678  0    1 01:56 pts/0    00:00:00 pkg-config
--variable prefix glib
dashesy  22679 22678 22679  0    1 01:56 pts/0    00:00:00 /bin/sh
/usr/bin/glib-config --version

I first saw this problem in angstrom-2008 in oe, then in angstrom-2010
in oe (both with pkg-config version 0.23), and now the same phenomenon
in angstrom-2010 in oe-core with version 0.25 whcih is same as my
local machine.

It is easy to reproduce this without bitbake too

First set the environment variables (PATH, PKG_CONFIG_* as I copied
from the run_doconfigure file):

export PATH=3D"/home/dashesy/buildroot/oe-core/build/tmp-eglibc/sysroots/x8=
6_64-linux/usr/bin/armv7a-linux:/home/dashesy/buildroot/oe-core/build/tmp-e=
glibc/sysroots/x86_64-linux/usr/bin:/home/dashesy/buildroot/oe-core/build/t=
mp-eglibc/sysroots/x86_64-linux/usr/sbin:/home/dashesy/buildroot/oe-core/bu=
ild/tmp-eglibc/sysroots/x86_64-linux/usr/bin:/home/dashesy/buildroot/oe-cor=
e/build/tmp-eglibc/sysroots/x86_64-linux/sbin:/home/dashesy/buildroot/oe-co=
re/build/tmp-eglibc/sysroots/x86_64-linux//bin:/home/dashesy/buildroot/oe-c=
ore/scripts/native-intercept:/home/dashesy/buildroot/oe-core/scripts:/home/=
dashesy/buildroot/oe-core/bitbake/bin:/usr/lib64/ccache:/usr/local/bin:/usr=
/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/home/dashesy/bin:/home/dashesy/b=
uildroot/oe-core/scripts"
export PKG_CONFIG_DIR=3D"/home/dashesy/buildroot/oe-core/build/tmp-eglibc/s=
ysroots/x86_64-linux/usr/lib/pkgconfig"
export PKG_CONFIG_LIBDIR=3D"/home/dashesy/buildroot/oe-core/build/tmp-eglib=
c/sysroots/x86_64-linux/usr/lib/pkgconfig"
export PKG_CONFIG_DISABLE_UNINSTALLED=3D"yes"
export PKG_CONFIG_PATH=3D"/home/dashesy/buildroot/oe-core/build/tmp-eglibc/=
sysroots/x86_64-linux/usr/lib/pkgconfig:/home/dashesy/buildroot/oe-core/bui=
ld/tmp-eglibc/sysroots/x86_64-linux/usr/share/pkgconfig"

Then run either of these two comamnds:
/home/dashesy/buildroot/oe-core/build/tmp-eglibc/sysroots/x86_64-linux/usr/=
bin/pkg-config
--variable=3Dlibdir glib
or
/home/dashesy/buildroot/oe-core/build/tmp-eglibc/sysroots/x86_64-linux/usr/=
bin/pkg-config
--exists --print-errors zlib

Notice, this might crash or halt your system


