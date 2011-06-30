Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QcKfB-0002t1-8n
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Jun 2011 19:04:26 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 30 Jun 2011 10:00:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,451,1304319600"; d="scan'208";a="21015505"
Received: from unknown (HELO helios.localnet) ([10.255.17.99])
	by azsmga001.ch.intel.com with ESMTP; 30 Jun 2011 10:00:39 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jun 2011 18:00:38 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic-pae; KDE/4.6.2; i686; ; )
References: <cover.1308747461.git.ke.yu@intel.com>
	<fa1e6143a43db7d1c355aa3ca22f16133b30c031.1308747461.git.ke.yu@intel.com>
In-Reply-To: <fa1e6143a43db7d1c355aa3ca22f16133b30c031.1308747461.git.ke.yu@intel.com>
MIME-Version: 1.0
Message-Id: <201106301800.38315.paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 1/1] combo-layer-tool: add tool to manipulate combo layer
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
X-List-Received-Date: Thu, 30 Jun 2011 17:04:26 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Hi Ke,

So I've tested this now, apologies for taking so long. Updating with filtering 
works well. Unfortunately when I tested splitpatch it didn't seem to be 
working - instead of getting the HEAD commit split out into patches for the 
each components of the combo repo, I just get semi-random patches for each 
component. I haven't looked at the code to see what's going wrong yet, I 
suspect you're quite busy with multilib so I might have to do that.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


