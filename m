Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8292C4345F
	for <webhook@archiver.kernel.org>; Sun,  5 May 2024 19:22:49 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web11.4680.1714936960435578403
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 May 2024 12:22:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XREqwDvN;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-22ed075a629so861944fac.3
        for <openembedded-core@lists.openembedded.org>; Sun, 05 May 2024 12:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714936960; x=1715541760; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hhyu+QvWDnrx5er8BC20ZUZ0OU9IYww1VDKCb17iPhI=;
        b=XREqwDvNP38TtLPEBUfKsk0AL6lB+R7HOD/8jETGhEmfBQmSxCv0CLGoIaTePp4JSo
         aa0c3AWJ3OHP318o88mU9+QrgBNjs+aJoPLbLjSmf38qNMAynrVui96sFxGc8P1AvhFO
         ZFSRPNkLKGwV8iqAWelCyJCDYawaBTy1CjqstUFmWNgeEPw9/tHX7AaUp/cX+X+6OTWC
         UucbZPlyuFdokd/jMt9sBw9PRJyKVFl7Jkhgp81xQJDWHxvtW8pYzVS5Zcl4ZETXriX1
         DhF6GHsmakOtJuBvXMkK7OYLEqtbDfZcMULgwsqq4HWhbS3h78oHU3qahX1HwFj20pvx
         LiIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714936960; x=1715541760;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hhyu+QvWDnrx5er8BC20ZUZ0OU9IYww1VDKCb17iPhI=;
        b=YmCKqMo5ZFF1vFfRcZlEWUZsTT8uf1Zwimjf9kWHHQsluAaV2YB0H/lLmzP33dkKMA
         OoQvL+ApcpcXwMQjFFZmb3Wq2yezqKCITOSQzNI/jDBj6/kA37ouz0eqfarNAnHrV7sT
         XMIg/1Cc38rK1kVmMAPM2vZeM34YLoyZ+hAG7HCJgbMtG6Q08KTdcAu7K6u8p86CKH8u
         OfKD5Ck76LuJeHJVhuv8fIR+D1ia3Fk/EFUPkq8tYhaX/bpAScGqa8a6ZjJt+TdE1GR9
         vhBZ/wxXgrYMTOeLX6UkF7TaUjDF8Q2tx24DpgZb+MS96kR3MQbbL6PGjqzHK+f0Ifl8
         gPFw==
X-Gm-Message-State: AOJu0YzrgG/V5lxuaTuE7pYknRagPbGZ2NUiWyJvSrWo0PiFggvQZ/oM
	M7QBULTw9nA+Fewx2LF0ra3VyF8fFey7HidwShnNSKe1fgh1mibWTZ2q6pV0wNkKz9ZePRasafQ
	zRSaAueAm0hS+O7LAupU7g8WzRik=
X-Google-Smtp-Source: AGHT+IGRG7b06WuuJFoX/2/vpsKxtfPHEQGJe3vLT9htY0nt1IaRgK31xbTHlSjx3pIaf5SL/uGtFRXjVLdYQiIi1SQ=
X-Received: by 2002:a05:6870:d24a:b0:22e:c434:ec with SMTP id
 h10-20020a056870d24a00b0022ec43400ecmr10149536oac.56.1714936959379; Sun, 05
 May 2024 12:22:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240505091720.8682-1-peter.marko@siemens.com>
In-Reply-To: <20240505091720.8682-1-peter.marko@siemens.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 5 May 2024 12:22:28 -0700
Message-ID: <CAMKF1sp1=f6Akrn2NeYtS6EuOO+_PVxpbc+oSCNyFSVsKnktDg@mail.gmail.com>
Subject: Re: [OE-core][PATCH] glibc: correct license
To: peter.marko@siemens.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000046b16c0617b9e087"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 May 2024 19:22:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199025

--00000000000046b16c0617b9e087
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 5, 2024 at 2:18=E2=80=AFAM Peter Marko via lists.openembedded.o=
rg
<peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:

