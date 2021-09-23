Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web11.1801.1632385510068766804
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Sep 2021 01:25:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.232, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id 7B076200007;
	Thu, 23 Sep 2021 08:25:08 +0000 (UTC)
Date: Thu, 23 Sep 2021 10:25:07 +0200
From: "Alexandre Belloni" <alexandre.belloni@bootlin.com>
To: Sakib Sajal <sakib.sajal@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] go: upgrade 1.16.7 -> 1.16.8
Message-ID: <YUw541mxWXg3QSVF@piout.net>
References: <20210923001731.32084-1-sakib.sajal@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20210923001731.32084-1-sakib.sajal@windriver.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Sakib,

On 22/09/2021 20:17:31-0400, Sakib Sajal wrote:
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>  meta/recipes-devtools/go/{go-1.16.7.inc => go-1.16.8.inc}     | 4 ++--
>  ...{go-binary-native_1.16.7.bb => go-binary-native_1.16.8.bb} | 4 ++--
>  ...o-cross-canadian_1.16.7.bb => go-cross-canadian_1.16.8.bb} | 0
>  .../go/{go-cross_1.16.7.bb => go-cross_1.16.8.bb}             | 0
>  .../go/{go-crosssdk_1.16.7.bb => go-crosssdk_1.16.8.bb}       | 0
>  .../go/{go-native_1.16.7.bb => go-native_1.16.8.bb}           | 0
>  .../go/{go-runtime_1.16.7.bb => go-runtime_1.16.8.bb}         | 0
>  meta/recipes-devtools/go/{go_1.16.7.bb => go_1.16.8.bb}       | 0
>  8 files changed, 4 insertions(+), 4 deletions(-)
>  rename meta/recipes-devtools/go/{go-1.16.7.inc => go-1.16.8.inc} (91%)
>  rename meta/recipes-devtools/go/{go-binary-native_1.16.7.bb => go-binary-native_1.16.8.bb} (83%)
>  rename meta/recipes-devtools/go/{go-cross-canadian_1.16.7.bb => go-cross-canadian_1.16.8.bb} (100%)
>  rename meta/recipes-devtools/go/{go-cross_1.16.7.bb => go-cross_1.16.8.bb} (100%)
>  rename meta/recipes-devtools/go/{go-crosssdk_1.16.7.bb => go-crosssdk_1.16.8.bb} (100%)
>  rename meta/recipes-devtools/go/{go-native_1.16.7.bb => go-native_1.16.8.bb} (100%)
>  rename meta/recipes-devtools/go/{go-runtime_1.16.7.bb => go-runtime_1.16.8.bb} (100%)
>  rename meta/recipes-devtools/go/{go_1.16.7.bb => go_1.16.8.bb} (100%)
> 
> diff --git a/meta/recipes-devtools/go/go-1.16.7.inc b/meta/recipes-devtools/go/go-1.16.8.inc
> similarity index 91%
> rename from meta/recipes-devtools/go/go-1.16.7.inc
> rename to meta/recipes-devtools/go/go-1.16.8.inc
> index 9eca1caeeb..acc2300a28 100644
> --- a/meta/recipes-devtools/go/go-1.16.7.inc
> +++ b/meta/recipes-devtools/go/go-1.16.8.inc
> @@ -1,7 +1,7 @@
>  require go-common.inc
>  
>  GO_BASEVERSION = "1.16"
> -PV = "1.16.7"
> +PV = "1.16.8"
>  FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"

I'm not sure on which branch you did apply this patch as you have the
old override syntax here and go-1.16.7.inc always had the new syntax. I
fixed it up locally.



-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
