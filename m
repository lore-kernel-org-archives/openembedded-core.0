Return-Path: <komal.pal2904@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 435D4C48BD1
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:52:01 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web10.6885.1650624851909932012
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Apr 2022 03:54:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SGxapiTB;
 spf=pass (domain: gmail.com, ip: 209.85.219.177,
 mailfrom: komal.pal2904@gmail.com)
Received: by mail-yb1-f177.google.com with SMTP id j2so13839084ybu.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Apr 2022 03:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=640aAJz2BOSPMbU0g1yozQNMbO0ZeETc/dP9rRtYDFs=;
        b=SGxapiTBjtnpJaZzw4DVcJBV+xd3kt7oWh04TzZetAL7uItdQoTuSFn6ySdQ48Tc2J
         bWYYxXxUCXc1Ua0Q1sKv5lx8jIhk7wr+9Zzg7a9DKfBpmNuK31FobWyQtE0sgoGERYdS
         RXeod0uukJ8eq5ojuLMfBCCLEPy+46NpzGD6tX1O2ku01KeSseR1lKt2Qfri1QSM2C14
         f1XOJqPqL98QCap3IxLxpicjw7zTUIcL5zL3J7uY36IqLzkYlN/lgNYroGpCF4ZC4j0+
         rVSi7EqFRmEWnZtbjDNtBA03b9JFDGzidd6QBlyEhUgm4FTfsSfMOwgnS+UCsiPLmn86
         3a4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=640aAJz2BOSPMbU0g1yozQNMbO0ZeETc/dP9rRtYDFs=;
        b=RTS/LyNgMHVgkqmrIY6nXp6z5i2OVzpab8wIegkFoEUhuqvlvUQqLEc70niURcXIoc
         aoZKiyCuZJiAWOh9/omsFcVbzmFPMpqwqA6Em023JIO2tmXEk1NEtegPRe5WaYaGGi5h
         Ui1goo4nyNy1ZsLgVhcMbWiYvMrKGpjdqA70qZV1wE8g1J7LBmJ+SpIIwcihWJ2CCNcP
         ik2Ei8nLnkxtAYTM8sWdmCFqieUJZbRMLaeRfRCi1kZvZqzohHHLQ/wWHo3xEMGwQD3O
         uRdyuV2ub/nQv+G+990axiLLfEEL/yv4+UBTHeZLMDcKo5htewx8my2Z0dlcMWmVO8QI
         42PA==
X-Gm-Message-State: AOAM531DJO2qQ2bJ0fpkIMCL5W8B9V2XZSYAQigbV5G3t6jUzopCW6+O
	DO0AGL9AU7shJtQSk0gItwhxTxbLxso7hiKHeM4=
X-Google-Smtp-Source: 
 ABdhPJxjIDfhIMWN9MNlwczKhlCZQ/lKe0HTo4Ws6OSWleg0Mj9MWY4yDfWDbcXSKxxurdqGUJLmSHFArr0zlqMPgII=
X-Received: by 2002:a25:e0d3:0:b0:645:77c9:4e31 with SMTP id
 x202-20020a25e0d3000000b0064577c94e31mr3723312ybg.97.1650624851087; Fri, 22
 Apr 2022 03:54:11 -0700 (PDT)
MIME-Version: 1.0
References: <16E83228D5A37919.30512@lists.openembedded.org>
In-Reply-To: <16E83228D5A37919.30512@lists.openembedded.org>
From: Komal Pal <komal.pal2904@gmail.com>
Date: Fri, 22 Apr 2022 16:23:59 +0530
Message-ID: 
 <CAO6y4bEyO20Ykq5_jSUONRsKkGA=bbNSv5EwTcmK9Fd9jrgRUQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ptest-runner-curl
To: Komal Pal <komal.pal2904@gmail.com>
Cc: openembedded-core@lists.openembedded.org, ross@burtonini.com,
	komal7209 <komal.pal_7@yahoo.com>
