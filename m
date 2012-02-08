Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Ruyy2-0005YP-Us
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Feb 2012 05:17:15 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 07 Feb 2012 20:09:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="122326139"
Received: from unknown (HELO [10.255.14.116]) ([10.255.14.116])
	by fmsmga002.fm.intel.com with ESMTP; 07 Feb 2012 20:09:10 -0800
Message-ID: <4F31F566.5020303@linux.intel.com>
Date: Tue, 07 Feb 2012 20:09:10 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1328544327-16670-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1328544327-16670-1-git-send-email-raj.khem@gmail.com>
Subject: Re: [PATCH] xorg-apps: Bump PR to accomodate meta-oe recipe deletion
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
X-List-Received-Date: Wed, 08 Feb 2012 04:17:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/06/2012 08:05 AM, Khem Raj wrote:
> rgb in meta-oe has been removed in favour of
> oe-core which requires a PR bump so feeds
> keep working
>
> Signed-off-by: Khem Raj<raj.khem@gmail.com>
> ---
>   meta/recipes-graphics/xorg-app/xorg-app-common.inc |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-graphics/xorg-app/xorg-app-common.inc b/meta/recipes-graphics/xorg-app/xorg-app-common.inc
> index 86e5c23..890648b 100644
> --- a/meta/recipes-graphics/xorg-app/xorg-app-common.inc
> +++ b/meta/recipes-graphics/xorg-app/xorg-app-common.inc
> @@ -5,7 +5,7 @@ SECTION = "x11/apps"
>   LICENSE = "MIT-X"
>   DEPENDS = "util-macros-native virtual/libx11"
>
> -INC_PR = "r5"
> +INC_PR = "r7"
>
>   SRC_URI = "${XORG_MIRROR}/individual/app/${BPN}-${PV}.tar.bz2"
>

Merged into OE-core

Thanks
	Sau!


