Return-Path: <rep.dot.nop@gmail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id 7DDD46E38B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 20:41:21 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id d49so591924eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 12:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:date:message-id:in-reply-to:references:user-agent
	:subject:mime-version:content-type:content-transfer-encoding;
	bh=+gYowRftQ/6Zc1qAES5MczbYAReK1h0vGzM7t+Q45e8=;
	b=HCIociq5ma5GbJBVxIfxs7hQUb1woGqJXB/0rIlXyzthQZyUjIwETZss8krSoIzjZA
	2JmvZYREqMB6rLGOXcFKtbmKKlef+DKCXGpOMondqu3uHXnOApcAo9cmBXatChHV5UQB
	2EGGq7gF+NzxS87CwMFwH/B3QbovfYLrkDLnbQEYoP8ORUd/swrTQQY3e8yEiYWGvOIh
	lpZk/1ryDaKqVK/gN0pCr6tl0Rv4w7NcvFaM+q5dQK3dcurAyRY2BROp01HEDcgBrl9W
	Q8YnqN4niNbtY4Vxh5nZLBeD1g37DyxpyiOE3SBEaDHwfmqlaw2B6zeYCzQqmqkw9CHj
	XSzQ==
X-Received: by 10.14.241.142 with SMTP id g14mr9230555eer.40.1390509681554;
	Thu, 23 Jan 2014 12:41:21 -0800 (PST)
Received: from [188.45.71.250] (188045071250.atmpu0059.highway.a1.net.
	[188.45.71.250])
	by mx.google.com with ESMTPSA id 8sm22114703eeq.15.2014.01.23.12.41.19
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 23 Jan 2014 12:41:20 -0800 (PST)
From: "Bernhard Reutner-Fischer" <rep.dot.nop@gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Date: Thu, 23 Jan 2014 21:41:20 +0100
Message-ID: <143c0d5c640.2760.0f39ed3bcad52ef2c88c90062b7714dc@gmail.com>
In-Reply-To: <143c0d151a0.2760.0f39ed3bcad52ef2c88c90062b7714dc@gmail.com>
References: <cover.1390184362.git.Qi.Chen@windriver.com>
	<a023434c6cc916907f190acd62af34ea5a6eaca0.1390184362.git.Qi.Chen@windriver.com>
	<143aeafa800.2760.0f39ed3bcad52ef2c88c90062b7714dc@gmail.com>
	<52DCDFB6.2070801@windriver.com>
	<CAC1BbcQN63w956H2=kYmUbzGs1t5=V81-4_uKWfZtHJjJX9+uQ@mail.gmail.com>
	<52DF98A1.4090206@windriver.com>
	<CAC1BbcRWE7cEpnfBA5JwVKgmXwSMWW85GjPPMVW9C5Y=HFZS5A@mail.gmail.com>
	<52E0D180.7030402@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0.1 AquaMail/1.3.8 (build:
	2100414)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Thu, 23 Jan 2014 20:41:23 -0000
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Transfer-Encoding: 8bit

On 23 January 2014 09:23:18 ChenQi <Qi.Chen@windriver.com> wrote:

