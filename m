Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SMdTz-0001Qg-31
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Apr 2012 13:00:31 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 24 Apr 2012 03:50:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="134597758"
Received: from unknown (HELO helios.localnet) ([10.252.120.52])
	by azsmga001.ch.intel.com with ESMTP; 24 Apr 2012 03:50:53 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Dongxiao Xu <dongxiao.xu@intel.com>
Date: Tue, 24 Apr 2012 11:50:52 +0100
Message-ID: <2956480.HfgXetH5nE@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.2 (Linux/3.0.0-17-generic-pae; KDE/4.8.2; i686; ; )
In-Reply-To: <acc4d645371a65f07543608cf607d0104fb1b854.1335171085.git.dongxiao.xu@intel.com>
References: <cover.1335171085.git.dongxiao.xu@intel.com>
	<acc4d645371a65f07543608cf607d0104fb1b854.1335171085.git.dongxiao.xu@intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] qt4: move functions from python to shell style
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
X-List-Received-Date: Tue, 24 Apr 2012 11:00:31 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Dongxiao,

On Monday 23 April 2012 16:53:02 Dongxiao Xu wrote:
> In qt4's do_configure operation, it will refer to some variables that
> are derived from 'd', however these variable values may be not correct
> in multilib case since the extraction of these variables happens before
> the multilib handler.
> 
> The fix is to move these python style functions back to shell style.

This patch removes qt4_arch.inc without explaining why. Can the fix be made 
without removing it?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


