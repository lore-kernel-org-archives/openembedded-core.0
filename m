Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC2EBCA0EE4
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 14:33:42 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web11.311.1755700415570571288
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Aug 2025 07:33:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HSK47YIh;
 spf=pass (domain: gmail.com, ip: 209.85.219.182, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e931c71a1baso6546870276.0
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 07:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755700415; x=1756305215; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QGN7gGpxA2bl9DqTjS9ThJsHRmRr2gP/7WAyUPi00Yg=;
        b=HSK47YIh71E5VFzwH5zPf6y+3m1yAGLcSAtkjLC/a/Zhgol1wbvSVkz3Qfes++4VOT
         EXeFeZFZQ7tQqMFe20Fs6Yeb6H4A1I/T3HdjOhFXHWczD2i3gnEqp3ZQuGYntBh3Z7lu
         Mnim1hS7GyLbVWOb/8NMOTh97gGfzi2BiZpllDKMLiZ1ElCeei3egFw1okKcM76dPvMT
         uLXJXPqwxIJe7WcDqNNpz+nDYwa4cgkIb2E55gUcOBRgNqsaYb6RuEC+UtzcuGO/3O/S
         XuqDuzl7YYM4GM3Gulbm5dfpDsvYxcD4qU5z8p3pL4vAREZ0bllcDWg+pt06V0gIE9HK
         jRNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755700415; x=1756305215;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QGN7gGpxA2bl9DqTjS9ThJsHRmRr2gP/7WAyUPi00Yg=;
        b=Q5qbq8Aj+NVNRrnoCrsVcOpdOjlgKwUEmWfXlo/Ki1TUErBp0myF9PSZ3pOL+Opwh5
         A5SMiuJ0xy6g7Sw6KAqfC+mDYzXRT9qF7O7AXoyI0u42MzQdqobJ/bp/Dq7S3OaJOsWZ
         l2aCnvQ2qlWpeYsEwAwQl1wvwLY9Sy8Zr7Kwu0AlP3QjnYJ5N5z7CyHgUEFxuPF3EM+/
         fI/9H9+B5m+UlbNw8cZAfrnz2IMMmOw0ULbQP9WJofZUvTMWwJbFDnx9eamhmz2pr/t1
         WstukmAUrfwJnLRNQQP7QgdNbPQ3jT3G07Tvng9o/hnyXgDZx89JQ+KMSkrYNgeuDn4D
         72BA==
X-Gm-Message-State: AOJu0Yy1vECPgcZSBg7eQ4vyyk3QktS/4sekE1bTnyqZU5QcaJicbl6c
	9ZjH2O/DIjef0k9z3gibwYDjD3BXs56vqZDYwLJEHPfQi2j4SnR5SqTgCBAAJQm2LByR/2Ysrrf
	Oy3O2p0tJSoSZmGPhux2bNlI8kF+jUUQ=
X-Gm-Gg: ASbGncs50SKJ5eFk+KoJSHSsOnTBlvYurRxMNpG/VEh91MzS5Uk2p19Iz99svdoMEZI
	rIAqIWXAgXIWeRhhm6aRUEcv4RzaSe8mF8WSj4EvZk/0fEoHoI1FPEzqcMLZ+ET5hE6YeFbf+8W
	ODPTCs/zf7bY+RgV9RDrhwVPOkPV1HYI4DHv5oSSdNQwrLHmq7K4mSMYZCjAKJV4P4Iw8JFvwtQ
	+/dcPIy1Ab1V+sCP385OStl7IvaAqzOLDeZRt9s
X-Google-Smtp-Source: AGHT+IH5tAM9BSRPBN5O5NLCGIAGJSiiKc/K3aq0RYqKrlFkl7sJX+HLmURGrc3dMG7tzKxRKsiQCbBZy/XqDSWp3uo=
X-Received: by 2002:a05:6902:2a81:b0:e93:486f:b354 with SMTP id
 3f1490d57ef6-e94f6678985mr3269597276.41.1755700414603; Wed, 20 Aug 2025
 07:33:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250819010128.3519760-1-raj.khem@gmail.com> <20250819010128.3519760-3-raj.khem@gmail.com>
 <DC71FJJ2QC94.35CLO3OBAN1BF@bootlin.com> <CAMKF1sqTdHQrCUYK3dGGzi+=mGZBogaR1TD2r+zMSkJWz3vWUg@mail.gmail.com>
 <DC77JFI2499F.1BTYUM51QCASE@bootlin.com>
In-Reply-To: <DC77JFI2499F.1BTYUM51QCASE@bootlin.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Aug 2025 07:33:08 -0700
X-Gm-Features: Ac12FXyfQ9JL4gFIPOTUXtjDDPByOmOyEI__ktAzNCrG0cLe89eLJbUaKZzSruk
Message-ID: <CAMKF1spYCYK3PJ-Keauh1Z3n7i6xq1TUJMfSbCB_Gu9S_80FbQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] m4: Fix ptest on musl
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	Peter Marko <peter.marko@siemens.com>, Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 14:33:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222186

