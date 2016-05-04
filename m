Return-Path: <rpjday@crashcourse.ca>
Received: from smtp484.redcondor.net (smtp484.redcondor.net [208.80.204.84])
	by mail.openembedded.org (Postfix) with ESMTP id 78C3065C8A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 10:42:02 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp484.redcondor.net ({c48374e7-08df-40d9-a0de-96cc9883a037})
	via TCP (outbound) with ESMTPS id 20160504104201430_0484;
	Wed, 04 May 2016 10:42:01 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=11362 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1axuHD-00079L-QI; Wed, 04 May 2016 06:43:31 -0400
Date: Wed, 4 May 2016 06:41:40 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Bruce Ashfield <bruce.ashfield@gmail.com>
In-Reply-To: <CADkTA4Ocu2L9GoBM4YadkGZJq+2Pd8UFA2acSeX4MSibEo-ZtA@mail.gmail.com>
Message-ID: <alpine.LFD.2.20.1605040637480.12063@localhost.localdomain>
References: <alpine.LFD.2.20.1605031245360.6672@localhost.localdomain>
	<CADkTA4PPYfetBymZ1mii_sc7f71za-V0dBbcgApHyhDHwxKyVw@mail.gmail.com>
	<alpine.LFD.2.20.1605031421460.12750@localhost.localdomain>
	<CADkTA4Ocu2L9GoBM4YadkGZJq+2Pd8UFA2acSeX4MSibEo-ZtA@mail.gmail.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: clarifying details about "is not set" lines in kernel config fragment files
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
X-List-Received-Date: Wed, 04 May 2016 10:42:03 -0000
Content-Type: text/plain; charset=US-ASCII


  one more question about fragments which i'm fairly sure i know the
answer to, but will be embarrassed about if i'm wrong.

  if i want to set a kernel option in a fragment, i'm fairly certain i
need to *explicitly* set all options it depends on, correct?
otherwise, that option is left unselected.

  is there any warning in a log file that mentions that happening?

rday

p.s. oh, and i think someone mentioned this earlier ... what happens
if i explicitly set one option, then explicitly "not set" another
option that is "select"ed by that first option? who wins?

  ok, back to work ...

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================



