Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RzvCV-00033I-Hh
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Feb 2012 20:16:35 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 21 Feb 2012 11:08:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="119774881"
Received: from unknown (HELO [10.255.15.72]) ([10.255.15.72])
	by fmsmga001.fm.intel.com with ESMTP; 21 Feb 2012 11:08:15 -0800
Message-ID: <4F43EB9F.9030300@linux.intel.com>
Date: Tue, 21 Feb 2012 11:08:15 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0) Gecko/20120131 Thunderbird/10.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4F35945D.7020900@opendreambox.org>
In-Reply-To: <4F35945D.7020900@opendreambox.org>
Subject: Re: [PATCH] consolekit: depend on libx11
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
X-List-Received-Date: Tue, 21 Feb 2012 19:16:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/10/2012 02:04 PM, Andreas Oberritter wrote:
> * Fixes the following error at configure time:
>
> |checking for TOOLS... no
> |configure: error: Package requirements (x11>= 1.0.0
> |  glib-2.0>= 2.14
> |) were not met:
> |
> |No package 'x11' found
>
> Signed-off-by: Andreas Oberritter<obi@opendreambox.org>
> ---
> * Note that I didn't build test this, because I'm building
>    without x11. I just looked up the package of x11.pc, which
>    at least in Ubuntu is libx11.
>
>   .../recipes-support/consolekit/consolekit_0.4.5.bb |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-support/consolekit/consolekit_0.4.5.bb b/meta/recipes-support/consolekit/consolekit_0.4.5.bb
> index 3ded6df..3a4b04f 100644
> --- a/meta/recipes-support/consolekit/consolekit_0.4.5.bb
> +++ b/meta/recipes-support/consolekit/consolekit_0.4.5.bb
> @@ -13,7 +13,7 @@ POLKIT_libc-uclibc = ""
>   POLKITCONF = ""
>   POLKITCONF_libc-uclibc = "--disable-policykit"
>
> -DEPENDS = "glib-2.0 dbus ${POLKIT} ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
> +DEPENDS = "glib-2.0 dbus ${POLKIT} ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)} virtual/libx11"
>   RDEPENDS_${PN} += "base-files"
>
>   inherit gnome

Merged into OE-core

Thanks
	Sau!


