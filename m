Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SuTm2-0008PP-9h
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 21:31:02 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 26 Jul 2012 12:19:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="173619391"
Received: from unknown (HELO [10.255.12.157]) ([10.255.12.157])
	by azsmga001.ch.intel.com with ESMTP; 26 Jul 2012 12:19:30 -0700
Message-ID: <50119841.4080700@linux.intel.com>
Date: Thu, 26 Jul 2012 12:19:29 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <alpine.DEB.2.02.1207240636450.21023@oneiric>
In-Reply-To: <alpine.DEB.2.02.1207240636450.21023@oneiric>
Subject: Re: xinit_1.3.2: Remove broken, superfluous 'FILES_${PN} += "${libdir}X11/xinit"'
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
X-List-Received-Date: Thu, 26 Jul 2012 19:31:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/24/2012 03:39 AM, Robert P. J. Day wrote:
>
> Besides being clearly broken, that line is unnecessary as that file is
> already being picked up from this line in xorg-app-common.inc:
>
> FILES_${PN} += " ${libdir}/X11/${BPN} ${datadir}/X11/app-defaults/"
>
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> ---
>
> diff --git a/meta/recipes-graphics/xorg-app/xinit_1.3.2.bb b/meta/recipes-graphics/xorg-app/xinit_1.3.2.bb
> index 2008e79..5a97c3b 100644
> --- a/meta/recipes-graphics/xorg-app/xinit_1.3.2.bb
> +++ b/meta/recipes-graphics/xorg-app/xinit_1.3.2.bb
> @@ -19,5 +19,3 @@ SRC_URI[sha256sum] = "a1867fdaa83f68750b12ba4305c3c62f5992d0f52cfeb98e96c27a8e69
>   EXTRA_OECONF = "ac_cv_path_MCOOKIE=${bindir}/mcookie"
>
>   RDEPENDS_${PN} += "util-linux-mcookie"
> -
> -FILES_${PN} += "${libdir}X11/xinit"
>
Nice catch!

Merged into OE-Core

Thanks
	Sau!


