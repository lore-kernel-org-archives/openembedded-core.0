Return-Path: <ross.burton@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 6A2777F87C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Nov 2019 18:22:49 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Nov 2019 10:22:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,254,1571727600"; d="scan'208";a="234499996"
Received: from xsanroma-mobl1.ger.corp.intel.com (HELO blackadder.local)
	([10.249.34.24])
	by fmsmga004.fm.intel.com with ESMTP; 28 Nov 2019 10:22:49 -0800
To: Wang Mingyu <wangmy@cn.fujitsu.com>,
	openembedded-core@lists.openembedded.org
References: <1574932348-14525-1-git-send-email-wangmy@cn.fujitsu.com>
	<1574932348-14525-3-git-send-email-wangmy@cn.fujitsu.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <021a6e04-6ecd-fbd1-959d-11e0ce13eca4@intel.com>
Date: Thu, 28 Nov 2019 18:22:48 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <1574932348-14525-3-git-send-email-wangmy@cn.fujitsu.com>
Subject: Re: [PATCH] stress-ng 0.10.10 -> 0.10.11
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
X-List-Received-Date: Thu, 28 Nov 2019 18:22:49 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 28/11/2019 09:12, Wang Mingyu wrote:
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>   .../stress-ng/{stress-ng_0.10.10.bb => stress-ng_0.10.11.bb}          | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta/recipes-extended/stress-ng/{stress-ng_0.10.10.bb => stress-ng_0.10.11.bb} (83%)
> 
> diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.10.10.bb b/meta/recipes-extended/stress-ng/stress-ng_0.10.11.bb
> similarity index 83%
> rename from meta/recipes-extended/stress-ng/stress-ng_0.10.10.bb
> rename to meta/recipes-extended/stress-ng/stress-ng_0.10.11.bb
> index 47a98f3..0e17385 100644
> --- a/meta/recipes-extended/stress-ng/stress-ng_0.10.10.bb
> +++ b/meta/recipes-extended/stress-ng/stress-ng_0.10.11.bb
> @@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>   SRC_URI = "https://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
>              file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch \
>              "
> -SRC_URI[md5sum] = "ad4de38d6ff1ccf3640573e967dfb136"
> -SRC_URI[sha256sum] = "031de5ebc44b49992c11633f10aae96da05a85b326aebdffd88ba8c445d23cf4"
> +SRC_URI[md5sum] = "08b694eeb152c659b06cbe0c723fbf2a"
> +SRC_URI[sha256sum] = "ec41d375d1ae61862b00a939a5263791c8c8fdb262ad14ea204944df4ca140f1"

ERROR: stress-ng-0.10.11-r0 do_fetch: Fetcher failure for URL: 
'https://kernel.ubuntu.com/~cking/tarballs/stress-ng/stress-ng-0.10.11.tar.xz'. 
Checksum mismatch!
File: '/home/ross/Yocto/downloads/stress-ng-0.10.11.tar.xz' has md5 
checksum 03e836175d039cd69a64d2790b9d1a98 when 
08b694eeb152c659b06cbe0c723fbf2a was expected

Did upstream change their tarball already?

Ross

