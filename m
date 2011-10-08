Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RCXCb-0000B6-D4
	for openembedded-core@lists.openembedded.org;
	Sat, 08 Oct 2011 15:44:33 +0200
Received: (qmail invoked by alias); 08 Oct 2011 13:38:54 -0000
Received: from p4FDF0806.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.8.6]
	by mail.gmx.net (mp008) with SMTP; 08 Oct 2011 15:38:54 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19NA0E6pTdNb0mf4oxpWtKg1/6Qj+0gJlMQ3Adpbz
	uGV6TbAbwOiDrQ
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: openembedded-core@lists.openembedded.org
Date: Sat, 8 Oct 2011 15:43:11 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-97.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
MIME-Version: 1.0
Message-Id: <201110081543.11799.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: tiff compile fails
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
X-List-Received-Date: Sat, 08 Oct 2011 13:44:33 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

With latest git pull for oe-core/meta-oe... & clean build dir I get

| arm-angstrom-linux-gnueabi-libtool: compile:  ccache arm-angstrom-linux-gnueabi-g++ -march=armv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8 -mthumb-interwork -mno-thumb --sysroot=/home/Superandy/tmp/oe-core-eglibc/sysroots/overo -DHAVE_CONFIG_H -I. -O2 -pipe -g -feliminate-unused-debug-types -fpermissive -fvisibility-inlines-hidden -fvisibility-inlines-hidden -MT tif_stream.lo -MD -MP -MF .deps/tif_stream.Tpo -c tif_stream.cxx  -fPIC -DPIC -o .libs/tif_stream.o
| tif_stream.cxx:31:20: fatal error: iostream: No such file or directory
| compilation terminated.
| make[2]: *** [tif_stream.lo] Error 1

I think it is not tiff to blame - but which one is it?

Andreas


