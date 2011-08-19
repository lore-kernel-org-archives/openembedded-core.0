Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QuQ8i-0004Io-6y for openembedded-core@lists.openembedded.org;
	Fri, 19 Aug 2011 16:33:40 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7JESxt7028334
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2011 15:28:59 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26909-05 for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2011 15:28:55 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7JESlYm028328
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2011 15:28:50 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <29c8c5dc24923bf819a4965cfcf99bedb0d71c5a.1313700595.git.sgw@linux.intel.com>
References: <cover.1313700595.git.sgw@linux.intel.com>
	<29c8c5dc24923bf819a4965cfcf99bedb0d71c5a.1313700595.git.sgw@linux.intel.com>
Date: Fri, 19 Aug 2011 09:28:45 -0500
Message-ID: <1313764125.13995.102.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 11/32] mtd-utils: Added recipe of newer version 1.4.4.
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
X-List-Received-Date: Fri, 19 Aug 2011 14:33:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-08-18 at 13:55 -0700, Saul Wold wrote:
> From: Noor Ahsan <noor_ahsan@mentor.com>
> 
> * Added recipe of version 1.4.4 and removed 1.4.1 recipe and its patch files.
> 
> Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
> ---
>  .../add-exclusion-to-mkfs-jffs2-git-2.patch        |    0
>  .../mtd/{mtd-utils_1.4.1.bb => mtd-utils_1.4.4.bb} |   11 ++++++-----
>  2 files changed, 6 insertions(+), 5 deletions(-)
>  rename meta/recipes-devtools/mtd/{mtd-utils-1.4.1 => mtd-utils-1.4.4}/add-exclusion-to-mkfs-jffs2-git-2.patch (100%)
>  rename meta/recipes-devtools/mtd/{mtd-utils_1.4.1.bb => mtd-utils_1.4.4.bb} (76%)
> 
> diff --git a/meta/recipes-devtools/mtd/mtd-utils-1.4.1/add-exclusion-to-mkfs-jffs2-git-2.patch b/meta/recipes-devtools/mtd/mtd-utils-1.4.4/add-exclusion-to-mkfs-jffs2-git-2.patch
> similarity index 100%
> rename from meta/recipes-devtools/mtd/mtd-utils-1.4.1/add-exclusion-to-mkfs-jffs2-git-2.patch
> rename to meta/recipes-devtools/mtd/mtd-utils-1.4.4/add-exclusion-to-mkfs-jffs2-git-2.patch
> diff --git a/meta/recipes-devtools/mtd/mtd-utils_1.4.1.bb b/meta/recipes-devtools/mtd/mtd-utils_1.4.4.bb
> similarity index 76%
> rename from meta/recipes-devtools/mtd/mtd-utils_1.4.1.bb
> rename to meta/recipes-devtools/mtd/mtd-utils_1.4.4.bb
> index f2de74d..ac9316d 100644
> --- a/meta/recipes-devtools/mtd/mtd-utils_1.4.1.bb
> +++ b/meta/recipes-devtools/mtd/mtd-utils_1.4.4.bb
> @@ -6,12 +6,15 @@ LICENSE = "GPLv2+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
>                      file://include/common.h;beginline=1;endline=17;md5=ba05b07912a44ea2bf81ce409380049c"
>  
> -SRC_URI = "git://git.infradead.org/mtd-utils.git;protocol=git;tag=3c3674a6e1d3f59554b0ff68ca59be2fd4134e0c \
> -		file://add-exclusion-to-mkfs-jffs2-git-2.patch;patch=1"
> +TAG = "v${PV}"
> +
> +SRC_URI = "git://git.infradead.org/mtd-utils.git;protocol=git;tag=${TAG} \
> +           file://add-exclusion-to-mkfs-jffs2-git-2.patch;patch=1"
> +

This will force network lookups to resolve the tag into a revision. We
need to specify the revision here, a least in OE-Core.

Cheers,

Richard



