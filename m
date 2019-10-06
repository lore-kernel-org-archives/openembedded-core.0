Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id BAE436C42C
	for <openembedded-core@lists.openembedded.org>;
	Sun,  6 Oct 2019 22:23:53 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id q10so7424542pfl.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 Oct 2019 15:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=x5RodXuNIxsokGoT7l0NkG0BIpL7PJtwFVBcGqNfNKA=;
	b=hABTn7ckHAUV3okkyZXXxPHE2Jp0LzAmBlL9VSioKIb91UT9KjV147neOU0fb4c5S1
	V5kb7GMl7NHYC7jUlyGuVHwH8F4QbyI0sLoOy+3x9mc7NWF4Mc52YbNFr7oXr8n7CVzw
	i7fVq+Ct+faMJlxx1vG1SgMvjs9p41pYienWF6WcE4dP/FB5oxbDoIqMiF2V5y7MTCR5
	tkxUEPMiohzhHkR6TL0RhY7xsdWIrJ5JgdQPQGoATmPbjwE5x4SEfHY7eGAsmE6NP0Iw
	K8/beX3uZTs1SxOAAFdQcoN6razFHci2dDRidgTZ26TjEyYxTy9QZLY2XBxYZzKot0bP
	PjZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=x5RodXuNIxsokGoT7l0NkG0BIpL7PJtwFVBcGqNfNKA=;
	b=SfoPGLQ65j83p+PFfQH0WlGM3q4fMFmZnv7hSJ5krHl2PGEQGv3AKQM706XfoV2sWA
	y1TWgbwb+ziA2SCEgH4Buga3MuyTmp87Aoy53R4YabIvuCboATVfVOchqw/ODzsbm2PN
	1aFISNl3rFEDFLrbUZhow9T5jSzbFXWc1i0XqwUaNSvx2L2Qn93zO2jge/LsRs/VZpC1
	F7IHX6xgtRAiRB48rrUmhaehDRXBqcIeLJxbZ7AZKRYNnkxQXoMc6Dr3ajdFFezEwDpq
	2artB7aD9T+orz6a8IxqXczFl4ZphzNKXpvt43orpjGMx4p1aAzojv1l7drEB5xo/I2W
	3ipw==
X-Gm-Message-State: APjAAAW5yhOCSn01IjNPThcnz19wGYbZOtnFIsVy80OFNimfaOl6I8ge
	ghqasZmJjdjUcQjNE2h7y3jsAmAEQtc=
X-Google-Smtp-Source: APXvYqyVzstNxt4tr/0UM2zMNkY7ZYLhvvCmdZZuClh2EK9cYEeY9RfGwPuEYsokFd6DWYELVUTvlQ==
X-Received: by 2002:aa7:920d:: with SMTP id 13mr29222116pfo.17.1570400634296; 
	Sun, 06 Oct 2019 15:23:54 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:a5c0:65e8:7322:d189:1d85?
	([2601:202:4180:a5c0:65e8:7322:d189:1d85])
	by smtp.gmail.com with ESMTPSA id
	69sm13588538pfb.145.2019.10.06.15.23.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 06 Oct 2019 15:23:53 -0700 (PDT)
To: muislam@microsoft.com, openembedded-core@lists.openembedded.org
References: <20190920030759.5068-1-muislam@microsoft.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <16ec7808-67da-10a1-6a5c-0bb8e635724d@gmail.com>
Date: Sun, 6 Oct 2019 15:23:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190920030759.5068-1-muislam@microsoft.com>
Subject: Re: [thud][PATCH v5] gcc: Security fix for CVE: <CVE-2019-15847>
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
X-List-Received-Date: Sun, 06 Oct 2019 22:23:54 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 9/19/19 8:07 PM, Muminul Islam wrote:
> Signed-off-by: Muminul Islam <muislam@microsoft.com>
> ---
>  meta/recipes-devtools/gcc/gcc-8.2.inc         |   3 +
>  .../gcc/gcc-8.2/CVE-2019-15847_p1.patch       | 223 ++++++++++++++++++
>  .../gcc/gcc-8.2/CVE-2019-15847_p2.patch       |  47 ++++
>  .../gcc/gcc-8.2/CVE-2019-15847_p3.patch       |  38 +++
>  4 files changed, 311 insertions(+)
>  create mode 100644 meta/recipes-devtools/gcc/gcc-8.2/CVE-2019-15847_p1.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-8.2/CVE-2019-15847_p2.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-8.2/CVE-2019-15847_p3.patch

