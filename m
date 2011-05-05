Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QHx3A-0001EO-Vb for openembedded-core@lists.openembedded.org;
	Thu, 05 May 2011 13:48:57 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p45BkHgK010530;
	Thu, 5 May 2011 12:46:17 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10496-01; Thu,  5 May 2011 12:46:14 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p45Bk9p4010524
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 5 May 2011 12:46:10 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <201105041621.25113.paul.eggleton@linux.intel.com>
References: <cover.1304520272.git.paul.eggleton@linux.intel.com>
	<a6ff3eaba2e8868cf24775725be334f3479d905c.1304520272.git.paul.eggleton@linux.intel.com>
	<4DC16BA5.1090508@mlbassoc.com>
	<201105041621.25113.paul.eggleton@linux.intel.com>
Date: Thu, 05 May 2011 12:46:08 +0100
Message-ID: <1304595968.20791.26.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: poky@yoctoproject.org
Subject: Re: [poky] [PATCH 1/3] Remove machine-specific metadata for machines no longer in oe-core
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
X-List-Received-Date: Thu, 05 May 2011 11:48:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-05-04 at 16:21 +0100, Paul Eggleton wrote:
> On Wednesday 04 May 2011 16:07:17 Gary Thomas wrote:
> > Perhaps it makes sense to always package netbase in ${MACHINE_ARCH} since
> > it almost always will have machine specific data?
> 
> I'll let someone else comment on this, I don't have a hard opinion either way.

Since the exception machines are clearly listed I think its fine as it
stands at the moment. If we start getting lots of overrides there we can
rethink it though. Lets see how it goes...

Cheers,

Richard



