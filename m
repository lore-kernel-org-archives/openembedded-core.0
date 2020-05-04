Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.9017.1588607305723173670
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2020 08:48:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: randy.macleod@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 044FlrpC023669
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Mon, 4 May 2020 08:48:04 -0700
Received: from [172.25.44.3] (172.25.44.3) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 4 May
 2020 08:47:43 -0700
Subject: Re: [OE-core] [meta-oe][PATCH v3] php: fix zip package config
To: <openembedded-core@lists.openembedded.org>
CC: Konrad Weihmann <kweihmann@outlook.com>
References: <AM7PR05MB6881FAAC5E7D5F97024C2495A8A80@AM7PR05MB6881.eurprd05.prod.outlook.com>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <0e0d07e5-9268-f4b3-0703-37fb4434e99c@windriver.com>
Date: Mon, 4 May 2020 11:47:40 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <AM7PR05MB6881FAAC5E7D5F97024C2495A8A80@AM7PR05MB6881.eurprd05.prod.outlook.com>
X-Originating-IP: [172.25.44.3]
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit


Hi Konrad,

Please send this patch to:
    openembedded-devel@lists.openembedded.org

Thanks,
../Randy

On 2020-05-02 9:38 a.m., Konrad Weihmann wrote:
> --enable-zip and --with-libzip were removed in PHP 7.x.
> These are replaced by --with-zip --with-zlib-dir.
> 
> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
> ---
>   meta-oe/recipes-devtools/php/php_7.4.4.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-oe/recipes-devtools/php/php_7.4.4.bb b/meta-oe/recipes-devtools/php/php_7.4.4.bb
> index ff4c28e13..c1784a78d 100644
> --- a/meta-oe/recipes-devtools/php/php_7.4.4.bb
> +++ b/meta-oe/recipes-devtools/php/php_7.4.4.bb
> @@ -81,7 +81,7 @@ PACKAGECONFIG ??= "mysql sqlite3 imap opcache openssl \
>   "
>   PACKAGECONFIG_class-native = ""
>   
> -PACKAGECONFIG[zip] = "--enable-zip --with-libzip=${STAGING_EXECPREFIXDIR},,libzip"
> +PACKAGECONFIG[zip] = "--with-zip --with-zlib-dir=${STAGING_EXECPREFIXDIR},,libzip"
>   
>   PACKAGECONFIG[mysql] = "--with-mysqli=mysqlnd \
>                           --with-pdo-mysql=mysqlnd \
> 
> 
> 
> 


-- 
# Randy MacLeod
# Wind River Linux
