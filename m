Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48A65C433F5
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 08:17:05 +0000 (UTC)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
 [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web09.7300.1651133818589304307
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 01:16:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iK34Nj/I;
 spf=pass (domain: gmail.com, ip: 209.85.166.43,
 mailfrom: rybczynska@gmail.com)
Received: by mail-io1-f43.google.com with SMTP id 125so5689726iov.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 01:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sNfBsrBvr4y08VYqdlwVnByzTq79jLIycB8RpFSwyhU=;
        b=iK34Nj/ImDbsCodccnKL0fhjA3QVKH+FRM3E27iw1e0naoNQqlplCjmavYogHxNm6y
         oMt18lx+vBF3eC0LiCUQky+loYJ9GDp3bJCDytYjX/e4NLfO7FDAxMfJSGOdIr6XqfUD
         0dPREnmuUSXdBlqAYmahKCyn2b89gMi+gsz9ysm4d3txd8Wd/N3UlV6REz2Aq/8nvojO
         XfImS1kY2mGcS39G7WfKPQLRd3CT2GIjm9TS6d7jWjaumbks4VZX7l19vP5/0IHWSzbh
         Jg1WflWlSky9QmFT+AznGWj3uyg1VJ0xN1CeMd8fUycAu2XZZlcP09/9DrppFjL6nxfq
         nTFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sNfBsrBvr4y08VYqdlwVnByzTq79jLIycB8RpFSwyhU=;
        b=Fc1+q6UFyS4pbK2yWnbw9MCV/lRm1Wdm4JP2NwLIy2geYlcRdOtRjO8/61tknEzang
         ZN+3crnPtrD32O8fOwSbFTMe3KkDP3uSyMWBCUnutT40ju8Q00NeKY38GHGHHv76DJLC
         6MPM7GIUxAaBnJ37C460BxXbI6bViVU32177AWmkHfviFisjYr4sd5weiizV6mvuoQ/f
         3WER7iMyB8Pwf6T9wPB7jQYIG7U329RQb9eoX8AxZ8DRqXn85fAkzcLLhSROkbKnH856
         o8A613Lzj8eQYyelsWL+zC+bE1PmTXJqqQYIdCOLWaQNH85zfdMmxqGGUceWWALQ/FKB
         zl9w==
X-Gm-Message-State: AOAM533nRwoW9vHfPaMx6jhOdMHibjl2W2hCCaWGuCk8NI+mEq7KY6Be
	HHAUQJIQKnI5uQ5JTGDYhV7BPjARH43JzkuVfjw91pM3
X-Google-Smtp-Source: 
 ABdhPJx2poz9yFNNC0Vf3HR3S/SA4ZQV1BjFCNn4C/rGsq1qodY+nDTqxJ3aLA4AvRmcAXnpNzPxvJjlrVzPUHkJaLQ=
X-Received: by 2002:a5d:9316:0:b0:657:a364:ceb with SMTP id
 l22-20020a5d9316000000b00657a3640cebmr5072112ion.63.1651133817986; Thu, 28
 Apr 2022 01:16:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220427132228.1179532-1-ross.burton@arm.com>
In-Reply-To: <20220427132228.1179532-1-ross.burton@arm.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Thu, 28 Apr 2022 10:16:46 +0200
Message-ID: 
 <CAApg2=ROu0Vx5qca_QRVxbeB2E6fUFSMz3bi=Cj3QD1neJ6D-Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cve-check: no need to depend on the fetch task
To: Ross Burton <ross.burton@arm.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, nd@arm.com
Content-Type: multipart/alternative; boundary="000000000000b2a40d05ddb28ced"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Apr 2022 08:17:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164936

--000000000000b2a40d05ddb28ced
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 27, 2022 at 3:22 PM Ross Burton <ross.burton@arm.com> wrote:

> The only part of the cve-check task which needs files is the patch
> examination, and typically these patches are local so fetch isn't needed.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/classes/cve-check.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/cve-check.bbclass
> b/meta/classes/cve-check.bbclass
> index 78516d0bb6..7cf206299b 100644
> --- a/meta/classes/cve-check.bbclass
> +++ b/meta/classes/cve-check.bbclass
> @@ -126,7 +126,7 @@ python do_cve_check () {
>
>  }
>
> -addtask cve_check before do_build after do_fetch
> +addtask cve_check before do_build
>  do_cve_check[depends] = "cve-update-db-native:do_fetch"
>  do_cve_check[nostamp] = "1"
>
> --
> 2.25.1
>
> A side-effect of this change is that we seem to not be downloading the NVD
database
anymore... This is probably not exactly what we want right now.

Kind regards,
Marta

--000000000000b2a40d05ddb28ced
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 27, 2022 at 3:22 PM Ross =
Burton &lt;<a href=3D"mailto:ross.burton@arm.com">ross.burton@arm.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The on=
ly part of the cve-check task which needs files is the patch<br>
examination, and typically these patches are local so fetch isn&#39;t neede=
d.<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targe=
t=3D"_blank">ross.burton@arm.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/cve-check.bbclass | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclas=
s<br>
index 78516d0bb6..7cf206299b 100644<br>
--- a/meta/classes/cve-check.bbclass<br>
+++ b/meta/classes/cve-check.bbclass<br>
@@ -126,7 +126,7 @@ python do_cve_check () {<br>
<br>
=C2=A0}<br>
<br>
-addtask cve_check before do_build after do_fetch<br>
+addtask cve_check before do_build<br>
=C2=A0do_cve_check[depends] =3D &quot;cve-update-db-native:do_fetch&quot;<b=
r>
=C2=A0do_cve_check[nostamp] =3D &quot;1&quot;<br>
<br>
-- <br>
2.25.1<br>
<br></blockquote><div>A side-effect of this change is that we seem to not b=
e downloading the NVD database</div><div>anymore... This is probably not ex=
actly what we want right now.</div><div><br></div><div>Kind regards,</div><=
div>Marta<br></div></div></div>

--000000000000b2a40d05ddb28ced--

