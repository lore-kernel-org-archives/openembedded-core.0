Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 32595760AA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Apr 2016 09:06:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u3596RKC009130
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 5 Apr 2016 02:06:27 -0700 (PDT)
Received: from [128.224.162.236] (128.224.162.236) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 5 Apr 2016 02:06:26 -0700
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <cover.1459677330.git.liezhi.yang@windriver.com>
	<637f6783157bb0e9449d153133485401bcf2dbb1.1459677330.git.liezhi.yang@windriver.com>
	<CADkTA4NVbCvZwHt62hZzrV+NLpq0qytN_duRv8EigM12mUJs7g@mail.gmail.com>
	<1459719999.7348.142.camel@linuxfoundation.org>
	<CADkTA4Pz5sHPmRMVmQQsoPoQH1tmPkK93QUhtA7LmzibH7-tjQ@mail.gmail.com>
	<57031A9C.3040000@windriver.com>
	<CADkTA4M=kwVZnHi-3EfdjkhV4rA6Ep+hWw3EpZrcfu3Q7pz85A@mail.gmail.com>
	<57032796.3020302@windriver.com>
	<CADkTA4PtLF1tYBdSQLuz5Z-zRtNX46NV2LVNJuJtAb2jStR8dw@mail.gmail.com>
	<57035E46.3090707@windriver.com>
	<CADkTA4Ojrn5DddPnAK2Ss6k0F2E+i5r0f68jN7F49WTAFa6pEg@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <57038010.8040501@windriver.com>
Date: Tue, 5 Apr 2016 17:06:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4Ojrn5DddPnAK2Ss6k0F2E+i5r0f68jN7F49WTAFa6pEg@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] linux-yocto 4.4: enable overlayfs by default
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
X-List-Received-Date: Tue, 05 Apr 2016 09:06:30 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 04/05/2016 04:33 PM, Bruce Ashfield wrote:
>
>
> On Tue, Apr 5, 2016 at 2:42 AM, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>
>
>     On 04/05/2016 02:33 PM, Bruce Ashfield wrote:
>
>
>
>         On Mon, Apr 4, 2016 at 10:48 PM, Robert Yang <liezhi.yang@windriver.com
>         <mailto:liezhi.yang@windriver.com>
>         <mailto:liezhi.yang@windriver.com <mailto:liezhi.yang@windriver.com>>>
>         wrote:
>
>
>
>              On 04/05/2016 10:31 AM, Bruce Ashfield wrote:
>
>
>
>                  On Mon, Apr 4, 2016 at 9:53 PM, Robert Yang
>         <liezhi.yang@windriver.com <mailto:liezhi.yang@windriver.com>
>                  <mailto:liezhi.yang@windriver.com
>         <mailto:liezhi.yang@windriver.com>>
>                  <mailto:liezhi.yang@windriver.com
>         <mailto:liezhi.yang@windriver.com> <mailto:liezhi.yang@windriver.com
>         <mailto:liezhi.yang@windriver.com>>>>
>                  wrote:
>
>
>                       Hi Bruce,
>
>                       How many union fs on Linux, please? AFAIK:
>                       * unionfs: not supported by kernel any more.
>                       * aufs
>                       * overlayfs
>
>                       If aufs and overlayfs are conflicted, how about:
>
>                       KERNEL_UNION_FS ?= "features/overlayfs/overlayfs.scc"
>
>                       KERNEL_EXTRA_FEATURES ?= "[snip] ${KERNEL_UNION_FS}"
>
>                       I think that we really need a way to make iso/hddimg work
>         by default
>                       to enhance the OOBE.
>
>
>                  That sort of mechanism can work, but not if it is enabled by
>         default.
>                  out of box
>                  experience
>                  is one thing, but there are plenty of boot and image types that
>         don't need a
>                  unionfs, and
>                  we can't force these as =y for those image types.
>
>                  If we make a modular config, and a built-in config, we could
>         pick the
>                  modular
>                  config by
>                  default, and then have the package list for the images that
>         need them,
>                  rdepend
>                  on the
>                  appropriate modules.
>
>
>              Sounds good, so how about:
>
>              1) Update kernel to make overlayfs as module rather than builtin
>
>
>         Having two fragments make sense. one for built in, and one that is modules.
>         Since these are
>         distinct use case both sets of configuration are reasonable.
>
>
>     How about this:
>
>     diff --git a/ktypes/preempt-rt/preempt-rt.cfg b/ktypes/preempt-rt/preempt-rt.cfg
>     index 4c62804..28ad8cf 100644
>     --- a/ktypes/preempt-rt/preempt-rt.cfg
>     +++ b/ktypes/preempt-rt/preempt-rt.cfg
>     @@ -1116,3 +1116,5 @@ CONFIG_CRYPTO_TEST=m
>       #
>       CONFIG_LIBCRC32C=m
>       CONFIG_ZLIB_DEFLATE=m
>     +
>     +CONFIG_OVERLAY_FS=m
>     diff --git a/ktypes/standard/standard.cfg b/ktypes/standard/standard.cfg
>     index b3dbde5..3dabf49 100644
>     --- a/ktypes/standard/standard.cfg
>     +++ b/ktypes/standard/standard.cfg
>     @@ -1108,3 +1108,5 @@ CONFIG_LIBCRC32C=m
>       CONFIG_ZLIB_DEFLATE=m
>
>       CONFIG_SHMEM=y
>     +
>     +CONFIG_OVERLAY_FS=m
>
>
> Nope. See my follow up to the linux-yocto patch .. I was more detailed in my
> follow up
> there.

