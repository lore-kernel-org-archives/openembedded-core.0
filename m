Return-Path: <rpjday@crashcourse.ca>
Received: from smtp484.redcondor.net (smtp484.redcondor.net [208.80.204.84])
	by mail.openembedded.org (Postfix) with ESMTP id 62C8970179
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 May 2016 12:52:10 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp484.redcondor.net ({c48374e7-08df-40d9-a0de-96cc9883a037})
	via TCP (outbound) with ESMTPS id 20160509125208356_0484;
	Mon, 09 May 2016 12:52:08 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=39315 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1azkgt-0003lB-Hl; Mon, 09 May 2016 08:53:39 -0400
Date: Mon, 9 May 2016 08:51:41 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Bruce Ashfield <bruce.ashfield@gmail.com>
In-Reply-To: <CADkTA4PzYTZhbgm0g=wnjfoK0hEDiDKKWqU7PePb=BxnerAXaw@mail.gmail.com>
Message-ID: <alpine.LFD.2.20.1605090849260.28550@localhost.localdomain>
References: <alpine.LFD.2.20.1605090630480.21387@localhost.localdomain>
	<CADkTA4PzYTZhbgm0g=wnjfoK0hEDiDKKWqU7PePb=BxnerAXaw@mail.gmail.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: should a SRC_URI referring to "rday.cfg" look for "rday.scc"?
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
X-List-Received-Date: Mon, 09 May 2016 12:52:12 -0000
Content-Type: multipart/mixed; BOUNDARY="8323328-441553437-1462798303=:28550"

--8323328-441553437-1462798303=:28550
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 9 May 2016, Bruce Ashfield wrote:

>
>
> On Mon, May 9, 2016 at 6:39 AM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>         (aside: this is with wind river linux 8 and i dropped bruce a note
>       about it, but i really should keep this stuff on the mailing list.)
>
>         not sure if this is a WRL issue, or more general OE or YP issue, but
>       i was doing a kernel config yesterday, and my SRC_URI included, say,
>       "rday.scc", which incorporated both kernel config fragments and
>       patches, and that worked fine.
>
>         eventually, after massive refactoring, all that was left of that
>       item was some kernel configuration which was already in "rday.cfg", so
>       i edited SRC_URI and replaced "rday.scc" with "rday.cfg", but i left
>       that old "rday.scc" in that directory (with its referent patches),
>       assuming it would be ignored.
>
>         did a clean and configure and got:
>
>         | DEBUG: Executing shell function do_kernel_metadata
>       | ERROR: could not find patch rday.patch, included from
>       .../rday.scc ...
>
>         it *appears* that, even though SRC_URI now refers to (among other
>       things) just "rday.cfg", it looks like the configure step is *still*
>       trying to process "rday.scc", which contains a reference to a now
>       non-existent patch, hence the failure.
>
>         if i just remove (or rename) "rday.scc", then things work fine. is
>       this expected behaviour? is there some reason that if SRC_URI
>       includes, say "derf.cfg", the configuration will automatically look
>       for and try to process "derf.scc"? or am i just doing something silly?
>
>
> There's no automatic inclusions like that. Take a look at your
> meta-series and see if there's an explicit reference to the .scc
> file.
>
> Otherwise, I'll have to try and reproduce it here.

  i suspect it's some remnant of an older configure that's still
hiding somewhere. i'll try to reproduce it, but i'm guessing if i
totally blew away my project directory and tried again, it would work.

  still, shouldn't doing a "clean" step on the kernel target get rid
of remnants like that?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--8323328-441553437-1462798303=:28550--
