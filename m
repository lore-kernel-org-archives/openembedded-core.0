Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id DC73E606E8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Feb 2015 08:55:42 +0000 (UTC)
Received: from [99.240.204.5] (port=50048 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1YPSKB-0007tQ-8y; Sun, 22 Feb 2015 03:55:39 -0500
Date: Sun, 22 Feb 2015 03:55:39 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: Sven Ebenfeld <sven.ebenfeld@gmail.com>
In-Reply-To: <54E99779.2030405@gmail.com>
Message-ID: <alpine.LFD.2.11.1502220350280.14143@localhost>
References: <alpine.LFD.2.11.1502220327320.12673@localhost>
	<54E99779.2030405@gmail.com>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: openembedded-core@lists.openembedded.org
Subject: Re: how to (yuck) add arbitrary external files into an image?
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
X-List-Received-Date: Sun, 22 Feb 2015 08:55:43 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Sun, 22 Feb 2015, Sven Ebenfeld wrote:

> Am 22.02.2015 um 09:33 schrieb Robert P. J. Day:
> >
> >   as much as this disturbs me, i was asked about the easiest way
> > to add arbitrary files scattered across the development host into
> > the final OE-generated image and, based on richard purdie's recent
> > clarification that *everything* that is listed in SRC_URI is
> > unloaded into WORKDIR, i suspect the easiest thing to do is create
> > a recipe where SRC_URI lists all of those files with "file:///",
> > and write an explicit install task that manually copies them, one
> > at a time, into their final location in D, yes?
> >
> >   i don't like this at all, but if it has to be done, is this at
> > least the "best" way to do it?
>
> I think the "best" way would be to create one recipe that collects
> these files and just installs them into $D. Then you could select
> this package in IMAGE_INSTALL as you described above.

  right ... isn't that what i was describing? or are you suggesting
some variation on that? i was envisioning a single recipe with a
SRC_URI loaded with "file:///" components.

> Another way is to use a ROOTFS_POSTPROCESS_COMMAND if you only need
> to do this for one image.

  ah, quite right, another simple option, thanks.

rday

p.s.  yes, i do understand that this is a tacky thing to do.
sometimes, you just need to do tacky.

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

