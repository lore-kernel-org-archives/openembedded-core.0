Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1StFcO-0007iz-Qz
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jul 2012 12:12:01 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 23 Jul 2012 03:00:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="171902317"
Received: from unknown (HELO helios.localnet) ([10.252.121.29])
	by azsmga001.ch.intel.com with ESMTP; 23 Jul 2012 03:00:32 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Mon, 23 Jul 2012 11:00:31 +0100
Message-ID: <4960258.KFiZKWHEoN@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.4 (Linux/3.2.0-26-generic-pae; KDE/4.8.4; i686; ; )
In-Reply-To: <1343001258-19551-3-git-send-email-raj.khem@gmail.com>
References: <1343001258-19551-1-git-send-email-raj.khem@gmail.com>
	<1343001258-19551-3-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] libcgroup_0.37.1.bb: Add recipe
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
X-List-Received-Date: Mon, 23 Jul 2012 10:12:01 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sunday 22 July 2012 16:54:18 Khem Raj wrote:
> +# We really need the symlink so :(
> +ERROR_QA = "debug-deps dev-deps debug-files arch la2 pkgconfig la perms"

Why do you need this? If you really do need it, you must use INSANE_SKIP and 
not ERROR_QA here.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


