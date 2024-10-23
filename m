Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A767BCF539E
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 15:03:22 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
 by mx.groups.io with SMTP id smtpd.web11.11507.1729695793582093372
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 08:03:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bhUiBE+O;
 spf=pass (domain: gmail.com, ip: 209.85.161.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-5ebc0992560so1989770eaf.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 08:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729695793; x=1730300593; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H2CPxNCwobaXJuxFDK2/3uVCFsv2UlLyE+ZJXDpJZ0Q=;
        b=bhUiBE+OVGbX5Wxq6WNtRtZGG19ee4u5g4RA5Tvm2RGjFmj75RRf9FfAKOz6Azz/yn
         5Gu8J1DJO6zvNNb2MXDs1S8m7x1/bbxBTPKt71M0plDeMdCZsjZoaQ51VKq9QQognFhe
         qvR9o1XJeSPMaZ3U8kFErao1B8TfJqgAP6MR+a7H8/65vUYNkfn9BNxPMyjHzEak46Pv
         2jWOd3OnOtDfB8qf/H1VSTAeF5ANmB9eEADxu0tJwAfDdFAIeQzueVgzji4Yxv815LXf
         nhKDfz+ZLiL7xOMgvT+RCIEF78M6WH07haL56E50eQByrIl5NoDyJsCfeSLF7+IIup9o
         vHYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729695793; x=1730300593;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H2CPxNCwobaXJuxFDK2/3uVCFsv2UlLyE+ZJXDpJZ0Q=;
        b=OYE1sLZUWPsuyuZGegljtoV4iKxUccGWy6O//LHk/p/qyTovWohlFxFA4m+HwYrBtc
         cLsa8qA6GC2Rb+V6khT4n0daB3l/RqE+8AhC3MWXTQz5+Swlsn2tkG6IyWY+26LaoziH
         k74gs6a1plDUmJ3NSjU3XTSGewUUM2rktXN1cbUaqVbMJkwf8pxjvxUyPyJSGIXiUN2z
         DuVMl1MQ8noxdyOMQZAySNYl+24oqvF5Zv9jyT2YSbRfhncv2FvACL5JW7sHeHsVIsPI
         +xDEUOUNKa7OfozeIFE0S56AT0nDgC9OnIu6mZg/QXC7PWiycDb1mYtw0OzJhaQnNDeZ
         fYCQ==
X-Gm-Message-State: AOJu0YxBt3/4hvYbWy042wNtbgjZPiMpitQfOY7FyXscVkFhdY68gaSg
	sWGO0vfdGmjcLNDteVr6l3W/r0ZSWDQwBnYAszoDK+wZbzWA5mzVTyMak5QC8qxueYFd93+/NgR
	NMYmugn5XfAvxdtApq/ID86DclUprOg==
X-Google-Smtp-Source: AGHT+IHLHunVi7/mdVvSzbhEE/xNf2xbzORCG0MiGI16HJJug683wbPEhwPClBCLUKjN5RzuWQMHmcmCSJ6pZH8hruQ=
X-Received: by 2002:a05:6820:541:b0:5eb:75c2:5987 with SMTP id
 006d021491bc7-5ebee8de85emr2232329eaf.4.1729695792752; Wed, 23 Oct 2024
 08:03:12 -0700 (PDT)
MIME-Version: 1.0
References: <20241022171826.1292640-1-ross.burton@arm.com>
In-Reply-To: <20241022171826.1292640-1-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Oct 2024 08:03:01 -0700
Message-ID: <CAMKF1sqT1k91nPDn6JezwXLf2dzHf67GmnAEjPZ=z2BYEpbmMQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] oeqa/selftest/rust: skip on all MIPS platforms
To: ross.burton@arm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004bf1940625262f75"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 15:03:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206246

--0000000000004bf1940625262f75
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Lgtm


On Tue, Oct 22, 2024 at 10:18=E2=80=AFAM Ross Burton via lists.openembedded=
.org
<ross.burton=3Darm.com@lists.openembedded.org> wrote:

