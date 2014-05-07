Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-oa0-f45.google.com (mail-oa0-f45.google.com
	[209.85.219.45])
	by mail.openembedded.org (Postfix) with ESMTP id B1A0260897
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 May 2014 11:32:44 +0000 (UTC)
Received: by mail-oa0-f45.google.com with SMTP id l6so1020675oag.32
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 May 2014 04:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=vflIxIEomAbqWwRu1glBq0WM+X96n5IHnBR3vQL3Gno=;
	b=BfXdeqLTeshJ00+wvG3ObG6AYusZQAJeST9wkQg6eEHT5pLSOKrgCpeqOo7Xcch70r
	pyiXJ0phw7L1FCkxXkXd+rCa3QD6hNP8ngmOsULtucZ1HlWGGPBBbsGe82a9gj4FaVWd
	NRypS12g46hbe3AO+g+lA4eiSGxGI/1Bnqv+ozX3JZDQp/P6pRUpmhgoAjBzHUBrD7mn
	euQJRRlfyxO2oUVbOzqxtRYmnxWkBpTj/an1+R7Rd+NSRrI2SpCd3AJ7t/5VRDaykIPL
	cV5P3MIm2sPPnd5hAVH6+okVS0Cp5rGMWHu8EUeFmQ8Nwz7SmrVt5dDUDag3+kVvIYNg
	G8IQ==
X-Received: by 10.60.130.195 with SMTP id og3mr22200536oeb.36.1399462365072;
	Wed, 07 May 2014 04:32:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.111.133 with HTTP; Wed, 7 May 2014 04:32:25 -0700 (PDT)
In-Reply-To: <CAMKF1so0OkCq73JeZGLAQGb5Cn3+ZKwU=GimrW0CAu39BC+6DA@mail.gmail.com>
References: <CAPybu_2QJ=GXH0Vo_hvAOu-uoj=KDe2ouyQ1EC6pmx6cSKc8TQ@mail.gmail.com>
	<CAMKF1so0OkCq73JeZGLAQGb5Cn3+ZKwU=GimrW0CAu39BC+6DA@mail.gmail.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Wed, 7 May 2014 13:32:25 +0200
Message-ID: <CAPybu_0pX2pw79ukVm4NWQUhT_kbXUJUrjuFuSJuP-HPjBN=yA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: daisy: System crash running grub-efi on 64 bit machine
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
X-List-Received-Date: Wed, 07 May 2014 11:32:51 -0000
Content-Type: text/plain; charset=UTF-8

I was using dora. But it seems that I was also using all the files
from grub-efi-native to build the grub binary. Of course this is
breaking the cross compilation barrier...

What is pretty strange is that both my distro and poky uses the same
compiler 4.8.2. For exactly the same source code, one build with my
distro gcc via grub-efi-native and the other with the cross compiler I
get one binary that works and another that crashes the machine.

Unfortunately I am not an expert on uefi nor grub, so I dont know the
best way to debug this (except adding printfs...)

Is the output from virtualbox useful some how? Can anybody else
reproduce the error?


Thanks!


On Tue, May 6, 2014 at 7:22 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, May 6, 2014 at 6:20 AM, Ricardo Ribalda Delgado
> <ricardo.ribalda@gmail.com> wrote:
>>
>> I have just ported my build system to daisy and I am unable to boot
>> from grub-efi. As soon as the grub binary is loaded by uefi, the
>> system freezes. The error can be reproduced on virtualbox.
>>
>> Since it is even before the kernel is loaded, and no error message is
>> given I don't know which will be the easiest way to debug the issue. I
>> hope that the log message from virtualbox can give you a hint of the
>> issue: https://gist.github.com/anonymous/7ffd78aa3aada41801fe .
>>
>> It could be a toolchain issue, because if I build the same code (even
>> with the patches) with Debian's gcc everything works as expected.
>>
>> If anyone needs the .vdi file I will be more than happy to share it.
>
> what was the working release you used before and whats the compiler
> version on that release



-- 
Ricardo Ribalda

