Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SKJ2m-0004U8-EK
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Apr 2012 02:46:48 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 17 Apr 2012 17:37:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="130937533"
Received: from unknown (HELO helios.localnet) ([10.252.120.85])
	by orsmga001.jf.intel.com with ESMTP; 17 Apr 2012 17:37:19 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andreas Oberritter <obi@opendreambox.org>
Date: Wed, 18 Apr 2012 01:37:18 +0100
Message-ID: <2945260.0EFDKNUQlD@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.2 (Linux/3.0.0-17-generic-pae; KDE/4.8.2; i686; ; )
In-Reply-To: <4F8E04C1.8040508@opendreambox.org>
References: <cover.1334704605.git.paul.eggleton@linux.intel.com>
	<967c78b6c30d6d6620db8066aac28224153d3359.1334704605.git.paul.eggleton@linux.intel.com>
	<4F8E04C1.8040508@opendreambox.org>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] libproxy: remove dependency on gconf when x11 not in DISTRO_FEATURES
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
X-List-Received-Date: Wed, 18 Apr 2012 00:46:48 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 18 April 2012 02:03:13 Andreas Oberritter wrote:
> A very similar patch I submitted was rejected, because this problem
> should be solved using PACKAGECONFIG.

It should still be. I had not seen your patch, but this was fixed in this 
manner because I discovered builds without x11 were broken and a fix was needed 
urgently; I elected to fix it by by adjusting the conditional code that was 
already there so that the change was kept simple. We do still want to fix this 
using PACKAGECONFIG after the Yocto Project 1.2 release; however this will 
involve the code that handles PACKAGECONFIG being extended to work together 
with cmake.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


