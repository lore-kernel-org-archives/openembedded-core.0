Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web12.5238.1604569797628422465
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2020 01:49:58 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: a.fatoum@pengutronix.de)
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[127.0.0.1])
	by metis.ext.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1kabty-0007wT-PE; Thu, 05 Nov 2020 10:49:54 +0100
Subject: Re: [OE-core] [PATCH] vim: add nativesdk to BBCLASSEXTEND
To: Nathan Rossi <nathan@nathanrossi.com>
Cc: openembedded-core@lists.openembedded.org
References: <20201104131745.397780-1-nathan@nathanrossi.com>
 <574f594f-cdbf-0465-dc5e-5ca1033df19a@pengutronix.de>
 <CA+aJhH1BM+PmLEKPyQnUYLX8MLkh9gNFKa5oewsZY-bmpgxGfg@mail.gmail.com>
From: "Ahmad Fatoum" <a.fatoum@pengutronix.de>
Message-ID: <6f81e2cc-4885-e738-8f36-cab6d3b291ac@pengutronix.de>
Date: Thu, 5 Nov 2020 10:49:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CA+aJhH1BM+PmLEKPyQnUYLX8MLkh9gNFKa5oewsZY-bmpgxGfg@mail.gmail.com>
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hello,

On 11/5/20 2:30 AM, Nathan Rossi wrote:
> On Wed, 4 Nov 2020 at 23:32, Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
>> On 11/4/20 2:17 PM, Nathan Rossi wrote:
>>> Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
>>> ---
>>>  meta/recipes-support/vim/vim_8.2.bb | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta/recipes-support/vim/vim_8.2.bb b/meta/recipes-support/vim/vim_8.2.bb
>>> index 709b6ddb55..7e4654e472 100644
>>> --- a/meta/recipes-support/vim/vim_8.2.bb
>>> +++ b/meta/recipes-support/vim/vim_8.2.bb
>>> @@ -3,7 +3,7 @@ require vim.inc
>>>  PROVIDES = "xxd"
>>>
>>>  PACKAGECONFIG_class-native = ""
>>> -BBCLASSEXTEND = "native"
>>> +BBCLASSEXTEND = "native nativesdk"
>>
>> Apologies if this is self-evident, but why should nativesdk be added here?
> 
> It should be added so that vim can be included as part of a
> buildtools-tarball/sdk. It is useful to be able to provide an editor
> in a relatocable form, for when hosts do not provide an editor. It is
> also useful for the xxd tool.

I see. Thanks!

>> A commit message explaining the why would be quite helpful.
> 
> Sorry, I've made quite a few of these mechanical add nativesdk patches
> recently, and in the past. The reason for the change is almost always
> for sdk/buildtools-tarball. I can add the above description if that
> explanation is sufficient?

I'd appreciate that. I am trying to read along to get more familiar with OE
and commit messages make this considerably easier.

Cheers,
Ahmad

> 
> Regards,
> Nathan
> 
>>
>>>
>>>  ALTERNATIVE_${PN}_append = " xxd"
>>>  ALTERNATIVE_TARGET[xxd] = "${bindir}/xxd"
>>> ---
>>> 2.28.0
>>>
>>>
>>>
>>> 
>>>
>>
>> --
>> Pengutronix e.K.                           |                             |
>> Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
>> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
>> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