On Wed, Aug 20, 2025 at 4:10=E2=80=AFAM Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:
>
> On Wed Aug 20, 2025 at 9:15 AM CEST, Khem Raj wrote:
> > On Tue, Aug 19, 2025 at 11:23=E2=80=AFPM Mathieu Dubois-Briand
> > <mathieu.dubois-briand@bootlin.com> wrote:
> >>
> >> On Tue Aug 19, 2025 at 3:01 AM CEST, Khem Raj via lists.openembedded.o=
rg wrote:
> >> > Fixes
> >> > ../../sources/m4-1.4.20/tests/test-c32ispunct.c:261: assertion 'is =
=3D=3D 0' failed
> >> > ./test-c32ispunct.sh: line 36:   402 Aborted
> >> > (core dumped) LC_ALL=3D"$testlocale" ${CHECKER} ./test-c32ispunct${E=
XEEXT} 3
> >> >
> >> > FAIL: test-c32ispunct.sh
> >> >
> >> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> > ---
> >>
> >> Hi Khem,
> >>
> >> Thanks for your patch.
> >>
> >> It looks like this is breaking tests, specifically on qemuriscv64:
> >>
> >> Traceback (most recent call last):
> >>   File "/srv/pokybuild/yocto-worker/qemuriscv64/build/meta/lib/oeqa/sd=
k/cases/maturin.py", line 25, in test_maturin_list_python
> >>     output =3D self._run("maturin list-python")
> >>              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >>   File "/srv/pokybuild/yocto-worker/qemuriscv64/build/meta/lib/oeqa/sd=
k/case.py", line 17, in _run
> >>     return subprocess.check_output(". %s > /dev/null; %s;" % \
> >>            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >>   File "/usr/lib/python3.12/subprocess.py", line 466, in check_output
> >>     return run(*popenargs, stdout=3DPIPE, timeout=3Dtimeout, check=3DT=
rue,
> >>            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >>   File "/usr/lib/python3.12/subprocess.py", line 571, in run
> >>     raise CalledProcessError(retcode, process.args,
> >> oeqa.utils.subprocesstweak.OETestCalledProcessError: Command '. /srv/p=
okybuild/yocto-worker/qemuriscv64/build/build/tmp/work/qemuriscv64-poky-lin=
ux/core-image-minimal/1.0/testsdkext/environment-setup-riscv64imafdc-poky-l=
inux > /dev/null; maturin list-python;' died with <Signals.SIGSEGV: 11>.
> >>
> >
> > seems quite unrelated, I wonder if its finding some other bug
>
> Yes, I can't understand what happens here :(
> Yet this commit always triggers the failure.
>

Looking at logs there is some more info  immediately after what you
posted above that is interesting

Stdout:
Trying to install python3-maturin-native...

its running lib/oeqa/sdk/cases/maturin.py and
it seems it needs python3-maturin-native in sstate cache and I wonder
if it's missing because m4/m4-native dependency will rebuild
python3-maturin-native or something is racing with it.

There was a similar problem in recent past and a related fix was committed
https://git.yoctoproject.org/poky/commit/?id=3D2239c2c91ab35c67ccd95afe0573=
50037f7d0e59

I now wonder if the test is exited when it does not find
python3-maturin-native correctly or not.

> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

