Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web08.2295.1627461890250652992
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jul 2021 01:44:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 00F2024000A;
	Wed, 28 Jul 2021 08:44:47 +0000 (UTC)
Subject: Re: [OE-core] [PATCH 1/1] fix compilation error when add libgloss under DEPENDS in recipe
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: nagesh shamnur <nagesh.shamnur@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <CAA_JV5PZwZh8mMw0ZoVBuCA1570ki0gqSi_Du=UqXfNtuG6P4w@mail.gmail.com>
 <CAA_JV5OinDTfVwtVN4hYexvr2c08NxL5=A-pAsiBquFqvEUPEQ@mail.gmail.com>
 <1695E67E3139B070.18968@lists.openembedded.org>
Organization: Bootlin
Message-ID: <6a67e485-b933-137c-79b4-d7d6396baa75@bootlin.com>
Date: Wed, 28 Jul 2021 10:44:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1695E67E3139B070.18968@lists.openembedded.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Nagesh,

On 7/28/21 10:17 AM, Michael Opdenacker wrote:
> Hi Nagesh,
>
> On 7/28/21 9:53 AM, nagesh shamnur wrote:
>>  Dear Group,
>>     When include newlib and libgloss under DEPENDS in custom recipe,
>>  then newlib compilation is successful however libgloss compilation
>>  fails since it is unable to find the needed include path under
>>  recipe-sysroot/usr/include. This patch is to fix this issue by
>>  including recipe-sysroot/usr/include while configuring libgloss.
>
> Many thanks for your patch corresponding to the fix that you found for
> your recent issue!
>
> The patch looks good, but next time, it would be even better if you
> could send it as an inline attachment (easiest to do with the "git
> send-email"  command). This makes it easier for people to review your
> patch and in particular directly quote parts of your patch and comment
> or reply on specific lines.


I overlooked your first message, in which you tried to send your patch
as an inline attachment. Unfortunately, saving the e-mail and then
trying to apply it with "git am" didn't work. I guess that's why you
sent it as a regular attachment. You wouldn't have had this issue if you
had sent it through "git send-email".

To allow "git send-email"  to send messages, there are details on
https://docs.yoctoproject.org/dev-manual/common-tasks.html#using-email-to-submit-a-patch

Since you have a Gmail account, you can configure git send-email to
directly send e-mail through your account:
git config --global sendemail.smtpserver smtp.googlemail.com
git config --global sendemail.smtpserverport 587
git config --global sendemail.smtpencryption tls
git config --global sendemail.smtpuser jdoe@gmail.com
git config --global sendemail.smtppass xxx

I haven't tested this recently though. I hope this helps.

Cheers,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

