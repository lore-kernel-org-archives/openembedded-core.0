Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 53E2C74683
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2018 19:39:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w3AJdQm5022055
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 10 Apr 2018 12:39:26 -0700 (PDT)
Received: from [172.25.44.10] (172.25.44.10) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 10 Apr 2018 12:39:25 -0700
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>,
	<openembedded-core@lists.openembedded.org>
References: <1520848583-21222-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <84ab73de-b18d-caec-c9cc-2a48e1385faf@windriver.com>
Date: Tue, 10 Apr 2018 15:39:24 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <1520848583-21222-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Originating-IP: [172.25.44.10]
Subject: Re: [oe][meta-oe][PATCH] pkcs11-helper: 1.11 -> 1.22
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
X-List-Received-Date: Tue, 10 Apr 2018 19:39:40 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 2018-03-12 05:56 AM, Huang Qiyu wrote:
> Upgrade pkcs11-helper from 1.11 to 1.22.
> 
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> ---
>   .../pkcs11-helper/{pkcs11-helper_1.11.bb => pkcs11-helper_1.22.bb}      | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-oe/recipes-crypto/pkcs11-helper/{pkcs11-helper_1.11.bb => pkcs11-helper_1.22.bb} (95%)

Huang,

Wrong list, send to:
   openembedded-devel@lists.openembedded.org

Thanks,
../Randy

> 
> diff --git a/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.11.bb b/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.22.bb
> similarity index 95%
> rename from meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.11.bb
> rename to meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.22.bb
> index db71bd0..51ccf37 100644
> --- a/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.11.bb
> +++ b/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.22.bb
> @@ -20,7 +20,7 @@ SRC_URI[md5sum] = "9f62af9f475901b89355266141306673"
>   SRC_URI[sha256sum] = "494ec59c93e7c56c528f335d9353849e2e7c94a6b1b41c89604694e738113386"
>   
>   S = "${WORKDIR}/git"
> -SRCREV = "e7adf8f35be232a4f04c53b4ac409be52792093e"
> +SRCREV = "a6e54e9bdd57dd4e98a2fbf984fe7fe4a9d60171"
>   
>   DEPENDS = "zlib nettle gnutls gmp openssl nss nspr"
>   
> 


-- 
# Randy MacLeod
# Wind River Linux

