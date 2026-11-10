Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15159.1794296943876808679
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 23:49:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=mb/6eH5z;
 spf=pass (domain: gmail.com, ip: 74.125.224.47, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-675617e81f9so1516057d50.3
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 23:49:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794296943; cv=none;
        d=google.com; s=arc-20260327;
        b=Lj2Pw0h8piu1DloE+Ze4d2eFWNG3MGYw1TnKGZMROuUcTBcQBQA3NtfivG0OzDis0W
         1SEVDXLuuYtUFR9UA98XF0dof0SI6Rq3ueqYGMv+6XlWt8rMA4orl4rqdrJdQGCoAle/
         fZIv9e5r2d2fin904f4y0x9jZ224fZUlNj4Qtri6sXU9SYKinkGfckKFVqep1rTJ5B2y
         L3cG76hhY3A0NiZ5byNz3y/XadPIfETxefrhX7TZMXYQU/PI0ANJsxSUNGVlKdwMLKE+
         17O8rY9sVFhmiSNC7xfC3g9MDja778ZHqXG/Ug7Wx3Olm81qYB0Woj/CsDLc/QSz82dk
         93Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hRrOy/iCXTDl7Vv/IhL7HnKoYd/uKdt3nQ7xmEmWDQk=;
        fh=TNiNjWIcpOiTB3fRjrkNKkY7a5mXg7LqObFeHsDvIhQ=;
        b=syvZyW6YvGNiZs/dlY68CwF05Z1m4CRNLX6ruyG41WEZUgtSCiXDlKIY4rz1/pVwVe
         54OqbCOpo4HN34iY0mjOBvOiMDEscdMB9HfSRSik4OZKnspG13Ctglx7EiQdo6GYfla+
         9t9OSHPwVfrlprlcOr3wq3jannR3CB81XMV2Hnd7iJvIy0nZzzoPM5ORk/jaeK7mugXp
         Uy8e5fM/6D8BlC6mWCAmPLHzQ5qrMe4C3nHN4mV4o18EwAKgitfUwBaAOoACi1Xjw1nD
         aLs5t+Q5lzIKXdHG3jp2z8eHh/3EGqQMQ8NWe3AwtIntm5imxuLXE3qz7tNKxtXgk6iI
         KEdA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296943; x=1794901743; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hRrOy/iCXTDl7Vv/IhL7HnKoYd/uKdt3nQ7xmEmWDQk=;
        b=mb/6eH5znwbsW54JSyQrnqplIbA+cC+eNlL+Ltj7G41DaJ9CywdpGKI9VImd8DuRO6
         6HZvDoG/g3Fu03MDh8BrLYvgw9SLEOEDebBPu88bPfHKDm/29zZfixifosRWusikL+dP
         wJh3ozQerfbEaRZmVs7QJAqL7a4OIAvwzxbSHVpQIbXf1iGu8KnSqcC7tgUa0aqjXFy6
         pFGIAgigAlKl8hM0utWLVG62Ep6jnQp1bxxD1VKp4aSll8JAuu4xdnmXORaSek9BOa7A
         8AoJNKM2tkr00xyauY42i7mSyT2q9PK2lJ/cNuwY8ikY69TbtnFC1hH81glpXzclVo/t
         DbSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296943; x=1794901743;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hRrOy/iCXTDl7Vv/IhL7HnKoYd/uKdt3nQ7xmEmWDQk=;
        b=HCTAqul/jaH5nUPMQ6W8JFvLw1vbbGU1quEC0/ol0nx2fd78OHbwrJYx1LAGcXVx/7
         1YeWCuvSQRxkX53cJP0fUOSaqZOCtotBM4MKFjkiuqaOKazXUipIRDwyOkOszO16Xl/I
         5gDWn0stX6ouRZLrmIidETS7siB1++ok2Y3uY6u2KF2FXsRw3CFNA45ARKfxlQsFg8sd
         /5DSY6x1V7vjkpkhS7CFw1LhtTrEVNjLSJooXKpMgD19ypJXfc6PAnMCfi8rLXKVGXAG
         xwvn5toVe/8QQvZcqEo75JRbqAfSjnoOxyxFJR65bS8hcr9aqMR/q/uGFH8wFVpOxxYj
         iOQA==
X-Gm-Message-State: APuU4Z9LN1HPaDhnGzTlKBI6H561265ITM38L6nUY0vKMk4f1bu1OUNi
	8dlcZhcaG9gdRnOxTAnf2rk26Q//YUlKhF1rsDWmXhPRYYEZXxnLY2R6VxctFRW9e2KwbM7cEiJ
	6Hn/stf8MUo6Jj71BSWzm96BO5oWeTxn+vQ==
X-Gm-Gg: AYBFou3D4zFXF0ou26MZdEQhKmMcU9Ne6JIdeMSDXoT/FX4wzVYp9U3swAKptUfN4QZ
	l5a6FyHgOjM3zWcWkLDrOIEeIF8YuURugtfY/5B4fS7A0r/tvY8YPL1TfUML3D8ugvKUNgWvW1s
	o5SnpNPhwc2yggOD0Qy1AbFIkEmCVS8bCUCyV/7PLzZXOkyY16pkhnTWVQqHn2bbOea/qO6v+pB
	9fZxPxmf/x5AEMjFCu+KjApSuObW5DpaXA8VD0H4AwxsDNnCjdaEJTsCJA+orDYP6SQHS4FLDvJ
	6ckytp2oR2iGsrg+aoye1csJht618nX074WCUs85P+oEjU63QUl53AlyLHBmQ9638h8CpJ5BUnZ
	sKvkbAsdIgVYJpLBoNjfvqt6r3xIKRJFxfdQh7WNoRM17bB/06v3o6Xbeoswqx103ERHkHBSTHb
	gZ1D6Za1WBuU6pMVNrBWV22RdkiAs82hXe0rZ1xzxQ4WAxOxNJSTMGIh127EaRzi+EonoF5kQVQ
	65t5BwZG2fzQgf0GxbEzIVYP6Y33mbrmSWICC3o04b3E3zENasJ/aEEc9DFR6Gu7WCU3+ssebUu
	7h/JkrZb3Z03bw4/QWTZ0O/AQPfDwZ5iOBg92MF0BQuoIaSTVUgizxJ5HJdPXDvPBa3PvmrR2f4
	+8dG4RXfEbQiSXljfZPZ6H2bCiiWKh/JL9+3+OSCTZ5Q=
X-Received: by 2002:a05:690e:806:10b0:679:887f:a2ba with SMTP id
 956f58d0204a3-67c567d3602mr896053d50.24.1794296942774; Mon, 09 Nov 2026
 23:49:02 -0800 (PST)
MIME-Version: 1.0
References: <20261110061608.4043909-1-sunilkumar.dora@windriver.com>
In-Reply-To: <20261110061608.4043909-1-sunilkumar.dora@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 9 Nov 2026 23:48:35 -0800
X-Gm-Features: AclHuK-gpE4k5_hjhVcAp6aK4qRu_cpqX8lujlBnDLeh-kttbO2BtVSuo3MCywI
Message-ID: <CAMKF1srYy9KEUA-x5Zd2UL_hqKkd=_VFyPTDpxG0kBJhWH9F8w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/3] clang/llvm: Upgrade to 23.1.5
To: SunilKumar.Dora@windriver.com
Cc: openembedded-core@lists.openembedded.org, 
	richard.purdie@linuxfoundation.org, sundeep.kokkonda@windriver.com, 
	Randy.MacLeod@windriver.com
