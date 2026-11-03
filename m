Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10695.1793711281514080428
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 05:08:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=cMpmOSeC;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a208d93758so44282025e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 05:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793711280; x=1794316080; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=la5J2rgEArPBUmMA8GPDxu6Jopvywe4ydOLNu+kyAz4=;
        b=cMpmOSeCKI84kENicUPESe1FK9aL00+zxHGoXpj6X8F1kd+yCG5HG4Fwcq841nIwy6
         KJnOtDh0wH85zkLYYe6CiJueX1hlsXiS6Wx+XzhFbSQerFXa7JN8NrfuSENhROUXwDJA
         07cqI/HM3/CEf2dlUNnjo6y5zRf6fe2VsPkD5wNIZDsvhL7wulkY5DRf0sqgLfMZwOXU
         BDBSgdYhhWCU5pNXHZE2f/zBDKtEOM3Mzu9xhucEEBL6N6tUYZ920YNy51Gva/avAblb
         P7NVOMk7XC8wvHSPqOr9F7MoB2nnwyqV2UGE/mWoNieOooF+oypmTjOsmod+TfxOXU2k
         Osdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793711280; x=1794316080;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=la5J2rgEArPBUmMA8GPDxu6Jopvywe4ydOLNu+kyAz4=;
        b=M4+a12k5iqeM1iGjF9Ta37Z9k5sS3nsAdVVK8b1N+shdhhQd629jIJWEW9xPwQdhuI
         BaMU+1P/alAQ+nLP/5G+jSn0LbfmSRoxbyKN/uPYIrrgeJlWih6WQgviZ9UgygKuyPjY
         CbiDp9Ct3qk4GZUGx+3ZBXbObEpEHZIkR+jokuJv+UzMmvyJk9+l/8WxKENN4ZLBOnQ5
         OkcI9HTROpDMdU07nmE3c22hBIZUoKLRXOSEMQIyfszjk/lOuddnBR2rdhlee5sAL4PD
         Y2FwBxv1bIzg8C+OaXjYd3XaZxWg9w5G8Hfy537JIOu57rCaPDqP+oXrmP7RZA0QVnqk
         xlTA==
X-Forwarded-Encrypted: i=1; AKwUvBwo0toUrxCxurofNH/DhqNmpJRarJC4UJG5sK47mdomgzjs9h5sAW9DxYL4Z1pII1gciPuUZUwiwiYXYKf6Yy1PcQ==@lists.openembedded.org
X-Gm-Message-State: APuU4Z/+Bc20GZjkpFIhobgJXB7Vd4dWcf9+lAXFdq6K4NnLySp52Xlq
	an572uQ8b0PnLLIjE2poLVBCEIPScyc5hob8SsK5ySB+6XOPxQjdy7nrx6jKu0EIOQw=
X-Gm-Gg: AYBFou0QIo0OlT5YKGpsQ2gD/ZBahAFxbdwDHqz4sVKRFqGoJoEx1Sz9416SzX6ZmnJ
	CsvZBZwDHWLflrWS4ibmx7isg0enrwBxzrkhc5JkUDfoAvX/iSdZzD7SFwe6OyhLS7tgBCiTnEJ
	k8nOyBC4MiHDLyrE4gwlNVloWqFubOv/t7W6DNoODOk0/BHd3bDSr2exJUZxncDz15K2ykYqA4H
	9N9Yit9+Ahke/evW28HeaolapN4EXCKMaZXcytpRGKinVMfUYFhx2DPOrScmcTTYscVZ0V9AN8I
	LBk0jaVv1B9Tu3Vty1qEEoDf+8+jXF18d2kVjdgOh+/ZjRnzGfbX1zLIkO8fNbwINPdHb83uFSB
	WIzHsVUNpSH/rmc0DLs5HSXW1aoHjtExWiLxBLFz++ADNG60/racuYTW9yXA6ni6sOADcway1Gr
	TaDTJ8//FMF8sgotfQhmERl+b3fnXMJ0QBJG7VjTSl5BRd/Q8KuBYTute3dqYzW8xZygfE1WOns
	sHy3gzpV04Oom3btqbwlR2cUIDQDgSd/YCGeRGjjKnZ1ZGl9Ww2O0AZ2M3D0Zu1YzkXeRDSz0J3
	8NulCwsx8nCKmvYQssDqI2WgaN0jJ49wSDxlEwdFb4POZ5FPr08uzISjekGRkEOR5zaShbQKyvm
	42RFI4p4SdcO8Kw==
