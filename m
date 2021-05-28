Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web12.9623.1622215329216504631
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 May 2021 08:22:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id E58F1E0008;
	Fri, 28 May 2021 15:22:06 +0000 (UTC)
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Alexander Kanavin <alex.kanavin@gmail.com>,
 OE-core <openembedded-core@lists.openembedded.org>,
 YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [OE-core] [PATCH] package_rpm: pass XZ_THREADS to rpm
To: Ross Burton <ross@burtonini.com>
References: <20210526145910.3930141-1-ross.burton@arm.com>
 <CANNYZj_3=8Fg2pBPQt5SYVD6QZpN=UfVC1+_Ndupiuf4-Grcpw@mail.gmail.com>
 <f3e694df4726cc21060cb296a8c6b0848f4e6c96.camel@linuxfoundation.org>
 <35812cdf-2e32-6ced-dd10-068b5d61b10a@bootlin.com>
 <CAAnfSTtvb9B19W7GjJwpzjsCo01-fB++_AF8x3nPutOwjyUoZQ@mail.gmail.com>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <5a6d2044-b92c-2234-a431-0a1cfdc2aca3@bootlin.com>
Date: Fri, 28 May 2021 17:22:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAAnfSTtvb9B19W7GjJwpzjsCo01-fB++_AF8x3nPutOwjyUoZQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Ross,

On 5/28/21 12:03 PM, Ross Burton wrote:
> On Fri, 28 May 2021 at 10:40, Michael Opdenacker
> <michael.opdenacker@bootlin.com> wrote:
>> This makes me realize that the XZ_ variables defined in bitbake.conf
>> don't appear anywhere in the documentation.
>>
>> Would it make sense to add them to the documentation too, or would it be
>> overwhelming to document all possible variables, which default values
>> should just work fine?
> This should most likely be documented, albeit maybe only in the
> reference as it's not really a common tweak.


Thanks for your guidance. Will do :)

Cheers,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

