Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S8Dfu-00084e-HJ
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Mar 2012 17:37:14 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 15 Mar 2012 09:28:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="129392425"
Received: from unknown (HELO [10.255.15.152]) ([10.255.15.152])
	by fmsmga001.fm.intel.com with ESMTP; 15 Mar 2012 09:28:16 -0700
Message-ID: <4F6218A0.2000903@linux.intel.com>
Date: Thu, 15 Mar 2012 09:28:16 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1331773718-14372-1-git-send-email-obi@opendreambox.org>
In-Reply-To: <1331773718-14372-1-git-send-email-obi@opendreambox.org>
Subject: Re: [PATCH] parted: don't pass --disable-Werror to configure
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
X-List-Received-Date: Thu, 15 Mar 2012 16:37:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/14/2012 06:08 PM, Andreas Oberritter wrote:
> * Fixes the following warning:
>
> | configure: WARNING: unrecognized options: --disable-Werror
>
> Signed-off-by: Andreas Oberritter<obi@opendreambox.org>
> ---
> * No PR bump required because it doesn't change anything
>    apart from the log message mentioned above.
>
>   meta/recipes-extended/parted/parted_3.0.bb |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-extended/parted/parted_3.0.bb b/meta/recipes-extended/parted/parted_3.0.bb
> index 29daf01..2fba6d1 100644
> --- a/meta/recipes-extended/parted/parted_3.0.bb
> +++ b/meta/recipes-extended/parted/parted_3.0.bb
> @@ -13,7 +13,7 @@ SRC_URI = "${GNU_MIRROR}/parted/parted-${PV}.tar.gz \
>   SRC_URI[md5sum] = "a94e84a9b9944715c4453f82ccc639bf"
>   SRC_URI[sha256sum] = "8886eece015202f6bd5ce8414f4b68838452cef509f2e3389ad56128219837b7"
>
> -EXTRA_OECONF = "--disable-Werror --disable-device-mapper"
> +EXTRA_OECONF = "--disable-device-mapper"
>
>   inherit autotools pkgconfig gettext
>

Merged into OE-Core

Thanks
	Sau!



