Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Suiqk-0002eu-3P for openembedded-core@lists.openembedded.org;
	Fri, 27 Jul 2012 13:36:54 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6RBPMIM005627
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2012 12:25:22 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04762-04 for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2012 12:25:18 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6RBP6L8005616
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2012 12:25:12 +0100
Message-ID: <1343388304.9574.118.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 27 Jul 2012 12:25:04 +0100
In-Reply-To: <alpine.DEB.2.02.1207261904590.18831@oneiric>
References: <alpine.DEB.2.02.1207261904590.18831@oneiric>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: image.bbclass: Update outdated reference to "export IMAGE_BASENAME"
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
X-List-Received-Date: Fri, 27 Jul 2012 11:36:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-07-26 at 19:06 -0400, Robert P. J. Day wrote:
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> 
> ---
> 
>   does this look about right?
> 
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 1799bf1..b0b476f 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -58,10 +58,9 @@ PACKAGE_GROUP_dev-pkgs[optional] = "1"
>  PACKAGE_GROUP_doc-pkgs = "${@' '.join('%s-doc' % pkg for pkg in normal_pkgs_to_install(d))}"
>  PACKAGE_GROUP_doc-pkgs[optional] = "1"
> 
> -# "export IMAGE_BASENAME" not supported at this time
>  IMAGE_INSTALL ?= ""
>  IMAGE_INSTALL[type] = "list"
> -IMAGE_BASENAME[export] = "1"
> +export IMAGE_BASENAME
>  export PACKAGE_INSTALL ?= "${IMAGE_INSTALL} ${ROOTFS_BOOTSTRAP_INSTALL} ${FEATURE_INSTALL}"
>  PACKAGE_INSTALL_ATTEMPTONLY ?= "${FEATURE_INSTALL_OPTIONAL}"
> 
> diff --git a/meta/recipes-core/images/core-image-minimal-initramfs.bb b/meta/recipes-core/images/core-image-minimal-initramfs.bb
> index 7f6826c..ddc2142 100644
> --- a/meta/recipes-core/images/core-image-minimal-initramfs.bb
> +++ b/meta/recipes-core/images/core-image-minimal-initramfs.bb
> @@ -8,7 +8,6 @@ IMAGE_INSTALL = "initramfs-live-boot initramfs-live-install initramfs-live-insta
>  # Do not pollute the initrd image with rootfs features
>  IMAGE_FEATURES = ""
> 
> -export IMAGE_BASENAME = "core-image-minimal-initramfs"
>  IMAGE_LINGUAS = ""

I meant just to remove the export flag here, so:

-export IMAGE_BASENAME = "core-image-minimal-initramfs"
+IMAGE_BASENAME = "core-image-minimal-initramfs"

Cheers,

Richard



