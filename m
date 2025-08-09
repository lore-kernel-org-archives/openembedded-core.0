Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43FD3C87FCF
	for <webhook@archiver.kernel.org>; Sat,  9 Aug 2025 15:45:52 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web10.8659.1754754346427251028
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Aug 2025 08:45:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L2ppQH5u;
 spf=pass (domain: gmail.com, ip: 209.85.219.173, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e7311e66a8eso2802155276.2
        for <openembedded-core@lists.openembedded.org>; Sat, 09 Aug 2025 08:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754754345; x=1755359145; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L1CjaeaJzu0NTP/132N3Q+GutLxvpbLaOdsGu+Y/Dd0=;
        b=L2ppQH5u0s0ENGn3jlY1nVDKtrVUCaGDz/tXTNPw+VDrr4jQmRUmnjHJ8PPWC+WFBV
         chatF65b4ut0RY6ktW1x3rtu+c13fVPJtHho4sGtyg+TZYNeXxKdOn3XlRu8nPriSqkB
         y1zcqI95P4Suu62CGig1z96INS8Z872FclMVKvF25QMHQC7A2YCyzOZdDP33j71NJKw/
         Qjy2/vw6Fu1o/FAVmD+YfrYGL+6mtNqWBjBL7h7PwWRkWO00MboRThb8CvKAsy+C8RhL
         Or2IWSdaJ94k0PiUTl2NDuqyeES/WzkFkGt1l0fLWG/R/HWp0HhdecrjPgvbV/NIFC1C
         3EZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754754345; x=1755359145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L1CjaeaJzu0NTP/132N3Q+GutLxvpbLaOdsGu+Y/Dd0=;
        b=Vz1AVdO1jB/QhCixGMxPF66nzamcVTrlZyusUVvxab+Wwhw2qi2sstXV7btH4NQs+8
         cQ8v407y12w13bzTZexXcNOjjySWutBf0KIDHp5y6ucu/rDaBL8pNQcl3lij3xEI8Ogx
         Rm3c0oIlpzc28XX6xSjJhIBLznTFf+QN8T4H8p/2TD7k5vmIWrfVoNeLzgy0F2Xh7PND
         +8oQupR6qQOwPlnqeopOrMMCUSwarSP8iH5QpqaKTyA1R/jbU+p2zwWqBdxcRy7HdEtR
         v9wnBk1ljB5pmO+XQk6LG3MFe4nHglcTMHE/jxLk+EpcOMuXMxHn0OWoiLTbx9PF4lXD
         F9wg==
X-Gm-Message-State: AOJu0YxbwGtvDzvLYsPiBxJLIr+QI6aR+zGUZho60cv4of7NmpddLhOX
	cfj9PvRWT67ibpDtykqGupK1O0c8TtZ5UFq4rymJ0gkRGOcoJUZ0Irmp8XQEX9ulEQ/K9r7Eyrd
	dDdJQA1+/By/Du0UcL5hmRN+lEB+sg0hDWmxiZFg=
X-Gm-Gg: ASbGnct3rA/qM10i6MOPA838o7gk/Erd1XGxVMM7Z8OLw5X6FNEaypjVntPegJ4s6yN
	8aMvY2JE5PMDa2lqY/RAh54x1PmUz2hSPBblneADUwJCvEeWqC9GSNGEdQ1ac+IyFX38aT6BZR3
	HUTQGUZmYjLGD33fBUykuwDsxT3fCxVq/PndfWUCyrWO/4o+2gtmIch/WjXti+higTDehFLKpY4
	9xciw==
X-Google-Smtp-Source: AGHT+IGQNUJjblGwk1dnMy4dhfS0br27hfvoX6hs6ydn+pgAPeBkJObnAOJgl/TRmQ3RQdA6qO6+i9wGfSdL53ATA1I=
X-Received: by 2002:a05:690c:6c89:b0:718:96c2:b426 with SMTP id
 00721157ae682-71bf0d4038cmr84822537b3.15.1754754345282; Sat, 09 Aug 2025
 08:45:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1754750560.git.steve@sakoman.com> <af3e5e432d9bf1e5811ea92f3e29c0874b6b9405.1754750560.git.steve@sakoman.com>
In-Reply-To: <af3e5e432d9bf1e5811ea92f3e29c0874b6b9405.1754750560.git.steve@sakoman.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 9 Aug 2025 08:45:19 -0700
X-Gm-Features: Ac12FXx-IclPhugmJyIKAf1pLEOEVxOuJOayZUhbcofA7JKTqJAD-ACxYnRFxyM
Message-ID: <CAMKF1srEOsPHQf1wnJNWrUWqB22UJ6iGrFrxJdYeOVwEAhF2yg@mail.gmail.com>
Subject: Re: [OE-core][walnascar 4/6] glibc: stable 2.41 branch updates
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 Aug 2025 15:45:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221684

On Sat, Aug 9, 2025 at 7:44=E2=80=AFAM Steve Sakoman via
lists.openembedded.org <steve=3Dsakoman.com@lists.openembedded.org>
wrote:
>
> From: Peter Marko <peter.marko@siemens.com>
>
> $ git log --oneline 6e489c17f827317bcf8544efefa65f13b5a079dc..e7c419a2957=
590fb657900fc92a89708f41abd9d
> e7c419a295 (origin/release/2.41/master, release/2.41/master) iconv: iconv=
 -o should not create executable files (bug 33164)
> 1e16d0096d posix: Fix double-free after allocation failure in regcomp (bu=
g 33185)
>
> Add CVE-2025-8058 to CVE ignore list as this is (bug 33185) commit.
>

Hi Steve

Should we wait for WRT to report back on glibc regression test results ?

> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  meta/recipes-core/glibc/glibc-version.inc | 2 +-
>  meta/recipes-core/glibc/glibc_2.41.bb     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-cor=
e/glibc/glibc-version.inc
> index a2cfd0f308..881a9cce2c 100644
> --- a/meta/recipes-core/glibc/glibc-version.inc
> +++ b/meta/recipes-core/glibc/glibc-version.inc
> @@ -1,6 +1,6 @@
>  SRCBRANCH ?=3D "release/2.41/master"
>  PV =3D "2.41+git"
> -SRCREV_glibc ?=3D "6e489c17f827317bcf8544efefa65f13b5a079dc"
> +SRCREV_glibc ?=3D "e7c419a2957590fb657900fc92a89708f41abd9d"
>  SRCREV_localedef ?=3D "fab74f31b3811df543e24b6de47efdf45b538abc"
>
>  GLIBC_GIT_URI ?=3D "git://sourceware.org/git/glibc.git;protocol=3Dhttps"
> diff --git a/meta/recipes-core/glibc/glibc_2.41.bb b/meta/recipes-core/gl=
ibc/glibc_2.41.bb
> index 7ddf7f9127..8a65e8ce9f 100644
> --- a/meta/recipes-core/glibc/glibc_2.41.bb
> +++ b/meta/recipes-core/glibc/glibc_2.41.bb
> @@ -17,7 +17,7 @@ Allows for ASLR bypass so can bypass some hardening, no=
t an exploit in itself, m
>  easier access for another. 'ASLR bypass itself is not a vulnerability.'"
>
>  CVE_STATUS_GROUPS +=3D "CVE_STATUS_STABLE_BACKPORTS"
> -CVE_STATUS_STABLE_BACKPORTS =3D "CVE-2025-4802 CVE-2025-5702 CVE-2025-57=
45"
> +CVE_STATUS_STABLE_BACKPORTS =3D "CVE-2025-4802 CVE-2025-5702 CVE-2025-57=
45 CVE-2025-8058"
>  CVE_STATUS_STABLE_BACKPORTS[status] =3D "cpe-stable-backport: fix availa=
ble in used git hash"
>
>  DEPENDS +=3D "gperf-native bison-native"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#221679): https://lists.openembedded.org/g/openembedde=
d-core/message/221679
> Mute This Topic: https://lists.openembedded.org/mt/114616374/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

