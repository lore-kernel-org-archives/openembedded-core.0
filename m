Return-Path: <rpjday@crashcourse.ca>
Received: from smtp684.redcondor.net (smtp684.redcondor.net [208.80.206.84])
	by mail.openembedded.org (Postfix) with ESMTP id 2439B73174
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 13:21:32 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp684.redcondor.net ({700db0a8-6fb7-4c8b-9b2a-6812225182d8})
	via TCP (outbound) with ESMTPS id 20160817132130565_0684;
	Wed, 17 Aug 2016 13:21:30 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=23128 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1ba0oU-0005QU-MG; Wed, 17 Aug 2016 09:23:22 -0400
Date: Wed, 17 Aug 2016 09:21:15 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@ca624034.mitel.com
To: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <92B4EF25-FE41-4310-B78A-554EA37BF507@gmail.com>
Message-ID: <alpine.LFD.2.20.1608170913100.11255@ca624034.mitel.com>
References: <alpine.LFD.2.20.1608160956340.7804@ca624034.mitel.com>
	<CAFkk2KRY=fWTOSUbxV_gm-np9r=4JBrsQ+Zy0FZb0H4Gbhfd+A@mail.gmail.com>
	<alpine.LFD.2.20.1608161147270.9338@ca624034.mitel.com>
	<CAFkk2KSVc3rqAieBHzkayJQT7YHxJhYoD0PSqp-YFL0CYMLkvg@mail.gmail.com>
	<92B4EF25-FE41-4310-B78A-554EA37BF507@gmail.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: subtle weirdness when you combine "_append" with "+="?
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
X-List-Received-Date: Wed, 17 Aug 2016 13:21:33 -0000
Content-Type: text/plain; charset=US-ASCII

On Tue, 16 Aug 2016, Khem Raj wrote:

  ... big snip ...

> the _append/_prepend in conjunction with += is a undocumented
> behavior however, I do not see it as much a side effect. But in
> future bitbake may silently change its behavior, so I agree its
> always good to stay in safe waters.

  so just to finalize this discussion, my thoughts on a reasonable and
meaningful standard for append/prepend/etc/etc would be to *always*
use the "mathematical" operators +=/.=/=+/=. except in two situations:

  1) when parsing *must* be delayed until the end, or
  2) when combining the operation with an override (for which i'm
     quite sure there is no equivalent when using +=, etc, right?)

i'm a big fan of simplicity, in the sense that, if an append operation
does not *require* "_append", it shouldn't use it. because if i see an
expression:

  VAR_append = "..."

then i immediately wonder if there is a *reason* for using "_append"
rather than "+=" or ".=", or if that is just the developer's personal
preference. and i really, really, really hate having to guess.

  oh, and of course, never, ever combine "_append" with "+=" or ".=".
does that sound like a reasonable coding style?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================



