Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0AC4C7F080
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2019 06:53:19 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id m30so20432895pff.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2019 23:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=VcQzzkphr3yPD6+Zi4vdqpBb5omRmil3b3Q5GfR+6z0=;
	b=M8kSlSpjgfX4WS+uwKhnhrVzdJMuWClH4jN1W48WZEM0ZtYUFhot1nij6iw+r6f63O
	Yr3BfXmhOHqlc0m6Q5R4+sGwREjfiZPy37PY5wXAdorg9YKRGO3ISt9/7jqbHssNhuaz
	L/LvFBYWO62zy1meFsJTXmpQsWi9LZlf7XbjNvEL9fFoJAm4IxDvnlMZ81O1cw/YDi05
	QtdHoiAhkU8DBW0n3nY/gK4T9qbad3qR/kJiZJzKWtGxhASyW9UeIvCaOLT/UDbMijwP
	8f9RKyDTAt5RBZSixofeiStpJQmgHQlhf7LQig7hQm1UlVqLucHhZ8ZjQ3bPHXFi4JxA
	+rXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=VcQzzkphr3yPD6+Zi4vdqpBb5omRmil3b3Q5GfR+6z0=;
	b=P0SYwsggBhJHjQTijgw3BM3jDqAckyN1Xn4Fgv1uaNOX4g3MjC37lkT0tiVqlHOGZs
	gQ7RwuZZHnDb2zmrEfN8LyGI2111cxw3ncAsg8SXCOSj/YGmZWUmhEDo6Ml1fyt9397t
	pa18j+9Hh4hjX8cCfrm+sCyFVYzLa01TCikh49tOy2MqXnFGeXx0CGzEOxneoHRkFMrx
	1gwC3iP05jIMdpb+9MTcjZ/l/eULpDCza3Cm8Fa1nlwE9BHfTp1PntmKCt/zrnUU1UNN
	2wN8mwXyqZPCHhyPARy5V8qxX1Fnk4JT4CWAVu14+fdRq/UdW0hWs1DmAdnfEpDNo59M
	JxGg==
X-Gm-Message-State: APjAAAV6oroW5B5nGbrmkcgxYy1DxYSZ2kKDN0n8gMBhYf7fJkPE0PsG
	CJFgJC8mkv1iBn5im3lXAfc3+N4B0K8=
X-Google-Smtp-Source: APXvYqw8N0Z+iUIgNnD/87eADtE2xjapqk6KwSTihlBj6YnAex46behVDQftyu/ESmC6ji2pCpFIug==
X-Received: by 2002:a17:90a:2488:: with SMTP id
	i8mr84541670pje.123.1563951200587; 
	Tue, 23 Jul 2019 23:53:20 -0700 (PDT)
Received: from ?IPv6:2601:646:8500:6bc6::effc? ([2601:646:8500:6bc6::effc])
	by smtp.gmail.com with ESMTPSA id
	q24sm40107742pjp.14.2019.07.23.23.53.19
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Jul 2019 23:53:20 -0700 (PDT)
To: "Mittal, Anuj" <anuj.mittal@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20190724055607.30927-1-raj.khem@gmail.com>
	<d108d3e1e13962b7810a74cb04273e9d21617bfe.camel@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS
Message-ID: <9f6c23fc-e2b0-2581-dbc9-61430c7035c6@gmail.com>
Date: Tue, 23 Jul 2019 23:53:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d108d3e1e13962b7810a74cb04273e9d21617bfe.camel@intel.com>
Subject: Re: [PATCH] linux-libc-header: Fix ptrace.h and prctl.h conflict on aarch64
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
X-List-Received-Date: Wed, 24 Jul 2019 06:53:20 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 7/23/19 11:27 PM, Mittal, Anuj wrote:
> On Tue, 2019-07-23 at 22:56 -0700, Khem Raj wrote:
>> This is a backport from 5.2 release upstream, it fixes long standing
>> build failure on musl/aarch64
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>   ...sm-ptrace.h-should-not-depend-on-uap.patch | 62
>> +++++++++++++++++++
>>   .../linux-libc-headers_5.0.bb                 |  1 +
>>   ...ttribute-alias-with-Wattribute-alias.patch | 43 +++++++++++++
>>   3 files changed, 106 insertions(+)
>>   create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-
>> libc-headers/0001-arm64-sve-uapi-asm-ptrace.h-should-not-depend-on-
>> uap.patch
>>   create mode 100644 meta/recipes-kernel/linux/files/0001-Replace-
>> Wattribute-alias-with-Wattribute-alias.patch
>>
> This second patch looks unrelated to this commit.


