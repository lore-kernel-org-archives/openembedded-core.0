Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5E9EC47DDC
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 10:11:07 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.8717.1706004666146280762
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jan 2024 02:11:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iSXniQ3j;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-339208f5105so3538628f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 02:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706004664; x=1706609464; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=otn8gthWkH4OgOL24FEu8eNYZS4GfsiCDg2eXci5Doo=;
        b=iSXniQ3juTPma9f2PvokRQo/Sto2GpS/iUObDHbrW+ZoGSO6EeHfiaGlP+bMjXDlbv
         94uDmqmMKVN1v5DidoFWR+UMhPvmqwzKrIOhzqnk+w48w79cxiOP8vbGzmbbpeDxTqx7
         bm7dv20ArO9L1pfkfHPs1H509SWoh2KEuWKCmr99Qv94xJ+syLizmUeLWOuEEZTuWcDM
         MGAFICQWtKj8ip3qovCcbDuOq1QjULcp6Bjbg7//zTrhFl3RFRHkXoXsh+V3eR0rcjCA
         h1aRhgMk/aoRMtFjobcFVtcnEgCOD84GkBRLC7D2lxvFiMmAZyRQXTAB6hBWrsZvX5Ue
         zr9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706004664; x=1706609464;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=otn8gthWkH4OgOL24FEu8eNYZS4GfsiCDg2eXci5Doo=;
        b=qQrsaSSIQc4wtkNOlJanRgk7k6XVq6qU4E6XQhgWjy8DNY/lvBPC1xz9VX0vvUKi9n
         V2UytQ6sWCbqMlZ07vHZvBNGEXW9ccXsYCXDWBOsvqBYyZhmm4bWUq4Skw/wkhv4Ab98
         xXX9tAUyTFfa1ezY1YcXSF1fRXIqxUvHkkP9Ua4h0ffIH42QSkqLf3GSjA2ceqOgDMmo
         Y9xRg0POpvvyJmYjIlWxCIvkd2ASh13R7ODLvMnmBWIjIES+rt0EZN7LYaoFfFeyfy2S
         9T7NSKoDsX74IBtDOc8crBB2w9hCSBFKAkqk4h/iCOhRbunFeiwjnW73xV2e4CJjBQX1
         VVhA==
X-Gm-Message-State: AOJu0YzJyveS6wAtRmmIIDVmiqsm2zJH+ur8GKaq6zAdeY/N8kc+jKlh
	njQ3TWmYqS4LIwcv9R/sxocGjC2tMiXDuZW7hrVmb+oo9TKajNcpksqeBtwf8MT4v9k1OMWk/py
	S07Rj2gWZNYxyF6HHPL44Ob1QI5s=
X-Google-Smtp-Source: AGHT+IGlgFnWfS37NYQYdfoF2TF2hIf5V5IEGfsfsl2AvCKjukjYDlV7kDO1J/PWHFRVla5ulqasiapXsStuOsoYL6c=
X-Received: by 2002:a5d:69cc:0:b0:337:b4db:5a26 with SMTP id
 s12-20020a5d69cc000000b00337b4db5a26mr2303157wrw.15.1706004663843; Tue, 23
 Jan 2024 02:11:03 -0800 (PST)
MIME-Version: 1.0
References: <20240123023734.3803382-1-changqing.li@windriver.com>
In-Reply-To: <20240123023734.3803382-1-changqing.li@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 23 Jan 2024 11:10:50 +0100
Message-ID: <CA+chaQdXYov-vsgMDjCFW0FMJoWHdQBiBbQom+FmnK8f1tWa9g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V2] tcmode-default.inc: use ?= to set PREFERRED_VERSION_llvm/llvm-native/nativesdk-llvm
To: Changqing Li <changqing.li@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f94157060f9a29cf"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 10:11:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194225

--000000000000f94157060f9a29cf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

-1

This doesn't fix the issue, just makes the work around in other layers a
bit easier to implement. But those other layers will still need to update
whenever llvm recipe version is updated in oe-core which is annoying and
unnecessary.

I have to do the same with LLVM_PREFERRED_VERSION as it was proposed for
oe-core, because I had to apply it in our layer as in:
https://github.com/webosose/meta-webosose/commit/ba43dfb2d9d5256f0fda012709=
7d794da7fb3af8#diff-47795833863a904c85557a8d6a3cc4528bccac3e02f224bf392197d=
2f6656c98

but if the same is applied in oe-core then LLVM_PREFERRED_VERSION would be
updated together with llvm recipe upgrades in oe-core and meta-clang users
would get the right LLVMVERSION automatically from meta-clang's layer.conf:
https://github.com/kraj/meta-clang/blob/master/conf/layer.conf#L36

