Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SDktz-0000vA-9d
	for openembedded-core@lists.openembedded.org;
	Sat, 31 Mar 2012 01:06:39 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q2UMvXZN000272
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2012 15:57:33 -0700 (PDT)
Received: from msp-dhcp12.wrs.com (172.25.34.12) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 30 Mar 2012 15:57:33 -0700
Message-ID: <4F763A5C.5030900@windriver.com>
Date: Fri, 30 Mar 2012 17:57:32 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1333147814-4990-1-git-send-email-kergoth@gmail.com>
In-Reply-To: <1333147814-4990-1-git-send-email-kergoth@gmail.com>
Subject: Re: [PATCH] tune-ppce500: correct the -mfloat-gprs compiler option
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
X-List-Received-Date: Fri, 30 Mar 2012 23:06:39 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

I noticed the same problem in the tuning rework that I've gone pending.  I'm 
currently working on validating it and hope to have something for merging once I 
get done validating all 120 tunes.

--Mark

On 3/30/12 5:50 PM, Christopher Larson wrote:
> From: Christopher Larson<chris_larson@mentor.com>
>
> Per Edmar at Freescale, e500v2 needs -mfloat-gprs=double, but e500v1 needs
> -mfloat-gprs=single.
>
> Signed-off-by: Christopher Larson<chris_larson@mentor.com>
> ---
>   meta/conf/machine/include/tune-ppce500.inc |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/conf/machine/include/tune-ppce500.inc b/meta/conf/machine/include/tune-ppce500.inc
> index feb1967..c966560 100644
> --- a/meta/conf/machine/include/tune-ppce500.inc
> +++ b/meta/conf/machine/include/tune-ppce500.inc
> @@ -7,7 +7,7 @@ TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce500", "-mcpu=8540", "
>   TUNE_PKGARCH_tune-ppce500 = "ppce500"
>
>   TUNEVALID[spe] = "Enable SPE ABI extensions"
> -TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "spe", "-mabi=spe -mspe -mfloat-gprs=double", "", d)}"
> +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "spe", "-mabi=spe -mspe -mfloat-gprs=single", "", d)}"
>
>   TARGET_FPU = "ppc-efs"
>


