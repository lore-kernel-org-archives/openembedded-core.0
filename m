Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SFTbL-0003sG-H7
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Apr 2012 19:02:31 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 04 Apr 2012 09:53:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="125306359"
Received: from unknown (HELO [10.255.12.141]) ([10.255.12.141])
	by orsmga001.jf.intel.com with ESMTP; 04 Apr 2012 09:53:19 -0700
Message-ID: <4F7C7C7E.6040809@linux.intel.com>
Date: Wed, 04 Apr 2012 09:53:18 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <alpine.DEB.2.02.1203291840170.25072@oneiric>
In-Reply-To: <alpine.DEB.2.02.1203291840170.25072@oneiric>
Subject: Re: [PATCH] Remove redundant reference to "task-self-hosted" from self-hosted-image.bb
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
X-List-Received-Date: Wed, 04 Apr 2012 17:02:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/29/2012 03:42 PM, Robert P. J. Day wrote:
>
> This recipe already includes "task-self-hosted" in the IMAGE_INSTALL
> line:
>
> IMAGE_INSTALL = "task-core-boot task-core-apps-console task-core-ssh-openssh task-self-hosted"
>
> so there's no apparent need to include it again further down.
>
> Signed-off-by: Robert P. J. Day<rpjday@crashcourse.ca>
>
> ---
>
> diff --git a/meta/recipes-core/images/self-hosted-image.bb b/meta/recipes-core/images/self-hosted-image.bb
> index 5aa670d..f1f3e57 100644
> --- a/meta/recipes-core/images/self-hosted-image.bb
> +++ b/meta/recipes-core/images/self-hosted-image.bb
> @@ -6,10 +6,6 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
>
>   PR = "r6"
>
> -CORE_IMAGE_EXTRA_INSTALL = "\
> -    task-self-hosted \
> -    "
> -
>   IMAGE_FEATURES += "x11-mini package-management"
>
>   # Ensure there's enough space to do a core-image-minimal build, with rm_work enabled
>

Merged into OE-Core

Thanks
	Sau!


