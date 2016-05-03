Return-Path: <rpjday@crashcourse.ca>
Received: from smtp486.redcondor.net (smtp486.redcondor.net [208.80.204.86])
	by mail.openembedded.org (Postfix) with ESMTP id B752F73175
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 May 2016 13:12:58 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp486.redcondor.net ({6695537a-536a-45f9-a249-877c85428649})
	via TCP (outbound) with ESMTPS id 20160503131257685_0486;
	Tue, 03 May 2016 13:12:57 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=13440 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1axa9j-00037J-MC; Tue, 03 May 2016 09:14:27 -0400
Date: Tue, 3 May 2016 09:12:36 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Bruce Ashfield <bruce.ashfield@gmail.com>
In-Reply-To: <CADkTA4OwEaX6pCpuuiXxuMqY_++NLS+W6pnH0siNvXD0SwhWOg@mail.gmail.com>
Message-ID: <alpine.LFD.2.20.1605030912110.17898@localhost.localdomain>
References: <alpine.LFD.2.20.1605030649490.20066@localhost.localdomain>
	<CADkTA4OwEaX6pCpuuiXxuMqY_++NLS+W6pnH0siNvXD0SwhWOg@mail.gmail.com>
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
X-List-Received-Date: Tue, 03 May 2016 13:12:59 -0000
Content-Type: multipart/mixed; BOUNDARY="8323328-957880147-1462281159=:17898"

--8323328-957880147-1462281159=:17898
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 3 May 2016, Bruce Ashfield wrote:

>
>
> On Tue, May 3, 2016 at 6:53 AM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>         (actually, working in wind river linux but i suspect the answer will
>       be the same.)
>
>         i've defined a target board and, rather than supplying a full
>       "defconfig" file as a starting point for kernel configuration, my BSP
>       layer starts by applying a "kernel_baseline.cfg" file which contains
>       only a couple hundred settings that i am particularly interested in.
>
>         so, given that, how can i tell what OE chose as a starting point for
>       a .config file before beginning to apply my kernel config fragments?
>       i'm poking around in the log files of the build, but i can't seem to
>       see where the "configme" process selects a starting point. am i just
>       missing the obvious? i want to see the .config file *before* any of my
>       fragments are applied.
>
>
> If you haven't specified a defconfig (in-tree, or in your layer),
> and are only using fragments, then it will be the first fragment.
> There's no logic to go out and find a baseline, since it would
> almost always not be what someone wanted.

  ok, i'm going to ask a few follow-up questions since i clearly don't
totally understand the full kernel configuration process.

  i have a BSP layer for a target board that first specifies a
"kernel_baseline.cfg" fragment file which contains just those kernel
config settings i want to make sure are set, and that file is just
over 200 lines long. i also drag in a few other *very* short .cfg
files. but in the end, the .config file generated under
.../linux-windriver/4.1-r0/linux-cxii-standard-build/ is almost 2,200
lines long. where did all that extra content come from?

  i'm assuming (and i could be wrong here) that since i'm using the
line:

TARGET_SUPPORTED_KTYPES = "standard"

i'm automatically incorporating "standard"-related content under
.../kernel-meta/ktypes/standard? as in, the files:

  * standard.cfg
  * standard.scc

or am i mistaken? from where comes all that additional content that
ends up in the final .config?  is there a record of it in a log file
somewhere?

  couple more kernel config-related questions coming shortly ...

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


--8323328-957880147-1462281159=:17898--
