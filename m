Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f177.google.com (mail-ua0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id 5E893700F3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 17:34:01 +0000 (UTC)
Received: by mail-ua0-f177.google.com with SMTP id 96so70160357uaq.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 09:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3QzdSiUziDlDHYxFav/e6KUrdOBPfHI/cTK3BIj1a04=;
	b=rWbMyuMmseF4eYtBA+gyKC4PTkw7bOJCZDerSzPjVj4yOtP48x0jJRaXO5aLC6Onqr
	B0dk0MyC9k9OfkKS+cj3sOnqdxR9KCcNmBX2QbduTfvsryMQCEzTD6o86sDs37knk9H+
	+j73UJnFpwwTLIslKgm+BBfKJ09udxFZ6QbjypWUlXexd0VFJH3vqEfHmjew9QI4mmnu
	ITqbCTVpm/nth84ZSbEABCXvMSLPlusxHilSXb2jRZRNLjvhocY7YB642dMF6ZexUrhq
	L0Gk5NUTQ2f5MATytrNKSlYwEcnSrZ4ZMqSETWddlpcTG1AISns5ERQoIA7XCUgRuvRv
	6yqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3QzdSiUziDlDHYxFav/e6KUrdOBPfHI/cTK3BIj1a04=;
	b=hbXNHKsq2uk8Mthoqn9DYqV4fV7H3gkndoVgfwmxic++FZCunTX3eOAFskumh7As4V
	3Sm0hz+f45tqYNPjsHiBs4soKNNm+27qLwMSO6/PkBLifLAlErOpBxBq1prgyTn5zi8A
	alDM9NVizlRS8Dx0lRcIfa6ZRheQ0y8pet3K02DSLg2EFqidb/BoBvywQ6srwSf3SQkA
	dHzzP0CfdihNsxhWetZl8TyECustHNVXe0t3dqwEeNRWnVzvZqXm5J0HDD2LVcER8hj2
	momY6Ve2lk5CcE31RafHLHfoxq9/d0LgHVgpl7gNq8tv7RJ31J3RpvJliG0g3CTtKt6F
	FUSQ==
X-Gm-Message-State: AMke39kx2iow2JD1g8W6wIKEanr4JE71bnjN2aA8pyzS0fR7ihjAgkvrPVA5/AdAB+mumybQn+isMKa7k67+dA==
X-Received: by 10.176.90.144 with SMTP id w16mr12501107uae.101.1487007241249; 
	Mon, 13 Feb 2017 09:34:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.222 with HTTP; Mon, 13 Feb 2017 09:33:30 -0800 (PST)
In-Reply-To: <alpine.LFD.2.20.1702130912310.15189@uk63952.mitel.com>
References: <alpine.LFD.2.20.1702130912310.15189@uk63952.mitel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 13 Feb 2017 09:33:30 -0800
Message-ID: <CAMKF1sowAQz+da33YWG2usW1p+Gun-hFjW9u-Xe1+dBjOudPAA@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: couple more questions about git-based recipe files
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
X-List-Received-Date: Mon, 13 Feb 2017 17:34:03 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 13, 2017 at 6:24 AM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>   first, is there any value (or even any example) where one would want
> to have multiple git-based recipe files for the same recipe? i'm
> unaware of such a thing, and not even sure what naming convention you
> would use to support multiple git recipes for the same recipe so that
> the filenames wouldn't clash.
>
>   and, second, i just ran across this recipe file in OE:
>
>   build-compare_git.bb:
>
>         SRCREV = "c5352c054c6ef15735da31b76d6d88620f4aff0a"
>         PV = "git+${SRCPV}"
>
> that setting for PV doesn't look right. or does it?
>

you could essentially give part of PV in their name

foo_git1.bb, foo_git2.bb ..

just ensure each of these provide same packages for the final rootfs
then you can use PREFERRED_VERSION_foo = "gitX%" in config metadata to
choose one you want.

> rday
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

