Return-Path: <rpjday@crashcourse.ca>
Received: from smtp484.redcondor.net (smtp484.redcondor.net [208.80.204.84])
	by mail.openembedded.org (Postfix) with ESMTP id 0448577BD5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 09:56:35 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp484.redcondor.net ({c48374e7-08df-40d9-a0de-96cc9883a037})
	via TCP (outbound) with ESMTPS id 20170329095635171_0484
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 09:56:35 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [216.191.234.70] (port=59375 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1ctAL7-0007a9-HZ for openembedded-core@lists.openembedded.org;
	Wed, 29 Mar 2017 05:56:29 -0400
Date: Wed, 29 Mar 2017 05:56:27 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@uk63952.mitel.com
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
In-Reply-To: <alpine.LFD.2.20.1703290548440.3733@uk63952.mitel.com>
Message-ID: <alpine.LFD.2.20.1703290555150.2895@uk63952.mitel.com>
References: <alpine.LFD.2.20.1703290548440.3733@uk63952.mitel.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: Re: wanting to clarify HOSTTOOLS and HOSTTOOLS_NONFATAL
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
X-List-Received-Date: Wed, 29 Mar 2017 09:56:37 -0000
Content-Type: text/plain; charset=US-ASCII

On Wed, 29 Mar 2017, Robert P. J. Day wrote:

>   again, trying to catch up with new developments, and i want to
> make sure i understand these variables. as i read it (and i could be
> off-base), HOSTTOOLS represents a list of tools that *must* be
> available one way or the other, and any tools listed there are
> allowed to be symlinked from the tools available in PATH, is that
> correct?
>
>   OTOH, HOSTTOOLS_NONFATAL represents whitelisted tools that will be
> symlinked if they're there, but their absence is not fatal.
>
>   i'm still not totally clear here ... and there is no mention of
> these variables in the YP reference manual variables glossary.

  oh, i think i asked this before as well ... how do these variables
relate to ASSUME_PROVIDED? IIRC, ASSUME_PROVIDED is interpreted as "i
have these utilities on my host, use them."

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


