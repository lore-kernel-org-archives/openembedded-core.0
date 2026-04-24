Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA1B0FED3D6
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 14:25:59 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24002.1777040754641191249
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 07:25:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=yWt6teS1;
 spf=pass (domain: smile.fr, ip: 209.85.128.65, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso108241885e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 07:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777040753; x=1777645553; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KVW/EWl1+ZboAAedDAyZ59b11DZnmN66omWQIeumc6U=;
        b=yWt6teS1+PbxdXtJS1K2JEvctZa973jlq/FyQU5RTk5bysnZ47Ah4axL8CL6YPXhPV
         K2UAHOtRqh3D6R4j+Zfz9aGPZKfRtI2Q0rv0pWfagovwufOsP1uJV+ofROylIqTq9l3a
         6L7zQTCuKPACAjnRQCfSv1I/8BmAFY0CvtW4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777040753; x=1777645553;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KVW/EWl1+ZboAAedDAyZ59b11DZnmN66omWQIeumc6U=;
        b=U3CFlDcIFHe4DJsxiobWzHIaJ6tj2P73gxuIiDo4YuJ22gseliZTVWtTBdB5FI2r3Q
         jYl53nVIumD6eJr8cOQqW8gc8lwChrNdGNLrSvsCT++blg4BCAlj77ccBXYioMm4G5i8
         HqS1emjAq7InRpfNZIO9rTioygquYsSLidBtKCx0AdF3ynOJq7pN+iyTL81KEXN79HoJ
         vIQa3FmSmwYG5Uh862x0gcZCiF1S+dSSb3CyelFvtgkUpkHz88YQooL0HLUtEkrzr701
         QPe9RAWxf0gG7XzeGl1WJlCif2dUm9TTyRdasO1GxVXkBVilHWe3Twuut/32r5jWyHod
         gwTw==
X-Forwarded-Encrypted: i=1; AFNElJ/V6apdxpmg0VbVPys/7acsMe1VPopKQqajXAirKZOpHnXvAtYJEmKkfo7w6HV0+bbCpaws7LNrgI7zl0Ti0mGTnw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxQ+/Ug14h3e5WQ0KwOIFW+pJE44oQjNrR6QhG985LXq4TgdQM5
	+z597OelZygmlBgPD34ZNzj2I46qzT60PCjoG9B9fT3Xj+8Vj8EeOJP8W5lVYkMEgLI=
X-Gm-Gg: AeBDiethNqvtS9PysD6GsuUTNgISaRGkwIbjmE9xD73vFdqyD48ti2NI5rYoEEhdbUC
	yp3db4JXyIXA23WYRT1QjGGKmyNvuzdsvgPIKmui1iumFdU+sJj9IHjxdQPJRDywu9dFERETDR1
	ef220thrqyR3N0ffUUE5+VB5qKFMVXizW7Xs+Mer9r/u0TPzE35v/hnvz+UH4gRvGSgR32DBDEZ
	U75853luDJT7pigVqQh/VI0+4rKYR1bfWObR9siyTYOYG+RF9qDN4+y6PIFz61NO90qgQo5euEb
	+AsMe10VG2EYTPGh2M/gQaCkQzZKSU8WR9QNHr0YNSWDzzl3QFle3wXwANgFnPDW9hZ0hn/duFH
	NaUbzYbuYpE1iYVIHDKtZm+7UBMTfFL99G/J4Bi5WJP3zmvqbAJnzDGeMrrth6Ew0FZlIiUp5Md
	H/roWEfPZVHQh6HAFVhu6DZs1JsEkZa6L4MQLXZ4vi6lSD7Ej4nkij9d/mjUl62/4/4JJ51udbF
	32YjADdni4hB91OErm1lZs5OQ==
X-Received: by 2002:a05:600c:1d19:b0:48a:525b:e157 with SMTP id 5b1f17b1804b1-48a525be257mr303593775e9.13.1777040752873;
        Fri, 24 Apr 2026 07:25:52 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a575ad67asm229277525e9.2.2026.04.24.07.25.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 07:25:52 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Apr 2026 16:25:51 +0200
Message-Id: <DI1GDFCF2S2N.1XL0C8RBYRIVR@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH 9/9] numactl: upgrade 2.0.18 ->
 2.0.19
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <daniel.turull@ericsson.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260409092936.1740143-1-daniel.turull@ericsson.com>
 <20260409092936.1740143-10-daniel.turull@ericsson.com>
In-Reply-To: <20260409092936.1740143-10-daniel.turull@ericsson.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 14:25:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235863

On Thu Apr 9, 2026 at 11:29 AM CEST, Daniel Turull via lists.openembedded.o=
rg wrote:
> From: Daniel Turull <daniel.turull@ericsson.com>
>
> Changelog for numactl: 2.0.18 -> 2.0.19
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> 3bc85e3 Regenerate configure for new version
> ce049c0 Increase version number to 2.0.19
> 5f77ffa Set version number back again
> 9d767e8 Replace fgrep with grep -F to fix warning
> 3361a63 more unitialized variables
> 3a281e1 Fix unitialized variables
> 0ab9c7a Make numa_available respect EPERM
> 6c14bd5 Save and restore errno when probing for SET_PREFERRED_MANY
> f9deba0 libnuma: fix nodemask allocation size for get_mempolicy
> 81c9a37 Update numactl.c
> 8c454ec numastat: eliminate hard-coded tables
> 87342c3 Don't fail build when set_mempolicy_home_node syscall is unknown
> 4bfdcc6 numactl: Add documentation for weighted interleave
> ece7e22 numactl: Fix RESOURCE_LEAK in show()
> 119eb59 numademo: Fix the using of the uninitialized value
> b67fb88 Add -w and --weighted-interleave for weighted interleave mode

