Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QliLA-0005Rp-Ca
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 16:10:32 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1QliH3-00000i-UA from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 07:06:17 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 26 Jul 2011 07:03:34 -0700
Received: from [172.30.80.87] (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.1.289.1;
	Tue, 26 Jul 2011 07:06:17 -0700
Message-ID: <4E2EC9D5.9070209@mentor.com>
Date: Tue, 26 Jul 2011 07:06:13 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1311653945.git.josh@linux.intel.com>
	<ecf0ccbec73c85ee2e5bbbe9828468fcd995c88c.1311653945.git.josh@linux.intel.com>
In-Reply-To: <ecf0ccbec73c85ee2e5bbbe9828468fcd995c88c.1311653945.git.josh@linux.intel.com>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 26 Jul 2011 14:03:34.0624 (UTC)
	FILETIME=[CEF7F600:01CC4B9C]
Subject: Re: [PATCH 1/1] classes/image_types: IMAGE_TYPES was missing some entries
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
X-List-Received-Date: Tue, 26 Jul 2011 14:10:32 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 07/25/2011 09:21 PM, Joshua Lock wrote:
> Some of these entries are required by the GUI to enable the expected workflow
> of the ADT, namely a compressed rootfs image.
> 
> Signed-off-by: Joshua Lock <josh@linux.intel.com>
> ---
>  meta/classes/image_types.bbclass |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> index 1108802..f1aef86 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -103,4 +103,4 @@ IMAGE_DEPENDS_ubi = "mtd-utils-native"
>  IMAGE_DEPENDS_ubifs = "mtd-utils-native"
>  
>  # This variable is available to request which values are suitable for IMAGE_FSTYPES
> -IMAGE_TYPES = "jffs2 cramfs ext2 ext2.gz ext3 ext3.gz squashfs squashfs-lzma ubi"
> +IMAGE_TYPES = "jffs2 cramfs ext2 ext2.gz ext3 ext3.gz squashfs squashfs-lzma ubi tar tar.gz tar.bz2 tar.xz cpio cpio.gz cpio.xz cpio.lzma"

So, is there some way we can do this dynamically?  Either oe-core is
missing ext4, or we'll have to add that and all it's permutations.  And
then there's u-boot signed copies of all of the ext* compressed versions.

-- 
Tom Rini
Mentor Graphics Corporation


