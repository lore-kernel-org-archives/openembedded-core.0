Return-Path: <rpjday@crashcourse.ca>
Received: from smtp685.redcondor.net (smtp685.redcondor.net [208.80.206.85])
	by mail.openembedded.org (Postfix) with ESMTP id 7BE4E60853
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2016 10:19:22 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp685.redcondor.net ({20c8e40f-6b6c-4c9e-abff-1640ea7bf404})
	via TCP (outbound) with ESMTPS id 20160729101920679_0685;
	Fri, 29 Jul 2016 03:19:20 -0700
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=44564 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1bT4uj-0005So-VO; Fri, 29 Jul 2016 06:21:10 -0400
Date: Fri, 29 Jul 2016 06:19:13 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Ed Bartosh <ed.bartosh@linux.intel.com>
In-Reply-To: <20160729082501.GB32340@linux.intel.com>
Message-ID: <alpine.LFD.2.20.1607290614570.22106@localhost.localdomain>
References: <alpine.LFD.2.20.1607281728250.18613@localhost.localdomain>
	<20160729082501.GB32340@linux.intel.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: does "wic" allow one to actually format physical devices?
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
X-List-Received-Date: Fri, 29 Jul 2016 10:19:23 -0000
Content-Type: text/plain; charset=US-ASCII

On Fri, 29 Jul 2016, Ed Bartosh wrote:

> On Thu, Jul 28, 2016 at 05:30:14PM -0400, Robert P. J. Day wrote:
> >
> >   never used "wic" before, and i'm wondering if it has the ability
> > to not create dd-able images so much as partition and format
> > physical target devices. surely, the underlying logic would be the
> > same, i just want to work with the target hard drive and bypass
> > creating the image itself.
>
> The only purpose of wic is to create images. I'm afraid it doesn't
> have the functionality you're looking for.

  i thought that was the case, just wanted to make sure. and perhaps
i'm just missing it, but where is the canonical documentation for wic,
it might still be useful for what i'm doing.

rday

p.s. i'm assuming you can use 'wic' only in the context of an OE
build, yes? at least it appears that way.


