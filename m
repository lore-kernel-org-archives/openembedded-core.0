Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SNsFu-0007VA-Ob
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Apr 2012 22:59:07 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 27 Apr 2012 13:49:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="136286963"
Received: from unknown (HELO [10.255.12.123]) ([10.255.12.123])
	by azsmga001.ch.intel.com with ESMTP; 27 Apr 2012 13:49:25 -0700
Message-ID: <4F9B0655.4010307@linux.intel.com>
Date: Fri, 27 Apr 2012 13:49:25 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CAEsOVNfvxQuWAQCymP4xg4VLSXh4KPTSirLLtrzg_hHh=fuCfQ@mail.gmail.com>
	<1331796192-26217-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1331796192-26217-1-git-send-email-Martin.Jansa@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCHv2] bitbake.conf: use TUNE_PKGARCH instead of TARGET_ARCH in SDK_NAME
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
X-List-Received-Date: Fri, 27 Apr 2012 20:59:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/15/2012 12:23 AM, Martin Jansa wrote:
> * also use weak assignment for SDK_NAME_PREFIX as suggested by khem
> * TUNE_PKGARCH is not 100% right too, because such SDK image usually has few
>    machine specific packages included (e.g. base-files, securetty, opkg configs)
>    but those are not important for SDK users so it's better to have one SDK for
>    whole e.g. armv7a-vfp-neon then 6 SDK for each machine which would work the
>    same.
>    You can see diff between crespo and om-gta04 SDK here:
>    http://build.shr-project.org/shr-core/sdk/oecore-i686-armv7a-vfp-neon-toolchain-efl-crespo-om-gta04.diff
>
> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> ---
>   meta/conf/bitbake.conf |    4 ++--
>   1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 216da75..01fc52a 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -365,8 +365,8 @@ PKGDATA_DIR = "${TMPDIR}/pkgdata/${MULTIMACH_TARGET_SYS}"
>   # SDK variables,
>   ##################################################################
>
> -SDK_NAME_PREFIX = "oecore"
> -SDK_NAME = "${SDK_NAME_PREFIX}-${SDK_ARCH}-${TARGET_ARCH}"
> +SDK_NAME_PREFIX ?= "oecore"
> +SDK_NAME = "${SDK_NAME_PREFIX}-${SDK_ARCH}-${TUNE_PKGARCH}"
>   SDKPATH = "/usr/local/${SDK_NAME_PREFIX}-${SDK_ARCH}"
>   SDKPATHNATIVE = "${SDKPATH}/sysroots/${SDK_SYS}"
>

Merged into OE-Core

Thanks
	Sau!


