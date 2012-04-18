Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SKV2p-0001tx-Sv for openembedded-core@lists.openembedded.org;
	Wed, 18 Apr 2012 15:35:40 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3IDQCbx001779
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Apr 2012 14:26:12 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32694-09 for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Apr 2012 14:26:07 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3IDQ6uE001773
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Apr 2012 14:26:07 +0100
Message-ID: <1334755569.24091.94.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 18 Apr 2012 14:26:09 +0100
In-Reply-To: <9F52A267-E108-405D-BD39-ADA0209B3620@dominion.thruhere.net>
References: <cover.1334751924.git.dongxiao.xu@intel.com>
	<484d14f90205202e85346dfc53fcc4a273b3087c.1334751924.git.dongxiao.xu@intel.com>
	<9F52A267-E108-405D-BD39-ADA0209B3620@dominion.thruhere.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] packageinfo.bbclass: A workaround for RPM architecture renaming
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
X-List-Received-Date: Wed, 18 Apr 2012 13:35:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-04-18 at 15:11 +0200, Koen Kooi wrote:
> Op 18 apr. 2012, om 14:48 heeft Dongxiao Xu het volgende geschreven:
> 
> > For beagleboard platform, the PACKAGE_ARCH for certain recipes is
> > "armv7a-vfp-neon", however, the architecture label in RPM file name is
> > "arm" due to a potential bug in RPM backend.
> 
> 'arm' or 'armv7a'? Your commit message doesn't match the comment in the code.

Since Dongxiao is probably about to go to sleep, he means "armv7a". I'd
wondered that when I looked at the commit message too.

Cheers,

Richard



