Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4200.1793313359241789042
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 15:35:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=dvtfBoaH;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so952835e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 15:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793313357; x=1793918157; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/UPX0KcoCFyV4v8/biWMxRE3FnGleqvatVPRe/cMW18=;
        b=dvtfBoaHB3R9gRhx7/efW6MNbVl25E8HpKVxokzx5E0VJSdkS3hFU7DeYz9TLfz39b
         QwqRu9Z8Ce1+MCvkAEdDrBsy2XLklJ7j6vW0Rgzk8Az522tlGfFC5f+Jj4230c76aH8E
         kF8Bxol9gbEROIxPt6raCGuEY2cQHhdLEzutBDqIOyMtF6oQjwQg9BiKY6kcX0FxXuES
         u9ddQCBV8zfzRCvXRhvF9W/VvHCKWVhT3/5VmRFLJ+xN22Egz8+VnB6KZ8sOUosu020q
         whAOAHybS6SwQ9OfUbloaPg+8PWY5wWM0NQZpjccPQJJH/uqoMRvu6JdWR2fGuCTnRaB
         4OAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793313357; x=1793918157;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/UPX0KcoCFyV4v8/biWMxRE3FnGleqvatVPRe/cMW18=;
        b=sdFbuvIU0qDwrlNmSw6iaBSgekAN+RmtAMX/4qtTilx9A7VGFLkO1mQ/GZha7mtMng
         DE5W/nR5OcCV2cNsmwpamPXO8nHMY277rPm7BRzcLbeR6j2JMpuiUPleW5O/IB20dznK
         2COv3u4I9VajSnft+zednrSUNRTHkbEidp4cyowpdlNY29LVfF6lQ4xWBF8r3cJ0FwUR
         u7RqPdnaFVoIj1EsuFlYkXixK6vSL1DKDpZV0amjyhDTYb6X4hhgW0XafF96NmxCPs7h
         QMZu3elvqzSXcXu5h/f/wukJDZLIqXAlYGOzp2VjPBrBPwyGt3qwS+jP5wO+xznRFD84
         ONzQ==
X-Forwarded-Encrypted: i=1; AKwUvBwN0GxYXP6CdAJmXzZHTP+PNbyL/nW4sj8K6B4KvENB9IBywyibFuZ+WwRHV8sftkRAXI03f4zqUhUbA/5cF2lM+Q==@lists.openembedded.org
X-Gm-Message-State: AFq9FYLR4ub7uBibG7+i8UAx1AGff/8LFAINWindQAKGbYX31moAzCN1
	H9AbTaN+01JTKzVtv9/N4vyLERQc/qWFiiCMZW3FpyUYHCwR6OircLgc0sMCDKvs32Q=
X-Gm-Gg: AYBFou18UeCwK1okH3vOochI6Xk//v0ajAV76Kf11+ct4B8GRUsycbobBTd3hnl46mf
	pW8w2Ctp7OO4ofdLkshnWc55WjwiVvde9qiVwk3eCjPk/LV3l9WcAQmCP7AHBwsEGNOH9dEzfTm
	MdJum97F64xrO6WfJUKUxpjNaBycNl1omp6OSesurkGfSaFLiUl0RDx5KTrrn4pZP9GlsDB8HGu
	y9vifiTcG2IhI9HbxZiFl2IxWYNBUR/VbKOBmiFPyQoIqx8vpn0AGJJ2NRP/kJCb+4tMZIwN7CK
	Z0c0PKaULkxi0Q3WqvV3oGi5W/QeBiMw1r7Uh2GwNk8hL4aQooHkb1E6C8qS4uUztHcc+qLCk0a
	PytrQW+tDm1KAxdku0DBDwRcXPVsJW0ibq0DbLMVDj9SOfJq8OG+VHLN4ZQUx8rRm5WDTPI68Cv
	ln0A5LB6lvAnqNwMrOO9gbyws7/5iRRHPWh1hQpgIyNQS1Y1jNGf02py/ywLk+sFrb+8W7ANrz5
	HqKn4VWmg6Co1zqW12CB7RprE5ipR/i5wsacpKlC8fUH5qYKJ2+nY+i7zdQukf5ggS7j8lP/pHN
	3AYkpSKsz8vsTa+jII3GaCLk8Ql1KjxA6qUPU6ad8nUMxNp4fS1IgF87a8y4bm4iehEKxCUybl+
	T91F4OptMq/XixZ6acA==
X-Received: by 2002:a05:600c:8b01:b0:49f:c5aa:9ef4 with SMTP id 5b1f17b1804b1-4ac16fa4f73mr8117125e9.8.1793313357365;
        Thu, 29 Oct 2026 15:35:57 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa80f047bfsm94108865e9.3.2026.10.29.15.35.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 15:35:56 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Oct 2026 23:35:56 +0100
