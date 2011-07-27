Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qm7Bb-0005Ws-QZ for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 18:42:20 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6RGc6So031389
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2011 17:38:06 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 31114-04 for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2011 17:38:02 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6RGbv8J031383
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2011 17:37:57 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1311611027.30326.252.camel@phil-desktop>
References: <cover.1311345613.git.richard.purdie@linuxfoundation.org>
	<1311357674.2344.155.camel@rex> <1311601337.2344.192.camel@rex>
	<1311611027.30326.252.camel@phil-desktop>
Date: Wed, 27 Jul 2011 17:37:55 +0100
Message-ID: <1311784675.2344.408.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 6/3] Move architecture specific TARGET_OS mangling into tune files
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
X-List-Received-Date: Wed, 27 Jul 2011 16:42:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-07-25 at 17:23 +0100, Phil Blundell wrote:
> On Mon, 2011-07-25 at 14:42 +0100, Richard Purdie wrote:
> > To try and help preserve my sanity when pulling the various multilib
> > patches together, I've merged these six patches, along with a patch
> > incrementing bitbake's miniumum version requirement for the
> > bb.utils.contains usage.
> 
> FWIW, the bitbake minimum version check (at least in its current form)
> doesn't buy much in this sort of situation because you get a parse error
> before the event handler in sanity.bbclass ever runs.  I think this
> happened last time there was a bitbake-affecting change too although I
> don't recall the details.
> 
> Perhaps adding something like:
> 
> __sane_bitbake := "${oe.check_bb_version_sanity}"
> 
> to the top of bitbake.conf would improve matters, I dunno.

Ouch, yes, we probably should do something like this.

Cheers,

Richard



