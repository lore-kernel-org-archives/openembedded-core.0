Return-Path: <jose.perez.carranza@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 87C9F71CA3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 15:31:52 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Jul 2017 08:31:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,317,1496127600"; d="scan'208";a="123665040"
Received: from jgperezc-mobl1.zpn.intel.com (HELO [10.219.4.33])
	([10.219.4.33])
	by fmsmga006.fm.intel.com with ESMTP; 06 Jul 2017 08:31:53 -0700
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
References: <cover.1499351361.git.raj.khem@gmail.com>
	<3107cc24993f111ff2d5714213bd85ff15173221.1499351361.git.raj.khem@gmail.com>
From: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>
Message-ID: <48ec40d9-45ec-a6c1-add5-e389819f6e07@linux.intel.com>
Date: Thu, 6 Jul 2017 10:34:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <3107cc24993f111ff2d5714213bd85ff15173221.1499351361.git.raj.khem@gmail.com>
Subject: Re: [PATCH 22/22] testimage: Use the renamed buildlzip
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
X-List-Received-Date: Thu, 06 Jul 2017 15:31:52 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 07/06/2017 09:33 AM, Khem Raj wrote:
> buildiptables has been replaced with buildlzip
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   meta/classes/testimage.bbclass | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
> index 6fa2d6fd9f..0c4a84e111 100644
> --- a/meta/classes/testimage.bbclass
> +++ b/meta/classes/testimage.bbclass
> @@ -49,10 +49,10 @@ DEFAULT_TEST_SUITES_pn-core-image-x11 = "${MINTESTSUITE}"
>   DEFAULT_TEST_SUITES_pn-core-image-lsb = "${NETTESTSUITE} pam parselogs ${RPMTESTSUITE}"
>   DEFAULT_TEST_SUITES_pn-core-image-sato = "${NETTESTSUITE} connman xorg parselogs ${RPMTESTSUITE} \
>       ${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'python', '', d)}"
> -DEFAULT_TEST_SUITES_pn-core-image-sato-sdk = "${NETTESTSUITE} buildcpio buildiptables buildgalculator \
> +DEFAULT_TEST_SUITES_pn-core-image-sato-sdk = "${NETTESTSUITE} buildcpio buildlzip buildgalculator \
>       connman ${DEVTESTSUITE} logrotate perl parselogs python ${RPMTESTSUITE} xorg"
>   DEFAULT_TEST_SUITES_pn-core-image-lsb-dev = "${NETTESTSUITE} pam perl python parselogs ${RPMTESTSUITE}"
> -DEFAULT_TEST_SUITES_pn-core-image-lsb-sdk = "${NETTESTSUITE} buildcpio buildiptables buildgalculator \
> +DEFAULT_TEST_SUITES_pn-core-image-lsb-sdk = "${NETTESTSUITE} buildcpio buildlzip buildgalculator \
>       connman ${DEVTESTSUITE} logrotate pam parselogs perl python ${RPMTESTSUITE}"
>   DEFAULT_TEST_SUITES_pn-meta-toolchain = "auto"
>   
> @@ -61,7 +61,7 @@ DEFAULT_TEST_SUITES_remove_aarch64 = "xorg"
>   
>   # qemumips is quite slow and has reached the timeout limit several times on the YP build cluster,
>   # mitigate this by removing build tests for qemumips machines.
> -MIPSREMOVE ??= "buildcpio buildiptables buildgalculator"
> +MIPSREMOVE ??= "buildcpio buildlzip buildgalculator"
>   DEFAULT_TEST_SUITES_remove_qemumips = "${MIPSREMOVE}"
>   DEFAULT_TEST_SUITES_remove_qemumips64 = "${MIPSREMOVE}"
>   
I think this patch is not applicable as for runtime tests 
(meta/lib/oeqa/runtime/cases/) we do actually use buildiptables test, 
for sdk test there are not filters so in the case of using "testsdk" all 
the available test under meta/lib/oeqa/sdk/cases should be executed.

-- 
Saludos
José


