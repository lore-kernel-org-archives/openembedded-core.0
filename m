Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web09.12875.1604496736348461833
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2020 05:32:17 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: a.fatoum@pengutronix.de)
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
	by metis.ext.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1kaItZ-00063E-Gn; Wed, 04 Nov 2020 14:32:13 +0100
Subject: Re: [OE-core] [PATCH] vim: add nativesdk to BBCLASSEXTEND
To: Nathan Rossi <nathan@nathanrossi.com>,
 openembedded-core@lists.openembedded.org
References: <20201104131745.397780-1-nathan@nathanrossi.com>
From: "Ahmad Fatoum" <a.fatoum@pengutronix.de>
Message-ID: <574f594f-cdbf-0465-dc5e-5ca1033df19a@pengutronix.de>
Date: Wed, 4 Nov 2020 14:32:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201104131745.397780-1-nathan@nathanrossi.com>
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hello Nathan,

On 11/4/20 2:17 PM, Nathan Rossi wrote:
> Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
> ---
>  meta/recipes-support/vim/vim_8.2.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-support/vim/vim_8.2.bb b/meta/recipes-support/vim/vim_8.2.bb
> index 709b6ddb55..7e4654e472 100644
> --- a/meta/recipes-support/vim/vim_8.2.bb
> +++ b/meta/recipes-support/vim/vim_8.2.bb
> @@ -3,7 +3,7 @@ require vim.inc
>  PROVIDES = "xxd"
>  
>  PACKAGECONFIG_class-native = ""
> -BBCLASSEXTEND = "native"
> +BBCLASSEXTEND = "native nativesdk"

Apologies if this is self-evident, but why should nativesdk be added here?
A commit message explaining the why would be quite helpful.

>  
>  ALTERNATIVE_${PN}_append = " xxd"
>  ALTERNATIVE_TARGET[xxd] = "${bindir}/xxd"
> ---
> 2.28.0
> 
> 
> 
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
