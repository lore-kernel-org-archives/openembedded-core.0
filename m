Return-Path: <saul.wold@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 385EA6057B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 02:41:26 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 25 Nov 2015 18:41:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,345,1444719600"; d="scan'208";a="859577978"
Received: from slwilson-mobl1.amr.corp.intel.com ([10.254.91.207])
	by orsmga002.jf.intel.com with ESMTP; 25 Nov 2015 18:41:27 -0800
Message-ID: <1448505687.12905.2.camel@intel.com>
From: Saul Wold <saul.wold@intel.com>
To: Mei Yeen Ng <mei.yeen.ng@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 25 Nov 2015 18:41:27 -0800
In-Reply-To: <1448504729-25657-1-git-send-email-mei.yeen.ng@intel.com>
References: <1448504729-25657-1-git-send-email-mei.yeen.ng@intel.com>
X-Mailer: Evolution 3.18.1 (3.18.1-1.fc23) 
Mime-Version: 1.0
Subject: Re: [PATCH 0/2] meta: fix installation issue with install-efi.sh script
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
X-List-Received-Date: Thu, 26 Nov 2015 02:41:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2015-11-26 at 10:25 +0800, Mei Yeen Ng wrote:
> From: "Ng, Mei Yeen" <mei.yeen.ng@intel.com>
> 
> Hi maintainers and communities,
> 
> These two patches fix the below two bugs:
>   https://bugzilla.yoctoproject.org/show_bug.cgi?id=8709
>   https://bugzilla.yoctoproject.org/show_bug.cgi?id=8710
> 
> When running the install option in Gummiboot and GRUB boot loader
> results in
> boot failure on target device:
>  1/ After installing image to SATA using Gummiboot, image fail to
> boot from SATA
>     due to missing root=PARTUUID= in the boot parameter. Addressed
> this by
>     assigning the root uuid for non-grub boot loader in install-efi
> script.
> 
>  2/ Installing image to eMMC via GRUB and Gummiboot boot loader
> install option
>     due to partition prefix and uuid for boot, root, and swap
> partition are
>     are not captured for eMMC. Addressed this by referencing the
> another variable
>     which captures the prefix assignment.
> 
> These patches are applied, build and tested on 2 different Intel
> platforms
> The tests results passed for the following scenarios:
>   GRUB loader + install to SATA = Passed
>   GRUB loader + install to eMMC = Passed
>   Gummiboot loader + install to SATA = Passed
>   Gummiboot loader + install to eMMC = Passed
> 
> Ng, Mei Yeen (2):
>   meta: fix install-efi script for gummiboot loader
>   meta: fix install-efi script for emmc installation
> 
The titles of this should be
init-install-efi: fix script for gummiboot loader
init-install-efi: fix script for eMMC installation

Also these should be considered for backporting once they are included
in master.

Sau!

>  meta/recipes-core/initrdscripts/files/init-install-efi.sh | 9 +++++-
> ---
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> --
> 1.9.1
> 

