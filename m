Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 5A9FA77F76
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 01:09:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id F1A5C20BA9;
	Wed, 12 Jul 2017 01:09:52 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id H0VooPdgpNLv; Wed, 12 Jul 2017 01:09:52 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A7FFB203C2;
	Wed, 12 Jul 2017 01:09:47 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 3A6AC162526; Tue, 11 Jul 2017 21:09:47 -0400 (EDT)
Date: Tue, 11 Jul 2017 21:09:47 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Tom Rini <trini@konsulko.com>
Message-ID: <20170712010947.GH26405@denix.org>
References: <20170710183657.12885-1-otavio@ossystems.com.br>
	<1d8dd351-0d96-0766-1beb-6ac621a6bfe4@denx.de>
	<CAP9ODKpJTG3siy9Qo+EFm3QTnQYhn0Q2dc-pq6gq3Wq=hpscXA@mail.gmail.com>
	<7e5cb452-d500-f57d-9830-f936db12418b@denx.de>
	<20170710190128.GE22707@bill-the-cat>
	<ce1cd8f5-1c41-87c0-57b4-d92abb3c177e@denx.de>
	<20170710190621.GF22707@bill-the-cat>
	<02ee9f46-27db-0bb9-7506-009d46351437@gmail.com>
	<20170710191219.GG22707@bill-the-cat>
MIME-Version: 1.0
In-Reply-To: <20170710191219.GG22707@bill-the-cat>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Marek Vasut <marex@denx.de>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>
Subject: Re: [PATCH] u-boot: Upgrade to 2017.07 release (WIP)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Jul 2017 01:09:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 10, 2017 at 03:12:19PM -0400, Tom Rini wrote:
> On Mon, Jul 10, 2017 at 12:08:41PM -0700, Khem Raj wrote:
> > On 7/10/17 12:06 PM, Tom Rini wrote:
> > > On Mon, Jul 10, 2017 at 09:02:39PM +0200, Marek Vasut wrote:
> > >> On 07/10/2017 09:01 PM, Tom Rini wrote:
> > >>> On Mon, Jul 10, 2017 at 08:57:19PM +0200, Marek Vasut wrote:
> > >>>> On 07/10/2017 08:51 PM, Otavio Salvador wrote:
> > >>>>> On Mon, Jul 10, 2017 at 3:47 PM, Marek Vasut <marex@denx.de> wrote:
> > >>>>>> On 07/10/2017 08:36 PM, Otavio Salvador wrote:
> > >>>>>>> This patch upgrades the U-Boot to the 2017.07 release.
> > >>>>>>>
> > >>>>>>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> > >>>>>>> ---
> > >>>>>>>
> > >>>>>>>  .../u-boot/{u-boot-common_2017.05.inc => u-boot-common_2017.07.inc}     | 2 +-
> > >>>>>>>  .../u-boot/{u-boot-fw-utils_2017.05.bb => u-boot-fw-utils_2017.07.bb}   | 0
> > >>>>>>>  .../u-boot/{u-boot-mkimage_2017.05.bb => u-boot-mkimage_2017.07.bb}     | 0
> > >>>>>>>  meta/recipes-bsp/u-boot/{u-boot_2017.05.bb => u-boot_2017.07.bb}        | 0
> > >>>>>>>  4 files changed, 1 insertion(+), 1 deletion(-)
> > >>>>>>>  rename meta/recipes-bsp/u-boot/{u-boot-common_2017.05.inc => u-boot-common_2017.07.inc} (88%)
> > >>>>>>>  rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2017.05.bb => u-boot-fw-utils_2017.07.bb} (100%)
> > >>>>>>>  rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2017.05.bb => u-boot-mkimage_2017.07.bb} (100%)
> > >>>>>>>  rename meta/recipes-bsp/u-boot/{u-boot_2017.05.bb => u-boot_2017.07.bb} (100%)
> > >>>>>>>
> > >>>>>>> diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2017.05.inc b/meta/recipes-bsp/u-boot/u-boot-common_2017.07.inc
> > >>>>>>> similarity index 88%
> > >>>>>>> rename from meta/recipes-bsp/u-boot/u-boot-common_2017.05.inc
> > >>>>>>> rename to meta/recipes-bsp/u-boot/u-boot-common_2017.07.inc
> > >>>>>>> index 0e52f27df8..f27989daa1 100644
> > >>>>>>> --- a/meta/recipes-bsp/u-boot/u-boot-common_2017.05.inc
> > >>>>>>> +++ b/meta/recipes-bsp/u-boot/u-boot-common_2017.07.inc
> > >>>>>>> @@ -7,7 +7,7 @@ PE = "1"
> > >>>>>>>
> > >>>>>>>  # We use the revision in order to avoid having to fetch it from the
> > >>>>>>>  # repo during parse
> > >>>>>>> -SRCREV = "64c4ffa9fa223f7ae8640f9c8f3044bfa0e3bfda"
> > >>>>>>> +SRCREV = "d85ca029f257b53a96da6c2fb421e78a003a9943"
> > >>>>>>
> > >>>>>> Where did you get this hash from, it's not in the U-Boot repo ...
> > >>>>>
> > >>>>> From the tag used by Tom. You can check it on his github repository.
> > >>>>
> > >>>> I cannot, that is NOT where the U-Boot recipe points to nor is it in any
> > >>>> way an official U-Boot source git tree .
> > >>>
> > >>> It's also on the official github mirror.  I'll go see why the DENX git
> > >>> is lagging behind.
> > >>
> > >> Hm that's weird. How can it be a mirror if it contains objects not in
> > >> the mirrored repo ? ;-)
> > > 
> > > git supports multiple push URIs.  So I update all 3 locations with a
> > > single push.  However, git.denx.de works differently than github.com
> > > does.
> > 
> > may be pushing to upstream and then pulling before populating the
> > mirrors could solve such issues. but I think we should use github.com
> > in OE src_uri's for speed reasons.
> 
> On the back end, things are a bit more complex than that, but I'm
> working to resolve the current error now.  FWIW, changing the OE recipe
> to fetch from https://github.com/u-boot/u-boot.git would be fine with
> me, it's owned by myself, Wolfgang and the person that helped us out and
> got that project created to start with, so it will only have official
> changes in it.

FWIW, I'd be against such change, as long as denx.de remains the official 
home of U-boot. We don't pull kernel from https://github.com/torvalds/linux

-- 
Denys

