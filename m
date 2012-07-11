Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SozoX-0008Rl-Oe for openembedded-core@lists.openembedded.org;
	Wed, 11 Jul 2012 18:30:57 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6BGJkWx010408
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 17:19:46 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10154-07 for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 17:19:41 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6BGJdcr010402
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 17:19:40 +0100
Message-ID: <1342023581.11939.25.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 11 Jul 2012 17:19:41 +0100
In-Reply-To: <lysjcypjuy.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <1341927124.24837.8.camel@ted>
	<lysjcypjuy.fsf@ensc-virt.intern.sigma-chemnitz.de>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: bitbake.conf: Add git-native to ASSUME_PROVIDED
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
X-List-Received-Date: Wed, 11 Jul 2012 16:30:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-07-11 at 14:23 +0200, Enrico Scholz wrote:
> Richard Purdie
> <richard.purdie-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
> writes:
> 
> > Originally, git was something new, not installed everywhere and had
> > commandline stability problems. This has changed and git it no longer
> > makes sense to continually build this when the system installed version
> > is likely sufficient.
> 
> Can this really be assumed? Recent bitbake use something like 
> 
>  | git remote add --mirror=fetch
> 
> The git version in RHEL 6 or Ubuntu 10 are too old for this and support
> '--mirror' without a value only.

You're right unfortunately, we're going to need to rethink this. I
didn't think the git fetcher used any advanced syntax now but it clearly
does :(

Does anyone know what the actual version dependency is? I know its after
1.7.3.4 and before 1.7.5.4.

Cheers,

Richard