X-Received: by 2002:a05:600c:a4d:b0:4a3:12fb:1ee7 with SMTP id 5b1f17b1804b1-4ac18c7388dmr334112385e9.25.1793711279201;
        Tue, 03 Nov 2026 05:07:59 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2aae24b32sm54302155e9.12.2026.11.03.05.07.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 05:07:58 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Nov 2026 14:07:58 +0100
Message-Id: <DMLLKXHLFUFM.KG7HZ69C1QX6@smile.fr>
Subject: Re: [OE-core] [PATCH] python3: backport an upstream fix for the
 eager_task_factory Tests
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <ross.burton@arm.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261103120105.1473386-1-ross.burton@arm.com>
In-Reply-To: <20261103120105.1473386-1-ross.burton@arm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 13:08:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249278

On Tue Nov 3, 2026 at 1:01 PM CET, Ross Burton via openembedded-core wrote:
> Backport a fix from upstream to make these tests reliable, and drop the
> test skips.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  ...ake-test_staggered_race_with_eager_t.patch | 67 +++++++++++++++++++
>  .../python/python3_3.14.10.bb                 | 15 +----
>  2 files changed, 68 insertions(+), 14 deletions(-)
>  create mode 100644 meta/recipes-devtools/python/python3/0001-3.14-gh-158=
097-Make-test_staggered_race_with_eager_t.patch
>
> diff --git a/meta/recipes-devtools/python/python3/0001-3.14-gh-158097-Mak=
e-test_staggered_race_with_eager_t.patch b/meta/recipes-devtools/python/pyt=
hon3/0001-3.14-gh-158097-Make-test_staggered_race_with_eager_t.patch
> new file mode 100644
> index 00000000000..8c2dc554c88
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3/0001-3.14-gh-158097-Make-test_=
staggered_race_with_eager_t.patch
> @@ -0,0 +1,67 @@
> +From b6e398e6a1884a176e78f94f32112529888d5d45 Mon Sep 17 00:00:00 2001
> +From: "Miss Islington (bot)"
> + <31488909+miss-islington@users.noreply.github.com>
> +Date: Mon, 2 Nov 2026 15:46:37 -0800
> +Subject: [PATCH] [3.14] gh-158097: Make test_staggered_race_with_eager_t=
asks
> + deterministic (GH-158469) (#161224)
> +X-ARM-No-Footer: NoDisclaimer
> +
> +gh-158097: Make test_staggered_race_with_eager_tasks deterministic (GH-1=
58469)
> +
> +* gh-158097: Make test_staggered_race_with_eager_tasks deterministic
> +
> +staggered_race() awaits the coroutines it is given inline, so the
> +"await asyncio.sleep(0)" in the test's fail() helper suspended the
> +run_one_coro() task running it and left a scheduled resumption behind.
> +If the asyncio.sleep(1) winner (started 0.25s late by the stagger delay)
> +completes before that resumption runs, the winner's cancel() sets
> +_must_cancel and the resumption throws CancelledError into fail(), so
> +excs[2] reports a CancelledError instead of a ValueError.
> +
> +Pending timers are only moved onto the ready queue at the top of
> +BaseEventLoop._run_once() and are appended after the handles already
> +queued, so the t=3D0.50s stagger timer and the t=3D1.25s sleep(1) timer =
run
> +in due-time order.  When both are due in the same _run_once() - which is
> +what a busy CI machine causes - the stagger timer starts fail(), which
> +immediately suspends again, and the very next handle is the winner.
> +
> +Raise straight away instead, so the ValueError is stored in excs[2] in
> +the same step that starts the coroutine and there is no longer a
> +scheduled resumption for a cancellation to overtake.  The outcome no
> +longer depends on the event loop getting another iteration.
> +
> +* Update Lib/test/test_asyncio/test_eager_task_factory.py
> +
> +* Delete Misc/NEWS.d/next/Tests/2026-09-30-00-00-00.gh-issue-158097.pcB3=
mO.rst
> +
> +---------
> +(cherry picked from commit 3945eaf2fcd9cbc3f3061275bd29751c8b2e7d3b)
> +
> +Co-authored-by: Abhinav <alpha9coder@gmail.com>
> +Co-authored-by: abhinav-phi <abhinav-phi@users.noreply.github.com>
> +Co-authored-by: Andrew Svetlov <andrew.svetlov@gmail.com>
> +
> +Upstream-Status: Backport [b6e398e6a1884a176e78f94f32112529888d5d45]

Hi Ross,

Can you put a full URL in the Upstream-Status comment?
i.e. https://github.com/python/cpython/commit/b6e398e6a1884a176e78f94f32112=
529888d5d45

Thanks!

> +Signed-off-by: Ross Burton <ross.burton@arm.com>
> +---
> + Lib/test/test_asyncio/test_eager_task_factory.py | 4 +++-
> + 1 file changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/Lib/test/test_asyncio/test_eager_task_factory.py b/Lib/test=
/test_asyncio/test_eager_task_factory.py
> +index 0561b54a3f1..72bceb8c314 100644
> +--- a/Lib/test/test_asyncio/test_eager_task_factory.py
> ++++ b/Lib/test/test_asyncio/test_eager_task_factory.py
> +@@ -217,7 +217,9 @@ def test_staggered_race_with_eager_tasks(self):
> +         # See https://github.com/python/cpython/issues/124309
> +=20
> +         async def fail():
> +-            await asyncio.sleep(0)
> ++            # Raise without suspending: staggered_race() cancels unfini=
shed
> ++            # coroutines once another one wins, so yielding first could=
 turn
> ++            # this into a CancelledError when the event loop is busy.
> +             raise ValueError("no good")
> +=20
> +         async def blocked():
> +--=20
> +2.43.0
> +
> diff --git a/meta/recipes-devtools/python/python3_3.14.10.bb b/meta/recip=
es-devtools/python/python3_3.14.10.bb
> index c50c4d4babc..8f35801699d 100644
> --- a/meta/recipes-devtools/python/python3_3.14.10.bb
> +++ b/meta/recipes-devtools/python/python3_3.14.10.bb
> @@ -25,6 +25,7 @@ SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Pyt=
hon-${PV}.tar.xz \
>             file://0001-gh-146207-Add-support-for-OpenSSL-4.0.0.patch \
>             file://0002-gh-148292-Update-_ssl._SSLSocket-for-OpenSSL-4.pa=
tch \
>             file://0003-gh-148292-Remove-shutdown-test-in-test_ssl.test_g=
ot_eof.patch \
> +           file://0001-3.14-gh-158097-Make-test_staggered_race_with_eage=
r_t.patch \
>             "
>  SRC_URI:append:class-native =3D " \
>             file://0001-Lib-sysconfig.py-use-prefix-value-from-build-conf=
igu.patch \
> @@ -303,20 +304,6 @@ SKIPPED_TESTS +=3D " \
>      --ignore test.test_asyncio.test_taskgroups.TestTaskGroup.test_taskgr=
oup_23 \
>  "
> =20
> -# Intermittent failure under load - this asyncio staggered_race test sta=
rts
> -# candidate coroutines 0.25s apart and expects the third one to raise
> -# ValueError after an "await asyncio.sleep(0)". On loaded autobuilder ho=
sts
> -# under QEMU emulation the winning coroutine finishes and staggered_race
> -# cancels the losers before the third coroutine resumes to raise, so its
> -# recorded exception is CancelledError instead of ValueError. Upstream t=
est
> -# is timing-sensitive (CPython #124309). Skip both the pure-Python and
> -# C-accelerated eager task factory variants.
> -# Bugzilla YP 16435
> -SKIPPED_TESTS +=3D " \
> -    --ignore test.test_asyncio.test_eager_task_factory.PyEagerTaskFactor=
yLoopTests.test_staggered_race_with_eager_tasks \
> -    --ignore test.test_asyncio.test_eager_task_factory.CEagerTaskFactory=
LoopTests.test_staggered_race_with_eager_tasks \
> -"
> -
>  # Intermittent failure under load - this concurrent.futures ProcessPool =
test
>  # starts a worker and expects it to be stranded within a 30s thread-join
>  # timeout. On loaded autobuilder hosts under QEMU emulation (seen on


--=20
Yoann Congal
Smile ECS

