Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ob0-f196.google.com (mail-ob0-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 15E697716D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Apr 2016 14:59:58 +0000 (UTC)
Received: by mail-ob0-f196.google.com with SMTP id do7so1195892obb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Apr 2016 07:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=RQb12kMNALK+qBCN4NcDfy5Hu2ddWftwlrSARR0ZRn4=;
	b=UW/YqiZO4uaQfsgxIexIvoMAmDt9LLisYED3zU1ouUAP31RHS+4s8GR4Z9jjwbwXi3
	sWVO6TfNe67sFl/75NYxsx4X1gr1UojjtfjzWFSVT7U2c0PbPkpfDPRvQm0badb1NbBf
	Ei6gJ2t7n7OU5Ix9bkPDKCUxXqv+SPyH25WGMVPxbfnxdKdv79RDZOhnUwSu4qzSCfUL
	RwJGeG06N2G2EnfQ9B46oihJIYfKwLqhhOufWyjs51j4uclG0TQ/77Nyxhhx6f/Dcawc
	REe7mT/85t9tM7ipHK+Vk+/a/SBxZ2K86lhSn2RgNezW8AbTHk2dTnUKfyUAkoRlkCMG
	FKQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=RQb12kMNALK+qBCN4NcDfy5Hu2ddWftwlrSARR0ZRn4=;
	b=NaY41BiqCBXBy/UqLB663VWkVNWiUPCp3/yS+Bw5l+Zarc4oX67+WZnV1+YA6WaDyd
	uOZ6UTA8EMOROQcAMXUBYMlFlhSFEPL1ZdY2ZE4D2QyoL/NlA/kCtSDJYlh0/7pechX7
	QkOn//pvlNtJPPbw5UB28mqtTCmAEn4VBnD+VsClOksStWscnbP0jwZqt0c3SIh6FK9A
	UuX4/ZcJGH+BWL5+kHWzIld5gcsorSp8ZUAQr0WS/d32by1g08cdg0k9+62OeunS0B2z
	VHAsOtv15+n4u6OTTcb7LZhjQErfUYqS/vcmNu/U48z0yPgZJqOyJ0+C2U/Na1CnBGvy
	QoMA==
X-Gm-Message-State: AD7BkJIw7znW9TzynBmP99pwvA+3NcVqex///b/uTPjkyxfa3EDImqDwgaEwaEJ6ReayKHsV9a9fuw5iUdkm7w==
MIME-Version: 1.0
X-Received: by 10.182.22.137 with SMTP id d9mr463015obf.83.1459868399037; Tue,
	05 Apr 2016 07:59:59 -0700 (PDT)
Received: by 10.157.5.101 with HTTP; Tue, 5 Apr 2016 07:59:58 -0700 (PDT)
In-Reply-To: <57038010.8040501@windriver.com>
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
	<57038010.8040501@windriver.com>
Date: Tue, 5 Apr 2016 10:59:58 -0400
Message-ID: <CADkTA4PV5LHpsxZNVd+xgc6a_aEcQnH1Tjh222Ego5M-ZhbUxA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
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
X-List-Received-Date: Tue, 05 Apr 2016 15:00:01 -0000
Content-Type: multipart/alternative; boundary=001a11c2e55857f5d9052fbe19bd

--001a11c2e55857f5d9052fbe19bd
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 5, 2016 at 5:06 AM, Robert Yang <liezhi.yang@windriver.com>
wrote:

>
>
> On 04/05/2016 04:33 PM, Bruce Ashfield wrote:
>
>>
>>
>> On Tue, Apr 5, 2016 at 2:42 AM, Robert Yang <liezhi.yang@windriver.com
>> <mailto:liezhi.yang@windriver.com>> wrote:
>>
>>
>>
>>     On 04/05/2016 02:33 PM, Bruce Ashfield wrote:
>>
>>
>>
>>         On Mon, Apr 4, 2016 at 10:48 PM, Robert Yang <
>> liezhi.yang@windriver.com
>>         <mailto:liezhi.yang@windriver.com>
>>         <mailto:liezhi.yang@windriver.com <mailto:
>> liezhi.yang@windriver.com>>>
>>         wrote:
>>
>>
>>
>>              On 04/05/2016 10:31 AM, Bruce Ashfield wrote:
>>
>>
>>
>>                  On Mon, Apr 4, 2016 at 9:53 PM, Robert Yang
>>         <liezhi.yang@windriver.com <mailto:liezhi.yang@windriver.com>
>>                  <mailto:liezhi.yang@windriver.com
>>         <mailto:liezhi.yang@windriver.com>>
>>                  <mailto:liezhi.yang@windriver.com
>>         <mailto:liezhi.yang@windriver.com> <mailto:
>> liezhi.yang@windriver.com
>>         <mailto:liezhi.yang@windriver.com>>>>
>>                  wrote:
>>
>>
>>                       Hi Bruce,
>>
>>                       How many union fs on Linux, please? AFAIK:
>>                       * unionfs: not supported by kernel any more.
>>                       * aufs
>>                       * overlayfs
>>
>>                       If aufs and overlayfs are conflicted, how about:
>>
>>                       KERNEL_UNION_FS ?=
>> "features/overlayfs/overlayfs.scc"
>>
>>                       KERNEL_EXTRA_FEATURES ?= "[snip] ${KERNEL_UNION_FS}"
>>
>>                       I think that we really need a way to make
>> iso/hddimg work
>>         by default
>>                       to enhance the OOBE.
>>
>>
>>                  That sort of mechanism can work, but not if it is
>> enabled by
>>         default.
>>                  out of box
>>                  experience
>>                  is one thing, but there are plenty of boot and image
>> types that
>>         don't need a
>>                  unionfs, and
>>                  we can't force these as =y for those image types.
>>
>>                  If we make a modular config, and a built-in config, we
>> could
>>         pick the
>>                  modular
>>                  config by
>>                  default, and then have the package list for the images
>> that
>>         need them,
>>                  rdepend
>>                  on the
>>                  appropriate modules.
>>
>>
>>              Sounds good, so how about:
>>
>>              1) Update kernel to make overlayfs as module rather than
>> builtin
>>
>>
>>         Having two fragments make sense. one for built in, and one that
>> is modules.
>>         Since these are
>>         distinct use case both sets of configuration are reasonable.
>>
>>
>>     How about this:
>>
>>     diff --git a/ktypes/preempt-rt/preempt-rt.cfg
>> b/ktypes/preempt-rt/preempt-rt.cfg
>>     index 4c62804..28ad8cf 100644
>>     --- a/ktypes/preempt-rt/preempt-rt.cfg
>>     +++ b/ktypes/preempt-rt/preempt-rt.cfg
>>     @@ -1116,3 +1116,5 @@ CONFIG_CRYPTO_TEST=m
>>       #
>>       CONFIG_LIBCRC32C=m
>>       CONFIG_ZLIB_DEFLATE=m
>>     +
>>     +CONFIG_OVERLAY_FS=m
>>     diff --git a/ktypes/standard/standard.cfg
>> b/ktypes/standard/standard.cfg
>>     index b3dbde5..3dabf49 100644
>>     --- a/ktypes/standard/standard.cfg
>>     +++ b/ktypes/standard/standard.cfg
>>     @@ -1108,3 +1108,5 @@ CONFIG_LIBCRC32C=m
>>       CONFIG_ZLIB_DEFLATE=m
>>
>>       CONFIG_SHMEM=y
>>     +
>>     +CONFIG_OVERLAY_FS=m
>>
>>
>> Nope. See my follow up to the linux-yocto patch .. I was more detailed in
>> my
>> follow up
>> there.
>>
>
> I read that just now, if we don't enable the module in oe-core layer or
> builtin it, I'm fine to leave the live image (iso, hddimg) broken by
> default and document that if you need a read write live image and fix
> the errors, you can enable it from KERNEL_FEATURES ?
>

