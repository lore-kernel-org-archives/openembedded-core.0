Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SsGHx-0003B3-Bm for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 18:42:49 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6KGVR6F013585
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2012 17:31:27 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10396-10 for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2012 17:31:23 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6KGVKVf013579
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2012 17:31:21 +0100
Message-ID: <1342801883.21788.44.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 20 Jul 2012 17:31:23 +0100
In-Reply-To: <ABA95944-0903-4822-8B44-B2B2922F4028@dominion.thruhere.net>
References: <ABA95944-0903-4822-8B44-B2B2922F4028@dominion.thruhere.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: TUNE_FEATURES not reported correctly in pre-build summary
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
X-List-Received-Date: Fri, 20 Jul 2012 16:42:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-07-20 at 09:08 +0200, Koen Kooi wrote:
> Hi,
> 
> I've been experimenting with hardfloat in oe-core (all the previous hf angstrom builds were still using oe-classic) and I noticed that the build summary at the start is incorrect:
> 
> [koen@revo Angstrom]$ MACHINE=beaglebone bitbake -u knotty2 bash
> [..]
> Build Configuration:
> BB_VERSION        = "1.15.3"
> TARGET_ARCH       = "arm"
> TARGET_OS         = "linux-gnueabi"
> MACHINE           = "beaglebone"
> DISTRO            = "angstrom"
> DISTRO_VERSION    = "v2012.07-core"
> TUNE_FEATURES     = "armv7a vfp neon cortexa8"
> TARGET_FPU        = "vfp-neon"
> 
> [koen@revo Angstrom]$ MACHINE=beaglebone bitbake -u knotty2 bash -e | grep TUNE_FEATURES\=
> # TUNE_FEATURES=${TUNE_FEATURES_tune-${DEFAULTTUNE}}
> TUNE_FEATURES="armv7a vfp neon callconvention-hard cortexa8"
> 
> It does seem to build the right things:
> 
> [koen@revo Angstrom]$ dpkg-deb -c build/tmp-angstrom_v2012_x-eglibc/deploy/ipk/armv7ahf-vfp-neon/libc6_2.15-r12+svnr19294_armv7ahf-vfp-neon.ipk  | grep hf
> lrwxrwxrwx root/root         0 2012-07-20 03:22 ./lib/ld-linux-armhf.so.3 -> ld-2.15.so
> 
> So why is TUNE_FEATURES not reported correctly in the build banner?

Good question. How are you selecting callconvention-hard?

Cheers,

Richard



