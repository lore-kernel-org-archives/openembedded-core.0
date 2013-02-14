Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1U65c0-00024T-Bu
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Feb 2013 21:41:02 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 14 Feb 2013 12:23:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,666,1355126400"; d="scan'208";a="285891099"
Received: from unknown (HELO [10.255.12.50]) ([10.255.12.50])
	by orsmga002.jf.intel.com with ESMTP; 14 Feb 2013 12:24:49 -0800
Message-ID: <511D4811.2080401@linux.intel.com>
Date: Thu, 14 Feb 2013 12:24:49 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Joe Slater <jslater@windriver.com>
References: <1360861770-30010-1-git-send-email-jslater@windriver.com>
In-Reply-To: <1360861770-30010-1-git-send-email-jslater@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] acpid: modify CFLAGS
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
X-List-Received-Date: Thu, 14 Feb 2013 20:41:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/14/2013 09:09 AM, Joe Slater wrote:
> Override the hard-coded CFLAGS used in Makefile
> to reference our CFLAGS.
>

Can you be clearer about this?

I just checked the output of the compile log and these flags are set 
correctly. I also looked at the make -n output via a devshell.

This seems to be hardcoding the CFLAGS into this recipe.

Sounds like something else is going on.

Thanks
	Sau!


> Upstream-Status:  Pending
>
> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
>   meta/recipes-bsp/acpid/acpid.inc |    4 +++-
>   1 files changed, 3 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-bsp/acpid/acpid.inc b/meta/recipes-bsp/acpid/acpid.inc
> index 3c0219f..1ffe6ff 100644
> --- a/meta/recipes-bsp/acpid/acpid.inc
> +++ b/meta/recipes-bsp/acpid/acpid.inc
> @@ -13,7 +13,9 @@ inherit update-rc.d
>   INITSCRIPT_NAME = "acpid"
>   INITSCRIPT_PARAMS = "defaults"
>
> -EXTRA_OEMAKE = ""
> +# Makefile ignores our CFLAGS, so override it.
> +#
> +EXTRA_OEMAKE = "CFLAGS='-W -Wall -Werror -Wundef -Wshadow ${CFLAGS} $(DEFS)'"
>
>   do_compile () {
>   	oe_runmake 'CC=${CC} -D_GNU_SOURCE' 'CROSS=${HOST_PREFIX}'
>


