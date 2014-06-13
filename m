Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 94FFC6FA9F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jun 2014 10:32:36 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 13 Jun 2014 03:27:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,470,1400050800"; d="scan'208";a="556882334"
Received: from pskulath-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.252])
	by orsmga002.jf.intel.com with ESMTP; 13 Jun 2014 03:32:36 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Jun 2014 11:32:35 +0100
Message-ID: <1511912.Mr2tm714vV@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.5 (Linux/3.14.6-200.fc20.x86_64; KDE/4.12.5; x86_64; ; )
In-Reply-To: <1402082078-10826-1-git-send-email-corneliux.stoicescu@intel.com>
References: <1402082078-10826-1-git-send-email-corneliux.stoicescu@intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH V2 0/7] YB #6375 #6254
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
X-List-Received-Date: Fri, 13 Jun 2014 10:32:44 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 06 June 2014 22:14:31 Corneliu Stoicescu wrote:
> This series of patches affects the automated runtime tests and introduces
> the following changes/features:
> 
> YB #6375: Add support for more rootfs compression formats
> - The target controller dynamically determines what IMAGE_FSTYPES to use
> based on the value of supported_image_fstypes that each target controller
> defines or inherits. This is needed for: * givint the targer controllers
> the possibility to choose an image fstype that is actually built instead of
> relying on a hard-coded value * enable external scripts to predict the name
> of the rootfs file. - Added bzip2 to the core-image-testmaster that
> decompresses the test roofs files. This is needed ATM for BSPs like
> beaglebone and edgeruter.
> 
> YB #6254: Set up automated testing of autobuilder images on real hardware
> We need a script that fetches images from a remote http server(for now) and
> uses them to conduct runtime tests. For this we needed: - to be able to
> import and use the testargetloader.py module to find the target controller
> beying used - create and access classmethods from the target controllers
> that would give information about the images needed for download (like
> rootfs type and extra files) - unify the kernel file naming scheme used
> throughout testimage(qemu use bzImage-qemux86.bin and the others use just
> bzImage for example). - a script that could use the above, run the runtime
> tests and return the results
> 
> NOTE: This script relies on the merge of "[PATCH] oeqa/utils/commands.py:
> add support for postconfig option" allready on the mailing list.
> 
> 
> *** BLURB HERE ***
> 
> Corneliu Stoicescu (7):
>   targetcontrol.py: make possible dynamical determination of rootfs type
>   masterimage.py: enable dynamical determination of rootfs type
>   core-image-testmaster.bb: add bzip2 to image
>   targetcontrol.py: Add a classmethod to get extra files needed by the
>     target controllers
>   oeqa/controllers/testtargetloader.py: add 'import os'
>   controllers/masterimage.py: Make testimage kernel naming pattern
>     universal
>   scripts/test-remote-image: Add script for running runtime tests on
>     remotely built images
> 
>  meta/lib/oeqa/controllers/masterimage.py           |  11 +-
>  meta/lib/oeqa/controllers/testtargetloader.py      |   1 +
>  meta/lib/oeqa/targetcontrol.py                     |  23 +-
>  .../images/core-image-testmaster.bb                |   2 +-
>  scripts/test-remote-image                          | 340
> +++++++++++++++++++++ 5 files changed, 370 insertions(+), 7 deletions(-)
>  create mode 100755 scripts/test-remote-image

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

