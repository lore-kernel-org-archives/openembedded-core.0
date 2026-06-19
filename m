Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0225DCD98F2
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 20:06:54 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50754.1781899606564823798
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2026 13:06:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=C0BsuANL;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490aaeabdb4so14635045e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 13:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781899605; x=1782504405; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GIxDfwpCSDEgfqsjaCd26iLGKXK7soi/iX5wb9bhoPA=;
        b=C0BsuANL6PLCGLy7KCz5cJ090Ft4mo88lr+IrfBIgrUhBXHcCSoStdqjIp1Xooe4+O
         293mV2Qg/v2VpwvEqs7fP8ntg3TdGVaKT1uzDk17X5+QNvuw8CBdyyn7u8b+Brt1JGc7
         EycwNXzaFchLDECicaNIEWo28NKUmI9XeXEMI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781899605; x=1782504405;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GIxDfwpCSDEgfqsjaCd26iLGKXK7soi/iX5wb9bhoPA=;
        b=gfakr73NnbRmAMGP6XFBNCXIAK3ZqBd7YEYBp9hwHj+uV5EGj/gAs0sQ3rnKK8eHrR
         BwYG2IDvsoRGQhNNPc1eCqjahlrc7Y/FikXIt1Cw7e8mGus8pZC/afYUwXq2P/Iy26mT
         Bqa2KvqkZ+0RAdDd43i+G/N9s+xM3kELvZ1ZLut+2EVI+UTaGgnJzywNua/xRJadJrpx
         ZzN7mKiAQVFeAE4Nh3UwCxYLimUcPNS9zPe29QK+lmHiqdOpFDvUqa7Vrync6kCJnymR
         nSqGn58ay1NtLh1XfcajF/mgI5rZ8CzoDpyGzPEvyyN7Vh4PnKs+FokfHGJt/UV85v6W
         wYPQ==
X-Forwarded-Encrypted: i=1; AFNElJ+qyntcksUKg1easommZP51vwuEZf/FzwgKD/ESlULF4rFIU0v2566jpOlSgvHu+x4R+M7rWh70ZekBYJyagDp/cw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzL/ONySMjMp1UAXPWy54m60n5qTlXFjoW1G2LOlFTuPuZwg0cZ
	n70/7e4CjDo4RxeL1zIjI8+UD5x+IyC24gntoAcYCk5oHvjgNviry/IEMIP1YdKzePMUQoflzH9
	Cw+Fa
X-Gm-Gg: AfdE7cnEotDeresa70gNtvL6eghF9hL7K+lDz7Eo9eaAz+WKYR+zhJLNxQeRMKzgs/l
	S5hGhp4L+CWO1IJ9KRbtJFBJQxarPkIYh1GlYHPEN8z+s2N5r32q2cpGO9iEx+lgFKjkqoO3TJ2
	JTHeBJr5RMNl72i5vbuZvYU9cyxvCV3Sd1RnF2Xnabt2r4iAniFh3RqGR/GfJSDU5eDcUmTTQik
	kamzy0fRtDpuPzldn7dfYoZ9YpWwxALtF+i3+g4WVkdNv2+P+33Ri2H41jaJx7IiXGJq+9z4v/Q
	JbURfhZFfo+NatYKBDJNq8G/xh54aoKZ+qZGjdIpBMNUD7fz5igSG9vn44Pt3uTjyguXehKfr9I
	FCR0B45OnVVPGb2R6KGw29HjT1mlT2uLBEvlD4FaQjFNQbrUaxYBEb9r+OVr7GyOffSF4I4UqBM
	pn81jcensy3e+2m7Goz8VwaS3uHOxT+6p4YiS5bHFyS/tVmedWvUZCHAHZNvnUyS25PrS5xoX3o
	qeU
X-Received: by 2002:a05:600c:5252:b0:490:bd1d:4732 with SMTP id 5b1f17b1804b1-4923f579333mr90174405e9.23.1781899604520;
        Fri, 19 Jun 2026 13:06:44 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fd154fdsm85677425e9.1.2026.06.19.13.06.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 13:06:44 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 19 Jun 2026 22:06:43 +0200
Message-Id: <DJDAOX536L0X.1J4TFH02UP4YL@smile.fr>
Subject: Re: [OE-core][PATCH] python3: Skip test_tracemalloc_track_race for
 glibc and musl
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <kris.gavvala@windriver.com>
To: <Kris.Gavvala@windriver.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260619195405.4021971-1-kris.gavvala@windriver.com>
In-Reply-To: <20260619195405.4021971-1-kris.gavvala@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 20:06:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239192