It would still be nice to do that enablement without needing to rebuild the
kernel completely.
Which is what we'll have if we only have a built-in fragment for overlayfs.

I was saying in my reviews, that having a module config fragment, and
enabling it via a
KERNEL_FEATURES in the main recipes would be ok, as long as that kernel
feature
variable is easy to override and disable it. That gets them built, and
available as packages
for image that want them.

I probably wasn't clear enough on that front, sorry about that!


>
>
>>
>>
>>              2) let core-image-minimal-initramfs RDEPENEDS on the module.
>>
>>
>>         I'd still prefer that this be set in a distro or optional layer.
>> Since why
>>
>>
>>     The live/iso/hddimg is supported by oe-core, all of them are in
>> oe-core layer,
>>     I'm afraid that we can't add it in an extra layer or bbappend.
>>
>>
>> Why not ? There are just as many image types that don't need this
>> support. Why
>> should
>> it be universally build and enabled for a feature that is only used by
>> some boot
>> types.
>>
>> You are missing the point, and there's no justification to globally
>> enable it.
>>
>> What about flash boot, what about boot from specific MTD devices, etc,
>> etc, should
>> they all be enabled by default in the base configs .. just in case
>> someone boots
>> that
>> way ? We'll end up with a giant kernel with everything enabled or as
>> modules if we
>> cover all the cases. These need to be specifically requested and
>> triggered.
>>
>> Just because you are concerned with live iso boot, doesn't mean that
>> others are,
>> and that we should have the overhead everywhere.
>>
>>
>>         should core image
>>         minimal be the target for this ? There are any number of targets
>> that
>>         might be
>>         used for
>>         live boot.
>>
>>
>>     All of them are in oe-core layer, core-image-minimal-initramfs.bb
>>     <http://core-image-minimal-initramfs.bb> is the
>>     default live image in oe-core, I think that add kerne-module-overlay
>> to
>>     its INSTALL is reasonable.
>>
>>
>> But that shouldn't need overlayfs for all configs. I boot initramfs
>> kernels all
>> the time, I have no need
>> for overlay filesystems on those boards.
>>
>> But yes, if you enable a module based overlayfs fragment, and then
>> install the
>> module via an install, it should be ok, since it can be overridden.
>>
>
> Did you mean it in oe-core or out of oe-core such as an external layer or
> bbappend, please ?
>

