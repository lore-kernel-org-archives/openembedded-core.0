Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SkaSB-00054L-Pg for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 14:37:39 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5TCQiBZ002036
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2012 13:26:44 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 31331-10 for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2012 13:26:39 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5TCQc5w002030
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2012 13:26:38 +0100
Message-ID: <1340972802.23146.153.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 29 Jun 2012 13:26:42 +0100
In-Reply-To: <CAMKF1soWzVQO2Y0gQAS_wi9ng3TyyFhMQqBEZiQN4SNCmy6RUA@mail.gmail.com>
References: <cover.1340402353.git.sgw@linux.intel.com>
	<1340639719.23146.1.camel@ted>
	<CAMKF1soWzVQO2Y0gQAS_wi9ng3TyyFhMQqBEZiQN4SNCmy6RUA@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 00/17] Misc Fixes & Updates
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
X-List-Received-Date: Fri, 29 Jun 2012 12:37:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-06-25 at 14:14 -0700, Khem Raj wrote:
> On Mon, Jun 25, 2012 at 8:55 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >>   qemu-git: Move to tip of git
> >>  qemu_git: set empty PACKAGECONFIG
> >
> > I have said no to this until the patch set gets updated. It will just
> > get ignored/forgotten about otherwise.
> >
> 
> qemu git recipe as we have today is probably useless and its older
> than 0.15 even and in any case set to D_P = "-1", forward porting
> those gl patches is non trivial
> intention of this recipe is to have support/fixes for machines that
> had been since added and gl patches are x86 specific.
> 
> I feel its a unnecessary restriction you are imposing for a recipe
> which is not used by default even.

Having one recipe that provides different sets of features with the same
configuration is something I get concerned about.

I'm putting on some pressure to the team to figure out how/when we're
going to upgrade this. I'm hoping to have an answer on that soon.

Cheers,

Richard



