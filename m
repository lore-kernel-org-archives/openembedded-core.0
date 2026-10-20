Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10137.1792460559257972682
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 18:42:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kfanOVu2;
 spf=pass (domain: gmail.com, ip: 74.125.224.47, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-6798eb0d190so2021016d50.3
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 18:42:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792460558; cv=none;
        d=google.com; s=arc-20260327;
        b=ql99oQtA01XUnmrluyjFI3VzAE/6x5xfbJVTS3H/uHqDWVcYZt5sKAnnSQOzf/uiS8
         V+jA6KIuDWT1xcL7EPB55RbwEZFvs1liBsqOhfXgKrR8JxsODeC04I6Jm5Ti564Hsnek
         L1c/uVoM2JE/Kair2ZtgkuuJHRIjgXhnpp2ZgpTe0KxJfMPuWSjrq2b+5wDtRP0trusO
         lm6K1uQdCI77RcHOdhcTGkCjuaslMD0rD4FP1pLuPvRTGXWoSvQnjQKCXaS00kMW+0NO
         GUB+EHzxAQ9GpHabOKMjKk3ILx8EF9vtTE9RTtzLbyLEKOHYH3Uzl9OELDwpH+1Tqp3I
         HreA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fSOtZrWFAfwA1UGTYMIfO5uQbYh8UT/m9YNPRpr1bns=;
        fh=qogVUck8YBqbWIsVXO7Zd4f2y0reKM2i6C2O67MrmhU=;
        b=SpMdfxhGSMWaT+Yu/MRUGcNyG3aCvMvjNTeu1NAecGcAZG46YFDvOQth1xvzf64IO8
         sw7bAn48BAyHe2uEZlZvurTBiL1gobxRMqfR4Sn8KTrdSPEWhMFo9/GO7n6klHMyzFUd
         Xd53L01yTO2Ej9fWfX4djJjqJRRDd7OxLpCu8x13XnKfK2dPHb+42IGgxlIrGK2PiPPC
         UxCyy/u6MrLLWq7378N24qG7mHIk4TDRYodFDSOzc5mNxnOXemo0wjFFyxpBb+kbAjN8
         IKmZm2gV5WaPINyTNyrhp227WEZN7GBh6pzUjYETwAuDgMgCgE+9Oyy9G4SLfrsg129H
         qcrg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792460558; x=1793065358; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fSOtZrWFAfwA1UGTYMIfO5uQbYh8UT/m9YNPRpr1bns=;
        b=kfanOVu2oWhqMR+miwUBXb1jTYgwOvk5AhLdPGDeUzF1jrJIQLg2ywyAqgg3LGn7G8
         Y2BMrdQsUcdwlpfI7km9cJLwc503fgGS5pUuoqf5c7m28Ft1JHvkEy0fFVxVvvnu4wos
         IR1sWwfTdogGkpRyUTgYXiTwjqs3zbfNJvZlivNZQ1b/adj086QiT/AcuCbSt0lbP6gJ
         RkSiOC+W53DC0WDJRPsAGgbnOSgqjTE+6CufDMw5iPGBnR1XxwPriIyPcuisNMjCZr9g
         xwg3UKbHMyCh4vIDBQMxt03p6LLXaVTfjaP03JhD15Apzs+AcszCBQ00qf9qaH/XKXa/
         kJLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792460558; x=1793065358;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fSOtZrWFAfwA1UGTYMIfO5uQbYh8UT/m9YNPRpr1bns=;
        b=jofDGoUZOsiyhVMvnXPG8cArOS/ctGHHUltZ83G9Cxn/0x5CW//U3pxW3f5Yr21nFN
         SWujuAo6K575iEDRMfK+dJ0vouRyhf+7gtA1ubluBr2hu4Sz9Nj2QfcyQzuYnxhh8eiU
         IB2kJjNTWNdGTuDwcr/nTWpJ5xzHSh7pzme/53n4FDAfFgx+pbKEymdsGlrrTsN75Tbw
         z7kVSb8cxGCb7BbfQaVBFob0uwXoOqV9+NJdcEjVQ/t9KlqBijc2ZipP5zdHf+WLwHjl
         lHt9iV+aG0bcRn6R6XX9s47SCTcUs9Vm8ELSW3Dzy1m6gxcpvsBU18mAYK0FdWQH300T
         XHUQ==
X-Gm-Message-State: AFq9FYKLw3R1/bK64ceoFFBdQ+n7u8yrT+rbUtK6ZWncpewpAGj0RO7t
	ryk17EdcHmAUVqexFM5fp9a8bmDHLjYjJpnvDKGHQ/ETy8WzpLv8go9rSzbN2u/nFVYsGL01vX+
	1IEEe5RcXpf6krY8ZlwVS7LQoh5jd1Ys=
X-Gm-Gg: AYBFou2f7eh7UZFkXWjCzw4UU1mRyTl7NaMppsCdubAzB7PAAfqAeeRvh5NMV6zetXy
	FbXv1nfS04JjcLSSPSSVPFPbe3rXk1bQ3LPCyu41mxegA7oi7eb6kEHqmd7NDbZxa0hL3LXdjee
	Xup45y4Bpokk/wDa4zZxFbgFOtLBMPubQ0ua5ITpmmAIpbNpjN4y/JNfQjCOAyhBm8GBhfultG6
	Jh3TdST+TLhN2ilAdfnbnZo+1o0NHCer76Ct63MgkFJJUd5QHfbKk59SKnbIDIStvFuZTc4pV1j
	IKZHYi60rar8Fgrqk7GpMeJCfH6wFvqzFwkHnwouLb9V3spdlkwMdRY8aHvGkBXSTcwI3i41Gdj
	L3gnRcsN7CrPTF24P7p1AoyuiYVcgPe7XrbTQlWuOrVDxd3QWf94r9MzGdAoUzfNS9q9RN2zo6o
	E84kw9d3cv6Z+q0vC1AOny1i9D/Iprvp9XAdo0IGwxx/r8EW1czezDFTgSnlrQ2IUZVg6jBXT3p
	SXUfRLUFOUWCZ0/omYVBpOZgZ2GW2vQbg0EoixcQ/Rr1oXaFawwzQGITDJ5d19HGWQ93gywVBPN
	K6B1vkamcPd4FbbqO5iSylayEaEqLaMVD4KhSOUHXkH0NtAmrQ==
X-Received: by 2002:a05:690c:6d93:b0:8ab:4a67:71b9 with SMTP id
 00721157ae682-8b0f21719f9mr37325207b3.29.1792460558178; Mon, 19 Oct 2026
 18:42:38 -0700 (PDT)
MIME-Version: 1.0
References: <20261019112517.1676091-1-martin.jansa@gmail.com>
In-Reply-To: <20261019112517.1676091-1-martin.jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 19 Oct 2026 18:42:11 -0700
X-Gm-Features: AclHuK-LH3Qu13xj5belssQO8PsRGdFiDSbN8vy9aM4h9U8MLKhVasi7Iz9FH-w
Message-ID: <CAMKF1spvKRgTtCqFwmcvRYQZgTLBt0XAcx7Dce2cznx9iAP6QQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] clang: use Release instead of MinSizeRel
To: martin.jansa@gmail.com
Cc: openembedded-core@lists.openembedded.org, ross.burton@arm.com, 
	mark.yang@lge.com
