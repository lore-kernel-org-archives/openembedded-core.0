Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SCXfE-0000ch-5z
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Mar 2012 16:46:24 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 27 Mar 2012 07:37:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="123831316"
Received: from unknown (HELO helios.localnet) ([10.252.123.228])
	by azsmga001.ch.intel.com with ESMTP; 27 Mar 2012 07:37:21 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Mar 2012 15:37:19 +0100
Message-ID: <1443918.kuu0Jnlh65@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-16-generic-pae; KDE/4.8.1; i686; ; )
In-Reply-To: <cover.1332826876.git.sgw@linux.intel.com>
References: <cover.1332826876.git.sgw@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH 0/6] Setup for VMDK to use Direct Disk
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
X-List-Received-Date: Tue, 27 Mar 2012 14:46:24 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 26 March 2012 22:42:54 Saul Wold wrote:
> Updated comments per Darren's request, added cleanup to
> image-types to only use one -i (inode-count) parameter.

I tried this series on my build machine, but do_rootfs failed with "genext2fs: 
not enough memory for filesystem".

The machine has 6GB RAM and 8GB swap. The rootfs directory is 15GB. 

I guess this might have something to do with my DL_DIR not being clean 
beforehand (since it seems to be copying it into the rootfs in its entirety).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


