Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UIGVT-0004Pw-Ec
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Mar 2013 11:44:31 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 20 Mar 2013 03:26:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,876,1355126400"; d="scan'208";a="305027401"
Received: from unknown (HELO helios.localnet) ([10.255.13.114])
	by orsmga002.jf.intel.com with ESMTP; 20 Mar 2013 03:27:39 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Date: Wed, 20 Mar 2013 10:27:35 +0000
Message-ID: <1586733.G7AaCq5rbs@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.1 (Linux/3.5.0-26-generic; KDE/4.10.1; i686; ; )
In-Reply-To: <1363772243-370-1-git-send-email-marcin.juszkiewicz@linaro.org>
References: <1363772243-370-1-git-send-email-marcin.juszkiewicz@linaro.org>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC] Switching from glibc RPC to TI RPC
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
X-List-Received-Date: Wed, 20 Mar 2013 10:44:32 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 20 March 2013 10:37:17 Marcin Juszkiewicz wrote:
> rpcbind needed removal of yellow pages support (whatever it is).

Isn't that NIS? Will that affect the ypbind-mt / yp-tools recipes recently 
added back into meta-networking?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


