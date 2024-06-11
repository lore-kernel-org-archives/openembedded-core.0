Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93346C27C79
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 14:55:57 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.11699.1718117754899324822
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jun 2024 07:55:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BZb2dQLh;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: rybczynska@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-6819d785528so3930144a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 07:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718117754; x=1718722554; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HvXa25pco46RkoZl+EAFYrywBMZM33b0WDAi1bl6pUg=;
        b=BZb2dQLhJUAkAojWvG2mbhuxl94VI5sOU/OAFdAskiKKJRrEuIqx/GUNYbQ3FFDY+X
         YRebtpawBpUEgF+R3kuVFg9A569fQsDWneUANttIsie5f/CZvDvhim5x3rH+ISr4dyFU
         v5+r1kAUjogbCGhNiKFsKfGlhXkCIQfL0Ykb1j9cNnPcYVPG78tDkFERcZdCsK3PcOQF
         6NHwLxFSzhnE8ZIQ+PXKDTRk/EOXLng3KCMBnN5Zg32XHYJF4uPDyOmdrWR+OVss6lAI
         hscxbGgTGfAh2f+SQ6RZMgnx749riZSDS7/p7DSeMSHPGvJFj4AzpTzOxzh4jV5jBJfC
         IRVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718117754; x=1718722554;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HvXa25pco46RkoZl+EAFYrywBMZM33b0WDAi1bl6pUg=;
        b=qTWzbNwsET83EqwqipBiFdX+4YHOOo0bedGTnEGz6MdbBAQYVTpMKgw+0DHOeVIl9l
         9ycp/PNvpqh6HpnfL09syw3JdlT8n7pLlAtKyj6LRtxQfxKjuJHUMfn+znGrunDaOUfD
         EYXQN+vHugbxQeY9fMbQ3gfjS+MLhGjTxh3Irz34zEiO0bFMpX4sJDmETm1HLKlj9pNT
         twRMbTkXdHt83NbZ3Angf/jVllCtPJVuz9ULA2FEaIzD8VFWy6VFrO3LD4D/aO/bHEAs
         cFWhZfD6L2S+Yoah5T/QY927vJACojn+mAVQiq/5qulg+kIt83KPlzi2uMnVZm3+89l1
         Wclg==
X-Gm-Message-State: AOJu0Yw0Qn+CTifBdd1DMSchTeUee/oGD3FUrdUHWHUKXYmtAr47hJN2
	bI9Rht4Uy1MA8WJ0JlcD2clGJnKmo+ipL4It59RcqCZSHUpuyH+lhk4XW7LaVswp0xUK2fKkckG
	NJkT5B+JWkJ203Qdewz430/qjQEdNvrWl
X-Google-Smtp-Source: AGHT+IE6hrE/ipJ76UY90WvS2x7ajrQdaWM/WjY0eEcf4yyYMy5Sr5jfFOlatoIQfRU6y3pyI2quDLd7MKI3EJrsw90=
X-Received: by 2002:a17:90b:11d8:b0:2c3:2243:5d8e with SMTP id
 98e67ed59e1d1-2c3224367b3mr3368343a91.49.1718117754105; Tue, 11 Jun 2024
 07:55:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240609192711.413867-1-an010@live.com>
In-Reply-To: <20240609192711.413867-1-an010@live.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Tue, 11 Jun 2024 16:55:42 +0200
Message-ID: <CAApg2=Qz8Kc0Y10fL=pLvr9iR7Vk3PAg4akpTBBziLWGUqYx6Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cve-check: Introduce CVE_CHECK_MANIFEST_JSON_SUFFIX
To: aleksandar.nikolic010@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Aleksandar Nikolic <an010@live.com>
Content-Type: multipart/alternative; boundary="0000000000006a7668061a9e76bc"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 14:55:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200536

--0000000000006a7668061a9e76bc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 9, 2024 at 9:27=E2=80=AFPM Aleksandar Nikolic via lists.openemb=
edded.org
<aleksandar.nikolic010=3Dgmail.com@lists.openembedded.org> wrote:

> The variable contains the suffix of the CVE JSON manifest file.
> By default, this variable is set to 'json', so the current behavior
> is not changed, but enables developers to use some other suffix,
> e.g., cve.json (similar to spdx.json).
>

Hello Aleksandar,
Thank you for the patch. Could you please explain what is your use case?
This isn't to reject your patch - we're moving this whole code base, so I'd
like
to understand how to take your use-case into account.

Kind regards,
Marta

--0000000000006a7668061a9e76bc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Sun, Jun 9, 2024 at 9:27=E2=80=AFPM Al=
eksandar Nikolic via <a href=3D"http://lists.openembedded.org">lists.openem=
bedded.org</a> &lt;aleksandar.nikolic010=3D<a href=3D"mailto:gmail.com@list=
s.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">The variable contains t=
he suffix of the CVE JSON manifest file.<br>
By default, this variable is set to &#39;json&#39;, so the current behavior=
<br>
is not changed, but enables developers to use some other suffix,<br>
e.g., cve.json (similar to spdx.json).<br></blockquote><div><br></div><div>=
<div>Hello Aleksandar,</div><div>Thank you for the patch. Could you please =
explain <span class=3D"ng" style=3D"background:none!important">what is your=
</span> use <span class=3D"ng" style=3D"background:none!important">case</sp=
an>?</div><div>This isn&#39;t to reject your patch - we&#39;re moving this =
whole code base, so I&#39;d like</div><div>to understand how to take your u=
se-case into account.</div><div><br></div><div>Kind regards,</div><div>Mart=
a<br></div></div></div></div>

--0000000000006a7668061a9e76bc--

