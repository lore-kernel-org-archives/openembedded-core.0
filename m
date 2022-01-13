Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66DFFC433F5
	for <webhook@archiver.kernel.org>; Thu, 13 Jan 2022 17:39:32 +0000 (UTC)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com
 [209.85.222.54])
 by mx.groups.io with SMTP id smtpd.web08.244.1642095571400935862
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 09:39:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AUZLHm6T;
 spf=pass (domain: gmail.com, ip: 209.85.222.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f54.google.com with SMTP id y4so12587775uad.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 09:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XNI/FZPlqwR0RaW/eP3AsSQjE6k/AcQoHrKcjgN7aVU=;
        b=AUZLHm6ToJVZPWm2KmCPZq9pF9Z2Tc40n9iEzWMS14r0eajSzydZdD/lQ6Ft8O4pDW
         pBf/m8/UgAZUh16rOLH11nYcuzM5D3yE78FJPP48v9eEfCsC+HLLjfn6Nkh2IRTwR2Md
         dHRL4crZdFUVWBZ6+4FNzJKZ7CUYYe/xThGLeWM7ZThW6Jw884NfOMStxFJ7CTrH3LTa
         PdvhIJb2P66CIqLj6nTVV7vPbsjJ4XAsdHNqavG3eBPBMSGVB5GRLYzN8Uoa0mru4m+4
         N6XwW7r6Q9eirBunL0TnXMeSMrpkmLqlCjlPGrSgqk04FBliHxPnOLnRUf382jW5QqXB
         TnqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XNI/FZPlqwR0RaW/eP3AsSQjE6k/AcQoHrKcjgN7aVU=;
        b=uSwi6CGUGCNhc+oFjA+TdiXmbJWWKpjDU2WKhat0vI8nayNDTIZwaMoD3RlhvdyhL/
         cjFnJ3Ze/bhJ5X6erRl+qXJWzgJ4tC60PfGSd/gTTsjrBT5gq9egGpODeh9ntEEvuzyf
         dC6npdgxRHHh+8ZETDoJcRMInqbXOv9P+kyskrsfSMc42ldSv9t7nHVHhenEAECBTsxh
         QeWLP119MicoZkOtI42y8heFX64gzug5fy2O9wMYISqozVbkj9NQiUIl1MOmtN4T7MYU
         Pr1pJ1VtnvPMVzRs4S7NmEP3Fsvix4Vo6I4gfJ46YjFWdpuoaBTK7X1X6qDAeIe3shg4
         B5tA==
X-Gm-Message-State: AOAM533/TRL5s0EEZgOi55lw4Hi9I40NAaUSY0/BoqdzQOwSlARxPOWC
	BQB9SmeCpzK1a94zp4GMuhm10m9EEl56SkayUlY=
X-Google-Smtp-Source: 
 ABdhPJxD58RGBfVo1Ef97rqZxlIWU3iEOyFCb+TBODv4g4TuluSZ0LocqYMV7P7TilWEplK8m4fakePc1ZcLUfgjlcU=
X-Received: by 2002:a67:c40e:: with SMTP id c14mr2598988vsk.73.1642095570441;
 Thu, 13 Jan 2022 09:39:30 -0800 (PST)
MIME-Version: 1.0
References: <20220113173555.1925441-1-raj.khem@gmail.com>
In-Reply-To: <20220113173555.1925441-1-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 13 Jan 2022 18:39:19 +0100
Message-ID: 
 <CANNYZj85JnxcETSQFWqBZWLwjrOnuq6rpS=CZ9Okr66TwtiZWw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] valgrind: Enable network for ptest builds
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000029d74505d57a2b8e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jan 2022 17:39:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160527

--00000000000029d74505d57a2b8e
Content-Type: text/plain; charset="UTF-8"

Why wasn't this exposed by AB testing? And can there be a better solution
(e.g. skip the validation step), since this would still break on hosts
without internet.

Alex

On Thu, 13 Jan 2022 at 18:36, Khem Raj <raj.khem@gmail.com> wrote:

