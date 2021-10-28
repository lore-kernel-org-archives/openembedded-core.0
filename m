Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0589DC433EF
	for <webhook@archiver.kernel.org>; Thu, 28 Oct 2021 09:56:07 +0000 (UTC)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
 [209.85.222.48])
 by mx.groups.io with SMTP id smtpd.web10.10764.1635414965786260161
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Oct 2021 02:56:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=odW5mXgK;
 spf=pass (domain: gmail.com, ip: 209.85.222.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f48.google.com with SMTP id ba32so10416801uab.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Oct 2021 02:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jMv94LY1iKXNtah8R/kNlhOYL0EyjQbr55GFNqP8q6c=;
        b=odW5mXgK4wqn2QWdUVe1+tKoDlNH2/bnZwGhBuYhjGOVafU1kzlez3ZTN17CjnYr0D
         23KOusNWDj/EfK2mhnlMdslOEqwPpJK+gHTn1I8CwhAztejSan3eGQ0sHvTcrQdNieMy
         0mV2RnlxcZSIBUcP0ku/X8HC+vLWv2hA/dcE1ZwgzcWRCD9yg3W/ysTfIO8issn9DR02
         /JXCLFHnLiF7iSsiASS/mpanyv66o/+TgD8Hkv4XVgsRsj1V8lnQ+kBZdNfbsFhleEWT
         NH9c0Q2ETiD/+sOC83j+402GjE2tEAc70s3VE5fRf1+i0+BfxImOuZO/t6xmd2QQbQlg
         38PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jMv94LY1iKXNtah8R/kNlhOYL0EyjQbr55GFNqP8q6c=;
        b=zmAMJktwuglhtKY6w4dGZeAbIKrPWf4C2PSLSUbkEtAUX3/a6v9e0jQdPSTOUAbyzy
         Kzdn53mSx4j56fOFSsSoopVFjajRdXcv84SwHUuZAJ/6d2i2wE9dbbPQ4GLCQTaMHDoO
         hVsBn7apIrY1pXUw5/+lDdn1fY+vlVS6IeI0fZuZCRuPuDHrDH8yNpdB7s093Ti6+gsi
         y+6SGBvz9EzOeg/2yRlVLCc5+GjyMcDRO7t+sq/TCP40lvSny8hmqB4xQhUUbv0pITMn
         nrxTYVyX4CUR0JTzRJ2pB96f8EuONv0qCgPd++RNPBUgLCBTaZh/1J1wxvaS9wT5cyDW
         YWhA==
X-Gm-Message-State: AOAM532xLL60SVJVZJIkORuMspks5LoDQUXKmvscroXv6OXnKhqFx4Ms
	dPcelOx6sW2NOZdEeHVbqDwxGeIZxbGuIb6DCJc=
X-Google-Smtp-Source: 
 ABdhPJziTZTd+jTHkI21FCT/RS3dq34ZT/cgHFcbnnDa66SePtyqlk5a0jOtN1UiqF80BjVog07KAKjXK1tfeb1dzFw=
X-Received: by 2002:a67:f48d:: with SMTP id o13mr2718414vsn.18.1635414964879;
 Thu, 28 Oct 2021 02:56:04 -0700 (PDT)
MIME-Version: 1.0
References: <20211027140954.76185-1-oobitots@cisco.com>
 <c44874c177d7aa9041d1ce266bdbfdbec9dc305d.camel@linuxfoundation.org>
In-Reply-To: 
 <c44874c177d7aa9041d1ce266bdbfdbec9dc305d.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 28 Oct 2021 11:55:53 +0200
Message-ID: 
 <CANNYZj-P0iunNY4bEHn13x7D5h06KdUrGU+oyoxZq-PW9_Kmag@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gcc: Improve reproducibility
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: oobitots@cisco.com, OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000000ac3fc05cf66b83f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Oct 2021 09:56:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157581

--0000000000000ac3fc05cf66b83f
Content-Type: text/plain; charset="UTF-8"

On Wed, 27 Oct 2021 at 20:00, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> Do you know why we wouldn't see this issue on the autobuilder tests?
>
> Also, do you plan to submit something upstream? Has this been discussed
> with
> them? I'm starting to become reluctant to taking patches marked as
> "Pending"
> which just sit in our tree forever...
>

I was also wondering what the issue really is - there needs to be a
description of how it can be observed at least.

Alex

--0000000000000ac3fc05cf66b83f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, 27 Oct 2021 at 20:00, Richard Purdie &lt;<a href=3D"mailto:r=
ichard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Do you=
 know why we wouldn&#39;t see this issue on the autobuilder tests?<br>
<br>
Also, do you plan to submit something upstream? Has this been discussed wit=
h<br>
them? I&#39;m starting to become reluctant to taking patches marked as &quo=
t;Pending&quot;<br>
which just sit in our tree forever...<br></blockquote><div><br></div>I was =
also wondering what the issue really is - there needs to be a description o=
f how it can be observed at least.</div><div class=3D"gmail_quote"><br></di=
v><div class=3D"gmail_quote">Alex<br></div></div>

--0000000000000ac3fc05cf66b83f--

