Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SCd3c-0007gr-G3
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Mar 2012 22:31:56 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q2RKMp7Q014651
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2012 13:22:53 -0700 (PDT)
Received: from msp-dhcp8.wrs.com (172.25.34.8) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 27 Mar 2012 13:22:52 -0700
Message-ID: <4F72219A.2020301@windriver.com>
Date: Tue, 27 Mar 2012 15:22:50 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1332877869-12195-1-git-send-email-kergoth@gmail.com>
	<1332877869-12195-3-git-send-email-kergoth@gmail.com>
In-Reply-To: <1332877869-12195-3-git-send-email-kergoth@gmail.com>
Subject: Re: [PATCH 3/3] powerpc: define TUNE_PKGARCH for powerpc/powerpc-nf
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Mar 2012 20:31:56 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Patch 1 and 2 look fine, but I have questions on this one....

On 3/27/12 2:51 PM, Christopher Larson wrote:
> From: Christopher Larson<chris_larson@mentor.com>
>
> This allows setting DEFAULTTUNE to powerpc or powerpc-nf rather than just the
> more specific cpu/machine tuning.
>
> Signed-off-by: Christopher Larson<chris_larson@mentor.com>
> ---
>   meta/conf/machine/include/powerpc/arch-powerpc.inc |    2 ++
>   1 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/meta/conf/machine/include/powerpc/arch-powerpc.inc b/meta/conf/machine/include/powerpc/arch-powerpc.inc
> index c5fd6b7..3438b46 100644
> --- a/meta/conf/machine/include/powerpc/arch-powerpc.inc
> +++ b/meta/conf/machine/include/powerpc/arch-powerpc.inc
> @@ -26,6 +26,8 @@ AVAILTUNES += "powerpc powerpc-nf"
>   TUNE_FEATURES_tune-powerpc-nf ?= "m32 fpu-soft"
>   BASE_LIB_tune-powerpc-nf = "lib"
>   PACKAGE_EXTRA_ARCHS_tune-powerpc-nf = "powerpc-nf"
> +TUNE_PKGARCH_tune-powerpc-nf = "powerpc-nf"
>   TUNE_FEATURES_tune-powerpc ?= "m32 fpu-hard"
>   BASE_LIB_tune-powerpc = "lib"
>   PACKAGE_EXTRA_ARCHS_tune-powerpc = "powerpc"
> +TUNE_PKGARCH_tune-powerpc = "powerpc"

Why is the above necessary?

TUNE_PKGARCH_append is set to "${PPCPKGSFX_FPU}"

PPCPKGSFX_FP is set to either '' or '-nf' based on the existance of fpu-soft.

TUNE_PKGARCH is set by a number of the PowerPC tuning files...  If you are 
looking for generic PowerPC there should be something setting TUNE_PKGARCH to 
"powerpc" (or "powerpc64" in the default cases...)

--Mark


