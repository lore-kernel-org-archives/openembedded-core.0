Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1R14MD-000158-Sy
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Sep 2011 00:43:06 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 06 Sep 2011 15:38:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,341,1312182000"; d="scan'208";a="46150936"
Received: from scimitar.fm.intel.com (HELO [10.232.250.14]) ([10.232.250.14])
	by azsmga001.ch.intel.com with ESMTP; 06 Sep 2011 15:38:02 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 06 Sep 2011 15:38:02 -0700
In-Reply-To: <7318770f8b3b34d4ec29ee592971a5be96e53151.1315343093.git.nitin.a.kamble@intel.com>
References: <cover.1315343093.git.nitin.a.kamble@intel.com>
	<7318770f8b3b34d4ec29ee592971a5be96e53151.1315343093.git.nitin.a.kamble@intel.com>
X-Mailer: Evolution 3.0.2 (3.0.2-3.fc15) 
Message-ID: <1315348682.2005.2.camel@scimitar>
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] image-types: add btrfs as a supported fstype
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Tue, 06 Sep 2011 22:43:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-09-06 at 14:06 -0700, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
> 
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> ---
>  meta/classes/image_types.bbclass |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> index c24b326..3e303ed 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -141,4 +141,4 @@ IMAGE_DEPENDS_ubi = "mtd-utils-native"
>  IMAGE_DEPENDS_ubifs = "mtd-utils-native"
>  
>  # This variable is available to request which values are suitable for IMAGE_FSTYPES
> -IMAGE_TYPES = "jffs2 cramfs ext2 ext2.gz ext3 ext3.gz live squashfs squashfs-lzma ubi tar tar.gz tar.bz2 tar.xz cpio cpio.gz cpio.xz cpio.lzma"
> +IMAGE_TYPES = "jffs2 cramfs ext2 ext2.gz ext3 ext3.gz btrfs live squashfs squashfs-lzma ubi tar tar.gz tar.bz2 tar.xz cpio cpio.gz cpio.xz cpio.lzma"

This isn't enough, the variable you've modified is one used only by the
hob UI.

You need to define IMAGE_CMD_btrfs and possibly IMAGE_DEPENDS_btrfs
entries, maybe EXTRA_IMAGE_CMD_btrfs too if required?

Cheers,
Joshua
-- 
Joshua Lock
        Yocto Project "Johannes factotum"
        Intel Open Source Technology Centre



