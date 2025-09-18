Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB4F0CAC59A
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 15:52:34 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web10.18243.1758210747553745996
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Sep 2025 08:52:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j+uRU/Cg;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-723ad237d1eso11290997b3.1
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 08:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758210747; x=1758815547; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nwXGpvS7CDd6OizqenOEFzcQGD3WSe/v/5uQLOpS57E=;
        b=j+uRU/Cg2h67Mb8sp/3YA+EnjHdgqWWxU6vhAduJEspbMz6i0PYRW4jra+aEG35B/C
         bKHDEiJuq2gKFAT0vOUDlJdZgANhqEDosUpvTk67in4ObSZ/IEMLZDrPUmDYnxQBKhnu
         LaQMvrKyo7b6oFiuzcvondlDtBy87kwZTkrLKuY+UYM8cvW50Vvkq+n6czAcwgz2grpD
         s/3P+6qO7x6L+FxPdvJFwG9BMtfZp8TF2TVnjXlAoDOx0r5wHn+5aMfeJua8kx7yG87g
         rfPUriNXi+TYJXgU6d3qP59nJ0/nfph8dYfJ/XLTC0MjTcqMtC4Atif0c7rwuietwIXe
         UKLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758210747; x=1758815547;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nwXGpvS7CDd6OizqenOEFzcQGD3WSe/v/5uQLOpS57E=;
        b=cT/M+OVDI39UnWCyu2QF4QdMQFPgU3v8rxzmk+nidDsMhEU4ngeDvRRqOLIp9jJH+M
         hbNTOyXvD0fkNC+mmYDzb+dwqIg8KiQwnzKExC3pkw7GhkJqtZuzLClwtj3xZqUjtMM6
         O5JxNwv/AmEH2C4+3n8J00msapcGDAsTFd2PNBFhDPizaomSwbV4OOQWDssEr/dNiPep
         ku71jsR9OsdverrLYjTZA5rf5GB3pIA6d6cYL9+vE3ydAuka/RPhYLu+T3iT48vuMkxG
         M0SV6XNQyiad0rXOp1P3dwjXGuDzuYX0mJwU0m45KmhvJq/TvW4g0/TQG97aL70lJA34
         XpSA==
X-Gm-Message-State: AOJu0YwQGXWB80CsShFNn5+NKTZr9NTLESlH5aFf3eoq7S2rHgmg5Es2
	JO2BcGlxsC7db9BZPOsZREolobSEcM5Hwn/LR1t7J91+rl5zcFcabr3Vhn4xNRwt7zuUuQV+HUI
	QCR+KkVMUIUErEg+0TLQhoJjeslylAnkV8qEZ
X-Gm-Gg: ASbGncuF24+33sdS5H9Fi5416C8CczM6ytfWKXiG5qDnqTFuFxz3yacvi3c+TQnfaUD
	IVgK1qzWKOQrn9abJDgRi8HPic6Ae1fiw7NwEKTI5cKnNxW3U/7t0FvzExQ/KhBWB6pEM4QLLLI
	bv5hjit4hzSNtrnmF38PfkhF3/wp/647fvKBf34yCiMo5NLiQjgQuaiKkUyADJkVKQAIeuXc54g
	l6ffD07sr6ETtJw1/qFdzTVgEbnMOi7hR6p7GT+ikAHybVghWy5c5dnPq4fHie+U0eM70Vn0GUL
	cJ4JB9ogwnMzpnsSXa8Ee/33zSO4WmuU42I4bQUeieGxzuJbHsHBwNLCZvYVBaTPfGQ/OTb0iYw
	8kw==
X-Google-Smtp-Source: AGHT+IEBuFSQCLUHPgIlyBPx2WEO4iydcnyzYWylZibn+dtmFPf2s7f2GeWG33AYsWhKNXYhijwLvW+zVCU6wy/fRAw=
X-Received: by 2002:a05:690c:39a:b0:730:4c94:be14 with SMTP id
 00721157ae682-738904c5d9dmr55022177b3.18.1758210746168; Thu, 18 Sep 2025
 08:52:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250918123350.3016822-1-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20250918123350.3016822-1-Deepesh.Varatharajan@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 18 Sep 2025 08:52:14 -0700
