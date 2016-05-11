Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f65.google.com (mail-qg0-f65.google.com
	[209.85.192.65])
	by mail.openembedded.org (Postfix) with ESMTP id A380B606D0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 21:31:13 +0000 (UTC)
Received: by mail-qg0-f65.google.com with SMTP id e35so3871576qge.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 14:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MqBnGjpx9mbkzNF3pRPE3C+yTxnbXYWAM0qQEHYJEio=;
	b=X7XjFZRV/H0UZKTqMz5byYkmzmhC/iwoKTEGXYm+42e0v7pjiN5oC+Kkna67pHe6Kr
	ZvGxim7zWzYULAJmBOuJRThSK4mFFcNGzbS4p+pAVvq1wvvzsdsAuPIQnIv5C9qoU05c
	YyqPVGAUK5Piy4p4LFdQTcRWBa5hKq4/IoMQgtCrsU9Nbv1NefnHEDp551F3ptRlY2L7
	yvzwTGNmuCSyQgWljNugZ7PEI7wWVxGdrrMCOdan9657XFr6o7Nd43E8bDbr9oPmrLq2
	d0aNUw0U8a2FIe3gowR8WXhpzsScvGWih4zEGhx+7Dkbt9MglxgRj5yvubOPwm5MlVMK
	JJjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MqBnGjpx9mbkzNF3pRPE3C+yTxnbXYWAM0qQEHYJEio=;
	b=VXpwS9Y9cEBCzbflbbmETGAycDwC8ZNS+adzU+6RK1RQDXUfR+XnzHVi8RUV6PT7GA
	TcMN+oJEqMwbs9dx35bUcJOE2MkO5Jqg5RmLb5Zq0c1yG3vZNWdvndHeVIPp1EokoCAq
	Gm6kfujqXD2JFM8n0oeIByHML+Xejmcax4qVyfJ416hiLHY02+7sAyTEcMHJ36xUzFIX
	KKdR9KD2685Gm+kUX/QJx+GnIuj2k1FBiTFmMHk3dFIPMx6gzuzkofx2ZZnt0ak1XuDI
	a4HuKsnBaaMIzw/oA6s1C//8IwDAopbNO/lyj8Y2eW3tUkuodJmXiSvYHvIZOa5AXOp9
	yteg==
X-Gm-Message-State: AOPr4FXlxVUjdapfRly8TY/fPf/lDXFTs5aTCQW+3CkKp7Jj1+WlmWO2ku+ARN3s3ke4U0OsEe4XzrVnckQItw==
X-Received: by 10.140.92.175 with SMTP id b44mr5855163qge.104.1463002274108;
	Wed, 11 May 2016 14:31:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Wed, 11 May 2016 14:30:44 -0700 (PDT)
In-Reply-To: <CADkTA4P6hCQBMgNXZZY80OTSH2vuxjw0h27fgNvN8p22u8riAQ@mail.gmail.com>
References: <cover.1462987863.git.raj.khem@gmail.com>
	<2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
	<1d16314288f1f93b21bacd0016d23abcab52b501.1462987863.git.raj.khem@gmail.com>
	<CADkTA4P6hCQBMgNXZZY80OTSH2vuxjw0h27fgNvN8p22u8riAQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 May 2016 14:30:44 -0700
Message-ID: <CAMKF1srqdFXR4jD12MFL1rwco2aCyKYwh7dwKnNbC6xnu6ON0Q@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 22/42] linux-yocto: Fix build on ppc with gcc-6
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
X-List-Received-Date: Wed, 11 May 2016 21:31:18 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, May 11, 2016 at 2:27 PM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
>
>
> On Wed, May 11, 2016 at 1:35 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
>
>
> These shouldn't be carried out of tree. So can you drop the linux-yocto
> changes from the
> series, and I'll look at getting them integrated later.

I could but, this series switches to using gcc6 which will start to fail.

