Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RGbQj-0000b8-0V
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Oct 2011 21:03:58 +0200
Received: (qmail invoked by alias); 19 Oct 2011 18:58:05 -0000
Received: from p4FDF0FC1.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.15.193]
	by mail.gmx.net (mp011) with SMTP; 19 Oct 2011 20:58:05 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+jcNofgPqjHIa+F5wO3fc8MqKy/t656u8IibNbsT
	AW1c4EVsQh5ixI
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Wed, 19 Oct 2011 21:02:49 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-97.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <CAMKF1spgu+h2_LD3Qp6129QCxb5XHKSru0ggOHt3vCqG=8s7Jw@mail.gmail.com>
In-Reply-To: <CAMKF1spgu+h2_LD3Qp6129QCxb5XHKSru0ggOHt3vCqG=8s7Jw@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201110192102.50043.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: xerver-xorg build problem
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
X-List-Received-Date: Wed, 19 Oct 2011 19:03:58 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Wednesday, October 19, 2011 08:22:27 PM Khem Raj wrote:
> Hi
> 
> I am seeing this error today
> 
> 
> | checking for GL... yes
> | checking for DRIPROTO... yes
> | checking for DRI... no
> | configure: error: Package requirements (glproto >= 1.4.14 dri >=
> 7.8.0) were not met:
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
> | ERROR: Function 'do_configure' failed (see
> /home/kraj/work/angstrom/build/tmp-angstrom_2010_x-eglibc/work/ppc603e-angstrom-linux/xserver-xorg-2_1.11.1-r1/temp/log.do_configure.21621
> for further information)
> NOTE: package xserver-xorg-2_1.11.1-r1: task do_configure: Failed
> ERROR: Task 1518
> (/home/kraj/work/angstrom/sources/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.1.bb,
> do_configure) failed with exit code '1'
> Waiting for 2 active tasks to finish:
> 
> 
> any hints ?
> 
I think it is this one [1]: manually build mesa-xlib and mesa-dri. What could be a proper solution on that?

Andreas

[1] http://lists.linuxtogo.org/pipermail/openembedded-core/2011-October/011281.html


