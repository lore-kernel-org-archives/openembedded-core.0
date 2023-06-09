Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF499C7EE2E
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 05:22:56 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.6683.1686288170693177131
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jun 2023 22:22:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=ekYHqQmq;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-3f7ff69824dso7148245e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Jun 2023 22:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686288169; x=1688880169;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZNKSA2hWvz9AsNyxLoDTBoJiGJe1Pxd1K/UZTGBigjs=;
        b=ekYHqQmqz82vAQnvhSS/cB4VuL4duMBdDXC5KsG0ndVeyADf6yHvZ+gUXcCvcOLsEH
         YoAS61I2WZaMcwUlGH9yjPKnMQxMpJ6cMo1JSa3xivYvKo8TjACpGCSxlQvwFgYest8l
         qow8D//8+0nMFd1qegdxWBhS88nPbDX5HjhzOJ8NqV45bZzXCSxc0fHLHAsmmG1kgdj1
         aURmzGl4jo+RX9XWTlFp5KHcveZolK+81kgzxGbu3rhMfo7Fi3UrFE5qxTTzyTrzUzo/
         tS63Um7KLPj/b9BY4HrYGJXZmZPd9jTV34s8qJtWVTJ8M9UCfujHhvcG62gmoNGdmUEK
         AnDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686288169; x=1688880169;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZNKSA2hWvz9AsNyxLoDTBoJiGJe1Pxd1K/UZTGBigjs=;
        b=UH8a8Ww3IPKwHnJVs2UXFFKFW3r4dh/HxkPufEZqD39TFUWcvnQe4hLjQ+ECxXdjts
         zI/zuf/AD3Xh8xzqdVd76FiCwM9Qy+5IMyNpg+UspQKO35cYfYKLreNqj3l/nMgihCLr
         uu7WI9akjZUEHTTNmx7//IEn2lcPVD54XMZRGRQrrgl4ZIO1TdycUFMJKfbnLQCxVS/o
         3sAOElWLZfAQTshCPDoVMTQIUJtPtygHN0A6oV5b+YhOZjhL5PJp31hCUtEE7kx9/s1c
         TVPHC/wSGQMkmx05IKUxKV25CPuB7FBvGiC6unEGqfueDlalqJItTn21I9K9j/JEDP8q
         KV8w==
X-Gm-Message-State: AC+VfDxvk711hUNl07fif2dOBeMa0Q5dJOdca9ziTCFU8yKrVHw8IuDp
	bjfRol4iG0ZVyKMZDtb/Xmlkw5D9U+b2S7gbxLgthIJc
X-Google-Smtp-Source: ACHHUZ60hvCoS2u9rzvhw/5mfPqJadSv+geoE0n+Dbd4hfBB/X2vRgDATXtN0aNC1PNpdcgXgy100SLmwSx8san7/2I=
X-Received: by 2002:a1c:4b16:0:b0:3f4:2158:28a0 with SMTP id
 y22-20020a1c4b16000000b003f4215828a0mr527575wma.12.1686288168836; Thu, 08 Jun
 2023 22:22:48 -0700 (PDT)
MIME-Version: 1.0
References: <1766DB271C48CF77.6460@lists.openembedded.org> <20230609030418.540053-1-mingli.yu@eng.windriver.com>
In-Reply-To: <20230609030418.540053-1-mingli.yu@eng.windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 9 Jun 2023 07:22:37 +0200
Message-ID: <CA+chaQetTVmU7oMsQ8RPeJQ4Ou8=U2ua7LjFPe17RMqmGE+G2Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v6] qemu: Split the qemu package
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004ae0b005fdab8f97"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 05:22:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182530

--0000000000004ae0b005fdab8f97
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 9, 2023 at 5:04=E2=80=AFAM Yu, Mingli <mingli.yu@eng.windriver.=
com>
wrote:

> +    if userpackages:
> +        d.setVar('RDEPENDS:' + d.getVar('PN') + '-user-all', '
> '.join(userpackages))
> +    mipspackage =3D d.getVar('PN') + "-user-mips"
> +    if mipspackage in ' '.join(userpackages):
> +        d.appendVar('RDEPENDS:' + mipspackage, ' ' + d.getVar("MLPREFIX"=
)
> + 'bash')
>

This is just a style question, you don't need to update.

Is it worth making this conditional on ${PN}-user-mips existence? I would
just use

RDEPENDS:${PN}-user-mips =3D "bash"

outside this function and I don't think you would even need to explicitly
use ${MLPREFIX}. Nothing will break when ${PN}-user-mips doesn't exist
(e.g. when splitting is disabled) and it's a bit easier to read than
corresponding 3 lines in python.

--0000000000004ae0b005fdab8f97
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, Jun 9, 2023 at 5:04=E2=80=AFAM Yu=
, Mingli &lt;<a href=3D"mailto:mingli.yu@eng.windriver.com" target=3D"_blan=
k">mingli.yu@eng.windriver.com</a>&gt; wrote:<br></div><div class=3D"gmail_=
quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">+=C2=A0 =C2=A0 if =
userpackages:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;RDEPENDS:&#39; + d.getVar(&#39;P=
N&#39;) + &#39;-user-all&#39;, &#39; &#39;.join(userpackages))<br>
+=C2=A0 =C2=A0 mipspackage =3D d.getVar(&#39;PN&#39;) + &quot;-user-mips&qu=
ot;<br>
+=C2=A0 =C2=A0 if mipspackage in &#39; &#39;.join(userpackages):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar(&#39;RDEPENDS:&#39; + mipspackage,=
 &#39; &#39; + d.getVar(&quot;MLPREFIX&quot;) + &#39;bash&#39;)<br></blockq=
uote><div><br></div><div>This is just a style question, you don&#39;t need =
to update.</div><div><br></div><div>Is it worth making this conditional on =
${PN}-user-mips existence? I would just use</div><div><br></div><div>RDEPEN=
DS:${PN}-user-mips =3D &quot;bash&quot;=C2=A0</div><div><br></div><div>outs=
ide this function and I don&#39;t think you would even need to explicitly u=
se ${MLPREFIX}. Nothing will break when ${PN}-user-mips doesn&#39;t exist (=
e.g. when splitting is disabled) and it&#39;s a bit easier to read than cor=
responding 3 lines in python.</div></div></div>

--0000000000004ae0b005fdab8f97--

