Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web12.6008.1622194847882805865
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 May 2021 02:40:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id 0E82C24000A;
	Fri, 28 May 2021 09:40:44 +0000 (UTC)
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [OE-core] [PATCH] package_rpm: pass XZ_THREADS to rpm
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Alexander Kanavin <alex.kanavin@gmail.com>, Ross Burton <ross@burtonini.com>
References: <20210526145910.3930141-1-ross.burton@arm.com>
 <CANNYZj_3=8Fg2pBPQt5SYVD6QZpN=UfVC1+_Ndupiuf4-Grcpw@mail.gmail.com>
 <f3e694df4726cc21060cb296a8c6b0848f4e6c96.camel@linuxfoundation.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <35812cdf-2e32-6ced-dd10-068b5d61b10a@bootlin.com>
Date: Fri, 28 May 2021 11:40:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <f3e694df4726cc21060cb296a8c6b0848f4e6c96.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hello,

Adding this docs@ mailing list too, because I have a documentation
related question...

On 5/26/21 7:10 PM, Richard Purdie wrote:
> On Wed, 2021-05-26 at 18:30 +0200, Alexander Kanavin wrote:
>> What  happens if XZ_THREADS isn't set?
> It is given a default in bitbake.conf so you'd have to go out 
> of your way to do it...

This makes me realize that the XZ_ variables defined in bitbake.conf
don't appear anywhere in the documentation.

Would it make sense to add them to the documentation too, or would it be
overwhelming to document all possible variables, which default values
should just work fine?

Cheers,

Michael

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