In a perfect world .. an external layer would be ideal, but we don't have
great
selection of standard options for that (to use as a reference for the core
image
type(s)).  The yocto-bsps layer is one option .. but I don't think we want
to
have this span multiple layers.

What I was saying above means that:

- you'd have a fragment that enabled the overlayfs modules
- you'd have then injected into the kernel config via a variable, that is
then added to KERNEL_FEATURES.
  That variable should be ?= so someone can override it if they see fit.
- your image types that need live boot, could generate the right RDEPENDS
on the kernel package. That
  could be in their image package lists, via a bbclass that generates the
dependency when included, or
  something else that I'm not thinking about.

Am I missing something, or are you not using image-live.bbclass for this ?
or is there some other
way that this is being enabled .. and that I'm missing ?


>
>
>> I hope you are seeing the point of not enabling kernel options "just in
>> case",
>> and why
>> this sort of thing needs to be only built and installed when it is truly
>> needed.
>>
>
> I'm sorry, but I don't think that this is a "just in case" issue, live
> image
> is officially supported by oe-core, I think that we should release a
> workable
> image to the user rather than a half-finished one, currently, for example,
> the obvious errors when boot:
>


There are plenty of boot methods that are supported by the core layers,
different
bootloaders, different devices, different fileystems (think btrfs, LVM,
etc, etc). While
a simpler variant, this is in the same theme.


>
> Populating dev cache
> /etc/init.d/rc: /etc/rcS.d/S37populate-volatile.sh: line 1: can't create
> /etc/volatile.cache.build: Read-only file system
> /etc/rcS.d/S36udev-cache: line 73: can't create /etc/udev-cache.tar.gz:
> Read-only file system
> udev-cache: update failed!
> /etc/init.d/rc: /etc/rcS.d/S37populate-volatile.sh: line 1: can't create
> /etc/volatile.cache.build: Read-only file system
> rm: can't remove '/etc/udev/cache.data': Read-only file system
> /etc/init.d/rc: /etc/rcS.d/S37populate-volatile.sh: line 1: can't create
> /etc/volatile.cache.build: Read-only file system
> /etc/init.d/rc: /etc/rcS.d/S37populate-volatile.sh: line 1: can't create
> /etc/volatile.cache.build: Read-only file system
> /etc/init.d/rc: /etc/rcS.d/S37populate-volatile.sh: line 1: can't create
> /etc/volatile.cache.build: Read-only file system
> /etc/init.d/rc: /etc/rcS.d/S37populate-volatile.sh: line 1: can't create
> /etc/volatile.cache.build: Read-only file system
> /etc/init.d/rc: /etc/rcS.d/S37populate-volatile.sh: line 1: can't create
> /etc/volatile.cache.build: Read-only file system
> /etc/init.d/rc: /etc/rcS.d/S37populate-volatile.sh: line 1: can't create
> /etc/volatile.cache.build: Read-only file system
> /etc/init.d/rc: /etc/rcS.d/S37populate-volatile.sh: line 1: can't create
> /etc/volatile.cache.build: Read-only file system
> rm: can't remove '/tmp': Read-only file system
> ln: /tmp/tmp: Read-only file system
> /etc/init.d/rc: /etc/rcS.d/S37populate-volatile.sh: line 1: can't create
> /etc/volatile.cache.build: Read-only file system
> /etc/init.d/rc: /etc/rcS.d/S37populate-volatile.sh: line 1: can't create
> /etc/volatile.cache.build: Read-only file system
> /etc/init.d/rc: /etc/rcS.d/S37populate-volatile.sh: line 1: can't create
> /etc/volatile.cache.build: Read-only file system
> ln: /etc/resolv.conf: Read-only file system
> /etc/init.d/rc: /etc/rcS.d/S37populate-volatile.sh: line 1: can't create
> /etc/volatile.cache.build: Read-only file system
> /etc/init.d/rc: /etc/rcS.d/S37populate-volatile.sh: line 1: can't create
> /etc/volatile.cache.build: Read-only file system
>
> And it's readonly, the user can change nothing on the system when debug.
>

Yes, we use union filesystems to do read-only boots, but there other ways
to do it (and we have
in the past supported live, read only boots .. without a unionfs at all).

Through this whole exercise, I'm just trying to prevent focus on a single,
current, solution and make
sure that it is flexible for when it inevitably changes in the future, and
to not have a trend of needing
to build in configs like this to support a set of different boot methods.
Since we can no more control
those methods, than we can control the use of a specific kernel, or kernel
config.

If you want, we can work this out via some IRC discussions, etc, to save
everyone getting spammed :)

Cheers,

Bruce


