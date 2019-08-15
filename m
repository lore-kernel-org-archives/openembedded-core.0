Return-Path: <naveen.kumar.saini@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 5D9DE7F2D8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2019 07:01:31 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Aug 2019 00:01:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,388,1559545200"; d="scan'208";a="194712770"
Received: from optimus-prime.png.intel.com (HELO [172.30.199.130])
	([172.30.199.130])
	by fmsmga001.fm.intel.com with ESMTP; 15 Aug 2019 00:01:31 -0700
To: openembedded-core@lists.openembedded.org
References: <20190815065343.5291-1-naveen.kumar.saini@intel.com>
From: "Saini, Naveen Kumar" <naveen.kumar.saini@intel.com>
Message-ID: <7128b7d3-78c0-0a66-8e55-65fedeab2dd1@intel.com>
Date: Thu, 15 Aug 2019 15:03:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190815065343.5291-1-naveen.kumar.saini@intel.com>
Subject: Re: [warrior][PATCH] bitbake.conf: add git-lfs to HOSTTOOLS_NONFATAL
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
X-List-Received-Date: Thu, 15 Aug 2019 07:01:31 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

The corresponding first patch of this patch series already merged in 
Warrior

https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/bitbake/lib?h=warrior&id=6e3a4d7926296380da23536c29af35d5702e02fb

So this patch should also go in warrior.


On 8/15/19 2:53 PM, Naveen Saini wrote:
> This provides git large file storage (lfs) extension.
> 
> Include git-lfs conditionally. If git-lfs is present on host and repo
> has lfs pointers, then git-lfs will be used. If git-lfs is not present
> on host, it will be ignored.
> 
> [YOCTO #13198]
> 
> (From OE-Core rev: 2968ad8514721ec06e67aaf3fd5ec7b247b3431d)
> 
> Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   meta/conf/bitbake.conf | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index c996301a8b..c5313ccd19 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -514,6 +514,9 @@ HOSTTOOLS_NONFATAL += "bzr"
>   # Used by ssh fetcher
>   HOSTTOOLS_NONFATAL += "scp"
>   
> +# Link to git-lfs if present
> +HOSTTOOLS_NONFATAL += "git-lfs"
> +
>   CCACHE ??= ""
>   
>   TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_TARGET}"
> 

