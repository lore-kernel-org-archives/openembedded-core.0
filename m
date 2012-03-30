Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SDcmW-0005Bf-TO
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Mar 2012 16:26:25 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 30 Mar 2012 07:17:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="125252652"
Received: from unknown (HELO helios.localnet) ([10.252.123.235])
	by azsmga001.ch.intel.com with ESMTP; 30 Mar 2012 07:17:18 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Mar 2012 15:17:17 +0100
Message-ID: <1640360.hZYVmbFPaV@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-17-generic-pae; KDE/4.8.1; i686; ; )
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
X-List-Received-Date: Fri, 30 Mar 2012 14:26:25 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 26 March 2012 22:42:54 Saul Wold wrote:
> Updated comments per Darren's request, added cleanup to
> image-types to only use one -i (inode-count) parameter.
> 
> Sau!
> The following changes since commit 644b7503c37fd73730dd3d7841463b158b8934ed:
> 
>   guile: Deal with hardcoded path issues (2012-03-27 00:28:41 +0100)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib sgw/self
>  
> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/
> self

So these patches have been merged now; I updated to latest master and re-ran 
bitbake self-hosted-image; unfortunately the output doesn't appear to be 
usable. I don't know what has gone wrong but during boot there are complaints 
that the filesystem is corrupt:

SYSLINUX 4.03 2010-10-22 EDD Copyright (C) 1994-2010 H. Peter Anvin et al
EXT3-fs error (device hda2): ext3_lookup: deleted inode referenced: 581713
EXT3-fs error (device hda2): ext3_lookup: deleted inode referenced: 610383
Kernel panic - not syncing: no init found.  Try passing init= option to 
kernel.

Running e2fsck -fn on the rootfs.ext3 file shows quite a number of errors. 
There were no unusual errors in the log.do_rootfs.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


