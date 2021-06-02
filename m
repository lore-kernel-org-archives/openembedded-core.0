Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.13898.1622644499174193951
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jun 2021 07:34:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id EABF5C000A;
	Wed,  2 Jun 2021 14:34:56 +0000 (UTC)
Cc: Steve Sakoman <steve@sakoman.com>,
 YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [OE-core] [hardknott] [PATCH 1/5] expat: set CVE_PRODUCT
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20210602132720.2921099-1-richard.purdie@linuxfoundation.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <891d37d1-3f47-af73-86f7-bb07b2eb3371@bootlin.com>
Date: Wed, 2 Jun 2021 16:34:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210602132720.2921099-1-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Richard,

On 6/2/21 3:27 PM, Richard Purdie wrote:
> --- a/meta/recipes-core/expat/expat_2.2.10.bb
> +++ b/meta/recipes-core/expat/expat_2.2.10.bb
> @@ -25,3 +25,5 @@ do_install_ptest_class-target() {
>  }
>  
>  BBCLASSEXTEND += "native nativesdk"
> +
> +CVE_PRODUCT = "expat libexpat"


Oops, this variable doesn't appear in the documentation and more
generally CVE management doesn't seem to be documented.

Your comments and suggestions are welcome. I created a new bug
(https://bugzilla.yoctoproject.org/show_bug.cgi?id=14419) to track this.

Cheers,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