Content-Type: multipart/alternative; boundary="000000000000d81d03065e3bbed8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 01:42:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248210

--000000000000d81d03065e3bbed8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 4:25=E2=80=AFAM Martin Jansa via lists.openembedded=
.org
<martin.jansa=3Dgmail.com@lists.openembedded.org> wrote:

> From: Martin Jansa <martin.jansa@gmail.com>
>
> It was changed in:
>
> https://git.openembedded.org/openembedded-core/commit/?id=3Dea9b33f7c12f7=
73830ec860ae817a3ed1368612b
> to save the disk space, but the build time impact is significant.
>
> Both llvm and clang recipes are now using MinSizeRel, but the build time
> impact is significant mostly from clang recipes and also the disk space
> is affected more by llvm, than clang. So change the default only for
> clang recipe. In theory we could use Release only for clang-native and
> leave MinSizeRel for target clang (assuming that most people don't do
> many demanding builds on target, but that won't be true for something
> like build appliance built with OE).
>
> chromium-x11.do_compile time with 64 thread AMD Threadripper 3970x
> increased by 80% from 6930s to 12300s, measured in wrynose release.
>
> With current master chromium-x11.do_compile time is also around 80%
> slower compared to both using Release or 66.6% slower compared to
> clang using Release:
>
> MinSizeRel in both clang and llvm:
> 20.09user 2.56system 3:05:09elapsed 0%CPU (0avgtext+0avgdata
> 58500maxresident)k
>
> MinSizeRel in llvm, Release in clang:
> 18.82user 2.61system 1:51:40elapsed 0%CPU (0avgtext+0avgdata
> 58776maxresident)k
>
> Release in both clang and llvm:
> 18.83user 2.59system 1:45:32elapsed 0%CPU (0avgtext+0avgdata
> 59424maxresident)k
>
> sstate-cache size after building core-image-sato with
> PREFERRED_TOOLCHAIN_TARGET =3D "clang"
> and target clang included as well as chromium-x11 in the image:
>
> increased by less than 2% (137MB):
> 8988    sstate-cache-MinSizeRel-both
> 9125    sstate-cache-Release-both
>
> populate_sysroot:
> llvm:         14M: 175M -> 189M
> llvm-native:  29M:  98M -> 127M
> clang:         4M:  82M ->  86M
> clang-native: 30M: 102M -> 132M
>
> llvm package: 26M: 314M -> 340M
> llvm ipk:     27M: 353M -> 380M
>
> clang package: 3M:  89M ->  92M
> clang ipk:     4M: 100M -> 104M
>
> ipk package sizes:
> 7.0M
> tmp-MinSizeRel/deploy/ipk/x86-64-v3/llvm-bin_23.1.3-r0.3_x86-64-v3.ipk
> 87M
>  tmp-MinSizeRel/deploy/ipk/x86-64-v3/llvm-dbg_23.1.3-r0.3_x86-64-v3.ipk
> 6.5M
> tmp-MinSizeRel/deploy/ipk/x86-64-v3/llvm-dev_23.1.3-r0.3_x86-64-v3.ipk
> 66M
>  tmp-MinSizeRel/deploy/ipk/x86-64-v3/llvm-src_23.1.3-r0.3_x86-64-v3.ipk
> 153M
> tmp-MinSizeRel/deploy/ipk/x86-64-v3/llvm-staticdev_23.1.3-r0.3_x86-64-v3.=
ipk
> 35M     tmp-MinSizeRel/deploy/ipk/x86-64-v3/llvm_23.1.3-r0.3_x86-64-v3.ip=
k
>
> 8.3M    tmp-Release/deploy/ipk/x86-64-v3/llvm-bin_23.1.3-r0.2_x86-64-v3.i=
pk
> 98M     tmp-Release/deploy/ipk/x86-64-v3/llvm-dbg_23.1.3-r0.2_x86-64-v3.i=
pk
> 6.5M    tmp-Release/deploy/ipk/x86-64-v3/llvm-dev_23.1.3-r0.2_x86-64-v3.i=
pk
> 66M     tmp-Release/deploy/ipk/x86-64-v3/llvm-src_23.1.3-r0.2_x86-64-v3.i=
pk
> 164M
> tmp-Release/deploy/ipk/x86-64-v3/llvm-staticdev_23.1.3-r0.2_x86-64-v3.ipk
> 41M     tmp-Release/deploy/ipk/x86-64-v3/llvm_23.1.3-r0.2_x86-64-v3.ipk
>
> 8.8M
> tmp-MinSizeRel/deploy/ipk/x86-64-v3/clang-dbg_23.1.3-r0.3_x86-64-v3.ipk
> 4.3M
> tmp-MinSizeRel/deploy/ipk/x86-64-v3/clang-dev_23.1.3-r0.3_x86-64-v3.ipk
> 20K
>  tmp-MinSizeRel/deploy/ipk/x86-64-v3/clang-doc_23.1.3-r0.3_x86-64-v3.ipk
> 48K
>  tmp-MinSizeRel/deploy/ipk/x86-64-v3/clang-format_23.1.3-r0.3_x86-64-v3.i=
pk
> 40K
>  tmp-MinSizeRel/deploy/ipk/x86-64-v3/clang-libclang-python_23.1.3-r0.3_x8=
6-64-v3.ipk
> 48M
>  tmp-MinSizeRel/deploy/ipk/x86-64-v3/clang-staticdev_23.1.3-r0.3_x86-64-v=
3.ipk
> 2.9M
> tmp-MinSizeRel/deploy/ipk/x86-64-v3/clang-tidy_23.1.3-r0.3_x86-64-v3.ipk
> 1.3M
> tmp-MinSizeRel/deploy/ipk/x86-64-v3/clang-tools_23.1.3-r0.3_x86-64-v3.ipk
> 6.1M    tmp-MinSizeRel/deploy/ipk/x86-64-v3/clang_23.1.3-r0.3_x86-64-v3.i=
pk
> 18M
>  tmp-MinSizeRel/deploy/ipk/x86-64-v3/libclang-cpp23.1_23.1.3-r0.3_x86-64-=
v3.ipk
> 11M
>  tmp-MinSizeRel/deploy/ipk/x86-64-v3/libclang23.1_23.1.3-r0.3_x86-64-v3.i=
pk
>
> 7.8M
> tmp-Release/deploy/ipk/x86-64-v3/clang-dbg_23.1.3-r0.4_x86-64-v3.ipk
> 4.3M
> tmp-Release/deploy/ipk/x86-64-v3/clang-dev_23.1.3-r0.4_x86-64-v3.ipk
> 20K
>  tmp-Release/deploy/ipk/x86-64-v3/clang-doc_23.1.3-r0.4_x86-64-v3.ipk
> 52K
>  tmp-Release/deploy/ipk/x86-64-v3/clang-format_23.1.3-r0.4_x86-64-v3.ipk
> 40K
>  tmp-Release/deploy/ipk/x86-64-v3/clang-libclang-python_23.1.3-r0.4_x86-6=
4-v3.ipk
> 47M
>  tmp-Release/deploy/ipk/x86-64-v3/clang-staticdev_23.1.3-r0.4_x86-64-v3.i=
pk
> 3.3M
> tmp-Release/deploy/ipk/x86-64-v3/clang-tidy_23.1.3-r0.4_x86-64-v3.ipk
> 1.4M
> tmp-Release/deploy/ipk/x86-64-v3/clang-tools_23.1.3-r0.4_x86-64-v3.ipk
> 6.8M    tmp-Release/deploy/ipk/x86-64-v3/clang_23.1.3-r0.4_x86-64-v3.ipk
> 21M
>  tmp-Release/deploy/ipk/x86-64-v3/libclang-cpp23.1_23.1.3-r0.4_x86-64-v3.=
ipk
> 13M
>  tmp-Release/deploy/ipk/x86-64-v3/libclang23.1_23.1.3-r0.4_x86-64-v3.ipk
>
>
I expected some impact on clang's performance and the changes were
targeted more at clang as
embedded library for other packages like mesa but this meant that clang as
a static compiler would
take the hit and its evident from numbers you published, so distos and
recipes with TOOLCHAIN =3D "clang"
 are most impacted. I also wonder if we use different opt levels for clang
