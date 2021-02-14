Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
 by mx.groups.io with SMTP id smtpd.web11.17722.1613315063636824944
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Feb 2021 07:04:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uYZzs8p/;
 spf=pass (domain: gmail.com, ip: 209.85.217.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f47.google.com with SMTP id l19so1390273vso.8
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Feb 2021 07:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GGjea3HRIxrhU+BGfyQfaEqKUblnjIu+j6UuMgE4hUs=;
        b=uYZzs8p/wXyHp8Gf++N/lObCvCHYx4tVSWBA8pd1GKsWBCsELqlRUTizJqbR/XFSE7
         bkV/W5nnXdaseHpr3V7wbwj62TBGW2gIL7Fl2FI6kdr/LSH0qGrVdj1yBVJOkavKp0Fe
         e4sOUJYaalM7GVm/zk/HJIfggyzjX8dOfvb6c7PbFm+IMaESLDlzgy/aRZwN4GqJ2nAD
         84iZrDL1RtHLZwOvfGD5KIOQTytUFas3eISAU72PqQZ9BUjnAa9srq5h7bJb/JCBmAue
         MAFqnvezWVUpi2AhlIYouQMJRHGIJyl5Oqy7QRfStv7GVeR6uKTYTKFpKi5BhnqP3DAM
         oEfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GGjea3HRIxrhU+BGfyQfaEqKUblnjIu+j6UuMgE4hUs=;
        b=qGU4tqWwn/mv9b/HlLEumd58DYGijxDZnnSKG9pNEyqdgN5QG8LOkSEUz1288pbv5p
         c3StLz8Ei63SLwUyNuGR5Zd+vIyFQ4N5IIQh24nHDQrSd/FhUvrYwehClPPK+RxyrjUi
         T2JxIXH9FO16/QC8aVRk9LXhHqXpmaOmN+0BmNAvSR++6aDG1q2OfEWWdZqYMTqIhIX7
         CO24DSnZNFWB75SSM0Q51mPayqV9bsiI69onIkGr+Jd89whSR6ysG5SrF4W6IImwQaJp
         q+B2GdIyOL7smd/8knqKyZsJOPhkHRD1QpHhlBfh7F2hrNEYv6R/nsnfr5oJOdXZE51I
         f0cA==
X-Gm-Message-State: AOAM532dXL06UDW2U/Z7Z0xV5pjTKpihzXUFo5ng1V4Fr3xaNH0iHc+N
	yCcE4TIYpavgea83+VYw1GASYsxbgfYp7TW65jw=
X-Google-Smtp-Source: ABdhPJwoF99IHcWtAcgNpz95va7Ylg8796pDneXu+ZLGzBP8EyzYb+XvEjbPGbn53DfcwQ2Vc0bCF3P0JMHBiLmG0Dg=
X-Received: by 2002:a67:e358:: with SMTP id s24mr6119362vsm.20.1613315062733;
 Sun, 14 Feb 2021 07:04:22 -0800 (PST)
MIME-Version: 1.0
References: <80c70797943e52fa430d2f9f65bffe7a90730dec.camel@linuxfoundation.org>
In-Reply-To: <80c70797943e52fa430d2f9f65bffe7a90730dec.camel@linuxfoundation.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sun, 14 Feb 2021 16:04:11 +0100
Message-ID: <CANNYZj-cpgjuvUikfCrYCnBqTLdsNsY-5PUBji7PqJhkrbuHzg@mail.gmail.com>
Subject: Re: Autobuilder reproducibility target changes
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, 
	swat <swat@lists.yoctoproject.org>, "Mittal, Anuj" <anuj.mittal@intel.com>, 
	Steve Sakoman <steve@sakoman.com>, Joshua Watt <jpewhacker@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000399f2305bb4d2f67"

--000000000000399f2305bb4d2f67
Content-Type: text/plain; charset="UTF-8"

Cheers :) If there's something else I could help, tell.

One item is getting to the bottom of why it takes diffoscope beyond the
heat death of the universe to render its verdict on some items.

Alex

On Sun, 14 Feb 2021 at 13:19, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

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
>

--000000000000399f2305bb4d2f67
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Cheers :) If there&#39;s something else I could help,=
 tell.</div><div><br></div><div>One item is getting to the bottom of why it=
 takes diffoscope beyond the heat death of the universe to render its verdi=
ct on some items.<br></div><div><br></div><div>Alex<br></div></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, 14 Feb=
 2021 at 13:19, Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfo=
undation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">Regular users of the autobu=
ilder will note that I&#39;ve split the<br>
reproducible builds test out of the main oe-selftest build and into its<br>
own target build. This is because that test tends to run for a lot<br>
longer time period and it helps to see the result separately.<br>
<br>
I&#39;ve only done this for master. If gatesgarth and dunfell want to<br>
follow, that should be straight forward with a change to the branch in<br>
autobuilder-helper. Obviously we should ensure this is working ok with<br>
master first but so far so good.<br>
<br>
It has already highlighted the difference between a successful run:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/115/buil=
ds/2" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproject=
.org/typhoon/#/builders/115/builds/2</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/119/buil=
ds/2" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproject=
.org/typhoon/#/builders/119/builds/2</a><br>
(took 3-4 hours)<br>
<br>
and failing two failing runs:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/116/buil=
ds/2" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproject=
.org/typhoon/#/builders/116/builds/2</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/118/buil=
ds/2" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproject=
.org/typhoon/#/builders/118/builds/2</a><br>
(took 9 hours)<br>
<br>
the time difference being the system trying to run diffoscope on vim-<br>
common :/.<br>
<br>
I&#39;m aware I removed some recipes from the exclusions list after seeing<=
br>
multiple passing builds for all distros and we&#39;re now seeing test<br>
failures. My mistake was not waiting for the date to change and for<br>
builds to run on an autobuilder worker with a different umask.<br>
<br>
Meson is failing with a pyc file mismatch which diffoscope can&#39;t decode=
<br>
and despite trying for 5 hours, diffoscope hasn&#39;t given any data on why=
<br>
vim-common differs. I should have fixes in for quilt, valgrind, kernel-<br>
devsrc and cwautomacros. The umask fix may fix other issues too. Alex<br>
has improved the reporting so we can spot cases where exclusion is now<br>
longer needed.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div>

--000000000000399f2305bb4d2f67--
