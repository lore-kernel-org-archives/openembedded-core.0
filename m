Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QK76b-0007oN-Ih for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2011 12:57:25 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4BAscOj018194
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2011 11:54:38 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18130-01 for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2011 11:54:35 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4BAsT1Q018188
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2011 11:54:33 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <D098457C-E05A-40F8-A61C-36604A51A2E1@dominion.thruhere.net>
References: <cover.1305035617.git.richard.purdie@linuxfoundation.org>
	<4B81AF14-3B09-4B77-884C-AAF3BE237FA9@dominion.thruhere.net>
	<1305107117.30391.325.camel@rex>
	<D098457C-E05A-40F8-A61C-36604A51A2E1@dominion.thruhere.net>
Date: Wed, 11 May 2011 11:54:24 +0100
Message-ID: <1305111264.30391.338.camel@rex>
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
X-List-Received-Date: Wed, 11 May 2011 10:57:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-05-11 at 12:13 +0200, Koen Kooi wrote:
> Op 11 mei 2011, om 11:45 heeft Richard Purdie het volgende geschreven:
> > For the uclibc bits, I'm proposing
> > to add:
> > 
> > +DEPLOY_DIR_append = "-uclibc"
> > +STAGING_DIR_TARGET_append = "-uclibc"
> > +STAGING_DIR_HOST_append = "-uclibc"
> > +SSTATE_MANIFESTS_append = "-uclibc"
> > 
> > to tclibc-uclibc.inc.
> 
> Can we use _append_libc-uclibc = "uclibc" or even plain ${TCLIBC} in a
> generic include file? That would be a lot more readable and fix glibc
> vs eglibc.

Changing uclibc around is ok as its not something that has worked well
in with OE-Core for a while. What I'm trying to avoid is having to bump
all the versions of the sstate files, the sysroot layout and associated
version numbers which is what would have to happen if we change the
eglibc layout :(.

Obviously, if angstrom switches layout its pain for you though so I
suspect someone loses with this either way :/.

> > For the SDK/TOOLCHAIN bits, I need to have a close look at the SDK and
> > figure out what the implications are there as I want to ensure that they
> > can all be parallel installed as well as being in separate tarballs but
> > its something we need to look at.
> 
> I needed 'armv5te' and 'armv7a' in the tarball name, so that's how
> this is derived. It matched the OE names, but Khem found some bugs and
> changed it a little.

Makes sense and I see the need, I just want to ensure the tarballs we
have can be parallel installed.

Cheers,

Richard



