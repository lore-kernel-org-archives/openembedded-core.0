Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id E147961BF3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 17:20:54 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id b1so1551882pgm.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 10:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=ozGnSOZP3RO4jTqLJu8qo3xxdpO+Dn4Fsm30fmGs0+U=;
	b=mK62YOH2tc7qR1X1gp1Ef8WcSPC+hPa4R5nide/+OuFGgS5HXmUeT358qkRi1VNsjG
	yf36LDctxs6BK1xT1RCrfMmS4FWW5H4y/ophH8h/LB02+CriCaXXXhhPCNUSwTwJEGrt
	DGs0GT3B92CeRfe2wzNRULLJDPZ4hclO2D80msRw7nMlhaFNuAfaG6axkXDRMsLncKaY
	yTW3dRrBHlIXDuI9XsCTeKerMAYukMYJO1Udtlo1frIsfdVI6ODhc7xPsIsnCN4bTTSk
	8j8Y/dKHfB4OwdNjhTFsgkO0yM+GIEwuFJ0YB2FcjzYw/ertmEnq+x1KuiqVRV7y0gLi
	JcSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ozGnSOZP3RO4jTqLJu8qo3xxdpO+Dn4Fsm30fmGs0+U=;
	b=P8b+82Vj+9F0DbOdD/r4vfRa6vDLWJKEteZRRX/ondHtG1a8o1rIKCZ+QCIU01Jc+D
	pHuzrNE4yrmEza/4Si0nPFX1AqD6kebN0WEjcHeetBUobqWXBZ1T73tNgxYJrGvn8dbt
	bPlHxisGOLcq8dmTzQqQXtuYXAzHH8VNeknjQSBFgoItaZtCrVIsvc3siUm3KQQeGbtw
	PPjCao9Je3ht+UkYEOZXnMcTC8Q7Wze2KI5VCLwgCP1STHcnF6zoDmbD5VdXh0Z5MQ4f
	bbplfol0kyo8ZYudU/6Z2IjlPf9Bb0D2Y9q9kxHq+8/rLAYR/FuKR7yxWFK1J0DYP3Pv
	inkA==
X-Gm-Message-State: ANhLgQ1oGr7WWncHZxwueVmYbKTDssgA2K0X12xq8jDv2g1Rhl3ohxEU
	ngWHIoaNOdN7QqMYjvz5LYY=
X-Google-Smtp-Source: ADFU+vs+JDlQQr2eDIsjKnPtvmIxvNftltw7QiE2XLyMLBBZBq7YK3VbtiBReagJffNaxeOa9rY9Rw==
X-Received: by 2002:a63:b04f:: with SMTP id z15mr3751120pgo.58.1583947255502; 
	Wed, 11 Mar 2020 10:20:55 -0700 (PDT)
Received: from ?IPv6:2601:646:9200:4e0:e8b9:f87c:18f3:1405?
	([2601:646:9200:4e0:e8b9:f87c:18f3:1405])
	by smtp.gmail.com with ESMTPSA id
	b18sm1171781pfo.200.2020.03.11.10.20.54
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 11 Mar 2020 10:20:54 -0700 (PDT)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20200310232814.48572-1-richard.purdie@linuxfoundation.org>
	<20200310232814.48572-2-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <4d7b32fb-2163-92dc-f3e3-219eacbc4782@gmail.com>
Date: Wed, 11 Mar 2020 10:20:53 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200310232814.48572-2-richard.purdie@linuxfoundation.org>
Cc: Ross Burton <ross.burton@intel.com>
Subject: Re: [PATCH 2/6] gcc: strip line numbers from generated code in gcc-plugins on target
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
X-List-Received-Date: Wed, 11 Mar 2020 17:20:55 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 3/10/20 4:28 PM, Richard Purdie wrote:
> From: Ross Burton <ross.burton@intel.com>
> 
> The line numbers are influenced by the gcc version on the host used to generate
> the code. Remove these to ensure the shipped source code is the same.
> 

