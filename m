Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id F22AD78494
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Nov 2017 23:40:42 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id p75so7068067wmg.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Nov 2017 15:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=E99gV+HQXCNDyE/EGQFsbgIusP4du5T+KSk8lUqKjnc=;
	b=OFgDSv5d/2elQkickDKNxIHPUfWnmn2J9f+UgXEyLP3udJYLM4ZUdyPjO0ZQGS1bC0
	MwgdTRxGCfiwcTAsNjbQCaHuyG2iZorFXOjRrHQhfE8cZIq/eg7ER2zM80vqLhAdGuaz
	WpknI9LT8FqMREYcc1EkdDCyP3JAc8Dojf5t8aq8fYmEGr4lPO6eAjsXiYXE70IlaBhh
	R/dT5WswmEAH9o2oX9Bw4PHuiXVif5G5HTZsYjR91pfZBwVk/wliSaX8T67iR3687DBs
	CVApL3Vfo5guhBeAarV3l7OwGYs7MD1joAefsgRTVN2vnucdXeT18gaKP+A5xpLPr1rW
	LisA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=E99gV+HQXCNDyE/EGQFsbgIusP4du5T+KSk8lUqKjnc=;
	b=pN9KchI5DLG+Amf8KfJyRKvkkWTECbNw4PB0Vdv+8HPja6vuDyA1dp+q77OW93keWA
	oUx/oCkkC13Z7jMGydoBr1L2NQ8h1GbifNyBnGttFCmwdwTjC/olkndsA9GOFGUNY9n6
	lrNoL49hTVWD7n1OldHax5T7oesF2FI02mhL4ykT3os0DKfsxMk6yOV+IDwNvI6K6Rdf
	ptPoJp2H5a2Y9W305g+4ypvJOvoqBHBa39OFiYJbga9tNLmU/3EIlUzEne6F9VXQZ4n4
	p75jpy4b4nFtBQHowlw01ROKHBzWcZ+o0RMrO8utzKCH2FYYQaTu+y9WsKX5JZbb4Vnp
	uC0A==
X-Gm-Message-State: AJaThX4AnxvqPNaltu2wjjSww7/yylk71Mbsg1VlHiTkmSeD11hePao5
	sNd05lOKAZB2G6/YmYfuID4N6C8YGobFNoqsFt+4VQ==
X-Google-Smtp-Source: ABhQp+Ty3fMBkHCl1yO6ls4XdN5cC7ZzGDfBYwqtFQIDqvubgCDfhNQwj17eOuCE4NDnGRYxiTzSw++fzyUrARQ8G4g=
X-Received: by 10.80.178.36 with SMTP id o33mr1053918edd.116.1510098043716;
	Tue, 07 Nov 2017 15:40:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.204.200 with HTTP; Tue, 7 Nov 2017 15:40:43 -0800 (PST)
In-Reply-To: <CAJ86T=UZMxpeXdECnqrKr7pcbraQJcQOkqxCMXKNrnxv+mE6PA@mail.gmail.com>
References: <CAAQYJAvQo_buybnL8OUmwYfhezzuxx-dTO8wzuM=aQvKGYW+5Q@mail.gmail.com>
	<d47497dc-619f-1f66-814a-bf93cc1d0227@gmail.com>
	<CAAQYJAvNHrTGn=vD_eF_=rx_cNJFNSKfHdMa5vFvaYJ_6zq-fg@mail.gmail.com>
	<CAJ86T=UZMxpeXdECnqrKr7pcbraQJcQOkqxCMXKNrnxv+mE6PA@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Wed, 8 Nov 2017 00:40:43 +0100
Message-ID: <CAAQYJAuN8pJLoS8ufKLWyNWzqS4uV=i4nZJAKk89_2wyBkPX4g@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Backport gcc7 fixes for armv5e [ARM] PR 82445
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
X-List-Received-Date: Tue, 07 Nov 2017 23:40:43 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 8, 2017 at 12:30 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Tue, Nov 7, 2017 at 3:00 PM, Andrea Adami <andrea.adami@gmail.com> wrote:
>> On Fri, Nov 3, 2017 at 4:10 PM, akuster808 <akuster808@gmail.com> wrote:
>>> On 11/02/2017 01:46 AM, Andrea Adami wrote:
>>>>
>>>> the gcc7 shipped with rocko produces unbootable kernels on armv5e [1].
>>>> Bug was fixed recently, apparently in revision 253892 [2]
>>> If you have  a test case ie qemu settings, I can open a bug and handle
>>> it that way too
>>>
>>
>> Armin,
>>
>> once I saw the kernel was not booting on real device I wondered about
>> gcc and did a build for qemuarm/arm926js.
>> This one was booting fine on qemu.
>>
>> I then beated OE's qemu to run for my spitz device (spitz is supported
>> by qemu but lacks some variables needed by the script) and with my
>> surprise it was booting...
>>
>> So no, qemu is not a valid testbench for this specific issue :)
>
> Googling for "qemu arm alignment faults" brings up a few links which
> suggest that to be true - qemu doesn't seem to be strict about
> emulating ARM alignment faults. The links are a little old though, so
> maybe newer qemu versions can configured to be stricter.
>

I have not read the sources but maybe qemu decompresses itself the
kernel image. No idea.
On real HW the XZ decompressor fails to decompress misaligned kernels,
that's a fact.

>   https://stackoverflow.com/questions/19990756/aligment-faults-ignored-on-armv5te-in-qemu
>   https://patchwork.ozlabs.org/patch/550535/

Note a second oddity: at the end of the above link about bug id=82445 you read:

Fixed on trunk gcc-6 & gcc-7

How that? gcc6 produced booting kernels.

Cheers
Andrea

