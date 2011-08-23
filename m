Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Qvq0t-00069P-JZ
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Aug 2011 14:23:27 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 23 Aug 2011 05:18:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,269,1312182000"; d="scan'208";a="10136249"
Received: from unknown (HELO helios.localnet) ([10.255.18.129])
	by AZSMGA002.ch.intel.com with ESMTP; 23 Aug 2011 05:18:11 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Xiaofeng Yan <xiaofeng.yan@windriver.com>
Date: Tue, 23 Aug 2011 13:18:10 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-10-generic-pae; KDE/4.6.2; i686; ; )
References: <cover.1314096402.git.xiaofeng.yan@windriver.com>
	<2a8e8dd160c4dba319dbbd7864d33cecd681b08c.1314096402.git.xiaofeng.yan@windriver.com>
In-Reply-To: <2a8e8dd160c4dba319dbbd7864d33cecd681b08c.1314096402.git.xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Message-Id: <201108231318.10118.paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] qt4e-demo-image: Fix bug 999
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
X-List-Received-Date: Tue, 23 Aug 2011 12:23:27 -0000
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit

On Tuesday 23 August 2011 11:57:35 Xiaofeng Yan wrote:
> From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> 
> [YOCTO #999]
> 
> Copy metadata of qt4e-demo-image from OE for easy testing qt4embeded on
> embedded platform. This image was tested on qemuarm and can run program
> "qtdemoE".

I don't think we should pull in qwt in OE-core (or at least, we shouldn't drag 
it in just for this.) Also I would recommend trying to make the image inherit 
from core-image as well to avoid much of the generic boilerplate that's in 
there.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