and llvm then are we
going into new combination thats least tested in clang/llvm community but
leaving that concern aside
I think this change is good, I would have asked to make it a packageconfig
but since there are packages
like chromium which enforce clang, we will not benefit as much

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
>  meta/recipes-devtools/clang/clang_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/clang/clang_git.bb
> b/meta/recipes-devtools/clang/clang_git.bb
> index 3b93f0d02c..90076f9d6d 100644
> --- a/meta/recipes-devtools/clang/clang_git.bb
> +++ b/meta/recipes-devtools/clang/clang_git.bb
> @@ -60,7 +60,7 @@ EXTRA_OECMAKE +=3D "-DLLVM_ENABLE_ASSERTIONS=3DOFF \
>                    -DFFI_INCLUDE_DIR=3D$(pkg-config --variable=3Dincluded=
ir
> libffi) \
>                    -DLLVM_BUILD_EXTERNAL_COMPILER_RT=3DON \
>                    -DCMAKE_SYSTEM_NAME=3DLinux \
> -                  -DCMAKE_BUILD_TYPE=3DMinSizeRel \
> +                  -DCMAKE_BUILD_TYPE=3DRelease \
>                    -DLLVM_VERSION_SUFFIX=3D'${VER_SUFFIX}' \
>                    -DLLVM_CMAKE_DIR=3D${STAGING_LIBDIR}/cmake/llvm \
>                    -DLLVM_NATIVE_TOOL_DIR=3D${STAGING_BINDIR_NATIVE} \
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#248158):
> https://lists.openembedded.org/g/openembedded-core/message/248158
> Mute This Topic: https://lists.openembedded.org/mt/121829223/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000d81d03065e3bbed8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 19,=
 2026 at 4:25=E2=80=AFAM Martin Jansa via <a href=3D"http://lists.openembed=
