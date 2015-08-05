Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-yk0-f179.google.com (mail-yk0-f179.google.com
	[209.85.160.179])
	by mail.openembedded.org (Postfix) with ESMTP id 969C66E630
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Aug 2015 02:24:16 +0000 (UTC)
Received: by ykcq64 with SMTP id q64so19600401ykc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Aug 2015 19:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=4R9vWhvEPzlUjb8O8hd26wxYSLp8j1zrPffyQI7OzNM=;
	b=XpXEJFFBNAkBtpWDgzWiedKtjkk0jWXm7qs2polT2fIiYallWjm+mzANyMl+B1GWGt
	Mbfj9YM6S6g1wPj5J96d7ujTGERzSKeO6an+YDEcLYhTX/Z72jdA9be+qgHHBCsZdBPX
	xy5D3Xwq598zs5MFxmray9t8/YxgXXwsoA7EumWzFbW61bqlxPAPlP1oGJZIHlbFYO02
	KxOfPOXuluTrB89W70dT/rAvOuRAZ63QumOxfVgDtD0h9MRE93oOBDLFuJcHXrIBJQXK
	ZvTeYWz7S6kzlMjgla9La8oDyV+Hyxq54yv/JSYPMIx+cbg5shzvxerQsIuiXCXM2/JT
	tJqw==
MIME-Version: 1.0
X-Received: by 10.13.234.76 with SMTP id t73mr7171343ywe.68.1438741456330;
	Tue, 04 Aug 2015 19:24:16 -0700 (PDT)
Received: by 10.13.226.203 with HTTP; Tue, 4 Aug 2015 19:24:16 -0700 (PDT)
In-Reply-To: <6E51916E4A1F32428260031F4C7CD2B6101D471A@ORSMSX109.amr.corp.intel.com>
References: <1438634128-4347-1-git-send-email-juro.bystricky@intel.com>
	<55C0E631.7070703@windriver.com>
	<6E51916E4A1F32428260031F4C7CD2B6101D46F3@ORSMSX109.amr.corp.intel.com>
	<55C0F729.5000908@windriver.com>
	<6E51916E4A1F32428260031F4C7CD2B6101D471A@ORSMSX109.amr.corp.intel.com>
Date: Tue, 4 Aug 2015 23:24:16 -0300
Message-ID: <CADkTA4OO=C0DpnJvqvsGommRzuARAuJoXdxOz92cLTLCW_N5Wg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
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
X-List-Received-Date: Wed, 05 Aug 2015 02:24:19 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 4, 2015 at 4:10 PM, Bystricky, Juro
<juro.bystricky@intel.com> wrote:
> I am pretty sure initially I tried to use kernel-devsrc  to install VirtualBox guest additions.
> It did not work out of the box for me, there were either files missing or they were not in expected locations.
> It is possible it could  be made to work with some modified installation,  but the size is an issue
> as well: kernel-devsrc packs over 500MB (uncompressed).

Please give details .. not just statements of "it didn't work". The use
case you claim is one that we explicitly test with the existing packages.
So something has gone  wrong, it isn't something that should be
broken like you describe.

>
> The source code is only needed when you want to reconfigure/rebuild the kernel.
> Out-of-tree modules generally don't need any additional source code, typically only header files.

Yep, this is very well known. Check the Yocto bugzilla. We've gone back and
forth on this many times.

Bruce

