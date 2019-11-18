Return-Path: <hs@denx.de>
X-Greylist: delayed 476 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 18 Nov 2019 08:59:48 UTC
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 3F6B57F943
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 08:59:48 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 47GjPM728rz1qql7;
	Mon, 18 Nov 2019 09:51:51 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 47GjPM62vCz1qqty;
	Mon, 18 Nov 2019 09:51:51 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id s7HWB0AriXKb; Mon, 18 Nov 2019 09:51:48 +0100 (CET)
X-Auth-Info: B3do9fd74h0hDqyFMkthFagGhTa1+lGLK5YNxVi8MAw=
Received: from [192.168.1.106] (82-131-135-97.pool.digikabel.hu
	[82.131.135.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Mon, 18 Nov 2019 09:51:48 +0100 (CET)
To: openembedded-core@lists.openembedded.org
References: <20190920042112.14832-1-hs@denx.de>
	<09ae8961-2b77-b38f-374b-a1f1c9ee8d5e@denx.de>
Reply-To: hs@denx.de
From: Heiko Schocher <hs@denx.de>
Message-ID: <140626d6-0890-c2e1-0425-9e7e7a1a5fc3@denx.de>
Date: Mon, 18 Nov 2019 09:51:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <09ae8961-2b77-b38f-374b-a1f1c9ee8d5e@denx.de>
Cc: Julius Werner <jwerner@chromium.org>
Subject: Re: [PATCH v2] kernel.fitimage.bbclass: remove ramdisk_ctype
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
X-List-Received-Date: Mon, 18 Nov 2019 08:59:48 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hello all,

Am 07.10.2019 um 15:42 schrieb Heiko Schocher:
> Hello all,
> 
> Am 20.09.2019 um 06:21 schrieb Heiko Schocher:
>> set in the ramdisk node the compression property
>> always to "none", as U-Boot nowadays since commit:
>>
>> b1307f884a91 ("fit: Support compression for non-kernel components (e.g. FDT)")
>>
>> decompress non kernel components. Setting compression
>> to the used comression algorithm now, will end in
>> fail of your kernel boot with the ramdisk.
>>
>> This issue is fixed since commit:
>>
>> bddd98573465 ("fit: Do not automatically decompress ramdisk images")
>>
>> which now prints a warning in U-Boot, instead of decompressing
>> the ramdisk, but we should setup compression property correct.
>>
>> Signed-off-by: Heiko Schocher <hs@denx.de>
>> ---
>>
>> Changes in v2:
>> - resend patch to  openembedded-core@lists.openembedded.org instead
>>    to Yocto Project <yocto@yoctoproject.org> as Ross suggested. No
>>    changes in code.
> 
> gentle ping. Any comments?

gentle ping ...

bye,
Heiko

-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-52   Fax: +49-8142-66989-80   Email: hs@denx.de