On Fri Jun 19, 2026 at 9:54 PM CEST, Kris via lists.openembedded.org Gavval=
a wrote:
> Skip test_tracemalloc_track_race when running with glibc or musl to avoid=
 ptest
> failures for now.
>
> [YOCTO #16182]
>
> Signed-off-by: Kris Gavvala <kris.gavvala@windriver.com>
> ---

Hello,

Given the python3 version, that looks like a scarthgap targeted patch.
If so, you need to add "[scarthgap]" in the subject when sending.
README.OE-Core.md has instructions on how to do that using
git-send-email.

That said, this fix need to be sent to master first then to wrynose and
scarthgap to be accepted.

Can you send a fix to master first (maybe using SKIPPED_TESTS) and then
send a backport to wrynose/scarthgap?

Thanks!

>  ...malloc_track_race-for-glibc-and-musl.patch | 44 +++++++++++++++++++
>  .../python/python3_3.13.12.bb                 |  1 +
>  2 files changed, 45 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3/0001-Skip-test_t=
racemalloc_track_race-for-glibc-and-musl.patch
>
> diff --git a/meta/recipes-devtools/python/python3/0001-Skip-test_tracemal=
loc_track_race-for-glibc-and-musl.patch b/meta/recipes-devtools/python/pyth=
on3/0001-Skip-test_tracemalloc_track_race-for-glibc-and-musl.patch
> new file mode 100644
> index 0000000000..093de45995
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3/0001-Skip-test_tracemalloc_tra=
ck_race-for-glibc-and-musl.patch
> @@ -0,0 +1,44 @@
> +From b0fcd618c8387387d38dd0b4494bb8d94b49b849 Mon Sep 17 00:00:00 2001
> +From: Kris Gavvala <kris.gavvala@windriver.com>
> +Date: Fri, 19 Jun 2026 10:44:22 -0700
> +Subject: [PATCH] Skip test_tracemalloc_track_race for glibc and musl
> +
> +test_tracemalloc_track_race crashes with a SIGSEGV
> +when running python3 ptests on qemuarm64.
> +
> +Skip the test when running with glibc or musl to avoid ptest
> +failures for now.
> +
> +Upstream-Status: Inappropriate [OE-specific]
> +
> +[YOCTO: #16182]
> +
> +Signed-off-by: Kris Gavvala <kris.gavvala@windriver.com>
> +---
> + Lib/test/test_tracemalloc.py | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/Lib/test/test_tracemalloc.py b/Lib/test/test_tracemalloc.py
> +index 0220a83..b2159f9 100644
> +--- a/Lib/test/test_tracemalloc.py
> ++++ b/Lib/test/test_tracemalloc.py
> +@@ -1,6 +1,7 @@
> + import contextlib
> + import os
> + import sys
> ++import platform=20
> + import textwrap
> + import tracemalloc
> + import unittest
> +@@ -1111,6 +1112,8 @@ class TestCAPI(unittest.TestCase):
> +             self.untrack()
> +=20
> +     @unittest.skipIf(_testcapi is None, 'need _testcapi')
> ++    @unittest.skipIf(platform.libc_ver()[0] =3D=3D 'glibc', "Skip test =
for glibc")
> ++    @unittest.skipIf(platform.libc_ver()[0] =3D=3D 'musl', "Skip test f=
or musl")
> +     @threading_helper.requires_working_threading()
> +     # gh-128679: Test crash on a debug build (especially on FreeBSD).
> +     @unittest.skipIf(support.Py_DEBUG, 'need release build')
> +--=20
> +2.49.0
> +
> diff --git a/meta/recipes-devtools/python/python3_3.13.12.bb b/meta/recip=
es-devtools/python/python3_3.13.12.bb
> index 854d834135..0176abb849 100644
> --- a/meta/recipes-devtools/python/python3_3.13.12.bb
> +++ b/meta/recipes-devtools/python/python3_3.13.12.bb
> @@ -32,6 +32,7 @@ SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Pyt=
hon-${PV}.tar.xz \
>             file://0001-Generate-data-for-OpenSSL-3.4-and-add-it-to-multi=
ssl.patch \
>             file://0001-Skip-flaky-test_default_timeout-tests.patch \
>             file://0001-gh-128377-Skip-test_cmd_line.test_non_interactive=
_ou.patch \
> +           file://0001-Skip-test_tracemalloc_track_race-for-glibc-and-mu=
sl.patch \
>             "
>  SRC_URI:append:class-native =3D " \
>             file://0001-Lib-sysconfig.py-use-prefix-value-from-build-conf=
igu.patch \


--=20
Yoann Congal
Smile ECS


