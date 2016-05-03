Return-Path: <rpjday@crashcourse.ca>
Received: from smtp484.redcondor.net (smtp484.redcondor.net [208.80.204.84])
	by mail.openembedded.org (Postfix) with ESMTP id 0EF3060249
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 May 2016 15:37:21 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp484.redcondor.net ({c48374e7-08df-40d9-a0de-96cc9883a037})
	via TCP (outbound) with ESMTPS id 20160503153720141_0484;
	Tue, 03 May 2016 15:37:20 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=54166 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1axcPS-0001ua-8n; Tue, 03 May 2016 11:38:50 -0400
Date: Tue, 3 May 2016 11:36:59 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Bruce Ashfield <bruce.ashfield@gmail.com>
In-Reply-To: <CADkTA4O8t8-Q2HKz2zM2OwQvWjVXqj-tzBdLADuYk+eZ5GXdnQ@mail.gmail.com>
Message-ID: <alpine.LFD.2.20.1605031133420.4825@localhost.localdomain>
References: <alpine.LFD.2.20.1605030649490.20066@localhost.localdomain>
	<CADkTA4OwEaX6pCpuuiXxuMqY_++NLS+W6pnH0siNvXD0SwhWOg@mail.gmail.com>
	<alpine.LFD.2.20.1605030912110.17898@localhost.localdomain>
	<CADkTA4N+LvCos+qNDuANxEisezP3kZ9_DgtPTF4gNGhaKcoHXQ@mail.gmail.com>
	<alpine.LFD.2.20.1605031052360.22513@localhost.localdomain>
	<CADkTA4O8t8-Q2HKz2zM2OwQvWjVXqj-tzBdLADuYk+eZ5GXdnQ@mail.gmail.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: how can i tell which default kernel config OE started with?
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
X-List-Received-Date: Tue, 03 May 2016 15:37:23 -0000
Content-Type: multipart/mixed; BOUNDARY="8323328-818374104-1462289821=:4825"

--8323328-818374104-1462289821=:4825
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 3 May 2016, Bruce Ashfield wrote:

> On Tue, May 3, 2016 at 11:13 AM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>         also, that same section in the YP manual is slightly
>       confusing -- if your SRC_URI refers to a defconfig file *and*
>       some .cfg fragment files, is it necessarily true that the
>       defconfig file is consulted first (no matter where it shows up
>       in SRC_URI), after which all .cfg files are applied on top of
>       that in order? it's not entirely clear from the manual if
>       that's what happens.
>
>
> Yep. If you mix the two techniques, the defconfig is first (and
> taken as the settings), and then fragments are applied on top.

  yeah, that's not terrifically clear from that section in the manual,
Section 2.2.3, in the Note therein:

"The build system applies the configurations from the defconfig file
before applying any subsequent configuration fragments."
                    ^^^^^^^^^^

  the use of the word "subsequent" suggests an ordering and is
potentially misleading.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--8323328-818374104-1462289821=:4825--
