Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A9B3C4345F
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 19:14:15 +0000 (UTC)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
 by mx.groups.io with SMTP id smtpd.web10.22851.1713381250101089819
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Apr 2024 12:14:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Yhy+/YAj;
 spf=pass (domain: gmail.com, ip: 209.85.217.53, mailfrom: raj.khem@gmail.com)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-479ffac091dso29761137.2
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Apr 2024 12:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713381249; x=1713986049; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fmRy+hxjJt0ZW91XC+JdT7DXNYdcwXyN4bjoYU7TFkY=;
        b=Yhy+/YAjZ+J5XWetkNwTls+68Z/LiAfNpHoRVqRz8jWwPCTCsWRL4IZ1nw9Zn2tywG
         xZSl3eu8w1/8ikNGdaqmrJGhB8spn6YqxC9w5Qp8/rCI2hbWb+m/rKnmp7lVIuQ0+zL4
         aN/kPQoS55RJirzLX5Ixx/YjwUqAY5wdahV1XABFrQkhqLN4V1y3nKafl+aXYZ+gqP8b
         QRWDsohe6O9ioZum5jyV47nikV8ILN8OXuHbkCuhMDOVEJO8vMpDnj06wvhVpDzFVFPW
         r6+UVctknNQfKg0sO6dzZc8WE2wGspUCjYdgJ9lbimZb++ZsZrz5GevznS3DmhVaFn2A
         pmDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713381249; x=1713986049;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fmRy+hxjJt0ZW91XC+JdT7DXNYdcwXyN4bjoYU7TFkY=;
        b=TNO+0RBOqYHImcaQ9eD26tOsOvCiOsGfVq98AX6wQJSgjRTLsM0UR/xQY7Lk2g4a52
         4/vIF3Ilefli8WMFT7XcCSml/Ui6UnuCS0tj2Pr8NtqGlkMECx2JT6dDSjpiv8JRMTah
         xuVKI/nV2uSIXWMhSABu7R/vdNVKnf9PUd5fGwev17isgV8FOjXLNi65KjRWA83bTFpB
         OKBjlk1pPuG5KZpfHtmxA2jVCh5xG5QO6Uy2WCDTTG+Sw7vhjCLlof3UvEQlO6qv/IDq
         1FY4Wy9pt6mesNb26Sopg5lojyVvrvPfpbUlRxZ/HlGFuIS/aBw1P+RB8f2eIEwtCofB
         kfYA==
X-Gm-Message-State: AOJu0YwX2YIYAD3nl85zAa7l9jBkPGyOdeDRqx9m09esm3Mc42VMQdLz
	KSsnE+g/vfykEQjun9plb2EOxuuZcrZxDpFWFkl637zM7JQ47gqVWgTx9vfWBQxLCcCZtxqJYJU
	Ea14D/2OUEDp0ydJgJHW4aXdcG1c8CPSB
X-Google-Smtp-Source: AGHT+IEY0hOMIb3iCVrNOxbYV2HAf4FQ7W8kimv/mRQNLZXEt/AQM4LjAdoi4DAdN0t5ZxW2LuPx/0lq1LuY4mOCBCA=
X-Received: by 2002:a05:6102:6c1:b0:47b:a44a:baeb with SMTP id
 m1-20020a05610206c100b0047ba44abaebmr607841vsg.31.1713381248925; Wed, 17 Apr
 2024 12:14:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240417112444.395440-1-daniel.klauer@gin.de>
In-Reply-To: <20240417112444.395440-1-daniel.klauer@gin.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 17 Apr 2024 12:13:57 -0700
Message-ID: <CAMKF1sq24dcWjAKkT5C4=bSER7wfvcrbaQb1YfFacVk=f2iv_Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cmake.bbclass: Add ${COREBASE}/scripts to CMAKE_FIND_ROOT_PATH
To: daniel.klauer@gin.de
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b50c9706164fa885"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Apr 2024 19:14:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198475

--000000000000b50c9706164fa885
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 17, 2024 at 4:25=E2=80=AFAM Daniel Klauer via lists.openembedde=
d.org
<daniel.klauer=3Dgin.de@lists.openembedded.org> wrote:

> ${COREBASE}/scripts contains a "git" wrapper disabling fakeroot/pseudo.
> This patch allows CMake to find ${COREBASE}/scripts/git instead of
> ${HOSTTOOLS_DIR}/git. This is needed for git invocations during do_instal=
l,
> since do_install is a fakeroot task, and otherwise all git commands fail
> with "fatal: detected dubious ownership in repository ...".
>
> I don't know how common it is for CMake projects to invoke git during the
> install phase intentionally. It's probably more common to do this during
> the configure phase. However, the install step may re-run the configure
> step, if some dependencies changed.


If a package build system has such dependencies they should be better
expressed in recipes and linked using bitbake task level dependency
mechanism

I wonder why git is needed during install phase
Can you explain a bit more on that

And since change it in a class it means it has to be a pattern


