Return-Path: <cshored@thecshore.com>
X-Greylist: delayed 561 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 20 Apr 2018 12:12:01 UTC
Received: from mail.thecshore.com (mail.thecshore.com [144.217.14.6])
	by mail.openembedded.org (Postfix) with ESMTP id 38A487467C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Apr 2018 12:12:01 +0000 (UTC)
Received: from [10.137.0.15] (107-179-160-78.cpe.teksavvy.com [107.179.160.78])
	by mail.thecshore.com (Postfix) with ESMTPSA id 7EBC526B9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Apr 2018 08:02:40 -0400 (EDT)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.thecshore.com 7EBC526B9
Authentication-Results: mail.thecshore.com;
	dmarc=none (p=none dis=none) header.from=thecshore.com
Authentication-Results: mail.thecshore.com;
	spf=fail smtp.mailfrom=cshored@thecshore.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.thecshore.com 7EBC526B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thecshore.com;
	s=default; t=1524225760;
	bh=8sLMkhUo9MKjjfEvk+zRbREyVYzynB7eJl6JYbRaCjE=;
	h=Subject:To:References:From:Date:In-Reply-To:From;
	b=aqqZZ3Uqp00wyq6yLiqeCoSXJUHUtPuFinnsA6BHROuPLzybWLT9pqNRp8ptiG9qN
	etr+JAunUEhNgPqOWFsiVXfrPib2r8uXTVBypLB6wOb8qILfawnqBmREkq6JRKGEdT
	YEi1cgV/yAVu4BRm98XUJM97aEj2GdpGkz3x21QM=
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.99.4 at mail.thecshore.com
To: openembedded-core@lists.openembedded.org
References: <1524154643.18865.113.camel@linuxfoundation.org>
From: "Daniel F. Dickinson" <cshored@thecshore.com>
Message-ID: <39f087be-1129-6131-d5d1-5714f127667b@thecshore.com>
Date: Fri, 20 Apr 2018 08:02:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <1524154643.18865.113.camel@linuxfoundation.org>
Subject: Re: 2.6 planning proposals and meeting
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
X-List-Received-Date: Fri, 20 Apr 2018 12:12:02 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 8bit

On 2018-04-19 12:17 PM, Richard Purdie wrote:
> [Widely cross posted but please reply to openembedded-core only for
> want of picking somewhere to discuss this]
> 
> The next big question facing us is what would we like to do in 2.6?
> What can we do with the resources we have?
> 
> I'm proposing to hijack the next monthly Yocto Project technical
> call[1] and dedicate it to 2.6 planning. I'm going to detail some high
> level 'big' ideas blow in this email from a feature development
> perspective. Anyone is welcome to join the call (or reply) and I'm
> happy to answer questions about the ideas below and hear suggestions of
> others.

Hi,

I'm relatively new to OE; I've written a couple of pre-alpha layers to 
try some idea, and worked on meta-openembedded, but I've not had a 
chance to go in depth on the Yocto documentation, and at the some there 
see to be things (based on the lists) that are out of date, or new 
things that aren't even mentioned, which makes getting up speed somewhat 
difficult.

In any even one thing that I'm wondering if is of interest, is modifying 
the build process to build an eSDK which is used to build everything 
else.  The advantage of this, in my view, is that it makes it easier to 
do things like use GitHub+Travis integration on individual recipes.

The biggest challenge for this type of per-recipe build is dealing with 
dependencies, but I think it would be helpful to get rid of 3-day+ world 
builds.

At the very least having a 'standard' binary eSDK for external layers to 
use for this purpose would helpful in my view.

I'm interested in working on this, but I don't think I've got a good 
enough handle on OE for making this a 2.6 goal from me.

Thoughts?

Daniel

> 
> [1] https://www.yoctoproject.org/monthly-technical-call/
> 
> Ultimately, ideas will be turned into bugzilla enhancement entries. It
> will then be a case of seeing who is willing to step up and help work
> on any given feature. We're using the "2.99" target milestone as our
> holding area for potential ideas, only moving to 2.6 when we have a
> solid commitment for someone to do something.
> 
> If nobody steps up for something, chances are it will just get pushed
> out as a "Future" idea. In the past, Intel in particular has stepped up
> and done a lot of feature work but for various reasons, this is not
> likely to happen going forward as they focus more in Intel specific
> work.
> 
> At the end of the day, we'll process the changes that make it onto the
> mailing list by the freeze deadlines for the milestones. If its not
> there, it won't be in the release and 2.6 will be what people put into
> it.
> 
> List of high level 'big' ideas:
> 
> - Reference binary package feed (in particular to test upgrade paths)
> -
> Secure/trusted boot support in OE-Core
> - Improved security tools (e.g.
> CVE database scanning)
> - Provide sstate feed out the box for reference
> -
> Improve binary output testing (esp. reproducibility, upgrade paths)
> -
> Widen the scope of our automated testing infrastructure (include
>    more
> layers)
> - Roll processes and tooling into the wider ecosystem (e.g.
> meta-
>    openembedded)
> - Ability to make builds more efficient by output
> comparison and
>    sstate prebuilt reuse in many more cases. Maybe sstate
> equivalence
>    server
> - Completion of migration to new autobuilder
> codebase and
>    infrastructure
> - Out of box experience/layer setup
> tooling
> - Improved binary reproducibility
> 
> Features aren't all we need to plan for. There are other areas that
> need work/help:
> 
> Many other smaller features
> 
>    There are too many for me to list/call out individually but search
>    bugzilla for 2.99 Medium+ items. A good example is adding
>    support for inter-multiconfig dependencies which is a small
>    remaining multiconfig item which would make a big difference to
>    certain workflows.
> 
>    Another harder example is parallelisation of oe-selftest. Its
>    currently the thing which ends up taking the longest in most of our
>    builds, improving its performance would reduce overall testing times.
> 
> OE-Core Recipe maintenance: 840 recipes in OE-Core
>    
>    - General recipe
> updates
>    - Security fixes
>    - Recipe specific bugs/regressions
>    - Adapt
> to new technologies/upstream changes
> 
> General patch review
> 
>    ~5000 commits/year which need review, testing, identifying
>    regressions, merging
> 
> General regressions
> 
>    Regressions tests we have are good but don't catch every race
>    condition or intermittent problem. We end up having to track
>    down several, particularly runtime testing instability
> 
> Bug fixing user issues
> 
>    Users find new use cases and workflows and identify bugs which then
>    need to be addressed
> 
>    For example we can't default to mem-res bitbake as there are known
>   
> issues.
> 
> Maintain the tools
> 
>    We directly maintain tools like bitbake, pseudo, devtool, recipetool
>    opkg, yocto-autobuilder, patchwork+patchtest, wic
> 
> Stable release maintenance
> 
>    People all want stable releases and security fixes but someone has
>    to make these happen.
> 
> 
> Help in any and all of these areas is much appreciated. Also keep in
> mind the things above are just to get people thinking. If there are
> changes you'd like to see, now is your chance to proposal and work on
> them to make them a reality.
> 
> Cheers,
> 
> Richard
> 
> 
> 


