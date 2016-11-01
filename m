Return-Path: <rpjday@crashcourse.ca>
Received: from smtp484.redcondor.net (smtp484.redcondor.net [208.80.204.84])
	by mail.openembedded.org (Postfix) with ESMTP id 517A965CC7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2016 11:05:36 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp484.redcondor.net ({c48374e7-08df-40d9-a0de-96cc9883a037})
	via TCP (outbound) with ESMTPS id 20161101110537119_0484;
	Tue, 01 Nov 2016 11:05:37 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=56415 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1c1Wsk-0006qO-K3; Tue, 01 Nov 2016 07:05:30 -0400
Date: Tue, 1 Nov 2016 07:04:29 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@ca624034.mitel.com
To: Gary Thomas <gary@mlbassoc.com>
In-Reply-To: <df783f19-0a54-efd5-fa17-a25da1c4bcef@mlbassoc.com>
Message-ID: <alpine.LFD.2.20.1611010704040.25631@ca624034.mitel.com>
References: <alpine.LFD.2.20.1611010545380.25706@ca624034.mitel.com>
	<df783f19-0a54-efd5-fa17-a25da1c4bcef@mlbassoc.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: openembedded-core@lists.openembedded.org
Subject: Re: some pedantic questions about layer.conf "best practices"
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
X-List-Received-Date: Tue, 01 Nov 2016 11:05:37 -0000
Content-Type: text/plain; charset=US-ASCII

On Tue, 1 Nov 2016, Gary Thomas wrote:

> On 2016-11-01 11:04, Robert P. J. Day wrote:
> >
> >   updating a tutorial about writing a proper layer.conf file, so some
> > nitpicky questions about recommended style.
> >
> >   first, when appending to BBFILES, is it recommended to explicitly
> > use separate wildcard patterns of "*.bb" and "*.bbappend", or just get
> > lazy and use "*.bb*"? i realize that, in the end, it makes no
> > effective difference; i just happen to prefer the more explicit
> > pattern; just wondering if anyone has any preferences on this either
> > way. (i did say "nitpicky.")
>
> "*.bb*" also matches "*.bb~" and "*.bbappend~" (I use emacs which makes
> these backup files) that could be WAY confusing...

  ah, of course, good point.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