This patch finally got into a build as it needed to be in master and
warrior first.

i am seeing this error. Can you confirm I have the correct patch. I
believe its released to th p1 patch.

| g++   
-isystem/home/akuster/oss/maint/openembedded-core/build/tmp-glibc/work/x86_64-linux/gcc-cross-initial-powerpc/8.2.0-r0/recipe-sysroot-native/usr/include
-O2 -pipe -DIN_GCC  -DCROSS_DIRECTORY_STRUCTURE   -fno-exceptions
-fno-rtti -fasynchronous-unwind-tables -W -Wall -Wno-narrowing
-Wwrite-strings -Wcast-qual -Wmissing-format-attribute
-Woverloaded-virtual -pedantic -Wno-long-long -Wno-variadic-macros
-Wno-overlength-strings   -DHAVE_CONFIG_H -DGENERATOR_FILE -fno-PIE
-static-libstdc++ -static-libgcc
-L/home/akuster/oss/maint/openembedded-core/build/tmp-glibc/work/x86_64-linux/gcc-cross-initial-powerpc/8.2.0-r0/recipe-sysroot-native/usr/lib
-L/home/akuster/oss/maint/openembedded-core/build/tmp-glibc/work/x86_64-linux/gcc-cross-initial-powerpc/8.2.0-r0/recipe-sysroot-native/lib
-Wl,-rpath-link,/home/akuster/oss/maint/openembedded-core/build/tmp-glibc/work/x86_64-linux/gcc-cross-initial-powerpc/8.2.0-r0/recipe-sysroot-native/usr/lib
-Wl,-rpath-link,/home/akuster/oss/maint/openembedded-core/build/tmp-glibc/work/x86_64-linux/gcc-cross-initial-powerpc/8.2.0-r0/recipe-sysroot-native/lib
-Wl,-rpath,/home/akuster/oss/maint/openembedded-core/build/tmp-glibc/work/x86_64-linux/gcc-cross-initial-powerpc/8.2.0-r0/recipe-sysroot-native/usr/lib
-Wl,-rpath,/home/akuster/oss/maint/openembedded-core/build/tmp-glibc/work/x86_64-linux/gcc-cross-initial-powerpc/8.2.0-r0/recipe-sysroot-native/lib
-Wl,-O1 -no-pie -o build/genenums \
|     build/genenums.o build/read-md.o build/errors.o
../build-x86_64-linux/libiberty/libiberty.a
| build/genmddeps
../../../../../../../work-shared/gcc-8.2.0-r0/gcc-8.2.0/gcc/common.md
../../../../../../../work-shared/gcc-8.2.0-r0/gcc-8.2.0/gcc/config/rs6000/rs6000.md
> tmp-mddeps
| /bin/bash
../../../../../../../work-shared/gcc-8.2.0-r0/gcc-8.2.0/gcc/../move-if-change
tmp-mddeps mddeps.mk
| echo timestamp > s-mddeps
| build/genconstants
../../../../../../../work-shared/gcc-8.2.0-r0/gcc-8.2.0/gcc/common.md
../../../../../../../work-shared/gcc-8.2.0-r0/gcc-8.2.0/gcc/config/rs6000/rs6000.md
\
|    > tmp-constants.h
| /bin/bash
../../../../../../../work-shared/gcc-8.2.0-r0/gcc-8.2.0/gcc/../move-if-change
tmp-constants.h insn-constants.h
| echo timestamp > s-constants
| build/genenums
../../../../../../../work-shared/gcc-8.2.0-r0/gcc-8.2.0/gcc/common.md
../../../../../../../work-shared/gcc-8.2.0-r0/gcc-8.2.0/gcc/config/rs6000/rs6000.md
\
|    > tmp-enums.c
| /bin/bash
../../../../../../../work-shared/gcc-8.2.0-r0/gcc-8.2.0/gcc/../move-if-change
tmp-enums.c insn-enums.c
| echo timestamp > s-enums
| g++  -c  
-isystem/home/akuster/oss/maint/openembedded-core/build/tmp-glibc/work/x86_64-linux/gcc-cross-initial-powerpc/8.2.0-r0/recipe-sysroot-native/usr/include
-O2 -pipe -DIN_GCC  -DCROSS_DIRECTORY_STRUCTURE   -fno-exceptions
-fno-rtti -fasynchronous-unwind-tables -W -Wall -Wno-narrowing
-Wwrite-strings -Wcast-qual -Wmissing-format-attribute
-Woverloaded-virtual -pedantic -Wno-long-long -Wno-variadic-macros
-Wno-overlength-strings   -DHAVE_CONFIG_H -DGENERATOR_FILE -fno-PIE -I.
-Ibuild -I../../../../../../../work-shared/gcc-8.2.0-r0/gcc-8.2.0/gcc
-I../../../../../../../work-shared/gcc-8.2.0-r0/gcc-8.2.0/gcc/build
-I../../../../../../../work-shared/gcc-8.2.0-r0/gcc-8.2.0/gcc/../include 
-I../../../../../../../work-shared/gcc-8.2.0-r0/gcc-8.2.0/gcc/../libcpp/include
-isystem/home/akuster/oss/maint/openembedded-core/build/tmp-glibc/work/x86_64-linux/gcc-cross-initial-powerpc/8.2.0-r0/recipe-sysroot-native/usr/include
\
|     -o build/gencheck.o
../../../../../../../work-shared/gcc-8.2.0-r0/gcc-8.2.0/gcc/gencheck.c
| /bin/bash
../../../../../../../work-shared/gcc-8.2.0-r0/gcc-8.2.0/gcc/../move-if-change
tmp-gtype.state gtype.state
| build/gengtype  \
|                     -r gtype.state
| In file included from ./tm.h:23:0,
|                  from
../../../../../../../work-shared/gcc-8.2.0-r0/gcc-8.2.0/gcc/gencheck.c:23:
| ./insn-constants.h:377:3: error: expected identifier before numeric
constant
|    75 = 320,
|    ^
| ./insn-constants.h:377:3: error: expected ‘}’ before numeric constant
| ./insn-constants.h:377:3: error: expected unqualified-id before
numeric constant
| ./insn-constants.h:404:1: error: expected declaration before ‘}’ token
|  };
|  ^
| Makefile:2671: recipe for target 'build/gencheck.o' failed
| make[1]: *** [build/gencheck.o] Error 1
| make[1]: *** Waiting for unfinished jobs....
| echo timestamp > s-gtype

