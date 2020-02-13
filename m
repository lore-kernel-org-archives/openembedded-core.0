Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 255A0600E9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 20:45:43 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id dc19so8466781edb.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 12:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=E/IjaRtj5NVX13oIgVtrnbJhbQUazWHRij+b6yQ0/ow=;
	b=QJ6NZpzU1dwvZyxwRiyIYzulRxGnynzLmL0/fKur5TordWEDf6fOCAp04xI7ciEi6T
	6Cfs15BW9TEuiRpWHhtI6FUBTAGpchqN/62z3jsj0l6e4K/CSRPtw2AuMuHexLg87NoA
	geY8Cob0pFgUufW1cCVxYIMQbKGAu9NCrSWxpI+z1ucas0LH51r8XUr0QCcqIQiSN6fk
	scrEeZpkFOxkwSipLUXvj5S/o9pLx1uxSR8WFU1PDGbASG610B9g94HOHxy47KS9S+SX
	VYAa2cZYOAa0mgE7uI8Zw92E6lzEVuYwcnVMoAYsOW89gWA9GHP6yJAGB/R6NoCSYCHT
	l/Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=E/IjaRtj5NVX13oIgVtrnbJhbQUazWHRij+b6yQ0/ow=;
	b=lnQyeejphB/XablE5tOkkZiHwd3UfXv+Q++P9N+FNKeivf4S8xsr0huEeFeIglW2PH
	tfMllClwGZ2scT+6d4OK43ZpNSUriWPExtnhoSTNR/XBmq26xBPzIdZmm0iBGhNsfyOp
	bsdrkh74HlHRjlQ77nHvC5jNeBB1+dV+0Jv8kZ5SUsL1V0D8emtn+ESaw9N2gA7FXWXa
	CS6mLyJu01VmlwHnGxuxp7emCDW4xgHwY41+4s7QyDCIScvWt6fEMyyJfxk/ag41y/1F
	C6m+/v1IOlfprVKJmd8OgfW6PjE0ZfdTk66Q179gAM15CrBXvdiD81s90ob0vNd4u/tw
	dz9w==
X-Gm-Message-State: APjAAAXed4hjpj1Vl9BtBAnRaqmgtrK9GeeQveJOQ9dCWwwJD0oVX4k/
	fByqOuOyBUforQ7P16wbbkQJM/y4TLkAG37tSiM=
X-Google-Smtp-Source: APXvYqyO0Ho61Tk+p0AJTkT6nh28TjDA2TUrKFKTwEzXHDRA7u78cbOEiJf0Bg2zvPHAQ/otghBqdC2e4N0m60IjyM8=
X-Received: by 2002:a17:906:9716:: with SMTP id
	k22mr16679359ejx.233.1581626743674; 
	Thu, 13 Feb 2020 12:45:43 -0800 (PST)
MIME-Version: 1.0
References: <1581619124-194740-1-git-send-email-zhe.he@windriver.com>
In-Reply-To: <1581619124-194740-1-git-send-email-zhe.he@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 13 Feb 2020 15:45:32 -0500
Message-ID: <CADkTA4NH98R-2YEK_G7xgn5JW8odimr5EPnm=Xg5qQPMmAxXQg@mail.gmail.com>
To: He Zhe <zhe.he@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] perf: Correct the substitution of python shebangs
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
X-List-Received-Date: Thu, 13 Feb 2020 20:45:43 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 13, 2020 at 1:39 PM <zhe.he@windriver.com> wrote:
>
> From: He Zhe <zhe.he@windriver.com>
>
> To make the native python3 are always used,
>
> - Move the substitution of /usr/bin/python3 to first, otherwise the
>   possible original /usr/bin/python3 would be changed to
>   /usr/bin/env python33.
> - Add substitution for ${S}/scripts/
>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  meta/recipes-kernel/perf/perf.bb | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
> index 6d1b066..14a9090 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -240,10 +240,17 @@ do_configure_prepend () {
>
>      # use /usr/bin/env instead of version specific python
>      for s in `find ${S}/tools/perf/ -name '*.py'`; do
> +        sed -i 's,/usr/bin/python3,/usr/bin/env python3,' "${s}"

Rather than messing around with the order of these, we should just
combine them into a single sed invocation. When I started those
substitutions, there weren't so many.

As was mentioned in the other perf patch  and review:

sed -i -e "1s,#!.*python.*,#!${USRBINPATH}/env python3," ${s}

or some variant of the regex should fix them all.

>          sed -i 's,/usr/bin/python,/usr/bin/env python3,' "${s}"
>          sed -i 's,/usr/bin/python2,/usr/bin/env python3,' "${s}"
>          sed -i 's,/usr/bin/env python2,/usr/bin/env python3,' "${s}"
> +    done
> +
> +    for s in `find ${S}/scripts/ -name '*.py'`; do

It would be better to not have two loops doing the same thing, why not
combine the two ? In the other review, the single script that was
causing the problem was specifically pointed out .. and while I also
agree that we can just substitute them all, technically, if we haven't
run them, we don't know they are py3 safe.

But minimally, getting them into a single for loop is something we
should do (also part of that other patch/review).

Bruce

>          sed -i 's,/usr/bin/python3,/usr/bin/env python3,' "${s}"
> +        sed -i 's,/usr/bin/python,/usr/bin/env python3,' "${s}"
> +        sed -i 's,/usr/bin/python2,/usr/bin/env python3,' "${s}"
> +        sed -i 's,/usr/bin/env python2,/usr/bin/env python3,' "${s}"
>      done
>
>      # unistd.h can be out of sync between libc-headers and the captured version in the perf source
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

