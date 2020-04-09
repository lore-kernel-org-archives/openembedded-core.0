Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web12.10027.1586442663595208144
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2020 07:31:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=l/OMNXh5;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id c63so4122092qke.2
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2020 07:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0fgEvWRXEP5VEIAomFkV/yPNuBiq0kZMCy9sPaupzBQ=;
        b=l/OMNXh570rllapfnZznAvr7xcdwmlbBvbNMCSNWSrJkBlEU0DmUme78LVr9iRd9/Y
         uqZDj2PC8Bt2UzfLhaBPHB6ssMFJ92yPapDykWV7Smow7PRS+Mz9xe2ZPJ/4U4RYzVKV
         XPWYDLYCBhjssws2B+hF6GbtYOXHht/qC5g1evYmBfM9zoSjctE6J9oCwBjES3IZg/YI
         pwpjOB3sV9fbbTMTREfX7URXtoKK37qp70070i1k/nyV6NTPNuvlW58z7pZCk/qaU0bJ
         lVKGnhubwdGBtljLnFxMsFZzz6fCR7Jx49SJxsbJZjTPW4wzddbq/hUb73mImqXlCNFZ
         ENEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0fgEvWRXEP5VEIAomFkV/yPNuBiq0kZMCy9sPaupzBQ=;
        b=g6hP97C/vMkBppLYM1tOKMQToRh2S/DtEGvk1YVY0S1R1KgZ6DyxpiEhen0IX+nNkl
         nENue/URjFEaMDaVPbjiHOzj+7TGbNDEz/F6idoY34cjn0hllRAEr/Ftc7+RfXI9DtNH
         bvHRDY0sP7DcBkbsqY9FjOml2X5j3EuYHN5f5HaN6zBt8D9vukI2CAgS4zNm92JUEr6T
         Rq2LVzYD3R9pz6TBB6liJTG/2uXsxSd/tnJ3qEpsiqylmejLELHju+QIAQMsDHCAws7k
         XYkzplCksb+RfqK8RS+UaryXgZgC60kMXZB+xIpKILbhexrHZASMK5nmVVy/QDVJJr6Q
         ceaQ==
X-Gm-Message-State: AGi0PubYZzqC14qBONmov8JS76qI/qfhMp3rzkNwzubscii2I4I68lQy
	sx+m0cyvCpmO1JpEvSzyoy0gRto1sC8UcuVwfuQ=
X-Google-Smtp-Source: APiQypIDs/VcSCC1Vqdgqb7Iyf9icg1P9/ykyp9eFs7ZENP3nqFnMfOGGzC8i9GdrN78NQ7wjWn1zEt5mBBYwFQTPkc=
X-Received: by 2002:a37:bec5:: with SMTP id o188mr53152qkf.165.1586442662263;
 Thu, 09 Apr 2020 07:31:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200408231808.393685-1-richard.purdie@linuxfoundation.org>
 <CAMKF1srJ72-knr8BJxGcJ6Mct=y_Dt4DtZWMhs5UM+eoCf4i6A@mail.gmail.com> <ed42da631684e5b7151a03a3bfd692fe779ded65.camel@linuxfoundation.org>
In-Reply-To: <ed42da631684e5b7151a03a3bfd692fe779ded65.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 9 Apr 2020 07:30:34 -0700
Message-ID: <CAMKF1sroZrjR+g5DP1vZ3pFYxsJAxBHp2eMiDkE7DiurTa8YLA@mail.gmail.com>
Subject: Re: [PATCH] musl: Show error when used with multilibs
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 9, 2020 at 2:47 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2020-04-08 at 16:45 -0700, Khem Raj wrote:
> > On Wed, Apr 8, 2020 at 4:18 PM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > As discussed in the bugzilla entry, musl is not compatible with
> > > multilibs
> > > and has no plans to support this. Therefore tell users this from
> > > the
> > > recipe rather than letting them run into build failures.
> > >
> >
> > I dont think thats the case anymore, I have sent patches to fix
> > multilib on musl. this seems a broad brush. What are you trying to
> > fix ?
>
> The bug said we don't support multilib and musl and the code clearly
> currently doesn't, so this patch was to make the situation clearer to
> users.
>
> Based on the need for your patch and other patches, its clear that musl
> and multilib doesn't work as things stand today.
>
> The question becomes whether we want to support that? Do we want/need
> to add automated tests for it?
>
> We've built 3.1 rc2 which is in QA so this wasn't going into the
> release, maybe the point release, or if we rebuild for some reason. I
> do want to do something with the bug. If we want to enable multilib
> with musl that would be a 3.2 activity.
>
> Perhaps we should merge this change, then remove it when the other
> issues are fixed?

I tthink fixing musl for a mixed mulilib is a bit invasive at this
time of release so
agreed on that. however this will disable a usecase which is valid for
musl systems
64bit kernel + 32bit-only-userspace. So I am a bit torn here to
disable it completely.
perhaps a parse warning might be good compromise.

>
> Cheers,
>
> Richard
>
>
