Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.5891.1627483960375819017
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jul 2021 07:52:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 8AAB020007;
	Wed, 28 Jul 2021 14:52:38 +0000 (UTC)
Subject: Re: [OE-core] [PATCH 1/3] scripts/contrib: Add override conversion script
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20210728141506.3287158-1-richard.purdie@linuxfoundation.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <249a0b12-37c7-e844-9f69-6d2393707f90@bootlin.com>
Date: Wed, 28 Jul 2021 16:52:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210728141506.3287158-1-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 7/28/21 4:15 PM, Richard Purdie wrote:
> This adds a script I've developed to migrate metadata to use the new override
> syntax. It is a bit rough but since its for a single use with validation, it
> doesn't need to be perfect. It is run simply as:
>
> scripts/contrib/convert-overrides.py <directory>
>
> It is setup and has been tested to work with OE-Core, Bitbake, yocto-docs,
> meta-yocto, meta-gplv2 and meta-mingw. For OE-Core, it converts around 10,100
> lines with about 34 manual fixes needed.
>
> For other layers it would need updating for override names and exclusions for
> functions/variable names with "append", "prepend" or "remove" in them.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  scripts/contrib/convert-overrides.py | 146 +++++++++++++++++++++++++++
>  1 file changed, 146 insertions(+)
>  create mode 100755 scripts/contrib/convert-overrides.py
>
> diff --git a/scripts/contrib/convert-overrides.py b/scripts/contrib/convert-overrides.py


Tested-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Working fine on documentation sources, though I'll exclude the changes
to migration guides from past versions.
Thanks!

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

