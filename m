Return-Path: <dvhart@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2E0E36BF4B
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 17:40:32 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 12 Sep 2013 10:40:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,891,1371106800"; d="scan'208";a="402456114"
Received: from unknown (HELO [10.255.14.117]) ([10.255.14.117])
	by orsmga002.jf.intel.com with ESMTP; 12 Sep 2013 10:40:24 -0700
Message-ID: <1379007624.1285.8.camel@dvhart-mobl4.amr.corp.intel.com>
From: Darren Hart <dvhart@linux.intel.com>
To: Jason Wessel <jason.wessel@windriver.com>
Date: Thu, 12 Sep 2013 10:40:24 -0700
In-Reply-To: <1379006387-20186-3-git-send-email-jason.wessel@windriver.com>
References: <1379006387-20186-1-git-send-email-jason.wessel@windriver.com>
	<1379006387-20186-3-git-send-email-jason.wessel@windriver.com>
Organization: Intel
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/5] cdrtools-native: Update from 3.00 to 3.01a17
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
X-List-Received-Date: Thu, 12 Sep 2013 17:40:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-09-12 at 12:19 -0500, Jason Wessel wrote:
> The update is needed to support generation of EFI boot images that
> work with optical media.  Specifically the "-eltorito-platform efi"
> capability for mkisofs is needed.
> 
> [YOCTO #4100]
> 
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> ---
>  .../cdrtools/cdrtools-native_3.00.bb               |   30 -------------------
>  .../cdrtools/cdrtools-native_3.01a17.bb            |   31 ++++++++++++++++++++
>  2 files changed, 31 insertions(+), 30 deletions(-)
>  delete mode 100644 meta/recipes-devtools/cdrtools/cdrtools-native_3.00.bb
>  create mode 100644 meta/recipes-devtools/cdrtools/cdrtools-native_3.01a17.bb
> 

...

> diff --git a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01a17.bb b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01a17.bb
> new file mode 100644
> index 0000000..4a7a160
> --- /dev/null
> +++ b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01a17.bb
> @@ -0,0 +1,31 @@
> +# cdrtools-native OE build file
> +# Copyright (C) 2004-2006, Advanced Micro Devices, Inc.  All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +SUMMARY = "A set of tools for CD recording, including cdrecord"
> +DESCRIPTION = "A set of tools for CD recording, including cdrecord"
> +HOMEPAGE = "http://cdrecord.berlios.de/private/cdrecord.html"
> +SECTION = "console/utils"
> +LICENSE = "GPLv2 & CDDL-1.0 & LGPLv2.1+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=32f68170be424c2cd64804337726b312"
> +PR = "r0"

Recent consensus is that we drop the PR, especially if set to "r0".
Otherwise, looks good.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel



