Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE97DCCD199
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 23:45:35 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web11.4452.1760658333785799427
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Oct 2025 16:45:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lJoJzT8+;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-7815092cd0aso15737837b3.2
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 16:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760658333; x=1761263133; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I+DsoGVHm24U0H2EREcwLljkfMpYHp6TDFMh/GF1eUY=;
        b=lJoJzT8+cUt32TLBUsSXxyaonb2toTAWHsvK4vaF43i59eDFLA21LBcbIE3WDlKarJ
         mpc/WmgvjUV223EjR3h+RuRnhWy/JsMI2NiJuKBSfI0UPvgKF6CkC7R8uXVyO32Dq/z/
         Z+gwcxSoH0kuFlohEVM/rDjEpVkVbLkb6CV8s+6YNhiyD/d3IXJ/YcU21x9xzC//DhBY
         R+l9mLF2PI8ZHVZOUj3Ubo4dkif713TKmmqIYUF1AmST+jqseGfGUTu+av1Khd0oTQpy
         xu7iSqm8assDYNvmvqugqWgVhJvqPht7UrlO33+W0hc8zXle69Wc6ayi5VlBay53/8vY
         U1wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760658333; x=1761263133;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I+DsoGVHm24U0H2EREcwLljkfMpYHp6TDFMh/GF1eUY=;
        b=pGosaIg25Dgwpgzh2KuIWMab99TIyfcApl/Gfc/Lgw/7ek3aI+qKTq9BBZE0RHAxK8
         kI9CqeXlG9vjv9IMfKaeHMwVddGHO+Z3H/GeASRtgMEuDv427/KhZ0pBYcJO12/SpmU/
         KwPCiFpl2SiclG+HlnN7yn5J2PROa3CIcQw6zCPH14obkVypZM5Fr8aF7xhbvwsPzn0b
         Rcql6uNYOmxOWJpPfkqDNZyN9uAnJe49lMZPjCYRUzhIbULszS7TkBiT9vBICppW9zoG
         GO26nXoC8gAk6eluQvrqEobzFodw42TUVTJJtWDQQc5LO9qniu/VakvYGGMIpq3ppcWL
         Ersg==
X-Gm-Message-State: AOJu0YxvwiSujboJz99HR7NR4yD1QQPQp41cwMnp+DgGSo2w2lqxrCVN
	viGr37kqRBqr+hfNJ8/P2hI4uWHTwaHuF64R4sJjQPS0nI4deSWRKGyi684pR0ER+YUNwmmxMeL
	hsjMKsD+0/CwtZ3Lgl74GcgDk8oOp2C0=
X-Gm-Gg: ASbGncthNHJ86chMN3g0ZNgnArvu9HJSlMsrpCkZnRASUkRWgtv5NBv34rrt2AxCqMk
	paY2hBnG2Oo/GhqkoycZsOYQgOBrdxmbNJx1SGHZo3JjnoE5IAQUj0swWkk7/IY3NoAMoqsuBJB
	msZ0JsEohLppp7mPzksDYVn7O41EDW8777feCO/EJzteDLBzkPpJG/h8QN+PAJxXfdzof64Pqti
	nPPMpTzq98ojnkiX4epl7zVJztfrsPlifZUOXcM4eduZd28kMejyAnIXFXDclgQJvpYk1QT6qIU
	Ban3FmWRQGDDHacNMpzD1X/AYNix8M6IPWwCt4ymbibUjkDQBXpm+0mSVzCxx0sM5DoajeEqBgs
	W8s4=
X-Google-Smtp-Source: AGHT+IG1mNKISbMRvfAJoLLSBQC8ysbEh784bssAjiRdHfWku0QGdHlgo8y6POe5wndUyMzjpbkrmzpKhTTqyW/vKh4=
X-Received: by 2002:a05:690e:4e:b0:63c:f5a7:3d0 with SMTP id
 956f58d0204a3-63e161e09e2mr1160095d50.60.1760658332696; Thu, 16 Oct 2025
 16:45:32 -0700 (PDT)
MIME-Version: 1.0
References: <20251016204058.2551043-1-peter.marko@siemens.com>
In-Reply-To: <20251016204058.2551043-1-peter.marko@siemens.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 16 Oct 2025 16:45:06 -0700
X-Gm-Features: AS18NWB4ALGdSIPgJCJgYO9UAGAHrFldQ8SCqQFY1c2Hz6c5D0CoG-v8-zwwzWw
Message-ID: <CAMKF1sq=iaajFbjbsF8+5szYwR+hk6J50Rv6LSTRe6A9xohGkw@mail.gmail.com>
Subject: Re: [OE-core][PATCH] python3: upgrade 3.13.7 -> 3.13.9
To: peter.marko@siemens.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 23:45:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224985

On Thu, Oct 16, 2025 at 1:41=E2=80=AFPM Peter Marko via lists.openembedded.=
org
<peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
>
> From: Peter Marko <peter.marko@siemens.com>
>
> Drop upstreamed patch and refresh remaining patches.
>
> Release information:
> * https://www.python.org/downloads/release/python-3138/
> * 3.13.8 is the eighth maintenance release of 3.13, containing around
>   200 bugfixes, build improvements and documentation changes since
>   3.13.7.
>
> * https://www.python.org/downloads/release/python-3139/
> * This Python 3.13.9, a maintenance release for Python 3.13.
> * 3.13.9 is an expedited release containing a fix for one specific
>   regression in Python 3.13.8
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  ...r-OpenSSL-3.4-and-add-it-to-multissl.patch |  4 ++--
>  ...est_sysconfig-for-posix_user-purelib.patch |  2 +-
>  ...DEV-portion-of-test_makedev-when-lin.patch | 24 -------------------
>  ...le.py-correct-the-test-output-format.patch |  2 +-
>  .../{python3_3.13.7.bb =3D> python3_3.13.9.bb}  |  3 +--
>  5 files changed, 5 insertions(+), 30 deletions(-)
>  delete mode 100644 meta/recipes-devtools/python/python3/0001-gh-90548-Sk=
ip-NODEV-portion-of-test_makedev-when-lin.patch
>  rename meta/recipes-devtools/python/{python3_3.13.7.bb =3D> python3_3.13=
.9.bb} (99%)
>
> diff --git a/meta/recipes-devtools/python/python3/0001-Generate-data-for-=
OpenSSL-3.4-and-add-it-to-multissl.patch b/meta/recipes-devtools/python/pyt=
hon3/0001-Generate-data-for-OpenSSL-3.4-and-add-it-to-multissl.patch
> index 075737e7d1a..327124e4e3a 100644
> --- a/meta/recipes-devtools/python/python3/0001-Generate-data-for-OpenSSL=
-3.4-and-add-it-to-multissl.patch
> +++ b/meta/recipes-devtools/python/python3/0001-Generate-data-for-OpenSSL=
-3.4-and-add-it-to-multissl.patch
> @@ -1441,8 +1441,8 @@ index eae0e0c..fb06f63 100755
>  +++ b/Tools/ssl/multissltests.py
>  @@ -51,6 +51,7 @@ OPENSSL_RECENT_VERSIONS =3D [
>       "3.1.7",
> -     "3.2.3",
> -     "3.3.2",
> +     "3.2.6",
> +     "3.3.5",
>  +    "3.4.0",
>   ]
>
> diff --git a/meta/recipes-devtools/python/python3/0001-Update-test_syscon=
fig-for-posix_user-purelib.patch b/meta/recipes-devtools/python/python3/000=
1-Update-test_sysconfig-for-posix_user-purelib.patch
> index ab433d18367..adaca4ff779 100644
> --- a/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for=
-posix_user-purelib.patch
> +++ b/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for=
-posix_user-purelib.patch
> @@ -25,7 +25,7 @@ diff --git a/Lib/test/test_sysconfig.py b/Lib/test/test=
_sysconfig.py
>  index 1ade492..4e94889 100644
>  --- a/Lib/test/test_sysconfig.py
>  +++ b/Lib/test/test_sysconfig.py
> -@@ -423,7 +423,7 @@ class TestSysConfig(unittest.TestCase):
> +@@ -430,7 +430,7 @@ class TestSysConfig(unittest.TestCase):
>                   expected =3D os.path.normpath(global_path.replace(base,=
 user, 1))
