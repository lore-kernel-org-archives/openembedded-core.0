Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C97CC3DA6E
	for <webhook@archiver.kernel.org>; Fri,  5 Jan 2024 22:23:39 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web11.36868.1704493409010497617
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jan 2024 14:23:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mprL/ggo;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-5f69383e653so691007b3.1
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jan 2024 14:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704493408; x=1705098208; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wKk66fXryJw3NWXmoP056ZTTCT0Si/9iO6RbF9tKHwY=;
        b=mprL/ggoG3kr2JnKUeUnKzYszYEAhMmmothgUwmBVn9sk/e8rA1TDqN0V9Gb+KoAz8
         tfWgnVxsr42/xPIV/Gmo8lc+ARIFhH7Bq/X8yzubVq6I9kJqjVLvceRhhsSd2TPfjN2a
         DF7Q1vSdeXvcRP44IVyrJzcq9RDTLyG3Pr6YZEikTJLLDFzRl0G8YD1PzZSnShEN7PnE
         oiL220X3GOfLRutnR85/ZD7DHk4xgSV2tUcIJFkLsdo3HKlGh/R4H+J9EdMk3rDUFeA1
         8yrX87O9NzDJxB8FlyTcWXsyrn72UmD2QahAx2mvZI+1AGkawFisY0Ypqvqu/67Bst+7
         xCLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704493408; x=1705098208;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wKk66fXryJw3NWXmoP056ZTTCT0Si/9iO6RbF9tKHwY=;
        b=qvPF7BOwz81er3qeZrjG/Ieu3dhmqZtwhw/tEV5s3k/ibJoNNEs7fbFhCGzKC9mpxb
         GP8rZAhvQ4L2wnrmL2EgwRS+rqingVCGjU/OQvVQTGglX4l0qbDNy3R6srTA+bk8hvdt
         Jh+U5+nxV7GG0n4+KR31UqyNgVvFsIkf+nvPLtrD9TApnYGe1aMOmNod15rJs5Ll4VsG
         VL0BuYFYgnyo3IZViiRCqNbSR0i6rDjP7FfVFnLFvhvjVDcZaZwfviKGrK1EyxSzDddK
         fRuFV9YYspa1gFUc4X8AxeStqpCkRV/BeP7hazXZEXXOE+/OkUXLrysXpVBSbU0YV/xf
         asXw==
X-Gm-Message-State: AOJu0YxOA1nx2PFBYYyuI3+osMvEaiVUaoIYOfFIEe7umCiLqnz1iVX3
	wPimNH9mj+2MQqMK0OWsuVeFr/QvMTcAxqej57oaJTIyHfs=
X-Google-Smtp-Source: AGHT+IELqSNZ3NXW+eDpvFiQP1NK3LcVhEGhWWgZVjazwqi1KJh2Mx4nRCBvSdRxmoub9M5jhQ9Phhq0ACuy4cX7x4M=
X-Received: by 2002:a0d:e303:0:b0:5d7:1941:acd with SMTP id
 m3-20020a0de303000000b005d719410acdmr146264ywe.104.1704493407786; Fri, 05 Jan
 2024 14:23:27 -0800 (PST)
MIME-Version: 1.0
References: <17A7864F7B027B8B.25044@lists.openembedded.org>
In-Reply-To: <17A7864F7B027B8B.25044@lists.openembedded.org>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 5 Jan 2024 14:23:16 -0800
Message-ID: <CANx9H-C+kYRrikN5rCkj_hR96LNK1rbFa2Fk2hXhcN4A2ixjmw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] python3-attrs: upgrade 23.1.0 -> 23.2.0
To: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000017dc4d060e3a4c45"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jan 2024 22:23:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193379

--00000000000017dc4d060e3a4c45
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ignore this one, since it has already been addressed by:
https://patchwork.yoctoproject.org/project/oe-core/patch/1704271378-18012-1=
-git-send-email-wangmy@fujitsu.com/

But please take 2/2 for ptest.

On Fri, Jan 5, 2024 at 10:17=E2=80=AFAM Tim Orling via lists.openembedded.o=
rg
<ticotimo=3Dgmail.com@lists.openembedded.org> wrote:

