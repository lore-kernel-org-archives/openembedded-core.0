Received: from relay.dream-property.net (relay.dream-property.net [178.19.67.222])
 by mx.groups.io with SMTP id smtpd.web12.4359.1588423932600667631
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2020 05:52:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail, err=bad algorithm. Only rsa-sha1 or rsa-sha256 are permitted;
 spf=pass (domain: opendreambox.org, ip: 178.19.67.222, mailfrom: obi@opendreambox.org)
Received: from mail.dream-property.net (mail.dream-property.net [82.149.226.172])
	by relay.dream-property.net (Postfix) with ESMTPS id 83C2410095A1E;
	Sat,  2 May 2020 14:52:09 +0200 (CEST)
Received: from localhost (ip-176-199-141-47.hsi06.unitymediagroup.de [176.199.141.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 0B7B43142B10;
	Sat,  2 May 2020 14:52:07 +0200 (CEST)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=opendreambox.org;
	s=dkim; t=1588423928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KqTeUMIdyRAX4Uwz/xSlsEWP1VkWIEV2zZ1OGoG9RV4=;
	b=r+lH6GCQS7Ern33fXI347jl05bRvdI0Z0gL4Wf1+31Ts9NP/tA9Jwck+uKk6eXNTlDhFpw
	ZnlK/se3grL5dsCA==
Date: Sat, 2 May 2020 14:52:05 +0200
From: "Andreas Oberritter" <obi@opendreambox.org>
To: "Konrad Weihmann" <kweihmann@outlook.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [meta-oe][PATCH 1/2] php: fix zip package config
Message-ID: <20200502145205.24892acd@opendreambox.org>
In-Reply-To: <AM7PR05MB68811C880CDB744B1B3C6835A8AB0@AM7PR05MB6881.eurprd05.prod.outlook.com>
References: <AM7PR05MB68811C880CDB744B1B3C6835A8AB0@AM7PR05MB6881.eurprd05.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello Konrad,

On Fri,  1 May 2020 13:56:40 +0200
"Konrad Weihmann" <kweihmann@outlook.com> wrote:

> --enable-zip and --with-libzip were removed in PHP 7.x.
> These are replaced by --enable-zip --with-libzip.

you meant --with-zip --with-zlib-dir.

Best regards,
Andreas


> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
> ---
>  meta-oe/recipes-devtools/php/php_7.4.4.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-oe/recipes-devtools/php/php_7.4.4.bb b/meta-oe/recipes-devtools/php/php_7.4.4.bb
> index ff4c28e13..c1784a78d 100644
> --- a/meta-oe/recipes-devtools/php/php_7.4.4.bb
> +++ b/meta-oe/recipes-devtools/php/php_7.4.4.bb
> @@ -81,7 +81,7 @@ PACKAGECONFIG ??= "mysql sqlite3 imap opcache openssl \
>  "
>  PACKAGECONFIG_class-native = ""
>  
> -PACKAGECONFIG[zip] = "--enable-zip --with-libzip=${STAGING_EXECPREFIXDIR},,libzip"
> +PACKAGECONFIG[zip] = "--with-zip --with-zlib-dir=${STAGING_EXECPREFIXDIR},,libzip"
>  
>  PACKAGECONFIG[mysql] = "--with-mysqli=mysqlnd \
>                          --with-pdo-mysql=mysqlnd \