without doing any of these work arounds (other than setting
PREFERRED_PROVIDERS _once_ as described in
https://github.com/kraj/meta-clang/blob/master/README.md#providing-llvm)

NAK

On Tue, Jan 23, 2024 at 3:37=E2=80=AFAM Changqing Li <changqing.li@eng.wind=
river.com>
wrote:

> From: Changqing Li <changqing.li@windriver.com>
>
> If meta-clang is included, LLVMVERSION might set to version different
> from llvm version in oe-core, and PREFERRED_PROVIDER_llvm set to clang,
> In this condition, following warning is reported:
> WARNING: preferred version 16.0.1 of llvm-native not available (for item
> llvm-native)
> WARNING: versions of llvm-native available: 15.0.7
>
> use ?=3D to set following configs in order to allow user
> to override the default settings:
> PREFERRED_VERSION_llvm
> PREFERRED_VERSION_llvm-native
> PREFERRED_VERSION_nativesdk-llvm
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta/conf/distro/include/tcmode-default.inc | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/conf/distro/include/tcmode-default.inc
> b/meta/conf/distro/include/tcmode-default.inc
> index 3720a4c5b8..0de858d3af 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -77,9 +77,9 @@ PREFERRED_VERSION_go-runtime ?=3D "${GOVERSION}"
>  PREFERRED_VERSION_nativesdk-go ?=3D "${GOVERSION}"
>  PREFERRED_VERSION_nativesdk-go-runtime ?=3D "${GOVERSION}"
>
> -PREFERRED_VERSION_llvm =3D "${LLVMVERSION}"
> -PREFERRED_VERSION_llvm-native =3D "${LLVMVERSION}"
> -PREFERRED_VERSION_nativesdk-llvm =3D "${LLVMVERSION}"
> +PREFERRED_VERSION_llvm ?=3D "${LLVMVERSION}"
> +PREFERRED_VERSION_llvm-native ?=3D "${LLVMVERSION}"
> +PREFERRED_VERSION_nativesdk-llvm ?=3D "${LLVMVERSION}"
>
>  # Rust toolchain preferred versions:
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194198):
> https://lists.openembedded.org/g/openembedded-core/message/194198
> Mute This Topic: https://lists.openembedded.org/mt/103902328/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> martin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000f94157060f9a29cf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">-1<div><br><div>This doesn&#39;t fix the issue, just makes=
 the work around in other layers a bit easier to implement. But those other=
 layers will still need to update whenever llvm recipe version is updated i=
n oe-core which is annoying and unnecessary.</div><div><br></div><div>I hav=
e to do the same with=C2=A0LLVM_PREFERRED_VERSION as it was proposed for oe=
-core, because I had to apply it in our layer as in:</div><div><a href=3D"h=
ttps://github.com/webosose/meta-webosose/commit/ba43dfb2d9d5256f0fda0127097=
d794da7fb3af8#diff-47795833863a904c85557a8d6a3cc4528bccac3e02f224bf392197d2=
f6656c98">https://github.com/webosose/meta-webosose/commit/ba43dfb2d9d5256f=
0fda0127097d794da7fb3af8#diff-47795833863a904c85557a8d6a3cc4528bccac3e02f22=
4bf392197d2f6656c98</a><br></div><div><br></div><div>but if the same is app=
lied in oe-core then LLVM_PREFERRED_VERSION would be updated together with =
llvm recipe upgrades in oe-core and meta-clang users would get the right LL=
VMVERSION automatically from meta-clang&#39;s layer.conf:</div><div><a href=
=3D"https://github.com/kraj/meta-clang/blob/master/conf/layer.conf#L36">htt=
ps://github.com/kraj/meta-clang/blob/master/conf/layer.conf#L36</a><br></di=
v><div><br></div><div>without doing any of these work arounds (other than s=
etting PREFERRED_PROVIDERS _once_ as described in=C2=A0<a href=3D"https://g=
ithub.com/kraj/meta-clang/blob/master/README.md#providing-llvm">https://git=
hub.com/kraj/meta-clang/blob/master/README.md#providing-llvm</a>)</div></di=
v><div><br></div><div>NAK</div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Tue, Jan 23, 2024 at 3:37=E2=80=AFAM Chan=
gqing Li &lt;<a href=3D"mailto:changqing.li@eng.windriver.com">changqing.li=
@eng.windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">From: Changqing Li &lt;<a href=3D"mailto:changqing.li@win=
driver.com" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
<br>
If meta-clang is included, LLVMVERSION might set to version different<br>
from llvm version in oe-core, and PREFERRED_PROVIDER_llvm set to clang,<br>
In this condition, following warning is reported:<br>
WARNING: preferred version 16.0.1 of llvm-native not available (for item ll=
vm-native)<br>
WARNING: versions of llvm-native available: 15.0.7<br>
<br>
use ?=3D to set following configs in order to allow user<br>
to override the default settings:<br>
PREFERRED_VERSION_llvm<br>
PREFERRED_VERSION_llvm-native<br>
PREFERRED_VERSION_nativesdk-llvm<br>
<br>
Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.co=
m" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/distro/include/tcmode-default.inc | 6 +++---<br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro=
/include/tcmode-default.inc<br>
index 3720a4c5b8..0de858d3af 100644<br>
--- a/meta/conf/distro/include/tcmode-default.inc<br>
+++ b/meta/conf/distro/include/tcmode-default.inc<br>
@@ -77,9 +77,9 @@ PREFERRED_VERSION_go-runtime ?=3D &quot;${GOVERSION}&quot=
;<br>
=C2=A0PREFERRED_VERSION_nativesdk-go ?=3D &quot;${GOVERSION}&quot;<br>
=C2=A0PREFERRED_VERSION_nativesdk-go-runtime ?=3D &quot;${GOVERSION}&quot;<=
br>
<br>
-PREFERRED_VERSION_llvm =3D &quot;${LLVMVERSION}&quot;<br>
-PREFERRED_VERSION_llvm-native =3D &quot;${LLVMVERSION}&quot;<br>
-PREFERRED_VERSION_nativesdk-llvm =3D &quot;${LLVMVERSION}&quot;<br>
+PREFERRED_VERSION_llvm ?=3D &quot;${LLVMVERSION}&quot;<br>
+PREFERRED_VERSION_llvm-native ?=3D &quot;${LLVMVERSION}&quot;<br>
+PREFERRED_VERSION_nativesdk-llvm ?=3D &quot;${LLVMVERSION}&quot;<br>
<br>
=C2=A0# Rust toolchain preferred versions:<br>
<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#194198): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/194198" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/194198</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/103902328/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/103902328/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:martin.jansa@gmail.com" ta=
rget=3D"_blank">martin.jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000f94157060f9a29cf--

