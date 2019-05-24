Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C2E997E45E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2019 16:14:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x4OGEhM8015959
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 24 May 2019 09:14:43 -0700 (PDT)
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Fri, 24 May 2019 09:14:42 -0700
To: Nicola Lunghi <nick83ola@gmail.com>,
	<openembedded-core@lists.openembedded.org>
References: <20190524144447.24103-1-nick83ola@gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <a2d506ec-aede-294e-e673-01bf30bbe30f@windriver.com>
Date: Fri, 24 May 2019 12:14:41 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190524144447.24103-1-nick83ola@gmail.com>
X-Originating-IP: [172.25.44.4]
Subject: Re: [oe][meta-webserver][PATCH 1/2] nginx: update to version 1.17.0
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
X-List-Received-Date: Fri, 24 May 2019 16:14:43 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Nicola,

Please re-send to:
    openembedded-devel@lists.openembedded.org
rather than:
    openembedded-core@lists.openembedded.org

Did you read:
  https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
If so maybe we need to improve the howto.

Thanks.
../Randy

On 5/24/19 10:44 AM, Nicola Lunghi wrote:
> Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
> ---
>   meta-webserver/recipes-httpd/nginx/nginx_1.15.7.bb | 6 ------
>   meta-webserver/recipes-httpd/nginx/nginx_1.17.0.bb | 6 ++++++
>   2 files changed, 6 insertions(+), 6 deletions(-)
>   delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.15.7.bb
>   create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.17.0.bb
> 
> diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.15.7.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.15.7.bb
> deleted file mode 100644
> index 5e6dc33e9..000000000
> --- a/meta-webserver/recipes-httpd/nginx/nginx_1.15.7.bb
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -require nginx.inc
> -
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=3691402cc54ce09f800ca348634a2dfe"
> -
> -SRC_URI[md5sum] = "719b2e3d416f111fecc9db6625553658"
> -SRC_URI[sha256sum] = "8f22ea2f6c0e0a221b6ddc02b6428a3ff708e2ad55f9361102b1c9f4142bdf93"
> diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.17.0.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.17.0.bb
> new file mode 100644
> index 000000000..8774a87ff
> --- /dev/null
> +++ b/meta-webserver/recipes-httpd/nginx/nginx_1.17.0.bb
> @@ -0,0 +1,6 @@
> +require nginx.inc
> +
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=52e384aaac868b755b93ad5535e2d075"
> +
> +SRC_URI[md5sum] = "56767fd62302508295b31adc48b99a59"
> +SRC_URI[sha256sum] = "e21b5d06cd53e86afb94f0b3678e0abb0c0f011433471fa3d895cefa65ae0fab"
> 


-- 
# Randy MacLeod
# Wind River Linux

