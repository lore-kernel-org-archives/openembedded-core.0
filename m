Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <a1a3bfb6487c0defb9482f9e9bc5ea0337b18d74.camel@linuxfoundation.org>
Subject: Re: [OE-core] pseudo FTBFS with recent glibc
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Mon, 03 Jan 2022 22:08:47 +0000
In-Reply-To: <9aaf313f-983a-a44d-cac8-822929a4dd7d@collabora.co.uk>
References: <e9d8abaa-20e9-4ee6-0cfc-2705d858c432@collabora.co.uk>
	 <e77792acdad02f36f436ccd7fe979c5c56f37361.camel@linuxfoundation.org>
	 <4e46a5df-1abd-2a3c-d8b7-ec98f08be08c@collabora.co.uk>
	 <9aaf313f-983a-a44d-cac8-822929a4dd7d@collabora.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Andrej Shadura <andrew.shadura@collabora.co.uk>, openembedded-core@lists.openembedded.org

On Mon, 2022-01-03 at 20:09 +0100, Andrej Shadura wrote:
> On 03/01/2022 20:04, Andrej Shadura wrote:
> > Hi,
> > 
> > On 03/01/2022 14:47, Richard Purdie wrote:
> > > On Fri, 2021-12-31 at 21:40 +0100, Andrew Shadura wrote:
> > > > pseudo started failing to build from the source apparently after a glibc
> > > > update [1] we had in Debian:
> > > > 
> > > > > > In file included from pseudo_wrappers.c:46:
> > > > > > ports/unix/guts/symlinkat.c: In function ‘wrap_symlinkat’:
> > > > > > pseudo_client.h:14:65: error: ‘_STAT_VER’ undeclared (first use in 
> > > > > > this function)
> > > > > >     14 | #define base_fstatat(dirfd, path, buf, flags) 
> > > > > > real___fxstatat64(_STAT_VER, dirfd, path, buf, flags)
> > > > > >        
> > > > > > >                                                                 
> > > > > > ^~~~~~~~~
> > > > > > ports/unix/guts/symlinkat.c:37:14: note: in expansion of macro 
> > > > > > ‘base_fstatat’
> > > > > >     37 |         rc = base_fstatat(dirfd, newpath, &buf, 
> > > > > > AT_SYMLINK_NOFOLLOW);
> > > > > >        |              ^~~~~~~~~~~~
> > > > 
> > > > A similar issue has been reported against fakeroot [2]. I guess,
> > > > something similar is required for pseudo as well.
> > > > 
> > > > [0]: https://bugs.debian.org/1002136
> > > > [1]: https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=8ed005daf0
> > > > [2]: https://salsa.debian.org/clint/fakeroot/-/merge_requests/10/diffs
> > > > 
> > > 
> > > That looks to be a fairly old version of pseudo. This was fixed here:
> > > 
> > > https://git.yoctoproject.org/pseudo/commit/?h=oe-core&id=f332f5633b5dd73fa2b6e5d605eb33e4a446d7ad 
> 
> > I see. I didn’t realise the development moved to a different branch. How 
> > about deleting the master branch and making oe-core the default one if 
> > master is no longer in use? I think many more people may be missing out 
> > on updates if they only fetch the master branch.
> 
> Oh, I’m being stupid. I did discover this fact in July 2020, and even 
> updated the watch file, but since I added it as a third source and the 
> package tracker doesn’t seem to support it, there was nothing to remind 
> me when I forgot about it.
> 
> Nevertheless, I still think the branches need to get sorted somehow. 
> Also, how about tagging a release? :)

It's complicated. We'd hoped the original author/maintainer might be able to
find time and help review the patches as I've made any of these changes and I'm
not really the expert on it. As time goes on that becomes increasingly unlikely
so we probably do need to move to the master branch at some point. The same
reason has put me off releases.

Cheers,

Richard



