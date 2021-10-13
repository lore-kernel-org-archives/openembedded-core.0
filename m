Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <61a1ac0ef74f2f6b0065144823dfc0ab0d19c11e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] packagedata.py: silence a DeprecationWarning
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Wed, 13 Oct 2021 17:51:22 +0100
In-Reply-To: <fc590102-151a-aa4f-f04c-918fa1f0179d@windriver.com>
References: <20211011082848.12434-1-mingli.yu@windriver.com>
	 <fc590102-151a-aa4f-f04c-918fa1f0179d@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Randy MacLeod <randy.macleod@windriver.com>, "Yu, Mingli" <mingli.yu@windriver.com>, openembedded-core@lists.openembedded.org

On Wed, 2021-10-13 at 12:40 -0400, Randy MacLeod wrote:
> On 2021-10-11 4:28 a.m., Yu, Mingli wrote:
> > From: Mingli Yu <mingli.yu@windriver.com>
> > 
> > Use regex strings (r’’) to silence below deprecation warning [1]:
> >   $ cat tmp/work/intel_x86_64-wrs-linux/linux-yocto/5.10.x+gitAUTOINC+917c420111_373c02c3ca-r0/temp/log.do_deploy
> >   [snip]
> >   /build/layers/oe-core/meta/lib/oe/packagedata.py:22: DeprecationWarning: invalid escape sequence \s
> >   r = re.compile("(^.+?):\s+(.*)")
> >   [snip]
> > 
> > [1] https://docs.python.org/3/library/re.html
> 
> 
> "Also, please note that any invalid escape sequences in Python’s usage 
> of the backslash in string literals now generate a DeprecationWarning 
> and in the future this will become a SyntaxError."
> 
> so it would seem that our use is invalid and if so we should fix it 
> before it becomes an error, right?
> 
> If so please create a YP bugzilla defect.

The patch is the right fix and will avoid those issues as it is now correctly
marked as a regex.

Cheers,

Richard

