Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RLOq1-0003lH-G0
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Nov 2011 01:37:53 +0100
Received: from mail-fx0-f52.google.com ([209.85.161.52])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 01 Nov 2011 17:31:45 -0700
Received: by faan26 with SMTP id n26so7391854faa.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Nov 2011 17:31:43 -0700 (PDT)
Received: by 10.223.1.137 with SMTP id 9mr4239900faf.19.1320193903466;
	Tue, 01 Nov 2011 17:31:43 -0700 (PDT)
Received: from [10.6.18.227] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id y17sm2014273faf.1.2011.11.01.17.31.41
	(version=SSLv3 cipher=OTHER); Tue, 01 Nov 2011 17:31:42 -0700 (PDT)
Message-ID: <4EB08F6B.5080009@intel.com>
Date: Tue, 01 Nov 2011 17:31:39 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1319786807-9015-1-git-send-email-msm@freescale.com>
In-Reply-To: <1319786807-9015-1-git-send-email-msm@freescale.com>
Cc: Matthew McClintock <msm@freescale.com>
Subject: Re: [PATCH] Add new IMAGE_CLASSES variable for classes for image generation
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
X-List-Received-Date: Wed, 02 Nov 2011 00:37:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/28/2011 12:26 AM, Matthew McClintock wrote:
> Allows us to import classes only for images and not to the global
> namespace
>
> Signed-off-by: Matthew McClintock<msm@freescale.com>
> ---
> This is a resend
>
>   meta-yocto/conf/local.conf.sample |    6 ++++++
>   meta/classes/image.bbclass        |    3 ++-
>   2 files changed, 8 insertions(+), 1 deletions(-)
>
> diff --git a/meta-yocto/conf/local.conf.sample b/meta-yocto/conf/local.conf.sample
> index da3f8df..5e59ad4 100644
> --- a/meta-yocto/conf/local.conf.sample
> +++ b/meta-yocto/conf/local.conf.sample
> @@ -163,6 +163,12 @@ EXTRA_IMAGE_FEATURES = "debug-tweaks"
>   # NOTE: mklibs also needs to be explicitly enabled for a given image, see local.conf.extended
>   USER_CLASSES ?= "image-mklibs image-prelink"
>
> +# Additional image generation features
> +#
> +# The following is a list of classes to import to use in the generation of images
> +# currently an example class is image_types_uboot
> +# IMAGE_CLASSES ?= "image_types_uboot"
> +
>   #
>   # Runtime testing of images
>   #
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 05f4331..e932879 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -111,7 +111,8 @@ def get_devtable_list(d):
>           str += " %s" % bb.which(bb.data.getVar('BBPATH', d, 1), devtable)
>       return str
>
> -inherit image_types
> +IMAGE_CLASSES = "image_types"
> +inherit ${IMAGE_CLASSES}
>
Does this really work with =, should it not be ?= here?

Sau!

>   IMAGE_POSTPROCESS_COMMAND ?= ""
>   MACHINE_POSTPROCESS_COMMAND ?= ""