> https://www.attrs.org/en/stable/changelog.html
>
> 23.2.0 - 2023-12-31
>
> Changes
> * The type annotation for attrs.resolve_types() is now correct. #1141
> * Type stubs now use typing.dataclass_transform to decorate dataclass-lik=
e
>   decorators, instead of the non-standard __dataclass_transform__ special
>   form, which is only supported by Pyright. #1158
> * Fixed serialization of namedtuple fields using attrs.asdict/astuple()
> with
>   retain_collection_types=3DTrue. #1165
> * attrs.AttrsInstance is now a typing.Protocol in both type hints and cod=
e.
>   This allows you to subclass it along with another Protocol. #1172
> * If attrs detects that __attrs_pre_init__ accepts more than just self, i=
t
>   will call it with the same arguments as __init__ was called. This allow=
s
>   you to, for example, pass arguments to super().__init__(). #1187
> * Slotted classes now transform functools.cached_property decorated metho=
ds
>   to support equivalent semantics. #1200
> * Added class_body argument to attrs.make_class() to provide additional
>   attributes for newly created classes. It is, for example, now possible =
to
>   attach methods. #1203
>
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> ---
> Requires python3-hatch-fancy-pypi-readme upgrade beyond 23.1.0
>
> https://patchwork.yoctoproject.org/project/oe-core/patch/1704180223-8624-=
1-git-send-email-wangmy@fujitsu.com/
>
>  .../python/{python3-attrs_23.1.0.bb =3D> python3-attrs_23.2.0.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/python/{python3-attrs_23.1.0.bb =3D>
> python3-attrs_23.2.0.bb} (82%)
>
> diff --git a/meta/recipes-devtools/python/python3-attrs_23.1.0.bb
> b/meta/recipes-devtools/python/python3-attrs_23.2.0.bb
> similarity index 82%
> rename from meta/recipes-devtools/python/python3-attrs_23.1.0.bb
> rename to meta/recipes-devtools/python/python3-attrs_23.2.0.bb
> index 314053de081..e00e1520156 100644
> --- a/meta/recipes-devtools/python/python3-attrs_23.1.0.bb
> +++ b/meta/recipes-devtools/python/python3-attrs_23.2.0.bb
> @@ -3,7 +3,7 @@ HOMEPAGE =3D "http://www.attrs.org/"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5e55731824cf9205cfabeab9a0600=
887"
>
> -SRC_URI[sha256sum] =3D
> "6279836d581513a26f1bf235f9acd333bc9115683f14f7e8fae46c98fc50e015"
> +SRC_URI[sha256sum] =3D
> "935dc3b529c262f6cf76e50877d35a4bd3c1de194fd41f47a2b7ae8f19971f30"
>
>  inherit pypi python_hatchling
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193377):
> https://lists.openembedded.org/g/openembedded-core/message/193377
> Mute This Topic: https://lists.openembedded.org/mt/103548100/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000017dc4d060e3a4c45
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ignore this one, since it has already been addressed by:<b=
r><a href=3D"https://patchwork.yoctoproject.org/project/oe-core/patch/17042=
71378-18012-1-git-send-email-wangmy@fujitsu.com/">https://patchwork.yoctopr=
oject.org/project/oe-core/patch/1704271378-18012-1-git-send-email-wangmy@fu=
jitsu.com/</a><br><div><br></div><div>But please take 2/2 for ptest.</div><=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Fri, Jan 5, 2024 at 10:17=E2=80=AFAM Tim Orling via <a href=3D"http://lis=
ts.openembedded.org">lists.openembedded.org</a> &lt;ticotimo=3D<a href=3D"m=
ailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><a =
href=3D"https://www.attrs.org/en/stable/changelog.html" rel=3D"noreferrer" =
target=3D"_blank">https://www.attrs.org/en/stable/changelog.html</a><br>
<br>
23.2.0 - 2023-12-31<br>
<br>
Changes<br>
* The type annotation for attrs.resolve_types() is now correct. #1141<br>
* Type stubs now use typing.dataclass_transform to decorate dataclass-like<=
br>
=C2=A0 decorators, instead of the non-standard __dataclass_transform__ spec=
ial<br>
=C2=A0 form, which is only supported by Pyright. #1158<br>
* Fixed serialization of namedtuple fields using attrs.asdict/astuple() wit=
h<br>
=C2=A0 retain_collection_types=3DTrue. #1165<br>
* attrs.AttrsInstance is now a typing.Protocol in both type hints and code.=
<br>
=C2=A0 This allows you to subclass it along with another Protocol. #1172<br=
>
* If attrs detects that __attrs_pre_init__ accepts more than just self, it<=
br>
=C2=A0 will call it with the same arguments as __init__ was called. This al=
lows<br>
=C2=A0 you to, for example, pass arguments to super().__init__(). #1187<br>
* Slotted classes now transform functools.cached_property decorated methods=
<br>
=C2=A0 to support equivalent semantics. #1200<br>
* Added class_body argument to attrs.make_class() to provide additional<br>
=C2=A0 attributes for newly created classes. It is, for example, now possib=
le to<br>
=C2=A0 attach methods. #1203<br>
<br>
Signed-off-by: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.com" ta=
rget=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
---<br>
Requires python3-hatch-fancy-pypi-readme upgrade beyond 23.1.0<br>
<a href=3D"https://patchwork.yoctoproject.org/project/oe-core/patch/1704180=
223-8624-1-git-send-email-wangmy@fujitsu.com/" rel=3D"noreferrer" target=3D=
"_blank">https://patchwork.yoctoproject.org/project/oe-core/patch/170418022=
3-8624-1-git-send-email-wangmy@fujitsu.com/</a><br>
<br>
=C2=A0.../python/{<a href=3D"http://python3-attrs_23.1.0.bb" rel=3D"norefer=
rer" target=3D"_blank">python3-attrs_23.1.0.bb</a> =3D&gt; <a href=3D"http:=
//python3-attrs_23.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-att=
rs_23.2.0.bb</a>} | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta/recipes-devtools/python/{<a href=3D"http://python3-attrs_=
23.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-attrs_23.1.0.bb</a>=
 =3D&gt; <a href=3D"http://python3-attrs_23.2.0.bb" rel=3D"noreferrer" targ=
et=3D"_blank">python3-attrs_23.2.0.bb</a>} (82%)<br>
<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-attrs_2=
3.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-attrs_23.1.0.bb</a> =
b/meta/recipes-devtools/python/<a href=3D"http://python3-attrs_23.2.0.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-attrs_23.2.0.bb</a><br>
similarity index 82%<br>
rename from meta/recipes-devtools/python/<a href=3D"http://python3-attrs_23=
.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-attrs_23.1.0.bb</a><b=
r>
rename to meta/recipes-devtools/python/<a href=3D"http://python3-attrs_23.2=
.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-attrs_23.2.0.bb</a><br>
index 314053de081..e00e1520156 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3-attrs_23.1.0.b=
b" rel=3D"noreferrer" target=3D"_blank">python3-attrs_23.1.0.bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-attrs_23.2.0.b=
b" rel=3D"noreferrer" target=3D"_blank">python3-attrs_23.2.0.bb</a><br>
@@ -3,7 +3,7 @@ HOMEPAGE =3D &quot;<a href=3D"http://www.attrs.org/" rel=3D=
"noreferrer" target=3D"_blank">http://www.attrs.org/</a>&quot;<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D5e55731824cf9205cfabe=
ab9a0600887&quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;6279836d581513a26f1bf235f9acd333bc9115683f14f=
7e8fae46c98fc50e015&quot;<br>
+SRC_URI[sha256sum] =3D &quot;935dc3b529c262f6cf76e50877d35a4bd3c1de194fd41=
f47a2b7ae8f19971f30&quot;<br>
<br>
=C2=A0inherit pypi python_hatchling<br>
<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#193377): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/193377" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/193377</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/103548100/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/103548100/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000017dc4d060e3a4c45--

