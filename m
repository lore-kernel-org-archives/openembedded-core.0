Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 98C4C71994
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jan 2017 18:16:40 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga104.jf.intel.com with ESMTP; 04 Jan 2017 10:16:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,459,1477983600"; d="scan'208";a="49518249"
Received: from lsandov1-mobl2.zpn.intel.com (HELO [10.219.128.142])
	([10.219.128.142])
	by fmsmga005.fm.intel.com with ESMTP; 04 Jan 2017 10:16:39 -0800
To: ola.redell@gmail.com, openembedded-core@lists.openembedded.org
References: <1483453287-32323-1-git-send-email-ola.redell@retotech.se>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Message-ID: <c3d25549-eb1a-4d25-a4ef-27f815dcc1e0@linux.intel.com>
Date: Wed, 4 Jan 2017 12:23:08 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <1483453287-32323-1-git-send-email-ola.redell@retotech.se>
Subject: Re: [PATCH v2] Append KERNEL_VERSION string to kernel module package names
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
X-List-Received-Date: Wed, 04 Jan 2017 18:16:41 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Ola, please follow the commit short log guidelines when submitting 
patches. Basically you need to prefix the target where this change is 
applying then a brief description, for example

kernel-module-split: Append KERNEL_VERSION string to kernel module

More info at 
http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines


On 01/03/2017 08:21 AM, ola.redell@gmail.com wrote:
> From: Ola Redell <ola.redell@retotech.se>
>
> The KERNEL_VERSION string is added to kernel module package names in order to
> make the kernel modules for different kernel versions distinct packages instead
> of different versions of the same package. With this change, when a new kernel
> is installed together with its kernel modules (e.g. by upgrade of the packages
> kernel and kernel-modules) using some package manager such as apt-get or rpm,
> the kernel modules for the older kernel will not be removed. This enables a
> fall back to the older kernel if the new one fails.
>
> Signed-off-by: Ola Redell <ola.redell@retotech.se>
> ---
>   meta/classes/kernel-module-split.bbclass | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kernel-module-split.bbclass
> index efe1b42..13cff51 100644
> --- a/meta/classes/kernel-module-split.bbclass
> +++ b/meta/classes/kernel-module-split.bbclass
> @@ -122,7 +122,7 @@ python split_kernel_module_packages () {
>       module_regex = '^(.*)\.k?o$'
>   
>       module_pattern_prefix = d.getVar('KERNEL_MODULE_PACKAGE_PREFIX')
> -    module_pattern = module_pattern_prefix + 'kernel-module-%s'
> +    module_pattern = module_pattern_prefix + 'kernel-module-%s-' + d.getVar("KERNEL_VERSION", True)
>   
>       postinst = d.getVar('pkg_postinst_modules')
>       postrm = d.getVar('pkg_postrm_modules')


