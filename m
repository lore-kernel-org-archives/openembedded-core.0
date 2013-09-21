Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id A08DB6C7AB
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Sep 2013 10:00:09 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8LAEhWX015598 for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Sep 2013 11:14:43 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id mwaP3eiz1OXC
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Sep 2013 11:14:42 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8LAEdl0015594
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Sep 2013 11:14:41 +0100
Message-ID: <1379757598.18603.193.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 21 Sep 2013 10:59:58 +0100
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] gzipnative: Ensure dependencies apply to do_unpack and do_populate_lic
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
X-List-Received-Date: Sat, 21 Sep 2013 10:00:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

| DEBUG: Executing python function sstate_task_postfunc| DEBUG: Staging fil=
es from /srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-x32/b=
uild/build/tmp/work/qemux86_64-poky-linux-gnux32/core-image-minimal/1.0-r0/=
license-destdir to /srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/ni=
ghtly-x32/build/build/tmp/deploy/licenses| NOTE: Using umask 002 (not 22) f=
or sstate packaging| DEBUG: Preparing tree /srv/home/pokybuild/yocto-autobu=
ilder-new/yocto-slave/nightly-x32/build/build/tmp/work/qemux86_64-poky-linu=
x-gnux32/core-image-minimal/1.0-r0/license-destdir for packaging at /srv/ho=
me/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-x32/build/build/tmp/=
work/qemux86_64-poky-linux-gnux32/core-image-minimal/1.0-r0/sstate-build-po=
pulate-lic/license-destdir| NOTE: Removing hardcoded paths from sstate pack=
age: 'find /srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-x3=
2/build/build/tmp/work/qemux86_64-poky-linux-gnux32/core-image-minimal/1.0-=
r0/sstate-build-populate-lic/ \( -name "*.la" -o -name "*-config" -o -name =
"*_config" \) -type f | xargs grep -l -e '/srv/home/pokybuild/yocto-autobui=
lder-new/yocto-slave/nightly-x32/build/build/tmp/sysroots/qemux86-64' | tee=
 /srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-x32/build/bu=
ild/tmp/work/qemux86_64-poky-linux-gnux32/core-image-minimal/1.0-r0/sstate-=
build-populate-lic/fixmepath | xargs --no-run-if-empty sed -i -e 's:/srv/ho=
me/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-x32/build/build/tmp/=
sysroots/qemux86-64:FIXMESTAGINGDIRHOST:g''
| DEBUG: Executing shell function sstate_create_package
| gzip: /lib64/libz.so.1: version `ZLIB_1.2.5.1' not found (required by gzi=
p)
| tar: Child returned status 1
| tar: Error is not recoverable: exiting now
| WARNING: /srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-x3=
2/build/build/tmp/work/qemux86_64-poky-linux-gnux32/core-image-minimal/1.0-=
r0/temp/run.sstate_create_package.20384:1 exit 2 from
|   tar --ignore-failed-read -czf $TFILE license-destdir
| DEBUG: Python function sstate_task_postfunc finished
| ERROR: Function failed: sstate_create_package (log file is located at /sr=
v/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-x32/build/build/=
tmp/work/qemux86_64-poky-linux-gnux32/core-image-minimal/1.0-r0/temp/log.do=
_populate_lic.20384)
NOTE: recipe core-image-minimal-1.0-r0: task do_populate_lic: Failed

Imagine:

pigz-native is used from sstate.
zlib-native is getting rebuilt.

pigz-native has some special handling to ensure its not used until the
system is ready. This is through a class and installing into a subdir of
PATH which only gets added in when we believe its available. We use
pigz-native in the image generation code and its in DEPENDS.

DEPENDS are guaranteed available for do_configure. do_populate_lic can
run before do_configure so the DEPENDS isn't met and I think this is our
corner case.I suspect ways of fixing this are to either:

a) force do_populate_lic after do_configure everywhere
b) statically link pigz-native
c) add in an explicit dependency to gzipnative.bbclass forcing
do_populate_lic after do_configure. If do_unpack handled a tar file in
an image, it would also be at risk of course.

Looking at each, a) is overkill and our dependency tree is nasty enough
already. b) sounds nice but is also risky since what happens if the gzip
binary is half copied when we run it. Our hardlink copying should deal
with that but I'm still nervous. This leaves us with c) so we could do:

do_unpack[depends] +=3D "gzip-native:do_populate_sysroot"

The reproducer is:

bitbake pigz-native
bitbake zlib-native -c clean
bitbake core-image-minimal -c populate_lic --no-setscene -f

however your system needs to have an old version of zlib on it which
pigz-native can't run against. The line above fixes it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/gzipnative.bbclass b/meta/classes/gzipnative.bbcl=
ass
index 007e32c..1e75b7c 100644
--- a/meta/classes/gzipnative.bbclass
+++ b/meta/classes/gzipnative.bbclass
@@ -1,3 +1,5 @@
 EXTRANATIVEPATH +=3D "pigz-native gzip-native"
 DEPENDS +=3D "gzip-native"
=20
+# tar may get run by do_unpack or do_populate_lic which could call gzip
+do_unpack[depends] +=3D "gzip-native:do_populate_sysroot"



