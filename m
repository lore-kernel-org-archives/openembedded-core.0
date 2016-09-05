Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id BC87D773D0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Sep 2016 19:47:48 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3sSgHm5Vpkz3hjTs;
	Mon,  5 Sep 2016 21:47:48 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 3sSgHm596Jzvknn;
	Mon,  5 Sep 2016 21:47:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavisd-new,
	port 10024)
	with ESMTP id Gzyac9dAH5Lw; Mon,  5 Sep 2016 21:47:47 +0200 (CEST)
X-Auth-Info: 7q4CtBt1aZtRXkAEYoLpArHYN4NZweixFolPV19pU6U=
Received: from [IPv6:::1] (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Mon,  5 Sep 2016 21:47:47 +0200 (CEST)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>
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
From: Marek Vasut <marex@denx.de>
Message-ID: <1a682b94-a0e2-cc93-92c3-f97e5abf4edd@denx.de>
Date: Mon, 5 Sep 2016 21:47:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.2.0
MIME-Version: 1.0
In-Reply-To: <1473104036.20226.16.camel@linuxfoundation.org>
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
X-List-Received-Date: Mon, 05 Sep 2016 19:47:51 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 09/05/2016 09:33 PM, Richard Purdie wrote:
> On Mon, 2016-09-05 at 13:26 -0300, Otavio Salvador wrote:
>> On Mon, Sep 5, 2016 at 1:24 PM, Marek Vasut <marex@denx.de> wrote:
>>>
>>> On 09/05/2016 06:22 PM, Otavio Salvador wrote:
>>>>
>>>> On Mon, Sep 5, 2016 at 1:16 PM, Marek Vasut <marex@denx.de>
>>>> wrote:
>>>> I would love to see the proposed patches.
>>>>
>>> That'd depend on whether they'd be NAK'd right away for breaking
>>> BSPs or
>>> not.
>> It will depends on the type of breakage and the benefits it puts on
>> the table.
> 
> I would note that we are past feature freeze at this point and I'm
> struggling to get stability in the patches we have queued without
> anything in addition to that.
> 
> If there is a pressing attractive reason we should do this now I'm
> willing to listen but it might be better waiting for 2.3...

Definitely wait for 2.3 with any disruptive changes please.

U-Boot 2016.09 will be out on september 12th, but I don't know if that
can make it into 2.2 release. I can certainly send a patch to update
the recipe.

-- 
Best regards,
Marek Vasut

