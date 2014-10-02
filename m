Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 07633715EB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Oct 2014 15:48:44 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 02 Oct 2014 08:48:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,639,1406617200"; d="scan'208";a="608773905"
Received: from gmacartn-mobl.ger.corp.intel.com (HELO [10.255.13.44])
	([10.255.13.44])
	by fmsmga002.fm.intel.com with ESMTP; 02 Oct 2014 08:48:45 -0700
Message-ID: <542D73DC.9050305@linux.intel.com>
Date: Thu, 02 Oct 2014 08:48:44 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.7.0
MIME-Version: 1.0
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>, 
	openembedded-core@lists.openembedded.org
References: <1412263157-2891-1-git-send-email-alejandro.hernandez@linux.intel.com>
In-Reply-To: <1412263157-2891-1-git-send-email-alejandro.hernandez@linux.intel.com>
Subject: Re: [PATCH] linux-yocto: Added bc-native as DEPENDS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Oct 2014 15:48:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Alejandro,

Sorry this was my bad, I was not clear on your question to me earlier, 
since this was for the kernel.bbclass it should be

kernel: ...

So please submit corrected v2

Sorry
	Sau!

On 10/02/2014 08:19 AM, Alejandro Hernandez wrote:
> The makefile checks for bc during for compilation
>
> [YOCTO #6781]
>
> Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
> ---
>   meta/classes/kernel.bbclass | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 78b33ce..0782923 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -1,7 +1,7 @@
>   inherit linux-kernel-base kernel-module-split
>
>   PROVIDES += "virtual/kernel"
> -DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native depmodwrapper-cross"
> +DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native depmodwrapper-cross bc-native"
>
>   # we include gcc above, we dont need virtual/libc
>   INHIBIT_DEFAULT_DEPS = "1"
>

