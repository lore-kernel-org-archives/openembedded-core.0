Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1QorAC-0002wl-H1
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 08:12:12 +0200
Received: by ewy5 with SMTP id 5so811076ewy.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Aug 2011 23:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:cc:content-type;
	bh=bZ2pTOMJPwBN2Ec5/sQC/J5sWFz6oonvUCbDOePQE6U=;
	b=VJLj2akDzjEySPiExoE+jn4Cbo7gPudrEj6xDh2vLQqu2UnphcYM0Y4LDK3rSpQNVJ
	BX0KbjczqLk8Xn3/+XW7/LSVV2csUbI4SLmBk0Pr3jPiHPYLKbl6LlxTHTNE5PJs3Mwz
	Rn45gpgF9WEOK01QYsVt3qYGeDZaJQIlyFJRw=
MIME-Version: 1.0
Received: by 10.213.102.9 with SMTP id e9mr545512ebo.91.1312438069314; Wed, 03
	Aug 2011 23:07:49 -0700 (PDT)
Received: by 10.213.113.196 with HTTP; Wed, 3 Aug 2011 23:07:49 -0700 (PDT)
Date: Thu, 4 Aug 2011 01:07:49 -0500
Message-ID: <CAD=GYpae2g43NMJnpD96cv9dpxoyJgB_CEoaUVEFpMsFKB24Kw@mail.gmail.com>
From: Joel A Fernandes <agnel.joel@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: "Kridner, Jason" <jdk@ti.com>,
	Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>, "Kooi, Koen" <k-kooi@ti.com>
Subject: ti-codec-engine build error
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
X-List-Received-Date: Thu, 04 Aug 2011 06:12:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

I have been working on migrating the codec-engine recipe from OE
classic to OE-core,

As of now, do_compile stage fails as it expects "bin/ar" in the
toolchain path. What would be a correct fix for this?

My meta-texasinstruments git tree is at:
https://github.com/joelagnel/meta-texasinstruments

Here is a build log:

[..]
# clv5T package/package_ti.xdais.dm.examples.viddec1_copy.c ...
/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2010_x-eglibc/sysroots/i686-linux/usr/bin/armv7a-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi-gcc
-c -MD -MF package/lib/lib/release/viddec1_copy/package/package_ti.xdais.dm.examples.viddec1_copy.ov5T.dep
-x c  -fPIC -Wunused -Wall -fno-strict-aliasing  -march=armv5t -Dfar=
-Dxdc_target_name__=GCArmv5T
-Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_release
-Dxdc_bld__vers_1_0_4_5_4 -O2 -ffunction-sections -fdata-sections  -I.
-I/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2010_x-eglibc/work/beagleboard-angstrom-linux-gnueabi/ti-codec-engine-2_26_01_09-r102a/codec_engine_2_26_01_09/examples/ti/sdo/ce/examples/codecs/viddec1_copy/../../../../../..
-I/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2010_x-eglibc/work/beagleboard-angstrom-linux-gnueabi/ti-codec-engine-2_26_01_09-r102a/codec_engine_2_26_01_09/packages
-I/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/usr/share/ti/ti-xdais-tree/packages
-I/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/usr/share/ti/ti-linuxutils-tree/packages
-I/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/usr/share/ti/ti-framework-components-tree/packages
-I/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/usr/share/ti/ti-biosutils-tree/packages
-I/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/usr/share/ti/ti-local-power-manager-tree/packages
-I/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/usr/share/ti/ti-edma3lld-tree/packages
-I/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/usr/share/ti/ti-dspbios-tree/packages
-I/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/usr/share/ti/ti-dsplink-tree
-I/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/usr/share/ti/ti-xdctools-tree/packages
-I../../../../..  -o
package/lib/lib/release/viddec1_copy/package/package_ti.xdais.dm.examples.viddec1_copy.ov5T
package/package_ti.xdais.dm.examples.viddec1_copy.c
rm -f package/lib/lib/release/viddec1_copy/viddec1_copy.ov5T
#
# clv5T viddec1_copy.c ...
/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2010_x-eglibc/sysroots/i686-linux/usr/bin/armv7a-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi-gcc
-c -MD -MF package/lib/lib/release/viddec1_copy/viddec1_copy.ov5T.dep
-x c  -fPIC -Wunused -Wall -fno-strict-aliasing  -march=armv5t -Dfar=
-Dxdc_target_name__=GCArmv5T
-Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_release
-Dxdc_bld__vers_1_0_4_5_4 -O2 -ffunction-sections -fdata-sections  -I.
-I/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2010_x-eglibc/work/beagleboard-angstrom-linux-gnueabi/ti-codec-engine-2_26_01_09-r102a/codec_engine_2_26_01_09/examples/ti/sdo/ce/examples/codecs/viddec1_copy/../../../../../..
-I/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2010_x-eglibc/work/beagleboard-angstrom-linux-gnueabi/ti-codec-engine-2_26_01_09-r102a/codec_engine_2_26_01_09/packages
-I/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/usr/share/ti/ti-xdais-tree/packages
-I/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/usr/share/ti/ti-linuxutils-tree/packages
-I/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/usr/share/ti/ti-framework-components-tree/packages
-I/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/usr/share/ti/ti-biosutils-tree/packages
-I/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/usr/share/ti/ti-local-power-manager-tree/packages
-I/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/usr/share/ti/ti-edma3lld-tree/packages
-I/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/usr/share/ti/ti-dspbios-tree/packages
-I/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/usr/share/ti/ti-dsplink-tree
-I/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/usr/share/ti/ti-xdctools-tree/packages
-I../../../../..  -o
package/lib/lib/release/viddec1_copy/viddec1_copy.ov5T viddec1_copy.c
rm -f lib/release/viddec1_copy.av5T
#
# archiving package/lib/lib/release/viddec1_copy/package/package_ti.xdais.dm.examples.viddec1_copy.ov5T
package/lib/lib/release/viddec1_copy/viddec1_copy.ov5T into
lib/release/viddec1_copy.av5T ...
/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2010_x-eglibc/sysroots/i686-linux/usr/bin/armv7a-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi/bin/ar
 cr lib/release/viddec1_copy.av5T
package/lib/lib/release/viddec1_copy/package/package_ti.xdais.dm.examples.viddec1_copy.ov5T
package/lib/lib/release/viddec1_copy/viddec1_copy.ov5T
make[1]: /home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2010_x-eglibc/sysroots/i686-linux/usr/bin/armv7a-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi/bin/ar:
Command not found
make[1]: *** [lib/release/viddec1_copy.av5T] Error 127
gmake: *** [/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2010_x-eglibc/work/beagleboard-angstrom-linux-gnueabi/ti-codec-engine-2_26_01_09-r102a/codec_engine_2_26_01_09/examples/ti/xdais/dm/examples/viddec1_copy,.libraries]
Error 2
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2010_x-eglibc/work/beagleboard-angstrom-linux-gnueabi/ti-codec-engine-2_26_01_09-r102a/codec_engine_2_26_01_09/examples/ti/sdo/ce/examples/codecs/viddec1_copy'
make: *** [all] Error 2
ERROR: Function 'do_compile' failed (see
/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2010_x-eglibc/work/beagleboard-angstrom-linux-gnueabi/ti-codec-engine-2_26_01_09-r102a/temp/log.do_compile.20179
for further information)


Thanks,
Joel


