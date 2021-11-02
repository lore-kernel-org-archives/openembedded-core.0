Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1F0EC433F5
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 18:06:03 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web10.1703.1635876362861955649
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 11:06:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=b4gP66Mm;
 spf=pass (domain: gmail.com, ip: 209.85.222.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id bj20so9197476qkb.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 11:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mhyuCMrpuwwMdz+iRH16BIZHRhAKRDqVbKkGfTURvvk=;
        b=b4gP66MmsAeV4QPH8OSBVzbMKVhcFz5pDfsn5MruVrIMgO5Tin03zSuYq7lGqacFFK
         sAzXCVaLHari03Iy8Kiijmrc6/M9BQJPwPMWigGyTE/XhNvAOTT9s+iC0NVGQ/VjP6nI
         IZq7Y8abaiFQ1XL7v4C3yx0FMWhPDptcn2/eArDw7zy1RTVoAyQcTS+S0MJknxZcsB6k
         kjmPIjhea0UWRmFHttCT3dReH+buR+6H50+xYej0l/RCzAPLyeJGYIp4ytUM9KqfNuhG
         gRfenzNXn7QXwjdr2UutQtdPYYhMScewAIvnQoClOL48J/F4BrqublwkYQo9b/PWsp2f
         Rwkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mhyuCMrpuwwMdz+iRH16BIZHRhAKRDqVbKkGfTURvvk=;
        b=TkBLPddSMVrwOciJG2D6ssMDL45n2jNxqZGutkxEdk7dXoH06lCAPWhEmN9+ZRW53U
         eBiCgWzZGFhU/pZWv2b0wa28mpRtNh2hpDHlcFW1yB5NMquDzfwIn2cSxDqjHgadOh65
         xw5cKcJbJFWVPwxhVFEaHV6PV0UVRdmhraaJ6ulKX8mfhvxLvRFwv0Ek+Wq7yQ0T6NLA
         tBA7C5IMVgGlKpoZWfa20CqLxMRdNDoCe9r+GQ6nxSa3I5FqE3oPXnzQVSdy+dGV0l5J
         ux0M0O06boM7qJuJT//HsoCx/fdIxl/xZH5TeYpd4sUtLxkc5trnKmIf+Q4FrLMTuSca
         O6Hw==
X-Gm-Message-State: AOAM5326iPbByRkIorI88/GqzOAUopJSiSbUMiQ83sFyKDmbJFByM1Sm
	VPIq7faGP2FBAjiP5dQQMVYhjMBHJjh+F6Hpz1w=
X-Google-Smtp-Source: 
 ABdhPJxK5PE0pCcsHPMz3CnPxYUhQNmYiKXGfG8Xe/IxvgTs32dUu630PQfC2MruJ63eCYVkOOCaFPodCtSfRv4mR0E=
X-Received: by 2002:ae9:de07:: with SMTP id s7mr30105697qkf.47.1635876361883;
 Tue, 02 Nov 2021 11:06:01 -0700 (PDT)
MIME-Version: 1.0
References: <20211102180233.4104293-1-ross.burton@arm.com>
In-Reply-To: <20211102180233.4104293-1-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 2 Nov 2021 11:05:51 -0700
Message-ID: 
 <CAMKF1spVJSF9tpjK5nz7WYVB_XXEjXvuXARvXnpTKjOa4S-Brg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3: silence DeprecationWarnings in
 python3-config
To: Ross Burton <ross@burtonini.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000072532f05cfd225ae"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Nov 2021 18:06:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157807

--00000000000072532f05cfd225ae
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 2, 2021 at 11:02 AM Ross Burton <ross@burtonini.com> wrote:

> Our patched python3-config uses distutils, but that will emit a
> DeprecationWarning when imported.  This isn't useful when using the
> output of python3-config to find include paths.


So shouldn=E2=80=99t we fix python3-config to not use distutils and switch =
to setup
tools instead ?

I am afraid that masking the warning will come biting soon when this is
turned into a hard error

>
>
> This isn't a huge problem typically as the warning goes to stderr, but
> some build systems read both stdout and stderr.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-devtools/python/python3/python-config.patch | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/python/python3/python-config.patch
> b/meta/recipes-devtools/python/python3/python-config.patch
> index d0ddbbc7fd..c53f646af3 100644
> --- a/meta/recipes-devtools/python/python3/python-config.patch
> +++ b/meta/recipes-devtools/python/python3/python-config.patch
> @@ -14,7 +14,6 @@ as appropriate.
>  Upstream-Status: Inappropriate [Embedded Specific]
>
>  Signed-off-by: Tyler Hall <tylerwhall@gmail.com>
> -:
>
>  ---
>   Misc/python-config.in | 10 +++++-----
> @@ -24,11 +23,13 @@ diff --git a/Misc/python-config.in b/Misc/
> python-config.in
>  index ebd99da..13e57ae 100644
>  --- a/Misc/python-config.in
>  +++ b/Misc/python-config.in
> -@@ -6,7 +6,7 @@
> +@@ -6,7 +6,9 @@
>   import getopt
>   import os
>   import sys
>  -import sysconfig
> ++import warnings
> ++warnings.filterwarnings("ignore", category=3DDeprecationWarning)
>  +from distutils import sysconfig
>
>   valid_opts =3D ['prefix', 'exec-prefix', 'includes', 'libs', 'cflags',
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157806):
> https://lists.openembedded.org/g/openembedded-core/message/157806
> Mute This Topic: https://lists.openembedded.org/mt/86772899/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000072532f05cfd225ae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Nov 2, 2021 at 11:02 AM Ross Burton &lt;<a href=3D"=
mailto:ross@burtonini.com">ross@burtonini.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">Our patched python3-config uses distutils, but th=
at will emit a<br>
DeprecationWarning when imported.=C2=A0 This isn&#39;t useful when using th=
e<br>
output of python3-config to find include paths.</blockquote><div dir=3D"aut=
o"><br></div><div dir=3D"auto">So shouldn=E2=80=99t we fix python3-config t=
o not use distutils and switch to setup tools instead ?=C2=A0</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">I am afraid that masking the warning =
will come biting soon when this is turned into a hard error=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
This isn&#39;t a huge problem typically as the warning goes to stderr, but<=
br>
some build systems read both stdout and stderr.<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targe=
t=3D"_blank">ross.burton@arm.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/python/python3/python-config.patch | 5 +++--<br=
>
=C2=A01 file changed, 3 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-devtools/python/python3/python-config.patch b/met=
a/recipes-devtools/python/python3/python-config.patch<br>
index d0ddbbc7fd..c53f646af3 100644<br>
--- a/meta/recipes-devtools/python/python3/python-config.patch<br>
+++ b/meta/recipes-devtools/python/python3/python-config.patch<br>
@@ -14,7 +14,6 @@ as appropriate.<br>
=C2=A0Upstream-Status: Inappropriate [Embedded Specific]<br>
<br>
=C2=A0Signed-off-by: Tyler Hall &lt;<a href=3D"mailto:tylerwhall@gmail.com"=
 target=3D"_blank">tylerwhall@gmail.com</a>&gt;<br>
-:<br>
<br>
=C2=A0---<br>
=C2=A0 Misc/<a href=3D"http://python-config.in" rel=3D"noreferrer" target=
=3D"_blank">python-config.in</a> | 10 +++++-----<br>
@@ -24,11 +23,13 @@ diff --git a/Misc/<a href=3D"http://python-config.in" r=
el=3D"noreferrer" target=3D"_blank">python-config.in</a> b/Misc/<a href=3D"=
http://python-config.in" rel=3D"noreferrer" target=3D"_blank">python-config=
.in</a><br>
=C2=A0index ebd99da..13e57ae 100644<br>
=C2=A0--- a/Misc/<a href=3D"http://python-config.in" rel=3D"noreferrer" tar=
get=3D"_blank">python-config.in</a><br>
=C2=A0+++ b/Misc/<a href=3D"http://python-config.in" rel=3D"noreferrer" tar=
get=3D"_blank">python-config.in</a><br>
-@@ -6,7 +6,7 @@<br>
+@@ -6,7 +6,9 @@<br>
=C2=A0 import getopt<br>
=C2=A0 import os<br>
=C2=A0 import sys<br>
=C2=A0-import sysconfig<br>
++import warnings<br>
++warnings.filterwarnings(&quot;ignore&quot;, category=3DDeprecationWarning=
)<br>
=C2=A0+from distutils import sysconfig<br>
<br>
=C2=A0 valid_opts =3D [&#39;prefix&#39;, &#39;exec-prefix&#39;, &#39;includ=
es&#39;, &#39;libs&#39;, &#39;cflags&#39;,<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#157806): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/157806" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/157806</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86772899/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/86772899/1997914</a><br>
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

--00000000000072532f05cfd225ae--