Content-Type: multipart/alternative; boundary="000000000000e54f39065fe74f81"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 07:49:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249909

--000000000000e54f39065fe74f81
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This patch looks good to me

On Mon, Nov 9, 2026 at 10:16=E2=80=AFPM Dora, Sunil Kumar via openembedded-=
core
<SunilKumar.Dora=3Dwindriver.com@lists.openembedded.org> wrote:

> From: Sunil Dora <sunilkumar.dora@windriver.com>
>
> This moves clang/llvm from 23.1.3 to 23.1.5. All 35 carried patches
> apply as is, nothing they touch changed between the two tags.
>
> 23.1.4 failed the toolchain selftest on all five -tc builders in the two
> new tools/extract_symbols/registry-* tests. Their lit config runs the
> python cmake found at configure time, the build host python, which is
> not there on the target. Other python based tests go through lit's
> %python, the python running lit, so this never showed up before. Clang
> has the same problem in its own substitutions.
>
> Patch 2 rewrites the recorded python path to the target one in both
> recipes when CLANG_ENABLE_TESTSUITE is set. Patch 3 brings back the
> tests excluded only for this reason: 99 pass in clang and 67 in llvm on
> target, the other 9 are UpdateTestChecks tests unsupported in this build.
>
> The extract_symbols config is being fixed upstream in
> https://github.com/llvm/llvm-project/pull/240530, but that covers just
> those two tests. Clang and the other llvm substitutions still use the
> configured python, so the recipe fix covers all of them at once and
> leaves nothing to rebase on the next bump.
>
> Tested locally: clang family, core-image-minimal, spirv-llvm-translator,
> rust and mesa for qemux86-64 glibc; musl family and image; lib32-llvm and
> openmp with multilib; clang and compiler-rt for qemux86, qemuarm and
> qemuarm64. oe-selftest llvm, clang and lld pass on qemux86-64, llvm on
> qemux86. On the autobuilder all five -tc builders (qemux86-64, qemux86,
> qemuarm, qemuarm64, qemuriscv64) pass the llvm, clang and lld selftests
> with the re-enabled tests; multilib, musl-qemuarm64, musl-qemux86 and
> musl-qemux86-64 pass as well.
>
> Sunil Dora (3):
>   clang/llvm: Upgrade from 23.1.3 to 23.1.5 release
>   clang/llvm: Point lit at the target python for the test suite
>   oeqa/selftest/clang: Re-enable tests that only needed the target
>     python
>
>  meta/conf/distro/include/maintainers.inc     |  2 +-
>  meta/lib/oeqa/selftest/cases/clang.py        | 25 --------------------
>  meta/recipes-devtools/clang/clang_git.bb     | 12 ++++++++++
>  meta/recipes-devtools/clang/common-clang.inc |  2 +-
>  meta/recipes-devtools/clang/common.inc       |  2 +-
>  meta/recipes-devtools/clang/llvm_git.bb      |  9 +++++++
>  6 files changed, 24 insertions(+), 28 deletions(-)
>
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#249900):
> https://lists.openembedded.org/g/openembedded-core/message/249900
> Mute This Topic: https://lists.openembedded.org/mt/122189926/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000e54f39065fe74f81
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This patch looks good to me</div><br><div class=3D"gmail_q=
uote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, N=
ov 9, 2026 at 10:16=E2=80=AFPM Dora, Sunil Kumar via openembedded-core &lt;=
SunilKumar.Dora=3D<a href=3D"mailto:windriver.com@lists.openembedded.org">w=
indriver.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">From: Sunil Dora &lt;<a href=3D"mailto:s=
unilkumar.dora@windriver.com" target=3D"_blank">sunilkumar.dora@windriver.c=
om</a>&gt;<br>
<br>
This moves clang/llvm from 23.1.3 to 23.1.5. All 35 carried patches<br>
apply as is, nothing they touch changed between the two tags.<br>
<br>
23.1.4 failed the toolchain selftest on all five -tc builders in the two<br=
>
new tools/extract_symbols/registry-* tests. Their lit config runs the<br>
python cmake found at configure time, the build host python, which is<br>
not there on the target. Other python based tests go through lit&#39;s<br>
%python, the python running lit, so this never showed up before. Clang<br>
has the same problem in its own substitutions.<br>
<br>
Patch 2 rewrites the recorded python path to the target one in both<br>
recipes when CLANG_ENABLE_TESTSUITE is set. Patch 3 brings back the<br>
tests excluded only for this reason: 99 pass in clang and 67 in llvm on<br>
target, the other 9 are UpdateTestChecks tests unsupported in this build.<b=
r>
<br>
The extract_symbols config is being fixed upstream in<br>
<a href=3D"https://github.com/llvm/llvm-project/pull/240530" rel=3D"norefer=
rer" target=3D"_blank">https://github.com/llvm/llvm-project/pull/240530</a>=
, but that covers just<br>
those two tests. Clang and the other llvm substitutions still use the<br>
configured python, so the recipe fix covers all of them at once and<br>
leaves nothing to rebase on the next bump.<br>
<br>
Tested locally: clang family, core-image-minimal, spirv-llvm-translator,<br=
>
rust and mesa for qemux86-64 glibc; musl family and image; lib32-llvm and<b=
r>
openmp with multilib; clang and compiler-rt for qemux86, qemuarm and<br>
qemuarm64. oe-selftest llvm, clang and lld pass on qemux86-64, llvm on<br>
qemux86. On the autobuilder all five -tc builders (qemux86-64, qemux86,<br>
qemuarm, qemuarm64, qemuriscv64) pass the llvm, clang and lld selftests<br>
with the re-enabled tests; multilib, musl-qemuarm64, musl-qemux86 and<br>
musl-qemux86-64 pass as well.<br>
<br>
Sunil Dora (3):<br>
=C2=A0 clang/llvm: Upgrade from 23.1.3 to 23.1.5 release<br>
=C2=A0 clang/llvm: Point lit at the target python for the test suite<br>
=C2=A0 oeqa/selftest/clang: Re-enable tests that only needed the target<br>
=C2=A0 =C2=A0 python<br>
<br>
=C2=A0meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 =C2=A0|=C2=A0 2=
 +-<br>
=C2=A0meta/lib/oeqa/selftest/cases/clang.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 25=
 --------------------<br>
=C2=A0meta/recipes-devtools/clang/<a href=3D"http://clang_git.bb" rel=3D"no=
referrer" target=3D"_blank">clang_git.bb</a>=C2=A0 =C2=A0 =C2=A0| 12 ++++++=
++++<br>
=C2=A0meta/recipes-devtools/clang/common-clang.inc |=C2=A0 2 +-<br>
=C2=A0meta/recipes-devtools/clang/common.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 2 +-<br>
=C2=A0meta/recipes-devtools/clang/<a href=3D"http://llvm_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">llvm_git.bb</a>=C2=A0 =C2=A0 =C2=A0 |=C2=A0 9 ++=
+++++<br>
=C2=A06 files changed, 24 insertions(+), 28 deletions(-)<br>
<br>
-- <br>
2.49.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#249900): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/249900" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/249900</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/122189926/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/122189926/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000e54f39065fe74f81--
