Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
 by mx.groups.io with SMTP id smtpd.web08.5458.1623923000999080318
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jun 2021 02:43:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XzK/p1JO;
 spf=pass (domain: gmail.com, ip: 209.85.221.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f169.google.com with SMTP id c17so1247979vke.3
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Jun 2021 02:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8CCpm+J2XxinVe30cJLnoaouvzaVhWOyIEyzUhVp590=;
        b=XzK/p1JOOy0SwebkKq294HOsbzwxB1Jdcvpux+wMV7k16+L5BI0jJviX74O0JEIr+v
         2G6aaY3oEZRBdcTpiAlQ1OhU6FsqMMQOwaJNTOuwzJrgo/hCiNSe1UfkXdCAvXJ4qytl
         uGlW0HxSir1WnZLxri3hMqDOo0kxLaGXB/a19iIG8A5zJg5JS+6UAMKmRxYYfb84T8w3
         H7cO0SuXJ7Bd51gYw+6ZFYOXACWKIR5Joh80jLguWa9Ur59UrQcL9it/eHLmo/QYyrS1
         tyrmlIlqaF8+84zJJcu43bs/vD4kUvuERazDaKcHCmcW3q9BeimZ12vRZwot1wqyGFTW
         Dydg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8CCpm+J2XxinVe30cJLnoaouvzaVhWOyIEyzUhVp590=;
        b=h/0SuPjaGAJNDQLEriBskjJwcV2eH5/1FRhmdAg1hlLFOiPN26hAvP8NUsGXNwh00H
         +KlnROcGLOkWZ7LnCHRxLk3Qv/Ic/s6iGIC6lvjRuBgh5Bwa5DHJr83TaynTwy5aJtHn
         6mHml2EGkQu1zMNqNbxg+ODN23ClryUq2ouyFyBr3lWwGcntrlGyaJWx7QVYELOL61OM
         2hcbcsU352pkRkjlvxhQ+vbkb71HuYcMtVAnezDuHGNmjxCgcvPnRPF8j5s92v9BQPvq
         Mtj4jgu0hZKG9Kw1QZoKDlMrn79ydNx4fT3BXDFla1qcCk1rOusN5SwwsnvBEYcRlXMH
         iE2Q==
X-Gm-Message-State: AOAM532jg7w9fjNK8fuwB+JZn8VFrgQeoGSDPOuILSOhKnPNCARL60xp
	U03AdOImR9E3abvKp8U/kSWog9iskj32gW1gFk+B3WHhZ/o=
X-Google-Smtp-Source: ABdhPJwbFWcjTF2hOMq4Bz+YvvNfsRlLYritvS/VmmPovaHPOHAnpbCVN7RbVPD4IAHyuFEnpVPQfrJN1RdObjYfawI=
X-Received: by 2002:a1f:6094:: with SMTP id u142mr3245465vkb.8.1623923000187;
 Thu, 17 Jun 2021 02:43:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210617084924.1794989-1-alex.kanavin@gmail.com> <993f16d9-c1d7-161c-eaae-e00aef69bcd0@windriver.com>
In-Reply-To: <993f16d9-c1d7-161c-eaae-e00aef69bcd0@windriver.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 17 Jun 2021 11:43:08 +0200
Message-ID: <CANNYZj9xgCR_bh5EmDQbQ2Ty6j7yXA+VmjHOZ95_gn6zTp-tUg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] util-linux: backport a patch to address mkswap hangs
To: ChenQi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000919de305c4f30938"

--000000000000919de305c4f30938
Content-Type: text/plain; charset="UTF-8"

On Thu, 17 Jun 2021 at 11:24, ChenQi <Qi.Chen@windriver.com> wrote:

> The patch name seems a little weird? The commit id is better to be put in
> 'Upstream-Status: Backport [xxxx]'.
>

I fetched directly from github. It's going to be dropped on next version
upgrade, so doesn't really matter.

Alex

--000000000000919de305c4f30938
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, 17 Jun 2021 at 11:24, ChenQi &lt;<a href=3D"mailto:Qi.Chen@w=
indriver.com">Qi.Chen@windriver.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">

 =20
  <div bgcolor=3D"#FFFFFF">
    <div>The patch name seems a little weird?
      The commit id is better to be put in &#39;Upstream-Status: Backport
      [xxxx]&#39;.</div></div></blockquote><div><br></div><div>I fetched di=
rectly from github. It&#39;s going to be dropped on next version upgrade, s=
o doesn&#39;t really matter.</div><div><br></div><div>Alex<br></div></div><=
/div>

--000000000000919de305c4f30938--
