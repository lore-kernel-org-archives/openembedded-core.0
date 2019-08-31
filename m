Return-Path: <armccurdy@gmail.com>
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
	[209.85.217.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4BE626B3D1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Aug 2019 20:24:28 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id m18so6936147vsr.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Aug 2019 13:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ut+22JanKXyzgiiABihU4kqQ2HkYuGN28tKKjks4PEE=;
	b=JI109ixoXq2PZRcB5QmWl1XrXZwkQ4sNOT7qtOkvxLM25Ut4gVzMLlkljx8jSYvll1
	/OHNJh2grLy+st4zu7n5mJV4FEa56wVfgVhBjLlem25X1MwbP2U84Z5BXbS3ZE8cVaBH
	WuR1PHDLf1JddjuAL7n10rvIT902Aei/dcrHRQYBWN/rpeEQ7d/FdbJIoQiVbA2NBseG
	8YJPWROLNeH7NtNTsDYBejzuOHe4F8IWHapiL6g152dymmYNLQm/LY2jLqxyzUs17yBS
	SKCljYCKQQUCgcJ5aPmRzpu+DATq89Mmo1HxwQA88jp1uAMwrG66iVETl4K2BoSG77L8
	G+zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ut+22JanKXyzgiiABihU4kqQ2HkYuGN28tKKjks4PEE=;
	b=jBdyCF+v/V8222yWK0gGLE9tiwkDAfcYdRbwmuWIL5YUrhufuGDRugWsBOHO7bGiF1
	eUykBb86QMSN3m/tZpKCme4E0XBQ3UVAMH/LMo/xLAfjcadE5ZYVplGejBbjxFMSiwmo
	3pHLoASOKFJfpkJHD+A+Upvw6qzojJfKoh1mfNKaGu1OTNgDECgo2gKCR3Lp4A9QlXhV
	TfHn97cUN531G9TMJo6Fxkgl0UJ/Wmn5c2XzRHp/1V2iQkEGxLM+Ov5U+4uGbfHUByXe
	oiu9qifiBRMlnj0wqDyJORCoxb0SSFo8zgI0XVCrUPg7z8/sAZluOKWwHf25VJ8TKb1c
	XPxw==
X-Gm-Message-State: APjAAAWPLc3NtkvDunn4quG1lJjBbc2qq19Sar9U00Ws+2Nppd3tGSlB
	+RCU7bnAb71GwQvQpSwwpXDzTLieAqr+YX2fTMo=
X-Google-Smtp-Source: APXvYqxsNiBdu0r6iy/RiMsR5P9pa+hIj/e+hOnRvRj7XQJLJI/sTTrSh/juRlJxqtg/RP8+V3XVX0PmANJJLuKUfxA=
X-Received: by 2002:a67:f8d8:: with SMTP id c24mr12540225vsp.130.1567283068950;
	Sat, 31 Aug 2019 13:24:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAHtQpK5qiC-i-nouQjbk-CToV-Z-jbN-vKZ7Zk0DOtwQC3SUYQ@mail.gmail.com>
	<CAJ86T=Wz=CpQsZgo4C62RUOGAyWVcJe5OZqX_eQFEbbdZkkjWw@mail.gmail.com>
	<20190831121850.GA4729@localhost>
	<CAHtQpK4c_g=+Z1tr2TTdM82vUrhQ1MRE6iThVK3qBBFgQBr_Lw@mail.gmail.com>
In-Reply-To: <CAHtQpK4c_g=+Z1tr2TTdM82vUrhQ1MRE6iThVK3qBBFgQBr_Lw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Sat, 31 Aug 2019 13:24:17 -0700
Message-ID: <CAJ86T=VjgG0m4s0XFMGAqD9qLiyfeHO+urYEP+LWY47AcCLboQ@mail.gmail.com>
To: Andrey Zhizhikin <andrey.z@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>,
	Adrian Bunk <bunk@stusta.de>
Subject: Re: FETCHCMD drop breaks build when append is used (from patch b259bd31eb)
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
X-List-Received-Date: Sat, 31 Aug 2019 20:24:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Aug 31, 2019 at 11:07 AM Andrey Zhizhikin <andrey.z@gmail.com> wrote:
> On Sat, Aug 31, 2019 at 2:18 PM Adrian Bunk <bunk@stusta.de> wrote:
> > Disallowing appends could cause huge problems for a user or layer that
> > has to append local options (e.g. proxy) building a recipe like libedit
> > that has to change the User-Agent.

Clearly we need to have a solution for libedit. I don't see it's
related to user or layer specific issues of setting a password or a
proxy though.

There seem to be three independent cases where appending to the
fetcher commands in bitbake.conf has been used:

1) Setting usernames/passwords for private mirrors, sstate servers,
etc. For that I believe the recommended solution is .netrc. Not only
is putting passwords on the command line a bad idea in general, but it
also won't work consistently for fetchers where download() and
checkstatus() are implemented differently - e.g. for wget, download()
calls wget (and therefore respects FETCHCMD_wget) but checkstatus() is
implemented directly in python (and ignores FETCHCMD_wget completely).
To see the effects, try setting up a password protected http or https
sstate server... it will work if you put your credentials in .netrc
but not if you add them to FETCHCMD_wget.

2) Configuring a proxy server for users behind a firewall. For that I
believe the recommended solution is the various *_proxy environment
variables?

3) Forcing a custom User-Agent. I don't know what the best solution is
here but it feels like the wget fetcher should either handle this
internally (e.g. set a more compatible User-Agent by default?
Automatic retries with various User-Agents?) or provide a documented
API which specifically sets the User-Agent in cases where the default
really does need to be over-ridden.

In the end the bitbake fetchers are abstractions and if users need to
force their own options directly into the final command line (ie
bypassing the abstraction) then it suggests the abstraction is
incomplete. It feels like a slippery slope if we start to encourage or
rely on doing that.

