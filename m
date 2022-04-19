Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <8050dab48b75f758d72ab78250e4f68f432b8d6f.camel@linuxfoundation.org>
Subject: Re: package_manager: support for signed DEB package feeds
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Tue, 19 Apr 2022 14:21:02 +0100
In-Reply-To: <20220413203742.6142-1-fntoth@gmail.com>
References: <20220413203742.6142-1-fntoth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Ferry Toth <fntoth@gmail.com>, openembedded-core@lists.openembedded.org
Cc: Xavier Berger <xavier.berger@biologic.net>, Alexander Kanavin <alex@linutronix.de>, Alexandre Belloni <alexandre.belloni@bootlin.com>

On Wed, 2022-04-13 at 22:37 +0200, Ferry Toth wrote:
> [PATCH v4 1/2] apt: add apt selftest to test signed package feeds
> [PATCH v4 2/2] package_manager: fix missing dependency on gnupg when
> 
> Since Gatesgarth apt (1.8.2) has become more strict and doesn’t allow unsigned repositories by default.
> Currently when building images this requirement is worked around by using [allow-insecure=yes] and
> equivalently when performing selftest.
>     
> Patches "gpg-sign: Add parameters to gpg signature function" and "package_manager: sign deb package feeds"
> (already in master) enable signed deb package feeds. When called from 
> `oe-selftest -r runtime_test.TestImage.test_testimage_apt` this patch adds a runtime test for apt 
> derived from the test_testimage_dnf test. It creates a signed deb package feed, runs a qemu 
> image to install the key and performs some package management. To be able to install the key
> the gnupg package is added to the testimage.
> 
> Changes in V4:
>  - Add fix to make gnupg-native a dependency else hosttools is used and 
>    `oe-selftest -r runtime_test.TestImage.test_testimage_apt` fails on Ubuntu 16.04 used 
>    on the autobuilder (Alexandre Belloni)
> 
> Changes in V3:
>  - When called from `bitbake core-image-sato -c testimage` package feed is unsigned. Auto-detect
>    this case and behave as before (Richard Purdie)
> 
> Changes in V2:
>  - Added runtime test for signed deb package feeds (Richard Purdie)

This has now merged, thanks for working through the details with this! The test
should allow the functionality to stay working and is extremely useful/helpful.

Cheers,

Richard

