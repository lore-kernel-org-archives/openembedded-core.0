Return-Path: <armccurdy@gmail.com>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id D745E751C6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2018 07:39:00 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id 59-v6so5838884uas.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2018 00:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IK3oJy4t5DT2fsSH+M/riPuEZoP+Eg/k9j6PHFF8yb4=;
	b=L0msgzjYdXPTzlh7DPLDkHwbFhMuyrlO7Qg3dyfWs3g4LpZ4QSghlhVhesnMmAUM6D
	+AX9ZM2l0XHnZ/Eb/FrgbXDzSTUW13NMPi1JRQXy+6thq++mL68s9W+71j1L5CTGiJ9d
	Xw2YKqZazHwnM5CaSXdQpUBKRGwgKV4eTYB4yjoKOSuKSn3IGyxJj3yNchUiokNqm2sG
	d6RnZul4Wepw4OXQWwBCPAb2JLkPYMFoWr0fvL5XjaeIGWgDOJho4XU6S+wwzZBik2p2
	XuzfzisrW2ua6LpCiJZ1V609nZwocn+yhLIKkqIrob8lDX+sy+rkQXQ8q0ILvjelVJNc
	o4XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IK3oJy4t5DT2fsSH+M/riPuEZoP+Eg/k9j6PHFF8yb4=;
	b=S8IzH1ANUqZwv6SUcJcHcukS92OtTAlCwab6yIoz42AR85K1Y10a5BZgyCoqwsFRfe
	50vfn0QrUN/12HFwjgjFCOEjUUPstyjr5RhPT/EN4SZyVIaWYI0rRQHvAE0NY0Z6Z1qo
	BjN5BGLNBs4vjEpJyzrU2SOuM4xKbbku3o09JOTiTihN+RPTtbWK63LKYarUOPOCbuBN
	ASoVJvAs03sF6Au4ecnz4zzhAbA1W0NGof0cx+lG/GssUXaENh1A9HcrKWpKQ2lgHpTe
	idvDeIrI0TjpsxdnPnX2tmec4GSCToBkqovIjoeIWnpShHa4IX5L4uJY9uQ4DABAc7Jm
	doJQ==
X-Gm-Message-State: APt69E3cwmlI1KbPyXM8gW1utpCG7phY+6ivZtpmPvZSrm6GWVMurQBS
	RhEAG03PjQQHkQj+pxjawoSYxsTYNofyZnJXViE=
X-Google-Smtp-Source: ADUXVKK8ADHP3VK1He33F9/K4C8NLm8XUT4+FczPLSVudml1cnhO0tkQjS3Wbnf+PDAcDYNhsWOauAULoeMa0/Dq+R8=
X-Received: by 2002:ab0:4045:: with SMTP id h63-v6mr365892uad.66.1529048341702;
	Fri, 15 Jun 2018 00:39:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:28a:0:0:0:0:0 with HTTP;
	Fri, 15 Jun 2018 00:39:01 -0700 (PDT)
In-Reply-To: <002301d40477$f719ceb0$e54d6c10$@neuf.fr>
References: <1528977321-8121-1-git-send-email-ovidiu.panait@windriver.com>
	<002e01d403d8$b811f1b0$2835d510$@neuf.fr>
	<20da1542-9903-d4fc-b38f-8f0ad3b2d4a1@gmail.com>
	<CAJ86T=UjDUYfQ3wAb4YCT954HjBfZMz1fnFkBxUV40xj=aBgow@mail.gmail.com>
	<CAMKF1spJGLVW_HKD9YEgDY6aidz6q_TvjohfoJHnXHDiyc3vtg@mail.gmail.com>
	<CAJ86T=U7Uk0uajnnu=1P_dSxGrO3thQDp9655KC1EEYesPa3_Q@mail.gmail.com>
	<CAMKF1srPwWebGHZcmnV5vaNhRgSjrp2DG0CgT44zyUqfnFBf_A@mail.gmail.com>
	<CAJ86T=WRTcXsWs3V32RC0dTNG-F7va_5m-hd6zYQ6aF6YZcxdw@mail.gmail.com>
	<002301d40477$f719ceb0$e54d6c10$@neuf.fr>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 15 Jun 2018 00:39:01 -0700
