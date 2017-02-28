Return-Path: <rpjday@crashcourse.ca>
Received: from smtp484.redcondor.net (smtp484.redcondor.net [208.80.204.84])
	by mail.openembedded.org (Postfix) with ESMTP id 81E8772FA1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 15:20:14 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp484.redcondor.net ({c48374e7-08df-40d9-a0de-96cc9883a037})
	via TCP (outbound) with ESMTPS id 20170228152012641_0484;
	Tue, 28 Feb 2017 15:20:12 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=35553 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1cijZM-0001Ox-FY; Tue, 28 Feb 2017 10:20:04 -0500
Date: Tue, 28 Feb 2017 10:20:02 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@uk63952.mitel.com
To: Patrick Ohly <patrick.ohly@intel.com>
In-Reply-To: <1488284875.7785.41.camel@intel.com>
Message-ID: <alpine.LFD.2.20.1702281017230.5848@uk63952.mitel.com>
References: <alpine.LFD.2.20.1702280518430.30803@localhost.localdomain>
	<1488284875.7785.41.camel@intel.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: how to *securely* do a remote install of an OE image?
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
X-List-Received-Date: Tue, 28 Feb 2017 15:20:15 -0000
Content-Type: text/plain; charset=US-ASCII

On Tue, 28 Feb 2017, Patrick Ohly wrote:

> For ssh keys, there's rootfsdebugfiles.bbclass. In local.conf:
>
> INHERIT += "rootfsdebugfiles"
> ROOTFS_DEBUG_FILES += "/home/pohly/.ssh/id_rsa.pub ${IMAGE_ROOTFS}/home/root/.ssh/authorized_keys ;"
>
> This copies my id_rsa.pub into authorized_keys and thus let's me log
> into images that I create via ssh.

  this has definite potential, but i'm about to check whether the
person/entity that builds the image vs. the person/entity that does
the install vs. the person that eventually logs into the new system to
finish setting up could potentially be different.

  there's a *possibility* that remote installation might be done by a
distributor, after which someone else might need to do the first
login to finish the setup, which would complicate things immensely.

  i don't know that this is what will happen, but i'm about to run off
and ask about possibilities.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