>
> // Robert
>
>
>
>> Bruce
>>
>>
>>     If there are other layers which have their own live image, then they
>> can add
>>     it to their INSTALL.
>>
>>
>>     // Robert
>>
>>
>>         Bruce
>>
>>              // Robert
>>
>>
>>                  Bruce
>>
>>
>>                       // Robert
>>
>>                       On 04/04/2016 07:56 AM, Bruce Ashfield wrote:
>>
>>
>>
>>                           On Sun, Apr 3, 2016 at 5:46 PM, Richard Purdie
>>                           <richard.purdie@linuxfoundation.org
>>         <mailto:richard.purdie@linuxfoundation.org>
>>                  <mailto:richard.purdie@linuxfoundation.org
>>         <mailto:richard.purdie@linuxfoundation.org>>
>>                           <mailto:richard.purdie@linuxfoundation.org
>>         <mailto:richard.purdie@linuxfoundation.org>
>>                  <mailto:richard.purdie@linuxfoundation.org
>>         <mailto:richard.purdie@linuxfoundation.org>>>
>>                           <mailto:richard.purdie@linuxfoundation.org
>>         <mailto:richard.purdie@linuxfoundation.org>
>>                  <mailto:richard.purdie@linuxfoundation.org
>>         <mailto:richard.purdie@linuxfoundation.org>>
>>                           <mailto:richard.purdie@linuxfoundation.org
>>         <mailto:richard.purdie@linuxfoundation.org>
>>                  <mailto:richard.purdie@linuxfoundation.org
>>         <mailto:richard.purdie@linuxfoundation.org>>>>>
>>                           wrote:
>>
>>                                On Sun, 2016-04-03 at 06:11 -0400, Bruce
>> Ashfield
>>         wrote:
>>                                >
>>                                >
>>                                > On Sun, Apr 3, 2016 at 5:58 AM, Robert
>> Yang <
>>                                >liezhi.yang@windriver.com
>>         <mailto:liezhi.yang@windriver.com>
>>                  <mailto:liezhi.yang@windriver.com
>>         <mailto:liezhi.yang@windriver.com>> <mailto:
>> liezhi.yang@windriver.com
>>         <mailto:liezhi.yang@windriver.com>
>>                  <mailto:liezhi.yang@windriver.com
>>         <mailto:liezhi.yang@windriver.com>>>
>>                           <mailto:liezhi.yang@windriver.com
>>         <mailto:liezhi.yang@windriver.com>
>>                  <mailto:liezhi.yang@windriver.com
>>         <mailto:liezhi.yang@windriver.com>> <mailto:
>> liezhi.yang@windriver.com
>>         <mailto:liezhi.yang@windriver.com>
>>                  <mailto:liezhi.yang@windriver.com
>>         <mailto:liezhi.yang@windriver.com>>>>>
>>
>>                           wrote:
>>                                > > So that iso can work well, otherwise
>> the iso is
>>                  readonly and there
>>                                > > would
>>                                > > be errors. The other way is aufs, but
>>         overlayfs is
>>                  more pupolar and
>>                                > > had
>>                                > > been merged by kernel mainline, we
>> need make
>>         iso work
>>                  well by
>>                                > > default.
>>                                > Nope. As I mentioned before, this can't
>> be a
>>         always on
>>                  default. It
>>                                > will conflict
>>                                > with other unionFS use cases.
>>                                >
>>                                > If you want overlayfs enabled, it needs
>> to be
>>         triggered
>>                  from a
>>                                > specific image
>>                                > or distro feature.
>>
>>                                We can't change the kernel config from an
>> image so it
>>                  would have to be
>>                                a distro setting. Is there a problem with
>>         enabling both as
>>                  modules btw?
>>                                I assume they can coexist?
>>
>>
>>                           I've always found it limiting that we can't
>> trigger kernel
>>                  features based on
>>                           what an image'
>>                           type actually needs, but I understand why/how
>> it works
>>         like this.
>>
>>                           If it can't be triggered by an image setting,
>> then
>>         just keeping
>>                  a layer
>>                           that is
>>                           added
>>                           to the build, that has a bbappend with the
>> appropriate
>>                  KERNEL_FEATURES would
>>                           also work, and is the approach that I've also
>> taken.
>>
>>                           Not that the existing configs are great in this
>>         respect (they
>>                  need a lot of
>>                           streamlining),
>>                           but building modules 'just in case' eventually
>> leads to
>>                  allmodconfig :)
>>
>>                           I'd imagine they could co-exist, but it isn't
>>         something I've tried.
>>
>>                           Bruce
>>
>>
>>                                Cheers,
>>
>>                                Richard
>>
>>
>>
>>
>>                           --
>>                           "Thou shalt not follow the NULL pointer, for
>> chaos and
>>         madness
>>                  await
>>                           thee at its
>>                           end"
>>
>>
>>
>>
>>                  --
>>                  "Thou shalt not follow the NULL pointer, for chaos and
>> madness
>>         await
>>                  thee at its
>>                  end"
>>
>>
>>
>>
>>         --
>>         "Thou shalt not follow the NULL pointer, for chaos and madness
>> await
>>         thee at its
>>         end"
>>
>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
>> at its
>> end"
>>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a11c2e55857f5d9052fbe19bd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Apr 5, 2016 at 5:06 AM, Robert Yang <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windr=
iver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span><b=
r>
<br>
On 04/05/2016 04:33 PM, Bruce Ashfield wrote:<br>
</span><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><span>
<br>
<br>
On Tue, Apr 5, 2016 at 2:42 AM, Robert Yang &lt;<a href=3D"mailto:liezhi.ya=
ng@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</a><br></span=
><span>
&lt;mailto:<a href=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">l=
iezhi.yang@windriver.com</a>&gt;&gt; wrote:<br>
<br>
<br>
<br>
=C2=A0 =C2=A0 On 04/05/2016 02:33 PM, Bruce Ashfield wrote:<br>
<br>
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 On Mon, Apr 4, 2016 at 10:48 PM, Robert Yang &l=
t;<a href=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yan=
g@windriver.com</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:liezhi.yang@windri=
ver.com" target=3D"_blank">liezhi.yang@windriver.com</a>&gt;<br></span><spa=
n>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:liezhi.yang@windri=
ver.com" target=3D"_blank">liezhi.yang@windriver.com</a> &lt;mailto:<a href=
=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriv=
er.com</a>&gt;&gt;&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 wrote:<br>
<br>
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0On 04/05/2016 10:31 AM, Bru=
ce Ashfield wrote:<br>
<br>
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0On Mon, Apr 4=
, 2016 at 9:53 PM, Robert Yang<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailto:liezhi.yang@windriver.com=
" target=3D"_blank">liezhi.yang@windriver.com</a> &lt;mailto:<a href=3D"mai=
lto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com<=
/a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a=
 href=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@wi=
