Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qnvtl-0008QD-HM for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 19:03:25 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p71Gx5Xp008855
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Aug 2011 17:59:05 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08426-03 for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Aug 2011 17:59:01 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p71Gx0BN008847
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Aug 2011 17:59:00 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4E36D43B.2060207@windriver.com>
References: <55CEBFCA-8098-4A58-BC84-0C88D2484ED3@kernel.crashing.org>
	<4E36D43B.2060207@windriver.com>
Date: Mon, 01 Aug 2011 17:58:47 +0100
Message-ID: <1312217927.2344.513.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: lib64 not getting picked up
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
X-List-Received-Date: Mon, 01 Aug 2011 17:03:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-08-01 at 11:28 -0500, Mark Hatle wrote:
> On 8/1/11 11:15 AM, Kumar Gala wrote:
> > I'm trying to build a powerpc 64-bit system and for some reason everything is still in /lib instead of /lib64.
> > 
> > I'd expect things in /lib64 based on how arch-powerpc64.inc has:
> > 
> > BASE_LIB_tune-powerpc64 = "lib64"
> > 
> > any ideas on what to look at for why this isn't happening?
> > 
> > - k
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 
> in bitbake.conf try changing "baselib" to:
> 
> baselib = "${@d.getVar('BASE_LIB_tune-${DEFAULTTUNE}', True) or 'lib'}"

FWIW, this is currently in multilib.conf so in non multilib configs, it
defaults to "lib" and in multilib, it defaults to the BASE_LIB settings.

If we want to use BASE_LIB in all cases its easy to change, I just felt
we could hold off on doing that for now, at least whilst we work through
some of the tune gremlins...

Cheers,

Richard



