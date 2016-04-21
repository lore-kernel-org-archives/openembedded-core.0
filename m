Return-Path: <rpjday@crashcourse.ca>
Received: from smtp685.redcondor.net (smtp685.redcondor.net [208.80.206.85])
	by mail.openembedded.org (Postfix) with ESMTP id 3D27C73182
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2016 13:15:04 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp685.redcondor.net ({20c8e40f-6b6c-4c9e-abff-1640ea7bf404})
	via TCP (outbound) with ESMTPS id 20160421131449097_0685;
	Thu, 21 Apr 2016 06:14:49 -0700
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=29665 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1atESs-0006Zw-GD; Thu, 21 Apr 2016 09:16:14 -0400
Date: Thu, 21 Apr 2016 09:14:32 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Joshua G Lock <joshua.g.lock@linux.intel.com>
In-Reply-To: <1461242448.3571.4.camel@linux.intel.com>
Message-ID: <alpine.LFD.2.20.1604210912070.3580@localhost.localdomain>
References: <alpine.LFD.2.20.1604210738320.5726@localhost.localdomain>
	<CAJTo0LakXXOvj9_aKmYxy4OdxgP6rOp5EqLZtAajp8iFf7qkuA@mail.gmail.com>
	<alpine.LFD.2.20.1604210822220.6578@localhost.localdomain>
	<1461242448.3571.4.camel@linux.intel.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: trying to reconcile OE builds with rpm4-format rpm files built on centos 6
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
X-List-Received-Date: Thu, 21 Apr 2016 13:15:05 -0000
Content-Type: text/plain; charset=US-ASCII

On Thu, 21 Apr 2016, Joshua G Lock wrote:

... snip ...

> On the topic of RPM4 vs. RPM5 you should be able to find more
> details in the list archives, I easily found a brief summary by Mark
> Hatle in the Yocto Project mailing list archive:
>
> "There are some specific uses of RPM 4 in the YP, but I do caution
> against people just using it "because".  The RPM 5 version is
> generally better suited for the embedded world.  (There are been
> posts on more reasons on the oe-core lists in the past.  But as
> quick summary -- dynamic architecture support, better cross
> compilation support, cross- endian support, more configurable for
> custom distributions, etc.)"
> http://article.gmane.org/gmane.linux.embedded.yocto.general/28654/
>
> We ended up removing RPM4 support because it was clear that it was
> broken when using SMART as a package manager and we didn't have the
> resources to fix it, nor any objections to its removal.

  ah, i was unaware that smart does not play well with RPM4 ... i
think i'd better collect all this info so i can present it in one
shot. i think i'm going to look into the feasibility of installing
RPM5 on that centos build server, unless someone cautions me against
it.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


