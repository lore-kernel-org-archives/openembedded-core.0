Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QK9XU-0001nO-3J for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2011 15:33:20 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4BDUTsb019336
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2011 14:30:29 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18703-10 for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2011 14:30:25 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4BDUKHR019322
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2011 14:30:21 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1305035617.git.richard.purdie@linuxfoundation.org>
References: <cover.1305035617.git.richard.purdie@linuxfoundation.org>
Date: Wed, 11 May 2011 14:30:14 +0100
Message-ID: <1305120614.30391.349.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/6] RFC Distro config changes
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
X-List-Received-Date: Wed, 11 May 2011 13:33:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-10 at 15:00 +0100, Richard Purdie wrote:
> From: Richard Purdie <richard.purdie@linuxfoundation.org>
> 
> As discussed, we want to make OE-Core usable with no distro set. This patch series
> makes some big steps towards that goal. I'd be interested in feedback on whether it
> does the right things and would be usable by others.
> 
> The key is the inclusion of a distro/defaultsetup.conf file by bitbake.conf and 
> in turn this pulls in a variety of other common include files which can likely be
> shared. Any point of this cycle can be overridden by another layer so its totally
> customisable. I'd encourage users to use the pieces they can where possible so we
> all share best practises but obviously people have choice.
> 
> I did dump a load of "default" variables into default-distrovars.inc, I'm not
> calling that file finished, I just had to draw the line somewhere and start a 
> discussion about this :)
> 
> Also, I'm aware there are still a few poky-* files in meta/conf/distro/include.
> Some of these can just be deleted, others renamed tcmode-* and I'll take care 
> of that. I'll also delete the poky.conf file since it no longer contains anything
> required to make OE-Core build as far as I know (wider testing needed).
> 
> Pull URL: git://git.openembedded.org/openembedded-core-contrib
>   Branch: rpurdie/distro
>   Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rpurdie/distro
> 
> Richard Purdie (6):
>   Drop poky-floating-revisions.inc, poky-bleeding.conf and
>     poky-lsb.conf
>   bitbake.conf: Include the new default-providers.inc and
>     default-versions.inc files
>   distro: Add defaultsetup.conf, a set of default configuration
>     providing sane overrridable default for commonly used options
>   machine/qemu: Add qemu-config as an essential machine speicfic
>     dependency and drop specific distro config
>   conf/distro/include/default-distrovars.inc: Create set of default
>     'distro' variable values
>   preferred-xorg-versions.inc: Drop this, it makes no sense given we
>     only have one version of these recipes

I've taken feedback on board, tweaked the series and then merged it. My
reasoning is that whilst this might not be 100% perfect in every way, it
moves us a lot closer to where we want to be. We were going to start
seeing patch conflicts if it was out of tree for too long and that
didn't seem worthwhile.

Cheers,

Richard



