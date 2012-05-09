Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SSGZU-0002wA-4M for openembedded-core@lists.openembedded.org;
	Thu, 10 May 2012 01:45:28 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q49NZZ0m030139
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2012 00:35:35 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25763-04 for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2012 00:35:28 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q49NZNwm030087
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2012 00:35:24 +0100
Message-ID: <1336606522.2494.107.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 10 May 2012 00:35:22 +0100
In-Reply-To: <4FAAFDCB.8060109@linux.intel.com>
References: <cover.1336166919.git.nitin.a.kamble@intel.com>
	<4FAAFDCB.8060109@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 00/40] mostly automake 1.12 related fixes
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
X-List-Received-Date: Wed, 09 May 2012 23:45:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-05-09 at 16:29 -0700, Saul Wold wrote:
> On 05/04/2012 02:30 PM, nitin.a.kamble@intel.com wrote:
> > From: Nitin A Kamble<nitin.a.kamble@intel.com>
> >
> > With the automake upgrade to 1.12 many recipes started failing due to
> > use of deprecated features. This commit series addresses many of those
> > recipes.
> >
> >
> > The following changes since commit 7f11bbb9bbc55001928bec799a39a32e9fa85659:
> >
> >    bitbake: Fixup bitbake-selftest (2012-05-04 17:41:47 +0100)
> >
> > are available in the git repository at:
> >    git://git.pokylinux.org/poky-contrib nitin/automake-1.12_related_fixes
> >    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/automake-1.12_related_fixes
> >
> > Nitin A Kamble (40):
> >    guile: upgrade from 2.0.3 to 2.0.5
> Merged the guile update in, the reset are still pending.
> 
> Please break it up into build fixes and automake fixes.

The build fixes are related to automake. I think this new automake fixes
broken behaviour in previous versions which left empty directories
around.

The question is whether we go through the metadata and remove the rmdir
of empty directories or make it conditional. I'm tempted just to remove
them if we no longer need them. Our packaging checks will make sure we
notice if the problem comes back again.

Cheers,

Richard



