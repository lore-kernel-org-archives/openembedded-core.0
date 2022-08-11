Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84F0AC25B0C
	for <webhook@archiver.kernel.org>; Thu, 11 Aug 2022 16:22:00 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.8670.1660234917213484783
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Aug 2022 09:21:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DhkRxHXi;
 spf=pass (domain: gmail.com, ip: 209.85.128.53,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id
 d24-20020a1c7318000000b003a5c1bf4f27so879275wmb.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Aug 2022 09:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=/Y0evJRdSOsAAnvZJDrUOUKd4zm0f9Bc/WALBcDktvk=;
        b=DhkRxHXiUY6BKs2iPbm3yWBK8VATISTqoaehi/QeTeESoJ6UYxrNxskBImoOZOlgz9
         jURdwc/10rE61nbLBeXxKw3smLy/77Myrp0x8Lt4T5vzDJY/P1iEtCe9UmpbSQMVIqAu
         x8Efr6kq0Wxqli/FLnUiQcJRfYSkeTbABEGplfhE6rURi8wgObNga1g/wZtFJ6T7Tl5G
         3XSZejJKRR7bWzUIy1ca04W7D6xIbIbswzARVaAOWEaVOukh4IbpeIxg6tOV3QI4cPCo
         jZwKs6klDkQvP4LU90coFQtFoHcFFskvPWhLNqRWP8ATcxrUL2gKHlsb1Hn6vxnagYZi
         Cp+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=/Y0evJRdSOsAAnvZJDrUOUKd4zm0f9Bc/WALBcDktvk=;
        b=VO2XpzQb+EJQ8IbgKahtLHcAiIiCueKJiztELAmCjT+Y3q+OTea/lC/7HHWk5IHiDP
         7bi71p6eUqsZaZnXa5Ty/qI0I01cyg9+tuFHnl4YKRpg6Zx+XQ6BPIVlueUDzXyCiUty
         76XYWR91uqVMlOg4LrWfM4Nrsg9kL6RU9t8Kf1q0+ts5yHRpkXZpkMbElv+FUe2sgrNx
         QEtrOhTQkfMyzmKE2UBr4CFux5YD9yaFAJ+4517T15hL2kPsiWkZHKc9CRzBOYHyeVNP
         7Q0IB1Ym0V0J+yWWy3Inh4sQ4EvOFVSGhCtqT4dXu5zGjZ0DaDVsnMpsf1Ccg25zeHcj
         9Hmg==
X-Gm-Message-State: ACgBeo0X+Uoxlfo7pkQDi4UQ5JjpjmoA1UvzcD0WzroTcgl7CsjCkoY5
	H7CfUeU1C8nbsZY9IHXP9TfTx4kKzOK4VCJQt14=
X-Google-Smtp-Source: 
 AA6agR6/8zdJE3cc4Y45I9+7IdqigOXuLrJVJebBDFVOa1vso6o/JSO4EfZrNPiQMl4h3mHyrFBvvvfbDCZiBtqtJvM=
X-Received: by 2002:a1c:7c18:0:b0:3a5:aaae:d203 with SMTP id
 x24-20020a1c7c18000000b003a5aaaed203mr6342614wmc.2.1660234915468; Thu, 11 Aug
 2022 09:21:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220809145042.1789552-1-raj.khem@gmail.com>
In-Reply-To: <20220809145042.1789552-1-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 11 Aug 2022 18:21:07 +0200
Message-ID: 
 <CA+chaQebygH34uZ0bwiUdMKrBV3Wsnx-G8Muv4zmFZR7kjAuGA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glibc: Update patch status
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000615b2705e5f990b8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Aug 2022 16:22:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169254

--000000000000615b2705e5f990b8
Content-Type: text/plain; charset="UTF-8"

The 2nd more important part was backported to 2.36 branch
https://sourceware.org/git/?p=glibc.git;a=commit;h=302bc33bc53c787da6e74162a7092e9c0fb964a8

If you plan to do another SRCREV bump before glibc upgrade is merged, then
we can drop these 2 changes. (I'll try to do another build tests with
DEBUG_BUILD, but probably next week or so).

On Tue, Aug 9, 2022 at 4:50 PM Khem Raj <raj.khem@gmail.com> wrote:

> These patches were appplied in master
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../0026-x86-Fix-define-STRCPY-guard-in-strcpy-sse2.S.patch     | 2 +-
>  .../0027-elf-Replace-strcpy-call-with-memcpy-BZ-29454.patch     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git
> a/meta/recipes-core/glibc/glibc/0026-x86-Fix-define-STRCPY-guard-in-strcpy-sse2.S.patch
> b/meta/recipes-core/glibc/glibc/0026-x86-Fix-define-STRCPY-guard-in-strcpy-sse2.S.patch
> index 2d14a4c6196..2caff3a0d53 100644
> ---
> a/meta/recipes-core/glibc/glibc/0026-x86-Fix-define-STRCPY-guard-in-strcpy-sse2.S.patch
> +++
> b/meta/recipes-core/glibc/glibc/0026-x86-Fix-define-STRCPY-guard-in-strcpy-sse2.S.patch
> @@ -7,7 +7,7 @@ Subject: [PATCH] x86: Fix `#define STRCPY` guard in
> strcpy-sse2.S
>  defined.  It doesn't end up mattering as the whole check is
>  guarded by `#if IS_IN (libc)` but is incorrect none the less.
>
> -Upstream-Status: Submitted [
> https://sourceware.org/bugzilla/show_bug.cgi?id=29454
> https://sourceware.org/pipermail/libc-alpha/2022-August/141289.html]
> +Upstream-Status: Backport [
> https://sourceware.org/git/?p=glibc.git;a=commit;h=312ded0d6339e8c463d0395397b5825401b14f54
> ]
>  Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>  ---
>   sysdeps/x86_64/multiarch/strcpy-sse2.S | 2 +-
> diff --git
> a/meta/recipes-core/glibc/glibc/0027-elf-Replace-strcpy-call-with-memcpy-BZ-29454.patch
> b/meta/recipes-core/glibc/glibc/0027-elf-Replace-strcpy-call-with-memcpy-BZ-29454.patch
> index 1b347b33226..a2c951ad936 100644
> ---
> a/meta/recipes-core/glibc/glibc/0027-elf-Replace-strcpy-call-with-memcpy-BZ-29454.patch
> +++
> b/meta/recipes-core/glibc/glibc/0027-elf-Replace-strcpy-call-with-memcpy-BZ-29454.patch
> @@ -8,7 +8,7 @@ strlen_pass::handle_builtin_strcpy but only for optimized
>  build. To avoid needing to include strcpy.S in the rtld build to
>  support the debug build, just do the optimization by hand.
>
> -Upstream-Status: Submitted [
> https://sourceware.org/bugzilla/show_bug.cgi?id=29454
> https://sourceware.org/pipermail/libc-alpha/2022-August/141290.html]
> +Upstream-Status: Backport [
> https://sourceware.org/git/?p=glibc.git;a=commit;h=483cfe1a6a33d6335b1901581b41040d2d412511
> ]
>  Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>  ---
>   elf/dl-cache.c | 5 +++--
> --
> 2.37.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169155):
> https://lists.openembedded.org/g/openembedded-core/message/169155
> Mute This Topic: https://lists.openembedded.org/mt/92916378/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000615b2705e5f990b8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The 2nd more important part was backported to 2.36 branch=
=C2=A0<a href=3D"https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D3=
02bc33bc53c787da6e74162a7092e9c0fb964a8">https://sourceware.org/git/?p=3Dgl=
ibc.git;a=3Dcommit;h=3D302bc33bc53c787da6e74162a7092e9c0fb964a8</a><div><br=
></div><div>If you plan to do another SRCREV bump before glibc upgrade is m=
erged, then we can drop these 2 changes. (I&#39;ll try to do another build =
tests with DEBUG_BUILD, but probably next week or so).</div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 9, =
2022 at 4:50 PM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">These patches were appplied in master<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../0026-x86-Fix-define-STRCPY-guard-in-strcpy-sse2.S.patch=C2=A0 =C2=
=A0 =C2=A0| 2 +-<br>
=C2=A0.../0027-elf-Replace-strcpy-call-with-memcpy-BZ-29454.patch=C2=A0 =C2=
=A0 =C2=A0| 2 +-<br>
=C2=A02 files changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/glibc/glibc/0026-x86-Fix-define-STRCPY-guard=
-in-strcpy-sse2.S.patch b/meta/recipes-core/glibc/glibc/0026-x86-Fix-define=
-STRCPY-guard-in-strcpy-sse2.S.patch<br>
index 2d14a4c6196..2caff3a0d53 100644<br>
--- a/meta/recipes-core/glibc/glibc/0026-x86-Fix-define-STRCPY-guard-in-str=
cpy-sse2.S.patch<br>
+++ b/meta/recipes-core/glibc/glibc/0026-x86-Fix-define-STRCPY-guard-in-str=
cpy-sse2.S.patch<br>
@@ -7,7 +7,7 @@ Subject: [PATCH] x86: Fix `#define STRCPY` guard in strcpy-=
sse2.S<br>
=C2=A0defined.=C2=A0 It doesn&#39;t end up mattering as the whole check is<=
br>
=C2=A0guarded by `#if IS_IN (libc)` but is incorrect none the less.<br>
<br>
-Upstream-Status: Submitted [<a href=3D"https://sourceware.org/bugzilla/sho=
w_bug.cgi?id=3D29454" rel=3D"noreferrer" target=3D"_blank">https://sourcewa=
re.org/bugzilla/show_bug.cgi?id=3D29454</a> <a href=3D"https://sourceware.o=
rg/pipermail/libc-alpha/2022-August/141289.html" rel=3D"noreferrer" target=
=3D"_blank">https://sourceware.org/pipermail/libc-alpha/2022-August/141289.=
html</a>]<br>
+Upstream-Status: Backport [<a href=3D"https://sourceware.org/git/?p=3Dglib=
c.git;a=3Dcommit;h=3D312ded0d6339e8c463d0395397b5825401b14f54" rel=3D"noref=
errer" target=3D"_blank">https://sourceware.org/git/?p=3Dglibc.git;a=3Dcomm=
it;h=3D312ded0d6339e8c463d0395397b5825401b14f54</a>]<br>
=C2=A0Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.=
com" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
=C2=A0---<br>
=C2=A0 sysdeps/x86_64/multiarch/strcpy-sse2.S | 2 +-<br>
diff --git a/meta/recipes-core/glibc/glibc/0027-elf-Replace-strcpy-call-wit=
h-memcpy-BZ-29454.patch b/meta/recipes-core/glibc/glibc/0027-elf-Replace-st=
rcpy-call-with-memcpy-BZ-29454.patch<br>
index 1b347b33226..a2c951ad936 100644<br>
--- a/meta/recipes-core/glibc/glibc/0027-elf-Replace-strcpy-call-with-memcp=
y-BZ-29454.patch<br>
+++ b/meta/recipes-core/glibc/glibc/0027-elf-Replace-strcpy-call-with-memcp=
y-BZ-29454.patch<br>
@@ -8,7 +8,7 @@ strlen_pass::handle_builtin_strcpy but only for optimized<b=
r>
=C2=A0build. To avoid needing to include strcpy.S in the rtld build to<br>
=C2=A0support the debug build, just do the optimization by hand.<br>
<br>
-Upstream-Status: Submitted [<a href=3D"https://sourceware.org/bugzilla/sho=
w_bug.cgi?id=3D29454" rel=3D"noreferrer" target=3D"_blank">https://sourcewa=
re.org/bugzilla/show_bug.cgi?id=3D29454</a> <a href=3D"https://sourceware.o=
rg/pipermail/libc-alpha/2022-August/141290.html" rel=3D"noreferrer" target=
=3D"_blank">https://sourceware.org/pipermail/libc-alpha/2022-August/141290.=
html</a>]<br>
+Upstream-Status: Backport [<a href=3D"https://sourceware.org/git/?p=3Dglib=
c.git;a=3Dcommit;h=3D483cfe1a6a33d6335b1901581b41040d2d412511" rel=3D"noref=
errer" target=3D"_blank">https://sourceware.org/git/?p=3Dglibc.git;a=3Dcomm=
it;h=3D483cfe1a6a33d6335b1901581b41040d2d412511</a>]<br>
=C2=A0Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.=
com" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
=C2=A0---<br>
=C2=A0 elf/dl-cache.c | 5 +++--<br>
-- <br>
2.37.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#169155): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/169155" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/169155</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/92916378/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/92916378/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" ta=
rget=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000615b2705e5f990b8--