> From: Peter Marko <peter.marko@siemens.com>
>
> The license per https://www.gnu.org/software/libc/ is LGPL-2.1-or-later.
>
> https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommitdiff;h=3D273a835fe7c6=
85cc54266bb8b502787bad5e9bae
> converted last LGPL-2.1-only references.
>
> License-Update: correction
>

This should reflect reason but overall the patch is ok


> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta/recipes-core/glibc/glibc-common.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/glibc/glibc-common.inc
> b/meta/recipes-core/glibc/glibc-common.inc
> index b9516e77f0..91a3f5bcd5 100644
> --- a/meta/recipes-core/glibc/glibc-common.inc
> +++ b/meta/recipes-core/glibc/glibc-common.inc
> @@ -2,7 +2,7 @@ SUMMARY =3D "GLIBC (GNU C Library)"
>  DESCRIPTION =3D "The GNU C Library is used as the system C library in mo=
st
> systems with the Linux kernel."
>  HOMEPAGE =3D "http://www.gnu.org/software/libc/libc.html"
>  SECTION =3D "libs"
> -LICENSE =3D "GPL-2.0-only & LGPL-2.1-only"
> +LICENSE =3D "GPL-2.0-only & LGPL-2.1-or-later"
>
>  LIC_FILES_CHKSUM ?=3D "file://LICENSES;md5=3Df77e878d320e99e94ae9a4aea7f=
491d1
> \
>        file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
> --
> 2.30.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199017):
> https://lists.openembedded.org/g/openembedded-core/message/199017
> Mute This Topic: https://lists.openembedded.org/mt/105919323/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000046b16c0617b9e087
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, May 5, 2024 at 2:18=E2=80=AFAM Peter Marko via <a h=
ref=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;peter.=
marko=3D<a href=3D"mailto:siemens.com@lists.openembedded.org">siemens.com@l=
ists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">From: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.com" target=
=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
<br>
The license per <a href=3D"https://www.gnu.org/software/libc/" rel=3D"noref=
errer" target=3D"_blank">https://www.gnu.org/software/libc/</a> is LGPL-2.1=
-or-later.<br>
<a href=3D"https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommitdiff;h=3D273=
a835fe7c685cc54266bb8b502787bad5e9bae" rel=3D"noreferrer" target=3D"_blank"=
>https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommitdiff;h=3D273a835fe7c68=
5cc54266bb8b502787bad5e9bae</a><br>
converted last LGPL-2.1-only references.<br>
<br>
License-Update: correction<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">This should refl=
ect reason but overall the patch is ok</div><div dir=3D"auto"><br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex"><br>
Signed-off-by: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.com" t=
arget=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/glibc/glibc-common.inc | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-core/glibc/glibc-common.inc b/meta/recipes-core/g=
libc/glibc-common.inc<br>
index b9516e77f0..91a3f5bcd5 100644<br>
--- a/meta/recipes-core/glibc/glibc-common.inc<br>
+++ b/meta/recipes-core/glibc/glibc-common.inc<br>
@@ -2,7 +2,7 @@ SUMMARY =3D &quot;GLIBC (GNU C Library)&quot;<br>
=C2=A0DESCRIPTION =3D &quot;The GNU C Library is used as the system C libra=
ry in most systems with the Linux kernel.&quot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"http://www.gnu.org/software/libc/libc.h=
tml" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.org/software/libc/=
libc.html</a>&quot;<br>
=C2=A0SECTION =3D &quot;libs&quot;<br>
-LICENSE =3D &quot;GPL-2.0-only &amp; LGPL-2.1-only&quot;<br>
+LICENSE =3D &quot;GPL-2.0-only &amp; LGPL-2.1-or-later&quot;<br>
<br>
=C2=A0LIC_FILES_CHKSUM ?=3D &quot;file://LICENSES;md5=3Df77e878d320e99e94ae=
9a4aea7f491d1 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4=
a4263 \<br>
-- <br>
2.30.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#199017): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/199017" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/199017</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/105919323/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/105919323/1997914</a><br>
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

--00000000000046b16c0617b9e087--

