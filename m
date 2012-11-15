Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TZ2qE-0003li-1u
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Nov 2012 18:03:02 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 15 Nov 2012 08:49:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,258,1352102400"; d="scan'208";a="242752917"
Received: from unknown (HELO helios.localnet) ([10.252.122.197])
	by orsmga002.jf.intel.com with ESMTP; 15 Nov 2012 08:49:02 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 15 Nov 2012 16:49:01 +0000
Message-ID: <2167600.lqqak59AbM@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.2 (Linux/3.2.0-32-generic-pae; KDE/4.9.2; i686; ; )
In-Reply-To: <20121115161907.GC17521@jama.jama.net>
References: <1351077301-7744-1-git-send-email-Martin.Jansa@gmail.com>
	<CABcZAN=W_E+Qtox5XF7nBcMY9tN4vCCA51vcy=Hx1GDVGMwVbQ@mail.gmail.com>
	<20121115161907.GC17521@jama.jama.net>
MIME-Version: 1.0
Cc: Chris Larson <clarson@kergoth.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv4] scripts/sstate-sysroot-cruft.sh: add simple script to find files in sysroots not tracked by sstate
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
X-List-Received-Date: Thu, 15 Nov 2012 17:03:02 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 15 November 2012 17:19:07 Martin Jansa wrote:
> I didn't want to use bitbake -e, so that this script can be executed
> when some other bitbake process is running.

You really should not be trying to touch anything under TMPDIR let alone 
sstate files while bitbake is actually running against that same directory. I'm 
not sure why you would want to though...

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


