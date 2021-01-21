Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web09.5996.1611230029640262304
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jan 2021 03:53:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=UEuI8aNn;
 spf=pass (domain: burtonini.com, ip: 209.85.208.178, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f178.google.com with SMTP id b10so2140238ljp.6
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Jan 2021 03:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RnH9djSCuC9g3m7/2DR2M6rfgL4PCYX4Yg/jKElEoOY=;
        b=UEuI8aNn43oqd3USaXGDkkYXcZh8KIGZUi1ojaxmCGkpP4W2s9A6zBc7RS7Cyy99qt
         o3i286BpPkyf5LpsrE9MjikCryKm2aU0/2RS9Bhl61EAWbZg4PN1zghQ59o6gQuQfB5Y
         H5XRuHzrHJcpKoYMRv+Pi8ErH4JXlrk6IaLnqmuSBb48DT4H5Lh6PTBkJw3NYcESvuWQ
         GTkPMG5hshlumy/VtjLh8TSTLJWIxbcYdNzItfHsWoflKWRekPHCX4UPX+IrNwuJoFz7
         qHKVzTcwG8H6Q1PShYpOPjz6eOc08R3L6quaV0jHc0PAGx4nPwxzKf8/koIi1qjwsTwi
         kUtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RnH9djSCuC9g3m7/2DR2M6rfgL4PCYX4Yg/jKElEoOY=;
        b=bMv0iTzLF5Iuaz9qrcAhpA6SDZ+0tV/6b5Ew+2kocbuRKkP5MwGyPOxFs0rqWiWvhd
         /wLaY+66ueIQ26Q+rux6nw7kJZwdlQSvndWGroL1xt17po9rj2sHuupDhXfJE2BOrw8T
         QokxnQf7guQdw1HLm95zxKsGNnGXeZa2ROk2JTuL/qmmaZpC58I4yq57/kEJWk3J9kcr
         PYKC5ONaBhgpTiyzMgM2TFUSQ81yYZvCE84iefEF6ocZ6hfKlYJbBEk/JvzzMkbeRqLQ
         iZe4Ybc3VsEINgMBelp2nsJHK9yTdiQgqSS1BvMz8BwiYSLnviDkbZ+9/yh6LcAiPWhy
         ipLg==
X-Gm-Message-State: AOAM532Fc9RqHJ9u1ZJ3e0RZWZ10jJPBYMkwejUVDf6plkQl4Pl0Tcx1
	2GDwqGJ+QimLCQLgBNc/k3+rlb4u3emHmzNyyZwoPg==
X-Google-Smtp-Source: ABdhPJx6kzHK3+VE6PSSbHnJ5IBsYJ8+MqoVWAYo7sF4FpBQ9Rv3J7NWDM+KYizcUH0r+YZz6B2u22vXjyu/F1nW6Mo=
X-Received: by 2002:a2e:3807:: with SMTP id f7mr6813925lja.24.1611230027567;
 Thu, 21 Jan 2021 03:53:47 -0800 (PST)
MIME-Version: 1.0
References: <1611212366-44911-1-git-send-email-wangmy@cn.fujitsu.com> <8ff56839bd7345ac64d0221f0f588e9886b4ef38.camel@linuxfoundation.org>
In-Reply-To: <8ff56839bd7345ac64d0221f0f588e9886b4ef38.camel@linuxfoundation.org>
From: "Ross Burton" <ross@burtonini.com>
Date: Thu, 21 Jan 2021 11:53:36 +0000
Message-ID: <CAAnfSTtQYhHwkFrMczvv0OdUhFPM18tLyYfhAV4EKEBnDRPfwQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libcroco: CVE-2020-12825 Security Advisory
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Wang Mingyu <wangmy@cn.fujitsu.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

And a CVE: CVE-2020-12825 tag alongside that too would be good.

Ross

On Thu, 21 Jan 2021 at 10:50, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2021-01-21 at 14:59 +0800, Wang Mingyu wrote:
> > References
> > https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-12825
> >
> > Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> > ---
> >  .../libcroco/libcroco/CVE-2020-12825.patch    | 170 ++++++++++++++++++
> >  .../libcroco/libcroco_0.6.13.bb               |   2 +
> >  2 files changed, 172 insertions(+)
> >  create mode 100644 meta/recipes-support/libcroco/libcroco/CVE-2020-12825.patch
> >
> > diff --git a/meta/recipes-support/libcroco/libcroco/CVE-2020-12825.patch b/meta/recipes-support/libcroco/libcroco/CVE-2020-12825.patch
> > new file mode 100644
> > index 0000000000..cde0abd676
> > --- /dev/null
> > +++ b/meta/recipes-support/libcroco/libcroco/CVE-2020-12825.patch
> > @@ -0,0 +1,170 @@
> > +Subject: [PATCH] libcroco: Limit recursion in block and any productions
> > +
> > +Signed-off-by:Michael Catanzaro @mcatanzaro
>
> Thanks for this, the patch has no Upstream-Status set though? Could you
> resend with one please?
>
> Cheers,
>
> Richard
>
>
> 
>