> On 01/22/2014 06:18 PM, Bernhard Reutner-Fischer wrote:
> > On 22 January 2014 11:08, ChenQi <Qi.Chen@windriver.com> wrote:
> >> On 01/22/2014 06:00 PM, Bernhard Reutner-Fischer wrote:
> >>> On 20 January 2014 09:35, ChenQi <Qi.Chen@windriver.com> wrote:
> >>>> On 01/20/2014 04:06 PM, Bernhard Reutner-Fischer wrote:
> >>>>> On 20 January 2014 03:23:02 Chen Qi <Qi.Chen@windriver.com> wrote:
> >>>>>
> >>>>>> The less command provided by busybox cannot interpret the control
> >>>>>> character, resulting in obscure output of the journalctl command
> >>>>>> in a systemd based image.
> >>>>>
> >>>>> Can you send me the input containing this control character, please?
> >>>>>
> >>>>> Perhaps we can do something sensible about it..
> >>>>> TIA,
> >>>>
> >>>> For more details, please refer to
> >>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=5723.
> >>>> You can also add you comments there.
> >>> Can you please try:
> >>> http://marc.info/?l=busybox&m=139038437907397&w=2
> >>> and let me know if this fixes your issue?
> >>>
> >>> thanks,
> >>>
> >>>
> >> Hi,
> >>
> >> I cannot open the link.
> >> Could you please send me your patches as attachment? I'll try them out
> >> tomorrow and let you know the results.
> > http://marc.info/?l=busybox&m=139038437907397&q=raw
> > or, just for you:
> > http://busybox.net/~aldot/tmp/0001-less-Add-R.patch
> >
> > thanks,
>
> Hi Bernhard,
>
> I just tried this patch out.
>
> 1) Test 1
> Command: journalctl
> Result: control characters not interpreted
> Log:
> Jan 23 07:35:49 qemux86 kernel: [[1;39mACPI: RSDP 000f1610 00014 (v00 BOCHS )[[
> 0m
> Jan 23 07:35:49 qemux86 kernel: [[1;39mACPI: RSDT 0fffe450 00034 (v01 BOCHS  BX
> PCRSDT 00000001 BXPC 00000001)[[0m
> Jan 23 07:35:49 qemux86 kernel: [[1;39mACPI: FACP 0fffff80 00074 (v01 BOCHS  BX
> PCFACP 00000001 BXPC 00000001)[[0m
> Jan 23 07:35:49 qemux86 kernel: [[1;39mACPI: DSDT 0fffe490 01137 (v01 BXPC
> BXDSDT 00000001 INTL 20120913)[[0m
> Jan 23 07:35:49 qemux86 kernel: [[1;39mACPI: FACS 0fffff40 00040[[0m
> Jan 23 07:35:49 qemux86 kernel: [[1;39mACPI: SSDT 0ffff700 00838 (v01 BOCHS  BX
> PCSSDT 00000001 BXPC 00000001)[[0m
> Jan 23 07:35:49 qemux86 kernel: [[1;39mACPI: APIC 0ffff610 00078 (v01 BOCHS  BX
> PCAPIC 00000001 BXPC 00000001)[[0m
> Jan 23 07:35:49 qemux86 kernel: [[1;39mACPI: HPET 0ffff5d0 00038 (v01 BOCHS  BX
> PCHPET 00000001 BXPC 00000001)[[0m
> Jan 23 07:35:49 qemux86 kernel: ACPI: Local APIC address 0xfee00000
> Jan 23 07:35:49 qemux86 kernel: [[1;39m0MB HIGHMEM available.[[0m
> Jan 23 07:35:49 qemux86 kernel: [[1;39m255MB LOWMEM available.[[0m
>
> 2) Test 2
> Command: export SYSTEMD_PAGER="less -R"; journalctl
> Result: control characters interpreted
>
> I know the behavior of `less' command from busybox is different from that 
> of the 'less' package. And we can't ask too much.
> But do you think it's possible to make 'journalctl' work correctly without 
> setting SYSTEMD_PAGER to "less -R"? I'm wondering why busybox's 'less' 
> doesn't use the '-R' behaviour as its default. If so, we would not need 
> this '-R' option at all.

Apparently Denys does not like the idea of having -R in there at all but 
even if it gets in, defaulting to -R is not acceptable I think. We could, 
however, add parsing the LESS env var as the big less does. I guess that 
would add another 30-40 bytes to the 300-ish for the -R itself, though.
Plain -r was much smaller, but I dropped it due to paranoia, fwiw.

To some extent I do agree with Denys that journalctl should only print ANSI 
colors if it's stdout isatty.

Thanks,

Sent with AquaMail for Android
http://www.aqua-mail.com



