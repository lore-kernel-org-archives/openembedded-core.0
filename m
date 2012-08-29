Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T6qio-0005S1-9t
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Aug 2012 00:26:50 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 29 Aug 2012 15:14:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,335,1344236400"; d="scan'208";a="215494329"
Received: from unknown (HELO [10.255.13.94]) ([10.255.13.94])
	by fmsmga002.fm.intel.com with ESMTP; 29 Aug 2012 15:14:33 -0700
Message-ID: <503E9449.90803@linux.intel.com>
Date: Wed, 29 Aug 2012 15:14:33 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>
References: <1346242405-25027-1-git-send-email-ross.burton@intel.com>
In-Reply-To: <1346242405-25027-1-git-send-email-ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gail: remove
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Aug 2012 22:26:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/29/2012 05:13 AM, Ross Burton wrote:
> This functionality was integrated into GTK+ 2.13 and we've dropped support for
> anything before that.
>
> [ YOCTO #2954 ]
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/recipes-gnome/gnome/gail_1.20.2.bb |   19 -------------------
>   1 file changed, 19 deletions(-)
>   delete mode 100644 meta/recipes-gnome/gnome/gail_1.20.2.bb
>
> diff --git a/meta/recipes-gnome/gnome/gail_1.20.2.bb b/meta/recipes-gnome/gnome/gail_1.20.2.bb
> deleted file mode 100644
> index df6cd03..0000000
> --- a/meta/recipes-gnome/gnome/gail_1.20.2.bb
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -DESCRIPTION = "GNOME Accessibility Implementation Library"
> -SECTION = "x11/libs"
> -
> -DEPENDS = "gtk+"
> -PROVIDES = "virtual/gail"
> -
> -LICENSE = "LGPLv2"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
> -
> -PR = "r2"
> -
> -inherit gnome gtk-doc
> -
> -SRC_URI[archive.md5sum] = "e805806f897cf6040e1f3e9c0cd2151b"
> -SRC_URI[archive.sha256sum] = "5025b13a4f3b960c8ab7c3e5c7d6d86082e2e1af6ee18e61e37fd4ce3dcc0153"
> -
> -FILES_${PN} += "${libdir}/gtk-2.0/modules/*.so"
> -FILES_${PN}-dbg += "${libdir}/gtk-2.0/modules/.debug"
> -
>
Merged into OE-Core

Thanks
	Sau!



