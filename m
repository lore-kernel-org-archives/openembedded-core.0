Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 937CEC433F5
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 08:10:30 +0000 (UTC)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com
 [209.85.222.49])
 by mx.groups.io with SMTP id smtpd.web09.9622.1638951029576601829
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 00:10:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Pxcl0YIl;
 spf=pass (domain: gmail.com, ip: 209.85.222.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f49.google.com with SMTP id p37so3237987uae.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 00:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HPzEQ/gM/+1u6FnwRxgni8rbPn8BMHD61ENBsMYREhc=;
        b=Pxcl0YIlQpuJkhlKZcI0FD8Sh3he6xqSZtbdgYW40rpczBa0ZwfboEcAbpLUKpRZhK
         YRDmk4ea+FHQ5bE4akIcV1LaTFHszhmDVqgqrZSy9Xr0HFdiIiDQZIrej5b8/iX82snb
         fHW7l+av/82ZMFuiVEnJfQjNnxXCXw5uWpmHXpHWU5szEVJmLf2E9cyZz1JgeKUg8rG6
         JySl5/Un0YF/RJfqdw5qLBCFdI6bVGG7tUkGI6O04R+BYPBNgVADHNRsj9USXs9ccrls
         spV/PKQgpoUGMIfpW0yKtXTe/H+RBVDNcGUfvVYDTiu4nV78leiCEpA/Q410jnNC1d4O
         Vh0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HPzEQ/gM/+1u6FnwRxgni8rbPn8BMHD61ENBsMYREhc=;
        b=LEQSwVcgyGtErJSEd6hnE0w6FifXtnZFK0PzEHcnDCrpppbRkJTdYoUsZcVSOXKMv0
         lNVHK9wwvAFoNAWhrnhKLnZpQSNeDPGOnVUR8H213XcBzp12wCi4YX5dYmHCAyE3SCyg
         qfoVLRDnz6KVY58CVZGAt/21TXoPwPU2HSOiphLZFDGwzMrOOc0doHVq0gj6pRfa/Ae/
         1sGVDf7kzsg/WNU4OMLJXu0TFjALw49SUbUeLyVhiem/bi7YNZ2uO7ZS6PfJUylKYvox
         Xi39rt+BT06j5G2SRscaJY6X2FzY2EyvUKNR/NtEoUFRZ76IgsfrfIYR+jU9SsqVikr4
         6rkA==
X-Gm-Message-State: AOAM530kXYIbKhZ0gLN9IPacwERVyM3xXmJPDAvmwX+amAsZTB+XaFSp
	ZRd9XJPsiTC/L0/6kmt5m6QWZnz0eZpMfdt5MAQ=
X-Google-Smtp-Source: 
 ABdhPJyrmN1iHN9zpFTnOokXtbWSzUsxaLIQX9B825DxqeR3esfkhrH3npEjzJB8kOrWihd3c0yu/kKZyHkI7TXDb4I=
X-Received: by 2002:ab0:55ce:: with SMTP id w14mr6353676uaa.93.1638951028695;
 Wed, 08 Dec 2021 00:10:28 -0800 (PST)
MIME-Version: 1.0
References: <20211206080406.3249-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <9dd70fe87463e8d9cfa9cb0c612ecbc7bd150b7d.camel@linuxfoundation.org>
 <3cda9bd5-1c75-7269-921c-97c1ac6c4fb5@weidmueller.com>
In-Reply-To: <3cda9bd5-1c75-7269-921c-97c1ac6c4fb5@weidmueller.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 8 Dec 2021 09:10:17 +0100
Message-ID: 
 <CANNYZj9W613_D++e=OH63rE1=rRAciziOKM439Yw4nxLai7ymA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/4] recipetool: Set master branch only as
 fallback
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Content-Type: multipart/alternative; boundary="000000000000dea82105d29e058b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Dec 2021 08:10:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159342

--000000000000dea82105d29e058b
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 Dec 2021 at 08:45, Stefan Herbrechtsmeier <
stefan.herbrechtsmeier-oss@weidmueller.com> wrote:

> I will update my patch series but need some time to test it locally. The
> devtool test build a lot of recipe on every run because it use a private
> sstate cache. How does the autobuilder overcome this problem?
>

If you don't rebase the branch used for testing, and set the cache to a
directory outside of build directory (e.g. /home/stefan/sstate ) it will
reuse that cache between selftest invocations.

The autobuilder uses a single writeable cache for all builds and builders,
mounted as read-write NFS partition.

Alex

--000000000000dea82105d29e058b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, 8 Dec 2021 at 08:45, Stefan Herbrechtsmeier &lt;<a href=3D"m=
ailto:stefan.herbrechtsmeier-oss@weidmueller.com">stefan.herbrechtsmeier-os=
s@weidmueller.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
I will update my patch series but need some time to test it locally. The <b=
r>
devtool test build a lot of recipe on every run because it use a private <b=
r>
sstate cache. How does the autobuilder overcome this problem?<br></blockquo=
te><div><br></div><div>If you don&#39;t rebase the branch used for testing,=
 and set the cache to a directory outside of build directory (e.g. /home/st=
efan/sstate ) it will reuse that cache between selftest invocations.</div><=
div><br></div><div>The autobuilder uses a single writeable cache for all bu=
ilds and builders, mounted as read-write NFS partition.<br></div></div><div=
 class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Alex<br></div><=
/div>

--000000000000dea82105d29e058b--

