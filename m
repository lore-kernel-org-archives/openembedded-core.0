Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <f5c9459b58387d3870f919a2d2e20b27a39d8369.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] "bitbake-prserv-tool: Added quotes to variables to prevent splitting and gobbling"
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Wed, 13 Apr 2022 13:55:03 +0100
In-Reply-To: <14039.1649854340073445800@lists.openembedded.org>
References: 
	<a5c8cf17bbdefa8eaf56c015fd548e6bf6f69499.camel@linuxfoundation.org>
	 <14039.1649854340073445800@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Abongwa Amahnui Bonalais <abongwabonalais@gmail.com>, openembedded-core@lists.openembedded.org

On Wed, 2022-04-13 at 05:52 -0700, Abongwa Amahnui Bonalais wrote:
> I test the results by running bitbake core-image-sato.
> If it builds successsfully, then I assume that it is fine, 
> Please what method do you recommend I use to test the results.

You need to find a test which tests the component you're changing. "bitbake
core-image-sato" would test oe-init-build-env but it does not test toaster or 
bitbake-prserv-tool since that are not involved with that command.

An easy way to check is to actively break the script, put something in there you
know will break. If your test doesn't show it not working, it must not be
testing it.

Cheers,

Richard

