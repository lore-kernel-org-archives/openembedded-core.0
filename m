Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 7DBFA6B4F7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2013 15:59:47 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 09 Aug 2013 08:57:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,846,1367996400"; d="scan'208";a="360263270"
Received: from unknown (HELO helios.localnet) ([10.252.122.201])
	by orsmga001.jf.intel.com with ESMTP; 09 Aug 2013 08:59:47 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
Date: Fri, 09 Aug 2013 16:59:46 +0100
Message-ID: <16191583.I6O08tzN91@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-27-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <cover.1376063699.git.sgw@linux.intel.com>
References: <cover.1376063699.git.sgw@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/15] Ready for Final ACK
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Aug 2013 15:59:47 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 09 August 2013 08:58:24 Saul Wold wrote:
> Richard,
> 
> Please pull after Ross and Paul give final ack.
> 
> Removed 2 patches based on Paul's review (Jukka's procps and
> Otavio's blacklist).
> 
> Thanks
> 
> Sau!
> 
> 
> The following changes since commit 291ab168fac15eae0e4c9234e16f394b0e1547a0:
> 
>   subversion: Add patch to use neon 0.30 (2013-08-07 07:43:31 +0100)
> 
> are available in the git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>  
> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/
> stage
> 
> Bian Naimeng (1):
>   bash: reference acl*.m4 from ${S}
> 
> Chen Qi (2):
>   busybox: remove syslog-startup.conf if sysvinit not in DISTRO_FEATURES
>   checkroot.sh: respect the value of ENABLE_ROOTFS_FSCK
> 
> Cristian Iorga (3):
>   net-tools: upgrade to v1.60-25
>   gst-fluendo-mpegdemux: upgrade to v0.10.72
>   build-appliance-image: upgrade to
>     ac60aa8cf707eec58e2cb51e7c406250d0b43ef1 commit.
> 
> Cristiana Voicu (3):
>   tzdata: upgrade to 2013d
>   ed: upgrade to 1.9
>   mkfontscale: upgrade to 1.1.1
> 
> Kai Kang (1):
>   sudo: quote BUILD_CC
> 
> Martin Jansa (2):
>   buildhistory: use package_qa_handle_error for version-going-backwards
>   buildhistory: use bb.utils.mkdirhier instead of os.makedirs
> 
> Riku Voipio (1):
>   qemu: pass CFLAGS via ./configure instead of a patch
> 
> Ross Burton (1):
>   separatebuilddir: add comments
> 
> Victor Kamensky (1):
>   systemtap: fix build failure on host system with dyninst installed

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

