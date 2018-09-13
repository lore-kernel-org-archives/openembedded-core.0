Return-Path: <armccurdy@gmail.com>
Received: from mail-vk1-f195.google.com (mail-vk1-f195.google.com
	[209.85.221.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6B09C795DF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2018 22:50:29 +0000 (UTC)
Received: by mail-vk1-f195.google.com with SMTP id e139-v6so1160168vkf.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2018 15:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cttFXVmz/BlKXANNxSMvrqAziblqyYxrDyFVKvCSmaY=;
	b=Z6V4ZsryAN7bnNMpE+vqca4OR1R8eo+bjECXmkmoEgKHWbI3YneC+l9SH+PHVUO/Sq
	AjmtX10mbLUXplbSa4K0VM7qHY/mK58fP37yMt8xh7la0h8Lr9vuGoPpCM7MKKx7DpVE
	AbkHieWjiCWhsKRv1or14ZUYVyK14Oe0q13uXcWNIgh9oJQMSuKmHkUz3nFgfQlLEWhi
	5p0sBO+cbJvsTaTeXbCajVdYIABYJsldmqRUsSfMMsaQvIRS+nBTvyw0rPM+KDwZfAqP
	beZud1iIXYfOPc0l5Zx79XXCJq9L4nVd7n1l57TaAruSpo6pOtF4X1gKbg4KvdSKfsPU
	btAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cttFXVmz/BlKXANNxSMvrqAziblqyYxrDyFVKvCSmaY=;
	b=ZedqC0NI/iJ7cUI1OkBcyQLk4xEfpog+RkCW99LwVUjB2hAKXUlFzobU9Qm8Noo04N
	mERJQvUPGCAmtR4xIOBnI06Mdu3rxwiKKKvoNtP2cRLYhtq34JYVVP5TAZVGKszC5PcS
	6tnfOajvrrdBGfwBaQMit5LLrNkL8lsmqSyD1d++Dy3v8MPtmfLitGXYbseBgPR3W48u
	azJX92bjiXUMm3Tdw/rSnSk8p9+6E4eNknV0LKMJMSYSej3ineTYV10P5mKI+V4mbtaq
	d+5frl8+Lu9sTFhuyqIZrVWCEF2kbvXhkVkZpdXinybXR75O4arNNU1VSjie0/RRD7TP
	XGyw==
X-Gm-Message-State: APzg51CqCCS7oGSmRQi5JhFEaFscDaGYpwO7mYGttVOasT/ChMta0boX
	nORE4jBo1fIT6AtSzDCfmLXAjZAEZmHNmWypZWk=
X-Google-Smtp-Source: ANB0VdYaCqHXU4qQzkbEnOP7YiYn4XTLWSm23NEJcMvdhU3lMnn1GmyKWse9k3bfSyRm6Iae0JaJhXhhy1nPcxM6CGc=
X-Received: by 2002:a1f:dfc3:: with SMTP id
	w186-v6mr3014221vkg.33.1536879030156; 
	Thu, 13 Sep 2018 15:50:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2904:0:0:0:0:0 with HTTP; Thu, 13 Sep 2018 15:50:29
	-0700 (PDT)
In-Reply-To: <CA+chaQePowpbWZi_k-iJKdUn+ocPZC_0T4VBArs82DSuO0iJkw@mail.gmail.com>
References: <20180913072547.12321-1-anuj.mittal@intel.com>
	<CAJ86T=V1LDa=b07pxFi3x-D0ijw0PZMFH_BwsHsoQodhjEOnNg@mail.gmail.com>
	<CA+chaQePowpbWZi_k-iJKdUn+ocPZC_0T4VBArs82DSuO0iJkw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 13 Sep 2018 15:50:29 -0700
Message-ID: <CAJ86T=WukCufiTWU-p8L2cCA4DsnCxC-iPp+Ed-7nWviEAYjRQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tune-core2: use n270 instead of core2duo
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
X-List-Received-Date: Thu, 13 Sep 2018 22:50:29 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 13, 2018 at 3:16 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Is this different issue than what was discussed in:
> https://www.mail-archive.com/openembedded-core@lists.openembedded.org/msg109516.html
>
> The message is slightly different (might be changed in newer qemu used now),
> but the issue I had before was that features of selected -cpu and host cpu
> didn't match and qemu failed with:
> qemu-system-x86_64: warning: host doesn't support requested feature:
> CPUID.01H:EDX.ss [bit 27]
> when some features were missing and kvm was used.
>
> If it's the same root cause, then it's not a bug in qemu.

Thanks. Looks like it could be the same issue - if qemu is running
with KVM on a host which isn't natively compatible with the full
core2duo feature set.

From the Yocto bug these warnings are coming from the nightly builds:

  https://bugzilla.yoctoproject.org/show_bug.cgi?id=12916

Has something changed recently? Have the nightly builds moved onto an
AMD machine?


> On Thu, Sep 13, 2018 at 11:33 PM Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>> On Thu, Sep 13, 2018 at 12:25 AM, Anuj Mittal <anuj.mittal@intel.com>
>> wrote:
>> > Fixes warnings in builds using core2-32 tune:
>> >
>> > warning: TCG doesn't support requested feature:
>> > CPUID.80000001H:EDX.syscall [bit 11]
>> > warning: TCG doesn't support requested feature: CPUID.80000001H:EDX.lm
>> > [bit 29]
>> >
>> > when executing postinsts using qemu-i386.
>> >
>> > i386 target doesn't enable CPUID_EXT2_SYSCALL and CPUID_EXT2_LM [1]
>> > while cpu choice of core2duo that we use for core2-32 TUNE does [2].
>> > Use n270 cpu instead to use with qemu which supports SSSE3 and doesn't
>> > have these bits enabled [3].
>> >
>> > [1] https://github.com/qemu/qemu/blob/master/target/i386/cpu.c#L739
>> > [2] https://github.com/qemu/qemu/blob/master/target/i386/cpu.c#L1439
>> > [3] https://github.com/qemu/qemu/blob/master/target/i386/cpu.c#L1603
>> >
>> > Fixes [YOCTO #12916]
>>
>> Is this working around a bug in qemu?
>>
>> > Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>> ---
>> >  meta/conf/machine/include/tune-core2.inc | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/meta/conf/machine/include/tune-core2.inc
>> > b/meta/conf/machine/include/tune-core2.inc
>> > index c686bb4682..ddde719bde 100644
>> > --- a/meta/conf/machine/include/tune-core2.inc
>> > +++ b/meta/conf/machine/include/tune-core2.inc
>> > @@ -21,7 +21,7 @@ TUNE_FEATURES_tune-core2-32 =
>> > "${TUNE_FEATURES_tune-x86} core2"
>> >  BASE_LIB_tune-core2-32 = "lib"
>> >  TUNE_PKGARCH_tune-core2-32 = "core2-32"
>> >  PACKAGE_EXTRA_ARCHS_tune-core2-32 = "${PACKAGE_EXTRA_ARCHS_tune-i686}
>> > core2-32"
>> > -QEMU_EXTRAOPTIONS_core2-32 = " -cpu core2duo"
>> > +QEMU_EXTRAOPTIONS_core2-32 = " -cpu n270"
>> >
>> >  AVAILTUNES += "core2-64"
>> >  TUNE_FEATURES_tune-core2-64 = "${TUNE_FEATURES_tune-x86-64} core2"
>> > --
>> > 2.17.1
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

