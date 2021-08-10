Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web08.750.1628617968393254132
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Aug 2021 10:52:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 2E75CC0005;
	Tue, 10 Aug 2021 17:52:46 +0000 (UTC)
Cc: Geoff Parker <geoffrey.parker@arthrex.com>
Subject: Re: [OE-core] [PATCH] cifs-utils: typo fix fakse --> false
To: Geoff Parker <geoffhp@gmail.com>, openembedded-core@lists.openembedded.org
References: <20210810174531.2359601-1-geoffhp@gmail.com>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <2befb894-3c40-b5b4-6bb7-6d5269b3028b@bootlin.com>
Date: Tue, 10 Aug 2021 19:52:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210810174531.2359601-1-geoffhp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Geoff,

On 8/10/21 7:45 PM, Geoff Parker wrote:
> From: Geoff Parker <geoffrey.parker@arthrex.com>
>
> Signed-off-by: Geoff Parker <geoffrey.parker@arthrex.com>
> ---
>  meta-networking/recipes-support/cifs/cifs-utils_6.13.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-support/cifs/cifs-utils_6.13.bb b/meta-networking/recipes-support/cifs/cifs-utils_6.13.bb
> index 54aa3ce19..a8d3e91eb 100644
> --- a/meta-networking/recipes-support/cifs/cifs-utils_6.13.bb
> +++ b/meta-networking/recipes-support/cifs/cifs-utils_6.13.bb
> @@ -26,7 +26,7 @@ do_configure:prepend() {
>      # want installed to /usr/sbin rather than /sbin to be DISTRO_FEATURES usrmerge compliant
>      # must override ROOTSBINDIR (default '/sbin'),
>      # setting --exec-prefix or --prefix in EXTRA_OECONF does not work
> -    if ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','true','fakse',d)}; then
> +    if ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','true','false',d)}; then
>          export ROOTSBINDIR=${sbindir}
>      fi
>  }


Thanks for the patch. Good catch.

However, you should send it to openembedded-devel@lists.openembedded.org
instead (see the MAINTAINERS file under meta-networking).

Thanks again,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

