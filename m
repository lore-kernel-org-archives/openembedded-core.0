Received: from stoexhubfe02.domain01.net ([83.145.59.141])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1R1CQw-0003kw-Ew
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Sep 2011 09:20:30 +0200
Received: from localhost (193.235.91.228) by stoexhubfe02.domain01.net
	(10.12.10.7) with Microsoft SMTP Server id 8.3.137.0; Wed, 7 Sep 2011
	09:15:27 +0200
Date: Wed, 7 Sep 2011 09:15:41 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20110907071541.GB4181@chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <cover.1315343093.git.nitin.a.kamble@intel.com>
	<7318770f8b3b34d4ec29ee592971a5be96e53151.1315343093.git.nitin.a.kamble@intel.com>
MIME-Version: 1.0
In-Reply-To: <7318770f8b3b34d4ec29ee592971a5be96e53151.1315343093.git.nitin.a.kamble@intel.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
X-GFI-SMTP-Submission: 1
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
X-List-Received-Date: Wed, 07 Sep 2011 07:20:30 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* nitin.a.kamble@intel.com <nitin.a.kamble@intel.com> [110906 23:07]:
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

As Joshua already replied, this isn't enough.
This raises one question, though. Have you successfully built
btrfs-image? If so, I assume that you have more patches locally,
otherwise you should resist submitting patches, unless they're clearly
marked as RFC (request for comments, and thus not to be applied).

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB


