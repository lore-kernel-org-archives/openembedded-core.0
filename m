Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3449.1793311056646547058
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 14:57:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=OaU9D/cF;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so587185e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 14:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793311055; x=1793915855; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4wiDM3uu9yVIolr3lskeezmRYn3J5XdOalAlIrIIsks=;
        b=OaU9D/cFWUpJ1OTy9P9jd0daHIchCvOJNhu5rRm72Zv3KOIjzvp5BYQWotMy5OpnAS
         WQg2axmrnEwmzUNHr5ajWegOTLdhq7lNcqPZ2HC5w+4Tq+gNuFxcP5IAXx+cFQuaYcm2
         gybiAKtF1ef0EmXQX4/d9XmZp6ONjtDIsr6iT1sj2WZyh4j2j929AsNLmPs1CQFklO67
         xxjl2l34RJ0JOAvxar6jf3UytV+V7M3xkxJh56jGf/Hv4Qafvv4mBDMfAPtIzKGDL9+j
         a8AB68acy7YTouLJTPEPfzAXD4Fj2HN/VYj9f0BgUg31fXPTINH/k+/9aYD7hmD7I4yj
         7h+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793311055; x=1793915855;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4wiDM3uu9yVIolr3lskeezmRYn3J5XdOalAlIrIIsks=;
        b=NHuEu4txrZa1o5My2h3h+kY/LmmktCS5na3745wbDCMINGSMU6TuGn10q6gjlW7QpT
         kVNdWSy6FbValKumESkbIPbznjoJ/EhBZiOFYqdWwiUb5aHsITHGcsll7QNulgf35+L1
         hhYAajemD3bcw1Qrdc/FKMrkSvf5sVN3/EO7w3Vm5vo6oDd4nCi3YgXMPtjLQfi7z4tY
         7wYwmkPTwFKnEoBqGpta7i42pi/F0TwAoz2Af7/TSQcf5YaXl6NvAmeCchJHaiTnP59Z
         4/RZzSrmPde/DXY1iQX9dKZkijFm8tujsd9KBO5l21tKRyw1y1cYM0OxHsPG3GrJ58NW
         F7Ng==
X-Forwarded-Encrypted: i=1; AKwUvBwQmlAUiy7qrhCRMjGfGY/1qZaHP+O9T0EqiFE1aHmXsjU0vqEMFZnoryA6Nl4sjf3l0azhFQecCMHNeAU3uLP5kg==@lists.openembedded.org
X-Gm-Message-State: AFq9FYJHOmGPjTk1Z7putLiZjR4hyqLqc0MzIL/0rzQh460lQ4w3XNMd
	bMbwY6wBMAlkgIzJf+at+ETNNNiaEz65kvQ338V8uXhj0paloI1WOsTw2TzcvVyzrG8=
X-Gm-Gg: AYBFou3EEHUQQ8IO5ruOzppK3bdAHd3EHHQtaZjhOV7XX6nK0rFsdNUTF+FTfJLnmUo
	+Rfi0unCIawZvZLa9pdCDI6FWBpwAhp0eewSHGPXUziYR9L++xdFjF20SG/LNgVxMjVtCqJd88w
	lctFNgjvvUjg+njCqs6/wGriqWvrGSzaR/vsEqk0zxXyQwv1yX6K1HtIYOFxOUbvsi+23LbAyU6
	v3BDWhKbN2hQcchLqw/+ElFxvlm+Q1D2DZwBGi3+3kGV+q/zlwmOzUXUADNyig5v6s3WqbLnsOa
	5yKQ6a4nT66ezBBzR/JLXrzga+qaCKfgtxNfU916xOat8v0EpTybM7+hrQGqhfK1kPNdubJBnXM
	CSxtlL5LEI5O6M1zreOmeM/vCokiTwEpCT5/eyf0xfkH65kPN5jf65NZqv3PcoLRN+3uKNuEzVA
	by387wx2ZrAPpyKrvmeI/PB0GdTo0VQb17r92Qr61AFoqQZ3VmsR2NxTkydI+KZn/xZjnlfTlWG
	nuO+MxnmpzTV+9Uao4i+RFbCMQhxjTOIWhkEdhDtyapjMfUMR9zyxCdt8OSswwcDW66b+FyVJvP
	TNFOsXuI5qjgs6DC3dM1genNaJAmRcX+N0qqcvnoPnp8wEecP57vhkgSAJax4kH/7uFzQQZnS7V
	QWvNPRVgh9ZlsdgMX
