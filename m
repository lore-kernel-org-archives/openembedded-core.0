Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QvU4D-0004uP-Ii
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Aug 2011 14:57:25 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 22 Aug 2011 05:52:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,263,1312182000"; d="scan'208";a="41067930"
Received: from unknown (HELO helios.localnet) ([10.255.18.106])
	by azsmga001.ch.intel.com with ESMTP; 22 Aug 2011 05:52:39 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Xiaofeng Yan <xiaofeng.yan@windriver.com>
Date: Mon, 22 Aug 2011 13:52:38 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-10-generic-pae; KDE/4.6.2; i686; ; )
References: <cover.1314010928.git.xiaofeng.yan@windriver.com>
	<1b28a73fd25e40a29659583ee1432f7f3c720b68.1314010928.git.xiaofeng.yan@windriver.com>
In-Reply-To: <1b28a73fd25e40a29659583ee1432f7f3c720b68.1314010928.git.xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Message-Id: <201108221352.38897.paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] qt4-x11-demo-image: Fix bug 999
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
X-List-Received-Date: Mon, 22 Aug 2011 12:57:25 -0000
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit

On Monday 22 August 2011 12:34:11 Xiaofeng Yan wrote:
> From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> 
> [YOCTO #999]
> Add qt4-x11-demo-image for fixing bug 999

Thanks for looking into this bug. A couple of comments though:

1) You need to specify an appropriate commit message. This should include a 
reason for adding (i.e. to allow easy testing of Qt4 on X11); you also need to 
credit OE if that's where you copied some of the metadata from.

2) This adds quite a lot more than should be needed for a simple demo image. 
The image itself should inherit from core-image, this will save a lot of 
duplication. Why are you adding palmtop.bbclass, sdk.bbclass, task-sdk-host, 
micro-base-image etc.? These should not be needed at all.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