ndriver.com</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:liezhi.yang@windri=
ver.com" target=3D"_blank">liezhi.yang@windriver.com</a>&gt;&gt;<br></span>=
<span>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a=
 href=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@wi=
ndriver.com</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:liezhi.yang@windri=
ver.com" target=3D"_blank">liezhi.yang@windriver.com</a>&gt; &lt;mailto:<a =
href=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@win=
driver.com</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:liezhi.yang@windri=
ver.com" target=3D"_blank">liezhi.yang@windriver.com</a>&gt;&gt;&gt;&gt;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wrote:<br>
<br>
<br></span><div><div>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 Hi Bruce,<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 How many union fs on Linux, please? AFAIK:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 * unionfs: not supported by kernel any more.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 * aufs<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 * overlayfs<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 If aufs and overlayfs are conflicted, how about:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 KERNEL_UNION_FS ?=3D &quot;features/overlayfs/overlayfs.scc&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 KERNEL_EXTRA_FEATURES ?=3D &quot;[snip] ${KERNEL_UNION_FS}&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 I think that we really need a way to make iso/hddimg work<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 by default<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 to enhance the OOBE.<br>
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0That sort of =
mechanism can work, but not if it is enabled by<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 default.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0out of box<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0experience<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0is one thing,=
 but there are plenty of boot and image types that<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 don&#39;t need a<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unionfs, and<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0we can&#39;t =
force these as =3Dy for those image types.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0If we make a =
modular config, and a built-in config, we could<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pick the<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0modular<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0config by<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default, and =
then have the package list for the images that<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 need them,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rdepend<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0on the<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0appropriate m=
odules.<br>
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Sounds good, so how about:<=
br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01) Update kernel to make ov=
erlayfs as module rather than builtin<br>
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Having two fragments make sense. one for built =
in, and one that is modules.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Since these are<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 distinct use case both sets of configuration ar=
e reasonable.<br>
<br>
<br>
=C2=A0 =C2=A0 How about this:<br>
<br>
=C2=A0 =C2=A0 diff --git a/ktypes/preempt-rt/preempt-rt.cfg b/ktypes/preemp=
t-rt/preempt-rt.cfg<br>
=C2=A0 =C2=A0 index 4c62804..28ad8cf 100644<br>
=C2=A0 =C2=A0 --- a/ktypes/preempt-rt/preempt-rt.cfg<br>
=C2=A0 =C2=A0 +++ b/ktypes/preempt-rt/preempt-rt.cfg<br>
=C2=A0 =C2=A0 @@ -1116,3 +1116,5 @@ CONFIG_CRYPTO_TEST=3Dm<br>
=C2=A0 =C2=A0 =C2=A0 #<br>
=C2=A0 =C2=A0 =C2=A0 CONFIG_LIBCRC32C=3Dm<br>
=C2=A0 =C2=A0 =C2=A0 CONFIG_ZLIB_DEFLATE=3Dm<br>
=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 +CONFIG_OVERLAY_FS=3Dm<br>
=C2=A0 =C2=A0 diff --git a/ktypes/standard/standard.cfg b/ktypes/standard/s=
tandard.cfg<br>
=C2=A0 =C2=A0 index b3dbde5..3dabf49 100644<br>
=C2=A0 =C2=A0 --- a/ktypes/standard/standard.cfg<br>
=C2=A0 =C2=A0 +++ b/ktypes/standard/standard.cfg<br>
=C2=A0 =C2=A0 @@ -1108,3 +1108,5 @@ CONFIG_LIBCRC32C=3Dm<br>
=C2=A0 =C2=A0 =C2=A0 CONFIG_ZLIB_DEFLATE=3Dm<br>
<br>
=C2=A0 =C2=A0 =C2=A0 CONFIG_SHMEM=3Dy<br>
=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 +CONFIG_OVERLAY_FS=3Dm<br>
<br>
<br>
Nope. See my follow up to the linux-yocto patch .. I was more detailed in m=
y<br>
follow up<br>
there.<br>
</div></div></blockquote>
<br>
I read that just now, if we don&#39;t enable the module in oe-core layer or=
<br>
builtin it, I&#39;m fine to leave the live image (iso, hddimg) broken by<br=
>
default and document that if you need a read write live image and fix<br>
the errors, you can enable it from KERNEL_FEATURES ?<br></blockquote><div><=
br></div><div>It would still be nice to do that enablement without needing =
to rebuild the kernel completely.<br></div><div>Which is what we&#39;ll hav=
e if we only have a built-in fragment for overlayfs. <br><br>I was saying i=
n my reviews, that having a module config fragment, and enabling it via a<b=
r></div><div>KERNEL_FEATURES in the main recipes would be ok, as long as th=
at kernel feature<br></div><div>variable is easy to override and disable it=
. That gets them built, and available as packages<br></div><div>for image t=
hat want them.<br></div><div><br></div><div>I probably wasn&#39;t clear eno=
ugh on that front, sorry about that!<br></div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><span>
<br>
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02) let core-image-minimal-i=
nitramfs RDEPENEDS on the module.<br>
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 I&#39;d still prefer that this be set in a dist=
ro or optional layer. Since why<br>
<br>
<br>
=C2=A0 =C2=A0 The live/iso/hddimg is supported by oe-core, all of them are =
in oe-core layer,<br>
=C2=A0 =C2=A0 I&#39;m afraid that we can&#39;t add it in an extra layer or =
bbappend.<br>
<br>
<br>
Why not ? There are just as many image types that don&#39;t need this suppo=
rt. Why<br>
should<br>
it be universally build and enabled for a feature that is only used by some=
 boot<br>
