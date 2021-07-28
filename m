Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web12.2114.1627460269282896766
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jul 2021 01:17:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.232, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id 7D87820000C;
	Wed, 28 Jul 2021 08:17:47 +0000 (UTC)
Subject: Re: [OE-core] [PATCH 1/1] fix compilation error when add libgloss under DEPENDS in recipe
To: nagesh shamnur <nagesh.shamnur@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <CAA_JV5PZwZh8mMw0ZoVBuCA1570ki0gqSi_Du=UqXfNtuG6P4w@mail.gmail.com>
 <CAA_JV5OinDTfVwtVN4hYexvr2c08NxL5=A-pAsiBquFqvEUPEQ@mail.gmail.com>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <3bda3524-7dcd-9f8f-d22b-00a3034a4e8d@bootlin.com>
Date: Wed, 28 Jul 2021 10:17:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAA_JV5OinDTfVwtVN4hYexvr2c08NxL5=A-pAsiBquFqvEUPEQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Nagesh,

On 7/28/21 9:53 AM, nagesh shamnur wrote:
>  Dear Group,
>     When include newlib and libgloss under DEPENDS in custom recipe,
>  then newlib compilation is successful however libgloss compilation
>  fails since it is unable to find the needed include path under
>  recipe-sysroot/usr/include. This patch is to fix this issue by
>  including recipe-sysroot/usr/include while configuring libgloss.


Many thanks for your patch corresponding to the fix that you found for
your recent issue!

The patch looks good, but next time, it would be even better if you
could send it as an inline attachment (easiest to do with the "git
send-email"  command). This makes it easier for people to review your
patch and in particular directly quote parts of your patch and comment
or reply on specific lines.

I realize that the YP manual doesn't explain this requirement well. I'll
post an improvement to the corresponding section
(https://docs.yoctoproject.org/dev-manual/common-tasks.html#using-email-to-submit-a-patch).

Thanks again,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

