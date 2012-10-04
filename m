Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TJlDB-0003pO-IH for openembedded-core@lists.openembedded.org;
	Thu, 04 Oct 2012 15:11:37 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q94CwKL1006840;
	Thu, 4 Oct 2012 13:58:20 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05653-08; Thu,  4 Oct 2012 13:58:15 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q94CwCsP006834
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Thu, 4 Oct 2012 13:58:13 +0100
Message-ID: <1349355495.18301.93.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Maupin, Chase" <chase.maupin@ti.com>
Date: Thu, 04 Oct 2012 13:58:15 +0100
In-Reply-To: <7D46E86EC0A8354091174257B2FED10159242C29@DLEE12.ent.ti.com>
References: <1349213439-14199-1-git-send-email-Chase.Maupin@ti.com>
	<1349342479.18301.68.camel@ted>
	<7D46E86EC0A8354091174257B2FED10159242C29@DLEE12.ent.ti.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libtool: Add missing DEPENDS on libtool-cross
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
X-List-Received-Date: Thu, 04 Oct 2012 13:11:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-10-04 at 12:39 +0000, Maupin, Chase wrote:
> I was able to reproduce this consistently on my build server which has
> 24 cores running at 3.5 GHz.  I was using:
> 
> BB_NUMBER_THREADS = "24"
> 
> And
> 
> PARALLEL_MAKE = "-j 24"
> 
> I can try a build reducing the number of threads and see if the issue
> goes away as this might be a difference between our builds.  Can you
> tell me what you are using?

I tested this with 48/48 in master.

> It seemed like a race condition because after I got the error I was
> able to do a -c cleanall of libtool and kick off the build again once
> libtool-cross was built and it would pass.  Likewise I did:
> 
> bitbake libtool-cross
> bitbake libtool
> 
> and that would work but just
> 
> bitbake libtool
> 
> would fail.

"bitbake libtool" works here quite consistently. I therefore don't want
to add this dependency until we figure out exactly what is racing
against what or have a better understanding of why this is failing.
Something doesn't seem right as if your premise of a missing dependency
is correct, the above wouldn't work.

Cheers,

Richard