X-Received: by 2002:a05:600c:848c:b0:4a6:42cc:bf65 with SMTP id 5b1f17b1804b1-4ac1709b206mr6836595e9.17.1793311054618;
        Thu, 29 Oct 2026 14:57:34 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e6eb75d32sm965937f8f.14.2026.10.29.14.57.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 14:57:33 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Oct 2026 22:57:33 +0100
Message-Id: <DMHNPOSPXAYG.1F8I5J7TXRMP4@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH 12/15] glibc: patch CVE-2026-86805
 and CVE-2026-95818
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <peter.marko@siemens.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261022224711.3783258-1-peter.marko@siemens.com>
 <20261022224711.3783258-12-peter.marko@siemens.com>
In-Reply-To: <20261022224711.3783258-12-peter.marko@siemens.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 21:57:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248975

Hello,

On Fri Oct 23, 2026 at 12:47 AM CEST, Peter Marko via lists.openembedded.or=
g wrote:
> From: Peter Marko <peter.marko@siemens.com>
>
> Pick patch [1] which is [2] backported to 3.41 (oldest release still
                                            ^ I think it should be 2.41
here, I fixed that on other patches of my branch.

> receiving security updates) which is mentioned in [3] and [4].
>
> Additionally pick 3 patches for test harness to support new tests.
>
> [1] https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D71648e800426=
58f23965924616fb7db9c2fccff9
> [2] https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3Ded0c137b97eb=
940b4b64981e84ed806d3276edd9

Those 2 commits are really different, can you check?


