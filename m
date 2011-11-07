Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RNPuI-0007sf-OS for openembedded-core@lists.openembedded.org;
	Mon, 07 Nov 2011 15:10:38 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA7E4LDd019800
	for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Nov 2011 14:04:21 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19698-01 for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Nov 2011 14:04:17 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA7E4BWt019794
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Nov 2011 14:04:12 GMT
Message-ID: <1320674653.23708.11.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 07 Nov 2011 14:04:13 +0000
In-Reply-To: <8e793bb4092c80baf441a33f348852bfbd4a4420.1320513631.git.sgw@linux.intel.com>
References: <cover.1320513631.git.sgw@linux.intel.com>
	<8e793bb4092c80baf441a33f348852bfbd4a4420.1320513631.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 14/28] Add new IMAGE_CLASSES variable for classes for image generation
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
X-List-Received-Date: Mon, 07 Nov 2011 14:10:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-11-05 at 10:22 -0700, Saul Wold wrote:
> From: Matthew McClintock <msm@freescale.com>
> 
> Allows us to import classes only for images and not to the global
> namespace
> 
> Signed-off-by: Matthew McClintock <msm@freescale.com>
> ---
>  meta/classes/image.bbclass  |    3 ++-
>  meta/conf/local.conf.sample |    6 ++++++
>  2 files changed, 8 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 05f4331..a2770a4 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -111,7 +111,8 @@ def get_devtable_list(d):
>          str += " %s" % bb.which(bb.data.getVar('BBPATH', d, 1), devtable)
>      return str
>  
> -inherit image_types
> +IMAGE_CLASSES ?= "image_types"
> +inherit ${IMAGE_CLASSES}
>  
>  IMAGE_POSTPROCESS_COMMAND ?= ""
>  MACHINE_POSTPROCESS_COMMAND ?= ""
> diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
> index 73ab9f8..aa546c7 100644
> --- a/meta/conf/local.conf.sample
> +++ b/meta/conf/local.conf.sample
> @@ -141,6 +141,12 @@ EXTRA_IMAGE_FEATURES = "debug-tweaks"
>  # NOTE: mklibs also needs to be explicitly enabled for a given image, see local.conf.extended
>  USER_CLASSES ?= "image-mklibs image-prelink"
>  
> +# Additional image generation features
> +#
> +# The following is a list of classes to import to use in the generation of images
> +# currently an example class is image_types_uboot
> +# IMAGE_CLASSES = " image_types_uboot"
> +

Most initial new users don't need to see this. Can we place this into
local.conf.sample.extended please?

Cheers,

Richard



