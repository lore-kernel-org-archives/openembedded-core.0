Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1582D78882
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 17:17:49 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id k134so13854315pga.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 09:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=iZbIlg26l0PqF/5SrqHGP82nIdBmUIPIT7A/013SRRY=;
	b=HydhWjuS+dLV7E2crzFSSwpde8rG+6ctSE65LXJ9F7UxaSckKMIpXhWN4vOx0LR6EZ
	V6YmXoYDU35eA1qsFoWwfGkSYLbUoZHa+HUwLRIJAySa8hjLC7DaA+Z/M3wY8xd+EmZY
	GAPmIJ3WEDVmz60uq0HX82ymr650ZyHAI/o7qKgpsZqB+OW8eCFIgfpD/ZYABYNPbOjg
	bmpJsgyUs/Kkdkax4p4CRNV+CWsHz/PBDdF4geQy+GdDJyHIkMoknTzbjlcKuV70O/QA
	zq67J/SBPHS4qDbxHKbRccoD0VntWpqa/sfYypG7a28o9sfU2n0Mu6Y2Y0SG+gsa9uIP
	um/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=iZbIlg26l0PqF/5SrqHGP82nIdBmUIPIT7A/013SRRY=;
	b=bOUbCA7ChVNtbB6CY29x5QKYJYXm1a48wEclrE6AP3XMPylMxmozPay5PkJcEvydek
	skOmM4gNOMVBT/7amrg0SEzV6B6ZH5k2cXG5F8aaZqOSbf+kZPq/e5oTvYh7TaU3y6vk
	1n+2XTgsDzjB7JcJuHJNDanqsJRfEv/ZlKuZKtXQ+U4fGiX4Xl7QHk0GdlFTtI+MzgU+
	Zp2ea+vvfjAhdZuwIU8O+6ybxX1p1fFsBsKEEdwrU/JV7Q5eET2YOELB6qN9K7z85EgB
	XXU7pqJelcSH/548LUS0Xon4oi2I1/xYmSNY7rZdIo9UcVHAHxn6kh+58v+vIy2tlbWf
	fu8g==
X-Gm-Message-State: AKGB3mK0YHe2dKuyMoXEDpKVp7+1BdjJI8wsDeeOjtkgaUuu6ZjRnlWj
	Nh1xePdwsZpuZH5XXKAeWgxU6Q0tWOWzOCP49Ac=
X-Google-Smtp-Source: ACJfBosaN06f9jvuUDuG9MGApABjd9a0HGhN9l86xMAmXEmoOmZTYIMriupk9LL/Y8IlwWjwmNvQa/tdM2c+TWjThho=
X-Received: by 10.84.213.144 with SMTP id g16mr2910686pli.339.1513099070869;
	Tue, 12 Dec 2017 09:17:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.159.15 with HTTP; Tue, 12 Dec 2017 09:17:20 -0800 (PST)
In-Reply-To: <CAAQYJAt+B0Lx9OOiczpc8sQjk=pR3X2-rT2GnpPF=dJW4hrLNQ@mail.gmail.com>
References: <1510695882-31186-1-git-send-email-andrea.adami@gmail.com>
	<CAMKF1sp+6mEW8r65fDELAR=SO3oPcgv4Bx0s0ROaS=4euUum9w@mail.gmail.com>
	<CAAQYJAt+B0Lx9OOiczpc8sQjk=pR3X2-rT2GnpPF=dJW4hrLNQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 12 Dec 2017 09:17:20 -0800
Message-ID: <CAMKF1soRAEepmC4QtnMEXwixLsC_st3rQBGnMn6MoQQhdptsZg@mail.gmail.com>
To: Andrea Adami <andrea.adami@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] musl: use arm instruction set for armv4 and armv5
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
X-List-Received-Date: Tue, 12 Dec 2017 17:17:50 -0000
Content-Type: text/plain; charset="UTF-8"

They have been proposed some time back. I dont know if they fell through cracks.

On Tue, Dec 12, 2017 at 7:23 AM, Andrea Adami <andrea.adami@gmail.com> wrote:
> Hello,
>
> musl 1.18 recipe is still failing.
> Please apply one of the a.m. patches, thanks
>
> Andrea
>
> On Wed, Nov 15, 2017 at 4:37 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Tue, Nov 14, 2017 at 1:44 PM, Andrea Adami <andrea.adami@gmail.com> wrote:
>>> thumb1 is not supported with musl.
>>>
>>> Fixes: [YOCTO #12336]
>>>
>>> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>>> ---
>>>  meta/recipes-core/musl/musl.inc | 4 ++++
>>>  1 file changed, 4 insertions(+)
>>>
>>> diff --git a/meta/recipes-core/musl/musl.inc b/meta/recipes-core/musl/musl.inc
>>> index 56c9d7f..b4b0de9 100644
>>> --- a/meta/recipes-core/musl/musl.inc
>>> +++ b/meta/recipes-core/musl/musl.inc
>>> @@ -26,3 +26,7 @@ INSANE_SKIP_${PN} = "dev-so"
>>>  # Doesn't compile in MIPS16e mode due to use of hand-written
>>>  # assembly
>>>  MIPS_INSTRUCTION_SET = "mips"
>>> +
>>> +# Doesn't support thumb1
>>> +ARM_INSTRUCTION_SET_armv4 = "arm"
>>> +ARM_INSTRUCTION_SET_armv5 = "arm"
>>
>> Ah I submitted a parallel fix that was sitting on my branch.
>> is that fine ?
>>
>>> --
>>> 2.7.4
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

