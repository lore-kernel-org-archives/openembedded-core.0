Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0AFD177194
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 May 2016 12:34:01 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 30 May 2016 05:33:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,389,1459839600"; d="scan'208";a="977242669"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 30 May 2016 05:33:45 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.51])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 01B806A4007;
	Mon, 30 May 2016 06:21:12 -0700 (PDT)
Date: Mon, 30 May 2016 15:33:39 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Christopher Larson <kergoth@gmail.com>
Message-ID: <20160530123339.GA12800@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <cover.1464208170.git.chris_larson@mentor.com>
MIME-Version: 1.0
In-Reply-To: <cover.1464208170.git.chris_larson@mentor.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Christopher Larson <chris_larson@mentor.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] Deploy startup.nsh for wic's bootimg-efi plugin
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
X-List-Received-Date: Mon, 30 May 2016 12:34:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 25, 2016 at 01:31:40PM -0700, Christopher Larson wrote:
> From: Christopher Larson <chris_larson@mentor.com>
> 
> Currently, wic EFI images don't end up with startup.nsh, so the user has to
> type in the correct bits into the EFI command-line, which isn't very
> user-friendly. mkefidisk.sh in oe-core writes it for us, but we don't get it
> for wic images.
> 
> Alter grub-efi.bbclass and gummiboot.bbclass to write it for the non-iso case,
> not only iso, so wic can grab and use it, and alter wic's bootimg-efi plugin to
> do so.
> 
> The following changes since commit bb4ead9b7b1400c37a72d148d9775bdf4210ec37:
> 
>   linux-yocto/4.4: integrate v4.4.11 (2016-05-25 07:49:55 +0100)
> 
> are available in the git repository at:
> 
>   git://github.com/kergoth/openembedded-core yocto-9556
>   https://github.com/kergoth/openembedded-core/tree/yocto-9556
> 
> Christopher Larson (3):
>   grub-efi.bbclass: also write startup.nsh for non-iso
>   gummiboot.bbclass: also write startup.nsh for non-iso
>   wic: bootimg-efi: include startup.nsh if it's available
> 
>  meta/classes/grub-efi.bbclass                 | 2 ++
>  meta/classes/gummiboot.bbclass                | 2 ++
>  scripts/lib/wic/plugins/source/bootimg-efi.py | 5 +++++
>  3 files changed, 9 insertions(+)
> 

+1
The patchset looks good to me.

--
Regards,
Ed

