Return-Path: <mac@mcrowe.com>
X-Greylist: delayed 458 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 06 Nov 2015 10:37:45 UTC
Received: from avasout06.plus.net (avasout06.plus.net [212.159.14.18])
	by mail.openembedded.org (Postfix) with ESMTP id 4107F60124
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Nov 2015 10:37:44 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by avasout06 with smtp
	id eAW51r0030BmcFC01AW6N9; Fri, 06 Nov 2015 10:30:06 +0000
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.1 cv=E4sw3vpl c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=0Bzu9jTXAAAA:8
	a=-An2I_7KAAAA:8 a=kj9zAlcOel0A:10 a=qtqOOiqGOCEA:10
	a=pohJM8352FWg_SwRCbwA:9 a=CjuIK1q_8ugA:10
Received: from mac by deneb with local (Exim 4.84)
	(envelope-from <mac@mcrowe.com>)
	id 1ZueHU-0002UQ-W7; Fri, 06 Nov 2015 10:30:04 +0000
Date: Fri, 6 Nov 2015 10:30:04 +0000
From: Mike Crowe <mac@mcrowe.com>
To: Andre McCurdy <armccurdy@gmail.com>
Message-ID: <20151106103004.GA7454@mcrowe.com>
References: <1446734821-6011-1-git-send-email-mac@mcrowe.com>
	<CAJ86T=WxqbJ83S4RESL_oKX9gYNg6-aAPGUYR3btSQBhKQo-1g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ86T=WxqbJ83S4RESL_oKX9gYNg6-aAPGUYR3btSQBhKQo-1g@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake.conf, module.bbclass: Support opting out of legacy EXTRA_OEMAKE
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
X-List-Received-Date: Fri, 06 Nov 2015 10:37:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Friday 06 November 2015 at 01:16:46 -0800, Andre McCurdy wrote:
> On Thu, Nov 5, 2015 at 6:47 AM, Mike Crowe <mac@mcrowe.com> wrote:
> > Give recipes and classes the ability to opt out of EXTRA_OEMAKE
> > containing the legacy value without removing other recipe-specific or
> > local additions.
> 
> Isn't this possible already from within a recipe or class by using
> 
>   EXTRA_OEMAKE = ...
> 
> instead of
> 
>   EXTRA_OEMAKE += ...
> 
> ie what autotools.bbclass, kernel.bbclass and many recipes do already.
> 
> For the specific case of module.bbclass, changing the EXTRA_OEMAKE
> assignment to '=' might require some recipes to be tweaked to so that
> they "inherit module" before adding their own options to EXTRA_OEMAKE,
> but it seems like a cleaner solution?

It would be, but I was afraid of what I might break. I suspect that there
are many unseen third-party and local recipes that inherit module.bbclass.

It would be great to get to the point that EXTRA_OEMAKE is empty by default
but I imagine that the experts are already aware of the difficulties with
doing this which is why the current value has lasted so long.

Mike.

