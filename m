Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T4BQm-0000dR-Vj for openembedded-core@lists.openembedded.org;
	Wed, 22 Aug 2012 15:57:13 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7MDj8k7003620;
	Wed, 22 Aug 2012 14:45:08 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 03272-04; Wed, 22 Aug 2012 14:45:03 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7MDj1Fu003596
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 22 Aug 2012 14:45:02 +0100
Message-ID: <1345643102.3907.121.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Wed, 22 Aug 2012 14:45:02 +0100
In-Reply-To: <lyfw7foy9v.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <lyfw7foy9v.fsf@ensc-virt.intern.sigma-chemnitz.de>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: eglibc build fails with 'cannot find -lgcc_eh'
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Aug 2012 13:57:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-08-22 at 15:24 +0200, Enrico Scholz wrote:
> Hi,
> 
> with recent oe-core + oe-meta, a build from scratch fails in eglibc
> with:
> 
> | .../tmp/sysroots/x86_64-oe-linux/usr/bin/armv5te-linux-gnueabi/arm-linux-gnueabi-ld.bfd: cannot find -lgcc_eh
> | collect2: error: ld returned 1 exit status
> | make[2]: *** [.../tmp/work/armv5te-linux-gnueabi/eglibc-2.15-r13+svnr19294/build-arm-linux-gnueabi/iconv/iconv_prog] Error 1
> | make[2]: *** Waiting for unfinished jobs....
> | make[2]: Leaving directory `.../tmp/work/armv5te-linux-gnueabi/eglibc-2.15-r13+svnr19294/eglibc-2_15/libc/iconv'
> | make[1]: *** [iconv/others] Error 2
> 
> -lgcc_eh seems to be required because a check for -Wl,-as-needed failed.
> But this test result is bogus, because check failed due to missing -lgcc_s
> and not because of the linker flag.
> 
> Any idea how to solve this?

This is highly likely to be from the toolchain bootstrap changes in
oe-core master. I'll defer to Khem on how to fix it.

Cheers,

Richard



