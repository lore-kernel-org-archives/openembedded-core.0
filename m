Received: from mail-lb0-f177.google.com ([209.85.217.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1U5Gkx-0005YN-Nh
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Feb 2013 15:22:48 +0100
Received: by mail-lb0-f177.google.com with SMTP id go11so149336lbb.36
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2013 06:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=AVXVuQ/D4g25p1TLPtW3N2Gi8+n41pcMtFpD6y9BMHw=;
	b=v5f+11VrcTUxfamgoV978xl5mi3fg4a5+OD6bYG/J3QBCUh/m0qLRufMI9iURxWQMu
	eUGPR45u6VHqY62IiKoGrdnQaBlpn1DdSU5eI62whfN9eSsWZIvoXDNZ/To2/7tYU9BJ
	Drcxri+JXK7gOCG5G/4PVOQafq32AW//wRG1qa07np9VE8ZUuX2tVbrsQQsintDfa/ny
	7HXjkecreF7JqUYVzpmRVtLsCCdcaGW+9ZNK+E/dhQeosPhdCXJKzqdGaBA4N+lp7NRv
	fm7n5R0xFeUxgG9NK2gQogPsZnfIoXInqy6VptpWzNx78/MbsQgbHwnbLz/1l+jes1mb
	wCyA==
MIME-Version: 1.0
X-Received: by 10.112.42.37 with SMTP id k5mr7327296lbl.49.1360678007872; Tue,
	12 Feb 2013 06:06:47 -0800 (PST)
Received: by 10.112.127.35 with HTTP; Tue, 12 Feb 2013 06:06:47 -0800 (PST)
In-Reply-To: <1360675313.30425.14.camel@ted>
References: <cover.1359708915.git.Qi.Chen@windriver.com>
	<b2319aaf09ba1dccdcd58cf067a1b0b1dd4ada93.1359708915.git.Qi.Chen@windriver.com>
	<CADkTA4Nc_fZbBTRbTi8ZbCZAa24_8r_qS9bCfXuoktisC4pavg@mail.gmail.com>
	<510C0FF1.2010400@linux.intel.com>
	<CADkTA4OuDqRE25oNRbFJCyrWpkkj62HpHHNN4qOFocNnrgSY_w@mail.gmail.com>
	<5110A9D1.20208@windriver.com>
	<CADkTA4MN+jzTZCLBK17mJvhvLbAB7yf-8Fr8bRBaM7c=b=_avw@mail.gmail.com>
	<1360675313.30425.14.camel@ted>
Date: Tue, 12 Feb 2013 09:06:47 -0500
Message-ID: <CADkTA4PqMtT5Jt3yuaKO=f=TX4hYk4qFrCP_2amMi3Y=KbW3uw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Zhenfeng.Zhao@windriver.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 12 Feb 2013 14:22:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 12, 2013 at 8:21 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2013-02-05 at 11:29 -0500, Bruce Ashfield wrote:
>> On Tue, Feb 5, 2013 at 1:42 AM, ChenQi <Qi.Chen@windriver.com> wrote:
>>         On 02/02/2013 03:08 AM, Bruce Ashfield wrote:
>>         > On Fri, Feb 1, 2013 at 1:56 PM, Saul Wold
>>         > <sgw@linux.intel.com> wrote:
>>         >         On 02/01/2013 06:18 AM, Bruce Ashfield wrote:
>>         >                 On Fri, Feb 1, 2013 at 4:00 AM,
>>         >                 <Qi.Chen@windriver.com
>>         >                 <mailto:Qi.Chen@windriver.com>> wrote:
>>         >                 <mailto:Qi.Chen@windriver.com>>
>>         >                     Both the implementation and the use case
>>         >                 are similar to yocto kernel's
>>         >                     configuration fragments.
>>         >                 I can fairly easily tweak the configuration
>>         >                 parts of the kern-tools to
>>         >                 handle this
>>         >                 use case as well. That would allow us to
>>         >                 re-use the kernel's merge_config.sh
>>         >                 script (with a minor dependency change) and
>>         >                 save some duplicated code. It
>>         >                 also gets you the advantage that you can
>>         >                 consolidate configuration fragments
>>         >                 outside of any build system, which isn't as
>>         >                 critical here, but something
>>         >                 that
>>         >                 is used quite a bit during kernel testing.
>>         >         Bruce,
>>         >
>>         >         Where is the merge_config.sh script today?  Would
>>         >         you propose moving it to the scripts dir and have
>>         >         the busybox recipe call it?
>>         >
>>         >
>>         > It's part of the mainline kernel, hence why grabbing the
>>         > guts out of it reproducing
>>         > it here isn't the best idea, we'll have a need to keep them
>>         > in sync. In fact, I have
>>         > 2 or 3 pending patches for it in the kern-tools repository
>>         > that I need to get upstream
>>         > (as an example).
>>         >
>>         >
>>         > I'd propose either creating a separate recipe for it (i.e.
>>         > like kconfig-frontends) or I could
>>         > keep it in kern-tools (badly named, but we can work on
>>         > that ;) and maintain / coordinate
>>         > changes to it.
>>         >
>>         >
>>         > I just don't want to see the effort happen twice, we are
>>         > busy enough!
>>         >
>>         >
>>         >         What would be your timing on making such a change,
>>         >         ie hold this patch until your get it merge or merge
>>         >         this and then fix it when you merge your changes?
>>
>>         > I could feasibly get it done in the next few weeks, the
>>         > changes aren't bug, I just
>>         > have to avoid regressions on either side (kernel or busy
>>         > box).
>>
>>         > That being said, the interface to the SRC_URI is the same
>>         > for the two, so if we are
>>         > ok with me arriving and removing the in-recipe support, I
>>         > guess I can't object too
>>         > much :) The only risk is that if anyone starts using this
>>         > first support immediately,
>>         > I do risk regressing their use case, where if it never goes
>>         > in, that won't happen.
>>
>>         > Cheers,
>>         > Bruce
>>
>>         Hi Bruce,
>>
>>         I just tried to reuse the kernel's merge_config.sh script, and
>>         it turned out well.
>>         The patch is in attachment.
>>
>>         Is it enough for now?
>>
>> Yep, this is enough for now. It re-uses the significant part of the
>> infrastructure, which
>> is the important part. Once it is in tree, I can refine the dependency
>> and some other
>> minor modifications.
>>
>> Feel free to add my Signed-off-by: to the patch as well.
>
> This patch triggers a failure on the autobuilder:

Hmmm. I didn't realize this had been picked up yet, I was waiting for
a repost with the Sign-offs. I assume this is master under test ? I can
pick up the patch from there and send an updated patch, since Chen Qi
won't be around to look into this for a few days.

Cheers,

Bruce

>
> http://autobuilder.yoctoproject.org:8010/builders/p1022ds/builds/246/steps/shell_59/logs/stdio
>
> (its reproducible, this is the second one now)
>
> I suspect there is a missing DEPENDS += "kern-tools-native".
>
> You'd be able to reproduce this with a:
>
> bitbake busybox kern-tools-native; bitbake busybox kern-tools-native -c clean; bitbake busybox
>
> Cheers,
>
> Richard
>
>



--
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