> As per "The rustc book"[1], mips*-unknown-linux-* are "tier 3" targets:
>
>   Tier 3 targets are those which the Rust codebase has support for, but
>   which the Rust project does not build or test automatically, so they
>   may or may not work.
>
> We already skip qemumips in this selftest, but we're now also seeing
> failures with qemumips64 so refactor the test to skip all machines where
> the architecture is mips or mips64.
>
> [1] https://doc.rust-lang.org/nightly/rustc/platform-support.html
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/lib/oeqa/selftest/cases/rust.py | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/meta/lib/oeqa/selftest/cases/rust.py
> b/meta/lib/oeqa/selftest/cases/rust.py
> index 88d7bb95189..fab6267b155 100644
> --- a/meta/lib/oeqa/selftest/cases/rust.py
> +++ b/meta/lib/oeqa/selftest/cases/rust.py
> @@ -3,6 +3,7 @@ import os
>  import subprocess
>  import time
>  from oeqa.core.decorator import OETestTag
> +from oeqa.core.decorator.data import skipIfArch
>  from oeqa.core.case import OEPTestResultTestCase
>  from oeqa.selftest.case import OESelftestTestCase
>  from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars=
,
> runqemu, Command
> @@ -38,15 +39,12 @@ def parse_results(filename):
>  @OETestTag("toolchain-user")
>  @OETestTag("runqemu")
>  class RustSelfTestSystemEmulated(OESelftestTestCase,
> OEPTestResultTestCase):
> +
> +    @skipIfArch(['mips', 'mips64'])
>      def test_rust(self, *args, **kwargs):
>          # Disable Rust Oe-selftest
>          #self.skipTest("The Rust Oe-selftest is disabled.")
>
> -        # Skip mips32 target since it is unstable with rust tests
> -        machine =3D get_bb_var('MACHINE')
> -        if machine =3D=3D "qemumips":
> -            self.skipTest("The mips32 target is skipped for Rust
> Oe-selftest.")
> -
>          # build remote-test-server before image build
>          recipe =3D "rust"
>          start_time =3D time.time()
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#206167):
> https://lists.openembedded.org/g/openembedded-core/message/206167
> Mute This Topic: https://lists.openembedded.org/mt/109156055/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000004bf1940625262f75
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Lgtm</div><div dir=3D"auto"><br></div><div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 22, 2024=
 at 10:18=E2=80=AFAM Ross Burton via <a href=3D"http://lists.openembedded.o=
rg">lists.openembedded.org</a> &lt;ross.burton=3D<a href=3D"mailto:arm.com@=
lists.openembedded.org">arm.com@lists.openembedded.org</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">As per &quot;The rustc book&quot;[1], mi=
ps*-unknown-linux-* are &quot;tier 3&quot; targets:<br>
<br>
=C2=A0 Tier 3 targets are those which the Rust codebase has support for, bu=
t<br>
=C2=A0 which the Rust project does not build or test automatically, so they=
<br>
=C2=A0 may or may not work.<br>
<br>
We already skip qemumips in this selftest, but we&#39;re now also seeing<br=
>
failures with qemumips64 so refactor the test to skip all machines where<br=
>
the architecture is mips or mips64.<br>
<br>
[1] <a href=3D"https://doc.rust-lang.org/nightly/rustc/platform-support.htm=
l" rel=3D"noreferrer" target=3D"_blank">https://doc.rust-lang.org/nightly/r=
ustc/platform-support.html</a><br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targe=
t=3D"_blank">ross.burton@arm.com</a>&gt;<br>
---<br>
=C2=A0meta/lib/oeqa/selftest/cases/rust.py | 8 +++-----<br>
=C2=A01 file changed, 3 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/=
cases/rust.py<br>
index 88d7bb95189..fab6267b155 100644<br>
--- a/meta/lib/oeqa/selftest/cases/rust.py<br>
+++ b/meta/lib/oeqa/selftest/cases/rust.py<br>
@@ -3,6 +3,7 @@ import os<br>
=C2=A0import subprocess<br>
=C2=A0import time<br>
=C2=A0from oeqa.core.decorator import OETestTag<br>
+from oeqa.core.decorator.data import skipIfArch<br>
=C2=A0from oeqa.core.case import OEPTestResultTestCase<br>
=C2=A0from oeqa.selftest.case import OESelftestTestCase<br>
=C2=A0from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_v=
ars, runqemu, Command<br>
@@ -38,15 +39,12 @@ def parse_results(filename):<br>
=C2=A0@OETestTag(&quot;toolchain-user&quot;)<br>
=C2=A0@OETestTag(&quot;runqemu&quot;)<br>
=C2=A0class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTes=
tCase):<br>
+<br>
+=C2=A0 =C2=A0 @skipIfArch([&#39;mips&#39;, &#39;mips64&#39;])<br>
=C2=A0 =C2=A0 =C2=A0def test_rust(self, *args, **kwargs):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Disable Rust Oe-selftest<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#self.skipTest(&quot;The Rust Oe-selftest=
 is disabled.&quot;)<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Skip mips32 target since it is unstable with=
 rust tests<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 machine =3D get_bb_var(&#39;MACHINE&#39;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if machine =3D=3D &quot;qemumips&quot;:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.skipTest(&quot;The mips32 t=
arget is skipped for Rust Oe-selftest.&quot;)<br>
-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# build remote-test-server before image b=
uild<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0recipe =3D &quot;rust&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0start_time =3D time.time()<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#206167): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/206167" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/206167</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/109156055/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/109156055/1997914</a><br>
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

--0000000000004bf1940625262f75--

