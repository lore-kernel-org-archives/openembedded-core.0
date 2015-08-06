Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 5D3BE6E630
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Aug 2015 02:20:49 +0000 (UTC)
Received: by iodb91 with SMTP id b91so7966049iod.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Aug 2015 19:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=DPZW1gD51kFwYHWniEzInY2m+Pg60zJ32UkOulFQpJQ=;
	b=ZSvJy4s5XSzSyWVpWS3pt+3emFjZfYSGz8ia2QCp1Z6Y5h59Z4cRDhry+7gvPbEezK
	iHfBfUFHQnttsq2Ww4ZTiIyJ3ESiVmyjk4eV/wyKGtWmbhy+FY7udSB9RB/lSe4H9APo
	RZ/zk3h/vF15wv2tccBJyc04KL9Hpslg5cQoIH+YAPU1y63YaBRswtd7+673KSogt68b
	vnQr7e03pFMjVAD0fgjdhs8jDM/ozKhXvTi6NeXlEaUA1vPCaxsuSDKSAH/3UjF8CPqi
	5uPS9yTETeY+6pJLoIGdS/8i7XP7oWFKkbOdRkUPSeWFFBf7t6AtBFqGmdQR95aif0Nq
	QBaw==
X-Received: by 10.107.34.194 with SMTP id i185mr12932142ioi.49.1438827649857; 
	Wed, 05 Aug 2015 19:20:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.79 with HTTP; Wed, 5 Aug 2015 19:20:20 -0700 (PDT)
In-Reply-To: <6E51916E4A1F32428260031F4C7CD2B6101D4E4C@ORSMSX109.amr.corp.intel.com>
References: <1438634128-4347-1-git-send-email-juro.bystricky@intel.com>
	<55C0E631.7070703@windriver.com>
	<6E51916E4A1F32428260031F4C7CD2B6101D46F3@ORSMSX109.amr.corp.intel.com>
	<55C0F729.5000908@windriver.com>
	<CADkTA4MPP3KiV9Nq_wi-_qx26mGEkX+uzXvv4ZXfM0YpMEccKw@mail.gmail.com>
	<CADkTA4PchJT4R5tmzeYwOWQLf_4OnuD0KtU08z=Yjf0zfEwM0A@mail.gmail.com>
	<6E51916E4A1F32428260031F4C7CD2B6101D4E4C@ORSMSX109.amr.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 5 Aug 2015 19:20:20 -0700
Message-ID: <CAMKF1sr4WGmTuK9CcNpXdgDx2aKMH6ynSo=rUQKo1n59CdPdRQ@mail.gmail.com>
To: "Bystricky, Juro" <juro.bystricky@intel.com>
Cc: "Purdie, Richard" <richard.purdie@intel.com>,
	"jurobystricky@hotmail.com" <jurobystricky@hotmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Support for VirtualBox guest additions
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
X-List-Received-Date: Thu, 06 Aug 2015 02:20:52 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 5, 2015 at 3:02 PM, Bystricky, Juro
<juro.bystricky@intel.com> wrote:
> Thanks for the link. My new understanding is that kernel-dev package
> should already have essentially the same functionality as the kernel-headers package,
> which makes kernel-headers package redundant.
>  I tried it, but it did not work.
> To be specific, I expected to see the folder "/usr/lib/modules/3.19.5-yocto-standard/build"
> however, it is missing . Looking at kernel.bbclass it seems it used to exist, but succumbed to
> some bitrot.
>

have you thought of looking at the guest additions package and see if
it could be doing something
that can be fixed ? what you need here is kernel development files on
target I assume, that should be easier than
cross-build scenario which we have not fixed completely. I think this
additional headers package is redundant.
you could get by fixing the existing kernel-headers package ( for
target) if anything is missing.

How is guest additions compiled ? is it during build or dynamically on target ?

