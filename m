Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SXaXy-0002Rz-GT
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 18:05:54 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 24 May 2012 08:55:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="147358754"
Received: from unknown (HELO helios.localnet) ([10.252.120.182])
	by azsmga001.ch.intel.com with ESMTP; 24 May 2012 08:55:31 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 24 May 2012 16:55:30 +0100
Message-ID: <4198759.BcXlMUm672@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.2 (Linux/3.2.0-24-generic-pae; KDE/4.8.2; i686; ; )
In-Reply-To: <1337874789-6080-1-git-send-email-paul.eggleton@linux.intel.com>
References: <1337874789-6080-1-git-send-email-paul.eggleton@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH] opkg-nogpg: add file path
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
X-List-Received-Date: Thu, 24 May 2012 16:05:54 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 24 May 2012 16:53:09 Paul Eggleton wrote:
> +FILESEXTRAPATHS_prepend := "${THISDIR}/opkg-0.1.8:"

Hmm, this probably ought to be ${PV}. v2 coming.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


