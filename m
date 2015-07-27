Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id EADA0601F7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 13:50:40 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 27 Jul 2015 06:50:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,554,1432623600"; d="scan'208";a="736370479"
Received: from rmoore5-mobl1.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.8.162])
	by orsmga001.jf.intel.com with ESMTP; 27 Jul 2015 06:50:39 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Jul 2015 14:50:38 +0100
Message-ID: <13075359.ly3sbSCPpg@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.0.8-200.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <55B63295.6090006@windriver.com>
References: <1437989436.821.221.camel@linuxfoundation.org>
	<55B6300F.7060104@windriver.com> <55B63295.6090006@windriver.com>
MIME-Version: 1.0
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: gcc 5.2 failures
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
X-List-Received-Date: Mon, 27 Jul 2015 13:50:42 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 27 July 2015 09:31:01 Bruce Ashfield wrote:
> On 15-07-27 09:20 AM, Bruce Ashfield wrote:
> > On 15-07-27 05:30 AM, Richard Purdie wrote:
> >> I've run a gcc 5.2 test build on the autobuilder:
> >> 
> >> http://errors.yoctoproject.org/Errors/Search/?items=10&query=3628c3c06fa4
> >> 195003ac655bcc791acfac775173&limit=50
> >> 
> >> 
> >> 41 errors (with a few more pending).
> >> 
> >> The good news is that if we tweak the security flags, the poky-lsb gcc,
> >> elfutils, coreutils and iptables issues can be removed and I have a
> >> patch for this. This leaves:
> >> 
> >> 3.14 kernel failures for edgerouter, genericx86-64, qemuarm, beaglebone,
> >> mpc8315e-rdb
> > 
> > Gah. I had all these building with 5.1 .. chasing gcc is a pain
> > with this older kernel.
> > 
> >> openssl issue for p1022ds
> >> 
> >> u-boot on imx28evk, p1022ds, mpc8315e-rdb
> >> 
> >> xf86-video-imxfb-vivante on imx6qsabresd
> >> 
> >> linux-imx issue on imx53qsb
> >> 
> >> Some kind of "random" qemu runtime issue (4 cases).
> >> 
> >> At this point I think we likely need to enter bugs into the bugzilla for
> >> each of these. If we want to switch 1.9 to use this (which I think is
> >> desirable), we need to get this fixed as a priority.
> >> 
> >> Bruce: How do you want to handle the 3.14 issues? Switch to 4.1? or fix
> >> 3.14?
> > 
> > Now that 4.1 is in place, and I can't really see a large user base that
> > needs gcc 5.x with the linux-yocto 3.14 kernel (other folks using
> > master with their own kernel's will obviously have to deal with the
> > issue in their trees) .. join that with the fact that we need to update
> > all the reference boards to 4.1 anyway, my suggestion is that we open
> > bugs for the h/w reference updates (and I'll get the appropriate Wind
> > River eyes on them) and walk away from burning more cycles on gcc 5.x
> > and the 3.14 kernel.
> 
> And of course, I remembered that we updated all the reference
> boards to 3.19, so if 3.19 builds with gcc 5.2 (it may not), then
> all we need to do is move the lsb reference to 4.1 and we'll also
> be free of backporting :)

It would be nice if we were able to point to a set of fixes that people can 
apply onto their older kernels in the migration guide for 1.9 though - I 
guarantee we'll get people asking...

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

