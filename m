Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QPMly-000630-VM for openembedded-core@lists.openembedded.org;
	Thu, 26 May 2011 00:41:51 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4PMclrJ005831;
	Wed, 25 May 2011 23:38:47 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05475-06; Wed, 25 May 2011 23:38:43 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4PMcbAT005825
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 25 May 2011 23:38:40 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>
In-Reply-To: <4DDD7983.1030205@linux.intel.com>
References: <cover.1306276122.git.dvhart@linux.intel.com>
	<4DDCA269.1030006@linux.intel.com> <4DDD433F.4090009@linux.intel.com>
	<4DDD7983.1030205@linux.intel.com>
Date: Wed, 25 May 2011 23:38:35 +0100
Message-ID: <1306363115.27470.74.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Darren Hart <dvhart@linux.intel.com>, Patches,
	oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] oe-setup-builddir: remove unreachable code, update comments
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
X-List-Received-Date: Wed, 25 May 2011 22:41:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-05-25 at 14:49 -0700, Saul Wold wrote:
> On 05/25/2011 10:58 AM, Darren Hart wrote:
> >
> >
> > On 05/24/2011 11:32 PM, Saul Wold wrote:
> >> On 05/24/2011 03:31 PM, Darren Hart wrote:
> >>> From: Darren Hart<dvhart@linux.intel.com>
> >>>
> >>> The following changes since commit 32a4e746273c3c7d3dd0f13b745bc0679cadaa44:
> >>>
> >>>     codeparser.py: fix syntax error in exception handling (2011-05-24 17:16:47 +0100)
> >>>
> >>> are available in the git repository at:
> >>>     git://git.pokylinux.org/poky-contrib.git dvhart/build
> >>>     http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dvhart/build
> >>>
> >>> Darren Hart (1):
> >>>     oe-setup-builddir: remove unreachable code, update comments
> >>>
> >>>    scripts/create-pull-request |    2 +-
> >>>    scripts/oe-setup-builddir   |   32 +++++++++++++-------------------
> >>>    2 files changed, 14 insertions(+), 20 deletions(-)
> >>>
> >>>
> >> If this is intended for oe-core, please rebase to oe-core and resend, I
> >> had a merge issue and want to make sure I am getting the right code
> >> committed.
> >
> >
> > Gah, right. I saw the oe- in the script name and just had oe-core in my
> > head. Apologies. The two scripts are slightly different in the two
> > repositories, but both suffer from the same unreachable code problem.
> >
> > Would you prefer I send two patches, one for each repository, or that I
> > push to one or the other and let you handle the merge process as part of
> > the regular sync up process (whatever that is).
> >
> Typically, if something is part of oe-core than a patch request goes 
> there and then Richard will pull it across to poky.  This is a special 
> case and I am not sure how he is handling this currently. So we need 
> Richard to chime in on this one.

They should be the same script, that is what I've been aiming for. If
they're not, we need to work out how to get them there...

Cheers,

Richard



