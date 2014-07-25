Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f46.google.com (mail-la0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id 7DBA16DA74
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 13:00:41 +0000 (UTC)
Received: by mail-la0-f46.google.com with SMTP id b8so3050921lan.33
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 06:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=EXgt72048w8+IehAPzes2+t3CQZBylK0ghmbUl2m8d8=;
	b=rOC8huF2soqYz5ehh4rQArEAFDDCWfjTbmW25ramgzGFFnBKvuSgZc77VdZihX3Qdx
	Fbpel5lolLwkDAbB7+uXY3nDLoXqqyTt6QnYEDi8S10Do3t0athAssOMK5jKejOc0G+O
	DezLxkm56V0zdwkXLFUHrI9dUzTGoJCcfrUmb/I9GyDt45YfpTQnHTCzMKQPplk2YFfZ
	rJhkQ+6VEGB3lRyHCfgVe+VNg3xqgASOx76Lh5LB/P5OXinwPOMWF+A/hOcp+5F2jfwy
	/e1fXWPDzw6Qm3lCDuJzIXx95WKlObMXKZqzFhuzhiv6QMf4HFnX9AB1YHEbj38+BAxB
	CVGg==
MIME-Version: 1.0
X-Received: by 10.153.7.101 with SMTP id db5mr13477791lad.46.1406293241736;
	Fri, 25 Jul 2014 06:00:41 -0700 (PDT)
Received: by 10.112.124.137 with HTTP; Fri, 25 Jul 2014 06:00:41 -0700 (PDT)
In-Reply-To: <20140725095325.GR2492@jama>
References: <cover.1406234258.git.bruce.ashfield@windriver.com>
	<67ae6f8074e50a768143cac6a40fd8d16e2f5965.1406234258.git.bruce.ashfield@windriver.com>
	<20140724220210.GO2492@jama>
	<CADkTA4MwiR8v_MAV=To-o-OPhDKT7kXESryCacathmZqNPhpEg@mail.gmail.com>
	<20140725095325.GR2492@jama>
Date: Fri, 25 Jul 2014 09:00:41 -0400
Message-ID: <CADkTA4MsNBb7aqtNRZE1d+qVO4Oy=0DJjeb3j3dgiwXJ68QY0g@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/8] lttng-modules: re-enable ARM builds
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
X-List-Received-Date: Fri, 25 Jul 2014 13:00:48 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jul 25, 2014 at 5:53 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Thu, Jul 24, 2014 at 11:10:50PM -0400, Bruce Ashfield wrote:
>> On Thu, Jul 24, 2014 at 6:02 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> > On Thu, Jul 24, 2014 at 04:41:52PM -0400, Bruce Ashfield wrote:
>> >> With lttng 2.4.2 and gcc 4.9, we can now enable lttng-modules for ARM.
>> >>
>> >> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>> >> ---
>> >>  meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb | 3 +--
>> >>  1 file changed, 1 insertion(+), 2 deletions(-)
>> >>
>> >> diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb b/meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb
>> >> index 5a99a5adae8b..d87374163556 100644
>> >> --- a/meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb
>> >> +++ b/meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb
>> >> @@ -12,8 +12,7 @@ inherit module
>> >>
>> >>  SRCREV = "789fd1d06d07aeb9a403bdce1b3318560cfc6eca"
>> >>
>> >> -# lttng currently blacklists arm with gcc-4.8
>> >> -COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips).*-linux'
>> >> +COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips|arm).*-linux'
>> >
>> > Please squash this to 2/8 otherwise there is no arm version between 2/8
>> > and 6/8.
>>
>> I'd rather not, since they are separate activities. I updated to 2.5,
>> and then enable
>> ARM. One isolated change per commit. Bisectability in a small series is one
>> thing, but also is the isolation of changes.
>
> 2/8 commit message says:
>
> We also drop the older 2.3.3 lttng-modules, since it is no longer
> required to support ARM builds.
>
> Which isn't true at that time and it means that these changes aren't
> separate activities.
>
> To keep them separate, remove 2.3.3 in this commit, not in upgrade to
> 2.5.0. (or with more work involved, enable arm in 2.4* together with
> 2.3.3 removal as someone reported arm+2.4* also working now).

That'll work, but not on tap for me today. I've got a whole set of backed up
change behind my 3.16 work.

If Richard or Saul care,  won't object to any splitting or squashing they
want to do.

Bruce

>
>> Richard can squash on merge is he wants, but I'm going to leave it as is.
>>
>> Bruce
>>
>> >
>> >>  SRC_URI = "git://git.lttng.org/lttng-modules.git;branch=stable-2.5 \
>> >>             file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch \
>> >> --
>> >> 1.8.1.2
>> >>
>> >> --
>> >> _______________________________________________
>> >> Openembedded-core mailing list
>> >> Openembedded-core@lists.openembedded.org
>> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> >
>> > --
>> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> >
>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end"
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

