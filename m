Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SAjTD-0002ZG-2U for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 15:58:31 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2MEnaEW015480;
	Thu, 22 Mar 2012 14:49:36 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13435-10; Thu, 22 Mar 2012 14:49:32 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2MEnTsb015474
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 22 Mar 2012 14:49:30 GMT
Message-ID: <1332427771.9740.240.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 22 Mar 2012 14:49:31 +0000
In-Reply-To: <2207E1AD-E06F-40D6-9FD7-1452805A4CF3@dominion.thruhere.net>
References: <2207E1AD-E06F-40D6-9FD7-1452805A4CF3@dominion.thruhere.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: "Ashfield, Bruce" <Bruce.Ashfield@windriver.com>
Subject: Re: Syscall backporting and linux-libc-headers
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Mar 2012 14:58:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-03-22 at 13:22 +0100, Koen Kooi wrote:
> In my never ending quest to get consolekit/polkit/etc working properly
> I've found that CONFIG_AUDITSYSCALL is really usefull (it's usefull in
> other contexts as well, but that's outside the oe-core set of
> recipes). It has the following problem:
> 
> config AUDITSYSCALL
>         bool "Enable system-call auditing support"
>         depends on AUDIT && (X86 || PPC || S390 || IA64 || UML ||
> SPARC64 || SUPERH)
> 
> No MIPS or ARM support. There recently was a pull request from Al Viro
> to get at least ARM support into mainline, but I'm not sure what
> happened to that. Anyway, I backported the ARM patch to 3.0 and 3.2,
> but to make it usefull I'd need to patch linux-libc-headers and bump
> PR on virtual/libc.
> 
> What's the OE-core position on backporting syscalls to
> linux-libc-headers? 

Why can't we just increase the linux-libc-headers version? Presumably
someone running a kernel without the patches won't see any issue, the
syscall just won't be present and software will fall back?

I think the big concern would be deviating from mainline as its not so
much a backport as a divergence at this point (and this is why we can't
just upgrade)?

CC'ing Bruce since I know he holds opinions on this kind of thing :)

Cheers,

Richard





