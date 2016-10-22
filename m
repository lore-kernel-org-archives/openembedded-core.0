Return-Path: <rpjday@crashcourse.ca>
Received: from smtp485.redcondor.net (smtp485.redcondor.net [208.80.204.85])
	by mail.openembedded.org (Postfix) with ESMTP id 2C1DA6AC4B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Oct 2016 17:26:01 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp485.redcondor.net ({3be039ea-4351-44b0-a8af-642c38b25916})
	via TCP (outbound) with ESMTPS id 20161022172601960_0485;
	Sat, 22 Oct 2016 17:26:01 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [174.118.92.171] (port=44042 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1by03P-0000ij-34; Sat, 22 Oct 2016 13:25:55 -0400
Date: Sat, 22 Oct 2016 13:24:58 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <68D800E1-2594-4E8B-AB8E-6B9C758FD3CF@gmail.com>
Message-ID: <alpine.LFD.2.20.1610221323110.8746@localhost.localdomain>
References: <alpine.LFD.2.20.1610221156210.31588@localhost.localdomain>
	<68D800E1-2594-4E8B-AB8E-6B9C758FD3CF@gmail.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: basic bitbake commands to create an SDK?
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
X-List-Received-Date: Sat, 22 Oct 2016 17:26:02 -0000
Content-Type: text/plain; charset=US-ASCII

On Sat, 22 Oct 2016, Khem Raj wrote:

> generally meta-toolchain is prior art. You want to use image
> specific SDKs so -cpopulate_sdk <image> is fine. In this case it
> will include the needed dev headers/libs in your SDK for that given
> image automatically it can be any image

  yet another dumb question while my build is cranking away ... am i
correct in assuming that i can generate the SDKs for multiple images
(same architecture of course) in the same build directory, and the
resulting generated artifacts will be distinguishable? that is, they
won't step on each other?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


