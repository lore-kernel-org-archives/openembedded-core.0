Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id A728A6011B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2016 22:08:28 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id zm5so21939937pac.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2016 15:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=2D1S6jDBEW9GBi1hf2oKYeEdfsk9XkXxpc50QprpWSA=;
	b=fwPvcnUZa5y4/d3gW8mnfl8+THUQ2mksgVk1TSzszVHQGODoSTjUBKbQyj2YqlVWrc
	RKru+eWC20yxGFXTH1rj+5XNHdok11IzKlRIeyZdkXkCDuhafC/UtUEFQJZegj7AYbi3
	qeftS/yd5BPMK5f+pytaZw4W0lrtgTgtiqmja8TwbyEVoa1B1U5ff3a0sxxtRHVr7xoy
	U3Nd9MR51PqSmuS0tnrdzu5VAlL+ycQD3IhIEVp1iC1KLIZNlJ8aevqO7mzj0DjjHKDz
	Xj2TvaeqD90rxCfNSS/YVUh66tD1MqXh3lWliLjtH8JM1yNSSo0aMlqBgYg1fW9EtZEj
	EWOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=2D1S6jDBEW9GBi1hf2oKYeEdfsk9XkXxpc50QprpWSA=;
	b=mQI4dIx0+YRwV97D5k/UJdKjw0kFKbe/PQ8gjDF0P5BDx6yh/4rdrofcjvEuD9fR5s
	YiENxufeQNO2g+gSF97yW6W7WRhrSjiqN5t42usOM1gJxN9BImsTVQg1CePXhbKv3tLQ
	avlMv9wQmlqV0mksf3V7ii9nyLD3ePkk7+7ysO/aSVVf2iQjHCOk3m38AkrRd4akInS6
	eulQ/UVj9PuFBCZzOumCu5HMLZaiezZAK7X08xSad4ny7o5Y2WRPRSaQi/jgxjZleSRh
	cb/pTpb4GWUs1J+1Z11j1Ji9nWphQHLISgBgO3NV1SnD+5OG2cPxTAhJbL1I1s+Wo7mv
	CSBw==
X-Gm-Message-State: AD7BkJJUc/OrwRkteNo82w8T+U3euE7LoTyIt0GlvpI8r3ndkP9+dnNMsIv7Z6184kcSbg==
X-Received: by 10.66.140.39 with SMTP id rd7mr46342050pab.92.1459202908876;
	Mon, 28 Mar 2016 15:08:28 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:714a:4e59:1cde:8924?
	([2601:202:4000:1239:714a:4e59:1cde:8924])
	by smtp.googlemail.com with ESMTPSA id
	fn3sm38013603pab.20.2016.03.28.15.08.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 28 Mar 2016 15:08:27 -0700 (PDT)
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
References: <56F952F7.2010409@gmail.com>
	<CAP9ODKqPzybLhTyx8wz1xCpb4_4R0cXSsmYXB3dtLwc4scBbCg@mail.gmail.com>
	<56F99996.9010803@gmail.com>
	<CAP9ODKrhWXSrSR5HhWy0gRTzJ896EMuGZb1qJ9VnDV29VJjv7g@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <56F9AB56.2010707@gmail.com>
Date: Mon, 28 Mar 2016 15:08:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAP9ODKrhWXSrSR5HhWy0gRTzJ896EMuGZb1qJ9VnDV29VJjv7g@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Aarch64 u-boot with gcc .5x
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
X-List-Received-Date: Mon, 28 Mar 2016 22:08:28 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 03/28/2016 02:17 PM, Otavio Salvador wrote:
> On Mon, Mar 28, 2016 at 5:52 PM, akuster808 <akuster808@gmail.com> wrote:
>> On 03/28/2016 11:20 AM, Otavio Salvador wrote:
>>> On Mon, Mar 28, 2016 at 12:51 PM, akuster808 <akuster808@gmail.com> wrote:
>>>> I have an arm64 odroid c2 board.  If I build u-boot with the current OE
>>>> 5.3 gcc it hangs at kernel load time. If I use 4.9 gcc it works fine. A
>>>> 5.3 built kernel boots fine with a 4.9 built u-boot.
>>>>
>>>> The vendor supplied u-boot is hacked up and am leaning it that direction
>>>> as the culprit so I am looking for data points.
>>>>
>>>> Is anyone using a current u-boot with 5.3 gcc on an arm64 machine? if
>>>> so, any special tweaks to get that combo to work?
>>>
>>> I am using one ARM 64 SoC with GCC 5.2 at this moment and it works
>>> fine. What U-Boot version is the fork based on?
>>
>> 2015.01
> 
> Please try to use GCC 5.2 and see if it makes any difference. The BSP
> I am referring to is currently using it and it is working fine.
> 
> The forked version is the same. Of course, it may have changes which
> hides or solve the issue but it is a hint anyway.
ok. will try this next.

kind regards,
Armin

