Return-Path: <pb@pbcl.net>
Received: from pbcl.net (pbcl.net [159.69.221.92])
	by mail.openembedded.org (Postfix) with ESMTP id 0CDF57F47E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2019 11:49:03 +0000 (UTC)
Received: from pb by pbcl.net with local (Exim 4.89)
	(envelope-from <pb@pbcl.net>)
	id 1iZvoe-00081e-K1; Wed, 27 Nov 2019 12:49:04 +0100
Date: Wed, 27 Nov 2019 12:49:04 +0100
From: Phil Blundell <pb@pbcl.net>
To: Cengiz Can <cengiz@kernel.wtf>
Message-ID: <20191127114904.bfiotnxlsebtpko7@pbcl.net>
References: <20191126133943.124402-1-cengiz@kernel.wtf>
	<20191126181929.sys6lo2fadf72wdn@pbcl.net>
	<16ea94ea570.2bfa.85c738e3968116fc5c0dc2de74002084@kernel.wtf>
MIME-Version: 1.0
In-Reply-To: <16ea94ea570.2bfa.85c738e3968116fc5c0dc2de74002084@kernel.wtf>
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd-conf: add timesyncd.conf
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
X-List-Received-Date: Wed, 27 Nov 2019 11:49:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 26, 2019 at 11:02:15PM +0300, Cengiz Can wrote:
> 1) Does Google allow their time servers to be directly used?

I believe so.  I couldn't immediately find anything on their website that
said differently.

> 2) Can we apply for a vendor name like "oe" so at least they can
> throttle/rate limit their inbound traffic?

I guess the OpenEmbedded corporate entity could apply for one.  I don't
actually know what the current organisation is; the website just says
"OpenEmbedded is a Texas-registered company. More details to follow."

Mostly though I think this is a distro configuration issue and ought to
be addressed there.

> Because at current state, timesyncd is unreliable and doesn't have sane
> defaults enabled. pool.ntp.org is a community effort but has thousands of
> servers that are available for service. Not just 4 Google controlled
> servers.

I'm fairly sure that time.google.com has more than four servers (they are
load-balanced behind a single public IP, just like the Google nameserver
8.8.4.4 is not a single machine either).  It's not completely obvious to 
me that pool.ntp.org is generally more available.

The Google servers also do leap smearing which might or might not be a 
good thing depending on your point of view.  I'm not sure whether the
pool.ntp.org ones do the same thing or not.

p.

