Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 06B316057B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 12:33:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u3CCXIc8008346
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 05:33:18 -0700 (PDT)
Received: from server.local (128.224.22.93) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 12 Apr 2016 05:33:18 -0700
To: Robert Yang <liezhi.yang@windriver.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1460442964.git.liezhi.yang@windriver.com>
	<0877ab068513b9720c808aaeb0c8a90f9a45afc3.1460442964.git.liezhi.yang@windriver.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <570CEB0D.7090701@windriver.com>
Date: Tue, 12 Apr 2016 08:33:17 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <0877ab068513b9720c808aaeb0c8a90f9a45afc3.1460442964.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 1/1] linux-yocto-tiny: fix KBRANCH
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
X-List-Received-Date: Tue, 12 Apr 2016 12:33:20 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-04-12 2:36 AM, Robert Yang wrote:
> Fixed:
> WARNING: linux-yocto-tiny-4.4.3+gitAUTOINC+770996a263_73481a3abd-r0 do_patch: After meta data application, the kernel tree branch is standard/tiny/common-pc. The
> WARNING: linux-yocto-tiny-4.4.3+gitAUTOINC+770996a263_73481a3abd-r0 do_patch: SRC_URI specified branch standard/tiny/base. The branch will be forced to standard/tiny/base,
> WARNING: linux-yocto-tiny-4.4.3+gitAUTOINC+770996a263_73481a3abd-r0 do_patch: but this means the board meta data (.scc files) do not match the SRC_URI specification.
> WARNING: linux-yocto-tiny-4.4.3+gitAUTOINC+770996a263_73481a3abd-r0 do_patch: The meta data and branch standard/tiny/base should be inspected to ensure the proper
> WARNING: linux-yocto-tiny-4.4.3+gitAUTOINC+770996a263_73481a3abd-r0 do_patch: kernel is being built.
>
> Use standard/tiny/common-pc which is pointed by the .scc to fix problem.
> Btw, standard/tiny/base and standard/tiny/common-pc points to the same
> commit id.

When tiny eventually supports more architectures/boards we'll have
to change this again, but for the 2.1 release this is the change
with the least impact.

Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>

I can pick this patch up and put it in my queue, speak now if someone
else is going to grab it.

Bruce

>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>   meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb | 2 +-
>   meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
> index 4c79bfd..37ff046 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
> @@ -1,4 +1,4 @@
> -KBRANCH ?= "standard/tiny/base"
> +KBRANCH ?= "standard/tiny/common-pc"
>   LINUX_KERNEL_TYPE = "tiny"
>   KCONFIG_MODE = "--allnoconfig"
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
> index 9446da9..dcb545e 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
> @@ -1,4 +1,4 @@
> -KBRANCH ?= "standard/tiny/base"
> +KBRANCH ?= "standard/tiny/common-pc"
>   LINUX_KERNEL_TYPE = "tiny"
>   KCONFIG_MODE = "--allnoconfig"
>
>


