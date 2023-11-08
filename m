Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43F14C4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 08:34:45 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.9295.1699432474969347661
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Nov 2023 00:34:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Jb4Ag7mg;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-50931355d48so8949922e87.3
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 00:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699432473; x=1700037273; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aO8n779l6hEI1Tx1uUqmBX439HsLTLPbMLEINsAH3Os=;
        b=Jb4Ag7mgIuWg4+C2c3Ro3jGX3GCdLtdW5q8yzWgx0uBpIrfUl/R9G8G9yPuxFOn7Ai
         AtK4UMSWWRSN0lJBOMFoaOsDZWy/UejnAiKQdqy4d6N56ZYUhGOb0MODLc/q+pLz3S09
         HtdvSJpIc8gHHrl9xSxBIMMUT9Dq1f3m683oLjnkd5cbMHnbr3A4vN8UEZHKYFFamRqP
         T4M4Cltd7N2JYI14980Er1bSdPkQ9vdxEoi80S3xWZP4kXFgbA9IO31IgWEQTtSSp+Bh
         TIhuR2Ex8pfqfJUS44sSRsPFr9szXsnVctRVqRdh8zKbLa3CyagjmDa2zeME8xjvWwhP
         c55g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699432473; x=1700037273;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aO8n779l6hEI1Tx1uUqmBX439HsLTLPbMLEINsAH3Os=;
        b=V0Mq4FbMpvq8+DifIF8Qxk2cjNChJnbuV1b0EbLvd93y2F82Ef/tN8HgxVghEOYDM5
         +nRv/N71qgeJ/vvxXfVZNboryw6z/6ihtGNk/g5cJvBfSz/HaNCpeEXMAypMya0E6HRs
         aC0eZXNrqX/JCLQKmBa5e9zqH5tcAyiRnRfZaRRu4vpHZOaz3M8vGy/zwLk8RrrvNU2H
         yD0psAxbm1FTgARvAOqXjAJvSNSxLju4WoxXkZe8Aw0mD7ZKp565N9MT1L7RruQ/vTfv
         DsYRM223W+Bhlt8ZLFKJpKzo6/G2f3iSp2rALdKzYCG3ikHOWzC7UKvUoFxMbIlcnD2K
         qWIQ==
X-Gm-Message-State: AOJu0Ywh1y9i+yRDrY6rTP2XVuaRbae9BRmQ0RQ8tsDMCUWn4SzgSqwO
	U9zKIEvL9bTHkDqHHJtyd2rCy0HrXqn2F1iLGMA=
X-Google-Smtp-Source: AGHT+IFauZeyOszswbCl6uj1qm6/KXl+PzivXFWaFXX8baHY1J7ywvnu8X66hX2cpzp7Yj5ASlD7MlQlADzg6ylaJPI=
X-Received: by 2002:a05:6512:3d1b:b0:507:9702:8e09 with SMTP id
 d27-20020a0565123d1b00b0050797028e09mr826258lfv.2.1699432472887; Wed, 08 Nov
 2023 00:34:32 -0800 (PST)
MIME-Version: 1.0
References: <20230810164114.261613-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20230810164114.261613-1-richard.purdie@linuxfoundation.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 8 Nov 2023 09:34:21 +0100
Message-ID: <CA+chaQdtfrd1zLmKz=2HWRyJe5ngLK7OTXbJ6G+1hOvVPeJ3aQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] bitbake.conf: Drop PE and PR from WORKDIR and STAMP
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ddc6ef06099ff403"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 08:34:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190307

--000000000000ddc6ef06099ff403
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 10, 2023 at 6:41=E2=80=AFPM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> Once, we relied upon stamps changing to rebuild. PE and PR are packaging
> variables and are reflected in the taskhashes when/where they're used so
> they do not need to be in STAMP.
>
> Similarly, once, multiple versions were something which was useful in
> WORKDIR but this is really just noise causing long pathnames now.
>
> Drop PR and PE from these variables to clean up the paths a bit.
>
> This may break some tool assumptions about paths but those are probably
> things we need to fix.
>

meta/conf/bitbake.conf:
-fdebug-prefix-map=3D${S}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
meta/conf/bitbake.conf:
-fdebug-prefix-map=3D${B}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \

What about changing ^ as well to match workdir names? I know it works as it
is now and it might be useful to know from which PR the PN-dbg files are,
but as we don't depend on PR in WORKDIR maybe we don't need it in
/usr/src/debug as well anymore.

The interesting side-effect of this is that for DISTROs which still use PR
(e.g. webOS OSE), the difference in -fdebug-prefix-map causes all binaries
to be slightly different when rebuilt with different PR (due to this path,
even when otherwise they are binary reproducible) and when the number of
digits in PR changes (e.g. from r9 to r10) it also results in slightly
bigger binaries (and more unnecessary changes in buildhistory diffs).

For example this foo binary, the difference between "new" and "old" is
extra patch applied in SRC_URI (which doesn't affect the foo binary, but
was the reason for PR bump).

And the binary is bigger with r10, identical with r6 and slightly different
due to debug-prefix-map between r6 and r7:

