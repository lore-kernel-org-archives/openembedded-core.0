Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id B20507701D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 09:35:02 +0000 (UTC)
To: openembedded-core@lists.openembedded.org
References: <cover.1442503745.git.alejandro.joya.cruz@intel.com>
From: Jack Mitchell <ml@communistcode.co.uk>
Message-ID: <55FBDAF1.3030906@communistcode.co.uk>
Date: Fri, 18 Sep 2015 10:35:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <cover.1442503745.git.alejandro.joya.cruz@intel.com>
Subject: Re: [PATCH 0/3] Dynamic common utilities
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
X-List-Received-Date: Fri, 18 Sep 2015 09:35:06 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 17/09/15 17:20, Alejandro Joya wrote:
> It provide a virtual reference for the common utilities.
> it replace of the lock to busybox, it will be simple exchange between other
> common utilities like gnu core utils or toybox among others.
>
> In order to enable its required to fill at the distro conf or local.conf
>
> VIRTUAL-RUNTIME_login_manager ?= "busybox"
> PREFERRED_PROVIDER_virtual/anybox ?= "busybox"
> PREFERRED_RPROVIDER_virtual/anybox ?= "busybox"
> VIRTUAL-RUNTIME_anybox ?= "busybox"
> VIRTUAL-RUNTIME_anybox-hwclock ?= "busybox-hwclock"
>
> The following changes since commit f0189829498e30231d826c9f55aad73e622d076e:
>
>    qemu: Update to upstream patches (2015-09-14 11:22:02 +0100)
>
> are available in the git repository at:
>
>    git://github.com/Ajoyacr/openembedded-core anybox
>    https://github.com/Ajoyacr/openembedded-core/tree/anybox
>
> Alejandro Joya (3):
>    core-mage-minimal-initramfs: overwrite hardcoded dependency to virtual
>      reference
>    initramfs-framework: overwrite hardcoded dependency to virtual
>      reference
>    packagegroup-core-boot: overwrite hardcoded dependency to virtual
>      reference
>
>   meta/recipes-core/images/core-image-minimal-initramfs.bb   | 2 +-
>   meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb | 2 +-
>   meta/recipes-core/packagegroups/packagegroup-core-boot.bb  | 6 +++---
>   3 files changed, 5 insertions(+), 5 deletions(-)
>

is 'anybox' a good name for the virtual provider? What happens if we have a new 
suite of core utility replacements without box in the name, I assume it will be 
a nightmare to retroactivly change the name so we should probably come up with a 
more generic one now. virtual/core-utils, virtual/base-utils?

Cheers,
Jack.

