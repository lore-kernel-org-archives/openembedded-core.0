Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8952065CBC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 13:57:28 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id b136so21055782qkg.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 06:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=h6vPKwS45laNXCksKE8+G5UiP2CnTCB0zns4EkqC1dE=;
	b=Nvu2BL3zZPVIvTCgy8dBRGNpRt1T5mx4m8Xs/ZQvhZsSGFAbgfHwPGJfIPscxwIKMl
	+UFeRj8YxpXDFiiPwWq6iSGqIZD0GcrYHfR1xAdLpnhw1J5cxZyrfdY9aWUrozmTm7h2
	RQUJbdTYUMArdzH7JIds9pxQZppX+3IBqYC27EgDNT7qXdbDpRGJoEAIX7YoRuto3s3A
	MBtJT3efvIvD/Dt2HHzpat50G+lbLc7bzphbHh2RNrSOFRcib71b0Do+4eKpik6nBFpH
	CpgBnaCX3VvFO144dX7HwLGApKSLTuNL5W7jEcbK8mAKrUhhHKlU+E7naJHCzP9Tbnpz
	Ji0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=h6vPKwS45laNXCksKE8+G5UiP2CnTCB0zns4EkqC1dE=;
	b=LeGOx5dT0cgoih2jo519wNLqRniCFWgSJLy1MUVnvIb+sXd3Id+pmDgZJyYi9Bos/X
	5naQlrchMjOJtZeA/SOXqZf23wL08xFVeqn7Xe8LJYZldPU1vGMzg70uOav8kS2D5PiF
	SpiE5VbJPdAA83X0vJGwFdespesgcUP19x+ffxecNC6rGG/hKMI8f7tgTbsDScTzO+ib
	aLU/wmK2eYpW8dm+X/dIT5ry3G2SIK+2uUCX0et1XCiee7sbBvmc5KU4FhoCWbGZdY7k
	DlIqk5Y3xSLb0O+MOLoQzpoWJmXjsCt9BwnRUNCXMbJPQjxcTytX5AhkLPQPV9mR2VjC
	w7Eg==
X-Gm-Message-State: ALyK8tLGiO+pk6/NaKVvTdkrph/I5PhjsHt9gYWqeJrX+Dpz41Cl6SFMay++4Uxp0VSKHbf5JkIDoL67jyCtAQ==
X-Received: by 10.200.33.172 with SMTP id 41mr4981312qty.26.1466776649684;
	Fri, 24 Jun 2016 06:57:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.8.133 with HTTP; Fri, 24 Jun 2016 06:57:00 -0700 (PDT)
In-Reply-To: <CAJTo0LbTunHyH_iss4dLTzcOwADNnVp2gdmGoMrWtgyt0Myx_w@mail.gmail.com>
References: <1466765671-22371-1-git-send-email-git@andred.net>
	<1466765671-22371-4-git-send-email-git@andred.net>
	<CAMKF1soqpKFDgoeKcAjiqbptR4xDFQ+VYRSt9kT67Uy=Bj8v7g@mail.gmail.com>
	<CAJTo0LbTunHyH_iss4dLTzcOwADNnVp2gdmGoMrWtgyt0Myx_w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 24 Jun 2016 06:57:00 -0700
Message-ID: <CAMKF1spjUmGWxmS_+inmTCecFLQtbwQ5Pj=LAzsarA5_ymO4CQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] uclibc: really enable verbose compilation
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
X-List-Received-Date: Fri, 24 Jun 2016 13:57:30 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jun 24, 2016 at 6:51 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 24 June 2016 at 14:46, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> keep V=2
>
>
> That's very concise Khem.  If V=2 doesn't produce verbose output but V=1 in
> EXTRA_OEMAKE does, why keep the export V=2?

too early here for me. I took it as if exporting it did not work , so
now I tried here with uclibc-ng for both

make V=2

  CC ldso/ldso/ldso.oS -DNDEBUG -DNOT_IN_libc -DIS_IN_rtld
-DUCLIBC_RUNTIME_PREFIX="/usr/x86_64-linux-uclibc/"
-DUCLIBC_LDSO="ld64-uClibc.so.1" -DIN_LIB=rtld -DSHARED
-DLDSO_ELFINTERP="x86_64/elfinterp.c"

make V=1

gcc -c ldso/ldso/ldso.c -o /tmp/uu/ldso/ldso/ldso.oS -Wall
-Wstrict-prototypes -Wstrict-aliasing -funsigned-char -fno-builtin
-fno-asm -fmerge-all-constants -std=gnu99 -fno-stack-protector
-nostdinc -I/tmp/uu/include -I./include -include libc-symbols.h
-I./libc/sysdeps/linux/x86_64 -I./libc/sysdeps/linux
-I./ldso/ldso/x86_64 -I./ldso/include -I. -Os -fstrict-aliasing
-I./libc/sysdeps/linux/common -isystem
/usr/lib/gcc/x86_64-pc-linux-gnu/6.1.1/include-fixed -isystem
/usr/lib/gcc/x86_64-pc-linux-gnu/6.1.1/include -I/ -DNDEBUG
-DNOT_IN_libc -DIS_IN_rtld -fno-stack-protector
-fno-omit-frame-pointer -I./ldso/ldso/x86_64 -I./ldso/include
-I./ldso/ldso -DUCLIBC_RUNTIME_PREFIX=\"/usr/x86_64-linux-uclibc/\"
-DUCLIBC_LDSO=\"ld64-uClibc.so.1\" -DIN_LIB=rtld -fPIC -DSHARED
-DLDSO_ELFINTERP=\"x86_64/elfinterp.c\" -MT /tmp/uu/ldso/ldso/ldso.oS
-MD -MP -MF /tmp/uu/ldso/ldso/.ldso.oS.dep

So it must be local issue.

>
> Ross

