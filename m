Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Te1cW-0004ry-1B for openembedded-core@lists.openembedded.org;
	Thu, 29 Nov 2012 11:45:28 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qATAUvdp023261;
	Thu, 29 Nov 2012 10:30:57 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21537-07-3; Thu, 29 Nov 2012 10:30:51 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qATATGPX023155
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Thu, 29 Nov 2012 10:30:04 GMT
Message-ID: <1354178102.4840.2.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAMKF1sopwPYzEsD8S0MmyH=7V+9cuV-oo+KdXRQj3Q9fO8ppRA@mail.gmail.com>
References: <CAMKF1sqEyMsmSAOtZkv2JGKhfByADi0eJ-jA5E+aY_1tsh1XgQ@mail.gmail.com>
	<50B6652E.8060306@linux.intel.com>
	<CAMKF1sopwPYzEsD8S0MmyH=7V+9cuV-oo+KdXRQj3Q9fO8ppRA@mail.gmail.com>
Date: Thu, 29 Nov 2012 08:35:02 +0000
Mime-Version: 1.0
X-Mailer: Evolution 3.2.3-0ubuntu6 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: oe-core layer <openembedded-core@lists.openembedded.org>, Patches
Subject: Re: build logs of all images in or-core
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Nov 2012 10:45:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I had a look through these and we can group them as follows:

Unsupported configuration and sensible error given to user:

  [x11 instead of directfb enabled]
  eglibc.qemuarm.core-image-gtk-directfb.log
  eglibc.qemumips.core-image-gtk-directfb.log
  eglibc.qemuppc.core-image-gtk-directfb.log
  eglibc.qemux86-64.core-image-gtk-directfb.log
  eglibc.qemux86.core-image-gtk-directfb.log

  [live image doesn't work on architecture]
  eglibc.qemuarm.core-image-minimal-initramfs.log
  eglibc.qemumips.core-image-minimal-initramfs.log
  eglibc.qemuppc.core-image-minimal-initramfs.log

  [Built ok but was misconfigured (two kernels)]
  eglibc.qemuarm.core-image-rt-sdk.log
  eglibc.qemuarm.core-image-rt.log
  eglibc.qemux86-64.core-image-rt-sdk.log
  eglibc.qemux86-64.core-image-rt.log
  eglibc.qemux86.core-image-rt-sdk.log
  eglibc.qemux86.core-image-rt.log

  [No linux-yocto-rt]
  eglibc.qemumips.core-image-rt-sdk.log
  eglibc.qemumips.core-image-rt.log
  eglibc.qemuppc.core-image-rt-sdk.log
  eglibc.qemuppc.core-image-rt.log	

In the above list, I would say that the two kernels being built is a bug
we should really fix, the only way to fix it is to make the bitbake
warning about multiple providers an error.

The "interesting" build failures:

  [download issue, enable to fetch sources]
  eglibc.qemuarm.core-image-lsb-sdk.log

  [weird license build failures]
  eglibc.qemuarm.core-image-minimal.log
  eglibc.qemumips.core-image-minimal-dev.log
  eglibc.qemumips.core-image-sato-dev.log
  eglibc.qemuppc.core-image-lsb-dev.log
  eglibc.qemuppc.core-image-minimal-dev.log
  eglibc.qemuppc.core-image-minimal.log
  eglibc.qemux86-64.core-image-basic.log	
  eglibc.qemux86-64.core-image-minimal-dev.log
  eglibc.qemux86.core-image-basic.log
  eglibc.qemux86.core-image-minimal-dev.log
  eglibc.qemux86.core-image-x11.log

Of which this weird license issue is definitely the biggest problem and
the one we need to figure out. The download issue looks to be transient.

Cheers,

Richard






