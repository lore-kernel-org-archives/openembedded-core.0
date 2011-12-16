Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rbc3l-0006jd-CA
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Dec 2011 18:59:06 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 Dec 2011 09:52:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="103038438"
Received: from unknown (HELO [10.255.12.77]) ([10.255.12.77])
	by fmsmga002.fm.intel.com with ESMTP; 16 Dec 2011 09:52:05 -0800
Message-ID: <4EEB8544.3030901@linux.intel.com>
Date: Fri, 16 Dec 2011 09:52:04 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1324021777.git.edwin.zhai@intel.com>
	<684530c1b7e5aab3e0f3f6f8bbe64b5fb839eff3.1324021777.git.edwin.zhai@intel.com>
In-Reply-To: <684530c1b7e5aab3e0f3f6f8bbe64b5fb839eff3.1324021777.git.edwin.zhai@intel.com>
Subject: Re: [PATCH 1/2] xserver-nodm-init: Fix xuser creation
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
X-List-Received-Date: Fri, 16 Dec 2011 17:59:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/15/2011 11:53 PM, edwin.zhai@intel.com wrote:
> From: Zhai Edwin<edwin.zhai@intel.com>
>
> Rootless X start fail as xuser has no home and shell. This patch fix it.
>
> Signed-off-by: Zhai Edwin<edwin.zhai@intel.com>
> ---
>   .../x11-common/xserver-nodm-init.bb                |    6 +++---
>   1 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init.bb b/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
> index dbc1c42..99ef72e 100644
> --- a/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
> +++ b/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
> @@ -2,7 +2,7 @@ DESCRIPTION = "Simple Xserver Init Script (no dm)"
>   LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
>   SECTION = "x11"
> -PR = "r28"
> +PR = "r29"
>   RDEPENDS_${PN} = "sudo"
>
>   SRC_URI = "file://xserver-nodm \
> @@ -31,7 +31,7 @@ INITSCRIPT_PARAMS = "start 9 5 2 . stop 20 0 1 6 ."
>   # Use fixed Xusername of xuser for now, this will need to be
>   # fixed if the Xusername changes from xuser
>   USERADD_PACKAGES = "${PN}"
> -USERADD_PARAM_${PN} = "--system --no-create-home \
> -                       --shell /bin/false --groups video,tty,audio \
> +USERADD_PARAM_${PN} = "--create-home \
> +                       --groups video,tty,audio \
>                          --user-group xuser"
>
I think that this should still be a --system account, I missed that when 
I first looked at this patch.

Sau!


