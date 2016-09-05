Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-vk0-f42.google.com (mail-vk0-f42.google.com
	[209.85.213.42])
	by mail.openembedded.org (Postfix) with ESMTP id 64C2E6FF9F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Sep 2016 19:52:23 +0000 (UTC)
Received: by mail-vk0-f42.google.com with SMTP id j189so74366151vkc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Sep 2016 12:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=hlwbESZnL3draJkeQO7dGOqi/3HT4ThVPozC0BvcOOw=;
	b=JhiJBOBbIV2VdJoHrTaVbuWB+PnVZXu1noBBYzIgIcY6l52XvXtr94nPKb7x/MunpX
	w8KM71pO1k1PWNEBm09us+uX7Wi95ttnIu8zh86zLrQYhZhntH82REtYzAIDhqt2Winl
	jSe3bfyH1hi+9AfPW0vN//V4otdyxlmZEl3gkzWBM8LpKeaDbmvEdGO83KzVbpt7B+Fa
	HCds74Cll2//ZaCzeQDFMbbfVS8whXqbs91i8QXiKcTvf/bmnn9aHwvE8iq7AkXfiwxg
	ipChsQTnk3s29qmMgIBS2LzDi1KnQyb2yZ0uIQDk3iJhmgJkPP0QdOKK1lq5LnzJlEIP
	Ixag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=hlwbESZnL3draJkeQO7dGOqi/3HT4ThVPozC0BvcOOw=;
	b=HFxkqb5ku+A0kV7oJl0iU5TChCqtwoeckHbnS+QOpIeo4kBkkdceKpv6dY2EN2bsmo
	LxySK6v1J4JGAqPjYGNQPgNLJH024tSfHoJTIjhzsuNCERpjkqefF9kBs5nUU5bBfF+S
	CJz+AB2pxl9ZIETwghECsFbvbLPAah7tu/gowZZa/Tf13iW++OnmjoIgrvnhKj68V2kD
	pwEH2+5R91mZ5AA0Q8HWiUJqiS956i92UTeJa5nTx/PDr4PTa5biLdZr1N+Ven1/fuLI
	GoPPj1n3+659mkdGwQgytosMhBAL6G+ulFUjwc1JstO3h+XhB99+tkMEoXoWq0v8xEWh
	kL/g==
X-Gm-Message-State: AE9vXwMoWYRZDxkD7+tekIs1FfibhHd4B34kUpH/bzsZhgBoTDt46bwiKdDXSxQUgqe25w==
X-Received: by 10.31.4.85 with SMTP id 82mr23317113vke.155.1473105144073;
	Mon, 05 Sep 2016 12:52:24 -0700 (PDT)
Received: from mail-ua0-f170.google.com (mail-ua0-f170.google.com.
	[209.85.217.170]) by smtp.gmail.com with ESMTPSA id
	m190sm1962315vke.7.2016.09.05.12.52.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Sep 2016 12:52:22 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ua0-f170.google.com with SMTP id i32so237514222uai.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Sep 2016 12:52:22 -0700 (PDT)
X-Received: by 10.176.64.161 with SMTP id i30mr18833683uad.107.1473105141728; 
	Mon, 05 Sep 2016 12:52:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.154.68 with HTTP; Mon, 5 Sep 2016 12:52:20 -0700 (PDT)
In-Reply-To: <1a682b94-a0e2-cc93-92c3-f97e5abf4edd@denx.de>
References: <20160904162130.13313-1-marex@denx.de>
	<1473024487.20226.3.camel@linuxfoundation.org>
	<9f3a5dfd-8303-b6d0-cd5e-07f2aac7c588@denx.de>
	<1473027091.20226.4.camel@linuxfoundation.org>
	<252ea4f7-871c-60a5-0a2f-f59a5d35683e@denx.de>
	<00e9ef55-2e08-5c92-0a5a-32e9ce1f61fa@denx.de>
	<1473073354.20226.9.camel@linuxfoundation.org>
	<1fbc36ad-f031-9f85-7861-1ba302273ace@denx.de>
	<CAP9ODKqO1ffXbra1QU0F6CwyXWW2sU5A9UoSuXeNtyMu=DbHAg@mail.gmail.com>
	<15ec9cec-d76f-233e-486a-89afb93083de@denx.de>
	<CAP9ODKp_ypN2JVrbcLnaHW_Unsr5N8eMD8-+4s_FQWjdg0AnqQ@mail.gmail.com>
	<d3411db9-1d02-d493-72e6-e85625f849a9@denx.de>
	<CAP9ODKpB9ofyxgNJtt3DpxNiVzKvF_ta708xZvj9vuNUZFyoAg@mail.gmail.com>
	<1473104036.20226.16.camel@linuxfoundation.org>
	<1a682b94-a0e2-cc93-92c3-f97e5abf4edd@denx.de>
Date: Mon, 5 Sep 2016 16:52:20 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpZ+jeZ46rHbqz3jnDtGrhi1Nh+x8Et4-JkxEPzdLj5Lg@mail.gmail.com>
Message-ID: <CAP9ODKpZ+jeZ46rHbqz3jnDtGrhi1Nh+x8Et4-JkxEPzdLj5Lg@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] u-boot: Factor out common bits
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
X-List-Received-Date: Mon, 05 Sep 2016 19:52:24 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Sep 5, 2016 at 4:47 PM, Marek Vasut <marex@denx.de> wrote:
> On 09/05/2016 09:33 PM, Richard Purdie wrote:
>> On Mon, 2016-09-05 at 13:26 -0300, Otavio Salvador wrote:
>>> On Mon, Sep 5, 2016 at 1:24 PM, Marek Vasut <marex@denx.de> wrote:
>>>>
>>>> On 09/05/2016 06:22 PM, Otavio Salvador wrote:
>>>>>
>>>>> On Mon, Sep 5, 2016 at 1:16 PM, Marek Vasut <marex@denx.de>
>>>>> wrote:
>>>>> I would love to see the proposed patches.
>>>>>
>>>> That'd depend on whether they'd be NAK'd right away for breaking
>>>> BSPs or
>>>> not.
>>> It will depends on the type of breakage and the benefits it puts on
>>> the table.
>>
>> I would note that we are past feature freeze at this point and I'm
>> struggling to get stability in the patches we have queued without
>> anything in addition to that.
>>
>> If there is a pressing attractive reason we should do this now I'm
>> willing to listen but it might be better waiting for 2.3...
>
> Definitely wait for 2.3 with any disruptive changes please.
>
> U-Boot 2016.09 will be out on september 12th, but I don't know if that
> can make it into 2.2 release. I can certainly send a patch to update
> the recipe.

I would support its addition; the risk of it is small and the set of
reference BSP is also small so should be fine.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