$ ls -la 1.0.0-175-*/image/usr/sbin/foo
-rwxr-xr-x 1 bitbake bitbake 30182460 Nov  8 08:29
1.0.0-175-new-r10/image/usr/sbin/foo
-rwxr-xr-x 1 bitbake bitbake 30182224 Nov  8 08:02
1.0.0-175-new-r6/image/usr/sbin/foo
-rwxr-xr-x 1 bitbake bitbake 30182224 Nov  8 07:49
1.0.0-175-new-r7/image/usr/sbin/foo
-rwxr-xr-x 1 bitbake bitbake 30182224 Nov  8 07:39
1.0.0-175-old-r6/image/usr/sbin/foo
$ md5sum 1.0.0-175-*/image/usr/sbin/foo
8e3ab67d596f8cc2f9c6320dab10af01  1.0.0-175-new-r10/image/usr/sbin/foo
f6ff1e64fe6affb9ba0d8f278cf7ed79  1.0.0-175-new-r6/image/usr/sbin/foo
6469a0b10aac233911e63c5ea97b03c0  1.0.0-175-new-r7/image/usr/sbin/foo
f6ff1e64fe6affb9ba0d8f278cf7ed79  1.0.0-175-old-r6/image/usr/sbin/foo

--000000000000ddc6ef06099ff403
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Aug 10, 2023 at 6:41=E2=80=AFPM R=
ichard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">ric=
hard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><div class=3D"gmail=
_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">Once, we relied u=
pon stamps changing to rebuild. PE and PR are packaging<br>
variables and are reflected in the taskhashes when/where they&#39;re used s=
o<br>
they do not need to be in STAMP.<br>
<br>
Similarly, once, multiple versions were something which was useful in<br>
WORKDIR but this is really just noise causing long pathnames now.<br>
<br>
Drop PR and PE from these variables to clean up the paths a bit.<br>
<br>
This may break some tool assumptions about paths but those are probably<br>
things we need to fix.<br></blockquote><div><br></div><div>meta/conf/bitbak=
e.conf: -fdebug-prefix-map=3D${S}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-$=
{PR} \</div>meta/conf/bitbake.conf: -fdebug-prefix-map=3D${B}=3D/usr/src/de=
bug/${PN}/${EXTENDPE}${PV}-${PR} \</div><div class=3D"gmail_quote"><br></di=
v><div class=3D"gmail_quote">What about changing ^ as well to match workdir=
 names? I know it works as it is now and it might be useful to know from wh=
ich PR the PN-dbg files are, but as we don&#39;t depend on PR in WORKDIR ma=
ybe we don&#39;t need it in /usr/src/debug as well anymore.</div><div class=
=3D"gmail_quote"><br></div><div class=3D"gmail_quote">The interesting side-=
effect of this is that for DISTROs which still use PR (e.g. webOS OSE), the=
 difference in -fdebug-prefix-map causes all binaries to be slightly differ=
ent when rebuilt with different PR (due to this path, even when otherwise t=
hey are binary reproducible) and when the number of digits in PR changes (e=
.g. from r9 to r10) it also results in slightly bigger binaries (and more u=
nnecessary changes in buildhistory diffs).</div><div class=3D"gmail_quote">=
<br></div><div class=3D"gmail_quote">For example this foo binary, the diffe=
rence between &quot;new&quot; and &quot;old&quot; is extra patch applied in=
 SRC_URI (which doesn&#39;t affect the foo binary, but was the reason for P=
R bump).</div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quot=
e">And the binary is bigger with r10, identical with r6 and slightly differ=
ent due to debug-prefix-map between r6 and r7:</div><div class=3D"gmail_quo=
te"><br></div><div class=3D"gmail_quote">$ ls -la 1.0.0-175-*/image/usr/sbi=
n/foo<br>-rwxr-xr-x 1 bitbake bitbake 30182460 Nov =C2=A08 08:29 1.0.0-175-=
new-r10/image/usr/sbin/foo<br>-rwxr-xr-x 1 bitbake bitbake 30182224 Nov =C2=
=A08 08:02 1.0.0-175-new-r6/image/usr/sbin/foo<br>-rwxr-xr-x 1 bitbake bitb=
ake 30182224 Nov =C2=A08 07:49 1.0.0-175-new-r7/image/usr/sbin/foo<br>-rwxr=
-xr-x 1 bitbake bitbake 30182224 Nov =C2=A08 07:39 1.0.0-175-old-r6/image/u=
sr/sbin/foo<br>$ md5sum 1.0.0-175-*/image/usr/sbin/foo<br>8e3ab67d596f8cc2f=
9c6320dab10af01 =C2=A01.0.0-175-new-r10/image/usr/sbin/foo<br>f6ff1e64fe6af=
fb9ba0d8f278cf7ed79 =C2=A01.0.0-175-new-r6/image/usr/sbin/foo<br>6469a0b10a=
ac233911e63c5ea97b03c0 =C2=A01.0.0-175-new-r7/image/usr/sbin/foo<br>f6ff1e6=
4fe6affb9ba0d8f278cf7ed79 =C2=A01.0.0-175-old-r6/image/usr/sbin/foo<br></di=
v></div>

--000000000000ddc6ef06099ff403--