- armin

>
> diff --git a/meta/recipes-devtools/gcc/gcc-8.2.inc b/meta/recipes-devtools/gcc/gcc-8.2.inc
> index 866a77558b..65fd29d943 100644
> --- a/meta/recipes-devtools/gcc/gcc-8.2.inc
> +++ b/meta/recipes-devtools/gcc/gcc-8.2.inc
> @@ -70,6 +70,9 @@ SRC_URI = "\
>             file://0039-Fix-for-testsuite-failure.patch \
>             file://0040-Re-introduce-spe-commandline-options.patch \
>             file://0041-ARC-fix-spec-gen.patch \
> +           file://CVE-2019-15847_p1.patch \
> +           file://CVE-2019-15847_p2.patch \
> +           file://CVE-2019-15847_p3.patch \
>             ${BACKPORTS} \
>  "
>  BACKPORTS = "\
> diff --git a/meta/recipes-devtools/gcc/gcc-8.2/CVE-2019-15847_p1.patch b/meta/recipes-devtools/gcc/gcc-8.2/CVE-2019-15847_p1.patch
> new file mode 100644
> index 0000000000..6e73564266
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-8.2/CVE-2019-15847_p1.patch
> @@ -0,0 +1,223 @@
> +From eebe740f9142ee15bd997c480df0e1f61ac6ffd1 Mon Sep 17 00:00:00 2001
> +From: segher <segher@138bc75d-0d04-0410-961f-82ee72b054a4>
> +Date: Fri, 30 Aug 2019 14:15:39 +0000
> +Subject: [PATCH] 	Backport from trunk 	2019-08-22  Segher Boessenkool
> +  <segher@kernel.crashing.org>
> +Reply-To: muislam@microsoft.com
> +
> +	PR target/91481
> +	* config/rs6000/rs6000.md (unspec): Delete UNSPEC_DARN, UNSPEC_DARN_32,
> +	and UNSPEC_DARN_RAW.
> +	(unspecv): New enumerator values UNSPECV_DARN, UNSPECV_DARN_32, and
> +	UNSPECV_DARN_RAW.
> +	(darn_32): Use an unspec_volatile, and UNSPECV_DARN_32.
> +	(darn_raw): Use an unspec_volatile, and UNSPECV_DARN_RAW.
> +	(darn): Use an unspec_volatile, and UNSPECV_DARN.
> +
> +git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-8-branch@275181 138bc75d-0d04-0410-961f-82ee72b054a4
> +Signed-off-by: Muminul Islam <muislam@microsoft.com>
> +
> +CVE: CVE-2019-15847
> +
> +Upstream-Status: Backport
> +---
> + gcc/config/rs6000/rs6000.md | 169 ++++++++++++++++++++++++++++++++++++
> + 1 file changed, 169 insertions(+)
> +
> +diff --git a/gcc/config/rs6000/rs6000.md b/gcc/config/rs6000/rs6000.md
> +index 60058814b8a..f540b033541 100644
> +--- a/gcc/config/rs6000/rs6000.md
> ++++ b/gcc/config/rs6000/rs6000.md
> +@@ -136,6 +136,9 @@
> +    UNSPEC_LSQ
> +    UNSPEC_FUSION_GPR
> +    UNSPEC_STACK_CHECK
> ++   UNSPEC_CMPRB
> ++   UNSPEC_CMPRB2
> ++   UNSPEC_CMPEQB
> +    UNSPEC_FUSION_P9
> +    UNSPEC_FUSION_ADDIS
> +    UNSPEC_ADD_ROUND_TO_ODD
> +@@ -162,6 +165,9 @@
> +    UNSPECV_EH_RR		; eh_reg_restore
> +    UNSPECV_ISYNC		; isync instruction
> +    UNSPECV_MFTB			; move from time base
> ++   UNSPECV_DARN			; darn 1 (deliver a random number)
> ++   UNSPECV_DARN_32		; darn 2
> ++   UNSPECV_DARN_RAW		; darn 0
> +    UNSPECV_NLGR			; non-local goto receiver
> +    UNSPECV_MFFS			; Move from FPSCR
> +    UNSPECV_MTFSF		; Move to FPSCR Fields
> +@@ -14602,6 +14608,169 @@
> +    "xscmpuqp %0,%1,%2"
> +   [(set_attr "type" "veccmp")
> +    (set_attr "size" "128")])
> ++
> ++;; Miscellaneous ISA 3.0 (power9) instructions
> ++
> ++(define_insn "darn_32"
> ++  [(set (match_operand:SI 0 "register_operand" "=r")
> ++        (unspec_volatile:SI [(const_int 0)] UNSPECV_DARN_32))]
> ++  "TARGET_P9_MISC"
> ++  "darn %0,0"
> ++  [(set_attr "type" "integer")])
> ++
> ++(define_insn "darn_raw"
> ++  [(set (match_operand:DI 0 "register_operand" "=r")
> ++        (unspec_volatile:DI [(const_int 0)] UNSPECV_DARN_RAW))]
> ++  "TARGET_P9_MISC && TARGET_64BIT"
> ++  "darn %0,2"
> ++  [(set_attr "type" "integer")])
> ++
> ++(define_insn "darn"
> ++  [(set (match_operand:DI 0 "register_operand" "=r")
> ++        (unspec_volatile:DI [(const_int 0)] UNSPECV_DARN))]
> ++  "TARGET_P9_MISC && TARGET_64BIT"
> ++  "darn %0,1"
> ++  [(set_attr "type" "integer")])
> ++
> ++;; Test byte within range.
> ++;;
> ++;; The bytes of operand 1 are organized as xx:xx:xx:vv, where xx
> ++;; represents a byte whose value is ignored in this context and
> ++;; vv, the least significant byte, holds the byte value that is to
> ++;; be tested for membership within the range specified by operand 2.
> ++;; The bytes of operand 2 are organized as xx:xx:hi:lo.
> ++;;
> ++;; Return in target register operand 0 a value of 1 if lo <= vv and
> ++;; vv <= hi.  Otherwise, set register operand 0 to 0.
> ++;;
> ++;; Though the instructions to which this expansion maps operate on
> ++;; 64-bit registers, the current implementation only operates on
> ++;; SI-mode operands as the high-order bits provide no information
> ++;; that is not already available in the low-order bits.  To avoid the
> ++;; costs of data widening operations, future enhancements might allow
> ++;; DI mode for operand 0 and/or might allow operand 1 to be QI mode.
> ++(define_expand "cmprb"
> ++  [(set (match_dup 3)
> ++	(unspec:CC [(match_operand:SI 1 "gpc_reg_operand" "r")
> ++		    (match_operand:SI 2 "gpc_reg_operand" "r")]
> ++	 UNSPEC_CMPRB))
> ++   (set (match_operand:SI 0 "gpc_reg_operand" "=r")
> ++	(if_then_else:SI (lt (match_dup 3)
> ++			     (const_int 0))
> ++			 (const_int -1)
> ++			 (if_then_else (gt (match_dup 3)
> ++					   (const_int 0))
> ++				       (const_int 1)
> ++				       (const_int 0))))]
> ++  "TARGET_P9_MISC"
> ++{
> ++  operands[3] = gen_reg_rtx (CCmode);
> ++})
> ++
> ++;; The bytes of operand 1 are organized as xx:xx:xx:vv, where xx
> ++;; represents a byte whose value is ignored in this context and
> ++;; vv, the least significant byte, holds the byte value that is to
> ++;; be tested for membership within the range specified by operand 2.
> ++;; The bytes of operand 2 are organized as xx:xx:hi:lo.
> ++;;
> ++;; Set bit 1 (the GT bit, 0x4) of CR register operand 0 to 1 if
> ++;; lo <= vv and vv <= hi.  Otherwise, set the GT bit to 0.  The other
> ++;; 3 bits of the target CR register are all set to 0.
> ++(define_insn "*cmprb_internal"
> ++  [(set (match_operand:CC 0 "cc_reg_operand" "=y")
> ++	(unspec:CC [(match_operand:SI 1 "gpc_reg_operand" "r")
> ++		    (match_operand:SI 2 "gpc_reg_operand" "r")]
> ++	 UNSPEC_CMPRB))]
> ++  "TARGET_P9_MISC"
> ++  "cmprb %0,0,%1,%2"
> ++  [(set_attr "type" "logical")])
> ++
> ++;; Set operand 0 register to -1 if the LT bit (0x8) of condition
> ++;; register operand 1 is on.  Otherwise, set operand 0 register to 1
> ++;; if the GT bit (0x4) of condition register operand 1 is on.
> ++;; Otherwise, set operand 0 to 0.  Note that the result stored into
> ++;; register operand 0 is non-zero iff either the LT or GT bits are on
> ++;; within condition register operand 1.
> ++(define_insn "setb_signed"
> ++   [(set (match_operand:SI 0 "gpc_reg_operand" "=r")
> ++	 (if_then_else:SI (lt (match_operand:CC 1 "cc_reg_operand" "y")
> ++			      (const_int 0))
> ++			  (const_int -1)
> ++			  (if_then_else (gt (match_dup 1)
> ++					    (const_int 0))
> ++					(const_int 1)
> ++					(const_int 0))))]
> ++  "TARGET_P9_MISC"
> ++  "setb %0,%1"
> ++  [(set_attr "type" "logical")])
> ++
> ++(define_insn "setb_unsigned"
> ++   [(set (match_operand:SI 0 "gpc_reg_operand" "=r")
> ++	 (if_then_else:SI (ltu (match_operand:CCUNS 1 "cc_reg_operand" "y")
> ++			      (const_int 0))
> ++			  (const_int -1)
> ++			  (if_then_else (gtu (match_dup 1)
> ++					    (const_int 0))
> ++					(const_int 1)
> ++					(const_int 0))))]
> ++  "TARGET_P9_MISC"
> ++  "setb %0,%1"
> ++  [(set_attr "type" "logical")])
> ++
> ++;; Test byte within two ranges.
> ++;;
> ++;; The bytes of operand 1 are organized as xx:xx:xx:vv, where xx
> ++;; represents a byte whose value is ignored in this context and
> ++;; vv, the least significant byte, holds the byte value that is to
> ++;; be tested for membership within the range specified by operand 2.
> ++;; The bytes of operand 2 are organized as hi_1:lo_1:hi_2:lo_2.
> ++;;
> ++;; Return in target register operand 0 a value of 1 if (lo_1 <= vv and
> ++;; vv <= hi_1) or if (lo_2 <= vv and vv <= hi_2).  Otherwise, set register
> ++;; operand 0 to 0.
> ++;;
> ++;; Though the instructions to which this expansion maps operate on
> ++;; 64-bit registers, the current implementation only operates on
> ++;; SI-mode operands as the high-order bits provide no information
> ++;; that is not already available in the low-order bits.  To avoid the
> ++;; costs of data widening operations, future enhancements might allow
> ++;; DI mode for operand 0 and/or might allow operand 1 to be QI mode.
> ++(define_expand "cmprb2"
> ++  [(set (match_dup 3)
> ++	(unspec:CC [(match_operand:SI 1 "gpc_reg_operand" "r")
> ++		    (match_operand:SI 2 "gpc_reg_operand" "r")]
> ++	 UNSPEC_CMPRB2))
> ++   (set (match_operand:SI 0 "gpc_reg_operand" "=r")
> ++	(if_then_else:SI (lt (match_dup 3)
> ++			     (const_int 0))
> ++			 (const_int -1)
> ++			 (if_then_else (gt (match_dup 3)
> ++					   (const_int 0))
> ++				       (const_int 1)
> ++				       (const_int 0))))]
> ++  "TARGET_P9_MISC"
> ++{
> ++  operands[3] = gen_reg_rtx (CCmode);
> ++})
> ++
> ++;; The bytes of operand 1 are organized as xx:xx:xx:vv, where xx
> ++;; represents a byte whose value is ignored in this context and
> ++;; vv, the least significant byte, holds the byte value that is to
> ++;; be tested for membership within the ranges specified by operand 2.
> ++;; The bytes of operand 2 are organized as hi_1:lo_1:hi_2:lo_2.
> ++;;
> ++;; Set bit 1 (the GT bit, 0x4) of CR register operand 0 to 1 if
> ++;; (lo_1 <= vv and vv <= hi_1) or if (lo_2 <= vv and vv <= hi_2).
> ++;; Otherwise, set the GT bit to 0.  The other 3 bits of the target
> ++;; CR register are all set to 0.
> ++(define_insn "*cmprb2_internal"
> ++  [(set (match_operand:CC 0 "cc_reg_operand" "=y")
> ++	(unspec:CC [(match_operand:SI 1 "gpc_reg_operand" "r")
> ++		    (match_operand:SI 2 "gpc_reg_operand" "r")]
> ++	 UNSPEC_CMPRB2))]
> ++  "TARGET_P9_MISC"
> ++  "cmprb %0,1,%1,%2"
> ++  [(set_attr "type" "logical")])
> + 
> + 
> + 
> +-- 
> +2.23.0
> +
> diff --git a/meta/recipes-devtools/gcc/gcc-8.2/CVE-2019-15847_p2.patch b/meta/recipes-devtools/gcc/gcc-8.2/CVE-2019-15847_p2.patch
> new file mode 100644
> index 0000000000..4f64c39b0a
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-8.2/CVE-2019-15847_p2.patch
> @@ -0,0 +1,47 @@
> +From f2b99d05bb2721e062404afdfb05e570e68b4ced Mon Sep 17 00:00:00 2001
> +From: segher <segher@138bc75d-0d04-0410-961f-82ee72b054a4>
> +Date: Fri, 30 Aug 2019 14:17:20 +0000
> +Subject: [PATCH] 	Backport from trunk 	2019-08-23  Segher Boessenkool
> +  <segher@kernel.crashing.org>
> +Reply-To: muislam@microsoft.com
> +
> +gcc/testsuite/
> +	PR target/91481
> +	* gcc.target/powerpc/darn-3.c: New testcase.
> +
> +git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-8-branch@275182 138bc75d-0d04-0410-961f-82ee72b054a4
> +Signed-off-by: Muminul Islam <muislam@microsoft.com>
> +
> +CVE: CVE-2019-15847
> +
> +Upstream-Status: Backport
> +---
> + gcc/testsuite/gcc.target/powerpc/darn-3.c | 16 ++++++++++++++++
> + 1 file changed, 16 insertions(+)
> + create mode 100644 gcc/testsuite/gcc.target/powerpc/darn-3.c
> +
> +diff --git a/gcc/testsuite/gcc.target/powerpc/darn-3.c b/gcc/testsuite/gcc.target/powerpc/darn-3.c
> +new file mode 100644
> +index 00000000000..477901fde70
> +--- /dev/null
> ++++ b/gcc/testsuite/gcc.target/powerpc/darn-3.c
> +@@ -0,0 +1,16 @@
> ++/* { dg-do compile { target { powerpc*-*-* } } } */
> ++/* { dg-skip-if "" { powerpc*-*-aix* } } */
> ++/* { dg-options "-O2 -mdejagnu-cpu=power9" } */
> ++
> ++static int darn32(void) { return __builtin_darn_32(); }
> ++
> ++int four(void)
> ++{
> ++	int sum = 0;
> ++	int i;
> ++	for (i = 0; i < 4; i++)
> ++		sum += darn32();
> ++	return sum;
> ++}
> ++
> ++/* { dg-final { scan-assembler-times {(?n)\mdarn .*,0\M} 4 } } */
> +-- 
> +2.23.0
> +
> diff --git a/meta/recipes-devtools/gcc/gcc-8.2/CVE-2019-15847_p3.patch b/meta/recipes-devtools/gcc/gcc-8.2/CVE-2019-15847_p3.patch
> new file mode 100644
> index 0000000000..0ab7544caa
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-8.2/CVE-2019-15847_p3.patch
> @@ -0,0 +1,38 @@
> +From f4721625a060ad708c0b7d02d3d6b3a581e7d885 Mon Sep 17 00:00:00 2001
> +From: segher <segher@138bc75d-0d04-0410-961f-82ee72b054a4>
> +Date: Sat, 31 Aug 2019 18:58:04 +0000
> +Subject: [PATCH] rs6000: Fix darn-3.c for GCC 8 and GCC 7
> +Reply-To: muislam@microsoft.com
> +
> +Apparently I didn't properly test the testcase backport to GCC 8 and
> +GCC 7.  This makes it not fail there.
> +
> +	PR target/91481
> +	* gcc.target/powerpc/darn-3.c: Fix testcase.
> +
> +git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-8-branch@275244 138bc75d-0d04-0410-961f-82ee72b054a4
> +Signed-off-by: Muminul Islam <muislam@microsoft.com>
> +
> +CVE: CVE-2019-15847
> +
> +Upstream-Status: Backport
> +---
> + gcc/testsuite/gcc.target/powerpc/darn-3.c | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/gcc/testsuite/gcc.target/powerpc/darn-3.c b/gcc/testsuite/gcc.target/powerpc/darn-3.c
> +index 477901fde70..96ac21fc58c 100644
> +--- a/gcc/testsuite/gcc.target/powerpc/darn-3.c
> ++++ b/gcc/testsuite/gcc.target/powerpc/darn-3.c
> +@@ -1,6 +1,7 @@
> + /* { dg-do compile { target { powerpc*-*-* } } } */
> + /* { dg-skip-if "" { powerpc*-*-aix* } } */
> +-/* { dg-options "-O2 -mdejagnu-cpu=power9" } */
> ++/* { dg-skip-if "do not override -mcpu" { powerpc*-*-* } { "-mcpu=*" } { "-mcpu=power9" } } */
> ++/* { dg-options "-O2 -mcpu=power9" } */
> + 
> + static int darn32(void) { return __builtin_darn_32(); }
> + 
> +-- 
> +2.23.0
> +


