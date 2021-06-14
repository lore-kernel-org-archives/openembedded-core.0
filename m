Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web10.1924.1623696312512414287
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Jun 2021 11:45:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ePevSekl;
 spf=pass (domain: gmail.com, ip: 209.85.219.179, mailfrom: sakoman@gmail.com)
Received: by mail-yb1-f179.google.com with SMTP id b9so16852871ybg.10
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Jun 2021 11:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zy2+cprfJAXQspWw124jkl0Q0mIzp6XItB7fuHK8V40=;
        b=ePevSeklLWnsHLYVW3GJDRUPISDKkV0kuIyvXPWWL1WnbHmOlM/npjh5/MXH86aPV+
         ya4qDITncUHvCX6Kjanq20OjvzJZb0VaOyyJYpsBghOrK/9uWDLqzQQAOjM/uEeqIMTG
         osd05pI6bMVrX1aiLChtyh9D7c2lyyIV9FZfpvELUjwF4H6Pkwa7/N70+aU84JgtXjI2
         7853XL152/BpiohXA9MDbg0hsyaOEGUG/v9rBPhJo4tEnV3SX+C7nq0vBEfx4zH6NJ45
         HGRX4ds15jhO/8KKP0IvRomesnDP0Ak0yUz/Zw2KFA15hRvIozteGtnhtjgSrrCzi5Jg
         b9WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zy2+cprfJAXQspWw124jkl0Q0mIzp6XItB7fuHK8V40=;
        b=EW+6XS0i5YOozA7w96gs6aDqcGW9BKOeMicw47EANqYb15OMbBwfa9h2Gnd2w1xGkK
         nj1wFvapRxQk1fyOUTfGiU38Mxht1wpbveqRc9P1Fa9fEQZPsACXz5Bqi0KJxH9cJ9p1
         ZZWhU3Y623ArLp2rkxyvt/uQ48fYJuX3v6q0uLPINSPpkhvFba9IbmywA/L3hwGUhg2i
         MqyTO6r9TQlwxu9rajJQi4g3UswXBJ0siqvUCzCzodVS9UMBMzi74nPAQBiSZnKdHYfh
         wza2IkgauqyMyFbp0mQT0F4m1aCp1ZAdvpVqTBHtAekGwleXz3uVtOl8eTKNqfVm0fc5
         1Cqg==
X-Gm-Message-State: AOAM5323RsUvLBe45+jLyLkMh71zPm7i4kjkkI2mFWV9XJNlYR6e7mNX
	zBso+uOf1mZHv+56L8JC2AyemWYwf84IxhwIAX0=
X-Google-Smtp-Source: ABdhPJzKBMAgjEIYrlBj4V8tIeGrQBrICT7pwWnxr+ZedhZ6oSlxELBVKy3NX3xcB5qr5UtcXqdV0VqMBE6NXBA1kGA=
X-Received: by 2002:a25:740e:: with SMTP id p14mr4835153ybc.416.1623696311680;
 Mon, 14 Jun 2021 11:45:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210614104631.3190-1-Rahultaya96@gmail.com> <2f2de529-721b-b561-ef3d-ac93a7da3178@gmail.com>
In-Reply-To: <2f2de529-721b-b561-ef3d-ac93a7da3178@gmail.com>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Mon, 14 Jun 2021 08:44:59 -1000
Message-ID: <CAGDS+nnPm_5HLyf7DzwXt+CLdGqm0yL338_fv6z_pfyxzT1gbw@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][dunfell][PATCH] protobuf: Whitelist CVE-2015-5237
To: RAHUL taya <rahultaya96@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>, 
	Nisha Parrakat <nisha.parrakat@kpit.com>, 
	Purushottam Choudhary <purushottam.choudhary@kpit.com>, Armin Kuster <akuster808@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 14, 2021 at 5:45 AM Armin Kuster <akuster808@gmail.com> wrote:
>
>
>
> On 6/14/21 3:46 AM, RAHUL taya wrote:
> > As per below reference links this CVE issue seems to be minor and
> > harmless and as per upstream this is not a real issue in practice.
> >
> > And as per red hat this issue is marked as low severity.
> >
> > 1. https://bugzilla.suse.com/show_bug.cgi?id=CVE-2015-5237
> > 2. https://security-tracker.debian.org/tracker/CVE-2015-5237
> > 3. https://ubuntu.com/security/CVE-2015-5237
> > 4. https://github.com/protocolbuffers/protobuf/issues/760
> Thanks,
>
> Please use the openembedded-devel@lists.openembedded.org
>  for meta-oe patches.

Also only tag for the intended repo, in this case [meta-oe].  I can't
imagine a case where you would need to tag a patch with both [OE-core]
and [meta-oe]!

This maintainer gets confused easily, so if you tag a patch for
[OE-core] and it is for a recipe in [meta-oe] I will waste time in a
state of confusion ;-)

Steve

> -armin
> >
> > Upstream-Status: Pending
> >
> > Signed-off-by: Rahul Taya <Rahultaya96@gmail.com>
> > ---
> >  meta-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb
> > index 4d6c5b255..f845a72a0 100644
> > --- a/meta-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb
> > +++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb
> > @@ -88,3 +88,11 @@ LDFLAGS_append_arm = " -latomic"
> >  LDFLAGS_append_mips = " -latomic"
> >  LDFLAGS_append_powerpc = " -latomic"
> >  LDFLAGS_append_mipsel = " -latomic"
> > +
> > +# As per below links this issue is minor and harmless and
> > +# as per upstream this is not a real issue in practice.
> > +# https://bugzilla.suse.com/show_bug.cgi?id=CVE-2015-5237
> > +# https://security-tracker.debian.org/tracker/CVE-2015-5237
> > +# https://ubuntu.com/security/CVE-2015-5237
> > +# https://github.com/protocolbuffers/protobuf/issues/760
> > +CVE_CHECK_WHITELIST += "CVE-2015-5237"
> >
> >
> >
>
>
> 
>
