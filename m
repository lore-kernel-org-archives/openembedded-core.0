Return-Path: <ross.burton@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 440147E684
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2019 19:40:54 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Sep 2019 12:40:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,549,1559545200"; d="scan'208";a="189761090"
Received: from arokiasx-mobl1.gar.corp.intel.com (HELO blackadder.local)
	([10.252.54.158])
	by fmsmga007.fm.intel.com with ESMTP; 25 Sep 2019 12:40:54 -0700
To: Diego Rondini <diego.rondini@kynetics.com>,
	openembedded-core@lists.openembedded.org
References: <20190925144933.16030-1-diego.rondini@kynetics.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <bd5c3ea5-aa03-ae71-1257-026d91102a03@intel.com>
Date: Wed, 25 Sep 2019 20:40:53 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190925144933.16030-1-diego.rondini@kynetics.com>
Subject: Re: [PATCH] bmap-tools: add missing python3-misc dependency
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
X-List-Received-Date: Wed, 25 Sep 2019 19:40:54 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 25/09/2019 15:49, Diego Rondini wrote:
> Add runtime dependency on python3-misc as bmaptool depends on ntpath.
> 
> Signed-off-by: Diego Rondini <diego.rondini@kynetics.com>
> ---
>   meta/recipes-support/bmap-tools/bmap-tools_3.5.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-support/bmap-tools/bmap-tools_3.5.bb b/meta/recipes-support/bmap-tools/bmap-tools_3.5.bb
> index 7c4db85b32..6be07d7f9c 100644
> --- a/meta/recipes-support/bmap-tools/bmap-tools_3.5.bb
> +++ b/meta/recipes-support/bmap-tools/bmap-tools_3.5.bb
> @@ -17,7 +17,7 @@ PV .= "+git${SRCPV}"
>   
>   UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
>   
> -RDEPENDS_${PN} = "python3-core python3-compression python3-mmap python3-setuptools python3-fcntl python3-six"
> +RDEPENDS_${PN} = "python3-core python3-compression python3-mmap python3-setuptools python3-fcntl python3-six python3-misc"
>   
>   inherit python3native
>   inherit setuptools3
> 

ERROR: Nothing RPROVIDES 'python3-misc-native' (but 
virtual:native:/home/ross/Yocto/poky/meta/recipes-support/bmap-tools/bmap-tools_3.5.bb 
RDEPENDS on or otherwise requires it)

Ross

