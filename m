Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RdM6G-00010b-Ey for openembedded-core@lists.openembedded.org;
	Wed, 21 Dec 2011 14:20:52 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBLDDhgJ008949;
	Wed, 21 Dec 2011 13:13:43 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08159-07; Wed, 21 Dec 2011 13:13:39 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBLDDXDn008943
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 21 Dec 2011 13:13:34 GMT
Message-ID: <1324473215.16323.27.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Cui, Dexuan" <dexuan.cui@intel.com>
Date: Wed, 21 Dec 2011 13:13:35 +0000
In-Reply-To: <1865303E0DED764181A9D882DEF65FB6EA8B6E1B67@shsmsx502.ccr.corp.intel.com>
References: <1865303E0DED764181A9D882DEF65FB6EA8B6E1A65@shsmsx502.ccr.corp.intel.com>
	<1865303E0DED764181A9D882DEF65FB6EA8B6E1B0D@shsmsx502.ccr.corp.intel.com>
	<1324458622.3622.25.camel@ted>
	<1865303E0DED764181A9D882DEF65FB6EA8B6E1B67@shsmsx502.ccr.corp.intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Martin Jansa <martin.jansa@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: opkg still breaks meta-toolchain-gmae
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
X-List-Received-Date: Wed, 21 Dec 2011 13:20:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-12-21 at 17:51 +0800, Cui, Dexuan wrote:
> Richard Purdie wrote on 2011-12-21:
> > On Wed, 2011-12-21 at 16:51 +0800, Cui, Dexuan wrote:
> >> Cui, Dexuan wrote on 2011-12-21:
> >>> Hi all,
> >>> After I upgraded to the latest poky master (commit 4648aadf),
> >>> core-image-sato-sdk can build file, but meta-toolchain-gmae (with
> >>> ipk
> >>> packaging) still doesn't work. Now the failure is:
> >>> 
> >>> | error: Failed dependencies:
> >>> |   libsdl-nativesdk is needed by qemu-nativesdk-0.15.1-r1.x86_64
> >>> NOTE: package meta-toolchain-gmae-1.0-r6: task do_populate_sdk:
> >>> Failed
> >> Sorry, I need to correct this above: It's actually rpm packaging(rpm
> >> did work fine with the slightly older commit 45987c5135) rather than
> >> ipk.
> >> 
> >> If I use ipk packaging, I get the similar mkdir failure: mkdir: cannot
> >> create directory `/var/lib/opkg': Permission denied and, I finally got
> >> a libsdl failure, too: | Collected errors: |  *
> >> satisfy_dependencies_for: Cannot satisfy the following | dependencies
> >> for task-sdk-host-nativesdk: |  *    libsdl-nativesdk * So I suppose
> >> the libsdl patch(" fix packaging") is suspicious.
> >> 
> >> BTW, I use "MACHINE=qemux86".
> > 
> > I have a suspicion this is a missing PR bump on qemu after the libsdl change.
> > Does rebuilding qemu-nativesdk help?
> Yeah, it does help (for rpm packaging)!  Please make a patch to bump the PR. :-)
> 
> BTW, with ipk, I still got the below issue:
> mkdir: cannot create directory `/var/lib/opkg': Permission denied

This is usually a non fatal error noise in the logs. I appreciate that
we need to fix it but if your build is failing its likely due to
something else.

Cheers,

Richard



