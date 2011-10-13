Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1REGg7-0005s4-LV
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Oct 2011 10:30:11 +0200
Received: by eyd9 with SMTP id 9so1572096eyd.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2011 01:24:26 -0700 (PDT)
Received: by 10.223.65.68 with SMTP id h4mr4609617fai.24.1318494266452;
	Thu, 13 Oct 2011 01:24:26 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id c1sm8613054fab.15.2011.10.13.01.24.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Oct 2011 01:24:25 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 13 Oct 2011 10:24:19 +0200
Message-Id: <F17AC24E-C897-4BF3-990D-F9EE0A97E99E@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1251.1)
X-Mailer: Apple Mail (2.1251.1)
Subject: missing mesa-dri dependency?
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
X-List-Received-Date: Thu, 13 Oct 2011 08:30:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

I remember fixing this in meta-oe, but now exactly how. IIRC both =
mesa-xlib and mesa-dri needed to get built.

configure: error: Package requirements (glproto >=3D 1.4.14 dri >=3D =
7.8.0) were not met:
|=20
| No package 'dri' found
|=20
| Consider adjusting the PKG_CONFIG_PATH environment variable if you
| installed software in a non-standard prefix.
|=20
| Alternatively, you may set the environment variables DRI_CFLAGS
| and DRI_LIBS to avoid the need to call pkg-config.
| See the pkg-config man page for more details.
| + bbfatal 'oe_runconf failed'
| + echo 'ERROR: oe_runconf failed'
| ERROR: oe_runconf failed
| + exit 1
| ERROR: Function 'do_configure' failed (see =
/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-g=
nueabi/xserver-xorg-1_1.11.1-r0/temp/log.do_configure.3602 for further =
information)
NOTE: package xserver-xorg-1_1.11.1-r0: task do_configure: Failed
ERROR: Task 1842 =
(/OE/tentacle/sources/openembedded-core/meta/recipes-graphics/xorg-xserver=
/xserver-xorg_1.11.1.bb, do_configure) failed with exit code '1'

regards,

Koen=