>                   # bpo-44860: platlib of posix_user doesn't use sys.plat=
libdir,
>                   # whereas posix_prefix does.
> diff --git a/meta/recipes-devtools/python/python3/0001-gh-90548-Skip-NODE=
V-portion-of-test_makedev-when-lin.patch b/meta/recipes-devtools/python/pyt=
hon3/0001-gh-90548-Skip-NODEV-portion-of-test_makedev-when-lin.patch
> deleted file mode 100644
> index 4390e086d0f..00000000000
> --- a/meta/recipes-devtools/python/python3/0001-gh-90548-Skip-NODEV-porti=
on-of-test_makedev-when-lin.patch
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -From 2dc5e9f4c82888dbe21bd1eadb4b59b0efa9608c Mon Sep 17 00:00:00 2001
> -From: Zachary Ware <zach@python.org>
> -Date: Sat, 6 Sep 2025 13:20:12 -0500
> -Subject: [PATCH] gh-90548: Skip NODEV portion of test_makedev when linke=
d to musl
> -
> -Upstream-Status: Backport [https://github.com/python/cpython/pull/138593=
]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - Lib/test/test_posix.py | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/Lib/test/test_posix.py b/Lib/test/test_posix.py
> -index c9cbe15..bfc1e2b 100644
> ---- a/Lib/test/test_posix.py
> -+++ b/Lib/test/test_posix.py
> -@@ -757,7 +757,7 @@ class PosixTester(unittest.TestCase):
> -             self.assertRaises((ValueError, OverflowError), posix.makede=
v, x, minor)
> -             self.assertRaises((ValueError, OverflowError), posix.makede=
v, major, x)
> -
> --        if sys.platform =3D=3D 'linux':
> -+        if sys.platform =3D=3D 'linux' and not support.linked_to_musl()=
:
> -             NODEV =3D -1
> -             self.assertEqual(posix.major(NODEV), NODEV)
> -             self.assertEqual(posix.minor(NODEV), NODEV)
> diff --git a/meta/recipes-devtools/python/python3/0001-test_locale.py-cor=
rect-the-test-output-format.patch b/meta/recipes-devtools/python/python3/00=
01-test_locale.py-correct-the-test-output-format.patch
> index 3fc3a7e8ced..189246911b4 100644
> --- a/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-th=
e-test-output-format.patch
> +++ b/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-th=
e-test-output-format.patch
> @@ -34,7 +34,7 @@ diff --git a/Lib/test/test_locale.py b/Lib/test/test_lo=
cale.py
>  index da4bd79..fd9e67d 100644
>  --- a/Lib/test/test_locale.py
>  +++ b/Lib/test/test_locale.py
> -@@ -502,7 +502,7 @@ class TestRealLocales(unittest.TestCase):
> +@@ -501,7 +501,7 @@ class TestRealLocales(unittest.TestCase):
>               self.skipTest('test needs Turkish locale')
>           loc =3D locale.getlocale(locale.LC_CTYPE)
>           if verbose:
> diff --git a/meta/recipes-devtools/python/python3_3.13.7.bb b/meta/recipe=
s-devtools/python/python3_3.13.9.bb
> similarity index 99%
> rename from meta/recipes-devtools/python/python3_3.13.7.bb
> rename to meta/recipes-devtools/python/python3_3.13.9.bb
> index c682f1288ec..2e114a6c5bb 100644
> --- a/meta/recipes-devtools/python/python3_3.13.7.bb
> +++ b/meta/recipes-devtools/python/python3_3.13.9.bb
> @@ -30,13 +30,12 @@ SRC_URI =3D "http://www.python.org/ftp/python/${PV}/P=
ython-${PV}.tar.xz \
>             file://0001-test_active_children-skip-problematic-test.patch =
\
>             file://0001-test_readline-skip-limited-history-test.patch \
>             file://0001-Generate-data-for-OpenSSL-3.4-and-add-it-to-multi=
ssl.patch \
> -           file://0001-gh-90548-Skip-NODEV-portion-of-test_makedev-when-=
lin.patch \
>             "

I think this patch is a partial backport and It is still needed. You
can try running python3 ptests on musl/qemux86-64
target and see if they all pass.

>  SRC_URI:append:class-native =3D " \
>             file://0001-Lib-sysconfig.py-use-prefix-value-from-build-conf=
igu.patch \
>             "
>
> -SRC_URI[sha256sum] =3D "5462f9099dfd30e238def83c71d91897d8caa5ff6ebc7a50=
f14d4802cdaaa79a"
> +SRC_URI[sha256sum] =3D "ed5ef34cda36cfa2f3a340f07cac7e7814f91c7f3c411f6d=
3562323a866c5c66"
>
>  # exclude pre-releases for both python 2.x and 3.x
>  UPSTREAM_CHECK_REGEX =3D "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224981): https://lists.openembedded.org/g/openembedde=
d-core/message/224981
> Mute This Topic: https://lists.openembedded.org/mt/115796872/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