>
> In my case, this happened in incremental Yocto builds which reran
> do_install and repopulated parts of the recipe-sysroot during that,
> without first rerunning do_configure or do_compile. One of the dependenci=
es
> changed (but only changing a file in some unrelated sub-package of it whi=
ch
> was not even installed into the recipe-sysroot), causing the dependant's
> recipe-sysroot to be repopulated during do_install and thus causing the
> CMake project to be reconfigured during do_install.
>
> Signed-off-by: Daniel Klauer <daniel.klauer@gin.de>
> ---
>  meta/classes-recipe/cmake.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/cmake.bbclass
> b/meta/classes-recipe/cmake.bbclass
> index 3d3781ef33..e1c3d7ddb5 100644
> --- a/meta/classes-recipe/cmake.bbclass
> +++ b/meta/classes-recipe/cmake.bbclass
> @@ -124,7 +124,7 @@ set( CMAKE_CXX_LINK_FLAGS "${OECMAKE_CXX_LINK_FLAGS}"
> CACHE STRING "LDFLAGS" )
>
>  # only search in the paths provided so cmake doesnt pick
>  # up libraries and tools from the native build machine
> -set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_HOST} ${STAGING_DIR_NATIVE}
> ${CROSS_DIR} ${OECMAKE_PERLNATIVE_DIR} ${OECMAKE_EXTRA_ROOT_PATH}
> ${EXTERNAL_TOOLCHAIN} ${HOSTTOOLS_DIR})
> +set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_HOST} ${STAGING_DIR_NATIVE}
> ${CROSS_DIR} ${OECMAKE_PERLNATIVE_DIR} ${OECMAKE_EXTRA_ROOT_PATH}
> ${EXTERNAL_TOOLCHAIN} ${COREBASE}/scripts ${HOSTTOOLS_DIR} )
>  set( CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY )
>  set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM
> ${OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM} )
>  set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY )
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#198462):
> https://lists.openembedded.org/g/openembedded-core/message/198462
> Mute This Topic: https://lists.openembedded.org/mt/105575001/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000b50c9706164fa885
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Apr 17, 2024 at 4:25=E2=80=AFAM Daniel Klauer via <=
a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;dan=
iel.klauer=3D<a href=3D"mailto:gin.de@lists.openembedded.org">gin.de@lists.=
openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">${C=
OREBASE}/scripts contains a &quot;git&quot; wrapper disabling fakeroot/pseu=
do.<br>
This patch allows CMake to find ${COREBASE}/scripts/git instead of<br>
${HOSTTOOLS_DIR}/git. This is needed for git invocations during do_install,=
<br>
since do_install is a fakeroot task, and otherwise all git commands fail<br=
>
with &quot;fatal: detected dubious ownership in repository ...&quot;.<br>
<br>
I don&#39;t know how common it is for CMake projects to invoke git during t=
he<br>
install phase intentionally. It&#39;s probably more common to do this durin=
g<br>
the configure phase. However, the install step may re-run the configure<br>
step, if some dependencies changed.</blockquote><div dir=3D"auto"><br></div=
><div dir=3D"auto">If a package build system has such dependencies they sho=
uld be better expressed in recipes and linked using bitbake task level depe=
ndency mechanism=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">I=
 wonder why git is needed during install phase</div><div dir=3D"auto">Can y=
ou explain a bit more on that=C2=A0</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">And since change it in a class it means it has to be a pattern=
=C2=A0</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=
=3D"auto"><br>
<br>
In my case, this happened in incremental Yocto builds which reran<br>
do_install and repopulated parts of the recipe-sysroot during that,<br>
without first rerunning do_configure or do_compile. One of the dependencies=
<br>
changed (but only changing a file in some unrelated sub-package of it which=
<br>
was not even installed into the recipe-sysroot), causing the dependant&#39;=
s<br>
recipe-sysroot to be repopulated during do_install and thus causing the<br>
CMake project to be reconfigured during do_install.<br>
<br>
Signed-off-by: Daniel Klauer &lt;<a href=3D"mailto:daniel.klauer@gin.de" ta=
rget=3D"_blank">daniel.klauer@gin.de</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/cmake.bbclass | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes-recipe/cmake.bbclass b/meta/classes-recipe/cmake.=
bbclass<br>
index 3d3781ef33..e1c3d7ddb5 100644<br>
--- a/meta/classes-recipe/cmake.bbclass<br>
+++ b/meta/classes-recipe/cmake.bbclass<br>
@@ -124,7 +124,7 @@ set( CMAKE_CXX_LINK_FLAGS &quot;${OECMAKE_CXX_LINK_FLAG=
S}&quot; CACHE STRING &quot;LDFLAGS&quot; )<br>
<br>
=C2=A0# only search in the paths provided so cmake doesnt pick<br>
=C2=A0# up libraries and tools from the native build machine<br>
-set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_HOST} ${STAGING_DIR_NATIVE} ${CROS=
S_DIR} ${OECMAKE_PERLNATIVE_DIR} ${OECMAKE_EXTRA_ROOT_PATH} ${EXTERNAL_TOOL=
CHAIN} ${HOSTTOOLS_DIR})<br>
+set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_HOST} ${STAGING_DIR_NATIVE} ${CROS=
S_DIR} ${OECMAKE_PERLNATIVE_DIR} ${OECMAKE_EXTRA_ROOT_PATH} ${EXTERNAL_TOOL=
CHAIN} ${COREBASE}/scripts ${HOSTTOOLS_DIR} )<br>
=C2=A0set( CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY )<br>
=C2=A0set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ${OECMAKE_FIND_ROOT_PATH_MODE_=
PROGRAM} )<br>
=C2=A0set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY )<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#198462): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/198462" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/198462</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/105575001/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/105575001/1997914</a><br>
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

--000000000000b50c9706164fa885--

