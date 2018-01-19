Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id DA5737827A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jan 2018 21:46:56 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3zNZD11DPsz1qvP0;
	Fri, 19 Jan 2018 22:46:57 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 3zNZD110sTz1qql7;
	Fri, 19 Jan 2018 22:46:57 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id uQBtoYogacvC; Fri, 19 Jan 2018 22:46:56 +0100 (CET)
X-Auth-Info: nIS2l0p7c2r6N+h/QkB+NDEuEFdMcfdOHTqehmuYBbU=
Received: from [IPv6:::1] (unknown [195.140.253.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Fri, 19 Jan 2018 22:46:56 +0100 (CET)
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
References: <20180119174502.4010-1-marex@denx.de>
	<CAP9ODKrRAAc+X4aocnrpLhC=znP5thMw9jxh462TUHZMWsoO3Q@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <1518fd89-c875-1ced-aca6-8f4e53f65548@denx.de>
Date: Fri, 19 Jan 2018 22:46:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAP9ODKrRAAc+X4aocnrpLhC=znP5thMw9jxh462TUHZMWsoO3Q@mail.gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Upgrade to 2018.01 release
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
X-List-Received-Date: Fri, 19 Jan 2018 21:46:57 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01/19/2018 07:18 PM, Otavio Salvador wrote:
> On Fri, Jan 19, 2018 at 3:45 PM, Marek Vasut <marex@denx.de> wrote:
>> This upgrades the U-Boot from 2017.11 to 2018.01 release
>> and drops patches accepted upstream.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
> 
> Acked-by: Otavio Salvador <otavio@ossystems.com.br>
> 
> ...
>>      file://MPC8315ERDB-enable-DHCP.patch \
> 
> Please send this patch for next release so we can drop it as well.

Look up the previous thread on why this patch is still here ...

-- 
Best regards,
Marek Vasut

