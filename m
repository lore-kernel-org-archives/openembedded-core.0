Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T3SzZ-00006J-3h
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 16:30:09 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 20 Aug 2012 07:18:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,797,1336374000"; d="scan'208";a="211096012"
Received: from unknown (HELO helios.localnet) ([10.252.121.92])
	by fmsmga002.fm.intel.com with ESMTP; 20 Aug 2012 07:18:04 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Radu Moisan <radu.moisan@intel.com>
Date: Mon, 20 Aug 2012 15:18:03 +0100
Message-ID: <2290927.ckQsIm3pt4@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-29-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <1345471653-4604-1-git-send-email-radu.moisan@intel.com>
References: <1345471653-4604-1-git-send-email-radu.moisan@intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] busybox: Upgrade to upstream 1.20.2
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
X-List-Received-Date: Mon, 20 Aug 2012 14:30:09 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 20 August 2012 17:07:33 Radu Moisan wrote:
> +CONFIG_CROSS_COMPILER_PREFIX="i586-poky-linux-"

I think we probably want to clear this value as it was before - just for 
stylistic reasons, it won't make any actual difference to the output.

Cheers,
Paul


-- 

Paul Eggleton
Intel Open Source Technology Centre


