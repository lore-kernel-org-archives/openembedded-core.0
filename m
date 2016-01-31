Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id BD811731EC
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jan 2016 22:39:39 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25] helo=e130.local)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1aQ0eg-0001ZM-Ky; Sun, 31 Jan 2016 23:39:39 +0100
Message-ID: <1454279971.7421.31.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Date: Sun, 31 Jan 2016 22:39:31 +0000
In-Reply-To: <20160131215146.GB8889@windriver.com>
References: <1454270163-5294-1-git-send-email-paul.gortmaker@windriver.com>
	<1454273105.7421.24.camel@pbcl.net>
	<20160131215146.GB8889@windriver.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] xterm: revert FILES_PN change from recent package uprev
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
X-List-Received-Date: Sun, 31 Jan 2016 22:39:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2016-01-31 at 16:51 -0500, Paul Gortmaker wrote:
> If i go into poky/meta-openembedded, and crack open .git/config I'll see
> the source git://git.openembedded.org/meta-openembedded listed.  So I
> think at least at that point, I need to look at OE lists and not yocto
> lists.  But looking the 2nd link above I'm still none the wiser where in
> OE the xterm patch needs to be sent to, and OE-core looks right until I
> clone core and find the file simply isn't there.

I agree that this is confusing, and the way that poky merges all the
layers together into a single tree doesn't help.  But in fact I think
you were already 90% of the way there.  Once you've figured out that
this is part of meta-openembedded, you just need to consult the README
file in the appropriate subdir, for example:

http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/README

(which, I assume, also shows up in your poky checkout although I haven't
checked this)

> Is there a 1:1 mapping between mailing lists <---> git://<server>/<path>
> out there, since I think that would help.  And/or maybe a get_maintainer
> script like the kernel has.

Not that I know of, but that sounds like a good idea.  Perhaps it could
be added to the layer index page:

http://layers.openembedded.org/layerindex/branch/master/layers/

p.