>
>
> Juro
>
>
>> -----Original Message-----
>> From: Mark Hatle [mailto:mark.hatle@windriver.com]
>> Sent: Tuesday, August 4, 2015 10:32 AM
>> To: Bystricky, Juro; openembedded-core@lists.openembedded.org;
>> jurobystricky@hotmail.com
>> Cc: Purdie, Richard
>> Subject: Re: [OE-core] [PATCH 0/2] Support for VirtualBox guest additions
>>
>> On 8/4/15 12:25 PM, Bystricky, Juro wrote:
>> > I agree, the name "kernel-headers" may not be the most fortunate, "linux-
>> headers"
>> > is probably more fitting.  The recipe installs the files in a similar
>> > fashion that is done by
>> >
>> > apt-get install linux-headers-$(uname -r)
>> >
>> > Typical contents can be viewed for example here:
>> > https://www.archlinux.org/packages/core/i686/linux-headers/
>> >
>> > These files are needed to allow building  of kernel drivers against
>> > the running Linux kernel. In a way, it is a subset of kernel-devsrc,
>> > but including  ".config" file used for the actual running kernel.
>>
>> Again this is part of the purpose of the existing kernel-devsrc package.  So
>> what is missing preventing this from working.  It likely needs to be added to
>> the kernel-devsrc package instead (or a sub package that is created by the
>> kernel-devsrc recipe.)
>>
>> > Having these files installed, it is possible  to compile additional
>> > kernel drivers that are not part of the kernel-devsrc .
>> >  VirtualBox compiles some of their own drivers this way, others as well.
>> > There are many other scenarios where you may want to add a new kernel
>> > driver to an already installed Linux kernel.
>>
>> Yes, this was part of the design behind the kernel-devsrc, make sure the
>> sources and components used to build the running kernel were made
>> available to the target so that out-of-tree/external kernel modules could be
>> built to match the running system -- as well as the ability to reconfigure and
>> rebuild the kernel itself.
>>
>> Bruce is on vacation this week and may not be around to respond, but adding
>> yet another package is not the right answer here.  Lets fix what may be
>> broken in what we have.
>>
>> --Mark
>>
>> > Juro
>> >
>> >
>> >
>> >> -----Original Message-----
>> >> From: Mark Hatle [mailto:mark.hatle@windriver.com]
>> >> Sent: Tuesday, August 4, 2015 9:20 AM
>> >> To: Bystricky, Juro; openembedded-core@lists.openembedded.org;
>> >> jurobystricky@hotmail.com
>> >> Cc: Purdie, Richard
>> >> Subject: Re: [OE-core] [PATCH 0/2] Support for VirtualBox guest
>> >> additions
>> >>
>> >> On 8/3/15 3:35 PM, Juro Bystricky wrote:
>> >>> In order to support VirtualBox guest additions, kernel headers need
>> >>> to be present in the VM. I am aware we already have two
>> >>> packages/recipes that are somewhat similar (kernel-devsrc.bb,
>> >>> linux-libc-headers), but none
>> >> of them is suitable for this purpose.
>> >>> Besides the kernel headers, some additional files (scripts,
>> >>> Makefiles, .config, etc) are also required.
>> >>
>> >> linux-libc-headers is only for building applications.  kernel-devsrc
>> >> is for building modules on the target.
>> >>
>> >> What do these specific modules need that are not present in kernel-
>> devsrc?
>> >> (I really don't want 'yet another' confusing package added to the
>> >> system.)
>> >>
>> >>> The new recipe "kernel-headers.bb" can in principle be used by other
>> >> images as well.
>> >>> It is not limited to the Build Appliance and hence is not a part of
>> >>> the Build Appliance recipe.
>> >>
>> >> I think kernel-headers is a bad name for a package.  It could be confusing.
>> >>
>> >> --Mark
>> >>
>> >>> Juro Bystricky (2):
>> >>>   kernel-headers: linux kernel headers
>> >>>   build-appliance-image: support for VirtualBox guest addtions
>> >>>
>> >>>  .../README_vbox_guest_additions.txt                | 78
>> >> ++++++++++++++++++++++
>> >>>  .../images/build-appliance-image_12.0.1.bb         |  4 +-
>> >>>  meta/recipes-kernel/linux/kernel-headers.bb        | 66
>> >> ++++++++++++++++++
>> >>>  3 files changed, 147 insertions(+), 1 deletion(-)  create mode
>> >>> 100644
>> >>> meta/recipes-core/images/build-appliance-
>> >> image/README_vbox_guest_addit
>> >>> ions.txt  create mode 100644
>> >>> meta/recipes-kernel/linux/kernel-headers.bb
>> >>>
>> >
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

