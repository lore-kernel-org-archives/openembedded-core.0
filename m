Return-Path: <rpjday@crashcourse.ca>
Received: from smtp486.redcondor.net (smtp486.redcondor.net [208.80.204.86])
	by mail.openembedded.org (Postfix) with ESMTP id 1C1DA60602
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Feb 2017 21:24:15 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp486.redcondor.net ({6695537a-536a-45f9-a249-877c85428649})
	via TCP (outbound) with ESMTPS id 20170203212413621_0486;
	Fri, 03 Feb 2017 21:24:13 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [174.118.92.171] (port=54464 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1cZlKw-0007l2-44; Fri, 03 Feb 2017 16:24:06 -0500
Date: Fri, 3 Feb 2017 16:24:03 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Patrick Ohly <patrick.ohly@intel.com>
In-Reply-To: <1486156855.14889.103.camel@intel.com>
Message-ID: <alpine.LFD.2.20.1702031623390.12084@localhost.localdomain>
References: <alpine.LFD.2.20.1702030641310.2549@localhost.localdomain>
	<1486131492.14144.70.camel@linuxfoundation.org>
	<alpine.LFD.2.20.1702031414250.9747@localhost.localdomain>
	<1486156855.14889.103.camel@intel.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: whatever happened to a proposal for "read-only" sstate?
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
X-List-Received-Date: Fri, 03 Feb 2017 21:24:17 -0000
Content-Type: text/plain; charset=US-ASCII

On Fri, 3 Feb 2017, Patrick Ohly wrote:

> On Fri, 2017-02-03 at 14:14 -0500, Robert P. J. Day wrote:
> >   is there a command that will tell you how much shared state info a
> > given build would be able to take advantage of?
>
> INHERIT += "buildstats-summary" in local.conf will print that
> information after a build is done.

  but not before? ok, that will do for now.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


