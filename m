Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qsvmt-0005op-Pk for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 13:57:01 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7FBqOuY016537
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2011 12:52:24 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16444-01 for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2011 12:52:20 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7FBqICf016531
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2011 12:52:18 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1313363644.git.sgw@linux.intel.com>
References: <cover.1313363644.git.sgw@linux.intel.com>
Date: Mon, 15 Aug 2011 12:52:16 +0100
Message-ID: <1313409136.14274.566.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 00/12] Various Fixes
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
X-List-Received-Date: Mon, 15 Aug 2011 11:57:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2011-08-14 at 16:30 -0700, Saul Wold wrote:
> Richard,
> 
> Please review Lianhao's patch to LDD Scripts, the rest of these
> patches seem correct to me.
> 
> Sau!
> 
> 
> The following changes since commit d126e22f6b3f27196144f87e22b36ebccd6dea65:
> 
>   rt-tests: use an explicit commit ID (2011-08-12 17:51:18 +0100)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage
> 
> Khem Raj (1):
>   intltool: Use nativeperl binary for PERL instead of 'perl'
> 
> Lianhao Lu (4):
>   utils.bbclass/multilib.class: Added misc supporting functions.
>   eglibc: Modify ldd script according to multilib config.
>
> Lin Tong (1):
>   valgrind: supporting on Linux kernel 3.x
> 
> Noor Ahsan (1):
>   bluez4: Added new recipe 4.96 and removed 4.82 version
> 
> Phil Blundell (5):
>   pixman: remove spurious dependency on libx11
>   libx11: skip self if x11 not in DISTRO_FEATURES
>   cairo: only use x11 if selected in DISTRO_FEATURES
>   dbus: only use x11 if DISTRO_FEATURES has selected it
>   default-distrovars: add x11 to default DISTRO_FEATURES

I merged these apart from:

  image: populate site config files into roootfs.
  meta-toolchain/environment: Use site config in rootfs.

which are going to need rethinking.

Cheers,

Richard
 



