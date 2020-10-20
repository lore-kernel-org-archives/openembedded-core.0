Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web09.2140.1603219983069877742
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2020 11:53:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RpLpW2cK;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: petr.vorel@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id c22so4308867ejx.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2020 11:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:in-reply-to;
        bh=wuvRu8tQet6Mb/Wm8DqA8JbAWj2tOn5TKPAYnGhyz04=;
        b=RpLpW2cKaoamamQlnbWO1AKKWMZUknlPHmELMy6gRCZ2cNxqvjbDYf2UAITo2d3j/2
         p9HXbzf6uJhPRfp2+v9nbLiQu7Wlgcd41BDJNwNuVgOSwzi/0O+h+LxxZ48g6Mdf2TTv
         aHMOcLTwsTXg1h+Sl+v2024Q7IoQTHzSYwAYdZ/BpytXmoH2NZd8Mco7oCeNf/CgSw5o
         WKLFHUgfdf8ujRjcEHJ7jp0e5Z+cxdMkHd/t8qHkWRWrnXNlOo2zzA0MftO1RIDKkqIk
         Dk6RAmoCprl8xiEMOM5tvyo/l30GlREPOZrTKdCUFOA4B+Z72F1f5HccAMwWor3rqaDV
         Kx5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to;
        bh=wuvRu8tQet6Mb/Wm8DqA8JbAWj2tOn5TKPAYnGhyz04=;
        b=p3DNMRSZtoQFuYf0QtZmYaujqNcsV/eSWfg8yqiUoQd+O0t7SXAK2MqqhyrIWkvcM3
         RpM8Xk7u6RNtpgNkiS2t3uwhoIxU7XRvdneN29yRw/aXa3xJ7ZRWn/gpW1mXn2iXYqLE
         H61wPN+X6sZVJ/8kZ3jrwUI5vuFsbcTtux2Lj3NIs1qE50XymYWw0aFw+5VOGTmvMET7
         fNQLbuW58M9+GqhETjiTe35c8IJ1X6UMO7HsvAc6eJboS3i2lFzeDi8t5YG8nuP289UE
         BnOFBx14Kn/0QmtqfZmoP8XtQrHG3nlbt2Ovr6lwtcyNwp1P/K5T1R3Oew4E/flJpENL
         OJ0A==
X-Gm-Message-State: AOAM530cdyaOAvXXAQr6vMFs5/aCjC8vWTqc2kj66uYKTpwqg4gfllZC
	L1fZGUCpntZszI30aDKjh9A=
X-Google-Smtp-Source: ABdhPJyoJ87JbslNc+yBFyWdjcZR5oWSJOxCM98HphhC2EAZUG6R52LBPUaGjEJ5sGR4OI5ZSGnYcQ==
X-Received: by 2002:a17:907:208b:: with SMTP id pv11mr4749006ejb.426.1603219981564;
        Tue, 20 Oct 2020 11:53:01 -0700 (PDT)
Return-Path: <petr.vorel@gmail.com>
Received: from x230 ([62.201.25.198])
        by smtp.gmail.com with ESMTPSA id ce15sm3813834ejc.39.2020.10.20.11.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2020 11:53:00 -0700 (PDT)
Date: Tue, 20 Oct 2020 20:52:58 +0200
From: "Petr Vorel" <petr.vorel@gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Khem Raj <raj.khem@gmail.com>, Anuj Mittal <anuj.mittal@intel.com>,
	He Zhe <zhe.he@windriver.com>,
	Anders Roxell <anders.roxell@linaro.org>,
	Yi Zhao <yi.zhao@windriver.com>,
	Daniel =?iso-8859-2?Q?D=EDaz?= <daniel.diaz@linaro.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/1] ltp: Update to 20200930
Message-ID: <20201020185258.GA92663@x230>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20201019201332.12446-1-petr.vorel@gmail.com>
 <CANNYZj8k8zbpQMD-Y2EQF_y4AffOReL1v=5Luw2dy2yAxA9r8g@mail.gmail.com>
 <20201020182253.GB18387@dell5510>
 <CANNYZj8Kcj_fzScBaaaO4ogeuoxhOTb4kmGvpX55m+_dz9RKsA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj8Kcj_fzScBaaaO4ogeuoxhOTb4kmGvpX55m+_dz9RKsA@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> On Tue, 20 Oct 2020 at 20:22, Petr Vorel <petr.vorel@gmail.com> wrote:

> > > Thank you, but please set Upstream-Status properly for the two newly
> > added
> > > patches.
> > Thanks, fixed in v2.


> Seems like v2 does not actually have the fixes?
Oops, forget to amend the commit.
I'm sorry, there will be v3.

> Alex
Petr
