Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id BAF057C861
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2019 19:55:59 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id l5so11904135lje.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2019 11:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=/A19rmzodz/PQylvI2CjFofd7kcT2IRm+uHaT+vZ5aE=;
	b=WKMg03lybuMKPIa7gl7otE6pA8YxcNfnQsDvv72XV/C8KGfV0LJ4pxKu0cTMzL9w4d
	QheIH72X5pKKJ7dwq7LCgj7QFKFmUFvqJtmyUrFWc6bCvrUAHjJyt1r1wh8X/kgyLMaH
	FhicDMhOEq1pebPUT8lHIx6RtD6ACSbG0a1Diuzqt+VYBq31jazIbvuBBC8SrD1bwy9n
	wOX6qDCOr7CRNPbP5hG98v06SjJq/nvGaMXE9B0TwlbLa08ETDHv2GgE5nSTffuWWYVg
	3xR+irfyWCj73QRUqY23oTZ66p8hn2IotcTIHielF31GQTrOStvqKM2W6UQFn7dGcFtA
	uqpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/A19rmzodz/PQylvI2CjFofd7kcT2IRm+uHaT+vZ5aE=;
	b=MBtm7S5NSr6kXwfoJWmmJXw5C0xJAYFFEOQYU2cmjLPr+81wFjkHY3EYLUFmPG5isP
	elaQxnY5c+6Wwl3W67/RinlGqvc7ygb95kelKlPZEVzNE9gQR/LnZHEhiTN8GlMwC/75
	ZTIK7OF1ywUi0kLqouhq7Vw8nkgBF+kff1UlOkk4xmOh0VhhoXCYg841kheBNmNVr7PL
	YFtFWX0YcHv0oEr2pjqp3+P1b9tyZu+wmQgEA1S3EtQBp6dFMbrkdpHVL+yMQXk807YU
	ecX/3iA9iUotiERpgm2PoUA7eME79Ie9u0DhtnrIsanPxhjVUtyfIh6iFfFIUqZSH4Hr
	viyA==
X-Gm-Message-State: AHQUAuYeV5MEbRJVDlT/sY0TXVrP9R42wh+eV5xDZTPVCdRGl0GVyoeK
	VEY6wDVlPs42pHclRcDUjWZwruaVYyjnJg8tJKuqDg==
X-Google-Smtp-Source: AHgI3IYZhnkH7/RtJXLm78/XwFFV9nhBkyeWFg5prqo2zQrDBVSOXv2Z+9TmQgqcj/T0lCyhwMGxSxTQ9zxZWwpPwQs=
X-Received: by 2002:a2e:9c97:: with SMTP id x23mr14351229lji.13.1551210960066; 
	Tue, 26 Feb 2019 11:56:00 -0800 (PST)
MIME-Version: 1.0
References: <20190222142333.9780-1-fabio.berton@ossystems.com.br>
	<CAJTo0LbhhwpyLh9wP+JswymO+T9CRJ64w8hw6g8HsxUSLg9jOw@mail.gmail.com>
	<CAJTo0LaugPSscMvBwJz+ezbp7DMF9rs59Svkr8WnFb3+oM-KwQ@mail.gmail.com>
	<CAJTo0Lah677v4+3Q+acN8WEOF-r9bopn0OVw+icfCX5Jy7pxvQ@mail.gmail.com>
	<CAJTo0LZsdUCjKe9nR4ypj3x_ddR7XPBEvduUHDiE9esWa=X-jg@mail.gmail.com>
	<CAP9ODKqXDQkV8xHmTTmvs6GWUWNJrWB5XSnb37B=6-JjCci37Q@mail.gmail.com>
	<CAMKF1sqynSYK=u_qTXkteuSk1s951JAXucnN9r=8=CVOCUD=SA@mail.gmail.com>
	<CAP71WjyHDmhfM=zNaCL6V+YNuW_eumLfFk8iVapxC9iP+k=iiQ@mail.gmail.com>
	<CAMKF1sqBf-W_xAadC7sMY3eGF89aGuYVf9hekgY=RTKNPRMwVw@mail.gmail.com>
In-Reply-To: <CAMKF1sqBf-W_xAadC7sMY3eGF89aGuYVf9hekgY=RTKNPRMwVw@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Tue, 26 Feb 2019 20:55:48 +0100
Message-ID: <CAP71WjwCRdu9eE1aErh+Gtfvgq-U70v0n4j+MdM-3020eF7g1Q@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH v4] mesa: Convert recipe to use meson build system
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
X-List-Received-Date: Tue, 26 Feb 2019 19:56:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 26, 2019 at 6:19 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Tue, Feb 26, 2019 at 7:36 AM Nicolas Dechesne
> <nicolas.dechesne@linaro.org> wrote:
> >
> > On Tue, Feb 26, 2019 at 4:08 PM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > On Tue, Feb 26, 2019 at 4:26 AM Otavio Salvador
> > > <otavio.salvador@ossystems.com.br> wrote:
> > > >
> > > > On Tue, Feb 26, 2019 at 8:58 AM Burton, Ross <ross.burton@intel.com> wrote:
> > > > >
> > > > > Patch has been accepted, so we need to cherry-pick the patch I mentioned.
> > > >
> > > > We will wait for 19.0.1 to be out to go to meson, so it will be
> > > > applied there for sure.
> > > >
> > >
> > > I am still seeing fredreno build failure with master-next
> > > https://errors.yoctoproject.org/Errors/Details/230466/
> >
> > I was about to suggest that the right fix would be to get rid of that
> > recipe, since it's been deprecated, see:
> > http://bloggingthemonkey.blogspot.com/2016/11/a-quick-note-for-usersdistros.html
> >
> > So i checked the Layer index to find which layer has the recipe just
> > to realize it's my own meta-qcom layer... oops.
> >
> > Are you ok, if I remove it, or do you need it for anything?
>
> Deleting is fine

done. for both master and thud branches.

>
> >
> > >
> > > > --
> > > > Otavio Salvador                             O.S. Systems
> > > > http://www.ossystems.com.br        http://code.ossystems.com.br
> > > > Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
> > > > --
> > > > _______________________________________________
> > > > Openembedded-core mailing list
> > > > Openembedded-core@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core

