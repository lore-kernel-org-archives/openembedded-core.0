Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 3E57677754
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Mar 2017 18:31:04 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id v186so97028918wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Mar 2017 10:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hoO5hxsfK+Ufjn0jwrEVRrcLucNHor1+n4nnMdF2u/U=;
	b=jvlj+phtDmykuBRy221f1xTlaEFauUTaKVKtsmL9P1gabWlCVsEm1vGuK5H38ZXwv2
	w1kAyfpBUjJOARPhxwUFqJFl0q0x/RPNJxDITP/w9SN3VbugMFjZJAiFtUr4yBVn9ldA
	3iWIfKQt+A9qjsi/onmhQ5l1XgUMiEDl9eFHPwdQd7dqHcC6JWMVs0gjZYzc+lQe08mf
	43MamMgY66IfpfK0+ps4sMO3F5MA+pl8vcd6ir6FglNJB6RgNY+Z3YZJ6rFkKG4C7Zva
	0V9Ue4Rh7FyYC+Ra37ZUFWahEqBEjmFA+oFoR2o5/LjOkYNrlEQjSQiDOkInAbfW3ITE
	kuQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hoO5hxsfK+Ufjn0jwrEVRrcLucNHor1+n4nnMdF2u/U=;
	b=R2ME23YZLBQSmEAcyORVjQK2F30klTSnd+1W6fxaNdBbWvF3zitfRmTPvNN6/hCUKj
	xNW/W1Lx8Tm3JgHRljIfFHKHkoshnkoLqKAYKrhStcZuwuNuto1uiemgTfMNyEnOjvhf
	6iO7wG6UQhUcaJv4jVexdfLdh+WtFrjXp7n9CgMOoXcntPVi843v1n8M4ZML2H21jUYu
	O6daZbeY706KCM+Mt4cMZTT79BZ8IBwrCdpTwMJFjE8tdaJSjUwOKimHNxA8Gn56XWau
	/7ns4lpqMT9H67Th2ApXMZy1WjR5z8hPBqWIemVRMzRSpdQ1wt+W+FPx7ffTm20cstiN
	ed+w==
X-Gm-Message-State: AMke39nBEnZ1n5dfEplQ4slE5NCWUm2wPtX7OTBa6eFJMbuIHuDp5IB/3rzWX39MgBQrXljQaruKRdIf3hYQhg==
X-Received: by 10.28.215.18 with SMTP id o18mr20541505wmg.98.1488911465567;
	Tue, 07 Mar 2017 10:31:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.174.82 with HTTP; Tue, 7 Mar 2017 10:31:04 -0800 (PST)
In-Reply-To: <1488910966-30028-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1488910966-30028-1-git-send-email-richard.purdie@linuxfoundation.org>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 7 Mar 2017 10:31:04 -0800
Message-ID: <CAJ86T=UAZ21SzB-zjS798viMBLmoO5eXbifFEUogncbMTxuNHg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] recipes: Move out stale GPLv2 versions to a seperate layer
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
X-List-Received-Date: Tue, 07 Mar 2017 18:31:05 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 7, 2017 at 10:22 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> These are recipes where the upstream has moved to GPLv3 and these old
> versions are the last ones under the GPLv2 license.
>
> There are several reasons for making this move. There is a different
> quality of service with these recipes in that they don't get security
> fixes and upstream no longer care about them, in fact they're actively
> hostile against people using old versions. The recipes tend to need a
> different kind of maintenance to work with changes in the wider ecosystem
> and there needs to be isolation between changes made in the v3 versions
> and those in the v2 versions.
>
> There are probably better ways to handle a "non-GPLv3" system but right
> now having these in OE-Core makes them look like a first class citizen
> when I believe they have potential for a variety of undesireable issues.
>
> Moving them into a separate layer makes their different needs clearer, it
> also makes it clear how many of these there are. Some are probably not
> needed (e.g. mc), I also wonder whether some are useful (e.g. gmp)
> since most things that use them are GPLv3 only already.

From my distro config:

  # gmp 4.2.1 is the last version released as LGPLv2
  # nettle 2.7.1 is the last version released as LGPLv2
  # gnutls 3.3.x is the last branch which supports nettle 2.7.1
  PREFERRED_VERSION_gmp = "4.2.1"
  PREFERRED_VERSION_nettle = "2.7.1"
  PREFERRED_VERSION_gnutls = "3.3.%"

> Someone could
> now more clearly see how to streamline the list of recipes here.
>
> I'm proposing we mmove to this separate layer for 2.3 with its future
> maintinership and testing to be determined in 2.4 and beyond.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