X-Gm-Features: AS18NWBw4cqWx4wCyvKsUhad2dQluLPY37c9sp0g37EVVS7uwue6LWuUX-hEXyY
Message-ID: <CAMKF1sq-SKjJtcbih_Rh=Ji4o0DotZAMr27ZuccEy1CPj1S9Ew@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glibc: stable 2.42 branch updates
To: deepesh.varatharajan@windriver.com
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
Content-Type: multipart/alternative; boundary="000000000000f73c46063f155659"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 15:52:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223647

--000000000000f73c46063f155659
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 18, 2025 at 5:34=E2=80=AFAM Varatharajan, Deepesh via
lists.openembedded.org <deepesh.varatharajan=3D
windriver.com@lists.openembedded.org> wrote:

> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
> git log --oneline
> d2097651cc57834dbfcaa102ddfacae0d86cfb66..e34453cd6a8c592c325756ff3c7ac0a=
fd3975cb4
>
> e34453cd6a (HEAD, origin/release/2.42/master) AArch64: Fix SVE powf
> routine [BZ #33299]
> e87844ec42 i386: Also add GLIBC_ABI_GNU2_TLS version [BZ #33129]
> 7a8f3c6ee4 x86-64: Add GLIBC_ABI_DT_X86_64_PLT [BZ #33212]
> 3970785beb x86-64: Add GLIBC_ABI_GNU2_TLS version [BZ #33129]
> d0f72b96f2 i386: Add GLIBC_ABI_GNU_TLS version [BZ #33221]
> 8dbaecbe92 Use TLS initial-exec model for __libc_tsd_CTYPE_* thread
> variables [BZ #33234]
> d7274d718e malloc: Fix checking for small negative values of tcache_key
> a96a82c4a5 malloc: Make sure tcache_key is odd enough
> c491dabd8a malloc: Fix MAX_TCACHE_SMALL_SIZE
> 8a726b6304 malloc: Remove redundant NULL check
> c5476b7907 hurd: support: Fix running SGID tests
> e5754399b5 Revert "tst-freopen4-main.c: Call support_capture_subprocess
> with chroot"
> c090b0cb1c tst-env-setuid: Delete LD_DEBUG_OUTPUT output
> 41a77b78cf tst-freopen4-main.c: Call support_capture_subprocess with chro=
ot
> 9ec7a532ff tst-fopen-threaded.c: Delete temporary file
> 9d5bf9c17d Delete temporary files in support_subprocess
> b38f3f60d5 nptl: Fix SYSCALL_CANCEL for return values larger than INT_MAX
> (BZ 33245)
> 5e298d2d93 elf: Handle ld.so with LOAD segment gaps in _dl_find_object
> (bug 31943)
> 2fadee5301 elf: Extract rtld_setup_phdr function from dl_main
> fd18059c0f stdlib: resolve a double lock init issue after fork [BZ #32994=
]
> bc13db7393 inet-fortified: fix namespace violation (bug 33227)
> 3ec4dd77f6 NEWS: add new section
> bdea6c3719 Replace advisories directory with pointer file
>
> Testing Results:
>            Before     After   Diff
> PASS         5842      5855     +13
> XPASS        4         4         0
> FAIL         868       859      -9
> XFAIL        16        16        0
> UNSUPPORTED  396       396       0
>
> Testcases changes
>
> testcase-name                              before           after
>
> elf/check-dt-x86-64-plt(new)                 -               PASS
> elf/check-gnu2-tls(new)                      -               PASS
> elf/tst-link-map-contiguous-ldso(new)        -               PASS
> elf/tst-link-map-contiguous-libc(new)        -               PASS
> malloc/tst-malloc_info-malloc-hugetlb1      FAIL             PASS
> nptl/tst-thread-affinity-pthread            FAIL             PASS
> resolv/tst-resolv-aliases                   FAIL             PASS
> stdio-common/tst-printf-format-d-llong      FAIL             PASS
> stdio-common/tst-printf-format-sn-ushort    FAIL             PASS
> stdio-common/tst-printf-format-vs-char      FAIL             PASS
> stdio-common/tst-printf-format-vd-ullong    FAIL             PASS
> string/test-strcmp                          FAIL             PASS
> string/tst-cmp                              FAIL             PASS
>

Lgtm


> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---
>  meta/recipes-core/glibc/glibc-version.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/glibc/glibc-version.inc
> b/meta/recipes-core/glibc/glibc-version.inc
> index 3a89e153bd..a3ce970c29 100644
> --- a/meta/recipes-core/glibc/glibc-version.inc
> +++ b/meta/recipes-core/glibc/glibc-version.inc
> @@ -1,6 +1,6 @@
>  SRCBRANCH ?=3D "release/2.42/master"
>  PV =3D "2.42+git"
> -SRCREV_glibc ?=3D "d2097651cc57834dbfcaa102ddfacae0d86cfb66"
> +SRCREV_glibc ?=3D "e34453cd6a8c592c325756ff3c7ac0afd3975cb4"
>  SRCREV_localedef ?=3D "cba02c503d7c853a38ccfb83c57e343ca5ecd7e5"
>
>  GLIBC_GIT_URI ?=3D "git://sourceware.org/git/glibc.git;protocol=3Dhttps"
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#223637):
> https://lists.openembedded.org/g/openembedded-core/message/223637
> Mute This Topic: https://lists.openembedded.org/mt/115308967/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000f73c46063f155659
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 18, 2025 at 5:34=E2=80=AFAM=
 Varatharajan, Deepesh via <a href=3D"http://lists.openembedded.org">lists.=
openembedded.org</a> &lt;deepesh.varatharajan=3D<a href=3D"mailto:windriver=
.com@lists.openembedded.org">windriver.com@lists.openembedded.org</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">From: Deepesh Varatharajan &l=
t;<a href=3D"mailto:Deepesh.Varatharajan@windriver.com" target=3D"_blank">D=
eepesh.Varatharajan@windriver.com</a>&gt;<br>
<br>
git log --oneline d2097651cc57834dbfcaa102ddfacae0d86cfb66..e34453cd6a8c592=
c325756ff3c7ac0afd3975cb4<br>
<br>
e34453cd6a (HEAD, origin/release/2.42/master) AArch64: Fix SVE powf routine=
 [BZ #33299]<br>
e87844ec42 i386: Also add GLIBC_ABI_GNU2_TLS version [BZ #33129]<br>
7a8f3c6ee4 x86-64: Add GLIBC_ABI_DT_X86_64_PLT [BZ #33212]<br>
3970785beb x86-64: Add GLIBC_ABI_GNU2_TLS version [BZ #33129]<br>
d0f72b96f2 i386: Add GLIBC_ABI_GNU_TLS version [BZ #33221]<br>
8dbaecbe92 Use TLS initial-exec model for __libc_tsd_CTYPE_* thread variabl=
es [BZ #33234]<br>
d7274d718e malloc: Fix checking for small negative values of tcache_key<br>
a96a82c4a5 malloc: Make sure tcache_key is odd enough<br>
c491dabd8a malloc: Fix MAX_TCACHE_SMALL_SIZE<br>
8a726b6304 malloc: Remove redundant NULL check<br>
c5476b7907 hurd: support: Fix running SGID tests<br>
e5754399b5 Revert &quot;tst-freopen4-main.c: Call support_capture_subproces=
s with chroot&quot;<br>
c090b0cb1c tst-env-setuid: Delete LD_DEBUG_OUTPUT output<br>
41a77b78cf tst-freopen4-main.c: Call support_capture_subprocess with chroot=
<br>
9ec7a532ff tst-fopen-threaded.c: Delete temporary file<br>
9d5bf9c17d Delete temporary files in support_subprocess<br>
b38f3f60d5 nptl: Fix SYSCALL_CANCEL for return values larger than INT_MAX (=
BZ 33245)<br>
5e298d2d93 elf: Handle ld.so with LOAD segment gaps in _dl_find_object (bug=
 31943)<br>
2fadee5301 elf: Extract rtld_setup_phdr function from dl_main<br>
fd18059c0f stdlib: resolve a double lock init issue after fork [BZ #32994]<=
br>
bc13db7393 inet-fortified: fix namespace violation (bug 33227)<br>
3ec4dd77f6 NEWS: add new section<br>
bdea6c3719 Replace advisories directory with pointer file<br>
<br>
Testing Results:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Before=C2=A0 =C2=A0 =C2=A0After=C2=
=A0 =C2=A0Diff<br>
PASS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A05842=C2=A0 =C2=A0 =C2=A0 5855=C2=A0 =
=C2=A0 =C2=A0+13<br>
XPASS=C2=A0 =C2=A0 =C2=A0 =C2=A0 4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A04=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A00<br>
FAIL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0868=C2=A0 =C2=A0 =C2=A0 =C2=A0859=C2=
=A0 =C2=A0 =C2=A0 -9<br>
XFAIL=C2=A0 =C2=A0 =C2=A0 =C2=A0 16=C2=A0 =C2=A0 =C2=A0 =C2=A0 16=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0<br>
UNSUPPORTED=C2=A0 396=C2=A0 =C2=A0 =C2=A0 =C2=A0396=C2=A0 =C2=A0 =C2=A0 =C2=
=A00<br>
<br>
Testcases changes<br>
<br>
testcase-name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 before=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0after<br>
<br>
elf/check-dt-x86-64-plt(new)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PA=
SS<br>
elf/check-gnu2-tls(new)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0PASS<br>
elf/tst-link-map-contiguous-ldso(new)=C2=A0 =C2=A0 =C2=A0 =C2=A0 -=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PASS<br>
elf/tst-link-map-contiguous-libc(new)=C2=A0 =C2=A0 =C2=A0 =C2=A0 -=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PASS<br>
malloc/tst-malloc_info-malloc-hugetlb1=C2=A0 =C2=A0 =C2=A0 FAIL=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PASS<br>
nptl/tst-thread-affinity-pthread=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 F=
AIL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PASS<br>
resolv/tst-resolv-aliases=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0FAIL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PAS=
S<br>
stdio-common/tst-printf-format-d-llong=C2=A0 =C2=A0 =C2=A0 FAIL=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PASS<br>
stdio-common/tst-printf-format-sn-ushort=C2=A0 =C2=A0 FAIL=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PASS<br>
stdio-common/tst-printf-format-vs-char=C2=A0 =C2=A0 =C2=A0 FAIL=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PASS<br>
stdio-common/tst-printf-format-vd-ullong=C2=A0 =C2=A0 FAIL=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PASS<br>
string/test-strcmp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 FAIL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0PASS<br>
string/tst-cmp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 FAIL=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0PASS<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Lgtm</div><div d=
ir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
Signed-off-by: Deepesh Varatharajan &lt;<a href=3D"mailto:Deepesh.Varathara=
jan@windriver.com" target=3D"_blank">Deepesh.Varatharajan@windriver.com</a>=
&gt;<br>
---<br>
=C2=A0meta/recipes-core/glibc/glibc-version.inc | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/=
glibc/glibc-version.inc<br>
index 3a89e153bd..a3ce970c29 100644<br>
--- a/meta/recipes-core/glibc/glibc-version.inc<br>
+++ b/meta/recipes-core/glibc/glibc-version.inc<br>
@@ -1,6 +1,6 @@<br>
=C2=A0SRCBRANCH ?=3D &quot;release/2.42/master&quot;<br>
=C2=A0PV =3D &quot;2.42+git&quot;<br>
-SRCREV_glibc ?=3D &quot;d2097651cc57834dbfcaa102ddfacae0d86cfb66&quot;<br>
+SRCREV_glibc ?=3D &quot;e34453cd6a8c592c325756ff3c7ac0afd3975cb4&quot;<br>
=C2=A0SRCREV_localedef ?=3D &quot;cba02c503d7c853a38ccfb83c57e343ca5ecd7e5&=
quot;<br>
<br>
=C2=A0GLIBC_GIT_URI ?=3D &quot;git://<a href=3D"http://sourceware.org/git/g=
libc.git;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">sourceware.=
org/git/glibc.git;protocol=3Dhttps</a>&quot;<br>
-- <br>
2.49.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#223637): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/223637" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/223637</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/115308967/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/115308967/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000f73c46063f155659--

