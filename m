Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TNylI-0004nP-6d
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Oct 2012 06:28:12 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 15 Oct 2012 21:14:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,593,1344236400"; d="scan'208";a="235517262"
Received: from unknown (HELO [10.255.13.226]) ([10.255.13.226])
	by fmsmga002.fm.intel.com with ESMTP; 15 Oct 2012 21:14:54 -0700
Message-ID: <507CDF3E.5070808@linux.intel.com>
Date: Mon, 15 Oct 2012 21:14:54 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
CC: openembedded-core@lists.openembedded.org
References: <1350339551-8820-1-git-send-email-sgw@linux.intel.com>
	<1350339551-8820-2-git-send-email-sgw@linux.intel.com>
In-Reply-To: <1350339551-8820-2-git-send-email-sgw@linux.intel.com>
Subject: Re: [PATCH 2/2] sato-icon-theme: update mapping program location
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
X-List-Received-Date: Tue, 16 Oct 2012 04:28:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/15/2012 03:19 PM, Saul Wold wrote:
> When we changed the /usr/libexec default to be
> /usr/lib/<pn>, the icon name mapping needed to
> be updated also.
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>   .../sato-icon-theme/sato-icon-theme.inc            |    2 +-
>   .../sato-icon-theme/sato-icon-theme_0.4.1.bb       |    2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc b/meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc
> index 0bd4814..b07d8c3 100644
> --- a/meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc
> +++ b/meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc
> @@ -12,7 +12,7 @@ inherit autotools pkgconfig allarch gtk-icon-cache
>
>   FILES_${PN} += "${datadir}"
>
> -EXTRA_OECONF += "--with-iconmap=${STAGING_LIBDIR_NATIVE}/../libexec/icon-name-mapping"
> +EXTRA_OECONF += "--with-iconmap=${STAGING_LIBEXECDIR_NATIVE}/icon-name-mapping"
>
This is still wrong apparently since icon-naming-mapping is not placed 
in sato-icon-theme, but in /usr/lib/icon-naming-utils.  So my original 
patch should be correct.

Sau!


>   # Explictly setting "Sato" as the default icon theme to avoid flickering from
>   # the desktop and settings daemon racing.  This shouldn't be done here but in the sato image
> diff --git a/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb b/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb
> index 6405359..cd34cac 100644
> --- a/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb
> +++ b/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb
> @@ -2,7 +2,7 @@ require sato-icon-theme.inc
>
>   DEPENDS += "icon-naming-utils-native"
>
> -PR = "r4"
> +PR = "r5"
>
>   SRC_URI = "http://pokylinux.org/releases/sato/${BPN}-${PV}.tar.gz \
>              file://iconpath-option.patch \
>


