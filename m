Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A773EE49A3
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 02:51:14 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web11.3566.1692759067650634770
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Aug 2023 19:51:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=s2bE6RJE;
 spf=pass (domain: gmail.com, ip: 209.85.219.178, mailfrom: ticotimo@gmail.com)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-d7260fae148so5143029276.1
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 19:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692759067; x=1693363867;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JdXJKg9PGfIn+UxWEJ9UET2P+bFWl1OsWm5Hlo8DMwI=;
        b=s2bE6RJE4paQGBgZ0DZeYqxBL9qbz4g+O5iRJSes9ZVCks52YTJeJQ8m379tOBsxKk
         YM3vZ/PDEHfEKtuU/JSQAMgbpwR3YdMEMwOQCjNRmP4c4GdKGWUsKO9sgI/TSaOizVmJ
         u2Rtq73eV+Xc1y3TGe5KJVPZW/hVU+OlkhlyGfaCRDY6MWq0AwN6pk/TXkGYbGmA3Cr6
         mPj/3BP9gts8DM+zQmdk0QOlIIEVE2geziUrQtpH2Wits09ueOogX3qZWTzGzS3ZgWQ2
         zLkJ5dPTPwkub+vwV//c9bXtiGyJBp2VwENuB/7QhuDHQDQ5uQJARkjwV/NlDib+MDh0
         JlKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692759067; x=1693363867;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JdXJKg9PGfIn+UxWEJ9UET2P+bFWl1OsWm5Hlo8DMwI=;
        b=Jnc270l6VokO4hYtxmr/KlKM9DjKaE/cXummBTUaKGUaWKNl207LjlookV/mLoSdM2
         pcx7wtRdbP+V+ZXJj1VN1VTPY6mzhOztPKsdjt0f20r5nCdFlxThF3MDih5EKfsy6HgV
         EXo7yFq2a2UTjt5ska9X46cdq77QSj5KRAEbxZi0iO9HqMTqRmk1CS+BGQ19Uy2eElrX
         ceWO6Tvg4KJszJWW/4Q1Ka/3cbwYdpp3gsBBhYSR1IGjj7tcRKcRrUFAdQEmRmCYaup4
         c/kpWDbgfKeI/5pj/Vd9vltMOF7ZQ3LfMWzTVRchQGUku1tUR+5ZLtQQoQ8h8nuG4GL/
         A0Kg==
X-Gm-Message-State: AOJu0Yw4MQt1aVT/QjIMrgHwaVzspZ2ruKPKHNLXS5TEvdVUmYIqs8js
	hc8Vn16xxZ/TaibQLmrSAOusLx11MKEl8UMjh4I=
X-Google-Smtp-Source: AGHT+IGKKUv2hT3STwdYs2ba8vzX940pBTgx93wHpAvTqXOJL9rOHzBgkmtAnxH/i6pn9lJMnlL8V+gvAR4H27RVCFM=
X-Received: by 2002:a0d:df89:0:b0:589:ea3e:304 with SMTP id
 i131-20020a0ddf89000000b00589ea3e0304mr10409886ywe.35.1692759066523; Tue, 22
 Aug 2023 19:51:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230822170018.315470-1-ross.burton@arm.com> <20230822170018.315470-5-ross.burton@arm.com>
In-Reply-To: <20230822170018.315470-5-ross.burton@arm.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 22 Aug 2023 19:50:55 -0700
Message-ID: <CANx9H-CqzAWyEK=0uK0_BA9h-6rYQ_Teowf7X1eQXBvxOzXDPw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 5/5] perf: disable perl support
To: Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d9baac06038e2e6c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 02:51:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186544

--000000000000d9baac06038e2e6c
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 22, 2023 at 10:00 AM Ross Burton <ross.burton@arm.com> wrote:

> From: Ross Burton <ross.burton@arm.com>
>
> The perf support was broken and if enabled results in non-reproducible
> binaries, so disable it for now.


Excellent fallback. Bad that Perl support is broken, but excellent to have
isolated it.


>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-kernel/perf/perf.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/
> perf.bb
> index f89ab20ca41..e22a1bebb26 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -11,7 +11,7 @@ LICENSE = "GPL-2.0-only"
>
>  PR = "r9"
>
> -PACKAGECONFIG ??= "perl python tui libunwind libtraceevent"
> +PACKAGECONFIG ??= "python tui libunwind libtraceevent"
>  PACKAGECONFIG[dwarf] = ",NO_DWARF=1"
>  PACKAGECONFIG[perl] = ",NO_LIBPERL=1,perl"
>  PACKAGECONFIG[python] = ",NO_LIBPYTHON=1,python3
> python3-setuptools-native"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186517):
> https://lists.openembedded.org/g/openembedded-core/message/186517
> Mute This Topic: https://lists.openembedded.org/mt/100898291/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000d9baac06038e2e6c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Aug 22, 2023 at 10:00 AM Ross Burton &lt;<a href=3D=
"mailto:ross.burton@arm.com">ross.burton@arm.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">From: Ross Burton &lt;<a href=3D"mailto:ross.b=
urton@arm.com" target=3D"_blank">ross.burton@arm.com</a>&gt;<br>
<br>
The perf support was broken and if enabled results in non-reproducible<br>
binaries, so disable it for now.</blockquote><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">Excellent fallback. Bad that Perl support is broken, but ex=
cellent to have isolated it.</div><div dir=3D"auto"><br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex" dir=3D"auto"><br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targe=
t=3D"_blank">ross.burton@arm.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer=
" target=3D"_blank">perf.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"nor=
eferrer" target=3D"_blank">perf.bb</a> b/meta/recipes-kernel/perf/<a href=
=3D"http://perf.bb" rel=3D"noreferrer" target=3D"_blank">perf.bb</a><br>
index f89ab20ca41..e22a1bebb26 100644<br>
--- a/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer=
" target=3D"_blank">perf.bb</a><br>
+++ b/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer=
" target=3D"_blank">perf.bb</a><br>
@@ -11,7 +11,7 @@ LICENSE =3D &quot;GPL-2.0-only&quot;<br>
<br>
=C2=A0PR =3D &quot;r9&quot;<br>
<br>
-PACKAGECONFIG ??=3D &quot;perl python tui libunwind libtraceevent&quot;<br=
>
+PACKAGECONFIG ??=3D &quot;python tui libunwind libtraceevent&quot;<br>
=C2=A0PACKAGECONFIG[dwarf] =3D &quot;,NO_DWARF=3D1&quot;<br>
=C2=A0PACKAGECONFIG[perl] =3D &quot;,NO_LIBPERL=3D1,perl&quot;<br>
=C2=A0PACKAGECONFIG[python] =3D &quot;,NO_LIBPYTHON=3D1,python3 python3-set=
uptools-native&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#186517): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/186517" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/186517</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/100898291/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/100898291/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000d9baac06038e2e6c--

