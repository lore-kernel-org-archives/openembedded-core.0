Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QMbg9-00009a-SA for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 10:00:26 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4I7vU0G025840;
	Wed, 18 May 2011 08:57:30 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25490-07; Wed, 18 May 2011 08:57:26 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4I7vLXK025834
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 18 May 2011 08:57:21 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20110518074909.GA31650@sakrah.homelinux.org>
References: <cover.1305525725.git.raj.khem@gmail.com>
	<ca9a918a98510eac991c84ce1ebe8fecbdf38361.1305525725.git.raj.khem@gmail.com>
	<1305591231.3424.152.camel@rex>
	<20110518074909.GA31650@sakrah.homelinux.org>
Date: Wed, 18 May 2011 08:57:16 +0100
Message-ID: <1305705436.3424.299.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] tclibc-uclibc.inc: Append -uclibc only to target recipes
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
X-List-Received-Date: Wed, 18 May 2011 08:00:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-05-18 at 00:49 -0700, Khem Raj wrote:
> I think we need to globalize libc variable like MACHINE or MULTIMACHINE
> and we could check if PREFERRED_PROVIDER_virtual/libc == TCLIBC or not
> in base.bbclass for sanity. Something like attached patch might be
> able to do it

Having assessed how many places in the system we'd need to make this
kind of change I'm now of the opinion its too great. I think
manipulating TMPDIR is a better cleaner solution and we should inject
this there...

Cheers,

Richard



