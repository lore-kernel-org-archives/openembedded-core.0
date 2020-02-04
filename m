Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8AF38611D0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Feb 2020 04:17:44 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id g3so3275742pgs.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Feb 2020 20:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=FkJJWYJeghoAGRzgFc+Kt09ssMaZ+x6AIs0sjZt6IPI=;
	b=FNDWROtzmQQV6DSvcmUmm1ANuh5XM1/CcctkdKTSKzZF/AINdWEL04UcgjiThhSIow
	sxi+h+4/PHPy8x+cFX7KuDHrzlu0ivdVI6TTXEUlRHEiIwSeUIfGf+vpbZ51b4hEZ91U
	RleSmNf+VN6n0VZgm/A13K08pNQ328Q1ZUdrtDXEWTIms8BqLNTrxVRKAzJJnS5nzmFE
	EGoIZP7HpZN24zQkubBSuCPuGy1ZA5JAS4vLKAIyJnRG49B7RrX20LyT/Ke1Tb9Y7Igg
	8yPHF7uBvjz3pCbveYv0ah52VriNU9ogG2u5KXbiKEmeAAuLx1VDbma2DN24MgHn9/KA
	31sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=FkJJWYJeghoAGRzgFc+Kt09ssMaZ+x6AIs0sjZt6IPI=;
	b=HtnpeXl5AcM0S17+lM97WJs+04rGmM/vJOLzBnEoMz0AhGQAg/DfXsP/mF53g6dvv3
	tEoYxVi+KJ446ILYRQ1oTaNMlUxjgnSMg82FYuAbt1h4ILHb/MEEOcfXJBEV8+CaM0Az
	qziZevIF03hDmE2EwMgYLZL4GtEsipW5JcuB9vqPMcSgF3+00KoyHDVFM+hAMdGzZ9yK
	fG8za4tGPHgL1w0lGk5mrjzrnU+aMOwtvJRfZ3vopPUABBMHPQKiC/r+EMSFAew78ffC
	ZhRJu9VpD0kA8Zt6japFjjGXGEaB7x/cUOYx/8+3m3IJGtFFa7POb4omaOBhgJLb4VjK
	ZKMA==
X-Gm-Message-State: APjAAAUrNrHYVX4QElfjelrX8hSlUyfhv3HhU/QyZ7A+1mZWbPAlelhS
	AHg+il9sUH9vSXTbW9hpHVc4KOW9
X-Google-Smtp-Source: APXvYqxR4tG/edUKievjetkJksvoP1Ohyna52ndEVVJ51iVPG2xzYAv+nSACwYIwQWzlrNyXWd0uhA==
X-Received: by 2002:a63:e84d:: with SMTP id a13mr30629367pgk.274.1580789865231;
	Mon, 03 Feb 2020 20:17:45 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0::afc? ([2601:202:4180:a5c0::afc])
	by smtp.gmail.com with ESMTPSA id
	64sm22243213pfd.48.2020.02.03.20.17.44
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 03 Feb 2020 20:17:44 -0800 (PST)
To: Khem Raj <raj.khem@gmail.com>, Taras Kondratiuk <takondra@cisco.com>
References: <20200204022006.714-1-takondra@cisco.com>
	<CAMKF1sqmKCwbdE1uncP+k+7OQGrHawJ3dTM1h1_yO9EJuV00iQ@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <baf2b1ab-bc63-c350-4956-000c64d4b51d@gmail.com>
Date: Mon, 3 Feb 2020 20:17:42 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqmKCwbdE1uncP+k+7OQGrHawJ3dTM1h1_yO9EJuV00iQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	XE-Linux <xe-linux-external@cisco.com>
Subject: Re: [PATCH] gcc-9.2: fix bug #91102 'aarch64 ICE on Linux kernel with -Os'
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
X-List-Received-Date: Tue, 04 Feb 2020 04:17:44 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 2/3/20 7:57 PM, Khem Raj wrote:
> this is ok. Also please ask it to be backported to 9.3 on gcc bugzilla

And zeus : )

