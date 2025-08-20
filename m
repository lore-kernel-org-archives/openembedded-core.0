Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1C73CA0EED
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 07:15:48 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web11.14382.1755674144953992932
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Aug 2025 00:15:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hBx0hs8w;
 spf=pass (domain: gmail.com, ip: 209.85.219.178, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e934c8f9751so3288437276.2
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 00:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755674144; x=1756278944; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N6sToUlN2xvk/uGt90y31gnE5U1Q8ZdCI44VcJDaahg=;
        b=hBx0hs8w4//QVjvTahzVXmnwgVAPqBYUTDNEP3liBrIIAzfXhl4uOAg3OQXp5ouK42
         7i2j1JQMYPWbxHFBKZ8eLdORkwua0WTBbhTU6i1SBYGW389Mgee+VlDIixQrNIkHFawe
         3Fj7HUH7tif9QoqlnsX25CcBYn0LyWtj0kct5az0EaoQ14NAmCqWKIgWPxbuzYtx2QQS
         ganWfN+rdzOwQ63sjl6I3OMiAZ4/QOwers2cXcW74bRBXBt4hDaUrvu8rI6DocdsGkWX
         3wjcrzp94cy4noJVmY3KPRYYLcfNZIrfgCXeOe1Bl03Q51WJrVFTB6fFDS+a5f+C8SgP
         3MnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755674144; x=1756278944;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N6sToUlN2xvk/uGt90y31gnE5U1Q8ZdCI44VcJDaahg=;
        b=r9zquI2s4ZZknUjmjuQ9ptYZWh70T8hmdEw9wB4cBO6+0mibir5q1nzogIxIaSSV1M
         OcIBaddnngxF/9b9VvQLBnFVfGch7cAqqqbhPuui5/YGHez96Dnyz3vMJGhZm9Kyu2Ba
         tM5hl8jBI3oFkGvXtnw0nBXyotBQP7ayN43WXZWXHeEiTCawsVzqyHDmSwsdA6Za1Zcp
         6Czmz4c5DOhdb9JVW7anWP0DyPOUPVwYYc4uRS0eR+RFixfZlPF3kTQeXAA66PH9LzbC
         RZrF7Rd1wvb/3OoOhk0YdnDum0/pygs82D+eYK24+YVMXsX7NoxJ49r7+WC42obs9wY3
         r89g==
X-Gm-Message-State: AOJu0Yy+33Dxzrr1g4Ff9O5k0X3ov1LUHGodZNef5lIQj4HSrUKqzclD
	9HbMS87IZMYnJ8WEaVduJPREsXbxZTpctMMYLtY9+DioMA9NpUWJHr07pZZgXZCsOvOjEOVMyTd
	C6RXdLwWQRAO+RC+32V8hmOwQvTs0tnQ=
X-Gm-Gg: ASbGncvwzfJw95kUnrSD2jnmOG0AOYsaaYscQ41jKrBR7qqT+2xYRq0f4I/Bk68ayPt
	NiC4GVK6BRFAMK31lAKeMomVEmBb17JcJIhFy7BdaDPcLar2FvJTbCC8ixlt1BmDiPcKqtHsT4K
	1+D1jfPcCgxwD0l01fK4mrA8/WangFKR0s9qMxu4TGNqiQZxMcIdU7JizKuAeB600T1oNrWalVA
	u9BZzaVHJOjX8YjN9a+40osM3AZAyF7MqgdH9roRWjuynNmwcM=
X-Google-Smtp-Source: AGHT+IHzDbaqX2lVd/HYiJmK/zb78AJQgaiksC2bu8cap96u0Js2Jijh/pQcUfZIJcyEvuWRn7wF49/5dtFWJ7o1Sfg=
X-Received: by 2002:a05:6902:1006:b0:e90:fd5d:d12c with SMTP id
 3f1490d57ef6-e94f659d10fmr2421005276.18.1755674143943; Wed, 20 Aug 2025
 00:15:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250819010128.3519760-1-raj.khem@gmail.com> <20250819010128.3519760-3-raj.khem@gmail.com>
 <DC71FJJ2QC94.35CLO3OBAN1BF@bootlin.com>
In-Reply-To: <DC71FJJ2QC94.35CLO3OBAN1BF@bootlin.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Aug 2025 00:15:17 -0700
X-Gm-Features: Ac12FXw3VDsBOuxZBTjrr4CXe0c0NzGT1_xOK8SaOcaPzj2GnhdvUwxGYwb47E4
Message-ID: <CAMKF1sqTdHQrCUYK3dGGzi+=mGZBogaR1TD2r+zMSkJWz3vWUg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] m4: Fix ptest on musl
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 07:15:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222158

On Tue, Aug 19, 2025 at 11:23=E2=80=AFPM Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:
>
> On Tue Aug 19, 2025 at 3:01 AM CEST, Khem Raj via lists.openembedded.org =
wrote:
> > Fixes
> > ../../sources/m4-1.4.20/tests/test-c32ispunct.c:261: assertion 'is =3D=
=3D 0' failed
> > ./test-c32ispunct.sh: line 36:   402 Aborted
> > (core dumped) LC_ALL=3D"$testlocale" ${CHECKER} ./test-c32ispunct${EXEE=
XT} 3
> >
> > FAIL: test-c32ispunct.sh
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
>
> Hi Khem,
>
> Thanks for your patch.
>
> It looks like this is breaking tests, specifically on qemuriscv64:
>
> Traceback (most recent call last):
>   File "/srv/pokybuild/yocto-worker/qemuriscv64/build/meta/lib/oeqa/sdk/c=
ases/maturin.py", line 25, in test_maturin_list_python
>     output =3D self._run("maturin list-python")
>              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/srv/pokybuild/yocto-worker/qemuriscv64/build/meta/lib/oeqa/sdk/c=
ase.py", line 17, in _run
>     return subprocess.check_output(". %s > /dev/null; %s;" % \
>            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/usr/lib/python3.12/subprocess.py", line 466, in check_output
>     return run(*popenargs, stdout=3DPIPE, timeout=3Dtimeout, check=3DTrue=
,
>            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/usr/lib/python3.12/subprocess.py", line 571, in run
>     raise CalledProcessError(retcode, process.args,
> oeqa.utils.subprocesstweak.OETestCalledProcessError: Command '. /srv/poky=
build/yocto-worker/qemuriscv64/build/build/tmp/work/qemuriscv64-poky-linux/=
core-image-minimal/1.0/testsdkext/environment-setup-riscv64imafdc-poky-linu=
x > /dev/null; maturin list-python;' died with <Signals.SIGSEGV: 11>.
>

seems quite unrelated, I wonder if its finding some other bug
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/45/builds/354
>
> I've launched a few rebuilds, the issue does reproduce every times. Can
> you have a look please?
>
> Best regards,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

