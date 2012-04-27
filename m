Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SNsi3-0000Fq-I3
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Apr 2012 23:28:11 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 27 Apr 2012 14:18:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="93984329"
Received: from unknown (HELO [10.255.12.123]) ([10.255.12.123])
	by AZSMGA002.ch.intel.com with ESMTP; 27 Apr 2012 14:18:31 -0700
Message-ID: <4F9B0D27.40705@linux.intel.com>
Date: Fri, 27 Apr 2012 14:18:31 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1334830839-25853-1-git-send-email-ken.werner@linaro.org>
In-Reply-To: <1334830839-25853-1-git-send-email-ken.werner@linaro.org>
Cc: Ken Werner <ken.werner@linaro.org>
Subject: Re: [PATCH] bdwgc: Set ARM_INSTRUCTION_SET to "arm"
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
X-List-Received-Date: Fri, 27 Apr 2012 21:28:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/19/2012 03:20 AM, Ken Werner wrote:
> The bdwgc recipe uses a version of libatomic that fails when building in Thumb
> mode. This has been fixed upstream already. The
> pulseaudio/libatomics-ops_1.2.bb has the same issue and sets the
> ARM_INSTRUCTION_SET to "arm" (probably until a new version gets pulled in).
> This patch applies the same workaround to the bdwgc/bdwgc_20110107.bb recipe.
>
> Signed-off-by: Ken Werner<ken.werner@linaro.org>
> ---
>   meta/recipes-support/bdwgc/bdwgc_20110107.bb |    2 ++
>   1 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/meta/recipes-support/bdwgc/bdwgc_20110107.bb b/meta/recipes-support/bdwgc/bdwgc_20110107.bb
> index 327e59b..bc7b613 100644
> --- a/meta/recipes-support/bdwgc/bdwgc_20110107.bb
> +++ b/meta/recipes-support/bdwgc/bdwgc_20110107.bb
> @@ -33,5 +33,7 @@ PR = "r1"
>
>   S = "${WORKDIR}/bdwgc"
>
> +ARM_INSTRUCTION_SET = "arm"
> +
>   inherit autotools
>   BBCLASSEXTEND = "native nativesdk"

Merged into OE-Core

Thanks
	Sau!