I read that just now, if we don't enable the module in oe-core layer or
builtin it, I'm fine to leave the live image (iso, hddimg) broken by
default and document that if you need a read write live image and fix
the errors, you can enable it from KERNEL_FEATURES ?

>
>
>
>              2) let core-image-minimal-initramfs RDEPENEDS on the module.
>
>
>         I'd still prefer that this be set in a distro or optional layer. Since why
>
>
>     The live/iso/hddimg is supported by oe-core, all of them are in oe-core layer,
>     I'm afraid that we can't add it in an extra layer or bbappend.
>
>
> Why not ? There are just as many image types that don't need this support. Why
> should
> it be universally build and enabled for a feature that is only used by some boot
> types.
>
> You are missing the point, and there's no justification to globally enable it.
>
> What about flash boot, what about boot from specific MTD devices, etc, etc, should
> they all be enabled by default in the base configs .. just in case someone boots
> that
> way ? We'll end up with a giant kernel with everything enabled or as modules if we
> cover all the cases. These need to be specifically requested and triggered.
>
> Just because you are concerned with live iso boot, doesn't mean that others are,
> and that we should have the overhead everywhere.
>
>
>         should core image
>         minimal be the target for this ? There are any number of targets that
>         might be
>         used for
>         live boot.
>
>
>     All of them are in oe-core layer, core-image-minimal-initramfs.bb
>     <http://core-image-minimal-initramfs.bb> is the
>     default live image in oe-core, I think that add kerne-module-overlay to
>     its INSTALL is reasonable.
>
>
> But that shouldn't need overlayfs for all configs. I boot initramfs kernels all
> the time, I have no need
> for overlay filesystems on those boards.
>
> But yes, if you enable a module based overlayfs fragment, and then install the
> module via an install, it should be ok, since it can be overridden.

Did you mean it in oe-core or out of oe-core such as an external layer or
bbappend, please ?

>
> I hope you are seeing the point of not enabling kernel options "just in case",
> and why
> this sort of thing needs to be only built and installed when it is truly needed.

I'm sorry, but I don't think that this is a "just in case" issue, live image
is officially supported by oe-core, I think that we should release a workable
image to the user rather than a half-finished one, currently, for example,
the obvious errors when boot:

Populating dev cache
/etc/init.d/rc: /etc/rcS.d/S37populate-volatile.sh: line 1: can't create 
/etc/volatile.cache.build: Read-only file system
/etc/rcS.d/S36udev-cache: line 73: can't create /etc/udev-cache.tar.gz: 
Read-only file system
udev-cache: update failed!
/etc/init.d/rc: /etc/rcS.d/S37populate-volatile.sh: line 1: can't create 
/etc/volatile.cache.build: Read-only file system
rm: can't remove '/etc/udev/cache.data': Read-only file system
/etc/init.d/rc: /etc/rcS.d/S37populate-volatile.sh: line 1: can't create 
/etc/volatile.cache.build: Read-only file system
/etc/init.d/rc: /etc/rcS.d/S37populate-volatile.sh: line 1: can't create 
/etc/volatile.cache.build: Read-only file system
/etc/init.d/rc: /etc/rcS.d/S37populate-volatile.sh: line 1: can't create 
/etc/volatile.cache.build: Read-only file system
/etc/init.d/rc: /etc/rcS.d/S37populate-volatile.sh: line 1: can't create 
/etc/volatile.cache.build: Read-only file system
/etc/init.d/rc: /etc/rcS.d/S37populate-volatile.sh: line 1: can't create 
/etc/volatile.cache.build: Read-only file system
/etc/init.d/rc: /etc/rcS.d/S37populate-volatile.sh: line 1: can't create 
/etc/volatile.cache.build: Read-only file system
/etc/init.d/rc: /etc/rcS.d/S37populate-volatile.sh: line 1: can't create 
/etc/volatile.cache.build: Read-only file system
rm: can't remove '/tmp': Read-only file system
ln: /tmp/tmp: Read-only file system
/etc/init.d/rc: /etc/rcS.d/S37populate-volatile.sh: line 1: can't create 
/etc/volatile.cache.build: Read-only file system
/etc/init.d/rc: /etc/rcS.d/S37populate-volatile.sh: line 1: can't create 
/etc/volatile.cache.build: Read-only file system
/etc/init.d/rc: /etc/rcS.d/S37populate-volatile.sh: line 1: can't create 
/etc/volatile.cache.build: Read-only file system
ln: /etc/resolv.conf: Read-only file system
/etc/init.d/rc: /etc/rcS.d/S37populate-volatile.sh: line 1: can't create 
/etc/volatile.cache.build: Read-only file system
/etc/init.d/rc: /etc/rcS.d/S37populate-volatile.sh: line 1: can't create 
/etc/volatile.cache.build: Read-only file system

