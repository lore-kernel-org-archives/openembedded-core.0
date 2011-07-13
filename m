Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QgxaL-0004Jo-SI for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 13:26:34 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6DBMaww028672
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2011 12:22:36 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28092-06 for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2011 12:22:32 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6DBMStc028666
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2011 12:22:29 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <d57c0d831a13e04022b500aad091a03090a01bd1.1310524498.git.josh@linux.intel.com>
References: <cover.1310524498.git.josh@linux.intel.com>
	<d57c0d831a13e04022b500aad091a03090a01bd1.1310524498.git.josh@linux.intel.com>
Date: Wed, 13 Jul 2011 12:22:27 +0100
Message-ID: <1310556147.20015.1105.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/2] classes/image_types: add a variable to list available IMAGE_FSTYPE's
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
X-List-Received-Date: Wed, 13 Jul 2011 11:26:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-07-12 at 19:36 -0700, Joshua Lock wrote:
> This is for use in the Hob GUI to enable the user to change the type of the
> generated image.
> 
> Signed-off-by: Joshua Lock <josh@linux.intel.com>
> ---
>  meta/classes/image_types.bbclass |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> index 89a745c..1108802 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -102,3 +102,5 @@ IMAGE_DEPENDS_cpio.xz = "xz-native"
>  IMAGE_DEPENDS_ubi = "mtd-utils-native"
>  IMAGE_DEPENDS_ubifs = "mtd-utils-native"
>  
> +# This variable is available to request which values are suitable for IMAGE_FSTYPES
> +IMAGE_TYPES = "jffs2 cramfs ext2 ext2.gz ext3 ext3.gz squashfs squashfs-lzma ubi"

Merged to master, thanks.

Richard



