Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5982378882
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 17:19:58 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id f12so13849203pgo.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 09:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PplP1YMtnV/c+VMednTREqlEkrhKd3g2V56ogT46jyA=;
	b=RT9CUHuRfbMutk5s1ucqH+PnMEVkL7l9MjTzD4GTOgGlWIJXwSRs3n23vJsVJbbrE4
	kVkwjOXxCxMcCjG19veZ+YUNKGXaUYhcPtF2Nvr4GVCj8tCF2xg4iM/uxYQUiCCTiC7y
	XUv3tBQESEZS6ce/krkyewxIyjyKPair+Wr/Xw/prD8tSzBJ2Z0QmpiU9iZ4oXrsFAUu
	h7keovgMsZwTVKxSUlYlCy24rZ4UMCrv1LGgI0GOxVwDKYDr9T1JhiWkMwIERuS2kLdA
	fr8XJdeCKtvEX+iPGAylhbIjfPDBBwI/8lK7/EgNT22iR0NOST7yEyaUUfDJxFdj6CCC
	QsUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PplP1YMtnV/c+VMednTREqlEkrhKd3g2V56ogT46jyA=;
	b=W9p9fxom2l2zY41UW9o8x6sHyAZaaPtyDAKkxSWr3YaZ4L2lBwAGQewW7ZiVMHITWO
	jQzA8ezftR2iu50wnChZ0Nk8Utk5AAOIAcJmbVxasiQ4EoldAnqzBoic0EYehe8B8ftB
	1NbGyxYnCMyIx77UyKScDmETvsmonB9bspruzfr5+j+cozrcnod9wVOFfcxczXDY2N43
	PVQ94Sq7f0ZLvZsY9XdVUrxAUUoVPWAxcls/ceNiykWFvCIozc4WO5jo9kQM8kKJJUzM
	h/In4AkiYkya8hAu0Ep7IbPFHb8uT/Ii9fjRJh6wpR8KeT0Stk7DbpptIv0w0Ue/z9PC
	GaRw==
X-Gm-Message-State: AKGB3mLfU2pK97WooreizAaH6FEqL/db3OEG0Eg5ovzuXJF892wjkMLh
	00A5IqN1L5/7zeKX5HE8/4ymGGQ5k714Z4+z/Zw=
X-Google-Smtp-Source: ACJfBovKkZevyIQR7m8/EFWqBjEkIKQMCXIyvufj3DN5ZtshkAYfpzBJeCVHUg/6Lw0wou+oQqrkySLi6hD2MMSoUxs=
X-Received: by 10.101.74.136 with SMTP id b8mr2678300pgu.341.1513099200492;
	Tue, 12 Dec 2017 09:20:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.159.15 with HTTP; Tue, 12 Dec 2017 09:19:29 -0800 (PST)
In-Reply-To: <CAJTo0LY5HZfqBbtoVNjOYVsLOwtUvNjiyrRJcJuCxh8s43CDCg@mail.gmail.com>
References: <1510695882-31186-1-git-send-email-andrea.adami@gmail.com>
	<CAMKF1sp+6mEW8r65fDELAR=SO3oPcgv4Bx0s0ROaS=4euUum9w@mail.gmail.com>
	<CAAQYJAt+B0Lx9OOiczpc8sQjk=pR3X2-rT2GnpPF=dJW4hrLNQ@mail.gmail.com>
	<CAJTo0LY5HZfqBbtoVNjOYVsLOwtUvNjiyrRJcJuCxh8s43CDCg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 12 Dec 2017 09:19:29 -0800
Message-ID: <CAMKF1srfxJHWfUWe2mh4zs_OC9X1oN0FfHZcxqRHS-=8pjpq-Q@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
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
X-List-Received-Date: Tue, 12 Dec 2017 17:19:59 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 12, 2017 at 9:15 AM, Burton, Ross <ross.burton@intel.com> wrote:
> Just to make it clear I'm waiting on Andrea or Khem to ping the right patch.
>

I will resend them today

> Ross
>
> On 12 December 2017 at 15:23, Andrea Adami <andrea.adami@gmail.com> wrote:
>>
>> Hello,
>>
>> musl 1.18 recipe is still failing.
>> Please apply one of the a.m. patches, thanks
>>
>> Andrea
>>
>> On Wed, Nov 15, 2017 at 4:37 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> > On Tue, Nov 14, 2017 at 1:44 PM, Andrea Adami <andrea.adami@gmail.com>
>> > wrote:
>> >> thumb1 is not supported with musl.
>> >>
>> >> Fixes: [YOCTO #12336]
>> >>
>> >> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>> >> ---
>> >>  meta/recipes-core/musl/musl.inc | 4 ++++
>> >>  1 file changed, 4 insertions(+)
>> >>
>> >> diff --git a/meta/recipes-core/musl/musl.inc
>> >> b/meta/recipes-core/musl/musl.inc
>> >> index 56c9d7f..b4b0de9 100644
>> >> --- a/meta/recipes-core/musl/musl.inc
>> >> +++ b/meta/recipes-core/musl/musl.inc
>> >> @@ -26,3 +26,7 @@ INSANE_SKIP_${PN} = "dev-so"
>> >>  # Doesn't compile in MIPS16e mode due to use of hand-written
>> >>  # assembly
>> >>  MIPS_INSTRUCTION_SET = "mips"
>> >> +
>> >> +# Doesn't support thumb1
>> >> +ARM_INSTRUCTION_SET_armv4 = "arm"
>> >> +ARM_INSTRUCTION_SET_armv5 = "arm"
>> >
>> > Ah I submitted a parallel fix that was sitting on my branch.
>> > is that fine ?
>> >
>> >> --
>> >> 2.7.4
>> >>
>> >> --
>> >> _______________________________________________
>> >> Openembedded-core mailing list
>> >> Openembedded-core@lists.openembedded.org
>> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

