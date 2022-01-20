Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E439C433F5
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 23:51:03 +0000 (UTC)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com
 [209.85.222.49])
 by mx.groups.io with SMTP id smtpd.web11.4714.1642722662400511001
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 15:51:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=INoGxFGd;
 spf=pass (domain: gmail.com, ip: 209.85.222.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f49.google.com with SMTP id c36so13841017uae.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 15:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VvS7x06sCjlTvtWhwNP6DWjCsJSR6nxagEmOH+ouiIk=;
        b=INoGxFGdR3lO3a3Ok/dvHys3bUXjEk9W3d/NUE3i2FVo03SJcEY09hfLa3s/jZGMFr
         cfcwWErh2CrGuQ23+8uPJyJ1vsUsmVN3LLBRNZbr4Zvd7uaB0armptDSMPo+nD82ej3w
         KMGJtCbFYhEcomCMVl8KexCgR3wUYxEtTCfK6zz6dCx7dyAOSLl3JTkLNHTgedSxGji3
         KR5cUZ17RxuhJEAJaSIoviO2jsHvCOIT7PQStI+lzYeN0wodi0H+FVEyyR/17yZ6H7pq
         bxIyFZRYim8T1MSfUyHS1ed8vi7JSKKyfe5YpUGsHMjJPNa5Kfe+mGXtpqvSe3xrt2vT
         sEbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VvS7x06sCjlTvtWhwNP6DWjCsJSR6nxagEmOH+ouiIk=;
        b=Rsm/QmaaVBvIV2USaJ09oNhaWc+PNyOaGgBN8GUZRFJQa2tIrN2qrrtZo4O3515ekK
         G9W+/T6ssfoq225FhynLOkUMzIpWWIgiYudDfW02rtalo5/a59Y3HCSc/U364jQ05GHD
         ofaLH5OMNxZFQyh3HSYr55X6Uc5sfzGcPEjQHHuSTAfyASmyYE2wRjQE9D+UXBh5cWLV
         hl0MHnE4JSuQ6AeYkqKseMbCpz4BugyvxQtK2vEo4H08/Caxyy2Yu5EfPOpMukmq52Wt
         JfABcKykldYJcyElmK2qYRiteUjICKmK27lUa+EYPkdDw2gNUDLN8KzqmfpVfgOw5BW7
         8aAw==
X-Gm-Message-State: AOAM533YA0XCbaX4AwB9jGaJpLXryWVIEYPIcam1PKu6rFxH1Zm1R4mT
	J9huUq6u6kXVvICH6YK9qZfMfCr3u5NaJiUEh0c=
X-Google-Smtp-Source: 
 ABdhPJzZT1CuQROgcgSD0lmk/feEj0yz6KhfFjSK3RFaYSTUlgXn5FLDGo8BW6IgZB2/1QANwdZjwEBF0lcHMwpHaYs=
X-Received: by 2002:a67:d903:: with SMTP id t3mr659628vsj.42.1642722661540;
 Thu, 20 Jan 2022 15:51:01 -0800 (PST)
MIME-Version: 1.0
References: <20220120234129.4160546-1-f_l_k@t-online.de>
 <20220120234129.4160546-2-f_l_k@t-online.de>
In-Reply-To: <20220120234129.4160546-2-f_l_k@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 21 Jan 2022 00:50:50 +0100
Message-ID: 
 <CANNYZj-f-NSn-TD0vkRetUVTPdu560TyFjNfboR0-rfCjd=sVg@mail.gmail.com>
Subject: Re: [OE-core][PATCH 2/2] libical: build gobject and vala
 introspection
To: Markus Volk <f_l_k@t-online.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000b4a7d205d60c2c65"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jan 2022 23:51:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160806

--000000000000b4a7d205d60c2c65
Content-Type: text/plain; charset="UTF-8"

On Fri, 21 Jan 2022 at 00:41, Markus Volk <f_l_k@t-online.de> wrote:

> +EXTRA_OECMAKE += "-DGOBJECT_INTROSPECTION=ON"
>

This needs to be conditionally enabled similar to webkitgtk recipe:
                ${@bb.utils.contains('GI_DATA_ENABLED', 'True',
'-DENABLE_INTROSPECTION=ON', '-DENABLE_INTROSPECTION=OFF', d)} \


+do_configure:append () {

> +    # fix abs path for g-ir-scanner-wrapper
> +    sed  -i ${B}/build.ninja \
> +        -e 's: ${bindir}/g-ir-scanner-wrapper:
> ${STAGING_BINDIR}/g-ir-scanner-wrapper:g'
> +
> +    # fix abs path for g-ir-compiler-wrapper
> +    sed  -i ${B}/build.ninja \
> +        -e 's: ${bindir}/g-ir-compiler-wrapper:
> ${STAGING_BINDIR}/g-ir-compiler-wrapper:g'
> +
> +    # fix abs path for vapigen
> +    sed  -i ${B}/build.ninja \
> +        -e 's: ${STAGING_BINDIR}/vapigen:
> ${STAGING_BINDIR_NATIVE}/vapigen:g'
> +}
>

This needs to be done with a patch and not by patching generated files with
sed after the fact; the binary names should be provided from calling
pkg-config.

Alex

--000000000000b4a7d205d60c2c65
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Fri, 21 Jan 2022 at 00:41, Markus Volk &lt;<a href=3D"mailto:f_l_=
k@t-online.de">f_l_k@t-online.de</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">+EXTRA_OECMAKE +=3D &quot;-DGOBJECT_INTROS=
PECTION=3DON&quot;<br></blockquote><br><div>This needs to be conditionally =
enabled similar to webkitgtk recipe:</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;GI_DATA_ENABLED&#39;,=
 &#39;True&#39;, &#39;-DENABLE_INTROSPECTION=3DON&#39;, &#39;-DENABLE_INTRO=
SPECTION=3DOFF&#39;, d)} \</div><div><br></div><div><br></div>+do_configure=
:append () {<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 # fix abs path for g-ir-scanner-wrapper<br>
+=C2=A0 =C2=A0 sed=C2=A0 -i ${B}/build.ninja \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s: ${bindir}/g-ir-scanner-wrapper: ${S=
TAGING_BINDIR}/g-ir-scanner-wrapper:g&#39;<br>
+<br>
+=C2=A0 =C2=A0 # fix abs path for g-ir-compiler-wrapper<br>
+=C2=A0 =C2=A0 sed=C2=A0 -i ${B}/build.ninja \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s: ${bindir}/g-ir-compiler-wrapper: ${=
STAGING_BINDIR}/g-ir-compiler-wrapper:g&#39;<br>
+<br>
+=C2=A0 =C2=A0 # fix abs path for vapigen<br>
+=C2=A0 =C2=A0 sed=C2=A0 -i ${B}/build.ninja \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s: ${STAGING_BINDIR}/vapigen: ${STAGIN=
G_BINDIR_NATIVE}/vapigen:g&#39;<br>
+}<br></blockquote><div><br></div><div>This needs to be done with a patch a=
nd not by patching generated files with sed after the fact; the binary name=
s should be provided from calling pkg-config.=C2=A0</div><div><br></div><di=
v>Alex<br></div></div></div>

--000000000000b4a7d205d60c2c65--

