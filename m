Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RF3kJ-0001mY-3Q
	for openembedded-core@lists.openembedded.org;
	Sat, 15 Oct 2011 14:53:47 +0200
Received: (qmail invoked by alias); 15 Oct 2011 12:48:00 -0000
Received: from p4FDF1DFB.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.29.251]
	by mail.gmx.net (mp007) with SMTP; 15 Oct 2011 14:48:00 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19Irakq31xI8eo/55qyLb80Z3eGsn89d4eNEnXJHi
	DoJn/i/twkba5T
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Sat, 15 Oct 2011 14:52:31 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-97.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <F17AC24E-C897-4BF3-990D-F9EE0A97E99E@dominion.thruhere.net>
In-Reply-To: <F17AC24E-C897-4BF3-990D-F9EE0A97E99E@dominion.thruhere.net>
MIME-Version: 1.0
Message-Id: <201110151452.31950.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
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
X-List-Received-Date: Sat, 15 Oct 2011 12:53:47 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday, October 13, 2011 10:24:19 AM Koen Kooi wrote:
> Hi,
> 
> I remember fixing this in meta-oe, but now exactly how. IIRC both mesa-xlib and mesa-dri needed to get built.
> 
> configure: error: Package requirements (glproto >= 1.4.14 dri >= 7.8.0) were not met:
> | 
> | No package 'dri' found
> | 
> | Consider adjusting the PKG_CONFIG_PATH environment variable if you
> | installed software in a non-standard prefix.
> | 
> | Alternatively, you may set the environment variables DRI_CFLAGS
> | and DRI_LIBS to avoid the need to call pkg-config.
> | See the pkg-config man page for more details.
> | + bbfatal 'oe_runconf failed'
> | + echo 'ERROR: oe_runconf failed'
> | ERROR: oe_runconf failed
> | + exit 1
> | ERROR: Function 'do_configure' failed (see /OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/xserver-xorg-1_1.11.1-r0/temp/log.do_configure.3602 for further information)
> NOTE: package xserver-xorg-1_1.11.1-r0: task do_configure: Failed
> ERROR: Task 1842 (/OE/tentacle/sources/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.1.bb, do_configure) failed with exit code '1'
> 
> regards,
> 
> Koen
ping - or how do you workaround this for machines not supporting mesa-dri?

Andreas


