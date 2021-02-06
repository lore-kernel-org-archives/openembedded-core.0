Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web09.3590.1612593903112920559
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Feb 2021 22:45:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ilVQUDNL;
 spf=pass (domain: gmail.com, ip: 209.85.160.177, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id s11so2960259qtq.10
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Feb 2021 22:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bNR4qNXPQJN77zyfZs3yaXqfm5+SnoZR7jc4wszVL2M=;
        b=ilVQUDNLWfP2TptV1Dm+IYhgqIEVzHEKumpXZ3QfeJfKp0Ex4c/pnxtnxMebnxbuPZ
         qgn2fI44esOndcgIdqO3RXXr4qFkvdqmJnNnWKkDRXUtGMK0/3nfiOUal/YijO0C98Kw
         FSQjNBThLJi4qelzQfCf++deIn45R7nQ1QPp1mLmbrQ1G5u2dD2KR1vfAgY3seyB50Eh
         M5cX3fRRk6LVMrcEtBiORIiDk1X1ms4zCEyw6rP4BeN7nRTlKrL3SVrWSXsuX9pjzXlD
         cqY5I28N/MWtvqUFU3yw+Q/XpO/RG/qYh6nav9xGIq3gnATEKYPKl1JBmkbZ/vFOi19s
         5stQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bNR4qNXPQJN77zyfZs3yaXqfm5+SnoZR7jc4wszVL2M=;
        b=j4tAq+PY/ViCRbp14RSI/V651WcTPWrjDMBWJIHiALK90iYfsqlV+neZT4li4iJVp6
         LTt0C8DuVvovMGbjA+w7LBIzFbvF30OXWNLWXIzeft1qAqtu2TDAz+wl1JnMQI+Nfvrr
         udWC4STcwSeMFRmPUYIlh5NFsgs+bZUW2jiF6ny0a1Ny5jCjsz31EaRByF6amimcb/PV
         TJUxAsEpSzEgTHQNvqfDjFiC7M6heEMOUcjrF8Cep3aYDnLtrCCvDcnFG4/7NGYdfXDA
         LbQuroIc9uWTqp9d4I2CiGm1uoG1xLv/y4RHrpwls3pAyd901jqus0HJkvQ2YtzrPRzz
         9CyA==
X-Gm-Message-State: AOAM530/jaQ9IvltPVTIiT1kOlqhyDJYEyzGCnNA51qPtv5W7biXkvOH
	GZUVNBi4AhRH6LrSjVUAJKa1FNeIooJBp7eZ4mg=
X-Google-Smtp-Source: ABdhPJxmNsp58w96Cs7mfajvGm7CFGE4U9SoL9uZR35vi6dgs1ponZZJ573tUSBafB+XfrxpoQbVSbJFmE7R0XdFctU=
X-Received: by 2002:a05:622a:44d:: with SMTP id o13mr1359344qtx.378.1612593902169;
 Fri, 05 Feb 2021 22:45:02 -0800 (PST)
MIME-Version: 1.0
References: <1611212366-44911-1-git-send-email-wangmy@cn.fujitsu.com>
 <8ff56839bd7345ac64d0221f0f588e9886b4ef38.camel@linuxfoundation.org> <CAAnfSTtQYhHwkFrMczvv0OdUhFPM18tLyYfhAV4EKEBnDRPfwQ@mail.gmail.com>
In-Reply-To: <CAAnfSTtQYhHwkFrMczvv0OdUhFPM18tLyYfhAV4EKEBnDRPfwQ@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 5 Feb 2021 22:44:36 -0800
Message-ID: <CAMKF1spQ9Ld=UHEWed9wHFhmog16YZhOjuif4Qy5wVZUqsm0pQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libcroco: CVE-2020-12825 Security Advisory
To: Ross Burton <ross@burtonini.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Wang Mingyu <wangmy@cn.fujitsu.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

I am also seeing

ERROR: libcroco-native-0.6.13-r0 do_patch: Fuzz detected:

Applying patch CVE-2020-12825.patch
patching file src/cr-parser.c
Hunk #4 succeeded at 799 with fuzz 1.


The context lines in the patches can be updated with devtool:

    devtool modify libcroco-native
    devtool finish --force-patch-refresh libcroco-native <layer_path>

On Thu, Jan 21, 2021 at 3:53 AM Ross Burton <ross@burtonini.com> wrote:
>
> And a CVE: CVE-2020-12825 tag alongside that too would be good.
>
> Ross
>
> On Thu, 21 Jan 2021 at 10:50, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Thu, 2021-01-21 at 14:59 +0800, Wang Mingyu wrote:
> > > References
> > > https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-12825
> > >
> > > Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> > > ---
> > >  .../libcroco/libcroco/CVE-2020-12825.patch    | 170 ++++++++++++++++++
> > >  .../libcroco/libcroco_0.6.13.bb               |   2 +
> > >  2 files changed, 172 insertions(+)
> > >  create mode 100644 meta/recipes-support/libcroco/libcroco/CVE-2020-12825.patch
> > >
> > > diff --git a/meta/recipes-support/libcroco/libcroco/CVE-2020-12825.patch b/meta/recipes-support/libcroco/libcroco/CVE-2020-12825.patch
> > > new file mode 100644
> > > index 0000000000..cde0abd676
> > > --- /dev/null
> > > +++ b/meta/recipes-support/libcroco/libcroco/CVE-2020-12825.patch
> > > @@ -0,0 +1,170 @@
> > > +Subject: [PATCH] libcroco: Limit recursion in block and any productions
> > > +
> > > +Signed-off-by:Michael Catanzaro @mcatanzaro
> >
> > Thanks for this, the patch has no Upstream-Status set though? Could you
> > resend with one please?
> >
> > Cheers,
> >
> > Richard
> >
> >
> >
> >
>
> 
>
