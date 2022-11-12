Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58D8EC433FE
	for <webhook@archiver.kernel.org>; Sat, 12 Nov 2022 18:47:47 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web11.705.1668278864385147089
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Nov 2022 10:47:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Vj+RcTfP;
 spf=pass (domain: gmail.com, ip: 209.85.210.46, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f46.google.com with SMTP id w26-20020a056830061a00b0066c320f5b49so4546239oti.5
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Nov 2022 10:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lSfHWgezCSMRcx3mA1EnmyqYjxIJU8Xxu0xinHutd18=;
        b=Vj+RcTfPVdfjSHvkFPYX7E/YgUl60LGbtU4ccdxUckIyrSCeILzzouZiHWqOVz93S0
         09R10rKQHWQssXZvJKRBTr/JLqssUbhKshaU5Bjiw/mK3FQE9wPvMJr9wGpk7MNyKO7e
         SbaM8AcymkcEzL1rYwpmmuKy4NwpbQ66HwIHTyGSieazYBffhD99FRLa7uY1CR3Eeirp
         iTPMY8W3qvU7Qi30njw2iedNe2bxqJHgiYiV6h0CKWUpmSJWOeLBtcIZFcMnD1GUmnY0
         y+kdlSWiEmyNLUt1l+ik9I9Lr3/DtLt+BTeC5LUl7S9T7ADvzYQUb/lFNEEUzVmWofZy
         4j0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lSfHWgezCSMRcx3mA1EnmyqYjxIJU8Xxu0xinHutd18=;
        b=58ahHibe4NifpMJNXslwLOc8+2Ni4x4GiEPZfedq47TmPvCyUBCdCPEbY7PU/vbjbc
         AVqhLBlf/RK2GtSAh8C21kS9Q135oM2LH/YOFKCt4WHWNZBE3tYlBn+hhqs7uo3VFqq8
         Azyjwu7I6zbZTDfZsNbMLW2WHkO4+1S3NtHHN/Pu1NnRiMLHtOCJcttcQv0KJl1PgFsw
         lWkIH+HhupFy3RpWNuV2woQWWVsvFrWxsRRSy94zuqEkg86Zdo218KNHCz9vAh/TAiB7
         N2pMRLTW94uN82N+4vKAOeanOpq/3F4nAaZXqNI6Ll1b2q/5RA35W6HuwlU87wZtRGHK
         MPtw==
X-Gm-Message-State: ANoB5pl7ljKLp6XKS1FXsabk8zm6rIvIqHksg0VV+4d931U3acWuvMzD
	ygyzELYXutQXst6oYj/C9PseS2k1pTBlia9ZhASZZm/h
X-Google-Smtp-Source: AA0mqf7iwwfUO4jWZJZuftEEPJ4eLrsFF8QaRpukiT50X1PpjTRBds7HjdU/OcpIzYSb9Y6IZjrG2ivEiYbHnQpjrMQ=
X-Received: by 2002:a9d:7f0d:0:b0:66c:fb5b:1d67 with SMTP id
 j13-20020a9d7f0d000000b0066cfb5b1d67mr3762854otq.111.1668278863377; Sat, 12
 Nov 2022 10:47:43 -0800 (PST)
MIME-Version: 1.0
References: <20221112091217.1025-1-cp0613@linux.alibaba.com> <20221112091217.1025-2-cp0613@linux.alibaba.com>
In-Reply-To: <20221112091217.1025-2-cp0613@linux.alibaba.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 12 Nov 2022 10:47:32 -0800
Message-ID: <CAMKF1sqrzThsFw+fNVsfmNbDTxkF065e7BhH=Q7VbTnzLYSbgw@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe] [PATCH 2/2] Support for building on RISCV
To: cp0613 <cp0613@linux.alibaba.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000009bab905ed4a71b1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Nov 2022 18:47:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173164

--00000000000009bab905ed4a71b1
Content-Type: text/plain; charset="UTF-8"

Looks ok to me

On Sat, Nov 12, 2022 at 1:13 AM cp0613 <cp0613@linux.alibaba.com> wrote:

> From: Chen Pei <cp0613@linux.alibaba.com>
>
> Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
> ---
>  meta/recipes-devtools/meson/meson_0.64.0.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-devtools/meson/meson_0.64.0.bb
> b/meta/recipes-devtools/meson/meson_0.64.0.bb
> index 84c3c84515..c8ef8a23c5 100644
> --- a/meta/recipes-devtools/meson/meson_0.64.0.bb
> +++ b/meta/recipes-devtools/meson/meson_0.64.0.bb
> @@ -67,6 +67,8 @@ def generate_native_link_template(d):
>          loader = 'ld-linux-aarch64.so.1'
>      elif 'ppc64le' in build_arch:
>          loader = 'ld64.so.2'
> +    elif 'riscv64' in build_arch:
> +        loader = 'ld-linux-riscv64-lp64d.so.1'
>
>      if loader:
>          val +=
> ['-Wl,--dynamic-linker=@{OECORE_NATIVE_SYSROOT}${base_libdir_native}/' +
> loader]
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173148):
> https://lists.openembedded.org/g/openembedded-core/message/173148
> Mute This Topic: https://lists.openembedded.org/mt/94977045/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000009bab905ed4a71b1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Looks ok to me=C2=A0</div><div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Nov 12, 2022 at 1:13 AM =
cp0613 &lt;<a href=3D"mailto:cp0613@linux.alibaba.com">cp0613@linux.alibaba=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From: Chen Pei =
&lt;<a href=3D"mailto:cp0613@linux.alibaba.com" target=3D"_blank">cp0613@li=
nux.alibaba.com</a>&gt;<br>
<br>
Signed-off-by: Chen Pei &lt;<a href=3D"mailto:cp0613@linux.alibaba.com" tar=
get=3D"_blank">cp0613@linux.alibaba.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/meson/<a href=3D"http://meson_0.64.0.bb" rel=3D=
"noreferrer" target=3D"_blank">meson_0.64.0.bb</a> | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta/recipes-devtools/meson/<a href=3D"http://meson_0.64.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">meson_0.64.0.bb</a> b/meta/recipes-de=
vtools/meson/<a href=3D"http://meson_0.64.0.bb" rel=3D"noreferrer" target=
=3D"_blank">meson_0.64.0.bb</a><br>
index 84c3c84515..c8ef8a23c5 100644<br>
--- a/meta/recipes-devtools/meson/<a href=3D"http://meson_0.64.0.bb" rel=3D=
"noreferrer" target=3D"_blank">meson_0.64.0.bb</a><br>
+++ b/meta/recipes-devtools/meson/<a href=3D"http://meson_0.64.0.bb" rel=3D=
"noreferrer" target=3D"_blank">meson_0.64.0.bb</a><br>
@@ -67,6 +67,8 @@ def generate_native_link_template(d):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0loader =3D &#39;ld-linux-aarch64.so.1&#39=
;<br>
=C2=A0 =C2=A0 =C2=A0elif &#39;ppc64le&#39; in build_arch:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0loader =3D &#39;ld64.so.2&#39;<br>
+=C2=A0 =C2=A0 elif &#39;riscv64&#39; in build_arch:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 loader =3D &#39;ld-linux-riscv64-lp64d.so.1&#3=
9;<br>
<br>
=C2=A0 =C2=A0 =C2=A0if loader:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0val +=3D [&#39;-Wl,--dynamic-linker=3D@{O=
ECORE_NATIVE_SYSROOT}${base_libdir_native}/&#39; + loader]<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#173148): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/173148" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/173148</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94977045/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/94977045/1997914</a><br>
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

--00000000000009bab905ed4a71b1--

