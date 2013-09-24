Return-Path: <mihaix.lindner@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 10920601D6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2013 09:59:18 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 24 Sep 2013 02:59:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,969,1371106800"; d="scan'208";a="406320217"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 24 Sep 2013 02:59:19 -0700
Received: from [10.237.105.31] (unknown [10.237.105.31])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 2BAF22C8001;
	Tue, 24 Sep 2013 02:59:16 -0700 (PDT)
Message-ID: <1380016738.3325.4.camel@mlindnex-mobl1.ger.corp.intel.com>
From: Mihai Lindner <mihaix.lindner@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Sep 2013 12:58:58 +0300
In-Reply-To: <cover.1379969542.git.dvhart@linux.intel.com>
References: <cover.1379969542.git.dvhart@linux.intel.com>
Organization: Intel OTC
X-Mailer: Evolution 3.6.4 
Mime-Version: 1.0
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: Re: [PATCH 0/2] EFI Installer Fixes
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
X-List-Received-Date: Tue, 24 Sep 2013 09:59:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-09-23 at 13:54 -0700, Darren Hart wrote:
> Fix two bugs reported against the efi installer script when testing on the
> MinnowBoard.
> 
> Patches have been tested together, successfully installing from USB to SD on the
> MinnowBoard and booting without any manual manipulation of the installation
> media after the fact.
> 
> The following changes since commit bf6b0d95db3863a2cfbccb154c0c7ad5b3bbf0b0:
> 
>   glib-2.0: fix broken python script header on machines using buildtools (2013-09-22 12:23:35 +0100)
> 
> are available in the git repository at:
> 
>   git://git.yoctoproject.org/poky-contrib dvhart/efi-installer
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=dvhart/efi-installer
> 
> Darren Hart (2):
>   init-install-efi.sh: Fix root= specification
>   init-install-efi.sh: Remove unnecessary udev rules file to avoid
>     errors
> 
>  .../initrdscripts/files/init-install-efi.sh        |    7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 

Both fixed; tested here also.

Thanks,

--
Mihai Lindner
Yocto Project QA
Intel OTC