Content-Type: multipart/alternative; boundary="000000000000e8155e05dd3c0ba8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Apr 2022 16:52:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164786

--000000000000e8155e05dd3c0ba8
Content-Type: text/plain; charset="UTF-8"

Presently, I'm working on    .bb file for same,
So have just sent the previous file the way it was to continue in this
particular for further changes.
As in  .bb file there I was facing some missing patch which need to be
included,
And issue because of openssl and some python packages which it was unable
get through RPROVIDES

On Fri, 22 Apr, 2022, 4:16 pm komal7209 via lists.openembedded.org,
<komal.pal2904=gmail.com@lists.openembedded.org> wrote:

> ---
>  meta/recipes-support/curl/curl/run-ptest | 6 ++++++
>  1 file changed, 6 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/run-ptest
>
> diff --git a/meta/recipes-support/curl/curl/run-ptest
> b/meta/recipes-support/curl/curl/run-ptest
> new file mode 100644
> index 0000000000..4435f7dee4
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/run-ptest
> @@ -0,0 +1,6 @@
> +#!/bin/sh
> +cd tests
> +./runtests.pl -a -n -s | sed \
> +     -e 's|\([^ ]* *\) \([^ ]* *\)...OK|PASS: \1 \2|' \
> +     -e 's|\([^ ]* *\) \([^ ]* *\)...FAILED|FAIL: \1 \2|' \
> +     -e 's/Warning: test[0-9]\+ not present in
> tests\/data\/Makefile.inc//'
> \ No newline at end of file
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164785):
> https://lists.openembedded.org/g/openembedded-core/message/164785
> Mute This Topic: https://lists.openembedded.org/mt/90625146/6879064
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> komal.pal2904@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000e8155e05dd3c0ba8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Presently, I&#39;m working on=C2=A0 =C2=A0 .bb file for s=
ame,=C2=A0<div dir=3D"auto">So have just sent the previous file the way it =
was to continue in this particular for further changes.=C2=A0</div><div dir=
=3D"auto">As in=C2=A0 .bb file there I was facing some missing patch which =
need to be included,=C2=A0</div><div dir=3D"auto">And issue because of open=
ssl and some python packages which it was unable get through RPROVIDES</div=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Fri, 22 Apr, 2022, 4:16 pm komal7209 via <a href=3D"http://lists.openem=
bedded.org">lists.openembedded.org</a>, &lt;komal.pal2904=3D<a href=3D"mail=
to:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">---<br>
=C2=A0meta/recipes-support/curl/curl/run-ptest | 6 ++++++<br>
=C2=A01 file changed, 6 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-support/curl/curl/run-ptest<br>
<br>
diff --git a/meta/recipes-support/curl/curl/run-ptest b/meta/recipes-suppor=
t/curl/curl/run-ptest<br>
new file mode 100644<br>
index 0000000000..4435f7dee4<br>
--- /dev/null<br>
+++ b/meta/recipes-support/curl/curl/run-ptest<br>
@@ -0,0 +1,6 @@<br>
+#!/bin/sh<br>
+cd tests<br>
+./<a href=3D"http://runtests.pl" rel=3D"noreferrer noreferrer" target=3D"_=
blank">runtests.pl</a> -a -n -s | sed \<br>
+=C2=A0 =C2=A0 =C2=A0-e &#39;s|\([^ ]* *\) \([^ ]* *\)...OK|PASS: \1 \2|&#3=
9; \<br>
+=C2=A0 =C2=A0 =C2=A0-e &#39;s|\([^ ]* *\) \([^ ]* *\)...FAILED|FAIL: \1 \2=
|&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0-e &#39;s/Warning: test[0-9]\+ not present in tests\/d=
ata\/Makefile.inc//&#39;<br>
\ No newline at end of file<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#164785): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/164785" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/164785</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/90625146/6879=
064" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/mt/90625146/6879064</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:komal.pal2904@g=
mail.com" target=3D"_blank" rel=3D"noreferrer">komal.pal2904@gmail.com</a>]=
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000e8155e05dd3c0ba8--

