Return-Path: <rpjday@crashcourse.ca>
Received: from smtp684.redcondor.net (smtp684.redcondor.net [208.80.206.84])
	by mail.openembedded.org (Postfix) with ESMTP id 9763460797
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 14:41:37 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp684.redcondor.net ({700db0a8-6fb7-4c8b-9b2a-6812225182d8})
	via TCP (outbound) with ESMTPS id 20161114144137510_0684;
	Mon, 14 Nov 2016 14:41:37 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=53461 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1c6IRt-0002jN-L8; Mon, 14 Nov 2016 09:41:29 -0500
Date: Mon, 14 Nov 2016 09:40:25 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@ca624034.mitel.com
To: Mark Hatle <mark.hatle@windriver.com>
In-Reply-To: <ca53cb96-5c1e-35f1-55f3-8f61897de18f@windriver.com>
Message-ID: <alpine.LFD.2.20.1611140938130.15267@ca624034.mitel.com>
References: <alpine.LFD.2.20.1611121436420.20479@localhost.localdomain>
	<ca53cb96-5c1e-35f1-55f3-8f61897de18f@windriver.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: openembedded-core@lists.openembedded.org
Subject: Re: WRL error: "Can't locate Config_heavy-target.pl in @INC" -- OE versus WRL
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
X-List-Received-Date: Mon, 14 Nov 2016 14:41:39 -0000
Content-Type: text/plain; charset=US-ASCII


  i think i figured out the problem ... all of the perl recipes i was
trying to build (from meta-cpan) had the line:

  inherit cpan allarch

rather than just:

  inherit cpan

so the native perl built by WRL chokes on that, while the slightly
newer perl that comes with OE has a patch to handle that.

  at least, that's what *appears* to be happening. does that make any
sense?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


