Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RFmWu-0005VV-53 for openembedded-core@lists.openembedded.org;
	Mon, 17 Oct 2011 14:42:56 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9HChoWj008218 for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2011 13:43:51 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id CX4a4cEOSzaB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2011 13:43:50 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9HChkC9008213
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2011 13:43:48 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 17 Oct 2011 13:37:00 +0100
In-Reply-To: <201110151452.31950.schnitzeltony@gmx.de>
References: <F17AC24E-C897-4BF3-990D-F9EE0A97E99E@dominion.thruhere.net>
	<201110151452.31950.schnitzeltony@gmx.de>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1318855029.21775.7.camel@ted>
Mime-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by dan.rpsys.net id
	p9HChoWj008218
Subject: Re: missing mesa-dri dependency?
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
X-List-Received-Date: Mon, 17 Oct 2011 12:42:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2011-10-15 at 14:52 +0200, Andreas M=C3=BCller wrote:
> On Thursday, October 13, 2011 10:24:19 AM Koen Kooi wrote:
> > Hi,
> >=20
> > I remember fixing this in meta-oe, but now exactly how. IIRC both mes=
a-xlib and mesa-dri needed to get built.
> >=20
> > configure: error: Package requirements (glproto >=3D 1.4.14 dri >=3D =
7.8.0) were not met:
> > |=20
> > | No package 'dri' found
> > |=20
> > | Consider adjusting the PKG_CONFIG_PATH environment variable if you
> > | installed software in a non-standard prefix.
> > |=20
> > | Alternatively, you may set the environment variables DRI_CFLAGS
> > | and DRI_LIBS to avoid the need to call pkg-config.
> > | See the pkg-config man page for more details.
> > | + bbfatal 'oe_runconf failed'
> > | + echo 'ERROR: oe_runconf failed'
> > | ERROR: oe_runconf failed
> > | + exit 1
> > | ERROR: Function 'do_configure' failed (see /OE/tentacle/build/tmp-a=
ngstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/xserver-xorg-1_1=
.11.1-r0/temp/log.do_configure.3602 for further information)
> > NOTE: package xserver-xorg-1_1.11.1-r0: task do_configure: Failed
> > ERROR: Task 1842 (/OE/tentacle/sources/openembedded-core/meta/recipes=
-graphics/xorg-xserver/xserver-xorg_1.11.1.bb, do_configure) failed with =
exit code '1'
> >=20
> > regards,
> >=20
> > Koen
> ping - or how do you workaround this for machines not supporting mesa-d=
ri?

All machines should support mesa-dri with just the swrast backend
enabled (which is the default). Xgl now requires dri. If you don't want
xgl you can use the xserver-xorg-lite recipe.

Cheers,

Richard



