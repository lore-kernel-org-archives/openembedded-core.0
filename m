Return-Path: <ross.burton@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 810997FA0E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jan 2020 14:59:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Jan 2020 06:59:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,391,1571727600"; d="scan'208";a="369620470"
Received: from hongy-mobl1.ger.corp.intel.com (HELO rburton-mac01.local)
	([10.252.50.70])
	by orsmga004.jf.intel.com with ESMTP; 03 Jan 2020 06:59:39 -0800
To: openembedded-core@lists.openembedded.org
References: <cover.1578035913.git.raj.khem@gmail.com>
	<5c6e77fa2c33e38254395b6f315bd78b62c5c695.1578035913.git.raj.khem@gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <a22c2d43-076d-31d2-e33b-09a95fbb602a@intel.com>
Date: Fri, 3 Jan 2020 14:59:39 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <5c6e77fa2c33e38254395b6f315bd78b62c5c695.1578035913.git.raj.khem@gmail.com>
Subject: Re: [PATCH 2/3] musl: Build outside of source tree
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
X-List-Received-Date: Fri, 03 Jan 2020 14:59:39 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 03/01/2020 07:21, Khem Raj wrote:
> musl does not use cmake/autotools etc. but plane old makefile basded
> build system, which means it does not get B defined to be outside S
> therefore define B explicitly to be outside S
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   meta/recipes-core/musl/musl.inc | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/meta/recipes-core/musl/musl.inc b/meta/recipes-core/musl/musl.inc
> index 9aea2c39c8..e5cc869cb9 100644
> --- a/meta/recipes-core/musl/musl.inc
> +++ b/meta/recipes-core/musl/musl.inc
> @@ -25,3 +25,5 @@ MIPS_INSTRUCTION_SET = "mips"
>   ARM_INSTRUCTION_SET_armv5 = "arm"
>   ARM_INSTRUCTION_SET_armv4 = "arm"
>   
> +# Enable out of tree build
> +B = "${WORKDIR}/build"

That directory won't get cleaned unless you also set [cleandirs].

Ross