types.<br>
<br>
You are missing the point, and there&#39;s no justification to globally ena=
ble it.<br>
<br>
What about flash boot, what about boot from specific MTD devices, etc, etc,=
 should<br>
they all be enabled by default in the base configs .. just in case someone =
boots<br>
that<br>
way ? We&#39;ll end up with a giant kernel with everything enabled or as mo=
dules if we<br>
cover all the cases. These need to be specifically requested and triggered.=
<br>
<br>
Just because you are concerned with live iso boot, doesn&#39;t mean that ot=
hers are,<br>
and that we should have the overhead everywhere.<br>
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 should core image<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 minimal be the target for this ? There are any =
number of targets that<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 might be<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 used for<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 live boot.<br>
<br>
<br>
=C2=A0 =C2=A0 All of them are in oe-core layer, <a href=3D"http://core-imag=
e-minimal-initramfs.bb" rel=3D"noreferrer" target=3D"_blank">core-image-min=
imal-initramfs.bb</a><br></span>
=C2=A0 =C2=A0 &lt;<a href=3D"http://core-image-minimal-initramfs.bb" rel=3D=
"noreferrer" target=3D"_blank">http://core-image-minimal-initramfs.bb</a>&g=
t; is the<span><br>
=C2=A0 =C2=A0 default live image in oe-core, I think that add kerne-module-=
overlay to<br>
=C2=A0 =C2=A0 its INSTALL is reasonable.<br>
<br>
<br>
But that shouldn&#39;t need overlayfs for all configs. I boot initramfs ker=
nels all<br>
the time, I have no need<br>
for overlay filesystems on those boards.<br>
<br>
But yes, if you enable a module based overlayfs fragment, and then install =
the<br>
module via an install, it should be ok, since it can be overridden.<br>
</span></blockquote>
<br>
Did you mean it in oe-core or out of oe-core such as an external layer or<b=
r>
bbappend, please ?<span><br></span></blockquote><div><br></div><div>In a pe=
rfect world .. an external layer would be ideal, but we don&#39;t have grea=
t<br></div><div>selection of standard options for that (to use as a referen=
ce for the core image<br></div><div>type(s)).=C2=A0 The yocto-bsps layer is=
 one option .. but I don&#39;t think we want to<br></div><div>have this spa=
n multiple layers. <br><br></div><div>What I was saying above means that:<b=
r><br></div><div>- you&#39;d have a fragment that enabled the overlayfs mod=
ules<br></div><div>- you&#39;d have then injected into the kernel config vi=
a a variable, that is then added to KERNEL_FEATURES.<br>=C2=A0 That variabl=
e should be ?=3D so someone can override it if they see fit.<br></div><div>=
- your image types that need live boot, could generate the right RDEPENDS o=
n the kernel package. That<br></div><div>=C2=A0 could be in their image pac=
kage lists, via a bbclass that generates the dependency when included, or<b=
r></div><div>=C2=A0 something else that I&#39;m not thinking about.<br><br>=
</div><div>Am I missing something, or are you not using image-live.bbclass =
for this ? or is there some other<br></div><div>way that this is being enab=
led .. and that I&#39;m missing ?<br></div><div>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex"><span>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
I hope you are seeing the point of not enabling kernel options &quot;just i=
n case&quot;,<br>
and why<br>
this sort of thing needs to be only built and installed when it is truly ne=
eded.<br>
</blockquote>
<br></span>
I&#39;m sorry, but I don&#39;t think that this is a &quot;just in case&quot=
; issue, live image<br>
is officially supported by oe-core, I think that we should release a workab=
le<br>
image to the user rather than a half-finished one, currently, for example,<=
br>
the obvious errors when boot:<br></blockquote><div><br><br></div><div>There=
 are plenty of boot methods that are supported by the core layers, differen=
