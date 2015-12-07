Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E70F760124
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Dec 2015 10:51:45 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 07 Dec 2015 02:51:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,394,1444719600"; d="scan'208";a="866230364"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 07 Dec 2015 02:51:46 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.51])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 9A3586A4087;
	Mon,  7 Dec 2015 02:50:36 -0800 (PST)
Date: Mon, 7 Dec 2015 12:20:26 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: mariano.lopez@linux.intel.com
Message-ID: <20151207102025.GB6782@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <cover.1448961756.git.mariano.lopez@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <cover.1448961756.git.mariano.lopez@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2 0/6] wic: Allow to user defined files as config for bootloaders
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
X-List-Received-Date: Mon, 07 Dec 2015 10:51:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mariano,

The patchset looks good to me. Thank you.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>

On Tue, Dec 01, 2015 at 09:38:58AM +0000, mariano.lopez@linux.intel.com wrote:
> From: Mariano Lopez <mariano.lopez@linux.intel.com>
> 
> These patches add a new option for the bootloaders. This new option allows
> to use a custom configuration file as the bootloader config with the
> "configfile" variable in the bootloader line. This is very useful when there
> is need to create a multiboot image or when there is need to use scripting in
> the bootloader.
> 
> Changes in v2
> 
> - Previous version just allowed the have the complete path for the file. Now
>   it will search for the file in the canned-wks folders for all the layers
>   that are part of the project.
> - Include an example wks file in canned-wks folder.
> - Include an example configuration in canned-wks folder.
> - Include the changes in the documentation.
> - Include test in self-test.
> 
> 
> The following changes since commit 03f15e51998a3ef65a5b68cb7cbf724f4388c289:
> 
>   sstate: Ensure siginfo and sig files are also touched (2015-11-25 08:09:00 +0000)
> 
> are available in the git repository at:
> 
>   git://git.yoctoproject.org/poky-contrib mariano/bug8728
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mariano/bug8728
> 
> Mariano Lopez (6):
>   wic: Prepare wicboot to allow custom bootloader config
>   wic/utils/misc.py: Added function to search for files in canned-wks
>   wic: Allow to use a custom config for bootloaders
>   wic/help.py: Document the new option "configfile"
>   directdisk-bootloader-config.wks: Add example for custom bootloader
>     config
>   selftest/wic.py: Add test for custom bootloader config
> 
>  meta/lib/oeqa/selftest/wic.py                      |  8 +++
>  .../canned-wks/directdisk-bootloader-config.cfg    | 11 ++++
>  .../canned-wks/directdisk-bootloader-config.wks    | 10 +++
>  scripts/lib/wic/help.py                            |  6 ++
>  scripts/lib/wic/kickstart/__init__.py              |  7 +++
>  .../lib/wic/kickstart/custom_commands/wicboot.py   |  5 ++
>  scripts/lib/wic/plugins/source/bootimg-efi.py      | 67 ++++++++++++++------
>  scripts/lib/wic/plugins/source/bootimg-pcbios.py   | 72 +++++++++++++---------
>  scripts/lib/wic/utils/misc.py                      | 39 ++++++++++++
>  9 files changed, 179 insertions(+), 46 deletions(-)
>  create mode 100644 scripts/lib/wic/canned-wks/directdisk-bootloader-config.cfg
>  create mode 100644 scripts/lib/wic/canned-wks/directdisk-bootloader-config.wks
> 
> -- 
> 1.8.4.5
> 

-- 
--
Regards,
Ed

