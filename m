Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RlNYS-0000jf-7t
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jan 2012 17:31:08 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 12 Jan 2012 08:23:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="95749108"
Received: from btwarden-mobl1.amr.corp.intel.com (HELO envy.home)
	([10.7.199.156])
	by orsmga001.jf.intel.com with ESMTP; 12 Jan 2012 08:23:36 -0800
Message-ID: <4F0F08F4.4010505@linux.intel.com>
Date: Thu, 12 Jan 2012 08:23:16 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1326216024.git.josh@linux.intel.com>
	<35eca064e6310d94b517b481beef5f5a5a3f395b.1326216024.git.josh@linux.intel.com>
In-Reply-To: <35eca064e6310d94b517b481beef5f5a5a3f395b.1326216024.git.josh@linux.intel.com>
X-Enigmail-Version: 1.3.4
Subject: Re: [PATCH 3/3] task-base: add alsa-state to task-base-alsa
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
X-List-Received-Date: Thu, 12 Jan 2012 16:31:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 01/10/2012 09:39 AM, Joshua Lock wrote:
> This enables automatic configuration setting and restoration on systems
> with alsa.
> 
> Signed-off-by: Joshua Lock <josh@linux.intel.com>

Acked-by: Darren Hart <dvhart@linux.intel.com>

> ---
>  meta/recipes-core/tasks/task-base.bb |    5 +++--
>  1 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-core/tasks/task-base.bb b/meta/recipes-core/tasks/task-base.bb
> index e0960b5..7460be4 100644
> --- a/meta/recipes-core/tasks/task-base.bb
> +++ b/meta/recipes-core/tasks/task-base.bb
> @@ -2,7 +2,7 @@ DESCRIPTION = "Merge machine and distro options to create a basic machine task/p
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
>                      file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> -PR = "r72"
> +PR = "r73"
>  
>  inherit task
>  
> @@ -183,7 +183,8 @@ RRECOMMENDS_task-base-vfat = "\
>  
>  RDEPENDS_task-base-alsa = "\
>      alsa-utils-alsactl \
> -    alsa-utils-alsamixer"
> +    alsa-utils-alsamixer \
> +    alsa-state"
>  
>  RRECOMMENDS_task-base-alsa = "\
>      kernel-module-snd-mixer-oss \

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


