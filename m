Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SFTuO-0004UR-WB
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Apr 2012 19:22:13 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 04 Apr 2012 10:13:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="127071028"
Received: from unknown (HELO helios.localnet) ([10.252.120.27])
	by azsmga001.ch.intel.com with ESMTP; 04 Apr 2012 10:12:59 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Wed, 04 Apr 2012 18:12:58 +0100
Message-ID: <8496577.GTiH3Bl1do@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-17-generic-pae; KDE/4.8.1; i686; ; )
In-Reply-To: <CAP9ODKpPhyGJ-Jbu2JUGyzsYpAVAkOjTQGrvu3CN7p0JXb8cUQ@mail.gmail.com>
References: <cover.1333553396.git.paul.eggleton@linux.intel.com>
	<0d5a88036c74a354a62e13cf83d05f99fca8175b.1333553396.git.paul.eggleton@linux.intel.com>
	<CAP9ODKpPhyGJ-Jbu2JUGyzsYpAVAkOjTQGrvu3CN7p0JXb8cUQ@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] classes/image_types: add IMAGE_TUNE2FS_ext3
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
X-List-Received-Date: Wed, 04 Apr 2012 17:22:13 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 04 April 2012 13:57:04 Otavio Salvador wrote:
> On Wed, Apr 4, 2012 at 12:32, Paul Eggleton
> 
> <paul.eggleton@linux.intel.com> wrote:
> > Add a variable that allows additional options to be passed to tune2fs,
> > such as -m to control the amount of space reserved for root.
> 
> I'd prefer something like
> 
> IMG_POSTCMD_<fstype>
> 
> So it is generic enough to not be confusing for other filesystems.

Are you suggesting this would hold the entire post-command to be run? If not, 
what other post command could we be referring to in the case of other 
filesystems? (tune2fs being valid for ext2, ext3 and ext4).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


