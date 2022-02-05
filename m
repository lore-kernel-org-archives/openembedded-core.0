Return-Path: <ranjitsinhrathod1991@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32639C433EF
	for <webhook@archiver.kernel.org>; Sat,  5 Feb 2022 00:06:53 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web12.1270.1644019611722449555
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Feb 2022 16:06:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=a8P8xz2g;
 spf=pass (domain: gmail.com, ip: 209.85.218.50,
 mailfrom: ranjitsinhrathod1991@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id p15so23834325ejc.7
        for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Feb 2022 16:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Zh3R7Q1Lu4e12mLwgM0/19OeS4K2Cm/eJYBFCDHEmAw=;
        b=a8P8xz2gNKAqQR+3ZMpXoTMhdj40YDXFIv9jqYdMD/Y+4Z+U2NjFh6F24/C2I60L7m
         BcxsC4SJeXwzY5tPMg4rD+gdEbDt7Idibfs6A1XArUnljvZrX3DnGSA4sEHF8pCjqrkO
         9hlwwnDNtbXOYjN60aA+1jJePwcSjEmlEFBMoY5DCNVcsBvwHMvaHKp3HWW4hKdydMeo
         MCWaRApu0O1RBGqyIX6D5/GrCKJ2VoaImwKnojER324wTZm17F2HuPHZPSB19YJ5uPTj
         lZrP3VIQ3EV5Y8UjpV2ug4oBDaXrXSBpkaqJz5436KSCsV2pQn2rkQ+2YRexfPkYgl7X
         nfsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Zh3R7Q1Lu4e12mLwgM0/19OeS4K2Cm/eJYBFCDHEmAw=;
        b=oynixERzreKyiW3epDI7zfpgHs+kyZgRpGosHbHY7BBL6DL3goBYxdaBDDSFYzeuEw
         kZV2g8Pl0f3Nwqcc0jUw45AZw8sN90r2uhWzkAa+jDz8d0xlAM+euAuievzwZdIhX1gY
         buMpMQWdnn3xiWpINMvi3Lz0qqGYo7eVOttHTAqJDjsv1b5CcUjJ+TwB8iI/volDoeig
         jEQzFTaTNpc2e797n5C+AVpgoJZ1FDOfwuiUjV7YGfXoNQk/k+Fia3E3r9k18FjTAp6g
         gTIVZ6+IUFSTO/rCPpatZ767p4WQJnWovDcDh/2qaiCmZBRaWxdMc4iD8Iv0pTpc1XaJ
         oRSw==
X-Gm-Message-State: AOAM531N7RiybslUiAOCW7KjSLKnwpam+gRyn3X6tvvSu13egnViqcxH
	7JleTvB+/g96zcjAMbMjK21FkBv1WkcUFwmXm0U=
X-Google-Smtp-Source: 
 ABdhPJwoqa9K3ZW129Sl4HW4xDfZQV1Svlcl5fFNSiXGFR+vP9nL5692jUKKAe2rPhoPgr3x9G36LNdZNp1zeGzCOtg=
X-Received: by 2002:a17:906:71c2:: with SMTP id
 i2mr1142521ejk.409.1644019610047;
 Fri, 04 Feb 2022 16:06:50 -0800 (PST)
MIME-Version: 1.0
References: <cover.1643917717.git.steve@sakoman.com>
 <8785405a214b5af5da0b5deae559539531b1c237.1643917717.git.steve@sakoman.com>
In-Reply-To: 
 <8785405a214b5af5da0b5deae559539531b1c237.1643917717.git.steve@sakoman.com>
From: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
Date: Sat, 5 Feb 2022 05:36:37 +0530
Message-ID: 
 <CACpMEhNHsdTARC6GvPJmhPR5p0TL-NLqupJNc91XFuN_vm+r1A@mail.gmail.com>
Subject: Re: [OE-core][dunfell 01/20] glibc: update to lastest 2.31 release
 HEAD
To: Steve Sakoman <steve@sakoman.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000dc5a5d05d73a24fe"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Feb 2022 00:06:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161386

--000000000000dc5a5d05d73a24fe
Content-Type: text/plain; charset="UTF-8"

It seems in commit message you have mentioned 2 times CVE-2022-23218
instead of CVE-2022-23218 and CVE-2022-23219.

On Fri, 4 Feb, 2022, 1:21 am Steve Sakoman, <steve@sakoman.com> wrote:

> Includes the following fixes:
>
> 3ef8be9b89 CVE-2022-23218: Buffer overflow in sunrpc svcunix_create (bug
> 28768)
> e5c8da9826 <shlib-compat.h>: Support compat_symbol_reference for _ISOMAC
> 412aaf1522 sunrpc: Test case for clnt_create "unix" buffer overflow (bug
> 22542)
> c4c833d3dd CVE-2022-23219: Buffer overflow in sunrpc clnt_create for
> "unix" (bug 22542)
> 547b63bf6d socket: Add the __sockaddr_un_set function
> b061e95277 Revert "Fix __minimal_malloc segfaults in __mmap due to
> stack-protector"
> 95e206b67f Fix __minimal_malloc segfaults in __mmap due to stack-protector
> e26a2db141 gconv: Do not emit spurious NUL character in ISO-2022-JP-3 (bug
> 28524)
> 094618d401 x86_64: Remove unneeded static PIE check for undefined weak
> diagnostic
>
> Also add CVE-2022-23218 and CVE-2022-23218 to ignore list since they are
> fixed
> by the above changes.
>
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  meta/recipes-core/glibc/glibc-version.inc | 2 +-
>  meta/recipes-core/glibc/glibc_2.31.bb     | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/glibc/glibc-version.inc
> b/meta/recipes-core/glibc/glibc-version.inc
> index aac0d9b3bf..68efd09ece 100644
> --- a/meta/recipes-core/glibc/glibc-version.inc
> +++ b/meta/recipes-core/glibc/glibc-version.inc
> @@ -1,6 +1,6 @@
>  SRCBRANCH ?= "release/2.31/master"
>  PV = "2.31+git${SRCPV}"
> -SRCREV_glibc ?= "4f0a61f75385c9a5879cbe7202042e88f692a3c8"
> +SRCREV_glibc ?= "3ef8be9b89ef98300951741f381eb79126ac029f"
>  SRCREV_localedef ?= "cd9f958c4c94a638fa7b2b4e21627364f1a1a655"
>
>  GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
> diff --git a/meta/recipes-core/glibc/glibc_2.31.bb
> b/meta/recipes-core/glibc/glibc_2.31.bb
> index 4a545cb97d..0c37467fe4 100644
> --- a/meta/recipes-core/glibc/glibc_2.31.bb
> +++ b/meta/recipes-core/glibc/glibc_2.31.bb
> @@ -3,6 +3,7 @@ require glibc-version.inc
>
>  CVE_CHECK_WHITELIST += "CVE-2020-10029 CVE-2020-6096 CVE-2016-10228
> CVE-2020-1751 CVE-2020-1752 \
>                          CVE-2021-27645 CVE-2021-3326 CVE-2020-27618
> CVE-2020-29562 CVE-2019-25013 \
> +                        CVE-2022-23218 CVE-2022-23219 \
>  "
>
>  # glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010022
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#161296):
> https://lists.openembedded.org/g/openembedded-core/message/161296
> Mute This Topic: https://lists.openembedded.org/mt/88891348/6360406
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ranjitsinhrathod1991@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000dc5a5d05d73a24fe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>It seems in commit message you have mentioned 2 time=
s CVE-2022-23218 instead of CVE-2022-23218 and CVE-2022-23219.<br><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 4 Feb, =
2022, 1:21 am Steve Sakoman, &lt;<a href=3D"mailto:steve@sakoman.com">steve=
@sakoman.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Include=
s the following fixes:<br>
<br>
3ef8be9b89 CVE-2022-23218: Buffer overflow in sunrpc svcunix_create (bug 28=
768)<br>
e5c8da9826 &lt;shlib-compat.h&gt;: Support compat_symbol_reference for _ISO=
MAC<br>
412aaf1522 sunrpc: Test case for clnt_create &quot;unix&quot; buffer overfl=
ow (bug 22542)<br>
c4c833d3dd CVE-2022-23219: Buffer overflow in sunrpc clnt_create for &quot;=
unix&quot; (bug 22542)<br>
547b63bf6d socket: Add the __sockaddr_un_set function<br>
b061e95277 Revert &quot;Fix __minimal_malloc segfaults in __mmap due to sta=
ck-protector&quot;<br>
95e206b67f Fix __minimal_malloc segfaults in __mmap due to stack-protector<=
br>
e26a2db141 gconv: Do not emit spurious NUL character in ISO-2022-JP-3 (bug =
28524)<br>
094618d401 x86_64: Remove unneeded static PIE check for undefined weak diag=
nostic<br>
<br>
Also add CVE-2022-23218 and CVE-2022-23218 to ignore list since they are fi=
xed<br>
by the above changes.<br>
<br>
Signed-off-by: Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com" targe=
t=3D"_blank" rel=3D"noreferrer">steve@sakoman.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/glibc/glibc-version.inc | 2 +-<br>
=C2=A0meta/recipes-core/glibc/<a href=3D"http://glibc_2.31.bb" rel=3D"noref=
errer noreferrer" target=3D"_blank">glibc_2.31.bb</a>=C2=A0 =C2=A0 =C2=A0| =
1 +<br>
=C2=A02 files changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/=
glibc/glibc-version.inc<br>
index aac0d9b3bf..68efd09ece 100644<br>
--- a/meta/recipes-core/glibc/glibc-version.inc<br>
+++ b/meta/recipes-core/glibc/glibc-version.inc<br>
@@ -1,6 +1,6 @@<br>
=C2=A0SRCBRANCH ?=3D &quot;release/2.31/master&quot;<br>
=C2=A0PV =3D &quot;2.31+git${SRCPV}&quot;<br>
-SRCREV_glibc ?=3D &quot;4f0a61f75385c9a5879cbe7202042e88f692a3c8&quot;<br>
+SRCREV_glibc ?=3D &quot;3ef8be9b89ef98300951741f381eb79126ac029f&quot;<br>
=C2=A0SRCREV_localedef ?=3D &quot;cd9f958c4c94a638fa7b2b4e21627364f1a1a655&=
quot;<br>
<br>
=C2=A0GLIBC_GIT_URI ?=3D &quot;git://<a href=3D"http://sourceware.org/git/g=
libc.git" rel=3D"noreferrer noreferrer" target=3D"_blank">sourceware.org/gi=
t/glibc.git</a>&quot;<br>
diff --git a/meta/recipes-core/glibc/<a href=3D"http://glibc_2.31.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">glibc_2.31.bb</a> b/meta/recip=
es-core/glibc/<a href=3D"http://glibc_2.31.bb" rel=3D"noreferrer noreferrer=
" target=3D"_blank">glibc_2.31.bb</a><br>
index 4a545cb97d..0c37467fe4 100644<br>
--- a/meta/recipes-core/glibc/<a href=3D"http://glibc_2.31.bb" rel=3D"noref=
errer noreferrer" target=3D"_blank">glibc_2.31.bb</a><br>
+++ b/meta/recipes-core/glibc/<a href=3D"http://glibc_2.31.bb" rel=3D"noref=
errer noreferrer" target=3D"_blank">glibc_2.31.bb</a><br>
@@ -3,6 +3,7 @@ require glibc-version.inc<br>
<br>
=C2=A0CVE_CHECK_WHITELIST +=3D &quot;CVE-2020-10029 CVE-2020-6096 CVE-2016-=
10228 CVE-2020-1751 CVE-2020-1752 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0CVE-2021-27645 CVE-2021-3326 CVE-2020-27618 CVE-2020-29562=
 CVE-2019-25013 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 CVE-2022-23218 CVE-2022-23219 \<br>
=C2=A0&quot;<br>
<br>
=C2=A0# glibc <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=
=3DCVE-2019-1010022" rel=3D"noreferrer noreferrer" target=3D"_blank">https:=
//web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2019-1010022</a><br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#161296): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/161296" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/161296</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/88891348/6360=
406" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/mt/88891348/6360406</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:ranjitsinhratho=
d1991@gmail.com" target=3D"_blank" rel=3D"noreferrer">ranjitsinhrathod1991@=
gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div></div>

--000000000000dc5a5d05d73a24fe--

