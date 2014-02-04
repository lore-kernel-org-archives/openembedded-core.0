Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f177.google.com (mail-yk0-f177.google.com
	[209.85.160.177])
	by mail.openembedded.org (Postfix) with ESMTP id 46F716E944
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Feb 2014 12:12:17 +0000 (UTC)
Received: by mail-yk0-f177.google.com with SMTP id 19so46958810ykq.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Feb 2014 04:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=xwbGBeHeKR+Ss/UaRjWKiSEDuaGH1I+xkaB5TVMR+Zc=;
	b=Aqxqtc9lb9WH8xT0cF7dzi47xldF9S6ffDR5xZi6DNYKUdXx3j6YEapeZ0FNHggwxD
	51z3hcacmZB6u5LiRILL6Tx8luTGvVpDdY1EODGNoFUB4l/odx/VCiH7ygVckCBmj3oc
	Jlr8xFv2MIVpndJ4hrvzz3IBoMzXrYNBqJWEE64XlyaGMBkX2MBIn7Ef7Z0G5M/aD0gL
	LZ3D3/12y45jb0hufWzno4bmyEBaV4ohnJZnSnmLx/sag26oVG224PnbH1nbAK4fmvbJ
	fmfBiBxITIHkRY88ws5YGtEO3uBYDCgKeaxgNrcYtsRy4yE+4a4lSUf64ntWgPrOWGlD
	GD1g==
MIME-Version: 1.0
X-Received: by 10.236.158.226 with SMTP id q62mr38779814yhk.2.1391515937444;
	Tue, 04 Feb 2014 04:12:17 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.62.84 with HTTP; Tue, 4 Feb 2014 04:12:17 -0800 (PST)
In-Reply-To: <52F0CE9B.7060601@linaro.org>
References: <1390297632-9966-1-git-send-email-koen.kooi@linaro.org>
	<1390312633.874.84.camel@ted> <52DE7E17.2090301@linaro.org>
	<1390316993.874.85.camel@ted> <52F0ABC7.1010908@linaro.org>
	<1391506325.22620.12.camel@ted>
	<CAP9ODKr7Ypt08VYjnZ=1rmmwh-Ri+qjWwc4L9yiF=iw8dE2ArQ@mail.gmail.com>
	<52F0CE9B.7060601@linaro.org>
Date: Tue, 4 Feb 2014 10:12:17 -0200
X-Google-Sender-Auth: x81O0fHzmsNwiNCizjFy6sjUsks
Message-ID: <CAP9ODKr7n45Drm0EG-VK=G2B-YQLaEsQk9wPjqckukw=ic7DwA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Koen Kooi <koen.kooi@linaro.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH] package.bbclass: fix strip and split logic
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Feb 2014 12:12:19 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 4, 2014 at 9:27 AM, Koen Kooi <koen.kooi@linaro.org> wrote:
> On 02/04/2014 12:20 PM, Otavio Salvador wrote:
>>
>> Hello Richard,
>>
>> On Tue, Feb 4, 2014 at 7:32 AM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>>>
>>> On Tue, 2014-02-04 at 09:58 +0100, Koen Kooi wrote:
>>>>
>>>> On 01/21/2014 04:09 PM, Richard Purdie wrote:
>>>>>
>>>>> On Tue, 2014-01-21 at 15:03 +0100, Koen Kooi wrote:
>>>>>>
>>>>>> On 01/21/2014 02:57 PM, Richard Purdie wrote:
>>>>>>>
>>>>>>> On Tue, 2014-01-21 at 10:47 +0100, Koen Kooi wrote:
>>>>>
>>>>> I'm ok with it in principle but I'd like to see known build issues
>>>>> fixed
>>>>> before it goes in since red autobuilders cause me enough grief
>>>>> already ;-).
>>>>
>>>>
>>>> What's the status on this? I know a fix went into meta-intel (albeit it
>>>> in a legally questionable way, but that's their problem) and the other
>>>> affected layers have received patches for it.
>>>
>>>
>>> The last test build I ran:
>>>
>>>
>>> http://autobuilder.yoctoproject.org/main/builders/nightly-fsl-arm/builds/10/steps/BuildImages_1/logs/stdio
>>>
>>> still shows an error in the fsl-arm layer which I suspect is from this.
>>> I was hoping that could get fixed before it merges, its very much still
>>> in the queue though.
>>>
>>> I won't wait forever, equally, maintaining the green builds is proving
>>> to consume a lot of my time and if I can avoid adding more failures, I'd
>>> prefer to do so.
>>
>> I asked two fixes for Koen in the patch and I am awaiting this to
>> apply his patches.
>
> And I already said I'm not planning to jump through more hoops just to get
> this patch into OE-core.

Sorry Koen but I think as you send the patch you should send the reviewed one.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

