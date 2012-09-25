Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TGQRq-0003qV-AI for openembedded-core@lists.openembedded.org;
	Tue, 25 Sep 2012 10:24:54 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8P8C2W3004665;
	Tue, 25 Sep 2012 09:12:02 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01563-08; Tue, 25 Sep 2012 09:11:58 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8P8BqsC004659
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Tue, 25 Sep 2012 09:11:53 +0100
Message-ID: <1348560712.8662.28.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Scott Garman <scott.a.garman@intel.com>
Date: Tue, 25 Sep 2012 09:11:52 +0100
In-Reply-To: <cover.1348532322.git.scott.a.garman@intel.com>
References: <cover.1348532322.git.scott.a.garman@intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/58] denzil pull request 2
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
X-List-Received-Date: Tue, 25 Sep 2012 08:24:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-09-24 at 17:24 -0700, Scott Garman wrote:
> Hello,
> 
> If this works I'll hopefully be submitting the cover letter only,
> this patchset is pretty big. 
> 
> I've got a lot of patches for denzil now that I'd like to get merged
> before they get too out of hand, so here is my pull request for it,
> along with autobuilder output and explanation.
> 
> Note, the autobuilder run was done with my poky-based branch.
> 
> nightly-x86:
> http://autobuilder.yoctoproject.org:8010/builders/nightly-x86/builds/729
> 
> All builds green except for atom-pc, which fails during build_hddimg of
> do_bootimg due to the kernel image file not being found in the target
> sysroot.

Which broke due to:

http://cgit.openembedded.org/openembedded-core-contrib/commit/?h=sgarman/denzil-next-pull2&id=0e3e88f9f87d1083ddd7dcaa526b3cd7a1cd53ff

so I think you need:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=d9302305faf4ec733dc9a98f91f5014eb814d62d

to fix the atom-pc errors.

I am nervous about the number of version upgrades in here. Perhaps
someone can summarise what the problem is and why we need them?

Cheers,

Richard



