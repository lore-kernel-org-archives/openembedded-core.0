Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0E557782A7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Nov 2017 23:30:52 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id k61so799677wrc.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Nov 2017 15:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EFEEQ83MfIejLi/92qcvyY5rtBzG3tc4jRCa8PHjUWs=;
	b=VWETXjy0KlaraFMgCz7udomST3FFgvQCckPF3nL/oAQdOVJYzhtVjE1uHf6OmSY/Xa
	r9LyXe5y804znJEL2ENFkLKvr2iuF1raju3sb4k7JXAAiF9PeCx1a8PklIDLazKsrPKG
	Vvgx4JfVmQfMDFWfR/QJlu0NgD6m/uCEDpdIcqblU9zi6KjvCHjPgbS2zArdhXuvjUKk
	nkNZOkHGowSvZjxFA8dJPoMspPnrLOSme7CAf5VOqtq90Dv4i4Ytft/2PowtjsZ44WAP
	pmfEfDp4ocgj0GYeWBpK2WtVrlLOqBew35+gv5hjRe93HBGFVPWLasxmLiHGYqBN+4a0
	cVtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EFEEQ83MfIejLi/92qcvyY5rtBzG3tc4jRCa8PHjUWs=;
	b=U5J4SX20Al/K0ZM6YdVZfPYC4w9sKAXTTydKpv0VyMoZH18mcL6pU1mxD5a9NTYfOA
	njPvsi8w6MVJVLzrGUVSbeDM1AmzMCOZHyJBHIz6DYh0lgpkxJ/XeqjMgbehFDsoGJ3U
	CMOagIlZh04mcbGRVOeEz8GFOTE4ADvJQaBtAi46g13kMeD+bbHwYD+PGfAnnDYSY72Y
	60OMvzbVtsONtUKyIs+jm1CQLkRe2f1wMuy2W7kYtgl7ksZhd8CSOa7I/a4t349LVn/i
	LgxxW0r95mGq0hs87dheBdfqFOFzHn77M2MhgwUmb2qbdBilVtD7zrrgy7iUp8eDsj/1
	q7bg==
X-Gm-Message-State: AJaThX40RwtD0y8GNLKonSzRpJjp7eqviKZd/I6nV+UwpDx9yAVmw7pu
	7YKk4o6Hkfs7iTebm5fc3CrmvqkN0vgZ6crOwpC+vA==
X-Google-Smtp-Source: ABhQp+SBxmawVvCibGx/Jf6kPv8NCzJZGgP355fWcuOpVbs7CY8C0cTQ/LRPtOdW0CGp7CioQiXoNBj/d458KsQjX4Y=
X-Received: by 10.223.146.197 with SMTP id 63mr265551wrn.180.1510097453527;
	Tue, 07 Nov 2017 15:30:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.199.140 with HTTP; Tue, 7 Nov 2017 15:30:53 -0800 (PST)
In-Reply-To: <CAAQYJAvNHrTGn=vD_eF_=rx_cNJFNSKfHdMa5vFvaYJ_6zq-fg@mail.gmail.com>
References: <CAAQYJAvQo_buybnL8OUmwYfhezzuxx-dTO8wzuM=aQvKGYW+5Q@mail.gmail.com>
	<d47497dc-619f-1f66-814a-bf93cc1d0227@gmail.com>
	<CAAQYJAvNHrTGn=vD_eF_=rx_cNJFNSKfHdMa5vFvaYJ_6zq-fg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 7 Nov 2017 15:30:53 -0800
Message-ID: <CAJ86T=UZMxpeXdECnqrKr7pcbraQJcQOkqxCMXKNrnxv+mE6PA@mail.gmail.com>
To: Andrea Adami <andrea.adami@gmail.com>
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
X-List-Received-Date: Tue, 07 Nov 2017 23:30:53 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 7, 2017 at 3:00 PM, Andrea Adami <andrea.adami@gmail.com> wrote:
> On Fri, Nov 3, 2017 at 4:10 PM, akuster808 <akuster808@gmail.com> wrote:
>> On 11/02/2017 01:46 AM, Andrea Adami wrote:
>>>
>>> the gcc7 shipped with rocko produces unbootable kernels on armv5e [1].
>>> Bug was fixed recently, apparently in revision 253892 [2]
>> If you have  a test case ie qemu settings, I can open a bug and handle
>> it that way too
>>
>
> Armin,
>
> once I saw the kernel was not booting on real device I wondered about
> gcc and did a build for qemuarm/arm926js.
> This one was booting fine on qemu.
>
> I then beated OE's qemu to run for my spitz device (spitz is supported
> by qemu but lacks some variables needed by the script) and with my
> surprise it was booting...
>
> So no, qemu is not a valid testbench for this specific issue :)

Googling for "qemu arm alignment faults" brings up a few links which
suggest that to be true - qemu doesn't seem to be strict about
emulating ARM alignment faults. The links are a little old though, so
maybe newer qemu versions can configured to be stricter.

  https://stackoverflow.com/questions/19990756/aligment-faults-ignored-on-armv5te-in-qemu
  https://patchwork.ozlabs.org/patch/550535/

