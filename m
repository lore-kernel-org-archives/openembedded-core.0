Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9E73865E1A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Oct 2014 15:40:31 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 02 Oct 2014 08:40:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,639,1406617200"; d="scan'208";a="599863793"
Received: from cpariyar-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.78])
	by fmsmga001.fm.intel.com with ESMTP; 02 Oct 2014 08:40:28 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Date: Thu, 02 Oct 2014 16:40:27 +0100
Message-ID: <2767518.EG7s4Mb8Cx@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.1 (Linux/3.16.3-200.fc20.x86_64; KDE/4.14.1; x86_64; ; )
In-Reply-To: <1412263157-2891-1-git-send-email-alejandro.hernandez@linux.intel.com>
References: <1412263157-2891-1-git-send-email-alejandro.hernandez@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Thu, 02 Oct 2014 15:40:35 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Alejandro,

On Thursday 02 October 2014 10:19:17 Alejandro Hernandez wrote:
> The makefile checks for bc during for compilation
> 
> [YOCTO #6781]
> 
> Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
> ---
>  meta/classes/kernel.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 78b33ce..0782923 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -1,7 +1,7 @@
>  inherit linux-kernel-base kernel-module-split
> 
>  PROVIDES += "virtual/kernel"
> -DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc
> kmod-native depmodwrapper-cross" +DEPENDS +=
> "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native
> depmodwrapper-cross bc-native"
> 
>  # we include gcc above, we dont need virtual/libc
>  INHIBIT_DEFAULT_DEPS = "1"

Since this is a change to kernel.bbclass, the shortlog should start with 
kernel.bbclass (or classes/kernel, whichever you prefer) rather than 
linux-yocto.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

