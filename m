Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DF03E60761
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 16:23:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u8NGNBQn004956
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 09:23:11 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 23 Sep 2016 09:23:10 -0700
To: <openembedded-core@lists.openembedded.org>
References: <1474640888-55539-1-git-send-email-Zubair.Kakakhel@imgtec.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <6609992f-f91d-bdac-0cd8-e709c873fefe@windriver.com>
Date: Fri, 23 Sep 2016 11:23:10 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <1474640888-55539-1-git-send-email-Zubair.Kakakhel@imgtec.com>
Subject: Re: [Patch] arch-mips: Add mips64-o32 tunes
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
X-List-Received-Date: Fri, 23 Sep 2016 16:23:11 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

Acked, no concerns.

On 9/23/16 9:28 AM, Zubair Lutfullah Kakakhel wrote:
> Add mips64 + o32 rootfs abi tune configurations
> 
> Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
> ---
>  meta/conf/machine/include/mips/arch-mips.inc | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/meta/conf/machine/include/mips/arch-mips.inc b/meta/conf/machine/include/mips/arch-mips.inc
> index d3e83d1..28d3b51 100644
> --- a/meta/conf/machine/include/mips/arch-mips.inc
> +++ b/meta/conf/machine/include/mips/arch-mips.inc
> @@ -103,3 +103,29 @@ TUNE_FEATURES_tune-mips64el-nf = "n64"
>  BASE_LIB_tune-mips64el-nf = "lib64"
>  MIPSPKGSFX_VARIANT_tune-mips64el-nf = "${TUNE_ARCH}"
>  PACKAGE_EXTRA_ARCHS_tune-mips64el-nf = "mips64el-nf"
> +
> +# MIPS 64 + o32
> +AVAILTUNES += "mips64-o32 mips64el-o32"
> +
> +TUNE_FEATURES_tune-mips64-o32 = "o32 bigendian fpu-hard"
> +BASE_LIB_tune-mips64-o32 = "lib"
> +MIPSPKGSFX_VARIANT_tune-mips64-o32 = "${TUNE_ARCH}"
> +PACKAGE_EXTRA_ARCHS_tune-mips64-o32 = "mips mips64-o32 mips64-o32"
> +
> +TUNE_FEATURES_tune-mips64el-o32 = "o32 fpu-hard"
> +BASE_LIB_tune-mips64el-o32 = "lib"
> +MIPSPKGSFX_VARIANT_tune-mips64el-o32 = "${TUNE_ARCH}"
> +PACKAGE_EXTRA_ARCHS_tune-mips64el-o32 = "mipsel mips64el-o32 mips64el-o32"
> +
> +# MIPS 64 o32 and Soft Float
> +AVAILTUNES += "mips64-nf-o32 mips64el-nf-o32"
> +
> +TUNE_FEATURES_tune-mips64-nf-o32 = "o32 bigendian"
> +BASE_LIB_tune-mips64-nf-o32 = "lib"
> +MIPSPKGSFX_VARIANT_tune-mips64-nf-o32 = "${TUNE_ARCH}"
> +PACKAGE_EXTRA_ARCHS_tune-mips64-nf-o32 = "mips-nf mips64-nf-o32"
> +
> +TUNE_FEATURES_tune-mips64el-nf-o32 = "o32"
> +BASE_LIB_tune-mips64el-nf-o32 = "lib"
> +MIPSPKGSFX_VARIANT_tune-mips64el-nf-o32 = "${TUNE_ARCH}"
> +PACKAGE_EXTRA_ARCHS_tune-mips64el-nf-o32 = "mipsel-nf mips64el-nf-o32"
> 


