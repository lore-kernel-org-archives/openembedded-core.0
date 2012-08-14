Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T1GZE-0003R2-76
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 14:49:52 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 14 Aug 2012 05:37:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,766,1336374000"; d="scan'208";a="180494865"
Received: from unknown (HELO helios.localnet) ([10.252.121.91])
	by orsmga001.jf.intel.com with ESMTP; 14 Aug 2012 05:37:56 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Radu Moisan <radu.moisan@intel.com>
Date: Tue, 14 Aug 2012 13:37:54 +0100
Message-ID: <10849222.KjNZNLiumm@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-29-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <502A41C7.4030009@intel.com>
References: <1344934956-28631-1-git-send-email-radu.moisan@intel.com>
	<20120814120153.GB3444@ad.chargestorm.se>
	<502A41C7.4030009@intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] busybox: Upgrade to upstream 1.20.2
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
X-List-Received-Date: Tue, 14 Aug 2012 12:49:52 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 14 August 2012 15:17:11 Radu Moisan wrote:
> +CONFIG_LSOF=y

This would be the only change that would concern me. If we didn't provide this 
with busybox before I think it should be disabled by default.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


