Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
 by mx.groups.io with SMTP id smtpd.web10.41538.1601312168757204665
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2020 09:56:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=o94/lPuC;
 spf=pass (domain: burtonini.com, ip: 209.85.167.66, mailfrom: ross@burtonini.com)
Received: by mail-lf1-f66.google.com with SMTP id y2so2086560lfy.10
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2020 09:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BDjVqJqVb0eVby39PMCzl3GUehDx7jRuumwoVAWIlgk=;
        b=o94/lPuCquJQD4WL/nTFWkvOJGrDsy/NrA4RdT8USDKWiipEIdcm9h5yysbfLTKZAo
         hgJpZ4wlonTGKfNj0NzTj07Ajw7DgBmbHC3i5InkjyblSJ/+rT043tZWoD74o+JDmgZF
         LnNZZQMVHahcY92pndiTJg0toIOOVkb+XwV9UJkMZjSOHZR9j/Flkq5dq6gEo0N6ymjM
         wUpNpw/s/vCnbOusWZvBkQdJXjFbKBpClGoNf5djW/BHIhk+nc2XTvMA3Xiq3M/ikVxI
         Z4IV2iWLkoobly7ODQEoC6rEMGnkwLEYML/3eiH3hMk44qh8xgdNkXoSrGUN6FNa2nPM
         8fbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BDjVqJqVb0eVby39PMCzl3GUehDx7jRuumwoVAWIlgk=;
        b=WJ4kIfKIQtX6bY+XauQBj9cYpx/Mm2FuGDm3TgqD2r8rnnh6cBPYtgrtScCrBbG3NF
         yTLow/X6PQbo1x1oN+WT4BVmXgV6irdmuoCI3jYz25XKJQ/KgM/ZyPGlgPSBXP64dKPe
         XQs8v/t/5IP/0yg7SLZ8OO9J8DWRhycC9FLOx7aYC5KSIfsscKBML+h9tPHnThNzfmG8
         DAHLwx2WJYI7QW1H4yqcORLtw6NqDFL4qnrWNOUsQPIVPcgDcinBtvXwi0tUCFJSEPrW
         CF++wks7asgo0L8NCPGmj4xtEsb7RMyzfZdlnU80ItG56tY+fnTdCx1XQx5CxSYrCQaD
         kVug==
X-Gm-Message-State: AOAM530AhUdcXtHC8jJvk2oGu135sstO+T9dC2MHMQ6XersUqC0Gp/Py
	4E6xK/VHG7Ma/hYEmQ1AQqkKm2OFiRl2EGI2RcgAbw==
X-Google-Smtp-Source: ABdhPJx3IjpRpEG5S7oFvDuVsP4wKuviKsrOwWtHL2Zy0pk4Y5u9PHuawtg9m9al3TbCDxBI3nnLrl2a/bpSl1dMN5I=
X-Received: by 2002:a05:6512:304a:: with SMTP id b10mr739120lfb.475.1601312166726;
 Mon, 28 Sep 2020 09:56:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200928161900.452970-1-ross.burton@arm.com> <20200928161900.452970-7-ross.burton@arm.com>
 <817c9c37-3036-5be3-4934-db1dfe56985d@kernel.crashing.org>
In-Reply-To: <817c9c37-3036-5be3-4934-db1dfe56985d@kernel.crashing.org>
From: "Ross Burton" <ross@burtonini.com>
Date: Mon, 28 Sep 2020 17:55:56 +0100
Message-ID: <CAAnfSTsimMKLGx7ZcLNcCSZwdKFg3Hbf3W1uGbWY5Q9+1dkmFw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 7/7] sstate: set mode explicitly when creating directories in sstate-cache
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 28 Sep 2020 at 17:40, Mark Hatle <mark.hatle@kernel.crashing.org> wrote:
> I worry that this could be problematic for other ways.  Security requirements
> for an org or even users who want to share the sstate case 0777 etc.
>
> Wouldn't it be better to warn the user that their umask won't allow them to
> share this with others, and give them instructions and opening the umask?

FWIW, ten lines lower we chmod 664 the actual data, so this is just in
keeping with existing behaviour.

Ross
