Return-Path: <alexandre.belloni@free-electrons.com>
Received: from mail.free-electrons.com (down.free-electrons.com
	[37.187.137.238])
	by mail.openembedded.org (Postfix) with ESMTP id C1B9D65D00
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Feb 2015 18:43:07 +0000 (UTC)
Received: by mail.free-electrons.com (Postfix, from userid 106)
	id 72FDB897; Wed,  4 Feb 2015 19:43:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	mail.free-electrons.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT,
	URIBL_BLOCKED shortcircuit=ham autolearn=disabled version=3.4.0
Received: from localhost (128-79-216-6.hfc.dyn.abo.bbox.fr [128.79.216.6])
	by mail.free-electrons.com (Postfix) with ESMTPSA id CC55B7FC;
	Wed,  4 Feb 2015 19:42:12 +0100 (CET)
Date: Wed, 4 Feb 2015 19:42:05 +0100
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: Tom Zanussi <tom.zanussi@linux.intel.com>
Message-ID: <20150204184205.GA4443@piout.net>
References: <1423006826-10627-1-git-send-email-alexandre.belloni@free-electrons.com>
	<1423074778.18649.24.camel@picadillo>
MIME-Version: 1.0
In-Reply-To: <1423074778.18649.24.camel@picadillo>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wic: use kB for the partitions size
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
X-List-Received-Date: Wed, 04 Feb 2015 18:43:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 04/02/2015 at 12:32:58 -0600, Tom Zanussi wrote :
> On Wed, 2015-02-04 at 00:40 +0100, Alexandre Belloni wrote:
> > Use kB instead of MB for the partition size to get a better granularity.
> > 
> > This is needed on some SoC (i.mx, omap) where it is necessary to create
> > partitions as small as 64kB.
> > 
> > Keep the backward compatibility by assuming MB when no unit is provided.
> > 
> 
> Looks fine to me, and a quick test shows expected sizes, etc.
> 
> But please do update at least the in-tool help (/lib/image/help.py) with
> the new --size options.

Sure, I will do. I just realized it existed ;)

Thanks for the review.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