ded.org">lists.openembedded.org</a> &lt;martin.jansa=3D<a href=3D"mailto:gm=
ail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Marti=
n Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">mar=
tin.jansa@gmail.com</a>&gt;<br>
<br>
It was changed in:<br>
<a href=3D"https://git.openembedded.org/openembedded-core/commit/?id=3Dea9b=
33f7c12f773830ec860ae817a3ed1368612b" rel=3D"noreferrer" target=3D"_blank">=
https://git.openembedded.org/openembedded-core/commit/?id=3Dea9b33f7c12f773=
830ec860ae817a3ed1368612b</a><br>
to save the disk space, but the build time impact is significant.<br>
<br>
Both llvm and clang recipes are now using MinSizeRel, but the build time<br=
>
impact is significant mostly from clang recipes and also the disk space<br>
is affected more by llvm, than clang. So change the default only for<br>
clang recipe. In theory we could use Release only for clang-native and<br>
leave MinSizeRel for target clang (assuming that most people don&#39;t do<b=
r>
many demanding builds on target, but that won&#39;t be true for something<b=
r>
like build appliance built with OE).<br>
<br>
chromium-x11.do_compile time with 64 thread AMD Threadripper 3970x<br>
increased by 80% from 6930s to 12300s, measured in wrynose release.<br>
<br>
With current master chromium-x11.do_compile time is also around 80%<br>
slower compared to both using Release or 66.6% slower compared to<br>
clang using Release:<br>
<br>
MinSizeRel in both clang and llvm:<br>
20.09user 2.56system 3:05:09elapsed 0%CPU (0avgtext+0avgdata 58500maxreside=
nt)k<br>
<br>
MinSizeRel in llvm, Release in clang:<br>
18.82user 2.61system 1:51:40elapsed 0%CPU (0avgtext+0avgdata 58776maxreside=
nt)k<br>
<br>
Release in both clang and llvm:<br>
18.83user 2.59system 1:45:32elapsed 0%CPU (0avgtext+0avgdata 59424maxreside=
nt)k<br>
<br>
sstate-cache size after building core-image-sato with<br>
PREFERRED_TOOLCHAIN_TARGET =3D &quot;clang&quot;<br>
and target clang included as well as chromium-x11 in the image:<br>
<br>
increased by less than 2% (137MB):<br>
8988=C2=A0 =C2=A0 sstate-cache-MinSizeRel-both<br>
9125=C2=A0 =C2=A0 sstate-cache-Release-both<br>
<br>
populate_sysroot:<br>
llvm:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A014M: 175M -&gt; 189M<br>
llvm-native:=C2=A0 29M:=C2=A0 98M -&gt; 127M<br>
clang:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A04M:=C2=A0 82M -&gt;=C2=A0 86M<br>
clang-native: 30M: 102M -&gt; 132M<br>
<br>
llvm package: 26M: 314M -&gt; 340M<br>
llvm ipk:=C2=A0 =C2=A0 =C2=A027M: 353M -&gt; 380M<br>
<br>
clang package: 3M:=C2=A0 89M -&gt;=C2=A0 92M<br>
clang ipk:=C2=A0 =C2=A0 =C2=A04M: 100M -&gt; 104M<br>
<br>
ipk package sizes:<br>
7.0M=C2=A0 =C2=A0 tmp-MinSizeRel/deploy/ipk/x86-64-v3/llvm-bin_23.1.3-r0.3_=
x86-64-v3.ipk<br>
87M=C2=A0 =C2=A0 =C2=A0tmp-MinSizeRel/deploy/ipk/x86-64-v3/llvm-dbg_23.1.3-=
r0.3_x86-64-v3.ipk<br>
6.5M=C2=A0 =C2=A0 tmp-MinSizeRel/deploy/ipk/x86-64-v3/llvm-dev_23.1.3-r0.3_=
x86-64-v3.ipk<br>
66M=C2=A0 =C2=A0 =C2=A0tmp-MinSizeRel/deploy/ipk/x86-64-v3/llvm-src_23.1.3-=
r0.3_x86-64-v3.ipk<br>
153M=C2=A0 =C2=A0 tmp-MinSizeRel/deploy/ipk/x86-64-v3/llvm-staticdev_23.1.3=
-r0.3_x86-64-v3.ipk<br>
35M=C2=A0 =C2=A0 =C2=A0tmp-MinSizeRel/deploy/ipk/x86-64-v3/llvm_23.1.3-r0.3=
_x86-64-v3.ipk<br>
<br>
8.3M=C2=A0 =C2=A0 tmp-Release/deploy/ipk/x86-64-v3/llvm-bin_23.1.3-r0.2_x86=
-64-v3.ipk<br>
98M=C2=A0 =C2=A0 =C2=A0tmp-Release/deploy/ipk/x86-64-v3/llvm-dbg_23.1.3-r0.=
2_x86-64-v3.ipk<br>
6.5M=C2=A0 =C2=A0 tmp-Release/deploy/ipk/x86-64-v3/llvm-dev_23.1.3-r0.2_x86=
-64-v3.ipk<br>
66M=C2=A0 =C2=A0 =C2=A0tmp-Release/deploy/ipk/x86-64-v3/llvm-src_23.1.3-r0.=
2_x86-64-v3.ipk<br>
164M=C2=A0 =C2=A0 tmp-Release/deploy/ipk/x86-64-v3/llvm-staticdev_23.1.3-r0=
.2_x86-64-v3.ipk<br>
41M=C2=A0 =C2=A0 =C2=A0tmp-Release/deploy/ipk/x86-64-v3/llvm_23.1.3-r0.2_x8=
6-64-v3.ipk<br>
<br>
8.8M=C2=A0 =C2=A0 tmp-MinSizeRel/deploy/ipk/x86-64-v3/clang-dbg_23.1.3-r0.3=
_x86-64-v3.ipk<br>
4.3M=C2=A0 =C2=A0 tmp-MinSizeRel/deploy/ipk/x86-64-v3/clang-dev_23.1.3-r0.3=
_x86-64-v3.ipk<br>
20K=C2=A0 =C2=A0 =C2=A0tmp-MinSizeRel/deploy/ipk/x86-64-v3/clang-doc_23.1.3=
-r0.3_x86-64-v3.ipk<br>
48K=C2=A0 =C2=A0 =C2=A0tmp-MinSizeRel/deploy/ipk/x86-64-v3/clang-format_23.=
1.3-r0.3_x86-64-v3.ipk<br>
40K=C2=A0 =C2=A0 =C2=A0tmp-MinSizeRel/deploy/ipk/x86-64-v3/clang-libclang-p=
ython_23.1.3-r0.3_x86-64-v3.ipk<br>
48M=C2=A0 =C2=A0 =C2=A0tmp-MinSizeRel/deploy/ipk/x86-64-v3/clang-staticdev_=
23.1.3-r0.3_x86-64-v3.ipk<br>
2.9M=C2=A0 =C2=A0 tmp-MinSizeRel/deploy/ipk/x86-64-v3/clang-tidy_23.1.3-r0.=
3_x86-64-v3.ipk<br>
1.3M=C2=A0 =C2=A0 tmp-MinSizeRel/deploy/ipk/x86-64-v3/clang-tools_23.1.3-r0=
.3_x86-64-v3.ipk<br>
6.1M=C2=A0 =C2=A0 tmp-MinSizeRel/deploy/ipk/x86-64-v3/clang_23.1.3-r0.3_x86=
-64-v3.ipk<br>
18M=C2=A0 =C2=A0 =C2=A0tmp-MinSizeRel/deploy/ipk/x86-64-v3/libclang-cpp23.1=
_23.1.3-r0.3_x86-64-v3.ipk<br>
11M=C2=A0 =C2=A0 =C2=A0tmp-MinSizeRel/deploy/ipk/x86-64-v3/libclang23.1_23.=
1.3-r0.3_x86-64-v3.ipk<br>
<br>
7.8M=C2=A0 =C2=A0 tmp-Release/deploy/ipk/x86-64-v3/clang-dbg_23.1.3-r0.4_x8=
6-64-v3.ipk<br>
4.3M=C2=A0 =C2=A0 tmp-Release/deploy/ipk/x86-64-v3/clang-dev_23.1.3-r0.4_x8=
6-64-v3.ipk<br>
20K=C2=A0 =C2=A0 =C2=A0tmp-Release/deploy/ipk/x86-64-v3/clang-doc_23.1.3-r0=
.4_x86-64-v3.ipk<br>
52K=C2=A0 =C2=A0 =C2=A0tmp-Release/deploy/ipk/x86-64-v3/clang-format_23.1.3=
-r0.4_x86-64-v3.ipk<br>
40K=C2=A0 =C2=A0 =C2=A0tmp-Release/deploy/ipk/x86-64-v3/clang-libclang-pyth=
on_23.1.3-r0.4_x86-64-v3.ipk<br>
47M=C2=A0 =C2=A0 =C2=A0tmp-Release/deploy/ipk/x86-64-v3/clang-staticdev_23.=
1.3-r0.4_x86-64-v3.ipk<br>
3.3M=C2=A0 =C2=A0 tmp-Release/deploy/ipk/x86-64-v3/clang-tidy_23.1.3-r0.4_x=
86-64-v3.ipk<br>
1.4M=C2=A0 =C2=A0 tmp-Release/deploy/ipk/x86-64-v3/clang-tools_23.1.3-r0.4_=
x86-64-v3.ipk<br>
6.8M=C2=A0 =C2=A0 tmp-Release/deploy/ipk/x86-64-v3/clang_23.1.3-r0.4_x86-64=
-v3.ipk<br>
21M=C2=A0 =C2=A0 =C2=A0tmp-Release/deploy/ipk/x86-64-v3/libclang-cpp23.1_23=
.1.3-r0.4_x86-64-v3.ipk<br>
13M=C2=A0 =C2=A0 =C2=A0tmp-Release/deploy/ipk/x86-64-v3/libclang23.1_23.1.3=
-r0.4_x86-64-v3.ipk<br>
<br></blockquote><div><br></div><div>I expected some impact on clang&#39;s =
performance and the changes were targeted=C2=A0more at clang as</div><div>e=
mbedded library for other packages like mesa but this meant that clang as a=
 static=C2=A0compiler would</div><div>take the hit and its=C2=A0evident fro=
