Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 504F760703
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 May 2014 15:27:27 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s47FRFQP005796; Wed, 7 May 2014 16:27:16 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id LY4lXV42vCjn; Wed,  7 May 2014 16:27:15 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s47FR7eF005765
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 7 May 2014 16:27:09 +0100
Message-ID: <1399476421.31891.39.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Denys Dmytriyenko <denis@denix.org>
Date: Wed, 07 May 2014 16:27:01 +0100
In-Reply-To: <20140506215901.GI11339@denix.org>
References: <536899F5.1030104@gmail.com> <20140506205518.GE11339@denix.org>
	<CAMKF1spaD8x1e2VYMwq34R2RLbz6xDw9ypDVwzr8sQJBuOpm5A@mail.gmail.com>
	<5369533B.9010209@windriver.com> <20140506214430.GG11339@denix.org>
	<536958D5.2090806@windriver.com> <20140506215901.GI11339@denix.org>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
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
X-List-Received-Date: Wed, 07 May 2014 15:27:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-05-06 at 17:59 -0400, Denys Dmytriyenko wrote:
> On Tue, May 06, 2014 at 04:49:09PM -0500, Mark Hatle wrote:
> > On 5/6/14, 4:44 PM, Denys Dmytriyenko wrote:
> > >On Tue, May 06, 2014 at 04:25:15PM -0500, Mark Hatle wrote:
> > >>On 5/6/14, 3:56 PM, Khem Raj wrote:
> > >>>On Tue, May 6, 2014 at 1:55 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> > >>>>Do you know that OE toolchain is not relocatable?
> > >>>
> > >>>is that true ?
> > >>>
> > >>
> > >>It's the load path of the executables, they use the libc-nativesdk,
> > >>so they need a hard path to the correct ld.so to get started.
> > >
> > >More specifically, it's PT_INTERP section of the ELF header in every binary
> > >that hardcodes the full path to our own dynamic linker/loader (i.e. mentioned
> > >libc-nativesdk). I wish it would support the use of $ORIGIN similar to RPATH
> > >and RUNPATH for libraries, but I bet there are all kinds of corner cases with
> > >that... :)
> > >
> > 
> > $ORIGIN, RPATH and RUNPATH are all implemented by the ld.so, there
> > is no way to dynamically assign the interpreter (ld.so).
> 
> Yes, the above wish was highly abstract and hypothetical and would probably 
> require kernel to support $ORIGIN used in the ELF header... But I'm not 
> suggesting it, just speculating! :)

Right, that would need support in the kernel and would mean that the SDK
was restricted to specific kernel versions.

Having said that, I have wondered if we could see if we could get it in
and then someday remove this restriction.

Cheers,

Richard