indeed


>
> Thanks,
> Anuj
>
>> diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-
>> headers/0001-arm64-sve-uapi-asm-ptrace.h-should-not-depend-on-
>> uap.patch b/meta/recipes-kernel/linux-libc-headers/linux-libc-
>> headers/0001-arm64-sve-uapi-asm-ptrace.h-should-not-depend-on-
>> uap.patch
>> new file mode 100644
>> index 0000000000..5ea46e9590
>> --- /dev/null
>> +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-
>> arm64-sve-uapi-asm-ptrace.h-should-not-depend-on-uap.patch
>> @@ -0,0 +1,62 @@
>> +From 35341ca0614ab13e1ef34ad4f29a39e15ef31fa8 Mon Sep 17 00:00:00
>> 2001
>> +From: Anisse Astier <aastier@freebox.fr>
>> +Date: Mon, 17 Jun 2019 15:22:22 +0200
>> +Subject: [PATCH] arm64/sve: <uapi/asm/ptrace.h> should not depend on
>> + <uapi/linux/prctl.h>
>> +
>> +Pulling linux/prctl.h into asm/ptrace.h in the arm64 UAPI headers
>> causes
>> +userspace build issues for any program (e.g. strace and qemu) that
>> +includes both <sys/prctl.h> and <linux/ptrace.h> when using musl
>> libc:
>> +
>> +  | error: redefinition of 'struct prctl_mm_map'
>> +  |  struct prctl_mm_map {
>> +
>> +See
>> https://github.com/foundriesio/meta-lmp/commit/6d4a106e191b5d79c41b9ac78fd321316d3013c0
>> +for a public example of people working around this issue.
>> +
>> +Although it's a bit grotty, fix this breakage by duplicating the
>> prctl
>> +constant definitions. Since these are part of the kernel ABI, they
>> +cannot be changed in future and so it's not the end of the world to
>> have
>> +them open-coded.
>> +
>> +Fixes: 43d4da2c45b2 ("arm64/sve: ptrace and ELF coredump support")
>> +
>> +Upstream-Status: Backport [
>> https://github.com/torvalds/linux/commit/35341ca0614ab13e1ef34ad4f29a39e15ef31fa8
>> ]
>> +Cc: stable@vger.kernel.org
>> +Acked-by: Dave Martin <Dave.Martin@arm.com>
>> +Signed-off-by: Anisse Astier <aastier@freebox.fr>
>> +Signed-off-by: Will Deacon <will.deacon@arm.com>
>> +---
>> + arch/arm64/include/uapi/asm/ptrace.h | 8 +++-----
>> + 1 file changed, 3 insertions(+), 5 deletions(-)
>> +
>> +diff --git a/arch/arm64/include/uapi/asm/ptrace.h
>> b/arch/arm64/include/uapi/asm/ptrace.h
>> +index 97c53203150b..e932284993d4 100644
>> +--- a/arch/arm64/include/uapi/asm/ptrace.h
>> ++++ b/arch/arm64/include/uapi/asm/ptrace.h
>> +@@ -65,8 +65,6 @@
>> +
>> + #ifndef __ASSEMBLY__
>> +
>> +-#include <linux/prctl.h>
>> +-
>> + /*
>> +  * User structures for general purpose, floating point and debug
>> registers.
>> +  */
>> +@@ -113,10 +111,10 @@ struct user_sve_header {
>> +
>> + /*
>> +  * Common SVE_PT_* flags:
>> +- * These must be kept in sync with prctl interface in
>> <linux/ptrace.h>
>> ++ * These must be kept in sync with prctl interface in
>> <linux/prctl.h>
>> +  */
>> +-#define SVE_PT_VL_INHERIT		(PR_SVE_VL_INHERIT >> 16)
>> +-#define SVE_PT_VL_ONEXEC		(PR_SVE_SET_VL_ONEXEC >> 16)
>> ++#define SVE_PT_VL_INHERIT		((1 << 17) /* PR_SVE_VL_INHERIT
>> */ >> 16)
>> ++#define SVE_PT_VL_ONEXEC		((1 << 18) /*
>> PR_SVE_SET_VL_ONEXEC */ >> 16)
>> +
>> +
>> + /*
>> +--
>> +2.22.0
>> +
>> diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-
>> headers_5.0.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-
>> headers_5.0.bb
>> index e76120c5b8..473688d95f 100644
>> --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-
>> headers_5.0.bb
>> +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-
>> headers_5.0.bb
>> @@ -12,6 +12,7 @@ SRC_URI_append_libc-musl = "\
>>   SRC_URI_append = "\
>>       file://0001-scripts-Use-fixed-input-and-output-files-instead-of-
>> .patch \
>>       file://0001-kbuild-install_headers.sh-Strip-_UAPI-from-if-
>> define.patch \
>> +    file://0001-arm64-sve-uapi-asm-ptrace.h-should-not-depend-on-
>> uap.patch \
>>   "
>>   
>>   SRC_URI[md5sum] = "7381ce8aac80a01448e065ce795c19c0"
>> diff --git a/meta/recipes-kernel/linux/files/0001-Replace-Wattribute-
>> alias-with-Wattribute-alias.patch b/meta/recipes-
>> kernel/linux/files/0001-Replace-Wattribute-alias-with-Wattribute-
>> alias.patch
>> new file mode 100644
>> index 0000000000..b41b277bb4
>> --- /dev/null
>> +++ b/meta/recipes-kernel/linux/files/0001-Replace-Wattribute-alias-
>> with-Wattribute-alias.patch
>> @@ -0,0 +1,43 @@
>> +From 229c673813b7dff90f82f1062724319dfeb6861a Mon Sep 17 00:00:00
>> 2001
>> +From: Khem Raj <raj.khem@gmail.com>
>> +Date: Fri, 21 Dec 2018 15:57:35 -0800
>> +Subject: [PATCH] Replace "-Wattribute-alias" with "-Wattribute-
>> alias="
>> +
>> +makes gcc9 happy but makes gcc8 sad :(
>> +I guess I cant end world hunger
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +---
>> + include/linux/compat.h   | 2 +-
>> + include/linux/syscalls.h | 2 +-
>> + 2 files changed, 2 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/include/linux/compat.h b/include/linux/compat.h
>> +index de0c13bdcd2c..95d1192da1f5 100644
>> +--- a/include/linux/compat.h
>> ++++ b/include/linux/compat.h
>> +@@ -73,7 +73,7 @@
>> + #ifndef COMPAT_SYSCALL_DEFINEx
>> + #define COMPAT_SYSCALL_DEFINEx(x, name, ...)			
>> 		\
>> + 	__diag_push();							
>> 	\
>> +-	__diag_ignore(GCC, 8, "-Wattribute-alias",			
>> 	\
>> ++	__diag_ignore(GCC, 8, "-Wattribute-alias=",			
>> 	\
>> + 		      "Type aliasing is used to sanitize syscall
>> arguments");\
>> + 	asmlinkage long
>> compat_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__));	\
>> + 	asmlinkage long
>> compat_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))	\
>> +diff --git a/include/linux/syscalls.h b/include/linux/syscalls.h
>> +index 2ff814c92f7f..58f761d2c9e9 100644
>> +--- a/include/linux/syscalls.h
>> ++++ b/include/linux/syscalls.h
>> +@@ -234,7 +234,7 @@ static inline int is_syscall_trace_event(struct
>> trace_event_call *tp_event)
>> + #ifndef __SYSCALL_DEFINEx
>> + #define __SYSCALL_DEFINEx(x, name, ...)				
>> 	\
>> + 	__diag_push();							
>> \
>> +-	__diag_ignore(GCC, 8, "-Wattribute-alias",			
>> \
>> ++	__diag_ignore(GCC, 8, "-Wattribute-alias=",			
>> \
>> + 		      "Type aliasing is used to sanitize syscall
>> arguments");\
>> + 	asmlinkage long sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))	\
>> + 		__attribute__((alias(__stringify(__se_sys##name))));	
>> \
>> +--
>> +2.20.1
>> +
>> -- 
>> 2.22.0
>>

