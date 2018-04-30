Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 263AC71957
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2018 17:42:47 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 40ZX1h3m5Wz1qwQd;
	Mon, 30 Apr 2018 19:42:48 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 40ZX1h2jjHz1qqkX;
	Mon, 30 Apr 2018 19:42:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id Oz32xuLGURKB; Mon, 30 Apr 2018 19:42:47 +0200 (CEST)
X-Auth-Info: vQY6b6TrRyY5l9T/iJagXPd28yaKkFML6NlhW+DycKM=
Received: from [IPv6:::1] (unknown [195.140.253.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Mon, 30 Apr 2018 19:42:47 +0200 (CEST)
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
References: <20180427145139.30732-1-lukma@denx.de>
	<fe2ffe1d-6695-f0bd-dc6c-d5345bcfbc3f@denx.de>
	<20180427181521.1bc4095c@jawa>
	<39086351-ed53-3cf5-606e-3b17bd95d825@denx.de>
	<CAP9ODKp5xiLTCrZNz0z9EhmqDO45CWX23ovBLkUQZi7svXRZMA@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <ac52bd88-f522-100f-9ba5-8e14ffe9219a@denx.de>
Date: Mon, 30 Apr 2018 19:32:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAP9ODKp5xiLTCrZNz0z9EhmqDO45CWX23ovBLkUQZi7svXRZMA@mail.gmail.com>
Cc: Tom Rini <trini@konsulko.com>, Stefan Agner <stefan.agner@toradex.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Add {gen|deploy}_default_envs tasks to generate environment images
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
X-List-Received-Date: Mon, 30 Apr 2018 17:42:48 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04/30/2018 04:03 PM, Otavio Salvador wrote:
> On Fri, Apr 27, 2018 at 2:37 PM Marek Vasut <marex@denx.de> wrote:
> 
>> On 04/27/2018 06:15 PM, Lukasz Majewski wrote:
>>> I can add this functionality as a separate recipe. This is v1, so ideas
>>> are welcome.
> 
>> I think that only makes sense.
> 
> Also, we likely need to make use of the mkimage recipe so we use the tools
> and not build it all again.

And -- based on the offlist discussion -- I realized that env tools are
machine specific, they bundle default env with them.

-- 
Best regards,
Marek Vasut

