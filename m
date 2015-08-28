Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id D4BA076D96
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 03:14:45 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 27 Aug 2015 20:14:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,424,1437462000"; d="scan'208";a="792543197"
Received: from araghun3-mobl.amr.corp.intel.com (HELO
	swold-mobl.amr.corp.intel.com) ([10.254.110.91])
	by fmsmga002.fm.intel.com with ESMTP; 27 Aug 2015 20:14:46 -0700
To: Randy MacLeod <Randy.MacLeod@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <1440731387-19733-1-git-send-email-Randy.MacLeod@windriver.com>
From: Saul Wold <sgw@linux.intel.com>
Message-ID: <55DFD226.7080601@linux.intel.com>
Date: Thu, 27 Aug 2015 20:14:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <1440731387-19733-1-git-send-email-Randy.MacLeod@windriver.com>
Subject: Re: [PATCH] gcc-source: exlude from world
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
X-List-Received-Date: Fri, 28 Aug 2015 03:14:49 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 08/27/2015 08:09 PM, Randy MacLeod wrote:
> Exclude all versions of gcc-source from world builds so that:
>     bitbake -c <stage> world
> will work. gcc-source deletes most bitbake build stages
> since it is a source-only package.

I think this is missing a [YOCTO #7878] as this is trying to address 
that bug, correct?

Sau!

>
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
>   meta/recipes-devtools/gcc/gcc-source_4.8.bb | 2 ++
>   meta/recipes-devtools/gcc/gcc-source_4.9.bb | 2 ++
>   meta/recipes-devtools/gcc/gcc-source_5.2.bb | 2 ++
>   3 files changed, 6 insertions(+)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-source_4.8.bb b/meta/recipes-devtools/gcc/gcc-source_4.8.bb
> index 234b82e..b890fa3 100644
> --- a/meta/recipes-devtools/gcc/gcc-source_4.8.bb
> +++ b/meta/recipes-devtools/gcc/gcc-source_4.8.bb
> @@ -1,2 +1,4 @@
>   require recipes-devtools/gcc/gcc-${PV}.inc
>   require recipes-devtools/gcc/gcc-source.inc
> +
> +EXCLUDE_FROM_WORLD = "1"
> diff --git a/meta/recipes-devtools/gcc/gcc-source_4.9.bb b/meta/recipes-devtools/gcc/gcc-source_4.9.bb
> index 234b82e..b890fa3 100644
> --- a/meta/recipes-devtools/gcc/gcc-source_4.9.bb
> +++ b/meta/recipes-devtools/gcc/gcc-source_4.9.bb
> @@ -1,2 +1,4 @@
>   require recipes-devtools/gcc/gcc-${PV}.inc
>   require recipes-devtools/gcc/gcc-source.inc
> +
> +EXCLUDE_FROM_WORLD = "1"
> diff --git a/meta/recipes-devtools/gcc/gcc-source_5.2.bb b/meta/recipes-devtools/gcc/gcc-source_5.2.bb
> index 234b82e..b890fa3 100644
> --- a/meta/recipes-devtools/gcc/gcc-source_5.2.bb
> +++ b/meta/recipes-devtools/gcc/gcc-source_5.2.bb
> @@ -1,2 +1,4 @@
>   require recipes-devtools/gcc/gcc-${PV}.inc
>   require recipes-devtools/gcc/gcc-source.inc
> +
> +EXCLUDE_FROM_WORLD = "1"
>

