Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RiTxR-0004oE-L9 for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 17:44:57 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q04GbXfO021404;
	Wed, 4 Jan 2012 16:37:33 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20888-07; Wed,  4 Jan 2012 16:37:28 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q04GbNU0021367
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 4 Jan 2012 16:37:24 GMT
Message-ID: <1325695043.20759.30.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Darren Hart <dvhart@linux.intel.com>
Date: Wed, 04 Jan 2012 16:37:23 +0000
In-Reply-To: <4F047E3F.3090809@linux.intel.com>
References: <cover.1325115066.git.dvhart@linux.intel.com>
	<4F039FA4.6000709@linux.intel.com> <4F047E3F.3090809@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: koen@dominion.thruhere.net, martin.jansa@gmail.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Fixes for tiny distros and linux-yocto-tiny
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
X-List-Received-Date: Wed, 04 Jan 2012 16:44:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-01-04 at 08:28 -0800, Darren Hart wrote:
> On 01/03/2012 04:39 PM, Saul Wold wrote:
> > On 12/28/2011 03:38 PM, Darren Hart wrote:
> > 
> >>
> > 
> >> Richard Purdie (1):
> >>    native.bbclass: Fix variable remapping coverage
> >>
> > Richard rejected his own patch as being too much of WIP.
> 
> Richard, what's next here? Do you want me to work on finishing this
> patch off? Can you comment on what about it is a WIP?

My patch breaks meta-toolchain builds so I can't accept it until that is
fixed. I didn't look at it over the holidays but I'm working on it now.

Cheers,

Richard




