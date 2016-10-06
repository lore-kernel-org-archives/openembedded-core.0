Return-Path: <saul.wold@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id CCEF460745
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2016 16:03:03 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga103.fm.intel.com with ESMTP; 06 Oct 2016 09:02:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,454,1473145200"; d="scan'208";a="16963158"
Received: from swold-mobl2.amr.corp.intel.com ([10.255.86.96])
	by orsmga005.jf.intel.com with ESMTP; 06 Oct 2016 09:02:33 -0700
Message-ID: <1475769752.18115.206.camel@intel.com>
From: Saul Wold <saul.wold@intel.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 06 Oct 2016 09:02:32 -0700
In-Reply-To: <cover.1475749929.git.ed.bartosh@linux.intel.com>
References: <cover.1475749929.git.ed.bartosh@linux.intel.com>
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
Subject: Re: [wic][PATCH 0/4] use PARTUUID for MSDOS partitions
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
X-List-Received-Date: Thu, 06 Oct 2016 16:03:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2016-10-06 at 13:33 +0300, Ed Bartosh wrote:
> Hi,
> 
> This is an implementation of PARTUUID support for MSDOS partitions.
> Now wic can use 'root=PARTUUID=<uuid> for both types of supported
> partition tables - GPT and MSDOS.
> 
> This implementation enables usage of mkefidisk as a default wks for
> genericx86*
> machines as most of reference BSPs support EFI.
> 
> The following changes since commit
> f12825d4bf7091576856650123c7d7614b9089af:
> 
>   scripts: Rename 'native' to 'oe-run-native' (2016-10-06 07:53:51
> +0100)
> 
> are available in the git repository at:
> 
>   git://git.yoctoproject.org/poky-contrib ed/wic/msdos-partuuid
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/wic/msd
> os-partuuid
> 
> Ed Bartosh (4):
>   wic: set PARTUUID only for gpt partition table
>   wic: generate PARTUUID for MDOS partitions
>   wic: rewrite MBR disk identifier
>   mkefidisk.wks: use MSDOS partition table
> 
>  scripts/lib/wic/canned-wks/mkefidisk.wks |  2 +-
We need to change the console setting to ttyS0 by default instead of
the PCH0, which is from the FRI2 hardware, but this should not prevent
this patch from getting merged.

>  scripts/lib/wic/imager/direct.py         | 16 ++++++++++++++--
>  scripts/lib/wic/partition.py             |  3 ---
>  scripts/lib/wic/utils/partitionedfs.py   | 14 +++++++++++---
>  4 files changed, 26 insertions(+), 9 deletions(-)
> 
Reviewed-by: Saul Wold <sgw@linux.intel.com>
Tested-by: Saul Wold <sgw@linux.intel.com>
> --
> Regards,
> Ed

