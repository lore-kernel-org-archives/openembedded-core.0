Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <e2b6066a69cf7933b0618a66b7e1b3589ff6da5c.camel@linuxfoundation.org>
Subject: Re: [PATCH v1 1/2] gpg-sign: Add parameters to gpg signature function
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Thu, 24 Mar 2022 08:12:44 +0000
In-Reply-To: <fe0f9ee8-e3d0-1681-af93-fa97019b8a0c@gmail.com>
References: <20220322211949.7423-1-fntoth@gmail.com>
	 <fe0f9ee8-e3d0-1681-af93-fa97019b8a0c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Ferry Toth <fntoth@gmail.com>, openembedded-core@lists.openembedded.org
Cc: Xavier Berger <xavier.berger@bio-logic.net>

On Wed, 2022-03-23 at 19:34 +0100, Ferry Toth wrote:
> Hi Richard,
> 
> I forgot to add a cover letter, sorry for that. The 2 patches  together 
> implement DEB repository signing.
> 
> This is necessary since Gatesgarth |apt| (1.8.2) has become more strict 
> and doesn’t allow unsigned repositories by default.
> 
> It is possible to override this behavior |but||| is more work then to 
> enable signed DEB repositories. These patches makes DEB a first class 
> citizen as IPK and RPM.
> 
> Patches have been in use in meta-intel-edison since Gatesgarth, see 
> https://edison-fw.github.io/meta-intel-edison/5.0-Creating-a-deb-repository.html\

What puzzles me is that we can build root filesystems using apt, we test this on
the autobuilder. Saying repositories are broken since gatesgarth therefore seems
confusing in the commit message.

I guess we must configure apt to override that during the rootfs process and
likely an end user with a remote feed could do the same, possibly with a warning
from apt?

I'm also worried that there isn't any automated testing of this change. The
reason I worry is that since we don't show any testing failures right now, there
is clearly a hole in our automated testing coverage and there is no guarantee
that this feature will keep working. It is these smaller corner case issues
which tend to make or break the project's experience as if a feature is present,
people expect it to work. Can we improve the testing situation?

Cheers,

Richard



