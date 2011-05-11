Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QK61e-0006NL-Cp for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2011 11:48:14 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4B9jSqn017622
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2011 10:45:28 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17297-07 for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2011 10:45:24 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4B9jN9D017610
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2011 10:45:23 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4B81AF14-3B09-4B77-884C-AAF3BE237FA9@dominion.thruhere.net>
References: <cover.1305035617.git.richard.purdie@linuxfoundation.org>
	<4B81AF14-3B09-4B77-884C-AAF3BE237FA9@dominion.thruhere.net>
Date: Wed, 11 May 2011 10:45:17 +0100
Message-ID: <1305107117.30391.325.camel@rex>
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
X-List-Received-Date: Wed, 11 May 2011 09:48:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-10 at 17:58 +0200, Koen Kooi wrote:
> Op 10 mei 2011, om 16:00 heeft Richard Purdie het volgende geschreven:
> 
> > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> > 
> > As discussed, we want to make OE-Core usable with no distro set. This patch series
> > makes some big steps towards that goal. I'd be interested in feedback on whether it
> > does the right things and would be usable by others.
> > 
> > The key is the inclusion of a distro/defaultsetup.conf file by bitbake.conf and 
> > in turn this pulls in a variety of other common include files which can likely be
> > shared. Any point of this cycle can be overridden by another layer so its totally
> > customisable. I'd encourage users to use the pieces they can where possible so we
> > all share best practises but obviously people have choice.
> > 
> > I did dump a load of "default" variables into default-distrovars.inc, I'm not
> > calling that file finished, I just had to draw the line somewhere and start a 
> > discussion about this :)
> 
> For angstrom we had to change a few things, have a look at
> http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-angstrom/tree/conf/distro/include/angstrom-core-tweaks.inc , specifically lines 12-18 and 53-54

I don't understand what TOOLCHAIN_PATH and TOOLCHAIN_SYSPATH do, I can't
find any reference to them in OECore. For the uclibc bits, I'm proposing
to add:

+DEPLOY_DIR_append = "-uclibc"
+STAGING_DIR_TARGET_append = "-uclibc"
+STAGING_DIR_HOST_append = "-uclibc"
+SSTATE_MANIFESTS_append = "-uclibc"

to tclibc-uclibc.inc.

For the SDK/TOOLCHAIN bits, I need to have a close look at the SDK and
figure out what the implications are there as I want to ensure that they
can all be parallel installed as well as being in separate tarballs but
its something we need to look at.

Cheers,

Richard