- armin
>
> On Mon, Feb 3, 2020 at 6:20 PM Taras Kondratiuk <takondra@cisco.com> wrote:
>> Linux kernel compilation for aarch64 triggers ICE if
>> CONFIG_CC_OPTIMIZE_FOR_SIZE=y.
>>
>> The rootcause is GCC bug #91102 'aarch64 ICE on Linux kernel with -Os'.
>> Apply the fix to 9.2.
>>
>> Signed-off-by: Taras Kondratiuk <takondra@cisco.com>
>> ---
>>  meta/recipes-devtools/gcc/gcc-9.2.inc         |  1 +
>>  ...02-aarch64-ICE-on-Linux-kernel-with-.patch | 95 +++++++++++++++++++
>>  2 files changed, 96 insertions(+)
>>  create mode 100644 meta/recipes-devtools/gcc/gcc-9.2/re-PR-target-91102-aarch64-ICE-on-Linux-kernel-with-.patch
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-9.2.inc b/meta/recipes-devtools/gcc/gcc-9.2.inc
>> index 926df11c2782..2bae85afe3a3 100644
>> --- a/meta/recipes-devtools/gcc/gcc-9.2.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-9.2.inc
>> @@ -69,6 +69,7 @@ SRC_URI = "\
>>            file://CVE-2019-15847_1.patch \
>>            file://CVE-2019-15847_2.patch \
>>            file://CVE-2019-15847_3.patch \
>> +           file://re-PR-target-91102-aarch64-ICE-on-Linux-kernel-with-.patch \
>>  "
>>  S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
>>  SRC_URI[md5sum] = "3818ad8600447f05349098232c2ddc78"
>> diff --git a/meta/recipes-devtools/gcc/gcc-9.2/re-PR-target-91102-aarch64-ICE-on-Linux-kernel-with-.patch b/meta/recipes-devtools/gcc/gcc-9.2/re-PR-target-91102-aarch64-ICE-on-Linux-kernel-with-.patch
>> new file mode 100644
>> index 000000000000..c37e0bb9dd9b
>> --- /dev/null
>> +++ b/meta/recipes-devtools/gcc/gcc-9.2/re-PR-target-91102-aarch64-ICE-on-Linux-kernel-with-.patch
>> @@ -0,0 +1,95 @@
>> +From efb0ee06f5c0186c2d1442ecd4dbbd55dbd97b44 Mon Sep 17 00:00:00 2001
>> +From: Vladimir Makarov <vmakarov@redhat.com>
>> +Date: Wed, 10 Jul 2019 16:07:10 +0000
>> +Subject: [PATCH] re PR target/91102 (aarch64 ICE on Linux kernel with -Os
>> + starting with r270266)
>> +
>> +2019-07-10  Vladimir Makarov  <vmakarov@redhat.com>
>> +
>> +       PR target/91102
>> +       * lra-constraints.c (process_alt_operands): Don't match user
>> +       defined regs only if they are early clobbers.
>> +
>> +2019-07-10  Vladimir Makarov  <vmakarov@redhat.com>
>> +
>> +       PR target/91102
>> +       * gcc.target/aarch64/pr91102.c: New test.
>> +
>> +From-SVN: r273357
>> +Upstream-Status: Backport [https://github.com/gcc-mirror/gcc/commit/613caed2feb9cfc8158308670b59df3d031ec629]
>> +[takondra: dropped conflicting ChangeLog changes]
>> +Signed-off-by: Taras Kondratiuk <takondra@cisco.com>
>> +---
>> + gcc/lra-constraints.c                      | 17 ++++++++++----
>> + gcc/testsuite/gcc.target/aarch64/pr91102.c | 26 ++++++++++++++++++++++
>> + 2 files changed, 39 insertions(+), 4 deletions(-)
>> + create mode 100644 gcc/testsuite/gcc.target/aarch64/pr91102.c
>> +
>> +diff --git a/gcc/lra-constraints.c b/gcc/lra-constraints.c
>> +index cf33da8013e4..6382dbf852b6 100644
>> +--- a/gcc/lra-constraints.c
>> ++++ b/gcc/lra-constraints.c
>> +@@ -2172,8 +2172,9 @@ process_alt_operands (int only_alternative)
>> +                   else
>> +                     {
>> +                       /* Operands don't match.  If the operands are
>> +-                         different user defined explicit hard registers,
>> +-                         then we cannot make them match.  */
>> ++                         different user defined explicit hard
>> ++                         registers, then we cannot make them match
>> ++                         when one is early clobber operand.  */
>> +                       if ((REG_P (*curr_id->operand_loc[nop])
>> +                            || SUBREG_P (*curr_id->operand_loc[nop]))
>> +                           && (REG_P (*curr_id->operand_loc[m])
>> +@@ -2192,9 +2193,17 @@ process_alt_operands (int only_alternative)
>> +                               && REG_P (m_reg)
>> +                               && HARD_REGISTER_P (m_reg)
>> +                               && REG_USERVAR_P (m_reg))
>> +-                            break;
>> ++                            {
>> ++                              int i;
>> ++
>> ++                              for (i = 0; i < early_clobbered_regs_num; i++)
>> ++                                if (m == early_clobbered_nops[i])
>> ++                                  break;
>> ++                              if (i < early_clobbered_regs_num
>> ++                                  || early_clobber_p)
>> ++                                break;
>> ++                            }
>> +                         }
>> +-
>> +                       /* Both operands must allow a reload register,
>> +                          otherwise we cannot make them match.  */
>> +                       if (curr_alt[m] == NO_REGS)
>> +diff --git a/gcc/testsuite/gcc.target/aarch64/pr91102.c b/gcc/testsuite/gcc.target/aarch64/pr91102.c
>> +new file mode 100644
>> +index 000000000000..70b99045a48e
>> +--- /dev/null
>> ++++ b/gcc/testsuite/gcc.target/aarch64/pr91102.c
>> +@@ -0,0 +1,26 @@
>> ++/* PR target/91102 */
>> ++/* { dg-do compile } */
>> ++/* { dg-options "-O2" } */
>> ++
>> ++int
>> ++foo (long d, long l)
>> ++{
>> ++  register long e asm ("x1") = d;
>> ++  register long f asm("x2") = l;
>> ++  asm ("" : : "r" (e), "r" (f));
>> ++  return 3;
>> ++}
>> ++
>> ++struct T { int i; int j; };
>> ++union S { long h; struct T t; };
>> ++
>> ++void
>> ++bar (union S b)
>> ++{
>> ++  while (1)
>> ++    {
>> ++      union S c = b;
>> ++      c.t.j++;
>> ++      b.h = foo (b.h, c.h);
>> ++    }
>> ++}
>> --
>> 2.18.1
>>


