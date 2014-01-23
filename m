Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 38D956B05F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 08:23:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s0N8NHQR026035
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 23 Jan 2014 00:23:18 -0800 (PST)
Received: from [128.224.162.164] (128.224.162.164) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Thu, 23 Jan 2014 00:23:16 -0800
Message-ID: <52E0D180.7030402@windriver.com>
Date: Thu, 23 Jan 2014 16:23:28 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
References: <cover.1390184362.git.Qi.Chen@windriver.com>	<a023434c6cc916907f190acd62af34ea5a6eaca0.1390184362.git.Qi.Chen@windriver.com>	<143aeafa800.2760.0f39ed3bcad52ef2c88c90062b7714dc@gmail.com>	<52DCDFB6.2070801@windriver.com>	<CAC1BbcQN63w956H2=kYmUbzGs1t5=V81-4_uKWfZtHJjJX9+uQ@mail.gmail.com>	<52DF98A1.4090206@windriver.com>
	<CAC1BbcRWE7cEpnfBA5JwVKgmXwSMWW85GjPPMVW9C5Y=HFZS5A@mail.gmail.com>
In-Reply-To: <CAC1BbcRWE7cEpnfBA5JwVKgmXwSMWW85GjPPMVW9C5Y=HFZS5A@mail.gmail.com>
X-Originating-IP: [128.224.162.164]
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3 1/5] systemd: add 'less' to its RRECOMMENDS
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
X-List-Received-Date: Thu, 23 Jan 2014 08:23:18 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/22/2014 06:18 PM, Bernhard Reutner-Fischer wrote:
> On 22 January 2014 11:08, ChenQi <Qi.Chen@windriver.com> wrote:
>> On 01/22/2014 06:00 PM, Bernhard Reutner-Fischer wrote:
>>> On 20 January 2014 09:35, ChenQi <Qi.Chen@windriver.com> wrote:
>>>> On 01/20/2014 04:06 PM, Bernhard Reutner-Fischer wrote:
>>>>> On 20 January 2014 03:23:02 Chen Qi <Qi.Chen@windriver.com> wrote:
>>>>>
>>>>>> The less command provided by busybox cannot interpret the control
>>>>>> character, resulting in obscure output of the journalctl command
>>>>>> in a systemd based image.
>>>>>
>>>>> Can you send me the input containing this control character, please?
>>>>>
>>>>> Perhaps we can do something sensible about it..
>>>>> TIA,
>>>>
>>>> For more details, please refer to
>>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=5723.
>>>> You can also add you comments there.
>>> Can you please try:
>>> http://marc.info/?l=busybox&m=139038437907397&w=2
>>> and let me know if this fixes your issue?
>>>
>>> thanks,
>>>
>>>
>> Hi,
>>
>> I cannot open the link.
>> Could you please send me your patches as attachment? I'll try them out
>> tomorrow and let you know the results.
> http://marc.info/?l=busybox&m=139038437907397&q=raw
> or, just for you:
> http://busybox.net/~aldot/tmp/0001-less-Add-R.patch
>
> thanks,

Hi Bernhard,

I just tried this patch out.

1) Test 1
Command: journalctl
Result: control characters not interpreted
Log:
Jan 23 07:35:49 qemux86 kernel: [[1;39mACPI: RSDP 000f1610 00014 (v00 
BOCHS )[[
0m
Jan 23 07:35:49 qemux86 kernel: [[1;39mACPI: RSDT 0fffe450 00034 (v01 
BOCHS  BX
PCRSDT 00000001 BXPC 00000001)[[0m
Jan 23 07:35:49 qemux86 kernel: [[1;39mACPI: FACP 0fffff80 00074 (v01 
BOCHS  BX
PCFACP 00000001 BXPC 00000001)[[0m
Jan 23 07:35:49 qemux86 kernel: [[1;39mACPI: DSDT 0fffe490 01137 (v01   
BXPC
BXDSDT 00000001 INTL 20120913)[[0m
Jan 23 07:35:49 qemux86 kernel: [[1;39mACPI: FACS 0fffff40 00040[[0m
Jan 23 07:35:49 qemux86 kernel: [[1;39mACPI: SSDT 0ffff700 00838 (v01 
BOCHS  BX
PCSSDT 00000001 BXPC 00000001)[[0m
Jan 23 07:35:49 qemux86 kernel: [[1;39mACPI: APIC 0ffff610 00078 (v01 
BOCHS  BX
PCAPIC 00000001 BXPC 00000001)[[0m
Jan 23 07:35:49 qemux86 kernel: [[1;39mACPI: HPET 0ffff5d0 00038 (v01 
BOCHS  BX
PCHPET 00000001 BXPC 00000001)[[0m
Jan 23 07:35:49 qemux86 kernel: ACPI: Local APIC address 0xfee00000
Jan 23 07:35:49 qemux86 kernel: [[1;39m0MB HIGHMEM available.[[0m
Jan 23 07:35:49 qemux86 kernel: [[1;39m255MB LOWMEM available.[[0m

2) Test 2
Command: export SYSTEMD_PAGER="less -R"; journalctl
Result: control characters interpreted

I know the behavior of `less' command from busybox is different from 
that of the 'less' package. And we can't ask too much.
But do you think it's possible to make 'journalctl' work correctly 
without setting SYSTEMD_PAGER to "less -R"? I'm wondering why busybox's 
'less' doesn't use the '-R' behaviour as its default. If so, we would 
not need this '-R' option at all.

Best Regards,
Chen Qi

