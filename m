Return-Path: <Zubair.Kakakhel@imgtec.com>
Received: from mailapp01.imgtec.com (mailapp01.imgtec.com [195.59.15.196])
	by mail.openembedded.org (Postfix) with ESMTP id EA890719D0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 11:37:30 +0000 (UTC)
Received: from HHMAIL01.hh.imgtec.org (unknown [10.100.10.19])
	by Forcepoint Email with ESMTPS id 2781E98AD885F;
	Thu, 10 Nov 2016 11:37:28 +0000 (GMT)
Received: from zkakakhel-linux.le.imgtec.org (192.168.154.45) by
	HHMAIL01.hh.imgtec.org (10.100.10.21) with Microsoft SMTP Server (TLS)
	id 14.3.294.0; Thu, 10 Nov 2016 11:37:30 +0000
To: Khem Raj <raj.khem@gmail.com>, "Burton, Ross" <ross.burton@intel.com>
References: <20161108171235.41837-1-Zubair.Kakakhel@imgtec.com>
	<20161108171235.41837-13-Zubair.Kakakhel@imgtec.com>
	<CAJTo0LZTHPYsot=YkNGXh=p2AP37X89JqW2xMgdYjanftpDxxQ@mail.gmail.com>
	<5ac79668-0555-5329-e9d3-048ee217d3ff@gmail.com>
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Message-ID: <7e997c0b-1fe2-5881-f977-48b180b36545@imgtec.com>
Date: Thu, 10 Nov 2016 11:37:29 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <5ac79668-0555-5329-e9d3-048ee217d3ff@gmail.com>
X-Originating-IP: [192.168.154.45]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [Patch v2 12/14] ltp: Reduce duplication in MIPS variants.
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
X-List-Received-Date: Thu, 10 Nov 2016 11:37:31 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 11/09/2016 12:46 AM, Khem Raj wrote:
>
>
> On 11/8/16 4:13 PM, Burton, Ross wrote:
>>
>> On 8 November 2016 at 17:12, Zubair Lutfullah Kakakhel
>> <Zubair.Kakakhel@imgtec.com <mailto:Zubair.Kakakhel@imgtec.com>> wrote:
>>
>>     Reduce duplication in MIPS variants now that the MACHINEOVERRIDES
>>     variable is defined
>>
>>
>> I'm guessing that this is the cause of this error for qemumips64:
>>
>> http://errors.yoctoproject.org/Errors/Details/99744/
>
> seems to be yes.

I can't seem to be able to reproduce this error using just my patches on top of poky master.

Regards,
ZubairLK

>
>>
>> Ross
>>
>>
>