> do_compile_ptest_base uses xmllint which accesses internet for
> validating DTD
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/valgrind/valgrind_3.18.1.bb | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.18.1.bb
> b/meta/recipes-devtools/valgrind/valgrind_3.18.1.bb
> index 7837034f92e..5ebcae467fa 100644
> --- a/meta/recipes-devtools/valgrind/valgrind_3.18.1.bb
> +++ b/meta/recipes-devtools/valgrind/valgrind_3.18.1.bb
> @@ -98,6 +98,11 @@ CACHED_CONFIGUREVARS += "ac_cv_path_PERL='/usr/bin/env
> perl'"
>  # which fixes build path issue in DWARF.
>  SELECTED_OPTIMIZATION = "${DEBUG_FLAGS}"
>
> +# This is needed because xmllint needs access to network to
> +# validate DTD 4.3 onwards it uses --dtdvalid
> http://www.oasis-open.org/docbook/xml/4.3/docbookx.dtd
> +# to xmllint, allow it to access internet
> +do_compile_ptest_base[network] = "1"
> +
>  do_configure:prepend () {
>      rm -rf ${S}/config.h
>      sed -i -e 's:$(abs_top_builddir):$(pkglibdir)/ptest:g'
> ${S}/none/tests/Makefile.am
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160526):
> https://lists.openembedded.org/g/openembedded-core/message/160526
> Mute This Topic: https://lists.openembedded.org/mt/88401996/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000029d74505d57a2b8e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Why wasn&#39;t this exposed by AB testing? And can th=
ere be a better solution (e.g. skip the validation step), since this would =
still break on hosts without internet.</div><div><br></div><div>Alex<br></d=
iv></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Thu, 13 Jan 2022 at 18:36, Khem Raj &lt;<a href=3D"mailto:raj.khem@gm=
ail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">do_compile_ptest_base uses xmllint which accesse=
s internet for<br>
validating DTD<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/valgrind/<a href=3D"http://valgrind_3.18.1.bb" =
rel=3D"noreferrer" target=3D"_blank">valgrind_3.18.1.bb</a> | 5 +++++<br>
=C2=A01 file changed, 5 insertions(+)<br>
<br>
diff --git a/meta/recipes-devtools/valgrind/<a href=3D"http://valgrind_3.18=
.1.bb" rel=3D"noreferrer" target=3D"_blank">valgrind_3.18.1.bb</a> b/meta/r=
ecipes-devtools/valgrind/<a href=3D"http://valgrind_3.18.1.bb" rel=3D"noref=
errer" target=3D"_blank">valgrind_3.18.1.bb</a><br>
index 7837034f92e..5ebcae467fa 100644<br>
--- a/meta/recipes-devtools/valgrind/<a href=3D"http://valgrind_3.18.1.bb" =
rel=3D"noreferrer" target=3D"_blank">valgrind_3.18.1.bb</a><br>
+++ b/meta/recipes-devtools/valgrind/<a href=3D"http://valgrind_3.18.1.bb" =
rel=3D"noreferrer" target=3D"_blank">valgrind_3.18.1.bb</a><br>
@@ -98,6 +98,11 @@ CACHED_CONFIGUREVARS +=3D &quot;ac_cv_path_PERL=3D&#39;/=
usr/bin/env perl&#39;&quot;<br>
=C2=A0# which fixes build path issue in DWARF.<br>
=C2=A0SELECTED_OPTIMIZATION =3D &quot;${DEBUG_FLAGS}&quot;<br>
<br>
+# This is needed because xmllint needs access to network to<br>
+# validate DTD 4.3 onwards it uses --dtdvalid <a href=3D"http://www.oasis-=
open.org/docbook/xml/4.3/docbookx.dtd" rel=3D"noreferrer" target=3D"_blank"=
>http://www.oasis-open.org/docbook/xml/4.3/docbookx.dtd</a> <br>
+# to xmllint, allow it to access internet<br>
+do_compile_ptest_base[network] =3D &quot;1&quot;<br>
+<br>
=C2=A0do_configure:prepend () {<br>
=C2=A0 =C2=A0 =C2=A0rm -rf ${S}/config.h<br>
=C2=A0 =C2=A0 =C2=A0sed -i -e &#39;s:$(abs_top_builddir):$(pkglibdir)/ptest=
:g&#39; ${S}/none/tests/Makefile.am<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#160526): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/160526" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/160526</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/88401996/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/88401996/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000029d74505d57a2b8e--

