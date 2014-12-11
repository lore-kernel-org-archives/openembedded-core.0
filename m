Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4C0F565CAF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Dec 2014 13:59:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sBBDwKER011302; Thu, 11 Dec 2014 13:58:20 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id P70HSYHuGTsC; Thu, 11 Dec 2014 13:58:20 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sBBDw72R011299
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 11 Dec 2014 13:58:18 GMT
Message-ID: <1418306324.22903.72.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 11 Dec 2014 13:58:44 +0000
In-Reply-To: <CADkTA4P0XMtSxKop9vqr6SbS8KBmaGuZfKFs7Ej0CsDcqLt4DQ@mail.gmail.com>
References: <cover.1418220684.git.bruce.ashfield@windriver.com>
	<CAJTo0LaGa3ACsL+vLjzUDgEQDDxJ2L2m1WQgj1LHdbzpsJPLUg@mail.gmail.com>
	<CADkTA4P0XMtSxKop9vqr6SbS8KBmaGuZfKFs7Ej0CsDcqLt4DQ@mail.gmail.com>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [v2 PATCH 0/9] kernel: version updates
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
X-List-Received-Date: Thu, 11 Dec 2014 13:59:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-12-11 at 03:31 -0500, Bruce Ashfield wrote:
> On Wed, Dec 10, 2014 at 10:02 AM, Burton, Ross <ross.burton@intel.com> wrote:
> >
> > On 10 December 2014 at 14:16, Bruce Ashfield <bruce.ashfield@windriver.com>
> > wrote:
> >>
> >> The following changes since commit
> >> 88dfcbf149dda89277e58ae4ec3a87500624cfff:
> >>
> >>   kernel-yocto: make sure git tags get dereferenced properly in do_patch()
> >> (2014-12-10 08:12:56 -0500)
> >>
> >> are available in the git repository at:
> >>
> >>   git://git.pokylinux.org/poky-contrib HEAD
> >
> >
> > I wonder what happened here!
> 
> @#!$#@$ the script is insane.
> 
> >
> >>
> >> for you to fetch changes up to 4be985be419f06f18c735d72ac4a4d00fea71dd8:
> >>
> >>   linux-yocto/3.14: update to 3.14.26, integrate ltsi and -rt updates
> >> (2014-12-10 08:38:49 -0500)
> >
> >
> > That's zedd/kernel-updates, right?
> >
> 
> Yah. Sorry about the confusion,

I've been experimenting, the upgrades look good but we have a problem
with the new kernel class changes.

The issue is that if you have an existing TMPDIR, the build will do "bad
things".

Basically, there is usually an existing sstate manifest file which
covers the kernel source in the sysroot. do_configure will trigger
cleaning of that manifest, a large chunk of the source disappears and
then the build understandably fails.

Whilst I can say what is happening, I can't say how we fix it at this
point :/.

I would like people to test these patches, we'd better hold off merging
until we can get this issue figured out. Its part of a wider problem
with "stale" data in the sysroot which we really need to figure out but
its not been solved yet as its a  very hard problem for which we don't
have a solution :(.

Cheers,

Richard



