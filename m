Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Si5Eb-0004zS-Vj for openembedded-core@lists.openembedded.org;
	Fri, 22 Jun 2012 16:53:18 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5MEgVZQ002527
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2012 15:42:31 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01132-10 for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2012 15:42:27 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5MEgMa1002521
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2012 15:42:23 +0100
Message-ID: <1340376144.394.49.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 22 Jun 2012 15:42:24 +0100
In-Reply-To: <lypq8rzaoj.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <1340373998.394.36.camel@ted>
	<lypq8rzaoj.fsf@ensc-virt.intern.sigma-chemnitz.de>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] bitbake.conf/abi_version.conf: Update to use BasicHash signature generator
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
X-List-Received-Date: Fri, 22 Jun 2012 14:53:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-06-22 at 16:24 +0200, Enrico Scholz wrote:
> Richard Purdie
> <richard.purdie-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
> writes:
> 
> > This switches to use the hash based signature generatior and update
> > layout_abi to match stamp file layout changes.
> 
> Has this really been tested?

Its the default in Poky and Angstrom. It was the default for the Yocto
Project 1.2 release too. So yes, it has seen testing.

>  I played a little bit with it and it was
> very painful when whole distribution will be rebuilt due to a minor
> change in an early package.
> 
> There are some subtle bugs in the hash generation too (e.g. bitbake's
> get_file_depends() result is used to calculate a hash over a set() which
> is filled nondeterministically when BB_NUMBER_THREADS>1) which cause
> random rebuilds too.

Bug reports on issues like this would be good, we can't fix a problem if
we don't know about it.

Cheers,

Richard



