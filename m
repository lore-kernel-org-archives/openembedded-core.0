Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.20840.1613328439962459287
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Feb 2021 10:47:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iD0zrLlC;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: jpewhacker@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id n4so3260974wrx.1
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Feb 2021 10:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D0lwfGL8Ej3bImxclJSt74l/Z/MejDKH8W0KeTOZ3wc=;
        b=iD0zrLlCHqqazoq/VCbjCwFEoHUYIo20zNppNVNMk4difNuSmA513LeNX0qg05eWoV
         nbM/ZSx91JEIRZRe0SvuazawF6oolAahESAoxaDvSGY2mHI35bQ1rb66z1cBozwIqFz/
         pu60s6d+sw/nVlqh3BjNpbHn2+SaNaq9g4Aew1QauHHoQ+VDQBolA35aa2MPfEBWUPOw
         iWJ+2D2SlGcDZOxfXqPIvWET31cBpBcK8HDyhTu9zBe1u3U9tRZUmcsVcGH5hVpFY+JD
         QDjITTN+n+pJwDg4zxY4LABf8jsrSHhDOoS5k3hEQfUScjkGy5BKpo0ioAdFD7X5mHQh
         ZwcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D0lwfGL8Ej3bImxclJSt74l/Z/MejDKH8W0KeTOZ3wc=;
        b=GSpjmPu/VtopL2BN+25+us6j0o5niaMQsVAETk42zKvZJmTt/2i51RkofBoss41csf
         7NmeTE9y3MdDhqtOLa+dwY3C30Ik3MikfCfEQqrr2Eq/uqXYJWRwb/XVZiaHxkNf37Wc
         N1e9Akpac47wVEAYcNGFPXV7BetgRafkglWJnbbi48LBqJnYWJ8oyYHueVrb3f8SAyyM
         Fe9OM2j2bccOu7aTaRDW807FvuBW5AiEfX9t8iLPnE37XJyYPGlCiDXRcRFvqJW6NUwp
         e71TmBHufPh31DekfEFMIrkl+8OwVnY9Qw/eokuwiVHsJua4BCWBcXovz2/J7tWXgMMU
         kYfg==
X-Gm-Message-State: AOAM530HM/5y7Zns9Svl91y70Y7DQLelYNHtgFMWyx7XRrg/f7T4pXWv
	RZMSLgiQAq8M9fANQFLSxQwGHMDu/xgmvwTrQaM=
X-Google-Smtp-Source: ABdhPJx9og0TweMHF/BbG8rrm8XPAB5/yAyawOOTcXupbPsvRrTUbGYjhng3Tpwgy5N+h6benHevf1MRFlzjwdiYIIg=
X-Received: by 2002:adf:e68d:: with SMTP id r13mr14734749wrm.303.1613328438384;
 Sun, 14 Feb 2021 10:47:18 -0800 (PST)
MIME-Version: 1.0
References: <80c70797943e52fa430d2f9f65bffe7a90730dec.camel@linuxfoundation.org>
In-Reply-To: <80c70797943e52fa430d2f9f65bffe7a90730dec.camel@linuxfoundation.org>
From: "Joshua Watt" <JPEWhacker@gmail.com>
Date: Sun, 14 Feb 2021 12:47:06 -0600
Message-ID: <CAJdd5GYwZ5tb1WcjePjHBS57-kmxtUVXwZh54vzEJ4Nq5KG=vw@mail.gmail.com>
Subject: Re: Autobuilder reproducibility target changes
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, 
	swat <swat@lists.yoctoproject.org>, "Mittal, Anuj" <anuj.mittal@intel.com>, 
	Steve Sakoman <steve@sakoman.com>, Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, Feb 14, 2021 at 6:19 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Regular users of the autobuilder will note that I've split the
> reproducible builds test out of the main oe-selftest build and into its
> own target build. This is because that test tends to run for a lot
> longer time period and it helps to see the result separately.
>
> I've only done this for master. If gatesgarth and dunfell want to
> follow, that should be straight forward with a change to the branch in
> autobuilder-helper. Obviously we should ensure this is working ok with
> master first but so far so good.
>
> It has already highlighted the difference between a successful run:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/115/builds/2
> https://autobuilder.yoctoproject.org/typhoon/#/builders/119/builds/2
> (took 3-4 hours)
>
> and failing two failing runs:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/116/builds/2
> https://autobuilder.yoctoproject.org/typhoon/#/builders/118/builds/2
> (took 9 hours)
>
> the time difference being the system trying to run diffoscope on vim-
> common :/.

I'm not sure that diffoscope is the culprit here. If you look at the
logs, you can see that there is only about 30 seconds between the
"Running diffoscope" log message and the end of the test. I suspect
something else is going wrong here. I can try to write up patch to try
and add more logging so we can more accurately pinpoint where it's
taking so long.


>
> I'm aware I removed some recipes from the exclusions list after seeing
> multiple passing builds for all distros and we're now seeing test
> failures. My mistake was not waiting for the date to change and for
> builds to run on an autobuilder worker with a different umask.
>
> Meson is failing with a pyc file mismatch which diffoscope can't decode
> and despite trying for 5 hours, diffoscope hasn't given any data on why
> vim-common differs. I should have fixes in for quilt, valgrind, kernel-
> devsrc and cwautomacros. The umask fix may fix other issues too. Alex
> has improved the reporting so we can spot cases where exclusion is now
> longer needed.
>
> Cheers,
>
> Richard
>
