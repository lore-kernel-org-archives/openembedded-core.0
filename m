Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SEQp7-0006FM-4k
	for openembedded-core@lists.openembedded.org;
	Sun, 01 Apr 2012 21:52:25 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 01 Apr 2012 12:43:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="148464559"
Received: from unknown (HELO helios.localnet) ([10.252.123.252])
	by fmsmga002.fm.intel.com with ESMTP; 01 Apr 2012 12:43:16 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Cui, Dexuan" <dexuan.cui@intel.com>
Date: Sun, 01 Apr 2012 20:43:14 +0100
Message-ID: <1627697.cshU2EUhO7@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-17-generic-pae; KDE/4.8.1; i686; ; )
In-Reply-To: <A25F549E4D43CD42B4C02DF47A1913230FCEC5F0@SHSMSX102.ccr.corp.intel.com>
References: <cover.1332826876.git.sgw@linux.intel.com>
	<A25F549E4D43CD42B4C02DF47A1913230FCEBD18@SHSMSX102.ccr.corp.intel.com>
	<A25F549E4D43CD42B4C02DF47A1913230FCEC5F0@SHSMSX102.ccr.corp.intel.com>
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Sun, 01 Apr 2012 19:52:25 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sunday 01 April 2012 10:28:35 Cui, Dexuan wrote:
> Hi Paul, I believe this is true:
> genext2fs-1.4.1 can create a corrupt file system when
> the size of the file system exceeds some limit.
> 
> e.g., when I create an image of 2.8GB, the image can be mounted
> properly, but when I create an image of about 4.5GB(yes, I found
> genext2fs-1.4.1 is actually able to create an image of 4.5GB; I also
> found it's unable to create an image of about 5.5GB, always
> reporting "couldn't allocate a block (no free space)"),
> the generated image can show something like this when it's
> booted:
> 
> EXT3-fs error (device hda2): ext3_lookup: deleted inode referenced...
> 
> However, with Corey's patches (from the genext2fs's mailing list)
> applied, I can't see the issues.

I can confirm this.

With these patches applied I also compared (a) using genext2fs to create a 
30GB rootfs, and (b) letting genext2fs create a filesystem with just enough 
space and then resizing it to 30GB with resize2fs. There was no benefit in the 
latter - it took 5 minutes longer.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


