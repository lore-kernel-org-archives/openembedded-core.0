Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QmEB1-0005e6-Np
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 02:10:11 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 27 Jul 2011 17:05:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,279,1309762800"; d="scan'208";a="32873406"
Received: from unknown (HELO [10.255.14.61]) ([10.255.14.61])
	by orsmga001.jf.intel.com with ESMTP; 27 Jul 2011 17:05:55 -0700
Message-ID: <4E30A7E3.2010006@linux.intel.com>
Date: Wed, 27 Jul 2011 17:05:55 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1311581339-6009-1-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1311581339-6009-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] dropbear: don't override DISTRO_TYPE if it is	already set
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
X-List-Received-Date: Thu, 28 Jul 2011 00:10:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/25/2011 01:08 AM, Koen Kooi wrote:
> The long term solution is to remove the IMAGE_FEATURE check since images are not allowed to influence recipe compile options.
>
> Signed-off-by: Koen Kooi<koen@dominion.thruhere.net>
> ---
>   meta/recipes-core/dropbear/dropbear.inc     |    2 +-
>   meta/recipes-core/dropbear/dropbear_0.52.bb |    2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
> index 1b51e1a..526a5a0 100644
> --- a/meta/recipes-core/dropbear/dropbear.inc
> +++ b/meta/recipes-core/dropbear/dropbear.inc
> @@ -29,7 +29,7 @@ SBINCOMMANDS = "dropbear dropbearkey dropbearconvert"
>   BINCOMMANDS = "dbclient ssh scp"
>   EXTRA_OEMAKE = 'MULTI=1 SCPPROGRESS=1 PROGRAMS="${SBINCOMMANDS} ${BINCOMMANDS}"'
>
> -DISTRO_TYPE = "${@base_contains("IMAGE_FEATURES", "debug-tweaks", "debug", "",d)}"
> +DISTRO_TYPE ?= "${@base_contains("IMAGE_FEATURES", "debug-tweaks", "debug", "",d)}"
>
>   do_debug_patch() {
>   	if [ "${DISTRO_TYPE}" = "debug" ]; then
> diff --git a/meta/recipes-core/dropbear/dropbear_0.52.bb b/meta/recipes-core/dropbear/dropbear_0.52.bb
> index 78d6cf1..4013c65 100644
> --- a/meta/recipes-core/dropbear/dropbear_0.52.bb
> +++ b/meta/recipes-core/dropbear/dropbear_0.52.bb
> @@ -3,4 +3,4 @@ require dropbear.inc
>   SRC_URI[md5sum] = "1c69ec674481d7745452f68f2ea5597e"
>   SRC_URI[sha256sum] = "e3a2ca49ed85ce562240c0ac06e2f72826d7e52a83e80d91c067c8b97bf5c108"
>
> -PR = "r2"
> +PR = "r3"

Merged into OE-Core

Thanks
	Sau!


