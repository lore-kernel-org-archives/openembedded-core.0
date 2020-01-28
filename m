Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 250DD7FE6B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2020 08:09:12 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id g17so14861509wro.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2020 00:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=uVJycRWrdla5NTmP6EZmpjMi1+lJ331jVRrVoW/MrfM=;
	b=cZMy9lBMoY2NhHpoH6s0j1EgIR55+iLk+y3OJy3YMDDmzyhJNfDbLf8opPezO9+FR2
	38VpR7owqvC29w4XIZuNtrIl9miIlXoBYASmB8O7lIrhehl/kdhgf/lvtO4GlsP1vWaV
	5hr9pp+WEgu6U4NN8uD7F5xgzxOHX7LhZUxyLXNiSu05bkhHOE+akpoxqASebKWM7Nyi
	bVY2yTKiWSBakaD91CyxaAL4rELwGQDwu2GIwWh4Yjx35iDbI9oLKv1UwQQ0RhBvE9ft
	yKaiGhfkX4MpUCqNozhuR+3ZO65sMfQlfpuFtCqhVr2kUuulWcFWH3irB9oq3MEPWbqh
	zYKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=uVJycRWrdla5NTmP6EZmpjMi1+lJ331jVRrVoW/MrfM=;
	b=onB1xbT4fd7706fs9UKZNowUnnTXn2KZIsUJn+/gea0ePs7GaMheB/Dq1eWokBC+dW
	v7u8sQkLJRfZqwNyCnHrBtlU7tOnpl8NHYnjC1rWDVcmcrBBBf3EBanwNpbSkiLCPLNH
	9ulW6VQdQ/YsEA8U1r3rrypR7rTz4sw2Jj6Yr0bLU4k2Dt4QCj0N4DNgOB5tBjtRKmN2
	LqMDLl6JfECxZXmY1wjysJJRMx1J5LVFx1BZtfdFbpd740dCQbuuZXOvFNUDKItA++rV
	BaT/wqJYs9Vwu09/qF5huf5zFGAYecDgYRneu0RtbOte1/gLK85ablflH8vm5FZ9+wck
	j4Xw==
X-Gm-Message-State: APjAAAXZiR7nVea7UafzGWQaXWKAfwyYk4epndiE4ILQfCUFV6j6HRI6
	dmq9XwLcsbCWFF0DF8FyZ0VaVC2U
X-Google-Smtp-Source: APXvYqxHkOLXJuGBupemV14+GRtd3icqHwLYIjMti3C1Kolg4VqYivXU9Bj98DBGWPZRjb+VLFkUoQ==
X-Received: by 2002:a5d:6144:: with SMTP id y4mr26423099wrt.367.1580198953551; 
	Tue, 28 Jan 2020 00:09:13 -0800 (PST)
Received: from ?IPv6:2a02:2450:1011:56f:41f4:d948:355:db54?
	([2a02:2450:1011:56f:41f4:d948:355:db54])
	by smtp.gmail.com with ESMTPSA id
	w20sm1839882wmk.34.2020.01.28.00.09.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Jan 2020 00:09:13 -0800 (PST)
Mime-Version: 1.0 (1.0)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Mailer: iPhone Mail (16G102)
In-Reply-To: <20200128035850.2629175-1-raj.khem@gmail.com>
Date: Tue, 28 Jan 2020 09:09:12 +0100
Message-Id: <A678FC67-6C95-4B81-8DC0-28446111D1CE@gmail.com>
References: <20200128035850.2629175-1-raj.khem@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] valgrind: Fix ptest builds on musl
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
X-List-Received-Date: Tue, 28 Jan 2020 08:09:13 -0000
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

The reason I dropped the previous version of this is that with the patch the=
 test failed, without the patch it passed. If you can confirm that the new v=
ersion doesn=E2=80=99t regress the test I would appreciate. You can edit run=
-ptest prior to running it to include only the test suite with this test to m=
ake it quicker.

Alex

> On 28 Jan 2020, at 4.58, Khem Raj <raj.khem@gmail.com> wrote:
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
> v2: Use uintptr_t instead of long
>=20
> ...ad_detatch-call-portable-across-plat.patch | 44 +++++++++++++++++++
> .../valgrind/valgrind_3.15.0.bb               |  1 +
> 2 files changed, 45 insertions(+)
> create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-tests-Make=
-pthread_detatch-call-portable-across-plat.patch
>=20
> diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-tests-Make-pthre=
ad_detatch-call-portable-across-plat.patch b/meta/recipes-devtools/valgrind/=
valgrind/0001-tests-Make-pthread_detatch-call-portable-across-plat.patch
> new file mode 100644
> index 0000000000..44d707a235
> --- /dev/null
> +++ b/meta/recipes-devtools/valgrind/valgrind/0001-tests-Make-pthread_deta=
tch-call-portable-across-plat.patch
> @@ -0,0 +1,44 @@
> +=46rom 90fdb0ae0418f7907f09b763343a457bdf6855fa Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Mon, 27 Jan 2020 17:17:19 -0800
> +Subject: [PATCH] tests: Make pthread_detatch call portable across platfor=
ms
> +
> +pthread_t is opaque type therefore we can not apply simple arithmetic to v=
ariables of pthread_t type
> +this test needs to pass a invalid pthread_t handle, typcasting to uintptr=
_t works too and is portable
> +across glibc and musl
> +
> +Fixes
> +| pth_detached3.c:24:25: error: invalid use of undefined type 'struct __p=
thread'
> +|    24 |   pthread_detach(thread + 8);
> +|       |                         ^
> +
> +Upstream-Status: Submitted [https://sourceforge.net/p/valgrind/mailman/me=
ssage/36910506/]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + drd/tests/pth_detached3.c | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/drd/tests/pth_detached3.c b/drd/tests/pth_detached3.c
> +index c02eef11a..efeb15b72 100644
> +--- a/drd/tests/pth_detached3.c
> ++++ b/drd/tests/pth_detached3.c
> +@@ -4,6 +4,7 @@
> + #include <errno.h>
> + #include <pthread.h>
> + #include <stdio.h>
> ++#include <stdint.h>
> +=20
> + static void* thread_func(void* arg)
> + {
> +@@ -21,7 +22,7 @@ int main(int argc, char** argv)
> +   pthread_detach(thread);
> +=20
> +   /* Invoke pthread_detach() with an invalid thread ID. */
> +-  pthread_detach(thread + 8);
> ++  pthread_detach((pthread_t)((uintptr_t)thread + 8));
> +=20
> +   fprintf(stderr, "Finished.\n");
> +=20
> +--=20
> +2.25.0
> +
> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb b/meta/reci=
pes-devtools/valgrind/valgrind_3.15.0.bb
> index 0f86aa44ca..1475ff841e 100644
> --- a/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
> +++ b/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
> @@ -40,6 +40,7 @@ SRC_URI =3D "https://sourceware.org/pub/valgrind/valgrin=
d-${PV}.tar.bz2 \
>            file://0001-adjust-path-filter-for-2-memcheck-tests.patch \
>            file://s390x_vec_op_t.patch \
>            file://0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.=
patch \
> +           file://0001-tests-Make-pthread_detatch-call-portable-across-pl=
at.patch \
>            "
> SRC_URI[md5sum] =3D "46e5fbdcbc3502a5976a317a0860a975"
> SRC_URI[sha256sum] =3D "417c7a9da8f60dd05698b3a7bc6002e4ef996f14c13f0ff966=
79a16873e78ab1"
> --=20
> 2.25.0
>=20

