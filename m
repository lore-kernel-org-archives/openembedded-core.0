Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web11.5920.1588858340697022482
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2020 06:32:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LrgMnk5Y;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id y24so6858033wma.4
        for <openembedded-core@lists.openembedded.org>; Thu, 07 May 2020 06:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=waMVxyJh3p4GU4w7Pu9nJFPrvnHiKOykSoVQ3X3ScRo=;
        b=LrgMnk5Yk92a0z5Okk8yhJkGWZ1JVQ16iMSjpvEGneiRHrU+iyk7AveclgQpfvPWtl
         vLLpKYLKkJjHyK0HspDS85Ef/Tbb/053CN14i8GrQjFXshy7I6JHfSgiLNghaRP+aHKn
         UL5jJ8j1bq27z5vUJmg5TmB4gkTSf8jIcmzOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=waMVxyJh3p4GU4w7Pu9nJFPrvnHiKOykSoVQ3X3ScRo=;
        b=RrsZgoYnK9QisMDHVP0EfuXjjPgRz/x0oHW89is+DqNlPaiUI4M+7MPMjElIntpmkq
         tmKoPIDu6XqjoV3TFU5PKnG2GTNZ+Nb7C7NS6qYGradJ2O6B1Cb0rljdusSKPXElCWpZ
         EjikiNxRbV8jWtQt9JCoN/x7mpTs8/dB7kuPKkyaj73uboF+q5dRB+UzpOf5uG56KBlb
         nSxlFZKLYxNiLnYElMWdpyBuTEIf+ZQEwImH+S9uX89AGpG9R2GsfseUcWRtK/eHSjQV
         W/L8k1KtTYAkL12Oq4/0lc/vjVgJVS996YS2+3vWHEEqTu3aXO8AsYQq7Qd4EMjZ8L67
         3DIA==
X-Gm-Message-State: AGi0PuZyIbicpSKhRvpShvue88mvJcfTEJWK/pz9nTKIxzL/fYUMd4sC
	idsl0baLVyysCD7ign7I+eKE4Q==
X-Google-Smtp-Source: APiQypJSohMPHdHtUZgUbLnyzdRKLEtk/2z9Gf52zY54A9N0S4qI49iNmyPgJZgKU8LB2G4L0N2Rdw==
X-Received: by 2002:a1c:9a81:: with SMTP id c123mr9698993wme.115.1588858339123;
        Thu, 07 May 2020 06:32:19 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id w4sm8104808wro.28.2020.05.07.06.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2020 06:32:18 -0700 (PDT)
Message-ID: <5c29774137778c7e4fe33421edff0a0d645575cd.camel@linuxfoundation.org>
Subject: Re: [OE-core] [Openembedded-architecture] Proposal: community maintained recipes in oe-core
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-architecture@lists.openembedded.org, Jens Rehsack
	 <rehsack@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Thu, 07 May 2020 14:32:16 +0100
In-Reply-To: <CANNYZj8K_3=pQQrLZD1D+vFhSxLsRTDxTsYB1r8wMZw7f4whKg@mail.gmail.com>
References: 
	<CANNYZj_R3LO5nZs77j_2HBYQx44rf=9pMz=oABvXzDAxSvzBWQ@mail.gmail.com>
	 <53530eac-ce1c-db1a-f489-1d5a4a910870@gmail.com>
	 <CANNYZj90z3JYhajCF9fEDeUXgsYJary9PKk0GbihAHp_FH3_cQ@mail.gmail.com>
	 <1AEA4CE9-1C08-4336-9634-B546476F92C4@gmail.com>
	 <CANNYZj8K_3=pQQrLZD1D+vFhSxLsRTDxTsYB1r8wMZw7f4whKg@mail.gmail.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-05-07 at 15:24 +0200, Alexander Kanavin wrote:
> On Thu, 7 May 2020 at 14:38, Jens Rehsack <rehsack@gmail.com> wrote:
> > > I agree there should be a way to update maintainers e-main once
> > we determine they are not longer willing to take part in that
> > program or absent. I believe this an issue in general for
> > OpenSource has had to address over the years.
> > > 
> > > My plan is to experiment with this for the python3* recipes in
> > oe-core for a start: they've been bouncing between various people
> > over the past couple of years, but no active maintainer has
> > emerged.
> > 
> > I'd like to see 'non-systemd init' in, either :)
> 
> On a technical level this means updating maintainers.inc entries to
> list oe-core list as the email address; the next AUH round (in a week
> or so) will go as usual (because it's the first post-release one),
> and depending on how maintainers react, and who hasn't sent anything
> at all for a long time, I will propose something specific.

I agree we do need to do something and it was briefly discussed by the
YP TSC who basically agreed we need to tweak things.

Firstly though, we could do with digging out Ross' original emails and
properly documenting "maintainers" on the wiki. I thought we'd done
that but none of us could find it with a quick search which is bad if
it does exist.

Is anyone willing to summarise the current process on the wiki based on
those emails? (or point at the page if it does exist!)

Cheers,

Richard

