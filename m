Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1SJCsE-0004ga-Kf
	for openembedded-core@lists.openembedded.org;
	Sun, 15 Apr 2012 01:59:22 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 14 Apr 2012 16:49:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="129646710"
Received: from dongxiao-osel.sh.intel.com (HELO [10.239.36.11])
	([10.239.36.11])
	by orsmga001.jf.intel.com with ESMTP; 14 Apr 2012 16:49:57 -0700
From: "Xu, Dongxiao" <dongxiao.xu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <5007F7A3-3E6D-4DB5-A345-B7FD4322A283@dominion.thruhere.net>
References: <cover.1334400035.git.dongxiao.xu@intel.com>
	<7a59efe236b3ebd7472ce95bf75b9b5a27ba656c.1334400035.git.dongxiao.xu@intel.com>
	<5007F7A3-3E6D-4DB5-A345-B7FD4322A283@dominion.thruhere.net>
Date: Sun, 15 Apr 2012 07:47:06 +0800
Message-ID: <1334447226.27917.42.camel@dongxiao-osel>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH 1/1] gst-plugins-bad: add curl as build dependency
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
X-List-Received-Date: Sat, 14 Apr 2012 23:59:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2012-04-14 at 13:23 +0200, Koen Kooi wrote:
> Op 14 apr. 2012, om 12:44 heeft Dongxiao Xu het volgende geschreven:
>=20
> > gst-plugins-bad needs curl.h to finish its build, so add curl as its
> > dependency.
>=20
> I can't be sure without the exact failure log, but: missing PR bump

Add a dependency here doesn't impact the original build. If the original
build is successful, it means curl has already been built by chance. Do
we still need to bump PR in this case?

Besides, this is the detailed log:

i586-poky-linux-libtool: compile:  i586-poky-linux-gcc -m32 -march=3Di586
--sysroot=3D/distro/sdb/build-master/tmp/sysroots/qemux86 -std=3Dgnu99
-DHAVE_CONFIG_H -I. -I../.. -pthread
-I/distro/sdb/build-master/tmp/sysroots/qemux86/usr/include/gstreamer-0.10 =
-I/distro/sdb/build-master/tmp/sysroots/qemux86/usr/include/glib-2.0 -I/dis=
tro/sdb/build-master/tmp/sysroots/qemux86/usr/lib/glib-2.0/include -I/distr=
o/sdb/build-master/tmp/sysroots/qemux86/usr/include/libxml2 -pthread -I/dis=
tro/sdb/build-master/tmp/sysroots/qemux86/usr/include/gstreamer-0.10 -I/dis=
tro/sdb/build-master/tmp/sysroots/qemux86/usr/include/glib-2.0 -I/distro/sd=
b/build-master/tmp/sysroots/qemux86/usr/lib/glib-2.0/include -I/distro/sdb/=
build-master/tmp/sysroots/qemux86/usr/include/libxml2 -DG_THREADS_MANDATORY=
 -DG_DISABLE_CAST_CHECKS -DG_DISABLE_ASSERT -Wall -Wdeclaration-after-state=
ment -Wvla -Wpointer-arith -Wmissing-declarations -Wmissing-prototypes -Wre=
dundant-decls -Wwrite-strings -Wformat-security -Wold-style-definition -Win=
it-self -Wmissing-include-dirs -Waddress -Wno-multichar -Wnested-externs -O=
2 -pipe -g -feliminate-unused-debug-types -c gstcurlsink.c  -fPIC -DPIC -o =
.libs/libgstcurl_la-gstcurlsink.o
i586-poky-linux-libtool: compile:  i586-poky-linux-gcc -m32 -march=3Di586
--sysroot=3D/distro/sdb/build-master/tmp/sysroots/qemux86 -std=3Dgnu99
-DHAVE_CONFIG_H -I. -I../.. -pthread
-I/distro/sdb/build-master/tmp/sysroots/qemux86/usr/include/gstreamer-0.10 =
-I/distro/sdb/build-master/tmp/sysroots/qemux86/usr/include/glib-2.0 -I/dis=
tro/sdb/build-master/tmp/sysroots/qemux86/usr/lib/glib-2.0/include -I/distr=
o/sdb/build-master/tmp/sysroots/qemux86/usr/include/libxml2 -pthread -I/dis=
tro/sdb/build-master/tmp/sysroots/qemux86/usr/include/gstreamer-0.10 -I/dis=
tro/sdb/build-master/tmp/sysroots/qemux86/usr/include/glib-2.0 -I/distro/sd=
b/build-master/tmp/sysroots/qemux86/usr/lib/glib-2.0/include -I/distro/sdb/=
build-master/tmp/sysroots/qemux86/usr/include/libxml2 -DG_THREADS_MANDATORY=
 -DG_DISABLE_CAST_CHECKS -DG_DISABLE_ASSERT -Wall -Wdeclaration-after-state=
ment -Wvla -Wpointer-arith -Wmissing-declarations -Wmissing-prototypes -Wre=
dundant-decls -Wwrite-strings -Wformat-security -Wold-style-definition -Win=
it-self -Wmissing-include-dirs -Waddress -Wno-multichar -Wnested-externs -O=
2 -pipe -g -feliminate-unused-debug-types -c gstcurl.c  -fPIC -DPIC -o .lib=
s/libgstcurl_la-gstcurl.o
gstcurlsink.c:45:23: fatal error: curl/curl.h: No such file or directory
compilation terminated.
make[3]: *** [libgstcurl_la-gstcurlsink.lo] Error 1
make[3]: *** Waiting for unfinished jobs....

Thanks,
Dongxiao
>=20
> regards,
>=20
> Koen
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




