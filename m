Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QwNe5-0000P4-59
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Aug 2011 02:18:09 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 24 Aug 2011 17:13:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,278,1312182000"; d="scan'208";a="44135649"
Received: from unknown (HELO helios.localnet) ([10.255.18.136])
	by fmsmga002.fm.intel.com with ESMTP; 24 Aug 2011 17:13:20 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
Date: Thu, 25 Aug 2011 01:13:20 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-10-generic-pae; KDE/4.6.2; i686; ; )
References: <cover.1314166867.git.xiaofeng.yan@windriver.com>
	<e62894baf8e79baa7e19901b7ec8c515dddb2537.1314166867.git.xiaofeng.yan@windriver.com>
	<4E558B0D.1080307@linux.intel.com>
In-Reply-To: <4E558B0D.1080307@linux.intel.com>
MIME-Version: 1.0
Message-Id: <201108250113.20066.paul.eggleton@linux.intel.com>
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
X-List-Received-Date: Thu, 25 Aug 2011 00:18:09 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday 25 August 2011 00:36:45 Saul Wold wrote:
> Why do we need the qt4e-base-image and this demo-image?  Do we expect to
> have multiple images?  This creates yet another image that needs to be
> built and tested?  Can this really just be added to the sato-sdk or
> lsb-sdk images instead?

No, it doesn't belong in sato-sdk and lsb-sdk is Qt4/X11 based which counts it 
out also. It really needs its own image. The -base image could be merged into 
-demo though.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


