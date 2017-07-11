Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4A02E77BF0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 14:28:01 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id 77so256707wrb.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 07:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JB3oZncq53g+4flqc3MmaSqaMtf7ATbuhhD8XWy9EJ4=;
	b=SC0ei8ZU9+25SLGIxMnhNhrTx6ukFNnSHnx+jTMLq8XjatkPUJbY69iXeLA5PtxakC
	5HmOkwsFlG00MoRpEA5e7peHMRx4NiZRe8qt1FCpeGHVViwSr0Qcm2+yjRmBjVWljJDq
	GX3G9vYMc6/N6XSYLEaazoHni4z346Koh4vMKYsPHfJ1lQsJp+nyE4prMpYw7P2p2r+q
	Lmi1KkrnN/DRSUWnVhu6cUi926s2B1wM+TKDCk0geIQfjTLSmXicCW9QCRnzcsDPjYRc
	PZkug9HpADJfguq9+JWJCUevOvVHFFz48RrW9yMT+Iuq9rese82x4Nkk5S7wo22w/IJv
	Ub4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JB3oZncq53g+4flqc3MmaSqaMtf7ATbuhhD8XWy9EJ4=;
	b=oXjgPi0I8nT9tOCmAoqatHkCr9mkhRcs9HAp/M5/Ay79UN7B02LYZd6drkHP6/ejNY
	mGrAOP7i2mN62DmPIsdp2WfLvPBu1eAsRTrc2pQCnqnNO5RQDRL4wQivC2BKSllg5E5a
	w4fdMWo0MhQ/UTaCuHcCAP8LWN4xFmlLjwhwDEKFUYIadMLQxAyBmDzMoiZ6f3BmjZNn
	NX26yGpaxVmhGLZegQaSiVqJu3CFeyb4a76KbqX1L2Rz9FbqJuKRinqL3MdwRCrvW1jj
	braTJWQ/vx3tNHiEzDColWV/Rhh2HWLtqgmCr18yYXV6vNHod1YyDY6rdg/Vc/97cpWU
	iGCQ==
X-Gm-Message-State: AIVw112SBpKgAGyTqoJFLbXU882YHQEOJU8te9L7fdCxGj2UGNo1dyHB
	te5m3nic3mSjKa5CflJFOfpvAG8GmQ==
X-Received: by 10.80.145.198 with SMTP id h6mr2741996eda.108.1499783282965;
	Tue, 11 Jul 2017 07:28:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.145.210 with HTTP; Tue, 11 Jul 2017 07:27:32 -0700 (PDT)
In-Reply-To: <CA+chaQcZbeocSbAhDUyzP4FLKbBe5Wsw6RL-Xp0paNt-JYGb1w@mail.gmail.com>
References: <20170711140546.23414-1-raj.khem@gmail.com>
	<CA+chaQcZbeocSbAhDUyzP4FLKbBe5Wsw6RL-Xp0paNt-JYGb1w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 11 Jul 2017 07:27:32 -0700
Message-ID: <CAMKF1sp0XwJx09aiDwLLTcOfK26=NzAWqjeggvkGzsk8c=xnRg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-cross: Fix linker and fortran symlinks
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
X-List-Received-Date: Tue, 11 Jul 2017 14:28:02 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 11, 2017 at 7:16 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Shouldn't the symlink be created in ${D}${STAGING_DIR_NATIVE} as suggested
> in:
> http://lists.openembedded.org/pipermail/openembedded-core/2014-April/091480.html

unrelated to this change but I agree, probably we can get by creating relative
symlink in ${D}${STAGING_DIR_NATIVE}${prefix_native}/bin

>
> On Tue, Jul 11, 2017 at 3:05 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> If we used -fuse-ld gcc option, then it does not work
>> ending in
>>
>> collect2: fatal error: cannot find 'ld'
>> compilation terminated.
>>
>> This is because we are not creating proper symlinks for BFD
>> and Gold linker in gcc installation
>>
>> Secondly, we end up with dangling fortran compiler symlinks
>> if fortran is not enabled when confguring gcc, therefore
>> create these symlinks only when fortran support is enabled
>> in gcc
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta/recipes-devtools/gcc/gcc-cross.inc | 10 ++++++----
>>  1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc
>> b/meta/recipes-devtools/gcc/gcc-cross.inc
>> index b08bc197ba..1e184a60db 100644
>> --- a/meta/recipes-devtools/gcc/gcc-cross.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-cross.inc
>> @@ -161,17 +161,19 @@ do_install () {
>>
>>         install -d ${D}${target_base_libdir}
>>         install -d ${D}${target_libdir}
>> -
>> +
>>         # Link gfortran to g77 to satisfy not-so-smart configure or hard
>> coded g77
>>         # gfortran is fully backwards compatible. This is a safe and
>> practical solution.
>> -       ln -sf
>> ${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX}gfortran
>> ${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX}g77 || true
>> +       if [ -n "${@d.getVar('FORTRAN')}" ]; then
>> +               ln -sf
>> ${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX}gfortran
>> ${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX}g77 || true
>> +               fortsymlinks="g77 gfortran"
>> +       fi
>>
>> -
>>         # Insert symlinks into libexec so when tools without a prefix are
>> searched for, the correct ones are
>>         # found. These need to be relative paths so they work in different
>> locations.
>>         dest=${D}${libexecdir}/gcc/${TARGET_SYS}/${BINV}/
>>         install -d $dest
>> -       for t in ar as ld nm objcopy objdump ranlib strip g77 gcc cpp
>> gfortran; do
>> +       for t in ar as ld ld.bfd ld.gold nm objcopy objdump ranlib strip
>> gcc cpp $fortsymlinks; do
>>                 ln -sf ${BINRELPATH}/${TARGET_PREFIX}$t $dest$t
>>                 ln -sf ${BINRELPATH}/${TARGET_PREFIX}$t
>> ${dest}${TARGET_PREFIX}$t
>>         done
>> --
>> 2.13.2
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

