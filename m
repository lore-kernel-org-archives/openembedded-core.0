Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id EBA1770D44
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Aug 2014 16:56:27 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 15 Aug 2014 09:56:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,871,1400050800"; d="scan'208";a="469165369"
Received: from unknown (HELO [10.255.12.111]) ([10.255.12.111])
	by azsmga001.ch.intel.com with ESMTP; 15 Aug 2014 09:56:01 -0700
Message-ID: <53EE3BA1.6050001@linux.intel.com>
Date: Fri, 15 Aug 2014 09:56:01 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: jackie.huang@windriver.com, openembedded-core@lists.openembedded.org
References: <1406706883-15375-1-git-send-email-jackie.huang@windriver.com>
In-Reply-To: <1406706883-15375-1-git-send-email-jackie.huang@windriver.com>
Subject: Re: [PATCH] ghostscript: add missing dependencies on libgcrypt and libgpg-error
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
X-List-Received-Date: Fri, 15 Aug 2014 16:56:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/30/2014 12:54 AM, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>
> Fix error:
> tmp/sysroots/x86_64-linux/usr/libexec/x86_64-wrs-linux/gcc/x86_64-wrs-linux/4.9.0/ld: cannot find -lgcrypt
> tmp/sysroots/x86_64-linux/usr/libexec/x86_64-wrs-linux/gcc/x86_64-wrs-linux/4.9.0/ld: cannot find -lgpg-error
>
Are these true dependencies or are there optional configurations that 
should be covered with PACKAGECONFIG?  There is a patch to disable gcrypt.

Is this meant to be a daisy patch?

Sau!



> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>   .../ghostscript/ghostscript_9.14.bb                |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.14.bb b/meta/recipes-extended/ghostscript/ghostscript_9.14.bb
> index e14e656..fbec6ce 100644
> --- a/meta/recipes-extended/ghostscript/ghostscript_9.14.bb
> +++ b/meta/recipes-extended/ghostscript/ghostscript_9.14.bb
> @@ -15,7 +15,7 @@ SECTION = "console/utils"
>   LICENSE = "GPLv3"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=aad21ea85123608e6a0a58d54ee23567"
>
> -DEPENDS = "ghostscript-native tiff jpeg fontconfig cups"
> +DEPENDS = "ghostscript-native tiff jpeg fontconfig cups libgcrypt libgpg-error"
>   DEPENDS_class-native = ""
>
>   SRC_URI_BASE = "http://downloads.ghostscript.com/public/ghostscript-${PV}.tar.gz"
>

