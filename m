Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q8C6z-0001YV-7v for openembedded-core@lists.openembedded.org;
	Fri, 08 Apr 2011 15:52:33 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p38DoPu3007765;
	Fri, 8 Apr 2011 14:50:25 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07678-01; Fri,  8 Apr 2011 14:50:17 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p38DoCng007749
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 8 Apr 2011 14:50:14 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <8B7010C5-9902-4372-BF78-252D85C4BF46@dominion.thruhere.net>
References: <4D9F0B82.9080803@mlbassoc.com>
	<8B7010C5-9902-4372-BF78-252D85C4BF46@dominion.thruhere.net>
Date: Fri, 08 Apr 2011 06:50:09 -0700
Message-ID: <1302270609.22904.128.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [poky] Early image startup
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
X-List-Received-Date: Fri, 08 Apr 2011 13:52:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-04-08 at 15:30 +0200, Koen Kooi wrote:
> Op 8 apr 2011, om 15:20 heeft Gary Thomas het volgende geschreven:
> 
> > I have a Poky image which uses a number of kernel modules.  For
> > whatever reason, the raw image has not had the modules configured
> > (no /lib/modules/.../modules.dep)  This file is created by 'update-modules'
> > but that is run too late in the boot process.  The problem is that
> > other code, e.g. I'm using iptables via modules, requires the modules
> > be configured early and this fails.  If I reboot (after 'update-modules'
> > has run), everything is fine.
> 
> Sound like you need http://patches.openembedded.org/patch/1917/

To be honest that sounds like a more fundamental problem as if the user
cares which rtc should be rtc0, there are other ordering constraints
being imposed such as a symlink to the "best" rtc device...

Cheers,

Richard



