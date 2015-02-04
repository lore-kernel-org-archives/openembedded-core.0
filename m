Return-Path: <alexandre.belloni@free-electrons.com>
Received: from mail.free-electrons.com (down.free-electrons.com
	[37.187.137.238])
	by mail.openembedded.org (Postfix) with ESMTP id B706D6013C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Feb 2015 10:53:06 +0000 (UTC)
Received: by mail.free-electrons.com (Postfix, from userid 106)
	id E48723A3; Wed,  4 Feb 2015 11:53:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	mail.free-electrons.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT,
	URIBL_BLOCKED shortcircuit=ham autolearn=disabled version=3.4.0
Received: from localhost (128-79-216-6.hfc.dyn.abo.bbox.fr [128.79.216.6])
	by mail.free-electrons.com (Postfix) with ESMTPSA id AF1452F3;
	Wed,  4 Feb 2015 11:53:12 +0100 (CET)
Date: Wed, 4 Feb 2015 11:53:06 +0100
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
Message-ID: <20150204105306.GA4060@piout.net>
References: <1423006826-10627-1-git-send-email-alexandre.belloni@free-electrons.com>
	<20150204102923.GA3901@localhost.localdomain>
MIME-Version: 1.0
In-Reply-To: <20150204102923.GA3901@localhost.localdomain>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
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
X-List-Received-Date: Wed, 04 Feb 2015 10:53:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 04/02/2015 at 11:29:23 +0100, Maciej Borzecki wrote :
> > +    mapping = {"opt": opt, "value": value}
> > +    if (not value[0:len(value)-1].isdigit()):
> 
> You might want to replace value[0:len(value)-1] with value[:-1] here and
> in int(...) below.
> 

Ah sure, I was looking for a better way to do that, thanks!

> Other than that, the patch looks ok for me. I've built a couple of
> images with different sizes (with and without suffix), all worked fine.
> 
> Tested-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
> 
-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