>
> Bruce
>
>>
>> ---
>>  ...ace-Fix-out-of-bounds-array-access-warnin.patch | 50
>> ++++++++++++++++++++++
>>  meta/recipes-kernel/linux/linux-yocto_4.4.bb       |  4 +-
>>  2 files changed, 53 insertions(+), 1 deletion(-)
>>  create mode 100644
>> meta/recipes-kernel/linux/linux-yocto/0001-powerpc-ptrace-Fix-out-of-bounds-array-access-warnin.patch
>>
>> diff --git
>> a/meta/recipes-kernel/linux/linux-yocto/0001-powerpc-ptrace-Fix-out-of-bounds-array-access-warnin.patch
>> b/meta/recipes-kernel/linux/linux-yocto/0001-powerpc-ptrace-Fix-out-of-bounds-array-access-warnin.patch
>> new file mode 100644
>> index 0000000..05315ed
>> --- /dev/null
>> +++
>> b/meta/recipes-kernel/linux/linux-yocto/0001-powerpc-ptrace-Fix-out-of-bounds-array-access-warnin.patch
>> @@ -0,0 +1,50 @@
>> +From 32acc1d9a5738b02e8815047af8886978aa40ead Mon Sep 17 00:00:00 2001
>> +From: Khem Raj <raj.khem@gmail.com>
>> +Date: Mon, 25 Apr 2016 05:47:01 +0000
>> +Subject: [PATCH V2] powerpc/ptrace: Fix out of bounds array access
>> warning
>> +
>> +gcc-6 correctly warns about a out of bounds access
>> +
>> +arch/powerpc/kernel/ptrace.c:407:24: warning: index 32 denotes an offset
>> greater than size of 'u64[32][1] {aka long long unsigned int[32][1]}'
>> [-Warray-bounds]
>> +        offsetof(struct thread_fp_state, fpr[32][0]));
>> +                        ^
>> +
>> +check the end of array instead of beginning of next element to fix this
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +Cc: Kees Cook <keescook@chromium.org>
>> +Cc: Michael Ellerman <mpe@ellerman.id.au>
>> +Cc: Segher Boessenkool <segher@kernel.crashing.org>
>> +---
>> +Changes from v1 to v2:
>> +
>> +- Check for fpr[32] instead of fpr[31][1]
>> +
>> + arch/powerpc/kernel/ptrace.c | 4 ++--
>> + 1 file changed, 2 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/arch/powerpc/kernel/ptrace.c b/arch/powerpc/kernel/ptrace.c
>> +index 737c0d0..b38fd08 100644
>> +--- a/arch/powerpc/kernel/ptrace.c
>> ++++ b/arch/powerpc/kernel/ptrace.c
>> +@@ -376,7 +376,7 @@ static int fpr_get(struct task_struct *target, const
>> struct user_regset *regset,
>> +
>> + #else
>> +       BUILD_BUG_ON(offsetof(struct thread_fp_state, fpscr) !=
>> +-                   offsetof(struct thread_fp_state, fpr[32][0]));
>> ++                   offsetof(struct thread_fp_state, fpr[32]));
>> +
>> +       return user_regset_copyout(&pos, &count, &kbuf, &ubuf,
>> +                                  &target->thread.fp_state, 0, -1);
>> +@@ -404,7 +404,7 @@ static int fpr_set(struct task_struct *target, const
>> struct user_regset *regset,
>> +       return 0;
>> + #else
>> +       BUILD_BUG_ON(offsetof(struct thread_fp_state, fpscr) !=
>> +-                   offsetof(struct thread_fp_state, fpr[32][0]));
>> ++                   offsetof(struct thread_fp_state, fpr[32]));
>> +
>> +       return user_regset_copyin(&pos, &count, &kbuf, &ubuf,
>> +                                 &target->thread.fp_state, 0, -1);
>> +--
>> +1.9.1
>> +
>> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
>> b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
>> index b74903e..fbb592a 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
>> @@ -22,7 +22,9 @@ SRCREV_machine ?=
>> "b18090556c1d1b449233cd555c27a04d38272d6d"
>>  SRCREV_meta ?= "9ab4787fe2aea2ae0fcc31a5e067eaba19ef64c8"
>>
>>  SRC_URI =
>> "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH};
>> \
>> -
>> git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
>> +
>> git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}
>> \
>> +
>> file://0001-powerpc-ptrace-Fix-out-of-bounds-array-access-warnin.patch \
>> +"
>>
>>  LINUX_VERSION ?= "4.4.3"
>>
>> --
>> 2.8.2
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee at
> its end"

