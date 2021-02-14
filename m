Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web09.21344.1613330290858073936
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Feb 2021 11:18:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Oj/vBHtI;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: jpewhacker@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id n10so5973158wmq.0
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Feb 2021 11:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0mbSULxyHHHY27VS4btYdTCfJgHZLu6p/OBQtmiK8wY=;
        b=Oj/vBHtIZ4F/uZbhRXD+zWiE2imDy7jxojkNpyoa2hV6PSJvHQixLXfJkuhDX0ppd2
         U1uqKgZfodHYQidKoCqRj2VtrhMBQIyNh/EjeSMyeaeBLC2qB1eURwKzk8feHttJCekE
         fQ89gwk70dH/bXqVlcNbEbPy03+UWNfJAxGnR4rYO/7ik5eWgPVmF8sLtXweQI/ZOU7P
         LRn5DAbhXCyYfbVJjDWu83Q7Xa+QI+WQQRDk+PorQJqmee0YAEiyyHZQvOXQy/A7HK2F
         lA4enVzxrEsmLDvm5X2Rv37PpMyq24Apr0Vc9x2aGPLdSM4O1fUhmmqFog+XsW148eAE
         SvKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0mbSULxyHHHY27VS4btYdTCfJgHZLu6p/OBQtmiK8wY=;
        b=SIFCtH8zar62OuXLe9yhWStXP9cFkU2DuwdkeuV9ujeWdUivOtujuSUrbO72GEVEU4
         STZBfXFzMXrHL8WL1KHO1fo31B8tzPmdGYlX/d6Eeh3slxHlDTTtIgRaLF+NZLffSwbf
         RXG6CEsO0oZ8Kyy4i67DLfShfP4O0S1JYbMbiZVbw60ScClpjhaSfCiej6fqmoLkhGP4
         rYm4i8YfRVWog1GSVbgDPoV0vcFRxg/Igtco/D+iMP8g34rtuSxXIF6CKM2dqpzBJBED
         HW8f5V6laHNL7VyYXR5sLzRLF1XLRH/ytUCQYYQJ4p3eoP6rDXFIOyxxefkQFJA/Kvx1
         0v2Q==
X-Gm-Message-State: AOAM532iLB6sl0jFJhZMBIJeAoodJFM1oiJ6njr7eKH/4rVv6fnPDjCR
	5r4+KTTjHQ5S7L1Z+KxUIV/ybIOOlZa2dx2zs+M=
X-Google-Smtp-Source: ABdhPJwGRza24niUvu3zJmnlJcdqbL5pS0yU/+C9a0sIcFI6ciauBLutAVJniEqRYGH3ekqspqoVr3e9knZgV5zx8Vc=
X-Received: by 2002:a1c:67c4:: with SMTP id b187mr11314106wmc.17.1613330289288;
 Sun, 14 Feb 2021 11:18:09 -0800 (PST)
MIME-Version: 1.0
References: <80c70797943e52fa430d2f9f65bffe7a90730dec.camel@linuxfoundation.org>
In-Reply-To: <80c70797943e52fa430d2f9f65bffe7a90730dec.camel@linuxfoundation.org>
From: "Joshua Watt" <JPEWhacker@gmail.com>
Date: Sun, 14 Feb 2021 13:17:58 -0600
Message-ID: <CAJdd5GZ4WyPb+Rc-s1n=mm-PQo3ENcjwdnLxsyH1FMC0YTGB-g@mail.gmail.com>
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

OK, I read through the code and unfortunately found a bug: when
attempting to make sure the "B" build doesn't use sstate, I misspelled
the SSTATE_MIRRORS, which means that the B build could have been
pulling from the sstate mirror when it was not supposed to. This has a
few implications:

 1) It might explain why some of the reproducible results seem intermittent
 2) It might explain why there is such a time disparity between the tests

Unfortunately, while it probably will help the intermittent results,
it probably means that the tests taking 9 hours is what is "supposed"
to happen, and they happen to be shorter sometimes because the B build
is pulling from sstate when it's not supposed to.

>
> the time difference being the system trying to run diffoscope on vim-
> common :/.
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
