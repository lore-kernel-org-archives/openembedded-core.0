Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
 by mx.groups.io with SMTP id smtpd.web11.6032.1622193905787315219
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 May 2021 02:25:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RVkIMTFG;
 spf=pass (domain: gmail.com, ip: 209.85.217.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f43.google.com with SMTP id n1so1824324vsr.10
        for <openembedded-core@lists.openembedded.org>; Fri, 28 May 2021 02:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PZRlcOIK/IYwM732ppEMmcHEiSsc+ULq+PXwvDtoNJQ=;
        b=RVkIMTFGk47z+OpQVzAzvGB3Nu/H0EMMwRlor4WWZj59dvB/Q7yxuVXt6N3l38tc6y
         K2IBi2n6vHTH7ADSHGN/wsxon49UwJrs4XQY1Y/puRAtzzMwUMK7jE0tiBGoc8B0htNj
         zd42YnfQFqka5oueXmQQxoxvvGktVZoO5EYpczyERuDDjVE1s3HYQrc0rCp/hA0RIwDh
         p9f2OafzkfttnjI9/aFeaiTpo2vNkndfMIMA9+EYi2RZhEb4vCayFg9FqG+Rp8EcWecl
         v4mRysFZdvj1zPCShZ3XK+DyrUE0h/eH68hSj6r3fqDiSMfsdN0QS3ZCJFdtiesAbatH
         kImA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PZRlcOIK/IYwM732ppEMmcHEiSsc+ULq+PXwvDtoNJQ=;
        b=JUKFwq3q2vuMfWBFxY3HZYqm6rs2sFxhSKf/ckgnLAoL2Jz06xA0wwJWh7qwkZrTb4
         iEZGX63Bw5aiF6gjp309Twohvbcken16t0ceaH2wTIXklzy1pTWrbvmdNlAAfI2NKwJp
         2fbq6H5vqLq7A1KZBQ5d4UpM+wc3iR2r9e89GnG212/EvCbKZhH6mgz0pTwR07gKJP9z
         v//Wq1rzj26B1rjHfxBoJzoOHfun58OG+Nz6pIlI0saPxotMAU2ZzXQB/VkvQdQnHfTy
         WJBsv7WPXEww5No+6ZPPanvPB9CsgaPy1shYsst2eilB75wSKHki8OsRa1wIDdJoLUh1
         FeBQ==
X-Gm-Message-State: AOAM533baa5yB36SljcKzeVb8rLIhVeR86ICrbx3XINXBSpm4pHVOljR
	uj/clo87j4F2Lp371jYCAn9NzBCeTtpcAo0Umo950UTe
X-Google-Smtp-Source: ABdhPJwd/9hcfiPdtwJyWMvk7M9QFsAhNqX2PeY9u3EYk7PoGzWOEHgHYHiBL67s7//jM4g6Zy8HkuJTtm3pTszvU1o=
X-Received: by 2002:a67:f04a:: with SMTP id q10mr5834764vsm.41.1622193904901;
 Fri, 28 May 2021 02:25:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210528082955.6819-1-changqing.li@windriver.com>
In-Reply-To: <20210528082955.6819-1-changqing.li@windriver.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Fri, 28 May 2021 11:24:53 +0200
Message-ID: <CANNYZj8YVuo0sCcQDrsFNgf-Dc199pOVr0G6-jfAg7i0tY1Arg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] bash: fix non-fatal error in log.do_configure
To: Changqing Li <changqing.li@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000007562fb05c3607349"

--0000000000007562fb05c3607349
Content-Type: text/plain; charset="UTF-8"

On Fri, 28 May 2021 at 10:31, Changqing Li <changqing.li@windriver.com>
wrote:

> error in log.do_configure:
> ERROR: invalid first argument to AM_GNU_GETTEXT
> ERROR: Use of AM_GNU_GETTEXT without [external] argument is no longer
> supported.
> + dnl initialize GNU gettext
> +-AM_GNU_GETTEXT([no-libtool], [need-ngettext], [lib/intl])
> ++AM_GNU_GETTEXT([use-libtool], [need-ngettext], [lib/intl])
>

This does look like something that should be properly fixed upstream, can
you rather make a patch that fixes the issue at the source please?

Alex

--0000000000007562fb05c3607349
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Fri, 28 May 2021 at 10:31, Changqing Li &lt;<a href=3D"mailto:cha=
ngqing.li@windriver.com">changqing.li@windriver.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">error in log.do_configur=
e:<br>
ERROR: invalid first argument to AM_GNU_GETTEXT<br>
ERROR: Use of AM_GNU_GETTEXT without [external] argument is no longer suppo=
rted.<br>
+ dnl initialize GNU gettext<br>
+-AM_GNU_GETTEXT([no-libtool], [need-ngettext], [lib/intl])<br>
++AM_GNU_GETTEXT([use-libtool], [need-ngettext], [lib/intl])<br></blockquot=
e><div><br></div><div>This does look like something that should be properly=
 fixed upstream, can you rather make a patch that fixes the issue at the so=
urce please?</div><div><br></div><div>Alex<br></div></div></div>

--0000000000007562fb05c3607349--
