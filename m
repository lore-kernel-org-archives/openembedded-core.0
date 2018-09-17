Return-Path: <marex@denx.de>
X-Greylist: delayed 503 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 17 Sep 2018 11:43:00 UTC
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id D4A0F745A6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2018 11:43:00 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 42DPDG45Gfz1qvnq;
	Mon, 17 Sep 2018 13:34:38 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 42DPDG3Kvpz1r45J;
	Mon, 17 Sep 2018 13:34:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id atIjaLUOtego; Mon, 17 Sep 2018 13:34:37 +0200 (CEST)
X-Auth-Info: UGFF/raSEuhRmmQNDKIDDqSQeAWnN4FlbpqTLckFnwI=
Received: from [IPv6:::1] (unknown [195.140.253.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Mon, 17 Sep 2018 13:34:37 +0200 (CEST)
To: akuster808 <akuster808@gmail.com>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Otavio Salvador <otavio@ossystems.com.br>
References: <20180916211625.18597-1-otavio@ossystems.com.br>
	<20180916211625.18597-4-otavio@ossystems.com.br>
	<CAP9ODKoKv05L0=NVUnY7LamEbjsZwTgsAqnNokQr8KS64SThBQ@mail.gmail.com>
	<690c79c0-b182-a2ff-997e-a978ed2d9be4@gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <bd66a65d-9a04-06ca-49ab-352697d7f30f@denx.de>
Date: Mon, 17 Sep 2018 13:34:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <690c79c0-b182-a2ff-997e-a978ed2d9be4@gmail.com>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>, Tom Rini <trini@konsulko.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] u-boot: Upgrade 2018.07 -> 2018.09
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
X-List-Received-Date: Mon, 17 Sep 2018 11:43:01 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 09/17/2018 03:57 AM, akuster808 wrote:
> 
> 
> On 09/16/2018 06:14 PM, Otavio Salvador wrote:
>> On Sun, Sep 16, 2018 at 6:16 PM Otavio Salvador <otavio@ossystems.com.br> wrote:
>>> This upgrades U-Boot to 2018.09 release and drop the backported
>>> security fixes which are now included upstream.
>>>
>>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> When I mentioned, on IRC, about this bump to Marek, he mentioned that
>> there is a regression on x86 being worked on upstream so this patch
>> should wait for this to be sorted out before we update it.
> 
> What is the difference in regression when there is a kernel issue
> identified after they release or any other package update?
> 
> Granted this most likely wont make 2.6 so is a moot point in 6 months. 
> Is there a benefit to the many over the few with this?

Nah, 2018.07 is fine.

-- 
Best regards,
Marek Vasut

