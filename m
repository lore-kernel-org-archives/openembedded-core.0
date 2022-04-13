Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <a5c8cf17bbdefa8eaf56c015fd548e6bf6f69499.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] "bitbake-prserv-tool: Added quotes to variables to prevent splitting and gobbling"
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Wed, 13 Apr 2022 12:13:59 +0100
In-Reply-To: <5735.1649847000305548289@lists.openembedded.org>
References: 
	<8d17cc7d9f13ca534b3f56cb299a1e26da042e18.camel@linuxfoundation.org>
	 <5735.1649847000305548289@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Abongwa Amahnui Bonalais <abongwabonalais@gmail.com>, openembedded-core@lists.openembedded.org

On Wed, 2022-04-13 at 03:50 -0700, Abongwa Amahnui Bonalais wrote:
> Okay thank you what about Using $(...) notation instead of legacy backticked
> `...`.
> base=`basename $0`, changing it to base=$(basename $0)
> 
> Should I commence those changes?
> I'm seeing that based om recommendations when I run shellcheck <name of file>

It depends on how you're testing the end result.

I don't mind improving the scripts but what we don't really want are patches
made by just doing what that tool says without the result being tested.

How are you testing the results?

Cheers,

Richard

