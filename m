Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E319C3DA6E
	for <webhook@archiver.kernel.org>; Wed,  3 Jan 2024 14:54:25 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.19052.1704293657626765716
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jan 2024 06:54:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KjBuokHP;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-336755f1688so9899526f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jan 2024 06:54:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704293656; x=1704898456; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eS+yXfletB96oYWNw6cMaidcudGN467EaBwgAsYawpc=;
        b=KjBuokHP/qWq3NxUOZWdzYXlOpZO2hS5wp689RVrWlJbV2Yk433uFPC9YvJxNbDqjX
         ulbG6r5Gogn164wVkYHDD71zuJuR8mitj6+e32jj7PS+yXmwOrB+8howqavdtMBRYvR9
         GCOsWAjV1BdaXOkaK9CK7q1+XxSH86cuzugS0ulr7DdovW8dxqTgQPiP1+v9ZgryJUPs
         o7hHQ2klBYwMWZ4fQnrH5ycxwE0ZU1+czJVchoqEF89iB7OtATVMVT03ex0HpeyIm3V9
         YRbQkbGVCCq+4Vh6qe6Bs4i44P+du+PEOMeOXAP6rl7hqqIxuEZz2OzaaHHzPp5P768v
         Yk+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704293656; x=1704898456;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eS+yXfletB96oYWNw6cMaidcudGN467EaBwgAsYawpc=;
        b=h/LHzcUSmL3JWYXqU6Q7wEzynwxg6dCIvGs6fyNvhLezh/+kw349uPgaIyauUgF95e
         cqVH7cWAMw7W+DxJCRLiE9sIq+Yl4ErKhwNdgg25X+hW80XLHQ11Qeq/Cf2J8QE8+2kR
         Q4rWgFBv9OImOdppTOuGuDF8jhGvZ9OqsUX18AsS/83ZOlfw6UONAWoJ6k1/4oTTUBpq
         btBo66NWeHO7Jq3+gUFmBIpWff+JNZwunnXQoHTKksuWaFwq/tYIa5iSkVY0PhsIgPo2
         fYQH3Hfmyezx0W464yrt0/T5URLRkLbglDXdewWsLRCUPNTFXchgXviGKc/xKz2bcnqI
         bEAQ==
X-Gm-Message-State: AOJu0YxML8rYisE5MYP9/8U+AMGccnyZ9XY6JyFx94s6qBPewScjKxyG
	rTvs2NL29dFAuF4PkZ9d4ULcZAhoy9kjhf40XLE=
X-Google-Smtp-Source: AGHT+IE5hMZ83RG+j/h7STSLUdrV7zFWD7cbKf+su7QQKPWPDJa/1GV3rSIqBpLFwee09kw3XnXvodUIhgQxFNKw+cc=
X-Received: by 2002:a05:6000:1ac5:b0:337:400c:e0b8 with SMTP id
 i5-20020a0560001ac500b00337400ce0b8mr3176732wry.98.1704293655880; Wed, 03 Jan
 2024 06:54:15 -0800 (PST)
MIME-Version: 1.0
References: <20240103101615.1874481-1-mikko.rapeli@linaro.org>
In-Reply-To: <20240103101615.1874481-1-mikko.rapeli@linaro.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 3 Jan 2024 15:54:02 +0100
Message-ID: <CA+chaQcd4MKK_KMdmpEqCtMLZVGx_MCP3y5sVhteKdzDQnNPKg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] runqemu: match .rootfs. in image names instead
 of -image-
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f3a933060e0bc995"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jan 2024 14:54:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193287

--000000000000f3a933060e0bc995
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 3, 2024 at 11:16=E2=80=AFAM Mikko Rapeli <mikko.rapeli@linaro.o=
rg>
wrote:

> Don't expect image file names to include "-image-" but
> expect them to have the ".rootfs." postfix which is the
> default.
>

It's the current default, but whole runqemu won't work when someone changes=
:

meta/classes-recipe/image-artifact-names.bbclass:IMAGE_NAME_SUFFIX ??=3D
".rootfs"

So you should probably read IMAGE_NAME_SUFFIX variable first, but the most
likely change someone will have in local.conf would be to drop this suffix
and set this to empty and then the check for empty string in basename won't
be very useful as well.

Regards,

--000000000000f3a933060e0bc995
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Jan 3, 2024 at 11:16=E2=80=AFAM M=
ikko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@linaro.org">mikko.rapeli@lin=
aro.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">Don&#39;t expect image file names to incl=
ude &quot;-image-&quot; but<br>
expect them to have the &quot;.rootfs.&quot; postfix which is the<br>
default.<br></blockquote><div><br></div><div>It&#39;s the current default, =
but whole runqemu won&#39;t work when someone changes:</div><div><br></div>=
<div>meta/classes-recipe/image-artifact-names.bbclass:IMAGE_NAME_SUFFIX ??=
=3D &quot;.rootfs&quot;</div><div><br></div><div>So you should probably rea=
d IMAGE_NAME_SUFFIX variable first, but the most likely change someone will=
 have in local.conf would be to drop this suffix and set this to empty and =
then the check for empty string in basename won&#39;t be very useful as wel=
l.</div><div><br></div><div>Regards,</div></div></div>

--000000000000f3a933060e0bc995--

