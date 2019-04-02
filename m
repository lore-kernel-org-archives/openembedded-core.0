Return-Path: <jdmason@kudzu.us>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id 21BAA7D1F0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 04:45:23 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id 139so3010418ita.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Apr 2019 21:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kudzu-us.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=P2t5e91PvXtQ1vk6gpBPehsQ8MAV3ilydskB33y3WMw=;
	b=JhssEqPPvGY24JU6uh+PqXgLZUPPUHzM+0np+s7CYFZEg/x2ogMZexQP6y9zUgi+bH
	2FX89YZ0Q8mrWk2T2gJl97XBHepFbnKNs4ihUeN26xnOdVKEiFUIhbOY1kNagQOET4wo
	PGjz3IrZGaeZA6jb2MlWqq2SG133TJQ8q5890pUw/OpNouiR7hQUOPD8/uNLY91n7XJk
	W8KJTElFro/gzwcA+aVfpLj+Z3dO/w6TUktZjAfq8EqNNfYLXynAzIXsy2XOx8rxaa8H
	cmX195cX1+Gy0sff5wpwGPMufnDpUQR1bYAG1pDZsl4a8faoZ9mI5s3QFiwNzdEFDJDk
	WWzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=P2t5e91PvXtQ1vk6gpBPehsQ8MAV3ilydskB33y3WMw=;
	b=W1MNQficZbneg0ox4ZKU1VLlpRVRFn3cROAV92jTZKQEocLgFNXsH98KlR55EGUYjX
	T6iToX2QUAG+a4pNrli7h0FrMH0OQQGyiPWqpuRHJIZIB/BukpNyvX/0LR2gXL6X7N2S
	bz+yZ9N3LSFIerST0o0Yc2Al9pkSs1k4j2pkRRchAChh0t43Tmjc69jd0gzJpOGOYpiJ
	s2Q39VL4DAhEnR+w22a3MLBL6djrodqQtwUiyqu6RayuHrC/wAzm3lzOSNBvZmaDTgH+
	ShKs3lYnmyQa22WN6TfeEjmBfKkWjhKX0FjZEPUvPLDivhWlbHinrZDSifWH+ABFFXjM
	bmTQ==
X-Gm-Message-State: APjAAAW7YSMkch1T6WRjWhI0tkPuZx/y4DUd0E9UIpOkGfkZg/ljVuIm
	XhYUwalh+TtWwdR7afkDp20r4kav8jaMVCYWKGRTgw==
X-Google-Smtp-Source: APXvYqwB53u160M+/OAKKEssIgGZTG24h2X6oQRBw/ocLh2wZFIORSQ9Av/q/d5V4nx7K7wky4DjkFAgl36d4UkeW9M=
X-Received: by 2002:a24:55d8:: with SMTP id e207mr2320877itb.119.1554180324762;
	Mon, 01 Apr 2019 21:45:24 -0700 (PDT)
MIME-Version: 1.0
References: <854544cb-aab1-1a9d-9e98-0f39663ca621@gmail.com>
	<b08083fc2f63f6324a652706f8343a0b8defe209.camel@linuxfoundation.org>
	<a1416fe3-04fb-1d37-eaef-05b9a838254e@gmail.com>
	<6068e963-94c1-7225-2c60-9ae027c74639@windriver.com>
In-Reply-To: <6068e963-94c1-7225-2c60-9ae027c74639@windriver.com>
From: Jon Mason <jdmason@kudzu.us>
Date: Tue, 2 Apr 2019 04:45:16 +0000
Message-ID: <CAPoiz9yat-4XRgSFikh5PxrsgVpRAWNi2dx1O0+_iHyVR529Ag@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Git commit process question.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Apr 2019 04:45:24 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 2, 2019 at 6:41 AM Mark Hatle <mark.hatle@windriver.com> wrote:
>
> On 4/1/19 6:20 PM, akuster808 wrote:
> >
> >
> > On 4/1/19 4:02 PM, Richard Purdie wrote:
> >> On Mon, 2019-04-01 at 15:33 -0700, akuster808 wrote:
> >>> Hello,
> >>>
> >>> I have noticed a large number of git commits with no header
> >>> information being accepted.
> >> Can you be more specific about what "no header information" means? You
> >> mean a shortlog and no full log message?
> > Commits with just a "subject" and signoff. No additional information
>
> If you can convey the reason for the change in just the subject, that is
> acceptable.. but there is -always- supposed to be a signed-off-by line according
> to our guidelines.
>
> So if you see this, I think we need to step back and figure out where and why
> it's happening and get it resolved in the future.
>
> (Places I've seen in the past were one-off mistakes and clearly that -- so it
> wasn't anything that we needed to work on a correction.)
>
> --Mark
>
> > We tend to reference back to how the kernel does things.
> >
> > https://www.kernel.org/doc/html/latest/process/submitting-patches.html
> > These two sections in particular.
> >
> >
> >     2) Describe your changes
> >
> > Describe your problem. Whether your patch is a one-line bug fix or 5000 lines of
> > a new feature, there must be an underlying problem that motivated you to do this
> > work. Convince the reviewer that there is a problem worth fixing and that it
> > makes sense for them to read past the first paragraph.
> >
> >
> > along with this section.
> >
> >
> >     14) The canonical patch format
> >
> > This section describes how the patch itself should be formatted. Note that, if
> > you have your patches stored in a |git| repository, proper patch formatting can
> > be had with |git format-patch|. The tools cannot create the necessary text,
> > though, so read the instructions below anyway.
> >
> > The canonical patch subject line is:
> >
> > Subject: [PATCH 001/123] subsystem: summary phrase
> >
> > The canonical patch message body contains the following:
> >
> >       * A |from| line specifying the patch author, followed by an empty line
> >         (only needed if the person sending the patch is not the author).
> >       * The body of the explanation, line wrapped at 75 columns, which will be
> >         copied to the permanent changelog to describe this patch.
> >       * An empty line.
> >       * The |Signed-off-by:| lines, described above, which will also go in the
> >         changelog.
> >       * A marker line containing simply |---|.
> >       * Any additional comments not suitable for the changelog.
> >       * The actual patch (|diff| output).
> >
> >
> >     - Armin

There are existing git hooks that can be used to detect and fail to
merge patches like this.  For Linux, I have the following in
.git/hooks/pre-commit
#!/bin/sh
exec git diff --cached | scripts/checkpatch.pl -

Perhaps something similar can be added to check for this.

Thanks,
Jon

> >
> >> Cheers,
> >>
> >> Richard
> >>
> >
> >
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

