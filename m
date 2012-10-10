Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TLtOK-0004bN-KM for openembedded-core@lists.openembedded.org;
	Wed, 10 Oct 2012 12:19:52 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9AA6bNb019268;
	Wed, 10 Oct 2012 11:06:37 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 03618-07; Wed, 10 Oct 2012 11:06:33 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9AA6P7Q019262
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 10 Oct 2012 11:06:26 +0100
Message-ID: <1349863590.15658.198.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 10 Oct 2012 11:06:30 +0100
In-Reply-To: <CAJTo0LZ2hwkk58_jQQx9a5mjEFSjyexuk0trRL5_8z_FGyZiRg@mail.gmail.com>
References: <CAMKF1srTMHyV+2eDaJKuZs9=2VUYkqhJoqfFqZxrdTCCooWMXA@mail.gmail.com>
	<CAJG6M_MgcYVomQbn=j_w=+BCDjUAdDe1D==CsQ_eFTJm1=rwQw@mail.gmail.com>
	<4F58B564.5040708@opendreambox.org>
	<70CC66F5C30A414DADDA6973E4CA391A6ED3E4@039-SN1MPN1-002.039d.mgd.msft.net>
	<CAJTo0LZ2hwkk58_jQQx9a5mjEFSjyexuk0trRL5_8z_FGyZiRg@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: McClintock Matthew-B29882 <B29882@freescale.com>, Patches,
	discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Recipes with disabled parallel make
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
X-List-Received-Date: Wed, 10 Oct 2012 10:19:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-10-10 at 10:16 +0100, Burton, Ross wrote:
> Hi Matthew,
> 
> On 10 October 2012 02:45, McClintock Matthew-B29882
> <B29882@freescale.com> wrote:
> >>> 1. Recipes (files) confirmed to fail with P_M enabled (need to have
> >>> P_M disabled as it is now):
> >>> meta/recipes-connectivity/bind/bind_9.8.1.bb
> >>> meta/recipes-extended/slang/slang_2.2.4.bb
> >>> meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
> >>> meta/recipes-support/js/js_1.7.0+1.8.0rc1.bb
> >>> meta/recipes-support/pth/pth_2.0.7.bb
> 
> Lack of parallelism is one of those things that really bugs me...
> 
> Do you still have the failure logs to hand?  I'd love to see a patch
> which put the failure alongside the PARALLEL_MAKE=0.  It's also
> probably worth removing the PARALLEL_MAKE for the other targets once
> master opens for development and seeing if they break on the
> autobuilders (as some parallel races are rare to hit).

We've done this in the archives, the PARALLEL_MAKE entries we have are
pretty much all needed, sadly. I'm not breaking master on the
autobuilder by removing them "just for fun".

Cheers,

Richard





