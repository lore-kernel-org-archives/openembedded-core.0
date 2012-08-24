Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T4xWd-0000sl-Bw for openembedded-core@lists.openembedded.org;
	Fri, 24 Aug 2012 19:18:27 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7OH6G7o015611;
	Fri, 24 Aug 2012 18:06:16 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15108-04; Fri, 24 Aug 2012 18:06:12 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7OH67M1015605
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 24 Aug 2012 18:06:08 +0100
Message-ID: <1345827969.14369.87.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Fri, 24 Aug 2012 18:06:09 +0100
In-Reply-To: <CAMKF1srHBKHSLHpDw6oC5CEKCusXa3AbFDRUHRon_s4D15c9EA@mail.gmail.com>
References: <1345781608-2198-1-git-send-email-raj.khem@gmail.com>
	<50370A1F.40401@linux.intel.com>
	<CAMKF1srHBKHSLHpDw6oC5CEKCusXa3AbFDRUHRon_s4D15c9EA@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2] iputils: Fix postinst to run on cross rootfs generation
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
X-List-Received-Date: Fri, 24 Aug 2012 17:18:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-08-24 at 09:55 -0700, Khem Raj wrote:
> On Thu, Aug 23, 2012 at 9:59 PM, Saul Wold <sgw@linux.intel.com> wrote:
> >>
> > Richard pointed out that with Pseudo the pkg_postinsts are un-needed, so I
> > offered a different patch to that effect.
> 
> yes I see
> 
> http://git.openembedded.org/openembedded-core/commit/?id=a2bc81032c85548f7c72dc76e6020ab4df9af6de
> 
> how does it work on device installs isnt clear to me though
> 
> with existing patch atleast I understood that with Online Package
> management the postinst would run

The file has the right permissions in the package file now. This means
we don't need any postinst.

We used to have problems preserving permissions/owners in packages but
with pseudo, we don't, that is its big win.

So this was leftover stuff from a previous age :)

Cheers,

Richard