t<br></div><div>bootloaders, different devices, different fileystems (think=
 btrfs, LVM, etc, etc). While<br></div><div>a simpler variant, this is in t=
he same theme.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Populating dev cache<br>
/etc/init.d/rc: /etc/rcS.d/S37populate-volatile.sh: line 1: can&#39;t creat=
e /etc/volatile.cache.build: Read-only file system<br>
/etc/rcS.d/S36udev-cache: line 73: can&#39;t create /etc/udev-cache.tar.gz:=
 Read-only file system<br>
udev-cache: update failed!<br>
/etc/init.d/rc: /etc/rcS.d/S37populate-volatile.sh: line 1: can&#39;t creat=
e /etc/volatile.cache.build: Read-only file system<br>
rm: can&#39;t remove &#39;/etc/udev/cache.data&#39;: Read-only file system<=
br>
/etc/init.d/rc: /etc/rcS.d/S37populate-volatile.sh: line 1: can&#39;t creat=
e /etc/volatile.cache.build: Read-only file system<br>
/etc/init.d/rc: /etc/rcS.d/S37populate-volatile.sh: line 1: can&#39;t creat=
e /etc/volatile.cache.build: Read-only file system<br>
/etc/init.d/rc: /etc/rcS.d/S37populate-volatile.sh: line 1: can&#39;t creat=
e /etc/volatile.cache.build: Read-only file system<br>
/etc/init.d/rc: /etc/rcS.d/S37populate-volatile.sh: line 1: can&#39;t creat=
e /etc/volatile.cache.build: Read-only file system<br>
/etc/init.d/rc: /etc/rcS.d/S37populate-volatile.sh: line 1: can&#39;t creat=
e /etc/volatile.cache.build: Read-only file system<br>
/etc/init.d/rc: /etc/rcS.d/S37populate-volatile.sh: line 1: can&#39;t creat=
e /etc/volatile.cache.build: Read-only file system<br>
/etc/init.d/rc: /etc/rcS.d/S37populate-volatile.sh: line 1: can&#39;t creat=
e /etc/volatile.cache.build: Read-only file system<br>
rm: can&#39;t remove &#39;/tmp&#39;: Read-only file system<br>
ln: /tmp/tmp: Read-only file system<br>
/etc/init.d/rc: /etc/rcS.d/S37populate-volatile.sh: line 1: can&#39;t creat=
e /etc/volatile.cache.build: Read-only file system<br>
/etc/init.d/rc: /etc/rcS.d/S37populate-volatile.sh: line 1: can&#39;t creat=
e /etc/volatile.cache.build: Read-only file system<br>
/etc/init.d/rc: /etc/rcS.d/S37populate-volatile.sh: line 1: can&#39;t creat=
e /etc/volatile.cache.build: Read-only file system<br>
ln: /etc/resolv.conf: Read-only file system<br>
/etc/init.d/rc: /etc/rcS.d/S37populate-volatile.sh: line 1: can&#39;t creat=
e /etc/volatile.cache.build: Read-only file system<br>
/etc/init.d/rc: /etc/rcS.d/S37populate-volatile.sh: line 1: can&#39;t creat=
e /etc/volatile.cache.build: Read-only file system<br>
<br>
And it&#39;s readonly, the user can change nothing on the system when debug=
.<span><font color=3D"#888888"><br></font></span></blockquote><div><br></di=
v><div>Yes, we use union filesystems to do read-only boots, but there other=
 ways to do it (and we have<br></div><div>in the past supported live, read =
only boots .. without a unionfs at all).<br><br></div><div>Through this who=
le exercise, I&#39;m just trying to prevent focus on a single, current, sol=
ution and make<br></div><div>sure that it is flexible for when it inevitabl=
y changes in the future, and to not have a trend of needing<br></div><div>t=
o build in configs like this to support a set of different boot methods. Si=
nce we can no more control<br></div><div>those methods, than we can control=
 the use of a specific kernel, or kernel config.<br></div><div><br></div><d=
iv>If you want, we can work this out via some IRC discussions, etc, to save=
 everyone getting spammed :)<br><br></div><div>Cheers,<br><br></div><div>Br=
uce<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span><font co=
lor=3D"#888888">
<br>
// Robert</font></span><div><div><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
Bruce<br>
<br>
<br>
=C2=A0 =C2=A0 If there are other layers which have their own live image, th=
en they can add<br>
=C2=A0 =C2=A0 it to their INSTALL.<br>
<br>
<br>
=C2=A0 =C2=A0 // Robert<br>
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Bruce<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Robert<br>
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Bruce<br>
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 // Robert<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 On 04/04/2016 07:56 AM, Bruce Ashfield wrote:<br>
<br>
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 On Sun, Apr 3, 2016 at 5:46 PM, Richard Purdie<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org"=
 target=3D"_blank">richard.purdie@linuxfoundation.org</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:richard.purdie@lin=
uxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&=
gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a=
 href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richa=
rd.purdie@linuxfoundation.org</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:richard.purdie@lin=
uxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&=
gt;&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:richard.purdie@linuxfoundati=
on.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:richard.purdie@lin=
uxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&=
gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a=
 href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richa=
rd.purdie@linuxfoundation.org</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:richard.purdie@lin=
uxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&=
gt;&gt;&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:richard.purdie@linuxfoundati=
on.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:richard.purdie@lin=
uxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&=
gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a=
 href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richa=
rd.purdie@linuxfoundation.org</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:richard.purdie@lin=
uxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&=
gt;&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:richard.purdie@linuxfoundati=
on.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:richard.purdie@lin=
uxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&=
gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a=
 href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richa=
rd.purdie@linuxfoundation.org</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:richard.purdie@lin=
uxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&=
gt;&gt;&gt;&gt;&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 wrote:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0On Sun, 2016-04-03 at 06:11 -0400, Br=
uce Ashfield<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 wrote:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; On Sun, Apr 3, 2016 at 5:58 AM, =
Robert Yang &lt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<a href=3D"mailto:liezhi.yang@win=
driver.com" target=3D"_blank">liezhi.yang@windriver.com</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:liezhi.yang@windri=
ver.com" target=3D"_blank">liezhi.yang@windriver.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a=
 href=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@wi=
ndriver.com</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:liezhi.yang@windri=
ver.com" target=3D"_blank">liezhi.yang@windriver.com</a>&gt;&gt; &lt;mailto=
:<a href=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang=
@windriver.com</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:liezhi.yang@windri=
ver.com" target=3D"_blank">liezhi.yang@windriver.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a=
 href=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@wi=
ndriver.com</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:liezhi.yang@windri=
ver.com" target=3D"_blank">liezhi.yang@windriver.com</a>&gt;&gt;&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:liezhi.yang@windriver.com" t=
arget=3D"_blank">liezhi.yang@windriver.com</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:liezhi.yang@windri=
ver.com" target=3D"_blank">liezhi.yang@windriver.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a=
 href=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@wi=
ndriver.com</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:liezhi.yang@windri=
ver.com" target=3D"_blank">liezhi.yang@windriver.com</a>&gt;&gt; &lt;mailto=
:<a href=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang=
@windriver.com</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:liezhi.yang@windri=
ver.com" target=3D"_blank">liezhi.yang@windriver.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a=
 href=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@wi=
ndriver.com</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:liezhi.yang@windri=
ver.com" target=3D"_blank">liezhi.yang@windriver.com</a>&gt;&gt;&gt;&gt;&gt=
;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 wrote:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; So that iso can work well, =
otherwise the iso is<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0readonly and =
there<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; would<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; be errors. The other way is=
 aufs, but<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 overlayfs is<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0more pupolar =
and<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; had<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; been merged by kernel mainl=
ine, we need make<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 iso work<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0well by<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; default.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Nope. As I mentioned before, thi=
s can&#39;t be a<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 always on<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default. It<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; will conflict<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; with other unionFS use cases.<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; If you want overlayfs enabled, i=
t needs to be<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 triggered<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from a<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; specific image<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; or distro feature.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0We can&#39;t change the kernel config=
 from an image so it<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0would have to=
 be<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a distro setting. Is there a problem =
with<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 enabling both as<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0modules btw?<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0I assume they can coexist?<br>
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 I&#39;ve always found it limiting that we can&#39;t trigg=
er kernel<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0features base=
d on<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 what an image&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 type actually needs, but I understand why/how it works<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 like this.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 If it can&#39;t be triggered by an image setting, then<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 just keeping<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a layer<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 that is<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 added<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 to the build, that has a bbappend with the appropriate<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0KERNEL_FEATUR=
ES would<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 also work, and is the approach that I&#39;ve also taken.<=
br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 Not that the existing configs are great in this<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 respect (they<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0need a lot of=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 streamlining),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 but building modules &#39;just in case&#39; eventually le=
ads to<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0allmodconfig =
:)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 I&#39;d imagine they could co-exist, but it isn&#39;t<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 something I&#39;ve tried.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 Bruce<br>
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Cheers,<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Richard<br>
<br>
<br>
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 --<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;Thou shalt not follow the NULL pointer, for chaos a=
nd<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 madness<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0await<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 thee at its<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 end&quot;<br>
<br>
<br>
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Thou sh=
alt not follow the NULL pointer, for chaos and madness<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 await<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0thee at its<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0end&quot;<br>
<br>
<br>
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Thou shalt not follow the NULL pointer, f=
or chaos and madness await<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 thee at its<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 end&quot;<br>
<br>
<br>
<br>
<br>
--<br>
&quot;Thou shalt not follow the NULL pointer, for chaos and madness await t=
hee at its<br>
end&quot;<br>
</blockquote>
</div></div></blockquote></div><br><br clear=3D"all"><br>-- <br><div>&quot;=
Thou shalt not follow the NULL pointer, for chaos and madness await thee at=
 its end&quot;</div>
</div></div>

--001a11c2e55857f5d9052fbe19bd--
