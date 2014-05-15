Return-Path: <valentin.popa@intel.com>
Received: from mga03.intel.com (unknown [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id D018E65F09
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 May 2014 13:11:57 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 15 May 2014 06:11:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,1059,1389772800"; d="scan'208";a="432549990"
Received: from vpopa-desktop.rb.intel.com (HELO [10.237.105.76])
	([10.237.105.76])
	by azsmga001.ch.intel.com with ESMTP; 15 May 2014 06:11:54 -0700
Message-ID: <5374BD08.8090707@intel.com>
Date: Thu, 15 May 2014 16:11:36 +0300
From: Valentin Popa <valentin.popa@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1400150280.git.Qi.Chen@windriver.com>
In-Reply-To: <cover.1400150280.git.Qi.Chen@windriver.com>
Subject: Re: [PATCH 0/3] live image misc fixes
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
X-List-Received-Date: Thu, 15 May 2014 13:11:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/15/2014 01:40 PM, Chen Qi wrote:
> The purpose of this patchset is to make our live image work correctly after the
> following commit.
>
>      commit acfe3014d41de5e87cdbc58d0396349c6b9c3ffd
>      udev-extraconf: update mount.sh to use /run/media instead of /media
>
> These patches are tested against the core-image-minimal iso image for both booting and installing.
>
> //Chen Qi


Acked-by: Valentin Popa <valentin.popa@intel.com>

>
> The following changes since commit 58417093d7ce83c8a2f683a356fddc23aaee5e8e:
>
>    wic: Extend indirect string connection to support image names and rootfs (2014-05-13 19:35:06 +0100)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib ChenQi/live-image-misc-fixes
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/live-image-misc-fixes
>
> Chen Qi (3):
>    udev-extraconf: fix the misuse of /run/media
>    init-live.sh: list block devices correctly
>    initrdscripts: fix for /run/media
>
>   .../initrdscripts/files/init-install-efi-testfs.sh |   14 +++++++-------
>   .../initrdscripts/files/init-install-efi.sh        |   14 +++++++-------
>   .../initrdscripts/files/init-install-testfs.sh     |    4 ++--
>   .../initrdscripts/files/init-install.sh            |    4 ++--
>   meta/recipes-core/initrdscripts/files/init-live.sh |   20 ++++++++++----------
>   meta/recipes-core/udev/udev-extraconf/mount.sh     |    2 +-
>   6 files changed, 29 insertions(+), 29 deletions(-)
>