m numbers you published, so distos and recipes with TOOLCHAIN =3D &quot;cla=
ng&quot;</div><div>=C2=A0are most impacted. I also wonder if we use differe=
nt opt levels for clang and llvm then are we</div><div>going into new combi=
nation thats least tested in clang/llvm community but leaving that concern =
aside</div><div>I think this change is good, I would have asked to make it =
a packageconfig but since there are packages</div><div>like chromium which =
enforce clang, we will not benefit as much</div><div><br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" t=
arget=3D"_blank">martin.jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/clang/<a href=3D"http://clang_git.bb" rel=3D"no=
referrer" target=3D"_blank">clang_git.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-devtools/clang/<a href=3D"http://clang_git.bb" re=
l=3D"noreferrer" target=3D"_blank">clang_git.bb</a> b/meta/recipes-devtools=
/clang/<a href=3D"http://clang_git.bb" rel=3D"noreferrer" target=3D"_blank"=
>clang_git.bb</a><br>
index 3b93f0d02c..90076f9d6d 100644<br>
--- a/meta/recipes-devtools/clang/<a href=3D"http://clang_git.bb" rel=3D"no=
referrer" target=3D"_blank">clang_git.bb</a><br>
+++ b/meta/recipes-devtools/clang/<a href=3D"http://clang_git.bb" rel=3D"no=
referrer" target=3D"_blank">clang_git.bb</a><br>
@@ -60,7 +60,7 @@ EXTRA_OECMAKE +=3D &quot;-DLLVM_ENABLE_ASSERTIONS=3DOFF \=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-DFFI_=
INCLUDE_DIR=3D$(pkg-config --variable=3Dincludedir libffi) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-DLLVM=
_BUILD_EXTERNAL_COMPILER_RT=3DON \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-DCMAK=
E_SYSTEM_NAME=3DLinux \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DCMAKE_BUI=
LD_TYPE=3DMinSizeRel \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DCMAKE_BUI=
LD_TYPE=3DRelease \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-DLLVM=
_VERSION_SUFFIX=3D&#39;${VER_SUFFIX}&#39; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-DLLVM=
_CMAKE_DIR=3D${STAGING_LIBDIR}/cmake/llvm \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-DLLVM=
_NATIVE_TOOL_DIR=3D${STAGING_BINDIR_NATIVE} \<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#248158): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/248158" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/248158</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121829223/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121829223/1997914</a><br>
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

--000000000000d81d03065e3bbed8--
