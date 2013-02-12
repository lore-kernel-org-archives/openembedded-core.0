Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1U5I6J-0007s0-6g for openembedded-core@lists.openembedded.org;
	Tue, 12 Feb 2013 16:48:55 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1CFck1x032467; Tue, 12 Feb 2013 15:38:46 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id YeaexSZfIhsT; Tue, 12 Feb 2013 15:38:46 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1CFcdeG032454
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 12 Feb 2013 15:38:42 GMT
Message-ID: <1360683160.30425.29.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 12 Feb 2013 15:32:40 +0000
In-Reply-To: <CADkTA4PqMtT5Jt3yuaKO=f=TX4hYk4qFrCP_2amMi3Y=KbW3uw@mail.gmail.com>
References: <cover.1359708915.git.Qi.Chen@windriver.com>
	<b2319aaf09ba1dccdcd58cf067a1b0b1dd4ada93.1359708915.git.Qi.Chen@windriver.com>
	<CADkTA4Nc_fZbBTRbTi8ZbCZAa24_8r_qS9bCfXuoktisC4pavg@mail.gmail.com>
	<510C0FF1.2010400@linux.intel.com>
	<CADkTA4OuDqRE25oNRbFJCyrWpkkj62HpHHNN4qOFocNnrgSY_w@mail.gmail.com>
	<5110A9D1.20208@windriver.com>
	<CADkTA4MN+jzTZCLBK17mJvhvLbAB7yf-8Fr8bRBaM7c=b=_avw@mail.gmail.com>
	<1360675313.30425.14.camel@ted>
	<CADkTA4PqMtT5Jt3yuaKO=f=TX4hYk4qFrCP_2amMi3Y=KbW3uw@mail.gmail.com>
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com, Patches,
	oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] busybox: add config fragments
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Feb 2013 15:48:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-02-12 at 09:06 -0500, Bruce Ashfield wrote:
> On Tue, Feb 12, 2013 at 8:21 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Tue, 2013-02-05 at 11:29 -0500, Bruce Ashfield wrote:
> >> On Tue, Feb 5, 2013 at 1:42 AM, ChenQi <Qi.Chen@windriver.com> wrote:
> >>         On 02/02/2013 03:08 AM, Bruce Ashfield wrote:
> >>         > On Fri, Feb 1, 2013 at 1:56 PM, Saul Wold
> >>         > <sgw@linux.intel.com> wrote:
> >>         >         On 02/01/2013 06:18 AM, Bruce Ashfield wrote:
> >>         >                 On Fri, Feb 1, 2013 at 4:00 AM,
> >>         >                 <Qi.Chen@windriver.com
> >>         >                 <mailto:Qi.Chen@windriver.com>> wrote:
> >>         >                 <mailto:Qi.Chen@windriver.com>>
> >>         >                     Both the implementation and the use case
> >>         >                 are similar to yocto kernel's
> >>         >                     configuration fragments.
> >>         >                 I can fairly easily tweak the configuration
> >>         >                 parts of the kern-tools to
> >>         >                 handle this
> >>         >                 use case as well. That would allow us to
> >>         >                 re-use the kernel's merge_config.sh
> >>         >                 script (with a minor dependency change) and
> >>         >                 save some duplicated code. It
> >>         >                 also gets you the advantage that you can
> >>         >                 consolidate configuration fragments
> >>         >                 outside of any build system, which isn't as
> >>         >                 critical here, but something
> >>         >                 that
> >>         >                 is used quite a bit during kernel testing.
> >>         >         Bruce,
> >>         >
> >>         >         Where is the merge_config.sh script today?  Would
> >>         >         you propose moving it to the scripts dir and have
> >>         >         the busybox recipe call it?
> >>         >
> >>         >
> >>         > It's part of the mainline kernel, hence why grabbing the
> >>         > guts out of it reproducing
> >>         > it here isn't the best idea, we'll have a need to keep them
> >>         > in sync. In fact, I have
> >>         > 2 or 3 pending patches for it in the kern-tools repository
> >>         > that I need to get upstream
> >>         > (as an example).
> >>         >
> >>         >
> >>         > I'd propose either creating a separate recipe for it (i.e.
> >>         > like kconfig-frontends) or I could
> >>         > keep it in kern-tools (badly named, but we can work on
> >>         > that ;) and maintain / coordinate
> >>         > changes to it.
> >>         >
> >>         >
> >>         > I just don't want to see the effort happen twice, we are
> >>         > busy enough!
> >>         >
> >>         >
> >>         >         What would be your timing on making such a change,
> >>         >         ie hold this patch until your get it merge or merge
> >>         >         this and then fix it when you merge your changes?
> >>
> >>         > I could feasibly get it done in the next few weeks, the
> >>         > changes aren't bug, I just
> >>         > have to avoid regressions on either side (kernel or busy
> >>         > box).
> >>
> >>         > That being said, the interface to the SRC_URI is the same
> >>         > for the two, so if we are
> >>         > ok with me arriving and removing the in-recipe support, I
> >>         > guess I can't object too
> >>         > much :) The only risk is that if anyone starts using this
> >>         > first support immediately,
> >>         > I do risk regressing their use case, where if it never goes
> >>         > in, that won't happen.
> >>
> >>         > Cheers,
> >>         > Bruce
> >>
> >>         Hi Bruce,
> >>
> >>         I just tried to reuse the kernel's merge_config.sh script, and
> >>         it turned out well.
> >>         The patch is in attachment.
> >>
> >>         Is it enough for now?
> >>
> >> Yep, this is enough for now. It re-uses the significant part of the
> >> infrastructure, which
> >> is the important part. Once it is in tree, I can refine the dependency
> >> and some other
> >> minor modifications.
> >>
> >> Feel free to add my Signed-off-by: to the patch as well.
> >
> > This patch triggers a failure on the autobuilder:
> 
> Hmmm. I didn't realize this had been picked up yet, I was waiting for
> a repost with the Sign-offs. I assume this is master under test ? I can
> pick up the patch from there and send an updated patch, since Chen Qi
> won't be around to look into this for a few days.

It was master under test, it won't make master until it works :)

I don't mind who sends me the working version.

Cheers,

Richard





