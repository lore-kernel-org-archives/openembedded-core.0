Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q4wiH-0003RD-39 for openembedded-core@lists.openembedded.org;
	Wed, 30 Mar 2011 16:49:37 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2UElZsp008230;
	Wed, 30 Mar 2011 15:47:35 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07262-06; Wed, 30 Mar 2011 15:47:31 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2UElSvT008207
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 30 Mar 2011 15:47:29 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "poky@yoctoproject.org" <poky@yoctoproject.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>
Date: Wed, 30 Mar 2011 15:47:27 +0100
Message-ID: <1301496447.24596.100.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: lconfig-native is not endian safe
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
X-List-Received-Date: Wed, 30 Mar 2011 14:49:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

Poky has had a ldconfig-native recipe in for a while. Back in the times
our RPATHS were totally broken adding in an ld.so.cache was useful. In
modern times I'm having trouble working out when this would be useful on
a standard system as libraries are pretty much always in one of the two
default search locations.

ldconfig-native is 32/64 bit safe. I've just been looking at PPC and it
is certainly not endian safe though. The endianess of the target system
need to match that of the build system for it to work. It wouldn't be
much work to make it endian safe though although the codebase will
diverge further from that in (e)glibc though.

Short term we need to disable it at least for ppc, longer term what
should we do?

Cheers,

Richard



