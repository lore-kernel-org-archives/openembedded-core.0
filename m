Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <7d146babd0bd0ac532c645eed0c14faacb0a44a5.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] Added quotes around variables to prevent word splitting in the oe-init-build-env/oe-setup-builddir shell scripts.
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Wed, 06 Apr 2022 08:07:05 +0100
In-Reply-To: <61ac8fdf-f8d9-8004-2282-73d13ed875b3@windriver.com>
References: <20220405171717.54715-1-abongwabonalais@gmail.com>
	 <61ac8fdf-f8d9-8004-2282-73d13ed875b3@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Chen Qi <Qi.Chen@windriver.com>, Abongwa Amahnui Bonalais <abongwabonalais@gmail.com>, openembedded-core@lists.openembedded.org

On Wed, 2022-04-06 at 11:08 +0800, Chen Qi wrote:
> Whitespace is not a valid char in builddir. There's sanity check for 
> this in sanity.bbclass:
> if val.find(' ') != -1:
>              status.addresult("Error, you have a space in your %s 
> directory path. Please move the installation to a directory which 
> doesn't include a space since autotools doesn't support this." % checkdir)

The issue was that you couldn't reach that error message if you had a space in
the build path. This change allows you to reach the sanity check!

Cheers,

Richard