> Just to make sure  we are on the same page, this is what I would like to accomplish:
> http://www.cyberciti.biz/tips/build-linux-kernel-module-against-installed-kernel-source-tree.html
>
> Juro
>
>> -----Original Message-----
>> From: Bruce Ashfield [mailto:bruce.ashfield@gmail.com]
>> Sent: Tuesday, August 4, 2015 7:49 PM
>> To: Hatle, Mark G (Wind River)
>> Cc: Bystricky, Juro; openembedded-core@lists.openembedded.org;
>> jurobystricky@hotmail.com; Purdie, Richard
>> Subject: Re: [OE-core] [PATCH 0/2] Support for VirtualBox guest additions
>>
>> On Tue, Aug 4, 2015 at 11:43 PM, Bruce Ashfield <bruce.ashfield@gmail.com>
>> wrote:
>> > On Tue, Aug 4, 2015 at 2:32 PM, Mark Hatle <mark.hatle@windriver.com>
>> wrote:
>> >> On 8/4/15 12:25 PM, Bystricky, Juro wrote:
>> >>> I agree, the name "kernel-headers" may not be the most fortunate,
>> "linux-headers"
>> >>> is probably more fitting.  The recipe installs the files in a
>> >>> similar fashion that is done by
>> >>>
>> >>> apt-get install linux-headers-$(uname -r)
>> >>>
>> >>> Typical contents can be viewed for example here:
>> >>> https://www.archlinux.org/packages/core/i686/linux-headers/
>> >>>
>> >>> These files are needed to allow building  of kernel drivers against
>> >>> the running Linux kernel. In a way, it is a subset of kernel-devsrc,
>> >>> but including  ".config" file used for the actual running kernel.
>> >>
>> >> Again this is part of the purpose of the existing kernel-devsrc
>> >> package.  So what is missing preventing this from working.  It likely
>> >> needs to be added to the kernel-devsrc package instead (or a sub
>> >> package that is created by the kernel-devsrc recipe.)
>> >
>> > Peeking in on vacation.
>> >
>> > At a minimum, we need to figure out why the existing package wasn't
>> > able to build the use case in question here .. I've built pretty much
>> > everything against it at one point .. so I'd like to learn more.
>> >
>> > And yes, what we don't need is more sets of rules that copy and
>> > package parts of the kernel build. We are already doing that in our
>> > do_shared_workdir and that is pretty much the minimum to build against
>> > the kernel. If that directory structure needs more for this purpose (or less),
>> then update it.
>> >
>> > But we need to do all of this in the existing classes, to keep
>> > everything in one place, not more recipes that are grabbing chunks of
>> > the same source tree.
>>
>> FYI: exiting thoughts are here:
>>
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=7095
>>
>> So as you can see, we aren't offended by a 'headers' package, but it has to
>> make sense with the existing packages, and needs to be generating from our
>> existing bits of the system.
>>
>> Cheers,
>>
>> Bruce
>>
>> >
>> > Bruce
>> >
>> >
>> >>
>> >>> Having these files installed, it is possible  to compile additional
>> >>> kernel drivers that are not part of the kernel-devsrc .
>> >>>  VirtualBox compiles some of their own drivers this way, others as well.
>> >>> There are many other scenarios where you may want to add a new
>> >>> kernel driver to an already installed Linux kernel.
>> >>
>> >> Yes, this was part of the design behind the kernel-devsrc, make sure
>> >> the sources and components used to build the running kernel were made
>> >> available to the target so that out-of-tree/external kernel modules
>> >> could be built to match the running system -- as well as the ability
>> >> to reconfigure and rebuild the kernel itself.
>> >>
>> >> Bruce is on vacation this week and may not be around to respond, but
>> >> adding yet another package is not the right answer here.  Lets fix
>> >> what may be broken in what we have.
>> >>
>> >> --Mark
>> >>
>> >>> Juro
>> >>>
>> >>>
>> >>>
>> >>>> -----Original Message-----
>> >>>> From: Mark Hatle [mailto:mark.hatle@windriver.com]
>> >>>> Sent: Tuesday, August 4, 2015 9:20 AM
>> >>>> To: Bystricky, Juro; openembedded-core@lists.openembedded.org;
>> >>>> jurobystricky@hotmail.com
>> >>>> Cc: Purdie, Richard
>> >>>> Subject: Re: [OE-core] [PATCH 0/2] Support for VirtualBox guest
>> >>>> additions
>> >>>>
>> >>>> On 8/3/15 3:35 PM, Juro Bystricky wrote:
>> >>>>> In order to support VirtualBox guest additions, kernel headers
>> >>>>> need to be present in the VM. I am aware we already have two
>> >>>>> packages/recipes that are somewhat similar (kernel-devsrc.bb,
>> >>>>> linux-libc-headers), but none
>> >>>> of them is suitable for this purpose.
>> >>>>> Besides the kernel headers, some additional files (scripts,
>> >>>>> Makefiles, .config, etc) are also required.
>> >>>>
>> >>>> linux-libc-headers is only for building applications.
>> >>>> kernel-devsrc is for building modules on the target.
>> >>>>
>> >>>> What do these specific modules need that are not present in kernel-
>> devsrc?
>> >>>> (I really don't want 'yet another' confusing package added to the
>> >>>> system.)
>> >>>>
>> >>>>> The new recipe "kernel-headers.bb" can in principle be used by
>> >>>>> other
>> >>>> images as well.
>> >>>>> It is not limited to the Build Appliance and hence is not a part
>> >>>>> of the Build Appliance recipe.
>> >>>>
>> >>>> I think kernel-headers is a bad name for a package.  It could be
>> confusing.
>> >>>>
>> >>>> --Mark
>> >>>>
>> >>>>> Juro Bystricky (2):
>> >>>>>   kernel-headers: linux kernel headers
>> >>>>>   build-appliance-image: support for VirtualBox guest addtions
>> >>>>>
>> >>>>>  .../README_vbox_guest_additions.txt                | 78
>> >>>> ++++++++++++++++++++++
>> >>>>>  .../images/build-appliance-image_12.0.1.bb         |  4 +-
>> >>>>>  meta/recipes-kernel/linux/kernel-headers.bb        | 66
>> >>>> ++++++++++++++++++
>> >>>>>  3 files changed, 147 insertions(+), 1 deletion(-)  create mode
>> >>>>> 100644
>> >>>>> meta/recipes-core/images/build-appliance-
>> >>>> image/README_vbox_guest_addit
>> >>>>> ions.txt  create mode 100644
>> >>>>> meta/recipes-kernel/linux/kernel-headers.bb
>> >>>>>
>> >>>
>> >>
>> >> --
>> >> _______________________________________________
>> >> Openembedded-core mailing list
>> >> Openembedded-core@lists.openembedded.org
>> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> >
>> >
>> >
>> > --
>> > "Thou shalt not follow the NULL pointer, for chaos and madness await
>> > thee at its end"
>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
>> at its end"
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

