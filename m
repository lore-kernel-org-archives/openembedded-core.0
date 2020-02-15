Return-Path: <armccurdy@gmail.com>
Received: from mail-vk1-f194.google.com (mail-vk1-f194.google.com
	[209.85.221.194])
	by mail.openembedded.org (Postfix) with ESMTP id 81F7661030
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2020 01:02:53 +0000 (UTC)
Received: by mail-vk1-f194.google.com with SMTP id c129so3103472vkh.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 17:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=sPg5jmVpxXjuICTrd1VYrSCkt8PEqiM987WjTDt8TfQ=;
	b=SGEqbSJ0rVhLHNJY0u3vjq8YBNRPeF3I3xW0m4P4MiiUXnfRwLyuQ7kvwEigPvdV63
	7ODOYENzIpSAG3aKYhqgCHStXUaJhkWZQVzjP/bftkAq5KKxs2Tkbat3NwREws2JWrIf
	DF2wiLp+Wl101KY957fmwz236LnYwn6UVHz+LwTcg+oirL9i8nq5vhej/HkA3G/gsz7O
	XmAmSHuek9tOUa/AIAIAOx0sBQIyNn45lnnRoNVXwkBAMEmENLRg7hLB7XJcl/L1SLzr
	cmXf+E7uc/HesEbvGd3DA1SjUUtqF9rCFp9GkcAeLwWqB6BoV0C/8IoQEXu0t8mM/6G5
	WB7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=sPg5jmVpxXjuICTrd1VYrSCkt8PEqiM987WjTDt8TfQ=;
	b=XNW0SgdYouL1CitSco8i+cl33wbKjTgpw7n9kH433z1qnx3V+ObB7Tr6HXcmZeeMU7
	HtHa3YgrmEZ+0a8B88+cWhpmkW4EPCMfA7YE0GGFjijYbFj6Biyp7xiWnyTs+ywMShsg
	KSShTs3XUklt4CBwIIi0LUwhoOQ0p+cS5l2OG2lJ94e8PlitO5vIjYOQ3LrDo2hJivQs
	GY8c6foJ3+RuF9aYOdV5462QkBl+mjLhJ/B9I0lES8Q8qTeT2AwayBhiU0aeus8We1PJ
	J2KJ0kxfyO9YJ4li+whCsEbmIlpfQL2omRzJSQaaid2yMPpAcS4mA0QeniFT3zqhoYsS
	PGcQ==
X-Gm-Message-State: APjAAAWwTye2vVfdLG3B+QYGiV5pPGqDmCCR8D7+fRFS9zzihSFD/Ld3
	q23X0fRCskSoBbb3GigOt+v+RHgKZgfM9rfEonA=
X-Google-Smtp-Source: APXvYqwAbVVHbO2ER2adosVHU752lvJYK2xT8Tttj2tlzLbsewxuyNZ15/ChPmY+DkDtXvFpHGy1x21/G011Pjdb9Ro=
X-Received: by 2002:a1f:ee45:: with SMTP id m66mr847587vkh.75.1581728574266;
	Fri, 14 Feb 2020 17:02:54 -0800 (PST)
MIME-Version: 1.0
References: <20200214154240.2222810-1-raj.khem@gmail.com>
In-Reply-To: <20200214154240.2222810-1-raj.khem@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 14 Feb 2020 17:02:42 -0800
Message-ID: <CAJ86T=UzY5e5YvSBUATDYk+5WV-_xFdeqdQrWO8c3W1bFxUG_A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] musl: Update to latest tip
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
X-List-Received-Date: Sat, 15 Feb 2020 01:02:53 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 14, 2020 at 7:42 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> Detailed changelog is here [1]
>
> [1] https://git.musl-libc.org/cgit/musl/log/?qt=range&q=e6093b5a870a38ebfb3e54382acd48c698bde15d..a662220df547e5c2446518e74440a7d834f9ebe6

Up to now, musl version updates have basically always just made things
better and there's never been a good reason not to switch to a new
musl release (in my own forks of oe-core I've updated both OE 2.7 and
OE 3.0 to the musl 1.1.24 release, etc).

However, after 1.1.24, musl switches 32bit targets to a 64bit time_t
(in preparation for 2038) and from my initial testing that seems to be
a change which is going to cause a lot of problems (both build time
and run time) for proprietary components and BSPs etc which are only
ever used on a 32bit target. Anything open source is likely to have
been well tested on a 64bit target and so any assumptions about the
size of time_t will have been fixed long ago, but even then there's a
chance of problems (see recent fixes in oe-core for build time issues
in strace, systemd, busybox, etc. I guess that run time issues are
likely to emerge too as the latest musl snapshot gets more testing on
32bit targets).

Updating musl beyond 1.1.24 in oe-core probably needs some careful
consideration, especially just before OE 3.1 LTS.

(Note that the version of musl in oe-core master is already beyond
1.1.24, so these comments don't apply specifically to this commit).


> Signed-off-by: Khem Raj <raj.khem@gmail.com>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-core/musl/musl_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
> index f4853b4f2e..b6ec6fe9af 100644
> --- a/meta/recipes-core/musl/musl_git.bb
> +++ b/meta/recipes-core/musl/musl_git.bb
> @@ -4,7 +4,7 @@
>  require musl.inc
>  inherit linuxloader
>
> -SRCREV = "e6093b5a870a38ebfb3e54382acd48c698bde15d"
> +SRCREV = "a662220df547e5c2446518e74440a7d834f9ebe6"
>
>  BASEVER = "1.1.24"
>
> --
> 2.25.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