Message-Id: <DMHOJ2U8B05L.2PK3LJR0UBRLG@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH 15/15] glibc: stable 2.39 branch
 updates to b7a0de2c8f
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <peter.marko@siemens.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261022224711.3783258-1-peter.marko@siemens.com>
 <20261022224711.3783258-15-peter.marko@siemens.com>
In-Reply-To: <20261022224711.3783258-15-peter.marko@siemens.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 22:36:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248976

On Fri Oct 23, 2026 at 12:47 AM CEST, Peter Marko via lists.openembedded.or=
g wrote:
> From: Peter Marko <peter.marko@siemens.com>
>
> Update SRCREV to pull the latest fixes from the upstream
> release/2.44/master branch. This branch does not seem to receive
> security fixes anymore, but still got two new commits during last
> months.
>
> Commits between the old SRCREV (be1e627cd7) and the new SRCREV (b7a0de2c8=
f):
>
> b7a0de2c8f powerpc: Fix off-by-one in AT_HWCAP4 loop in _dl_procinfo
> d9eaad3515 rtld: cache cpuid results on the stack for intel
>
> Testing Results:
> (note that the comparison is done against yocto-20.0.21, so includes
                                                  ^ 5.0.21 I guess?
I will fix this is my branch.

> testing of last 14 CVE patches)
>
> +--------------+--------+--------+------+
> | Result       | Before | After  | Diff |
> +--------------+--------+--------+------+
> | PASS         | 4933   | 4941   | +8   |
> | FAIL         | 221    | 223    | +2   |
> | XFAIL        | 16     | 16     |  0   |
> | XPASS        | 4      | 4      |  0   |
> | UNSUPPORTED  | 227    | 227    |  0   |
> +--------------+--------+--------+------+
>
> Changes in testcases:                   Before  After  Source
> (no change in already existing tests, flaky test filtered by 3 runs)
> elf/tst-dl-path-normalize                ---    PASS   CVE-2026-86805/CVE=
-2026-95818
> elf/tst-tunables-enable_secure           ---    PASS   CVE-2026-86805/CVE=
-2026-95818 test harness
> iconvdata/tst-jisx0213-progress          ---    PASS   CVE-2026-77117/CVE=
-2026-80489
> libio/bug-wgenops-bz33998.test-result    ---    PASS   CVE-2026-5928
> libio/tst-fopen-ccs-empty                ---    PASS   CVE-2026-18374
> posix/tst-wordexp-append                 ---    PASS   CVE-2026-6368
> stdio-common/tst-vfscanf-bz34008         ---    PASS   CVE-2026-5450
> stdlib/tst-strfmon-bug34510              ---    PASS   CVE-2026-19499
> elf/tst-origin-secure                    ---    FAIL   CVE-2026-86805/CVE=
-2026-95818
> posix/tst-wordexp-tilde                  ---    FAIL   CVE-2026-6791
>
> The two new tests which do not pass when running glibc-testsuite will
> pass under following conditions:
> * FAIL -> UNSUPPORTED: removing patch 0022 fixes these tests
>   this fixes 41 FAIL -> 6 PASS + 35 UNSUPPORTED and can be sent as
>   separate patch if requested
>   see OE-Core rev: 5eb80f3c562f6e395562c52df67fab60ae0ff32b
> * UNSUPPORTED -> PASS: running natively
>   qemu-user doesn't support the call test-container makes to create its
>   isolated environment (unshare(CLONE_NEWUSER))
>   running natively is possible when target arch equals to host arch
Thanks for this explanation. I'm not sure it's worth fixing for
scarthgap now so I won't ask for the backport but I appreciate the
offer.

> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta/recipes-core/glibc/glibc-version.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-cor=
e/glibc/glibc-version.inc
> index 5d57dafed0a..1f4f372c13b 100644
> --- a/meta/recipes-core/glibc/glibc-version.inc
> +++ b/meta/recipes-core/glibc/glibc-version.inc
> @@ -1,6 +1,6 @@
>  SRCBRANCH ?=3D "release/2.39/master"
>  PV =3D "2.39+git"
> -SRCREV_glibc ?=3D "be1e627cd72db31161a3b4ce1c8114674f0895eb"
> +SRCREV_glibc ?=3D "b7a0de2c8f68722cfdfc735b8358a3a6559ec0eb"
>  SRCREV_localedef ?=3D "cba02c503d7c853a38ccfb83c57e343ca5ecd7e5"
> =20
>  GLIBC_GIT_URI ?=3D "git://sourceware.org/git/glibc.git;protocol=3Dhttps"

Thanks!
--=20
Yoann Congal
Smile ECS

