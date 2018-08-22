Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id A83D7793C3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 13:21:05 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id 20-v6so1584860wrb.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 06:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=fotldnOYf8O2NrtNSNXyCm5d4fsHYa5Dd03HBwdA7nA=;
	b=cKko87vhK83ItzLDNyPygPp+qQH7JvKzam876rcEsQLLnFv0CI/+5RCgOo7V11/vx/
	/2GQreihPmuHB8P9Gwv9sqCv9Hec7zPuqsErMI+g0k6YB/KkbHmJsNhtRVtbT0BjZADx
	8JnZdAmkkeVz4276ju79zDP4Ex6TaEPrJXT0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=fotldnOYf8O2NrtNSNXyCm5d4fsHYa5Dd03HBwdA7nA=;
	b=p6GA6GIOqaDLdd8q1zckMdBZhxRJgq/6/UXaNDLy/rb8WOmkgu0zW43e8e8pY/Knsv
	kq5kfRp9vGcC075eU4LsUb6bIDDm2l4qoPXHS4b9uuV+6xGDMW89FyJXG2rhLqkNtYlu
	dzzYHFATyUMNy6eZmNXhbDuRH9OUdeZpyur4RYFeGR9SQMTfSO1COCMfvNZPRcTEr409
	P6QN/Zv8enw/84O/Uu1ssJicNVUU/s6JYpbkpGKAi84Vz3eMyN3UFUoBxCmaFh3lNEvM
	Hq8rqgylNWD9sCive6eNOgNRn25penH8olmft/HPUuhn6QK6ftgHOSt85Lnol6mNn4Kt
	VYjw==
X-Gm-Message-State: AOUpUlEW0R9WTY501JLmopFZKInwcuYw7j0eiWJONibj2r1Bw5VusBl1
	Snx2zwHMS8X+8xWDnt3DiM/lNg==
X-Google-Smtp-Source: AA+uWPxrZvdlS+p5oKjAdtg8pDb1YK+1Kv6hPhinrgMk9lxh/wVWiPI1ubsGGcyYJjUfyltKwkLRxQ==
X-Received: by 2002:adf:82c3:: with SMTP id
	61-v6mr17280743wrc.131.1534944066423; 
	Wed, 22 Aug 2018 06:21:06 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	t70-v6sm2077564wmt.30.2018.08.22.06.21.05
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 Aug 2018 06:21:05 -0700 (PDT)
Message-ID: <e0ffd2ccefb534b1c4171449256c123e9e6b5e55.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Wed, 22 Aug 2018 14:21:04 +0100
In-Reply-To: <CAPybu_0QAOWyz9+XGKEADtZqj+wj2Ro7hQx_q8BkX9BBrjPPCg@mail.gmail.com>
References: <20180821145858.18459-1-ricardo.ribalda@gmail.com>
	<10e5ea973727e06604a83299fdd5a8d4cfa2633a.camel@linuxfoundation.org>
	<CAPybu_3tUu0LKA1gdSj-MFYfhxiHz62wXrP2ivETSMNiWdWyDg@mail.gmail.com>
	<83a93f3542ad88b01b073b7875839dd2e2c1bf44.camel@linuxfoundation.org>
	<CAPybu_0+uwJghGGyPEAR1bQEtOcFKeH9P2okdhcUBzJ_E-BLDw@mail.gmail.com>
	<a031c89ea6cdb522999796f93b8c1a2c8ec8e4c5.camel@linuxfoundation.org>
	<CAPybu_0QAOWyz9+XGKEADtZqj+wj2Ro7hQx_q8BkX9BBrjPPCg@mail.gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: Fix ldd bug: not a dynamic executable error
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
X-List-Received-Date: Wed, 22 Aug 2018 13:21:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-08-22 at 15:13 +0200, Ricardo Ribalda Delgado wrote:
> > Here I see:
> > 
> > $ MACHINE=qemux86-64 bitbake glibc -e | grep ^RTLDLIST=
> > RTLDLIST="/lib/ld-linux-x86-64.so.2"
> 
> The output of RTLDLIST that I shared was from
> root@qt5122:~# cat /usr/bin/ldd | grep ^RTLD
> RTLDLIST="/lib/ld-linux.so.2 /lib64/ld-linux-x86-64.so.2
> /libx32/ld-linux-x32.so.2"
> 
> If I run your command
> 
> pokyuser@c10753884d1a:/workdir/build$ bitbake glibc -e | grep
> ^RTLDLIST=
> RTLDLIST=""
> 
> If we look at log.do_compile we can see how the the value from ldd is
> rewritten:
> 
> LC_ALL=C sed -e 's%@RTLD@%/lib/ld-linux-x86-64.so.2%g' -e
> 's%@VERSION@%2.27%g' -e 's|@PKGVERSION@|(GNU libc) |g' -e
> 's|@REPORT_BUGS_TO@|<http://www.gnu.org/software/libc/bugs.html>|g'
> -e
> 's%@BASH@%/bin/bash%g' -e 's%@TEXTDOMAINDIR@%/usr/share/locale%g' <
> ldd.bash.in | LC_ALL=C sed -f
> ../sysdeps/unix/sysv/linux/x86_64/ldd-rewrite.sed >
> /workdir/build/tmp/work/dbfp4-poky-linux/glibc/2.27-r0/build-x86_64-
> poky-linux/elf/ldd.new
> 
> cat git/sysdeps/unix/sysv/linux/x86_64/ldd-rewrite.sed
> /LD_TRACE_LOADED_OBJECTS=1/a\
> add_env="$add_env LD_LIBRARY_VERSION=\\$verify_out"
> s_^\(RTLDLIST=\)\(.*lib\)\(\|64\|x32\)\(/[^/]*\)\(-x86-64\|-
> x32\)\(\.so\.[0-9.]*\)[
> ]*$_\1"\2\4\6 \264\4-x86-64\6 \2x32\4-x32\6 \2\3\4\5\6"_
> 
> which basically converts
> /lib/ld-linux-x86-64.so.2
>  into:
>  /lib/ld-linux.so.2 /lib64/ld-linux-x86-64.so.2 /libx32/ld-linux-
> x32.so.2
> 
> I agree that this bug is too obvious for not being noticed for a long
> time. At least I use ldd a lot when thing fails ;)

If you look at glibc_2.28.bb, it rewrites RTLDLIST if the value passed
in is not empty. Yours is empty, the question is therefore why.

Can you add -C10 to the command and see the variable history, here its:

# $RTLDLIST [2 operations]
#   set /media/build3/poky/meta/recipes-core/glibc/glibc-ld.inc:46
#     "${@glibc_dl_info(d)['lddrewrite']}"
#   override[class-nativesdk]:set /media/build3/poky/meta/recipes-core/glibc/glibc-ld.inc:47
#     "${base_libdir}/${@bb.utils.contains('SDK_ARCH', 'x86_64', 'ld-linux-x86-64.so.2', 'ld-linux.so.2', d)}"
# pre-expansion value:
#   "${@glibc_dl_info(d)['lddrewrite']}"
RTLDLIST="/lib/ld-linux-x86-64.so.2"

Cheers,

Richard

