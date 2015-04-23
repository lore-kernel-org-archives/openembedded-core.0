Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 850766AC24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Apr 2015 18:31:02 +0000 (UTC)
Received: from [192.168.178.14] (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 9603131DD1;
	Thu, 23 Apr 2015 20:30:53 +0200 (CEST)
Message-ID: <55393A64.4050800@pseudoterminal.org>
Date: Thu, 23 Apr 2015 20:31:00 +0200
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1429557428-20033-1-git-send-email-dv@pseudoterminal.org>
	<CAP9ODKoikygfbhSMMHUk9pPHhvbM9vav_ArAZ7gufTm5s0H_SA@mail.gmail.com>
In-Reply-To: <CAP9ODKoikygfbhSMMHUk9pPHhvbM9vav_ArAZ7gufTm5s0H_SA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot.inc: make sure all counter variables are properly unset
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
X-List-Received-Date: Thu, 23 Apr 2015 18:31:02 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

It is in master, which is nice. But not in fido? Is it too late for 
fixes like these? If so, I'll have to backport this fix into 
meta-fsl-arm-extra for the cubox-i uboot.
Otherwise, if it is to be reviewed for inclusion into fido, I'm fine 
with that.

Am 2015-04-20 um 21:31 schrieb Otavio Salvador:
> On Mon, Apr 20, 2015 at 4:17 PM, Carlos Rafael Giani
> <dv@pseudoterminal.org> wrote:
>> The script does "i == j" checks to retrieve the config <-> type pairs from
>> the UBOOT_MACHINE and UBOOT_CONFIG lists. This check however requires both
>> j and i to be initially unset. Ensure this by explicitely unsetting i.
>>
>> This fixes broken u-boot SPL installations with SolidRun machines
>> (the SPL wasn't being installed and deployed.)
>>
>> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
> Acked-by: Otavio Salvador <otavio@ossystems.com.br>
>
> Richard, this needs to be applied into master and fido branches.
>


