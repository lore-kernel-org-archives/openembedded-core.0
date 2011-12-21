Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RdK2f-0005eE-0H
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Dec 2011 12:09:01 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 21 Dec 2011 03:01:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="89921779"
Received: from unknown (HELO helios.localnet) ([10.252.122.36])
	by orsmga002.jf.intel.com with ESMTP; 21 Dec 2011 03:01:54 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Dec 2011 11:01:53 +0000
Message-ID: <1379113.Fy2Op0zW6M@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.4 (Linux/3.0.0-14-generic-pae; KDE/4.7.4; i686; ; )
In-Reply-To: <B70EE6F2-BB2B-4149-AFA3-8C07CDEDB45B@dominion.thruhere.net>
References: <CAE=MDVN_3QBq_tr=-xfSrJr-5u4-azhrWytzpugzr+nzcxkJ_g@mail.gmail.com>
	<B70EE6F2-BB2B-4149-AFA3-8C07CDEDB45B@dominion.thruhere.net>
MIME-Version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: Architecture mismatch QA issue
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
X-List-Received-Date: Wed, 21 Dec 2011 11:09:01 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 21 December 2011 10:55:43 Koen Kooi wrote:
> Hmmm, do we know why these sometimes are target binaries and sometimes host
> binaries?

Having already fixed this and then reverted the fix, this is annoying to say the 
least. I tested this on several different architectures and the results were 
correct, so something unusual is at work here.

I've filed bug #1856 [1] in the Yocto Project bugzilla and will do my best to 
investigate this, but the first thing I need is some more information to help 
reproduce the issue, at the moment I don't get the error.

Cheers,
Paul

[1] http://bugzilla.pokylinux.org/show_bug.cgi?id=1856

-- 

Paul Eggleton
Intel Open Source Technology Centre


