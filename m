Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R4Fpk-00068S-IM
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Sep 2011 19:34:44 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 Sep 2011 10:29:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,388,1312182000"; d="scan'208";a="54086868"
Received: from unknown (HELO [10.255.14.252]) ([10.255.14.252])
	by fmsmga002.fm.intel.com with ESMTP; 15 Sep 2011 10:29:31 -0700
From: Saul Wold <sgw@linux.intel.com>
To: Tom Zanussi <tom.zanussi@intel.com>
Date: Thu, 15 Sep 2011 10:29:31 -0700
In-Reply-To: <1316025864.26879.2583.camel@elmorro>
References: <1316025864.26879.2583.camel@elmorro>
Organization: Yocto Project / OTC / Intel
X-Mailer: Evolution 3.0.3 (3.0.3-1.fc15) 
Message-ID: <1316107771.1058.78.camel@swold-mobl.bigsur.com>
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Add new recipes for grub2 [v4]
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: sgw@linux.intel.com, Patches and discussions about the oe-core layer
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
X-List-Received-Date: Thu, 15 Sep 2011 17:34:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-09-14 at 13:44 -0500, Tom Zanussi wrote:
> This patchset adds a new recipe for grub2 and an accompanying
> changes to initramfs-live-install.
> 
> It's been preliminarily boot-tested with the meta-intel BSPs emenlow,
> and the legacy version (grub-0.97) was also tested with emenlow.
> 
> v4 changes:
> 
> Suggestions from Otavio Salvador and Saul Wold to add more info to
> the patch header.
> 
> v3 changes:
> 
> Suggestions from Otavio Salvador to update copyright and add a patch
> header.
> 
> v2 changes:
> 
> Suggestions from Otavio Salvador to remove any distro-specific text
> and avoid duplicate scripts.
> 
> 
> Tom Zanussi (2):
>   grub2: new recipe
>   initramfs-live-install: add support for grub2
> 
>  meta/recipes-bsp/grub/grub-1.99/40_custom          |    9 ++++
>  .../grub/grub-1.99/grub-install.in.patch           |   20 +++++++++
>  meta/recipes-bsp/grub/grub_1.99.bb                 |   44 ++++++++++++++++++++
>  .../initrdscripts/files/init-install.sh            |   31 +++++++++++---
>  .../initrdscripts/initramfs-live-install_1.0.bb    |    8 +--
>  5 files changed, 101 insertions(+), 11 deletions(-)
>  create mode 100755 meta/recipes-bsp/grub/grub-1.99/40_custom
>  create mode 100644 meta/recipes-bsp/grub/grub-1.99/grub-install.in.patch
>  create mode 100644 meta/recipes-bsp/grub/grub_1.99.bb
> 

Merged into OE-Core

Thanks 
	Sau!





