Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SHw0D-00083Y-1w for openembedded-core@lists.openembedded.org;
	Wed, 11 Apr 2012 13:46:21 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3BBb35j007570
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2012 12:37:03 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07435-02 for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2012 12:36:57 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3BBatCH007564
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2012 12:36:56 +0100
Message-ID: <1334144215.10826.161.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 11 Apr 2012 12:36:55 +0100
In-Reply-To: <519A24BF-BBF0-4C58-8418-27F742D03D7F@dominion.thruhere.net>
References: <1333626507-32182-1-git-send-email-stefan@herbrechtsmeier.net>
	<4F7E607E.9050101@linux.intel.com>
	<1967D97F-63A7-49DA-930F-A0C6F1F4112F@dominion.thruhere.net>
	<1334065279.10826.14.camel@ted>
	<519A24BF-BBF0-4C58-8418-27F742D03D7F@dominion.thruhere.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] u-boot: add machine name to spl image name
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
X-List-Received-Date: Wed, 11 Apr 2012 11:46:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-04-10 at 15:56 +0200, Koen Kooi wrote:
> Op 10 apr. 2012, om 15:41 heeft Richard Purdie het volgende geschreven:
> 
> > On Fri, 2012-04-06 at 06:29 -0700, Koen Kooi wrote:
> >> 
> >> Op 5 apr. 2012 om 20:18 heeft Saul Wold <sgw@linux.intel.com> het volgende geschreven:
> >> 
> >>> On 04/05/2012 04:48 AM, Stefan Herbrechtsmeier wrote:
> >>>> Signed-off-by: Stefan Herbrechtsmeier<stefan@herbrechtsmeier.net>
> >>>> ---
> >>>> meta/recipes-bsp/u-boot/u-boot.inc        |    2 +-
> >>>> meta/recipes-bsp/u-boot/u-boot_2011.03.bb |    2 +-
> >>>> meta/recipes-bsp/u-boot/u-boot_2011.06.bb |    2 +-
> >>>> 3 files changed, 3 insertions(+), 3 deletions(-)
> >>>> 
> >>>> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
> >>>> index 700d5d3..0445c34 100644
> >>>> --- a/meta/recipes-bsp/u-boot/u-boot.inc
> >>>> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> >>>> @@ -32,7 +32,7 @@ UBOOT_MAKE_TARGET ?= "all"
> >>>> # deploy directory.  For those versions they can set the following variables
> >>>> # to allow packaging the SPL.
> >>>> SPL_BINARY ?= ""
> >>>> -SPL_IMAGE ?= "${SPL_BINARY}-${PV}-${PR}"
> >>>> +SPL_IMAGE ?= "${SPL_BINARY}-${MACHINE}-${PV}-${PR}"
> >>>> SPL_SYMLINK ?= "${SPL_BINARY}-${MACHINE}"
> >>>> 
> >>>> do_compile () {
> >>>> diff --git a/meta/recipes-bsp/u-boot/u-boot_2011.03.bb b/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
> >>>> index 1ebdbea..e99bc2c 100644
> >>>> --- a/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
> >>>> +++ b/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
> >>>> @@ -17,7 +17,7 @@ FILESDIR = "${@os.path.dirname(d.getVar('FILE',1))}/u-boot-git/${MACHINE}"
> >>>> SRCREV = "19b54a701811220221fc4d5089a2bb18892018ca"
> >>>> 
> >>>> PV = "v2011.03+git${SRCPV}"
> >>>> -PR = "r5"
> >>>> +PR = "r6"
> >>>> 
> >>>> SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
> >>>> 
> >>>> diff --git a/meta/recipes-bsp/u-boot/u-boot_2011.06.bb b/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
> >>>> index 8ebdbff..680401f 100644
> >>>> --- a/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
> >>>> +++ b/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
> >>>> @@ -17,7 +17,7 @@ FILESDIR = "${@os.path.dirname(d.getVar('FILE',1))}/u-boot-git/${MACHINE}"
> >>>> SRCREV = "b1af6f532e0d348b153d5c148369229d24af361a"
> >>>> 
> >>>> PV = "v2011.06+git${SRCPV}"
> >>>> -PR = "r0"
> >>>> +PR = "r1"
> >>>> 
> >>>> SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
> >>>> 
> >>> 
> >>> Merged into OE-Core
> >> 
> >> wait a minute, why was this merged?
> > 
> > In retrospect it shouldn't.
> 
> Can we back it out? It breaks a ton of buildscripts. SPL_SYMLINK already has the machine.
> 
> > It was presented to me as part of a series
> > and I wasn't careful enough about sifting through the commits, likely
> > the jetlag wasn't helping. I'll aim to try harder, people can help by
> > pointing out patches they don't think should be going into the release
> > at this point...
> 
> I read Sauls mail at the airport at 6:30 in the morning, which means
> that if I skipped sleeping I would have had a 16 hour window to
> object. For a bootloader patch that's not enough. Especially when the
> people who care about bootloaders are on spring break or attending
> collab.

I don't expect people to wait for Saul's emails and then review patches
already on the mailing list.

Regardless, I'm rather torn in this case. Stefan's usecase is a valid
one and I don't see why we have to change the layout of DEPLOY_DIR
because of this one issue. I know of people doing some interesting
things with layouts and I don't really want to impose policy on that
which the change you propose does. Having the symlink contain MACHINE
but not the name is rather odd.

I also agree its late in the cycle for something which breaks build
scripts however :(.

So I'm probably in favour of reverting from 1.2 but adding straight away
for 1.3 although I don't like letting 1.2 out with this issue present
really.

Cheers,

Richard





