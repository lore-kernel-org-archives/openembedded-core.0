Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SJpIU-0001kQ-LX
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Apr 2012 19:01:02 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 16 Apr 2012 09:51:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="130227948"
Received: from unknown (HELO helios.localnet) ([10.252.120.96])
	by orsmga001.jf.intel.com with ESMTP; 16 Apr 2012 09:51:36 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 16 Apr 2012 17:51:33 +0100
Message-ID: <1469677.3CtmNycder@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.2 (Linux/3.0.0-17-generic-pae; KDE/4.8.2; i686; ; )
In-Reply-To: <cover.1334594354.git.paul.eggleton@linux.intel.com>
References: <cover.1334594354.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH 0/1] Fix perl re-execution issues
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
X-List-Received-Date: Mon, 16 Apr 2012 17:01:02 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 16 April 2012 17:43:01 Paul Eggleton wrote:
> Fix re-execution issues within perl.
> 
> Note: I identified that some references to /usr/include are still not
> being substituted before or after this patch - you can see these by
> doing "grep -rI '/usr/include' *" 

er, that should be:

grep -rI "'/usr/include'" *

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