And it's readonly, the user can change nothing on the system when debug.

// Robert

>
> Bruce
>
>
>     If there are other layers which have their own live image, then they can add
>     it to their INSTALL.
>
>
>     // Robert
>
>
>         Bruce
>
>              // Robert
>
>
>                  Bruce
>
>
>                       // Robert
>
>                       On 04/04/2016 07:56 AM, Bruce Ashfield wrote:
>
>
>
>                           On Sun, Apr 3, 2016 at 5:46 PM, Richard Purdie
>                           <richard.purdie@linuxfoundation.org
>         <mailto:richard.purdie@linuxfoundation.org>
>                  <mailto:richard.purdie@linuxfoundation.org
>         <mailto:richard.purdie@linuxfoundation.org>>
>                           <mailto:richard.purdie@linuxfoundation.org
>         <mailto:richard.purdie@linuxfoundation.org>
>                  <mailto:richard.purdie@linuxfoundation.org
>         <mailto:richard.purdie@linuxfoundation.org>>>
>                           <mailto:richard.purdie@linuxfoundation.org
>         <mailto:richard.purdie@linuxfoundation.org>
>                  <mailto:richard.purdie@linuxfoundation.org
>         <mailto:richard.purdie@linuxfoundation.org>>
>                           <mailto:richard.purdie@linuxfoundation.org
>         <mailto:richard.purdie@linuxfoundation.org>
>                  <mailto:richard.purdie@linuxfoundation.org
>         <mailto:richard.purdie@linuxfoundation.org>>>>>
>                           wrote:
>
>                                On Sun, 2016-04-03 at 06:11 -0400, Bruce Ashfield
>         wrote:
>                                >
>                                >
>                                > On Sun, Apr 3, 2016 at 5:58 AM, Robert Yang <
>                                >liezhi.yang@windriver.com
>         <mailto:liezhi.yang@windriver.com>
>                  <mailto:liezhi.yang@windriver.com
>         <mailto:liezhi.yang@windriver.com>> <mailto:liezhi.yang@windriver.com
>         <mailto:liezhi.yang@windriver.com>
>                  <mailto:liezhi.yang@windriver.com
>         <mailto:liezhi.yang@windriver.com>>>
>                           <mailto:liezhi.yang@windriver.com
>         <mailto:liezhi.yang@windriver.com>
>                  <mailto:liezhi.yang@windriver.com
>         <mailto:liezhi.yang@windriver.com>> <mailto:liezhi.yang@windriver.com
>         <mailto:liezhi.yang@windriver.com>
>                  <mailto:liezhi.yang@windriver.com
>         <mailto:liezhi.yang@windriver.com>>>>>
>
>                           wrote:
>                                > > So that iso can work well, otherwise the iso is
>                  readonly and there
>                                > > would
>                                > > be errors. The other way is aufs, but
>         overlayfs is
>                  more pupolar and
>                                > > had
>                                > > been merged by kernel mainline, we need make
>         iso work
>                  well by
>                                > > default.
>                                > Nope. As I mentioned before, this can't be a
>         always on
>                  default. It
>                                > will conflict
>                                > with other unionFS use cases.
>                                >
>                                > If you want overlayfs enabled, it needs to be
>         triggered
>                  from a
>                                > specific image
>                                > or distro feature.
>
>                                We can't change the kernel config from an image so it
>                  would have to be
>                                a distro setting. Is there a problem with
>         enabling both as
>                  modules btw?
>                                I assume they can coexist?
>
>
>                           I've always found it limiting that we can't trigger kernel
>                  features based on
>                           what an image'
>                           type actually needs, but I understand why/how it works
>         like this.
>
>                           If it can't be triggered by an image setting, then
>         just keeping
>                  a layer
>                           that is
>                           added
>                           to the build, that has a bbappend with the appropriate
>                  KERNEL_FEATURES would
>                           also work, and is the approach that I've also taken.
>
>                           Not that the existing configs are great in this
>         respect (they
>                  need a lot of
>                           streamlining),
>                           but building modules 'just in case' eventually leads to
>                  allmodconfig :)
>
>                           I'd imagine they could co-exist, but it isn't
>         something I've tried.
>
>                           Bruce
>
>
>                                Cheers,
>
>                                Richard
>
>
>
>
>                           --
>                           "Thou shalt not follow the NULL pointer, for chaos and
>         madness
>                  await
>                           thee at its
>                           end"
>
>
>
>
>                  --
>                  "Thou shalt not follow the NULL pointer, for chaos and madness
>         await
>                  thee at its
>                  end"
>
>
>
>
>         --
>         "Thou shalt not follow the NULL pointer, for chaos and madness await
>         thee at its
>         end"
>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee at its
> end"

