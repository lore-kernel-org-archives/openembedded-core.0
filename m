Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 124E26C4A7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 15:55:23 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 42zqzY3hGyz1qxDl;
	Tue, 20 Nov 2018 16:55:21 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 42zqzY1by5z1qqkp;
	Tue, 20 Nov 2018 16:55:21 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id 43HjzBjXivbg; Tue, 20 Nov 2018 16:55:19 +0100 (CET)
X-Auth-Info: d/SVtag+4xW+Y4NumSRrzkuNliz8ymRMx8JYD9DVZv4=
Received: from [IPv6:::1] (unknown [195.140.253.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Tue, 20 Nov 2018 16:55:19 +0100 (CET)
To: Alexey Brodkin <alexey.brodkin@synopsys.com>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>
References: <20181119100443.2882-1-abrodkin@synopsys.com>
	<1fd9e473-66ba-bbb8-87a9-32bb78e359e3@denx.de>
	<20181119190835.GO11247@bill-the-cat>
	<CAP9ODKr6JkJ0HpOWMKXy6_qN61vwU=41xEAOveyzfqPnVqEcbQ@mail.gmail.com>
	<153f5864c09a48adb8c976d8671f3c46@XBOX04.axis.com>
	<CAJTo0LY=m+Y8HXgypQ0Jk0N1=ke6eopXjEOeYWNENJ83CJO8ZQ@mail.gmail.com>
	<CAJTo0Laecf+PnBPcg9qgHABvGwBEr+n7Sze3-OPp3OvbYBvJmw@mail.gmail.com>
	<CAP9ODKqKDfJ11FLoXFwRZ3ttw4v3NODWEQdB7RkCAzHq7DWPiw@mail.gmail.com>
	<4881796E12491D4BB15146FE0209CE6468197CB6@DE02WEMBXB.internal.synopsys.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <9dd84973-bf3b-436b-96b0-f236c3f15787@denx.de>
Date: Tue, 20 Nov 2018 16:55:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <4881796E12491D4BB15146FE0209CE6468197CB6@DE02WEMBXB.internal.synopsys.com>
Cc: Tom Rini <trini@konsulko.com>, Otavio Salvador <otavio@ossystems.com.br>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	"linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Subject: Re: [PATCH v3] u-boot: Add mkenvimage tool
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
X-List-Received-Date: Tue, 20 Nov 2018 15:55:24 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/20/2018 04:52 PM, Alexey Brodkin wrote:
> Hi Otavio,
> 
>> -----Original Message-----
>> From: Otavio Salvador [mailto:otavio.salvador@ossystems.com.br]
>> Sent: Tuesday, November 20, 2018 6:49 PM
>> To: Burton, Ross <ross.burton@intel.com>
>> Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; Marek Vasut <marex@denx.de>; Tom Rini <trini@konsulko.com>; Otavio
>> Salvador <otavio@ossystems.com.br>; Alexey Brodkin <alexey.brodkin@synopsys.com>; Patches and discussions about the oe-core
>> layer <openembedded-core@lists.openembedded.org>; linux-snps-arc@lists.infradead.org
>> Subject: Re: [OE-core] [PATCH v3] u-boot: Add mkenvimage tool
>>
>> On Tue, Nov 20, 2018 at 1:40 PM Burton, Ross <ross.burton@intel.com> wrote:
>>>
>>> (hit sent too early)
>>>
>>> Of course how big are these tools, and is it really useful splitting
>>> them up?  If we're talking a 10k binary, is putting them in separate
>>> packages worth the complication?
>>
>> I think it makes sense to split; we are building an embedded system
>> build system and granular installation is a must have. Using PN to
>> install all tools is a win win combination.
> 
> Please note we're discussing _host_ tools here!
> So do we really care if there's one more utility installed on development host?
> 
> And if someone installs those U-Boot host utilities on the target then most probably
> this target is not super embedded any longer.

You can use mkenvimage on target, I had to do that a few times.

-- 
Best regards,
Marek Vasut