That commit is weird:
https://github.com/numactl/numactl/commit/b67fb88e77b3c200b0e300e2e0edc4f66=
c1d9ea5
It changes the VERSION to 2.1 (I agree, it's a new feature, minor
version should increase) but then, later, version was reset to 2.0.19
but the version stayed.

I don't think this qualify for stable inclusion: this is a new feature.

Regards,

> a7552a1 Fix fallback for set_mempolicy_home_node syscall
>
> Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
> ---
>  .../numactl/numactl/0001-define-run-test-target.patch        | 3 +--
>  .../numactl/numactl/Fix-the-test-output-format.patch         | 5 ++---
>  meta/recipes-support/numactl/numactl_git.bb                  | 4 ++--
>  3 files changed, 5 insertions(+), 7 deletions(-)
>
> diff --git a/meta/recipes-support/numactl/numactl/0001-define-run-test-ta=
rget.patch b/meta/recipes-support/numactl/numactl/0001-define-run-test-targ=
et.patch
> index 68b3e2491f..26026d5dba 100644
> --- a/meta/recipes-support/numactl/numactl/0001-define-run-test-target.pa=
tch
> +++ b/meta/recipes-support/numactl/numactl/0001-define-run-test-target.pa=
tch
> @@ -1,4 +1,4 @@
> -From a5e1fa272f294e739d6caaf629968478796ca53a Mon Sep 17 00:00:00 2001
> +From 90bcc37f12dbf7917b5edca24683a08d483d7bfe Mon Sep 17 00:00:00 2001
>  From: Roy Li <rongqing.li@windriver.com>
>  Date: Mon, 19 Oct 2020 14:42:11 -0700
>  Subject: [PATCH] rename test target as run-test
> @@ -11,7 +11,6 @@ not suitable for cross-compile environment, so rename i=
t as run-test.
>  and define test target to compile the test files.
> =20
>  Signed-off-by: Roy Li <rongqing.li@windriver.com>
> -
>  ---
>   Makefile.am | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> diff --git a/meta/recipes-support/numactl/numactl/Fix-the-test-output-for=
mat.patch b/meta/recipes-support/numactl/numactl/Fix-the-test-output-format=
.patch
> index 8345f71d72..ad90528669 100644
> --- a/meta/recipes-support/numactl/numactl/Fix-the-test-output-format.pat=
ch
> +++ b/meta/recipes-support/numactl/numactl/Fix-the-test-output-format.pat=
ch
> @@ -1,4 +1,4 @@
> -From 29f811d9d381f2ab54b3c8cef77334e32970ef09 Mon Sep 17 00:00:00 2001
> +From 0ac2863bc3d7e576ef948ec729e13b8db68b7e36 Mon Sep 17 00:00:00 2001
>  From: Li xin <lixin.fnst@cn.fujitsu.com>
>  Date: Tue, 21 Jul 2015 02:01:22 +0900
>  Subject: [PATCH] Fix the test output format
> @@ -8,14 +8,13 @@ Upstream-Status: Pending
>  Signed-off-by: Roy Li <rongqing.li@windriver.com>
>  Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
>  Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> -
>  ---
>   test/regress  |  6 +++---
>   test/regress2 | 11 +++++------
>   2 files changed, 8 insertions(+), 9 deletions(-)
> =20
>  diff --git a/test/regress b/test/regress
> -index f06b22f..2fdfacb 100755
> +index 1da7784..b0f06ea 100755
>  --- a/test/regress
>  +++ b/test/regress
>  @@ -78,6 +78,7 @@ probe_hardware()
> diff --git a/meta/recipes-support/numactl/numactl_git.bb b/meta/recipes-s=
upport/numactl/numactl_git.bb
> index bd16df91ec..172e6e964a 100644
> --- a/meta/recipes-support/numactl/numactl_git.bb
> +++ b/meta/recipes-support/numactl/numactl_git.bb
> @@ -10,8 +10,8 @@ inherit autotools-brokensep ptest
> =20
>  LIC_FILES_CHKSUM =3D "file://README.md;beginline=3D19;endline=3D32;md5=
=3D9f34c3af4ed6f3f5df0da5f3c0835a43"
> =20
> -SRCREV =3D "3871b1c42fc71bceadafd745d2eff5dddfc2d67e"
> -PV =3D "2.0.18"
> +SRCREV =3D "3bc85e37d5a30da6790cb7e8bb488bb8f679170f"
> +PV =3D "2.0.19"
> =20
>  SRC_URI =3D "git://github.com/numactl/numactl;branch=3Dmaster;protocol=
=3Dhttps \
>             file://Fix-the-test-output-format.patch \


--=20
Yoann Congal
Smile ECS