Please send this paatch to gcc mailing lists for review, I am not sure 
if this will cause regressions for plugin writers since it does not seem 
simple debug info that it is adding, and external plugins might rely on 
this information. While I understand it might solve our usecaase its a 
kind of patch that I worry about to carry out of tree.

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   meta/recipes-devtools/gcc/gcc-9.2.inc         |   1 +
>   .../gcc/gcc-9.2/gen-no-line-numbers.patch     | 170 ++++++++++++++++++
>   2 files changed, 171 insertions(+)
>   create mode 100644 meta/recipes-devtools/gcc/gcc-9.2/gen-no-line-numbers.patch
> 
> diff --git a/meta/recipes-devtools/gcc/gcc-9.2.inc b/meta/recipes-devtools/gcc/gcc-9.2.inc
> index 2bae85afe3a..2368f358675 100644
> --- a/meta/recipes-devtools/gcc/gcc-9.2.inc
> +++ b/meta/recipes-devtools/gcc/gcc-9.2.inc
> @@ -70,6 +70,7 @@ SRC_URI = "\
>   	   file://CVE-2019-15847_2.patch \
>   	   file://CVE-2019-15847_3.patch \
>              file://re-PR-target-91102-aarch64-ICE-on-Linux-kernel-with-.patch \
> +           file://gen-no-line-numbers.patch \
>   "
>   S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
>   SRC_URI[md5sum] = "3818ad8600447f05349098232c2ddc78"
> diff --git a/meta/recipes-devtools/gcc/gcc-9.2/gen-no-line-numbers.patch b/meta/recipes-devtools/gcc/gcc-9.2/gen-no-line-numbers.patch
> new file mode 100644
> index 00000000000..8e2c3f58095
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-9.2/gen-no-line-numbers.patch
> @@ -0,0 +1,170 @@
> +Inserting line numbers into generated code means its not always reproducible wth
> +differing versions of host gcc. Void the issue by not adding these.
> +
> +Upstream-Status: Inappropriate [OE Reproducibility specific]
> +Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> +
> +diff --git a/gcc/gengtype.c b/gcc/gengtype.c
> +index 53317337c..bbb261516 100644
> +--- a/gcc/gengtype.c
> ++++ b/gcc/gengtype.c
> +@@ -991,7 +991,7 @@ create_field_at (pair_p next, type_p type, const char *name, options_p opt,
> + /* Create a fake field with the given type and name.  NEXT is the next
> +    field in the chain.  */
> + #define create_field(next,type,name) \
> +-    create_field_all (next,type,name, 0, this_file, __LINE__)
> ++    create_field_all (next,type,name, 0, this_file, 0)
> +
> + /* Like create_field, but the field is only valid when condition COND
> +    is true.  */
> +@@ -1024,7 +1024,7 @@ create_optional_field_ (pair_p next, type_p type, const char *name,
> + }
> +
> + #define create_optional_field(next,type,name,cond)	\
> +-       create_optional_field_(next,type,name,cond,__LINE__)
> ++       create_optional_field_(next,type,name,cond,0)
> +
> + /* Reverse a linked list of 'struct pair's in place.  */
> + pair_p
> +@@ -5186,7 +5186,7 @@ main (int argc, char **argv)
> +       /* These types are set up with #define or else outside of where
> +          we can see them.  We should initialize them before calling
> +          read_input_list.  */
> +-#define POS_HERE(Call) do { pos.file = this_file; pos.line = __LINE__; \
> ++#define POS_HERE(Call) do { pos.file = this_file; pos.line = 0; \
> + 	Call;} while (0)
> +       POS_HERE (do_scalar_typedef ("CUMULATIVE_ARGS", &pos));
> +       POS_HERE (do_scalar_typedef ("REAL_VALUE_TYPE", &pos));
> +diff --git a/gcc/genmodes.c b/gcc/genmodes.c
> +index f33eefa24..07bef9eeb 100644
> +--- a/gcc/genmodes.c
> ++++ b/gcc/genmodes.c
> +@@ -429,7 +429,7 @@ complete_all_modes (void)
> + }
> +
> + /* For each mode in class CLASS, construct a corresponding complex mode.  */
> +-#define COMPLEX_MODES(C) make_complex_modes (MODE_##C, __FILE__, __LINE__)
> ++#define COMPLEX_MODES(C) make_complex_modes (MODE_##C, __FILE__, 0)
> + static void
> + make_complex_modes (enum mode_class cl,
> + 		    const char *file, unsigned int line)
> +@@ -487,7 +487,7 @@ make_complex_modes (enum mode_class cl,
> + /* For all modes in class CL, construct vector modes of width
> +    WIDTH, having as many components as necessary.  */
> + #define VECTOR_MODES_WITH_PREFIX(PREFIX, C, W) \
> +-  make_vector_modes (MODE_##C, #PREFIX, W, __FILE__, __LINE__)
> ++  make_vector_modes (MODE_##C, #PREFIX, W, __FILE__, 0)
> + #define VECTOR_MODES(C, W) VECTOR_MODES_WITH_PREFIX (V, C, W)
> + static void ATTRIBUTE_UNUSED
> + make_vector_modes (enum mode_class cl, const char *prefix, unsigned int width,
> +@@ -538,7 +538,7 @@ make_vector_modes (enum mode_class cl, const char *prefix, unsigned int width,
> + /* Create a vector of booleans called NAME with COUNT elements and
> +    BYTESIZE bytes in total.  */
> + #define VECTOR_BOOL_MODE(NAME, COUNT, BYTESIZE) \
> +-  make_vector_bool_mode (#NAME, COUNT, BYTESIZE, __FILE__, __LINE__)
> ++  make_vector_bool_mode (#NAME, COUNT, BYTESIZE, __FILE__, 0)
> + static void ATTRIBUTE_UNUSED
> + make_vector_bool_mode (const char *name, unsigned int count,
> + 		       unsigned int bytesize, const char *file,
> +@@ -560,7 +560,7 @@ make_vector_bool_mode (const char *name, unsigned int count,
> + /* Input.  */
> +
> + #define _SPECIAL_MODE(C, N) \
> +-  make_special_mode (MODE_##C, #N, __FILE__, __LINE__)
> ++  make_special_mode (MODE_##C, #N, __FILE__, 0)
> + #define RANDOM_MODE(N) _SPECIAL_MODE (RANDOM, N)
> + #define CC_MODE(N) _SPECIAL_MODE (CC, N)
> +
> +@@ -573,7 +573,7 @@ make_special_mode (enum mode_class cl, const char *name,
> +
> + #define INT_MODE(N, Y) FRACTIONAL_INT_MODE (N, -1U, Y)
> + #define FRACTIONAL_INT_MODE(N, B, Y) \
> +-  make_int_mode (#N, B, Y, __FILE__, __LINE__)
> ++  make_int_mode (#N, B, Y, __FILE__, 0)
> +
> + static void
> + make_int_mode (const char *name,
> +@@ -586,16 +586,16 @@ make_int_mode (const char *name,
> + }
> +
> + #define FRACT_MODE(N, Y, F) \
> +-	make_fixed_point_mode (MODE_FRACT, #N, Y, 0, F, __FILE__, __LINE__)
> ++	make_fixed_point_mode (MODE_FRACT, #N, Y, 0, F, __FILE__, 0)
> +
> + #define UFRACT_MODE(N, Y, F) \
> +-	make_fixed_point_mode (MODE_UFRACT, #N, Y, 0, F, __FILE__, __LINE__)
> ++	make_fixed_point_mode (MODE_UFRACT, #N, Y, 0, F, __FILE__, 0)
> +
> + #define ACCUM_MODE(N, Y, I, F) \
> +-	make_fixed_point_mode (MODE_ACCUM, #N, Y, I, F, __FILE__, __LINE__)
> ++	make_fixed_point_mode (MODE_ACCUM, #N, Y, I, F, __FILE__, 0)
> +
> + #define UACCUM_MODE(N, Y, I, F) \
> +-	make_fixed_point_mode (MODE_UACCUM, #N, Y, I, F, __FILE__, __LINE__)
> ++	make_fixed_point_mode (MODE_UACCUM, #N, Y, I, F, __FILE__, 0)
> +
> + /* Create a fixed-point mode by setting CL, NAME, BYTESIZE, IBIT, FBIT,
> +    FILE, and LINE.  */
> +@@ -616,7 +616,7 @@ make_fixed_point_mode (enum mode_class cl,
> +
> + #define FLOAT_MODE(N, Y, F)             FRACTIONAL_FLOAT_MODE (N, -1U, Y, F)
> + #define FRACTIONAL_FLOAT_MODE(N, B, Y, F) \
> +-  make_float_mode (#N, B, Y, #F, __FILE__, __LINE__)
> ++  make_float_mode (#N, B, Y, #F, __FILE__, 0)
> +
> + static void
> + make_float_mode (const char *name,
> +@@ -633,7 +633,7 @@ make_float_mode (const char *name,
> + #define DECIMAL_FLOAT_MODE(N, Y, F)	\
> + 	FRACTIONAL_DECIMAL_FLOAT_MODE (N, -1U, Y, F)
> + #define FRACTIONAL_DECIMAL_FLOAT_MODE(N, B, Y, F)	\
> +-  make_decimal_float_mode (#N, B, Y, #F, __FILE__, __LINE__)
> ++  make_decimal_float_mode (#N, B, Y, #F, __FILE__, 0)
> +
> + static void
> + make_decimal_float_mode (const char *name,
> +@@ -648,7 +648,7 @@ make_decimal_float_mode (const char *name,
> + }
> +
> + #define RESET_FLOAT_FORMAT(N, F) \
> +-  reset_float_format (#N, #F, __FILE__, __LINE__)
> ++  reset_float_format (#N, #F, __FILE__, 0)
> + static void ATTRIBUTE_UNUSED
> + reset_float_format (const char *name, const char *format,
> + 		    const char *file, unsigned int line)
> +@@ -669,7 +669,7 @@ reset_float_format (const char *name, const char *format,
> +
> + /* __intN support.  */
> + #define INT_N(M,PREC)				\
> +-  make_int_n (#M, PREC, __FILE__, __LINE__)
> ++  make_int_n (#M, PREC, __FILE__, 0)
> + static void ATTRIBUTE_UNUSED
> + make_int_n (const char *m, int bitsize,
> +             const char *file, unsigned int line)
> +@@ -698,7 +698,7 @@ make_int_n (const char *m, int bitsize,
> + /* Partial integer modes are specified by relation to a full integer
> +    mode.  */
> + #define PARTIAL_INT_MODE(M,PREC,NAME)				\
> +-  make_partial_integer_mode (#M, #NAME, PREC, __FILE__, __LINE__)
> ++  make_partial_integer_mode (#M, #NAME, PREC, __FILE__, 0)
> + static void ATTRIBUTE_UNUSED
> + make_partial_integer_mode (const char *base, const char *name,
> + 			   unsigned int precision,
> +@@ -725,7 +725,7 @@ make_partial_integer_mode (const char *base, const char *name,
> + /* A single vector mode can be specified by naming its component
> +    mode and the number of components.  */
> + #define VECTOR_MODE(C, M, N) \
> +-  make_vector_mode (MODE_##C, #M, N, __FILE__, __LINE__);
> ++  make_vector_mode (MODE_##C, #M, N, __FILE__, 0);
> + static void ATTRIBUTE_UNUSED
> + make_vector_mode (enum mode_class bclass,
> + 		  const char *base,
> +@@ -768,7 +768,7 @@ make_vector_mode (enum mode_class bclass,
> +
> + /* Adjustability.  */
> + #define _ADD_ADJUST(A, M, X, C1, C2) \
> +-  new_adjust (#M, &adj_##A, #A, #X, MODE_##C1, MODE_##C2, __FILE__, __LINE__)
> ++  new_adjust (#M, &adj_##A, #A, #X, MODE_##C1, MODE_##C2, __FILE__, 0)
> +
> + #define ADJUST_NUNITS(M, X)    _ADD_ADJUST (nunits, M, X, RANDOM, RANDOM)
> + #define ADJUST_BYTESIZE(M, X)  _ADD_ADJUST (bytesize, M, X, RANDOM, RANDOM)
> 

