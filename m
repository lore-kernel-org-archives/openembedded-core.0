Return-Path: <ejo@pengutronix.de>
Received: from metis.ext.4.pengutronix.de (metis.ext.4.pengutronix.de
	[92.198.50.35])
	by mail.openembedded.org (Postfix) with ESMTP id C9063774F2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jun 2016 06:50:56 +0000 (UTC)
Received: from mango.hi.pengutronix.de ([2001:67c:670:100:76d4:35ff:fee8:98b3])
	by metis.ext.pengutronix.de with esmtp (Exim 4.80)
	(envelope-from <ejo@pengutronix.de>)
	id 1b8iwa-0005mc-2B; Fri, 03 Jun 2016 08:50:56 +0200
To: Renato Caldas <rm.santos.caldas@gmail.com>
References: <20160528115341.4965-1-rm.santos.caldas@gmail.com>
	<1464613445-18617-1-git-send-email-ejo@pengutronix.de>
	<CA+21M5DUAvp1csE=kARmE2Fg3SyfzxDO0L2GuBsvpSMjiiN2Xg@mail.gmail.com>
From: Enrico Joerns <ejo@pengutronix.de>
Message-ID: <575128CF.8010308@pengutronix.de>
Date: Fri, 3 Jun 2016 08:50:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.7.0
MIME-Version: 1.0
In-Reply-To: <CA+21M5DUAvp1csE=kARmE2Fg3SyfzxDO0L2GuBsvpSMjiiN2Xg@mail.gmail.com>
X-SA-Exim-Connect-IP: 2001:67c:670:100:76d4:35ff:fee8:98b3
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] perl-ptest.inc: fix tar call to prevent objcopy failure
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
X-List-Received-Date: Fri, 03 Jun 2016 06:50:58 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Renato,

thanks for the comments on my changes.

On 05/31/2016 01:35 PM, Renato Caldas wrote:
> My suggestion is that you submit a new patch with those improvements
> on top of the quick fix I made. I suggest you also add quotes to the
> --exclude options per tar's man page.

I did not find any hints about quotes, where is it written? It also 
seems to me that the man page in current tar (1.29) is a bit incomplete 
as it does not mention any 'exclude' option, anymore. At least on my 
distro (debian).

> You might also want to simplify the commit message a bit. I'm fairly
> new to yocto (and my view may be wrong), but this is how I would do
> it:
> - change the component name from "perl-ptest.inc:" to "perl:"

Maybe "perl-ptest" would be ok, too, as it matches the resulting 
packages name.

> - use the commit title to describe the change you made, not exactly
> what bug it fixed. Example: "fix tar call according to its man page"
> (or something like that)
> - describe the change in simpler terms. Taking what you wrote, I would
> rewrite it like this:
>
> "The existing tar call on do_install_ptest() did not match the man
> page, but worked with older tar versions. The new 1.29 version of tar
> has stricter argument handling, and future versions may be even
> stricter. Failure to use it according to its manual may result in
> arguments being silently ignored and breaking the build."
>

Yes, sounds good to me. And my original message does not match the 
remaining changes anymore. Is it ok if I take your text, and add you as 
Signed-off for the patch then?

>
> So while changing the position of the "*" fixed it for tar 1.29, your
> proposed changes are important to future-proof the perl recipe for
> newer tar versions. As such, please do submit a new patch.

I will do so, then.


Best regard, Enrico

-- 
Pengutronix e.K.                           | Enrico Jörns                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-5080 |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |


