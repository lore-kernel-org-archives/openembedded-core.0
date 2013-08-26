Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A3B576BAA6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 14:37:38 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 26 Aug 2013 07:34:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,958,1367996400"; d="scan'208";a="393524848"
Received: from unknown (HELO [10.255.14.139]) ([10.255.14.139])
	by orsmga002.jf.intel.com with ESMTP; 26 Aug 2013 07:37:20 -0700
Message-ID: <521B6820.1000000@linux.intel.com>
Date: Mon, 26 Aug 2013 07:37:20 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: rongqing.li@windriver.com
References: <cover.1377505592.git.rongqing.li@windriver.com>
	<77319aeee8a2f49fa9ece78c4a0e4e20be3d4165.1377505592.git.rongqing.li@windriver.com>
In-Reply-To: <77319aeee8a2f49fa9ece78c4a0e4e20be3d4165.1377505592.git.rongqing.li@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] btrfs-tools: Add dependency on lzo acl e2fsprog
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
X-List-Received-Date: Mon, 26 Aug 2013 14:37:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


Why?

And should the acl be controlled by a PACKAGECONFIG?  Can it be disabled 
during do_configure?

Sau!

On 08/26/2013 01:56 AM, rongqing.li@windriver.com wrote:
> From: "Roy.Li" <rongqing.li@windriver.com>
>
> Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> ---
>   meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
> index 07e8529..3ec9e8a 100644
> --- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
> +++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
> @@ -10,7 +10,7 @@ HOMEPAGE = "https://btrfs.wiki.kernel.org"
>   LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=fcb02dc552a041dee27e4b85c7396067"
>   SECTION = "base"
> -DEPENDS = "util-linux attr"
> +DEPENDS = "util-linux attr e2fsprogs lzo acl"
>
>   SRCREV = "194aa4a1bd6447bb545286d0bcb0b0be8204d79f"
>   SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/mason/btrfs-progs.git;protocol=git"
>

