Return-Path: <denis@denix.org>
X-Greylist: delayed 3617 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 06 May 2014 22:59:36 UTC
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by mail.openembedded.org (Postfix) with ESMTP id 88F0860167
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 May 2014 22:59:36 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N56001KFAEDZ170@vms173017.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Tue, 06 May 2014 16:59:02 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id AB757201BF; Tue,
	06 May 2014 17:59:01 -0400 (EDT)
Date: Tue, 06 May 2014 17:59:01 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Mark Hatle <mark.hatle@windriver.com>
Message-id: <20140506215901.GI11339@denix.org>
References: <536899F5.1030104@gmail.com> <20140506205518.GE11339@denix.org>
	<CAMKF1spaD8x1e2VYMwq34R2RLbz6xDw9ypDVwzr8sQJBuOpm5A@mail.gmail.com>
	<5369533B.9010209@windriver.com> <20140506214430.GG11339@denix.org>
	<536958D5.2090806@windriver.com>
MIME-version: 1.0
In-reply-to: <536958D5.2090806@windriver.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: meta-toolchain doesn't compile working binaries
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
X-List-Received-Date: Tue, 06 May 2014 22:59:41 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, May 06, 2014 at 04:49:09PM -0500, Mark Hatle wrote:
> On 5/6/14, 4:44 PM, Denys Dmytriyenko wrote:
> >On Tue, May 06, 2014 at 04:25:15PM -0500, Mark Hatle wrote:
> >>On 5/6/14, 3:56 PM, Khem Raj wrote:
> >>>On Tue, May 6, 2014 at 1:55 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> >>>>Do you know that OE toolchain is not relocatable?
> >>>
> >>>is that true ?
> >>>
> >>
> >>It's the load path of the executables, they use the libc-nativesdk,
> >>so they need a hard path to the correct ld.so to get started.
> >
> >More specifically, it's PT_INTERP section of the ELF header in every binary
> >that hardcodes the full path to our own dynamic linker/loader (i.e. mentioned
> >libc-nativesdk). I wish it would support the use of $ORIGIN similar to RPATH
> >and RUNPATH for libraries, but I bet there are all kinds of corner cases with
> >that... :)
> >
> 
> $ORIGIN, RPATH and RUNPATH are all implemented by the ld.so, there
> is no way to dynamically assign the interpreter (ld.so).

Yes, the above wish was highly abstract and hypothetical and would probably 
require kernel to support $ORIGIN used in the ELF header... But I'm not 
suggesting it, just speculating! :)

-- 
Denys

