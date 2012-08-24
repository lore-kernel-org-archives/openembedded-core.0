Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T4yes-0002Wv-7c
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Aug 2012 20:31:02 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by azsmga101.ch.intel.com with ESMTP; 24 Aug 2012 11:18:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,304,1344236400"; d="scan'208";a="184999150"
Received: from unknown (HELO [10.255.13.21]) ([10.255.13.21])
	by orsmga001.jf.intel.com with ESMTP; 24 Aug 2012 11:18:53 -0700
Message-ID: <5037C58C.3020504@linux.intel.com>
Date: Fri, 24 Aug 2012 11:18:52 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Christopher Larson <kergoth@gmail.com>
References: <1345572600-21149-1-git-send-email-kergoth@gmail.com>
In-Reply-To: <1345572600-21149-1-git-send-email-kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] task-base: pull in the bluez asound module when appropriate
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
X-List-Received-Date: Fri, 24 Aug 2012 18:31:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/21/2012 11:10 AM, Christopher Larson wrote:
> From: Christopher Larson <chris_larson@mentor.com>
>
> If the machine and distro both want alsa, then have task-base-bluetooth pull
> in the libasound-module-bluez package.
>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> ---
>   meta/recipes-core/tasks/task-base.bb |    5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/tasks/task-base.bb b/meta/recipes-core/tasks/task-base.bb
> index 2325dbf..d5dd140 100644
> --- a/meta/recipes-core/tasks/task-base.bb
> +++ b/meta/recipes-core/tasks/task-base.bb
> @@ -2,7 +2,7 @@ DESCRIPTION = "Merge machine and distro options to create a basic machine task/p
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
>                       file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> -PR = "r74"
> +PR = "r75"
>
>   inherit task
>
> @@ -205,8 +205,9 @@ RRECOMMENDS_task-base-pcmcia = "\
>
>   # Provide bluez-utils-compat utils for the time being, the binaries in that package will vanish soon from upstream releases, so beware!
>
> -RDEPENDS_task-base-bluetooth = "\
> +RDEPENDS_task-base-bluetooth = "\
>       bluez4 \
> +    ${@base_contains('COMBINED_FEATURES', 'alsa', 'libasound-module-bluez', '',d)} \
>       "
>
>   RRECOMMENDS_task-base-bluetooth = "\
>

Merged into OE-Core

Thanks
	Sau!



