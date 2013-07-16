Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 2ED146B215
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2013 16:31:07 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 16 Jul 2013 09:31:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,678,1367996400"; d="scan'208";a="332211258"
Received: from unknown (HELO [10.255.13.97]) ([10.255.13.97])
	by azsmga001.ch.intel.com with ESMTP; 16 Jul 2013 09:31:07 -0700
Message-ID: <51E5754A.3020305@linux.intel.com>
Date: Tue, 16 Jul 2013 09:31:06 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
References: <cover.1373359791.git.emilia.maria.silvia.ciobanu@intel.com>
	<ff3366ce77a506f960c1ccdbee092d01679bcc6d.1373359791.git.emilia.maria.silvia.ciobanu@intel.com>
In-Reply-To: <ff3366ce77a506f960c1ccdbee092d01679bcc6d.1373359791.git.emilia.maria.silvia.ciobanu@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 2/4] lttng-modules: rename recipe and update PV with git token
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
X-List-Received-Date: Tue, 16 Jul 2013 16:31:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/16/2013 08:52 AM, Emilia Ciobanu wrote:
> Git packages should have _git in their recipe name and should include
> git token inside the PV variable.
>
Your not renaming the recipe, your just changing it to be GIT based and 
updating the PV!

A rename would change the name from lttng-modules to something else.

Sau!

> Signed-off-by: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
> ---
>   ...lttng-modules_2.2.0.bb => lttng-modules_git.bb} |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta/recipes-kernel/lttng/{lttng-modules_2.2.0.bb => lttng-modules_git.bb} (97%)
>
> diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.2.0.bb b/meta/recipes-kernel/lttng/lttng-modules_git.bb
> similarity index 97%
> rename from meta/recipes-kernel/lttng/lttng-modules_2.2.0.bb
> rename to meta/recipes-kernel/lttng/lttng-modules_git.bb
> index dd35396..3a92879 100644
> --- a/meta/recipes-kernel/lttng/lttng-modules_2.2.0.bb
> +++ b/meta/recipes-kernel/lttng/lttng-modules_git.bb
> @@ -11,7 +11,7 @@ DEPENDS = "virtual/kernel"
>   inherit module
>
>   SRCREV = "1b26381c19dd2d9fa41f52d8dc13b15b8dd32c7c"
> -PV = "2.2.0"
> +PV = "2.2.0+git${SRCPV}"
>
>   SRC_URI = "git://git.lttng.org/lttng-modules.git;protocol=git \
>              file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch"
>

