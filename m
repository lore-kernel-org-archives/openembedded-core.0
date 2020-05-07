Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web11.561.1588827982983453723
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2020 22:06:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VdlYQy66;
 spf=pass (domain: gmail.com, ip: 209.85.160.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f196.google.com with SMTP id h26so3701488qtu.8
        for <openembedded-core@lists.openembedded.org>; Wed, 06 May 2020 22:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6m/cNEdwdhrGsoogYt1hdUqguU+P79eycmtk3OebSgA=;
        b=VdlYQy66Q0ndTSmoFUsAIInkVRGZkJl2YdQmaL/kMfw8zYpspEvRF92sgfNjVotB8B
         pJpn20DLUhseLmocIETzafiNnQFRzG/Ph121TYNweYRAsmgeAh958A8hzqm4KDWWkn11
         mxO294UQLtJDT1wiq53qlsSOWVXq4Yt9D2kj77Ue8hqd63cbP6yoooYFQuiaeBRG9GK2
         2eU5/W0gK686q7jCf69TqRAOVbddH/ckersCa+dOuHOIsVrKT4dtSRTUsCgW6gFxAPw0
         iEIioYciYj99MyNJpLLPGXD+9Np1Lb5tVOJ9J8cQZ1lQA699oTmMcsiKDYEOcbPDEard
         1BpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6m/cNEdwdhrGsoogYt1hdUqguU+P79eycmtk3OebSgA=;
        b=Ros4EUXhclxC+2a+gIkR0FEZUuD6rmK+5LF7cFKM7DSedLHbsEZrSTdqrAYTvP4JON
         cS0gVJtnF/Sv8qyOsHR/54MPVIrWCjkrrDwP48e1WyncI5uS4Dj9inE20MDJVcQvvDRl
         JJhpjkbPDuPefAu8xdWGzpky+VxLUVxSRb5ZD3Om+Ax0cNBGVEb19Cac22WlCD0CCChK
         mcZZ7HRdyroRgUqV3iKrhR1n5GecC+sZMEDX9Xvwt0Fl7EzVkLhXI0rH0hZLVCgk6PUC
         +QJnYOyol4VzHfvT2cUYqLo5yGVKFmcU98pA9qZtVqeaR1rM0/mXqEcsMbR39Kd6av09
         vj6g==
X-Gm-Message-State: AGi0Pua05NWU9Kdzq5PgbJeE1IXAEEHRZgFCX8kKZD/SaBweA7xkO4Np
	aWzcxTBSORax7drrDNH+3DdhDKDo5XdX1of655M=
X-Google-Smtp-Source: APiQypJ1inA3KIhVPAf+Pw1US1q7GLX0HO2+tTm6MHo6N/2xvugfLmaAsLlcBKD7cLFZ5C66XlnTeLgs49zX8B69u+k=
X-Received: by 2002:ac8:31aa:: with SMTP id h39mr12070150qte.190.1588827981949;
 Wed, 06 May 2020 22:06:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200501082616.11296-1-andrej.valek@siemens.com>
 <20200501113952.15847-1-andrej.valek@siemens.com> <c87e24dbc0db75e91726ecb3a09c77de63dc4509.camel@linuxfoundation.org>
In-Reply-To: <c87e24dbc0db75e91726ecb3a09c77de63dc4509.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 6 May 2020 22:05:55 -0700
Message-ID: <CAMKF1sraogR4OuBmOo-Zwm5vuo1a9E0WvruO_T2S8-=sSrVc5g@mail.gmail.com>
Subject: Re: [OE-core][PATCH v3] icu: upgrade 66.1 -> 67.1
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Andrej Valek <andrej.valek@siemens.com>
Content-Type: text/plain; charset="UTF-8"

also fails to build nodejs-native see

https://errors.yoctoproject.org/Errors/Details/410591/

On Tue, May 5, 2020 at 8:00 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2020-05-01 at 13:39 +0200, Andrej Valek wrote:
> > - 0001-icu-Added-armeb-support.patch - rebased
> > - 0001-Fix-big-endian-build.patch - removed, already included in new
> > version
> > - icu-pkgdata-large-cmd.patch - removed, implemented correct size
> >
> > Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
>
> This is failing to build on arm native machines:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/97/builds/1187
> (and other arm native builds)
>
> Cheers,
>
> Richard
>
> 
