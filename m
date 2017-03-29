Return-Path: <rpjday@crashcourse.ca>
Received: from smtp486.redcondor.net (smtp486.redcondor.net [208.80.204.86])
	by mail.openembedded.org (Postfix) with ESMTP id A26EF77BD3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 09:34:03 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp486.redcondor.net ({6695537a-536a-45f9-a249-877c85428649})
	via TCP (outbound) with ESMTPS id 20170329093402448_0486;
	Wed, 29 Mar 2017 09:34:02 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=33203 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1ct9zB-0005o5-DX; Wed, 29 Mar 2017 05:33:49 -0400
Date: Wed, 29 Mar 2017 05:33:45 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@uk63952.mitel.com
To: Rick Altherr <raltherr@google.com>
In-Reply-To: <CAPLgG==F8OV8U6CVZ2yEyErUhCJw+UwHmbEaCmaXpJBaBeLHaA@mail.gmail.com>
Message-ID: <alpine.LFD.2.20.1703290532280.1776@uk63952.mitel.com>
References: <alpine.LFD.2.20.1703281817440.27955@localhost.localdomain>
	<CAPLgG==F8OV8U6CVZ2yEyErUhCJw+UwHmbEaCmaXpJBaBeLHaA@mail.gmail.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: is there OE support for building multi-image/component FIT image files?
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
X-List-Received-Date: Wed, 29 Mar 2017 09:34:04 -0000
Content-Type: text/plain; charset=US-ASCII

On Tue, 28 Mar 2017, Rick Altherr wrote:

> kernel-fitimage.bbclass loops through all the DTBs listed in
> KERNEL_DEVICETREE and adds a FIT section for each one.  It looks like
> only the first one is put into a config section though.

  maybe i just haven't read far enough, but what value would that
have? as i read it, "bootm" can either boot based on an actual image
reference, or a configuration entry. i don't see how you can select
from among DTBs unless they're referenced in a configuration entry.

  can someone clarify this?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


