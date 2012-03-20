Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S9xhH-0005es-CM
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Mar 2012 12:57:51 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 20 Mar 2012 04:48:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="79552698"
Received: from unknown (HELO helios.localnet) ([10.252.123.195])
	by AZSMGA002.ch.intel.com with ESMTP; 20 Mar 2012 04:48:57 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 20 Mar 2012 11:48:55 +0000
Message-ID: <1812139.SkpSglmEkv@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-16-generic-pae; KDE/4.8.1; i686; ; )
In-Reply-To: <1332241255-5083-3-git-send-email-koen@dominion.thruhere.net>
References: <1332241255-5083-1-git-send-email-koen@dominion.thruhere.net>
	<1332241255-5083-3-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] buildhistory: remove duplicate entries from dot graph
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
X-List-Received-Date: Tue, 20 Mar 2012 11:57:51 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 20 March 2012 12:00:55 Koen Kooi wrote:
> There are various conditions that lead to duplicate entries in the dot graph
> which need to get fixed, but this patch is a catchall.

Dependencies and recommends are already de-duped - are we getting duplicates 
in the package list as well?

> Another benefit is that the sort order is now know, leading to less spurious
> diffs in buildhistory commits.

The package list is already sorted, and so are the dependencies and 
recommends, so how would the sort order be changing?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


