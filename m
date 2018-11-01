Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id BF45D79EFD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Nov 2018 23:48:21 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id b5-v6so103021pla.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Nov 2018 16:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=mNvW5/4P9OX0FNEwibnPzEsmqY4GrayXi6VJq2hfeP0=;
	b=jEZQOz3zUireXxeRrWdALmdN30AOhelS9FKO2p9KkfZU6epAT/EsJRF66fhVUtqrrG
	7kfube9s4PqvgDJf2+x3aWTIz9Zy/Ov+ENyImtXFuoFUWdWVTOcL+Qog8BA4bj9UQnN3
	bA9EjDyJ3+t2GVOfGu1/J/4OD9MiXRnM3sy/P4AoS/gzd/WI6z5phVWQAZUr4wD0MU6f
	oxy0hAl0Hx8uRpnnkoCGOlyCw+FxlMlLtMwEI2DE4R/ZYSDN6sUeOM03w1G34y/ITwja
	0enIhztlZZv0Ghdv6j442gA2E77G5CqBKCnzMiwg1qHeYQ8/AgXHZ5xulLXBLQiX/4Qd
	3gfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=mNvW5/4P9OX0FNEwibnPzEsmqY4GrayXi6VJq2hfeP0=;
	b=IoLStljhptnOIDlBDCCOUnqgdQVuQTx4AoCTfLjlvqPGjSZDPxroYB+RT/dj3cgfcE
	TAkI1AeB0vTuWCIHS2JcukqTFZFwdiUaoc61ew5Re/C1SJ2gJ7/9UhxT3BTxlGhHfgAZ
	ukDdiRLB/CnuB9v7LhkLZPYPErJEKFlCtE95XIlm54NoqROGtyKhlOGrGET1XocR5crH
	FCadC12rB3rzO2EtIc74ltOE2rPkkncnwgoy5+8euuCdvyZuj/CFf0iwhJdzeyOliuX9
	dbrzBbQmHFVbKV72OmYgC1MtHAM0rTJ3mIk2ifKORFJBsAmuTBHf5AblDSZVsOs5PPJ5
	GNwQ==
X-Gm-Message-State: AGRZ1gLUsqhM6Bvp4t4Dz8aNnTWs9A3dIrejaiWyemkYweGhm+ExZrfE
	uXJ7Ww0DwxgWlKZV4RIVtfyL85fL
X-Google-Smtp-Source: AJdET5c+o9CHAprZ5CuwgxS+jQELJH+XkCE6u2GLKA1nXUF+cDz72G87/01euXtg5bIfyZrSMM49Bg==
X-Received: by 2002:a17:902:d696:: with SMTP id
	v22-v6mr9403733ply.261.1541116102440; 
	Thu, 01 Nov 2018 16:48:22 -0700 (PDT)
Received: from [10.43.100.234] (64.2.3.196.ptr.us.xo.net. [64.2.3.196])
	by smtp.gmail.com with ESMTPSA id
	n82-v6sm40869928pfg.21.2018.11.01.16.48.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Nov 2018 16:48:19 -0700 (PDT)
To: Sinan Kaya <okaya@kernel.org>, openembedded-core@lists.openembedded.org
References: <20181030232815.24575-1-okaya@kernel.org>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <47198674-85e7-c0e9-bb6c-d6ed5310a9b0@gmail.com>
Date: Thu, 1 Nov 2018 16:48:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181030232815.24575-1-okaya@kernel.org>
Subject: Re: [sumo] [PATCH v1] strace: fix ptest path not found
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
X-List-Received-Date: Thu, 01 Nov 2018 23:48:21 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Sinan,

On 10/30/18 4:28 PM, Sinan Kaya wrote:
> Running strace ptest is failing with file not found errors.
>
> ../../strace: Process 1990 attached
> diff: ../../../ptest0/tests/strace-ff.expected: No such file or directory
>
> Even though file is present in the /usr/lib/strace/ptest/tests
> directory.
>
> Issue is caused by sed doing a find and replace causing an incorrect
> path to be generated.
>
> Below is the srcdir and top_srcdir in the Makefile:
>
> srcdir = ../../ptest0/tests
> top_srcdir = ../../strace-4.20

Do you know if this affects Master?

- armin

>
> Replacing this with
>
> srcdir = .
> top_srcdir = ..
>
> old results:
> ===================================================
> 30 of 373 tests failed
> (117 tests were not run)
> Please report to strace-devel@lists.sourceforge.net
> ===================================================
>
> new results:
> ===================================================
> 13 of 373 tests failed
> (117 tests were not run)
> Please report to strace-devel@lists.sourceforge.net
> ===================================================
>
> Signed-off-by: Sinan Kaya <okaya@kernel.org>
> ---
>  meta/recipes-devtools/strace/strace_4.20.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/strace/strace_4.20.bb b/meta/recipes-devtools/strace/strace_4.20.bb
> index 869c12f65a..0b35f5443d 100644
> --- a/meta/recipes-devtools/strace/strace_4.20.bb
> +++ b/meta/recipes-devtools/strace/strace_4.20.bb
> @@ -43,7 +43,8 @@ do_compile_ptest() {
>  
>  do_install_ptest() {
>  	oe_runmake -C ${TESTDIR} install-ptest BUILDDIR=${B} DESTDIR=${D}${PTEST_PATH} TESTDIR=${TESTDIR}
> -	sed -i -e '/^src/s/strace.*[1-9]/ptest/' \
> +	sed -i -e 's:^srcdir =.*:srcdir = .:g' \
> +	    -e 's:^top_srcdir =.*:top_srcdir = ..:g' \
>  	    -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
>  	    -e 's|${DEBUG_PREFIX_MAP}||g' \
>  	    -e 's:${HOSTTOOLS_DIR}/::g' \

