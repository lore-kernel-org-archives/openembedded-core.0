Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <e77792acdad02f36f436ccd7fe979c5c56f37361.camel@linuxfoundation.org>
Subject: Re: [OE-core] pseudo FTBFS with recent glibc
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Mon, 03 Jan 2022 13:47:03 +0000
In-Reply-To: <e9d8abaa-20e9-4ee6-0cfc-2705d858c432@collabora.co.uk>
References: <e9d8abaa-20e9-4ee6-0cfc-2705d858c432@collabora.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Andrew Shadura <andrew.shadura@collabora.co.uk>, openembedded-core@lists.openembedded.org

Hi,

On Fri, 2021-12-31 at 21:40 +0100, Andrew Shadura wrote:
> Hi,
> 
> pseudo started failing to build from the source apparently after a glibc 
> update [1] we had in Debian:
> 
> > > In file included from pseudo_wrappers.c:46:
> > > ports/unix/guts/symlinkat.c: In function ‘wrap_symlinkat’:
> > > pseudo_client.h:14:65: error: ‘_STAT_VER’ undeclared (first use in this function)
> > >    14 | #define base_fstatat(dirfd, path, buf, flags) real___fxstatat64(_STAT_VER, dirfd, path, buf, flags)
> > >       |                                                                 ^~~~~~~~~
> > > ports/unix/guts/symlinkat.c:37:14: note: in expansion of macro ‘base_fstatat’
> > >    37 |         rc = base_fstatat(dirfd, newpath, &buf, AT_SYMLINK_NOFOLLOW);
> > >       |              ^~~~~~~~~~~~
> 
> A similar issue has been reported against fakeroot [2]. I guess, 
> something similar is required for pseudo as well.
> 
> [0]: https://bugs.debian.org/1002136
> [1]: https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=8ed005daf0
> [2]: https://salsa.debian.org/clint/fakeroot/-/merge_requests/10/diffs
> 

That looks to be a fairly old version of pseudo. This was fixed here:

https://git.yoctoproject.org/pseudo/commit/?h=oe-core&id=f332f5633b5dd73fa2b6e5d605eb33e4a446d7ad

Cheers,

Richard