Message-ID: <CAJ86T=WBdYPraOcxAp579Uganz6RQxV1hEzvtc5T+pencYm1xA@mail.gmail.com>
To: Herve Jourdain <herve.jourdain@neuf.fr>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] db: disable the ARM assembler mutex code
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
X-List-Received-Date: Fri, 15 Jun 2018 07:39:01 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 15, 2018 at 12:10 AM, Herve Jourdain <herve.jourdain@neuf.fr> wrote:
> Hi,
>
> So the issue is whether we want to change the behaviour of previous architectures, or if we try to fix the issue only for the architectures that don't work.
> Until now, the db recipe was enabling the 'swp' optimization, and that behavior could be disabled on .bbappend if needed.
> While that works fine until armv7ve, it does not work for armv8, which has removed support for those instructions.

I don't know if "works fine until armv7ve" is correct. Although the
swp instruction exists for armv7, according to the link I posted
yesterday, it is not guaranteed to work.

  https://community.arm.com/processors/b/blog/posts/locks-swps-and-two-smoking-barriers

Or do you have other evidence to suggest that swp is safe to use for armv7?

> Therefore, there is a need to fix it for armv8 - and armv8 only - whereas it can be safely used on previous architectures.
> If we remove the use for all ARM architectures, that might create some regression/issues.
> If we just remove the use of 'swp' only for armv8, we ensure it doesn't break anything that's running on previous ARM architectures.
>
> Cheers,
> Herve
>
> -----Original Message-----
> From: Andre McCurdy [mailto:armccurdy@gmail.com]
> Sent: vendredi 15 juin 2018 00:03
> To: Khem Raj <raj.khem@gmail.com>
> Cc: Herve Jourdain <herve.jourdain@neuf.fr>; Ovidiu Panait <ovidiu.panait@windriver.com>; Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
> Subject: Re: [OE-core] [PATCH 1/1] db: disable the ARM assembler mutex code
>
> On Thu, Jun 14, 2018 at 2:48 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Thu, Jun 14, 2018 at 1:01 PM Andre McCurdy <armccurdy@gmail.com> wrote:
>>> On Thu, Jun 14, 2018 at 12:24 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>> > On Thu, Jun 14, 2018 at 12:12 PM Andre McCurdy
>>> > <armccurdy@gmail.com>
>>> > wrote:
>>> >>
>>> >> On Thu, Jun 14, 2018 at 9:40 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>> >> > On 6/14/18 5:10 AM, Herve Jourdain wrote:
>>> >> >> Hi,
>>> >> >>
>>> >> >> I believe I solved that same problem by just adding, in the
>>> >> >> case of
>>> >> >> armv8
>>> >> >> (which I believe may be the new architecture you're referring to):
>>> >> >> MUTEX_armv8 = ""
>>> >> >> This way, it allows previous versions to work just like they
>>> >> >> did before, without having to disable ARM assembler mutex code
>>> >> >> for architectures that support it correctly - up to armv7ve I
>>> >> >> believe.
>>> >> >> Of course, we might need to also have a good definition for
>>> >> >> armv8, which is the object of another thread.
>>> >> >
>>> >> > right thats a better approach.
>>> >>
>>> >> SWP is not guaranteed to work on SMP systems... and even if it
>>> >> does, performance is likely to be worse than the pthreads version
>>> >> (which can take advantage of the newer instructions).
>>> >>
>>> >>
>>> >> https://community.arm.com/processors/b/blog/posts/locks-swps-and-t
>>> >> wo-smoking-barriers
>>> >>
>>> >> In general, use of hand optimised assembler mutex implementations
>>> >> in user space isn't something to be encouraged - use pthreads (or
>>> >> maybe a gcc intrinsic) instead.
>>> >>
>>> >
>>> > question is about disabling it on old arm machines, do we have data
>>> > where we know that other sync methods without swp works better on
>>> > armv5 and lower ?
>>>
>>> On armv5 and below a hand optimised implementation using SWP is
>>> likely to be faster than pthreads. No one is suggesting otherwise.
>>>
>>> On SMP (highly likely nowadays for armv7 and above), SWP simply might
>>> not work (aside from the fact that if it does work, it's likely to be
>>> slower than pthreads). It's not really a question of performance
>>> there, so the proposal to only disable SWP for armv8 doesn't seem
>>> like a safe solution.
>>
>> Suggestion is not to just do it for armv8 but To keep it there where
>> its beneficial
>
> You can always argue that micro optimisations are beneficial. The question is whether they make a big enough difference in some real world use case to be worth the maintenance effort.
>
>>> Using pthreads unconditionally is safe and easy. Unless you can prove
>>> that hand optimised SWP is really a big win for armv5 (is anyone
>>> really running a performance critical database on an armv5 system?)
>>> why not keep the recipe simple and use pthreads everywhere?
>>>
>>> >> I think the original patch is good.
>>> >>
>>> >> >> Cheers,
>>> >> >> Herve
>>> >> >>
>>> >> >> -----Original Message-----
>>> >> >> From: openembedded-core-bounces@lists.openembedded.org
>>> >> >> [mailto:openembedded-core-bounces@lists.openembedded.org] On
>>> >> >> Behalf Of Ovidiu Panait
>>> >> >> Sent: jeudi 14 juin 2018 13:55
>>> >> >> To: openembedded-core@lists.openembedded.org
>>> >> >> Subject: [OE-core] [PATCH 1/1] db: disable the ARM assembler
>>> >> >> mutex code
>>> >> >>
>>> >> >> The swpb in macro MUTEX_SET will cause "undefined instruction"
>>> >> >> error on the new arm arches which don't support this assembly
>>> >> >> instruction any more. If use ldrex/strex to replace swpb, the
>>> >> >> old arm arches don't support them. So to avoid this issue, just
>>> >> >> disable the ARM assembler mutex code, and use the default
>>> >> >> pthreads mutex.
>>> >> >>
>>> >> >> Signed-off-by: Li Zhou <li.zhou@windriver.com>
>>> >> >> Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
>>> >> >> Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
>>> >> >> ---
>>> >> >>  meta/recipes-support/db/db_5.3.28.bb | 13 +------------
>>> >> >>  1 file changed, 1 insertion(+), 12 deletions(-)
>>> >> >>
>>> >> >> diff --git a/meta/recipes-support/db/db_5.3.28.bb
>>> >> >> b/meta/recipes-support/db/db_5.3.28.bb
>>> >> >> index 093ee44909..15b4155a29 100644
>>> >> >> --- a/meta/recipes-support/db/db_5.3.28.bb
>>> >> >> +++ b/meta/recipes-support/db/db_5.3.28.bb
>>> >> >> @@ -59,18 +59,7 @@ FILES_SOLIBSDEV = "${libdir}/libdb.so
>>> >> >> ${libdir}/libdb_cxx.so"
>>> >> >>  # All the --disable-* options replace --enable-smallbuild,
>>> >> >> which breaks a bunch of stuff (eg. postfix)  DB5_CONFIG ?=
>>> >> >> "--enable-o_direct --disable-cryptography --disable-queue
>>> >> >> --disable-replication --disable-verify --disable-compat185
>>> >> >> --disable-sql"
>>> >> >>
>>> >> >> -EXTRA_OECONF = "${DB5_CONFIG} --enable-shared --enable-cxx
>>> >> >> --with-sysroot"
>>> >> >> -
>>> >> >> -# Override the MUTEX setting here, the POSIX library is -# the
>>> >> >> default - "POSIX/pthreads/library".
>>> >> >> -# Don't ignore the nice SWP instruction on the ARM:
>>> >> >> -# These enable the ARM assembler mutex code, this won't -#
>>> >> >> work with thumb compilation...
>>> >> >> -ARM_MUTEX = "--with-mutex=ARM/gcc-assembly"
>>> >> >> -MUTEX = ""
>>> >> >> -MUTEX_arm = "${ARM_MUTEX}"
>>> >> >> -MUTEX_armeb = "${ARM_MUTEX}"
>>> >> >> -EXTRA_OECONF += "${MUTEX} STRIP=true"
>>> >> >> +EXTRA_OECONF = "${DB5_CONFIG} --enable-shared --enable-cxx
>>> >> >> --with-sysroot
>>> >> >> STRIP=true"
>>> >> >>  EXTRA_OEMAKE += "LIBTOOL='./${HOST_SYS}-libtool'"
>>> >> >>
>>> >> >>  EXTRA_AUTORECONF += "--exclude=autoheader  -I
>>> >> >> ${S}/dist/aclocal -I${S}/dist/aclocal_java"
>>> >> >> --
>>> >> >> 2.17.1
>>> >> >>
>>> >> >> --
>>> >> >> _______________________________________________
>>> >> >> Openembedded-core mailing list
>>> >> >> Openembedded-core@lists.openembedded.org
>>> >> >> http://lists.openembedded.org/mailman/listinfo/openembedded-cor
>>> >> >> e
>>> >> >>
>>> >> >
>>> >> >
>>> >> >
>>> >> > --
>>> >> > _______________________________________________
>>> >> > Openembedded-core mailing list
>>> >> > Openembedded-core@lists.openembedded.org
>>> >> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>> >> >
>