> [3] https://security-tracker.debian.org/tracker/CVE-2026-86805
> [3] https://security-tracker.debian.org/tracker/CVE-2026-95818
   ^ should be [4]
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  ...043-CVE-2026-86805-CVE-2026-95818-01.patch | 244 +++++
>  ...044-CVE-2026-86805-CVE-2026-95818-02.patch | 298 ++++++
>  ...045-CVE-2026-86805-CVE-2026-95818-03.patch | 115 +++
>  ...046-CVE-2026-86805-CVE-2026-95818-04.patch | 862 ++++++++++++++++++
>  meta/recipes-core/glibc/glibc_2.39.bb         |   4 +
>  5 files changed, 1523 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/glibc/0043-CVE-2026-86805-CVE=
-2026-95818-01.patch
>  create mode 100644 meta/recipes-core/glibc/glibc/0044-CVE-2026-86805-CVE=
-2026-95818-02.patch
>  create mode 100644 meta/recipes-core/glibc/glibc/0045-CVE-2026-86805-CVE=
-2026-95818-03.patch
>  create mode 100644 meta/recipes-core/glibc/glibc/0046-CVE-2026-86805-CVE=
-2026-95818-04.patch
>
> diff --git a/meta/recipes-core/glibc/glibc/0043-CVE-2026-86805-CVE-2026-9=
5818-01.patch b/meta/recipes-core/glibc/glibc/0043-CVE-2026-86805-CVE-2026-=
95818-01.patch
> new file mode 100644
> index 00000000000..42294f02838
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/0043-CVE-2026-86805-CVE-2026-95818-01=
.patch
> @@ -0,0 +1,244 @@
> +From 71648e80042658f23965924616fb7db9c2fccff9 Mon Sep 17 00:00:00 2001
> +From: Joe Simmons-Talbott <josimmon@redhat.com>
> +Date: Thu, 29 Feb 2024 19:55:58 +0000
> +Subject: [PATCH] rtld: Add glibc.rtld.enable_secure tunable.
> +
> +Add a tunable for setting __libc_enable_secure to 1.  Do not set
> +__libc_enable_secure to 0 if the tunable is set to 0.  Ignore all
> +tunables if glib.rtld.enable_secure is set.  One use-case for this
> +addition is to enable testing code paths that depend on
> +__libc_enable_secure being set without the need to use setxid binaries.
> +
> +Reviewed-by: Siddhesh Poyarekar <siddhesh@sourceware.org>
> +
> +CVE: CVE-2026-86805
> +CVE: CVE-2026-95818
> +Upstream-Status: Backport [https://sourceware.org/git/?p=3Dglibc.git;a=
=3Dcommit;h=3D71648e80042658f23965924616fb7db9c2fccff9]
> +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> +---
> + NEWS                             |   5 ++
> + elf/Makefile                     |   2 +
> + elf/dl-tunables.c                |  10 +++
> + elf/dl-tunables.list             |   6 ++
> + elf/tst-rtld-list-tunables.exp   |   1 +
> + elf/tst-tunables-enable_secure.c | 126 +++++++++++++++++++++++++++++++
> + 6 files changed, 150 insertions(+)
> + create mode 100644 elf/tst-tunables-enable_secure.c
> +
> +diff --git a/NEWS b/NEWS
> +index 2d8eaffc58..19f4e93ea3 100644
> +--- a/NEWS
> ++++ b/NEWS
> +@@ -177,6 +177,11 @@ Major new features:
> +   exp, expf, exp10, exp10f, exp2, exp2f, expm1, expm1f, log, logf,
> +   log10, log10f, log1p, log1pf, log2, log2f, sin, sinf, tan, tanf.
> +=20
> ++* A new tunable, glibc.rtld.enable_secure, used to run a program
> ++  as if it were a setuid process. This is currently a testing tool to a=
llow
> ++  more extensive verification tests for AT_SECURE programs and not mean=
t to
> ++  be a security feature.
> ++
> + Deprecated and removed features, and other changes affecting compatibil=
ity:
> +=20
> + * The ldconfig program now skips file names containing ';' or ending in
> [...]
> diff --git a/meta/recipes-core/glibc/glibc/0044-CVE-2026-86805-CVE-2026-9=
5818-02.patch b/meta/recipes-core/glibc/glibc/0044-CVE-2026-86805-CVE-2026-=
95818-02.patch
> new file mode 100644
> index 00000000000..bcb1e08a30f
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/0044-CVE-2026-86805-CVE-2026-95818-02=
.patch
> @@ -0,0 +1,298 @@
> +From 1e1ad714ee9a663eda0e2bffad1d9f258b00a4e9 Mon Sep 17 00:00:00 2001
> +From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
> +Date: Mon, 6 May 2024 13:18:47 -0300
> +Subject: [PATCH] support: Add envp argument to support_capture_subprogra=
m
> +
> +So tests can specify a list of environment variables.
> +Reviewed-by: Siddhesh Poyarekar <siddhesh@sourceware.org>
> +
> +CVE: CVE-2026-86805
> +CVE: CVE-2026-95818
> +Upstream-Status: Backport [https://sourceware.org/git/?p=3Dglibc.git;a=
=3Dcommit;h=3D1e1ad714ee9a663eda0e2bffad1d9f258b00a4e9]
> +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> +---
> + elf/tst-audit18.c                        | 2 +-
> + elf/tst-audit19b.c                       | 2 +-
> + elf/tst-audit22.c                        | 2 +-
> + elf/tst-audit23.c                        | 2 +-
> + elf/tst-audit25a.c                       | 4 ++--
> + elf/tst-audit25b.c                       | 4 ++--
> + elf/tst-glibc-hwcaps-2-cache.c           | 2 +-
> + elf/tst-rtld-run-static.c                | 4 ++--
> + elf/tst-tunables-enable_secure.c         | 2 +-
> + elf/tst-tunables.c                       | 2 +-
> + support/capture_subprocess.h             | 9 +++++----
> + support/subprocess.h                     | 7 ++++---
> + support/support_capture_subprocess.c     | 5 +++--
> + support/support_subprocess.c             | 5 +++--
> + support/tst-support_capture_subprocess.c | 2 +-
> + sysdeps/x86/tst-hwcap-tunables.c         | 2 +-
> + 16 files changed, 30 insertions(+), 26 deletions(-)
> +
> [...]
> diff --git a/meta/recipes-core/glibc/glibc/0045-CVE-2026-86805-CVE-2026-9=
5818-03.patch b/meta/recipes-core/glibc/glibc/0045-CVE-2026-86805-CVE-2026-=
95818-03.patch
> new file mode 100644
> index 00000000000..bb39978881d
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/0045-CVE-2026-86805-CVE-2026-95818-03=
.patch
> @@ -0,0 +1,115 @@
> +From eeb687bb4b371d67abcd3c4c84d5990d8bc78b71 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Fr=3DC3=3DA9d=3DC3=3DA9ric=3D20B=3DC3=3DA9rat?=3D <fbe=
rat@redhat.com>
> +Date: Fri, 29 Nov 2024 14:48:43 +0100
> +Subject: [PATCH] support: Add support_next_to_fault_before support funct=
ion
> +
> +Refactor the support_next_to_fault and add the
> +support_next_to_fault_before method returns a buffer with a protected
> +page before it, to be able to test buffer underflow accesses.
> +
> +Reviewed-by: Tulio Magno Quites Machado Filho <tuliom@redhat.com>
> +(cherry picked from commit fa53723cdb6f0338558e57a2a0a6459c00a1bc5f)
> +
> +CVE: CVE-2026-86805
> +CVE: CVE-2026-95818
> +Upstream-Status: Backport [https://sourceware.org/git/?p=3Dglibc.git;a=
=3Dcommit;h=3Deeb687bb4b371d67abcd3c4c84d5990d8bc78b71]
> +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> +---
> + support/next_to_fault.c | 44 +++++++++++++++++++++++++++++++----------
> + support/next_to_fault.h |  5 +++++
> + 2 files changed, 39 insertions(+), 10 deletions(-)
> [...]
> diff --git a/meta/recipes-core/glibc/glibc/0046-CVE-2026-86805-CVE-2026-9=
5818-04.patch b/meta/recipes-core/glibc/glibc/0046-CVE-2026-86805-CVE-2026-=
95818-04.patch
> new file mode 100644
> index 00000000000..f6c92a7a3a8
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/0046-CVE-2026-86805-CVE-2026-95818-04=
.patch
> @@ -0,0 +1,862 @@
> +From 629565b0c91dc326ac622b05982f21a374cd03c4 Mon Sep 17 00:00:00 2001
> +From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
> +Date: Mon, 17 Aug 2026 15:15:32 -0300
> +Subject: [PATCH] elf: Open the normalized $ORIGIN rpath in AT_SECURE pro=
grams
> + (BZ 34360)
> +
> +For AT_SECURE programs the loader honors $ORIGIN in DT_RPATH only when t=
he
> +expansion is rooted in a trusted directory, but it validated the lexical=
ly
> +normalized path while opening the raw expansion.  As "a/b/../c" only nam=
es
> +"a/c" when "b" is not a symlink, an attacker who controls a component of
> +$ORIGIN -- e.g. by hard-linking the setuid binary into an attacker-owned
> +directory -- can make the opened path escape the trusted directory even
> +though the check passed, loading an attacker-controlled object.
> +
> +Normalize the expansion in place and open that, so the path that is open=
ed
> +is exactly the path that was validated.  _dl_normalize_path rewrites the
> +string in place without ever advancing its write cursor past its read
> +cursor or appending, so it stays within the original storage.
> +
> +Add elf/tst-origin-secure as a regression test.
> +
> +Reviewed-by: Florian Weimer <fweimer@redhat.com>
> +(cherry picked from commit ed0c137b97eb940b4b64981e84ed806d3276edd9)
> +
> +CVE: CVE-2026-86805
> +CVE: CVE-2026-95818
> +Upstream-Status: Backport [https://sourceware.org/git/?p=3Dglibc.git;a=
=3Dcommit;h=3D629565b0c91dc326ac622b05982f21a374cd03c4]
> +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> +---
> + elf/Makefile                             |  18 ++
> + elf/dl-load.c                            |  74 +++------
> + elf/dl-path-normalize.h                  | 118 +++++++++++++
> + elf/libtst-origin-secure-mod.c           |  25 +++
> + elf/tst-dl-path-normalize.c              | 142 ++++++++++++++++
> + elf/tst-origin-secure-evilmod.c          |  28 ++++
> + elf/tst-origin-secure-victim.c           |  43 +++++
> + elf/tst-origin-secure.c                  | 203 +++++++++++++++++++++++
> + elf/tst-origin-secure.h                  |  41 +++++
> + elf/tst-origin-secure.root/postclean.req |   0
> + 10 files changed, 643 insertions(+), 49 deletions(-)
> + create mode 100644 elf/dl-path-normalize.h
> + create mode 100644 elf/libtst-origin-secure-mod.c
> + create mode 100644 elf/tst-dl-path-normalize.c
> + create mode 100644 elf/tst-origin-secure-evilmod.c
> + create mode 100644 elf/tst-origin-secure-victim.c
> + create mode 100644 elf/tst-origin-secure.c
> + create mode 100644 elf/tst-origin-secure.h
> + create mode 100644 elf/tst-origin-secure.root/postclean.req
> +
> +diff --git a/elf/Makefile b/elf/Makefile
> +index d8a0c0c4ae..8a5aa0123a 100644
> +--- a/elf/Makefile
> ++++ b/elf/Makefile
> [...]
> +diff --git a/elf/dl-load.c b/elf/dl-load.c
> +index 7b21f1dffa..0d141a61c1 100644
> +--- a/elf/dl-load.c
> ++++ b/elf/dl-load.c
> +@@ -32,6 +32,7 @@
> + #include <sys/stat.h>
> + #include <sys/types.h>
> + #include <gnu/lib-names.h>
> ++#include <dl-path-normalize.h>
> +=20
> + /* Type for the buffer we put the ELF header and hopefully the program
> +    header.  This buffer does not really have to be too large.  In most
> +@@ -124,54 +125,24 @@ static const size_t system_dirs_len[] =3D
> + };
> + #define nsystem_dirs_len array_length (system_dirs_len)
> +=20
> ++/* Return true if the normalized path NPATH of length NLEN is rooted in=
 one of
> ++   the trusted system directories.  The system_dirs entries carry a tra=
iling
> ++   '/'; NPATH matches an entry when it shares the entry's leading compo=
nent
> ++   sequence and then either ends or continues with '/'.  For instance,
> ++   "/lib64" and "/lib64/x" match "/lib64/" but "/lib64x" does not.  */
> + static bool
> +-is_trusted_path_normalize (const char *path, size_t len)
> ++path_is_trusted (const char *npath, size_t nlen)
> + {
> +-  if (len =3D=3D 0)
> +-    return false;
> +-
> +-  char *npath =3D (char *) alloca (len + 2);
> +-  char *wnp =3D npath;
> +-  while (*path !=3D '\0')
> +-    {
> +-      if (path[0] =3D=3D '/')
> +-	{
> +-	  if (path[1] =3D=3D '.')
> +-	    {
> +-	      if (path[2] =3D=3D '.' && (path[3] =3D=3D '/' || path[3] =3D=3D =
'\0'))
> +-		{
> +-		  while (wnp > npath && *--wnp !=3D '/')
> +-		    ;
> +-		  path +=3D 3;
> +-		  continue;
> +-		}
> +-	      else if (path[2] =3D=3D '/' || path[2] =3D=3D '\0')
> +-		{
> +-		  path +=3D 2;
> +-		  continue;
> +-		}
> +-	    }
> +-
> +-	  if (wnp > npath && wnp[-1] =3D=3D '/')
> +-	    {
> +-	      ++path;
> +-	      continue;
> +-	    }
> +-	}
> +-
> +-      *wnp++ =3D *path++;
> +-    }
> +-
> +-  if (wnp =3D=3D npath || wnp[-1] !=3D '/')
> +-    *wnp++ =3D '/';
> +-
> +   const char *trun =3D system_dirs;
> +=20
> +   for (size_t idx =3D 0; idx < nsystem_dirs_len; ++idx)
> +     {
> +-      if (wnp - npath >=3D system_dirs_len[idx]
> +-	  && memcmp (trun, npath, system_dirs_len[idx]) =3D=3D 0)
> +-	/* Found it.  */
> ++      /* Compare against the entry without its trailing '/'.  */
> ++      size_t dirlen =3D system_dirs_len[idx] - 1;
> ++
> ++      if (nlen >=3D dirlen
> ++	  && memcmp (trun, npath, dirlen) =3D=3D 0
> ++	  && (npath[dirlen] =3D=3D '/' || npath[dirlen] =3D=3D '\0'))
> + 	return true;
> +=20
> +       trun +=3D system_dirs_len[idx] + 1;
> +@@ -361,16 +332,21 @@ _dl_dst_substitute (struct link_map *l, const char=
 *input, char *result)
> +      checked for trust, the authors of the binaries themselves are
> +      trusted to have designed this correctly.  Only $ORIGIN is tested i=
n
> +      this way because it may be manipulated in some ways with hard
> +-     links.  */
> +-  if (__glibc_unlikely (check_for_trusted)
> +-      && !is_trusted_path_normalize (result, wp - result))
> +-    {
> +-      *result =3D '\0';
> +-      return result;
> +-    }
> ++     links.
> ++
> ++     _dl_normalize_path replaces the expansion with its normalized form
> ++     in place, so that the path that is opened is exactly the path that
> ++     was validated.  */
> +=20
> +   *wp =3D '\0';
> +=20
> ++  if (__glibc_unlikely (check_for_trusted))
> ++    {
> ++      size_t nlen =3D _dl_normalize_path (result);
> ++      if (!path_is_trusted (result, nlen))
> ++	*result =3D '\0';
> ++    }
> ++

If I understood correctly, the above hunk is the CVE fix (accompagnied by
the _dl_normalize_path() definition below) everything else is test code
and support to test code (including the new "tunable" in patch -01).

Are you sure we need all of that? To me a new tunable (whatever that is)
feels a bit much for "just" testing a CVE fix.

> +   return result;
> + }
> +=20
> +diff --git a/elf/dl-path-normalize.h b/elf/dl-path-normalize.h
> +diff --git a/elf/libtst-origin-secure-mod.c b/elf/libtst-origin-secure-m=
od.c
> +diff --git a/elf/tst-dl-path-normalize.c b/elf/tst-dl-path-normalize.c
> +diff --git a/elf/tst-origin-secure-evilmod.c b/elf/tst-origin-secure-evi=
lmod.c
> +diff --git a/elf/tst-origin-secure-victim.c b/elf/tst-origin-secure-vict=
im.c
> +diff --git a/elf/tst-origin-secure.c b/elf/tst-origin-secure.c
> +diff --git a/elf/tst-origin-secure.h b/elf/tst-origin-secure.h
> +diff --git a/elf/tst-origin-secure.root/postclean.req b/elf/tst-origin-s=
ecure.root/postclean.req
> diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/gl=
ibc/glibc_2.39.bb
> index 3b27328c21a..d8867bcff9a 100644
> --- a/meta/recipes-core/glibc/glibc_2.39.bb
> +++ b/meta/recipes-core/glibc/glibc_2.39.bb
> @@ -75,6 +75,10 @@ SRC_URI =3D  "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};n=
ame=3Dglibc \
>             file://0040-CVE-2026-18374-01.patch \
>             file://0041-CVE-2026-18374-02.patch \
>             file://0042-CVE-2026-8674.patch \
> +           file://0043-CVE-2026-86805-CVE-2026-95818-01.patch \
> +           file://0044-CVE-2026-86805-CVE-2026-95818-02.patch \
> +           file://0045-CVE-2026-86805-CVE-2026-95818-03.patch \
> +           file://0046-CVE-2026-86805-CVE-2026-95818-04.patch \
>  "
>  S =3D "${WORKDIR}/git"
>  B =3D "${WORKDIR}/build-${TARGET_SYS}"

Other patches before this one in the series (1-11/15) look good to me, I
will take those but hold this on (12/15). I will review 13-15/15 and take
them if they apply cleanly.

Regards,
--=20
Yoann Congal
Smile ECS

