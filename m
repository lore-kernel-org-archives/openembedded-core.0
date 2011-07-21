Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1Qjxga-00046A-AE
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 20:09:24 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 21 Jul 2011 11:05:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,242,1309762800"; d="scan'208";a="28639536"
Received: from doubt.jf.intel.com (HELO [10.7.199.53]) ([10.7.199.53])
	by orsmga002.jf.intel.com with ESMTP; 21 Jul 2011 11:04:56 -0700
Message-ID: <4E286A62.1060207@linux.intel.com>
Date: Thu, 21 Jul 2011 11:05:22 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@windriver.com>
References: <cover.1311267679.git.bruce.ashfield@windriver.com>
	<65d8b50e5c377f6f1c2f4943a0f41d66cf6b9831.1311267679.git.bruce.ashfield@windriver.com>
In-Reply-To: <65d8b50e5c377f6f1c2f4943a0f41d66cf6b9831.1311267679.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: Re: [PATCH 3/4] linux-yocto: update LICENSE to GPLv2
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
X-List-Received-Date: Thu, 21 Jul 2011 18:09:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Ahh, /me deletes this from his list of things he isn't getting to...

On 07/21/2011 10:16 AM, Bruce Ashfield wrote:
> As reported by Koen Kooi, the LICENSE for linux-yocto can be tightened
> up to specifiy the particular version of the GPL.
> 
> cc: Koen Kooi <koen@dominion.thruhere.net>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>

Acked-by: Darren Hart <dvhart@linux.intel.com>


> ---
>  meta/recipes-kernel/linux/linux-yocto.inc |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
> index c304d00..595795b 100644
> --- a/meta/recipes-kernel/linux/linux-yocto.inc
> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "Yocto Kernel"
>  SECTION = "kernel"
> -LICENSE = "GPL"
> +LICENSE = "GPLv2"
>  
>  LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
>  

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


