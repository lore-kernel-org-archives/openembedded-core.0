Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B44C56AFB5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Dec 2013 17:23:42 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 26 Dec 2013 09:23:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,555,1384329600"; d="scan'208";a="456082849"
Received: from unknown (HELO [10.255.15.249]) ([10.255.15.249])
	by fmsmga002.fm.intel.com with ESMTP; 26 Dec 2013 09:23:43 -0800
Message-ID: <52BC661F.5010403@linux.intel.com>
Date: Thu, 26 Dec 2013 09:23:43 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Qi.Chen@windriver.com, openembedded-core@lists.openembedded.org
References: <cover.1387959755.git.Qi.Chen@windriver.com>
	<d5166a224cee86b6092e82c1e564162a22668710.1387959755.git.Qi.Chen@windriver.com>
In-Reply-To: <d5166a224cee86b6092e82c1e564162a22668710.1387959755.git.Qi.Chen@windriver.com>
Subject: Re: [PATCH 2/2] packagegroup-core-boot: make initscripts-functions a basic element of RDEPENDS
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
X-List-Received-Date: Thu, 26 Dec 2013 17:23:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/25/2013 12:36 AM, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> Unlike the initscripts package which is useful in SysV systems but
> not so useful in systemd systems, the initscripts-functions package
> is useful for both.
>
> For the reason stated above, this patch adds initscripts-funtions to
> the RDEPENDS of packagegroup-core-boot.
>
Why not add the RDEPENDS on the initscript-functions to the appropriate 
recipes, such as distcc or others that require the contents of functions?

I understand the general value of having it installed, but if 
"functions" is only required for some recipes, then let's not add it in 
again if unneeded.

Sau!

> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   .../packagegroups/packagegroup-core-boot.bb        |    1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
> index 5455899..2f60c97 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
> @@ -41,6 +41,7 @@ RDEPENDS_${PN} = "\
>       ${@base_contains("DISTRO_FEATURES", "sysvinit", "${SYSVINIT_SCRIPTS}", "", d)} \
>       ${@base_contains("MACHINE_FEATURES", "keyboard", "${VIRTUAL-RUNTIME_keymaps}", "", d)} \
>       netbase \
> +    initscripts-functions \
>       ${VIRTUAL-RUNTIME_login_manager} \
>       ${VIRTUAL-RUNTIME_init_manager} \
>       ${VIRTUAL-RUNTIME_initscripts} \
>

