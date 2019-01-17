Return-Path: <dan.dedrick@gmail.com>
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
	[209.85.219.170])
	by mail.openembedded.org (Postfix) with ESMTP id 14658602D9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 16:10:13 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id y7so3170841ybg.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 08:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Zh04YAC1z4e+mYImFj3tGKrxezBWAlbZ0proL6VvkZc=;
	b=TkYb94O1wcFAXbGihr9cxUq/2EoGT+rImdWz3+YJhv8ZPz9/83etgGB2pBprJi9AgP
	qe2cYduZy9JxYh5kuu06Dej9SoXohiXEWnZo+KSgjCioA5LQZ6vgXMnyShlkAFlVmN77
	oGB47bcwGscm8KxoS0nAR4Eofo4vxhnu0e8yVIa6KB2UZo+T5bel3xZLb6Pi6CHW7tdA
	PmOZ9uoS86h2KwFsfvK796PeE7+OOSGtAij/bo4kefG6HQ5p9t4uJyCf2N966B/ZlkO+
	8qTvhOyi+Vgq81L4s/heBHfTZizjheZJ1vI+gjHPTmcl87CZco6IppXfOYBk/+DyMWWS
	zWqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Zh04YAC1z4e+mYImFj3tGKrxezBWAlbZ0proL6VvkZc=;
	b=Ip52XcSErSX2As6gdC9/AaOfFQz3AnihOee1M3yUgXFG5S0/4V3vB8YQU4g7hcWh14
	ftq/FCB17hBy3JB2NSm3GF7/EYxFmnHHiKIggXiKFzWnUNUSBDv+sS9XO9Do2/SBYgiT
	ia+LpetC3vKw6ZunTkBQfI6lfOLK2XyCTnaO+7LOohmHC3Rkq3W49FxJ/GMKz7HvpBfO
	mM5E3zHL0VuYhc3ZT7MHIYGNldDA4m5jvWQbTUpj/4MVgC6aV7TTgQWmMShTf4Q/wvQh
	a8b319snXz6Z1Q3kvN022kjd2V/D9HPoGczpCEQNRBm6JqsQvPmcIxQMQ43xc16/qirs
	z7cQ==
X-Gm-Message-State: AJcUuke287L8+SWqAbAJhHaqSbBw7qZnyVBgafEEmW8PdweNp7/A6Q/R
	Es3UV9OZ05DtoexcwzVqYMAEst4BDXXYMOnfa2Q=
X-Google-Smtp-Source: ALg8bN7I52ssrCJHJwwAhEdDcE+PAQaOKOuN2PauZ0OF0QJU2GMczTp7KQ7IUflCXuie6enHaBpBQs71IZDw5FmiG00=
X-Received: by 2002:a25:4cd:: with SMTP id 196mr2466194ybe.309.1547741414368; 
	Thu, 17 Jan 2019 08:10:14 -0800 (PST)
MIME-Version: 1.0
References: <cover.1536248856.git.kai.kang@windriver.com>
	<2824ade62c3ec58c96074aba632740a8118c15f2.1536248856.git.kai.kang@windriver.com>
	<20180913182007.GA1437@jama> <20180913201046.GB1437@jama>
	<20180914112512.GA1369@jama> <20180914141236.GD1369@jama>
	<dabc02da-9972-8e06-6624-a567f8aefe48@windriver.com>
In-Reply-To: <dabc02da-9972-8e06-6624-a567f8aefe48@windriver.com>
From: Dan Dedrick <dan.dedrick@gmail.com>
Date: Thu, 17 Jan 2019 11:10:03 -0500
Message-ID: <CAO-9+V9nXGn+2fgTcCsxKCD3_tBed6=gSm16ceK7ANs=T8egNA@mail.gmail.com>
To: Kang Kai <Kai.Kang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/7] allarch: only enable allarch when multilib is not used
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
X-List-Received-Date: Thu, 17 Jan 2019 16:10:14 -0000
Content-Type: multipart/alternative; boundary="000000000000352c06057fa9a1de"

--000000000000352c06057fa9a1de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm resurrecting this thread because this change negatively affects our use
of multilib. The use case that this is fixing seems to be a a case that
would be a better fit for multiconfig than it would multilib. My
interpretation of the use cases of multilib and multiconfig is as follows
and someone can correct me if this is wrong.

Multilib allows images to be built that support multiple architectures on
the same image. Specifically this use case is interesting for cases where
some library or tool has to be 32-bit (for whatever reason might apply) but
the rest of the image is 64-bit. For example we have a 32-bit library from
a third party vendor and that vendor won't provide us with a 64-bit
version. So we want the majority of our system to be 64-bit but need
multilib to support the subset of our image that needs to be 32-bit. The
result is that some portion of our image has to be 32-bit but whenever
possible we'd like to be using the 64-bit packages to reduce duplicating
packages between 32 and 64 bit.

Multiconfig allows for multiple configs and seems well suited to cases
where there are separate images for each config. So you could have a 32-bit
image from one config and a 64-bit image from another config. If no image
cross-contamination is required, as seems to be the intent of the request
here, then multiconfig can ensure that while not reducing the usefulness of
allarch. The original scenario seemed to follow this pattern where there is
a lib32-core-image-sato and a core-image-sato.

In our multilib case we want the behavior from before this change. So in
the specific use case of 'lib32-curl -> ca-certificate -> openssl' we
actually want this. The reason behind this being the desired behavior is
that the main architecture would certainly already require openssl so
adding the 32-bit version would cause duplication and therefore increase
our images size unnecessarily. In the past we had actually found that
installing some duplicate things that overlapped like "/usr/bin/openssl"
would cause racey behavior where sometimes we got the 32-bit version and
others we got the 64-bit version.

Additionally the removal of allarch from all multilib builds also seem like
a poor choice as multilib builds now lose all of the benefits that are
generally available from allarch.

On Sun, Sep 16, 2018 at 10:27 PM Kang Kai <Kai.Kang@windriver.com> wrote:

> On 2018=E5=B9=B409=E6=9C=8814=E6=97=A5 22:12, Martin Jansa wrote:
> > On Fri, Sep 14, 2018 at 01:25:12PM +0200, Martin Jansa wrote:
> >> On Thu, Sep 13, 2018 at 10:10:46PM +0200, Martin Jansa wrote:
> >>> On Thu, Sep 13, 2018 at 08:20:07PM +0200, Martin Jansa wrote:
> >>>> On Thu, Sep 06, 2018 at 11:52:24PM +0800, kai.kang@windriver.com
> wrote:
> >>>>> From: Kai Kang <kai.kang@windriver.com>
> >>>>>
> >>>>> Some allarch packages rdepends non-allarch packages. when multilib =
is
> >>>>> used, it doesn't expand the dependency chain correctly, e.g.
> >>>>>
> >>>>> core-image-sato -> ca-certificates(allarch) -> openssl
> >>>>>
> >>>>> we expect dependency chain for lib32-core-image-sato:
> >>>>>
> >>>>> lib32-core-image-sato -> ca-certificates(allarch) -> lib32-openssl
> >>>>>
> >>>>> it should install lib32-openssl for ca-certificates but openssl is
> still
> >>>>> wrongly required.
> >>>>>
> >>>>> Only enable allarch when multilib is not used to fix the issue.
> >>>>>
> >>>>> signed-off-by: kai kang <kai.kang@windriver.com>
> >>>>> ---
> >>>>>   meta/classes/allarch.bbclass         | 12 +++++++++++-
> >>>>>   meta/classes/icecc.bbclass           |  2 +-
> >>>>>   meta/classes/multilib.bbclass        |  3 ++-
> >>>>>   meta/classes/multilib_global.bbclass |  4 +---
> >>>>>   meta/classes/package.bbclass         |  9 ++++++---
> >>>>>   5 files changed, 21 insertions(+), 9 deletions(-)
> >>>>>
> >>>>> diff --git a/meta/classes/allarch.bbclass
> b/meta/classes/allarch.bbclass
> >>>>> index 1eebe0bf2e..45f62a5939 100644
> >>>>> --- a/meta/classes/allarch.bbclass
> >>>>> +++ b/meta/classes/allarch.bbclass
> >>>>> @@ -2,7 +2,17 @@
> >>>>>   # This class is used for architecture independent recipes/data
> files (usually scripts)
> >>>>>   #
> >>>>>
> >>>>> -PACKAGE_ARCH =3D "all"
> >>>>> +python allarch_package_arch_handler () {
> >>>>> +    if bb.data.inherits_class("nativesdk", d) or
> bb.data.inherits_class("crosssdk", d):
> >>>>> +        return
> >>>>> +
> >>>>> +    variants =3D d.getVar("MULTILIB_VARIANTS")
> >>>>> +    if not variants:
> >>>>> +        d.setVar("PACKAGE_ARCH", "all" )
> >>>>> +}
> >>>>> +
> >>>>> +addhandler allarch_package_arch_handler
> >>>>> +allarch_package_arch_handler[eventmask] =3D
> "bb.event.RecipePreFinalise"
> >>>> Maybe I'm overlooking something, but doesn't this overwrite whatever
> >>>> PACKAGE_ARCH as set before this?
> >>>>
> >>>> I have some recipes where the PACKAGE_ARCH is set to MACHINE_ARCH
> through
> >>>> another bbclass, but then overwritten with "all" by
> allarch_package_arch_handler:
> >>>>
> >>>> # $PACKAGE_ARCH [5 operations]
> >>>> #   set oe-core/meta/conf/bitbake.conf:150
> >>>> #     [_defaultval] "${TUNE_PKGARCH}"
> >>>> #   set meta-lg-webos/meta-webos/conf/distro/include/webos.inc:241
> >>>> #     "${MACHINE_ARCH}"
> >>>> #   set oe-core/meta/conf/documentation.conf:304
> >>>> #     [doc] "The architecture of the resulting package or packages."
> >>>> #   set
> meta-lg-webos/meta-webos/classes/webos_machine_impl_dep.bbclass:11
> >>>> #     "${MACHINE_ARCH}"
> >>>> #   set allarch.bbclass:12 [allarch_package_arch_handler]
> >>>> #     "all"
> >>>> # pre-expansion value:
> >>>> #   "all"
> >>>> PACKAGE_ARCH=3D"all"
> >>>>
> >>>> But surprisingly if I do the same with e.g. packagegroup-core-boot i=
n
> oe-core I get:
> >>>>
> >>>> # $PACKAGE_ARCH [4 operations]
> >>>> #   set /OE/build/oe-core/openembedded-core/meta/conf/bitbake.conf:1=
50
> >>>> #     [_defaultval] "${TUNE_PKGARCH}"
> >>>> #   set
> /OE/build/oe-core/openembedded-core/meta/conf/documentation.conf:304
> >>>> #     [doc] "The architecture of the resulting package or packages."
> >>>> #   set
> /OE/build/oe-core/openembedded-core/meta/recipes-core/packagegroups/
> packagegroup-core-boot.bb:9
> >>>> #     "${MACHINE_ARCH}"
> >>>> #   set?
> /OE/build/oe-core/openembedded-core/meta/classes/packagegroup.bbclass:12
> >>>> #     "all"
> >>>> # pre-expansion value:
> >>>> #   "${MACHINE_ARCH}"
> >>>> PACKAGE_ARCH=3D"qemux86_64"
> >>>>
> >>>> Why isn't allarch_package_arch_handler executed in the 2nd case?
> >>> Now I see the difference, I was still living in the days when
> >>> "disabling" allarch was possible just by setting PACKAGE_ARCH before
> >>> inheritting allarch, but now I see that packagegroups do conditional
> >>> inherit as well since:
> >>>
> http://git.openembedded.org/openembedded-core/commit/?id=3D9c826962ec8fa4=
5c2b035427442b90a41517144e
> >>>
> http://git.openembedded.org/openembedded-core/commit/?id=3D2c9b1d304daade=
7b0907320aeb9c522e7ab9dcab
> >>> so I'll modify currently failing recipes to do the same and stop
> >>> inheritting allarch when PACKAGE_ARCH is set to something else.
> >>  From public layers I've found with test-signatures script only
> >> fbset-nodes recipe in meta-oe which was setting PACKAGE_ARCH after
> >> allarch inherit, allarch removal sent here:
> >>
> http://lists.openembedded.org/pipermail/openembedded-devel/2018-September=
/120560.html
> > target-sdk-provides-dummy seems to be affected as well:
> >   =3D=3D=3D Comparing signatures for task do_populate_sysroot.sigdata b=
etween
> qemux86 and qemux86copy =3D=3D=3D
> > ERROR: lib32-target-sdk-provides-dummy different signature for task
> do_populate_sysroot.sigdata between qemux86 and qemux86copy
> > basehash changed from b0a44b2c7003b6b4aa3a023d9cb9fe82 to
> 3a59fa25ddb6a95aff079d477ebf3457
> > Variable SSTATE_MANMACH value changed from 'qemux86' to 'qemux86copy'
> >
> > ERROR: target-sdk-provides-dummy different signature for task
> do_populate_sysroot.sigdata between qemux86 and qemux86copy
> > basehash changed from 9e44f1deb3d15886ee96db1a3332764c to
> 6b417d08a5113c9b06d13b3681f5ab4f
> > Variable SSTATE_MANMACH value changed from 'qemux86' to 'qemux86copy'
> >
> >
> > It's using:
> > inherit allarch
> >
> > python() {
> >      # Put the package somewhere separate to ensure it's never used
> except
> >      # when we want it
> >      # (note that we have to do this in anonymous python here to avoid
> >      # allarch.bbclass disabling itself)
> >      d.setVar('PACKAGE_ARCH', '${DUMMYARCH}')
> > }
> >
> > and DUMMYARCH =3D "sdk-provides-dummy-target"
> >
> > The difference as shown with bitbake -e before and after reverting this
> commit:
> >
> > before revert:
> > # $SSTATE_MANMACH [2 operations]
> > #   set? oe-core/meta/classes/sstate.bbclass:61
> > #     "${SSTATE_PKGARCH}"
> > #   set sstate.bbclass:100
> [__anon_111_oe_core_meta_classes_sstate_bbclass]
> > #     "machineName"
> > # pre-expansion value:
> > #   "machineName"
> > SSTATE_MANMACH=3D"machineName"
> >
> > # $SSTATE_PKGARCH
> > #   set oe-core/meta/classes/sstate.bbclass:11
> > #     "${PACKAGE_ARCH}"
> > SSTATE_PKGARCH=3D"sdk-provides-dummy-target"
> >
> > # $PACKAGE_ARCH [3 operations]
> > #   set oe-core/meta/conf/bitbake.conf:150
> > #     [_defaultval] "${TUNE_PKGARCH}"
> > #   set oe-core/meta/conf/documentation.conf:304
> > #     [doc] "The architecture of the resulting package or packages."
> > #   set dummy-sdk-package.inc:12
> [__anon_12_oe_core_meta_recipes_core_meta_dummy_sdk_package_inc]
> > #     "${DUMMYARCH}"
> > # pre-expansion value:
> > #   "${DUMMYARCH}"
> > PACKAGE_ARCH=3D"sdk-provides-dummy-target"
> >
> > after revert:
> > # $SSTATE_MANMACH
> > #   set? oe-core/meta/classes/sstate.bbclass:61
> > #     "${SSTATE_PKGARCH}"
> > SSTATE_MANMACH=3D"allarch"
> >
> > # $SSTATE_PKGARCH [2 operations]
> > #   set oe-core/meta/classes/sstate.bbclass:11
> > #     "${PACKAGE_ARCH}"
> > #   set sstate.bbclass:98
> [__anon_111__oe_core_meta_classes_sstate_bbclass]
> > #     "allarch"
> > # pre-expansion value:
> > #   "allarch"
> > SSTATE_PKGARCH=3D"allarch"
> >
> > # $PACKAGE_ARCH [4 operations]
> > #   set oe-core/meta/conf/bitbake.conf:150
> > #     [_defaultval] "${TUNE_PKGARCH}"
> > #   set oe-core/meta/conf/documentation.conf:304
> > #     [doc] "The architecture of the resulting package or packages."
> > #   set oe-core/meta/classes/allarch.bbclass:5
> > #     "all"
> > #   set dummy-sdk-package.inc:12
> [__anon_12_oe_core_meta_recipes_core_meta_dummy_sdk_package_inc]
> > #     "${DUMMYARCH}"
> > # pre-expansion value:
> > #   "${DUMMYARCH}"
> > PACKAGE_ARCH=3D"sdk-provides-dummy-target"
> >
> >
> > the relevant part of the anonymous python in sstate.bbclass:
> >
> >      elif bb.data.inherits_class('allarch', d) and
> d.getVar("PACKAGE_ARCH") =3D=3D "all":
> >          d.setVar('SSTATE_PKGARCH', "allarch")
> >      else:
> >          d.setVar('SSTATE_MANMACH', d.expand("${PACKAGE_ARCH}"))
> >
> > So with your change, the PACKAGE_ARCH isn't set to "all" because
> multilib is enabled,
> > but that causes sstate.bbclass to set SSTATE_MANMACH to MACHINE instead
> of SSTATE_PKGARCH
> > allarch, where it got MACHINE is still a bit of mystery to me.
>
> The original story is that multilib packages such as lib32-curl depends
> on non-multilib package openssl that allarch package ca-certificates
> is in the dependency chain:
>
> lib32-curl -> ca-certificates -> openssl
>
> I sent some versions of commits to Richard but he thought these
> solutions affect current non-multilib build too much. And Richard propose=
d
> this solution which not affect current non-multilib build. When multilib
> is enabled/used, allarch packages are eliminated and treated as common
> packages. The vars SSTATE_*  are set as the same as normal packages such
> as zlib.
>
> Package target-sdk-provides-dummy is a little special that it sets its
> PACKAGE_ARCH in its own recipe. And affects vars which depends on
> PACKAGE_ARCH.
>
> Regards,
> Kai
>
> >
> > Cheers,
> >
> >>> Cheers,
> >>>
> >>>>>   python () {
> >>>>>       # Allow this class to be included but overridden - only set
> >>>>> diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclas=
s
> >>>>> index 0ca8de86c2..b5a8457747 100644
> >>>>> --- a/meta/classes/icecc.bbclass
> >>>>> +++ b/meta/classes/icecc.bbclass
> >>>>> @@ -171,7 +171,7 @@ def use_icecc(bb,d):
> >>>>>       return "yes"
> >>>>>
> >>>>>   def icecc_is_allarch(bb, d):
> >>>>> -    return d.getVar("PACKAGE_ARCH") =3D=3D "all" or
> bb.data.inherits_class('allarch', d)
> >>>>> +    return d.getVar("PACKAGE_ARCH") =3D=3D "all"
> >>>>>
> >>>>>   def icecc_is_kernel(bb, d):
> >>>>>       return \
> >>>>> diff --git a/meta/classes/multilib.bbclass
> b/meta/classes/multilib.bbclass
> >>>>> index f2ac8bdfef..7b4d6472b0 100644
> >>>>> --- a/meta/classes/multilib.bbclass
> >>>>> +++ b/meta/classes/multilib.bbclass
> >>>>> @@ -50,7 +50,8 @@ python multilib_virtclass_handler () {
> >>>>>       if bb.data.inherits_class('nativesdk', e.data) or
> bb.data.inherits_class('crosssdk', e.data):
> >>>>>           raise bb.parse.SkipRecipe("We can't extend nativesdk
> recipes")
> >>>>>
> >>>>> -    if bb.data.inherits_class('allarch', e.data) and not
> bb.data.inherits_class('packagegroup', e.data):
> >>>>> +    if bb.data.inherits_class('allarch', e.data) and not
> d.getVar('MULTILIB_VARIANTS') \
> >>>>> +        and not bb.data.inherits_class('packagegroup', e.data):
> >>>>>           raise bb.parse.SkipRecipe("Don't extend allarch recipes
> which are not packagegroups")
> >>>>>
> >>>>>       # Expand this since this won't work correctly once we set a
> multilib into place
> >>>>> diff --git a/meta/classes/multilib_global.bbclass
> b/meta/classes/multilib_global.bbclass
> >>>>> index d2ec1adfea..1bb62427b0 100644
> >>>>> --- a/meta/classes/multilib_global.bbclass
> >>>>> +++ b/meta/classes/multilib_global.bbclass
> >>>>> @@ -165,9 +165,7 @@ python multilib_virtclass_handler_global () {
> >>>>>           return
> >>>>>
> >>>>>       if bb.data.inherits_class('kernel', e.data) or \
> >>>>> -            bb.data.inherits_class('module-base', e.data) or \
> >>>>> -            (bb.data.inherits_class('allarch', e.data) and\
> >>>>> -             not bb.data.inherits_class('packagegroup', e.data)):
> >>>>> +            bb.data.inherits_class('module-base', e.data):
> >>>>>               variants =3D (e.data.getVar("MULTILIB_VARIANTS") or
> "").split()
> >>>>>
> >>>>>               import oe.classextend
> >>>>> diff --git a/meta/classes/package.bbclass
> b/meta/classes/package.bbclass
> >>>>> index 0b6f65a855..d1e9138c66 100644
> >>>>> --- a/meta/classes/package.bbclass
> >>>>> +++ b/meta/classes/package.bbclass
> >>>>> @@ -494,7 +494,8 @@ def get_package_mapping (pkg, basepkg, d):
> >>>>>
> >>>>>       if key in data:
> >>>>>           # Have to avoid undoing the
> write_extra_pkgs(global_variants...)
> >>>>> -        if bb.data.inherits_class('allarch', d) and data[key] =3D=
=3D
> basepkg:
> >>>>> +        if bb.data.inherits_class('allarch', d) and not
> d.getVar('MULTILIB_VARIANTS') \
> >>>>> +            and data[key] =3D=3D basepkg:
> >>>>>               return pkg
> >>>>>           return data[key]
> >>>>>
> >>>>> @@ -1413,7 +1414,8 @@ fi
> >>>>>       if bb.data.inherits_class('kernel', d) or
> bb.data.inherits_class('module-base', d):
> >>>>>           write_extra_pkgs(variants, pn, packages, pkgdatadir)
> >>>>>
> >>>>> -    if (bb.data.inherits_class('allarch', d) and not
> bb.data.inherits_class('packagegroup', d)):
> >>>>> +    if bb.data.inherits_class('allarch', d) and not variants \
> >>>>> +        and not bb.data.inherits_class('packagegroup', d):
> >>>>>           write_extra_pkgs(global_variants, pn, packages, pkgdatadi=
r)
> >>>>>
> >>>>>       workdir =3D d.getVar('WORKDIR')
> >>>>> @@ -1502,7 +1504,8 @@ fi
> >>>>>       if bb.data.inherits_class('kernel', d) or
> bb.data.inherits_class('module-base', d):
> >>>>>           write_extra_runtime_pkgs(variants, packages, pkgdatadir)
> >>>>>
> >>>>> -    if bb.data.inherits_class('allarch', d) and not
> bb.data.inherits_class('packagegroup', d):
> >>>>> +    if bb.data.inherits_class('allarch', d) and not variants \
> >>>>> +        and not bb.data.inherits_class('packagegroup', d):
> >>>>>           write_extra_runtime_pkgs(global_variants, packages,
> pkgdatadir)
> >>>>>
> >>>>>   }
> >>>>> --
> >>>>> 2.18.0
> >>>>>
> >>>>> --
> >>>>> _______________________________________________
> >>>>> Openembedded-core mailing list
> >>>>> Openembedded-core@lists.openembedded.org
> >>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >>>> --
> >>>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >>>
> >>>
> >>> --
> >>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >>
> >>
> >> --
> >> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >
> >
>
> --
> Regards,
> Neil | Kai Kang
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000352c06057fa9a1de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m resurrecting this thread because this change negat=
ively affects our use of multilib. The use case that this is fixing seems t=
o be a a case that would be a better fit for multiconfig than it would mult=
ilib. My interpretation of the use cases of multilib and multiconfig is as =
follows and someone can correct me if this is wrong.<br><br>Multilib allows=
 images to be built that support multiple architectures on the same image. =
Specifically this use case is interesting for cases where some library or t=
ool has to be 32-bit (for whatever reason might apply) but the rest of the =
image is 64-bit. For example we have a 32-bit library from a third party ve=
ndor and that vendor won&#39;t provide us with a 64-bit version. So we want=
 the majority of our system to be 64-bit but need multilib to support the s=
ubset of our image that needs to be 32-bit. The result is that some portion=
 of our image has to be 32-bit but whenever possible we&#39;d like to be us=
ing the 64-bit packages to reduce duplicating packages between 32 and 64 bi=
t.<br><br>Multiconfig allows for multiple configs and seems well suited to =
cases where there are separate images for each config. So you could have a =
32-bit image from one config and a 64-bit image from another config. If no =
image cross-contamination is required, as seems to be the intent of the req=
uest here, then multiconfig can ensure that while not reducing the usefulne=
ss of allarch. The original scenario seemed to follow this pattern where th=
ere is a lib32-core-image-sato and a core-image-sato.<div><br></div><div>In=
 our multilib case we want the behavior from before this change. So in the =
specific use case of &#39;lib32-curl -&gt; ca-certificate -&gt; openssl&#39=
; we actually want this. The reason behind this being the desired behavior =
is that the main architecture would certainly already require openssl so ad=
ding the 32-bit version would cause duplication and therefore increase our =
images size unnecessarily. In the past we had actually found that installin=
g some duplicate things that overlapped like &quot;/usr/bin/openssl&quot; w=
ould cause racey behavior where sometimes we got the 32-bit version and oth=
ers we got the 64-bit version.</div><div><br></div><div>Additionally the re=
moval of allarch from all multilib builds also seem like a poor choice as m=
ultilib builds now lose all of the benefits that are generally available fr=
om allarch.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On S=
un, Sep 16, 2018 at 10:27 PM Kang Kai &lt;<a href=3D"mailto:Kai.Kang@windri=
ver.com">Kai.Kang@windriver.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On 2018=E5=B9=B409=E6=9C=8814=E6=97=A5 22:=
12, Martin Jansa wrote:<br>
&gt; On Fri, Sep 14, 2018 at 01:25:12PM +0200, Martin Jansa wrote:<br>
&gt;&gt; On Thu, Sep 13, 2018 at 10:10:46PM +0200, Martin Jansa wrote:<br>
&gt;&gt;&gt; On Thu, Sep 13, 2018 at 08:20:07PM +0200, Martin Jansa wrote:<=
br>
&gt;&gt;&gt;&gt; On Thu, Sep 06, 2018 at 11:52:24PM +0800, <a href=3D"mailt=
o:kai.kang@windriver.com" target=3D"_blank">kai.kang@windriver.com</a> wrot=
e:<br>
&gt;&gt;&gt;&gt;&gt; From: Kai Kang &lt;<a href=3D"mailto:kai.kang@windrive=
r.com" target=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Some allarch packages rdepends non-allarch packages. w=
hen multilib is<br>
&gt;&gt;&gt;&gt;&gt; used, it doesn&#39;t expand the dependency chain corre=
ctly, e.g.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; core-image-sato -&gt; ca-certificates(allarch) -&gt; o=
penssl<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; we expect dependency chain for lib32-core-image-sato:<=
br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; lib32-core-image-sato -&gt; ca-certificates(allarch) -=
&gt; lib32-openssl<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; it should install lib32-openssl for ca-certificates bu=
t openssl is still<br>
&gt;&gt;&gt;&gt;&gt; wrongly required.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Only enable allarch when multilib is not used to fix t=
he issue.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; signed-off-by: kai kang &lt;<a href=3D"mailto:kai.kang=
@windriver.com" target=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0meta/classes/allarch.bbclass=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 12 +++++++++++-<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0meta/classes/icecc.bbclass=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0meta/classes/multilib.bbclass=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 3 ++-<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0meta/classes/multilib_global.bbclass |=C2=
=A0 4 +---<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0meta/classes/package.bbclass=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 9 ++++++---<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A05 files changed, 21 insertions(+), 9 delet=
ions(-)<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; diff --git a/meta/classes/allarch.bbclass b/meta/class=
es/allarch.bbclass<br>
&gt;&gt;&gt;&gt;&gt; index 1eebe0bf2e..45f62a5939 100644<br>
&gt;&gt;&gt;&gt;&gt; --- a/meta/classes/allarch.bbclass<br>
&gt;&gt;&gt;&gt;&gt; +++ b/meta/classes/allarch.bbclass<br>
&gt;&gt;&gt;&gt;&gt; @@ -2,7 +2,17 @@<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# This class is used for architecture inde=
pendent recipes/data files (usually scripts)<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0<br>
&gt;&gt;&gt;&gt;&gt; -PACKAGE_ARCH =3D &quot;all&quot;<br>
&gt;&gt;&gt;&gt;&gt; +python allarch_package_arch_handler () {<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 if bb.data.inherits_class(&quot;natives=
dk&quot;, d) or bb.data.inherits_class(&quot;crosssdk&quot;, d):<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 variants =3D d.getVar(&quot;MULTILIB_VA=
RIANTS&quot;)<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 if not variants:<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&quot;PACKAGE_AR=
CH&quot;, &quot;all&quot; )<br>
&gt;&gt;&gt;&gt;&gt; +}<br>
&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt; +addhandler allarch_package_arch_handler<br>
&gt;&gt;&gt;&gt;&gt; +allarch_package_arch_handler[eventmask] =3D &quot;bb.=
event.RecipePreFinalise&quot;<br>
&gt;&gt;&gt;&gt; Maybe I&#39;m overlooking something, but doesn&#39;t this =
overwrite whatever<br>
&gt;&gt;&gt;&gt; PACKAGE_ARCH as set before this?<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; I have some recipes where the PACKAGE_ARCH is set to MACHI=
NE_ARCH through<br>
&gt;&gt;&gt;&gt; another bbclass, but then overwritten with &quot;all&quot;=
 by allarch_package_arch_handler:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; # $PACKAGE_ARCH [5 operations]<br>
&gt;&gt;&gt;&gt; #=C2=A0 =C2=A0set oe-core/meta/conf/bitbake.conf:150<br>
&gt;&gt;&gt;&gt; #=C2=A0 =C2=A0 =C2=A0[_defaultval] &quot;${TUNE_PKGARCH}&q=
uot;<br>
&gt;&gt;&gt;&gt; #=C2=A0 =C2=A0set meta-lg-webos/meta-webos/conf/distro/inc=
lude/webos.inc:241<br>
&gt;&gt;&gt;&gt; #=C2=A0 =C2=A0 =C2=A0&quot;${MACHINE_ARCH}&quot;<br>
&gt;&gt;&gt;&gt; #=C2=A0 =C2=A0set oe-core/meta/conf/documentation.conf:304=
<br>
&gt;&gt;&gt;&gt; #=C2=A0 =C2=A0 =C2=A0[doc] &quot;The architecture of the r=
esulting package or packages.&quot;<br>
&gt;&gt;&gt;&gt; #=C2=A0 =C2=A0set meta-lg-webos/meta-webos/classes/webos_m=
achine_impl_dep.bbclass:11<br>
&gt;&gt;&gt;&gt; #=C2=A0 =C2=A0 =C2=A0&quot;${MACHINE_ARCH}&quot;<br>
&gt;&gt;&gt;&gt; #=C2=A0 =C2=A0set allarch.bbclass:12 [allarch_package_arch=
_handler]<br>
&gt;&gt;&gt;&gt; #=C2=A0 =C2=A0 =C2=A0&quot;all&quot;<br>
&gt;&gt;&gt;&gt; # pre-expansion value:<br>
&gt;&gt;&gt;&gt; #=C2=A0 =C2=A0&quot;all&quot;<br>
&gt;&gt;&gt;&gt; PACKAGE_ARCH=3D&quot;all&quot;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; But surprisingly if I do the same with e.g. packagegroup-c=
ore-boot in oe-core I get:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; # $PACKAGE_ARCH [4 operations]<br>
&gt;&gt;&gt;&gt; #=C2=A0 =C2=A0set /OE/build/oe-core/openembedded-core/meta=
/conf/bitbake.conf:150<br>
&gt;&gt;&gt;&gt; #=C2=A0 =C2=A0 =C2=A0[_defaultval] &quot;${TUNE_PKGARCH}&q=
uot;<br>
&gt;&gt;&gt;&gt; #=C2=A0 =C2=A0set /OE/build/oe-core/openembedded-core/meta=
/conf/documentation.conf:304<br>
&gt;&gt;&gt;&gt; #=C2=A0 =C2=A0 =C2=A0[doc] &quot;The architecture of the r=
esulting package or packages.&quot;<br>
&gt;&gt;&gt;&gt; #=C2=A0 =C2=A0set /OE/build/oe-core/openembedded-core/meta=
/recipes-core/packagegroups/<a href=3D"http://packagegroup-core-boot.bb:9" =
rel=3D"noreferrer" target=3D"_blank">packagegroup-core-boot.bb:9</a><br>
&gt;&gt;&gt;&gt; #=C2=A0 =C2=A0 =C2=A0&quot;${MACHINE_ARCH}&quot;<br>
&gt;&gt;&gt;&gt; #=C2=A0 =C2=A0set? /OE/build/oe-core/openembedded-core/met=
a/classes/packagegroup.bbclass:12<br>
&gt;&gt;&gt;&gt; #=C2=A0 =C2=A0 =C2=A0&quot;all&quot;<br>
&gt;&gt;&gt;&gt; # pre-expansion value:<br>
&gt;&gt;&gt;&gt; #=C2=A0 =C2=A0&quot;${MACHINE_ARCH}&quot;<br>
&gt;&gt;&gt;&gt; PACKAGE_ARCH=3D&quot;qemux86_64&quot;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Why isn&#39;t allarch_package_arch_handler executed in the=
 2nd case?<br>
&gt;&gt;&gt; Now I see the difference, I was still living in the days when<=
br>
&gt;&gt;&gt; &quot;disabling&quot; allarch was possible just by setting PAC=
KAGE_ARCH before<br>
&gt;&gt;&gt; inheritting allarch, but now I see that packagegroups do condi=
tional<br>
&gt;&gt;&gt; inherit as well since:<br>
&gt;&gt;&gt; <a href=3D"http://git.openembedded.org/openembedded-core/commi=
t/?id=3D9c826962ec8fa45c2b035427442b90a41517144e" rel=3D"noreferrer" target=
=3D"_blank">http://git.openembedded.org/openembedded-core/commit/?id=3D9c82=
6962ec8fa45c2b035427442b90a41517144e</a><br>
&gt;&gt;&gt; <a href=3D"http://git.openembedded.org/openembedded-core/commi=
t/?id=3D2c9b1d304daade7b0907320aeb9c522e7ab9dcab" rel=3D"noreferrer" target=
=3D"_blank">http://git.openembedded.org/openembedded-core/commit/?id=3D2c9b=
1d304daade7b0907320aeb9c522e7ab9dcab</a><br>
&gt;&gt;&gt; so I&#39;ll modify currently failing recipes to do the same an=
d stop<br>
&gt;&gt;&gt; inheritting allarch when PACKAGE_ARCH is set to something else=
.<br>
&gt;&gt;=C2=A0 From public layers I&#39;ve found with test-signatures scrip=
t only<br>
&gt;&gt; fbset-nodes recipe in meta-oe which was setting PACKAGE_ARCH after=
<br>
&gt;&gt; allarch inherit, allarch removal sent here:<br>
&gt;&gt; <a href=3D"http://lists.openembedded.org/pipermail/openembedded-de=
vel/2018-September/120560.html" rel=3D"noreferrer" target=3D"_blank">http:/=
/lists.openembedded.org/pipermail/openembedded-devel/2018-September/120560.=
html</a><br>
&gt; target-sdk-provides-dummy seems to be affected as well:<br>
&gt;=C2=A0 =C2=A0=3D=3D=3D Comparing signatures for task do_populate_sysroo=
t.sigdata between qemux86 and qemux86copy =3D=3D=3D<br>
&gt; ERROR: lib32-target-sdk-provides-dummy different signature for task do=
_populate_sysroot.sigdata between qemux86 and qemux86copy<br>
&gt; basehash changed from b0a44b2c7003b6b4aa3a023d9cb9fe82 to 3a59fa25ddb6=
a95aff079d477ebf3457<br>
&gt; Variable SSTATE_MANMACH value changed from &#39;qemux86&#39; to &#39;q=
emux86copy&#39;<br>
&gt;<br>
&gt; ERROR: target-sdk-provides-dummy different signature for task do_popul=
ate_sysroot.sigdata between qemux86 and qemux86copy<br>
&gt; basehash changed from 9e44f1deb3d15886ee96db1a3332764c to 6b417d08a511=
3c9b06d13b3681f5ab4f<br>
&gt; Variable SSTATE_MANMACH value changed from &#39;qemux86&#39; to &#39;q=
emux86copy&#39;<br>
&gt;<br>
&gt;<br>
&gt; It&#39;s using:<br>
&gt; inherit allarch<br>
&gt;<br>
&gt; python() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # Put the package somewhere separate to ensure it&=
#39;s never used except<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # when we want it<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # (note that we have to do this in anonymous pytho=
n here to avoid<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # allarch.bbclass disabling itself)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;PACKAGE_ARCH&#39;, &#39;${DUMMYARCH}=
&#39;)<br>
&gt; }<br>
&gt;<br>
&gt; and DUMMYARCH =3D &quot;sdk-provides-dummy-target&quot;<br>
&gt;<br>
&gt; The difference as shown with bitbake -e before and after reverting thi=
s commit:<br>
&gt;<br>
&gt; before revert:<br>
&gt; # $SSTATE_MANMACH [2 operations]<br>
&gt; #=C2=A0 =C2=A0set? oe-core/meta/classes/sstate.bbclass:61<br>
&gt; #=C2=A0 =C2=A0 =C2=A0&quot;${SSTATE_PKGARCH}&quot;<br>
&gt; #=C2=A0 =C2=A0set sstate.bbclass:100 [__anon_111_oe_core_meta_classes_=
sstate_bbclass]<br>
&gt; #=C2=A0 =C2=A0 =C2=A0&quot;machineName&quot;<br>
&gt; # pre-expansion value:<br>
&gt; #=C2=A0 =C2=A0&quot;machineName&quot;<br>
&gt; SSTATE_MANMACH=3D&quot;machineName&quot;<br>
&gt;<br>
&gt; # $SSTATE_PKGARCH<br>
&gt; #=C2=A0 =C2=A0set oe-core/meta/classes/sstate.bbclass:11<br>
&gt; #=C2=A0 =C2=A0 =C2=A0&quot;${PACKAGE_ARCH}&quot;<br>
&gt; SSTATE_PKGARCH=3D&quot;sdk-provides-dummy-target&quot;<br>
&gt;<br>
&gt; # $PACKAGE_ARCH [3 operations]<br>
&gt; #=C2=A0 =C2=A0set oe-core/meta/conf/bitbake.conf:150<br>
&gt; #=C2=A0 =C2=A0 =C2=A0[_defaultval] &quot;${TUNE_PKGARCH}&quot;<br>
&gt; #=C2=A0 =C2=A0set oe-core/meta/conf/documentation.conf:304<br>
&gt; #=C2=A0 =C2=A0 =C2=A0[doc] &quot;The architecture of the resulting pac=
kage or packages.&quot;<br>
&gt; #=C2=A0 =C2=A0set dummy-sdk-package.inc:12 [__anon_12_oe_core_meta_rec=
ipes_core_meta_dummy_sdk_package_inc]<br>
&gt; #=C2=A0 =C2=A0 =C2=A0&quot;${DUMMYARCH}&quot;<br>
&gt; # pre-expansion value:<br>
&gt; #=C2=A0 =C2=A0&quot;${DUMMYARCH}&quot;<br>
&gt; PACKAGE_ARCH=3D&quot;sdk-provides-dummy-target&quot;<br>
&gt;<br>
&gt; after revert:<br>
&gt; # $SSTATE_MANMACH<br>
&gt; #=C2=A0 =C2=A0set? oe-core/meta/classes/sstate.bbclass:61<br>
&gt; #=C2=A0 =C2=A0 =C2=A0&quot;${SSTATE_PKGARCH}&quot;<br>
&gt; SSTATE_MANMACH=3D&quot;allarch&quot;<br>
&gt;<br>
&gt; # $SSTATE_PKGARCH [2 operations]<br>
&gt; #=C2=A0 =C2=A0set oe-core/meta/classes/sstate.bbclass:11<br>
&gt; #=C2=A0 =C2=A0 =C2=A0&quot;${PACKAGE_ARCH}&quot;<br>
&gt; #=C2=A0 =C2=A0set sstate.bbclass:98 [__anon_111__oe_core_meta_classes_=
sstate_bbclass]<br>
&gt; #=C2=A0 =C2=A0 =C2=A0&quot;allarch&quot;<br>
&gt; # pre-expansion value:<br>
&gt; #=C2=A0 =C2=A0&quot;allarch&quot;<br>
&gt; SSTATE_PKGARCH=3D&quot;allarch&quot;<br>
&gt;<br>
&gt; # $PACKAGE_ARCH [4 operations]<br>
&gt; #=C2=A0 =C2=A0set oe-core/meta/conf/bitbake.conf:150<br>
&gt; #=C2=A0 =C2=A0 =C2=A0[_defaultval] &quot;${TUNE_PKGARCH}&quot;<br>
&gt; #=C2=A0 =C2=A0set oe-core/meta/conf/documentation.conf:304<br>
&gt; #=C2=A0 =C2=A0 =C2=A0[doc] &quot;The architecture of the resulting pac=
kage or packages.&quot;<br>
&gt; #=C2=A0 =C2=A0set oe-core/meta/classes/allarch.bbclass:5<br>
&gt; #=C2=A0 =C2=A0 =C2=A0&quot;all&quot;<br>
&gt; #=C2=A0 =C2=A0set dummy-sdk-package.inc:12 [__anon_12_oe_core_meta_rec=
ipes_core_meta_dummy_sdk_package_inc]<br>
&gt; #=C2=A0 =C2=A0 =C2=A0&quot;${DUMMYARCH}&quot;<br>
&gt; # pre-expansion value:<br>
&gt; #=C2=A0 =C2=A0&quot;${DUMMYARCH}&quot;<br>
&gt; PACKAGE_ARCH=3D&quot;sdk-provides-dummy-target&quot;<br>
&gt;<br>
&gt;<br>
&gt; the relevant part of the anonymous python in sstate.bbclass:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 elif bb.data.inherits_class(&#39;allarch&#39;, d) =
and d.getVar(&quot;PACKAGE_ARCH&quot;) =3D=3D &quot;all&quot;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;SSTATE_PKGARCH&#39;, &=
quot;allarch&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 else:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;SSTATE_MANMACH&#39;, d=
.expand(&quot;${PACKAGE_ARCH}&quot;))<br>
&gt;<br>
&gt; So with your change, the PACKAGE_ARCH isn&#39;t set to &quot;all&quot;=
 because multilib is enabled,<br>
&gt; but that causes sstate.bbclass to set SSTATE_MANMACH to MACHINE instea=
d of SSTATE_PKGARCH<br>
&gt; allarch, where it got MACHINE is still a bit of mystery to me.<br>
<br>
The original story is that multilib packages such as lib32-curl depends <br=
>
on non-multilib package openssl that allarch package ca-certificates<br>
is in the dependency chain:<br>
<br>
lib32-curl -&gt; ca-certificates -&gt; openssl<br>
<br>
I sent some versions of commits to Richard but he thought these <br>
solutions affect current non-multilib build too much. And Richard proposed<=
br>
this solution which not affect current non-multilib build. When multilib <b=
r>
is enabled/used, allarch packages are eliminated and treated as common<br>
packages. The vars SSTATE_*=C2=A0 are set as the same as normal packages su=
ch <br>
as zlib.<br>
<br>
Package target-sdk-provides-dummy is a little special that it sets its <br>
PACKAGE_ARCH in its own recipe. And affects vars which depends on <br>
PACKAGE_ARCH.<br>
<br>
Regards,<br>
Kai<br>
<br>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt;&gt;&gt; Cheers,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0python () {<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# Allow this class to be inc=
luded but overridden - only set<br>
&gt;&gt;&gt;&gt;&gt; diff --git a/meta/classes/icecc.bbclass b/meta/classes=
/icecc.bbclass<br>
&gt;&gt;&gt;&gt;&gt; index 0ca8de86c2..b5a8457747 100644<br>
&gt;&gt;&gt;&gt;&gt; --- a/meta/classes/icecc.bbclass<br>
&gt;&gt;&gt;&gt;&gt; +++ b/meta/classes/icecc.bbclass<br>
&gt;&gt;&gt;&gt;&gt; @@ -171,7 +171,7 @@ def use_icecc(bb,d):<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return &quot;yes&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0def icecc_is_allarch(bb, d):<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 return d.getVar(&quot;PACKAGE_ARCH&quot=
;) =3D=3D &quot;all&quot; or bb.data.inherits_class(&#39;allarch&#39;, d)<b=
r>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 return d.getVar(&quot;PACKAGE_ARCH&quot=
;) =3D=3D &quot;all&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0def icecc_is_kernel(bb, d):<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return \<br>
&gt;&gt;&gt;&gt;&gt; diff --git a/meta/classes/multilib.bbclass b/meta/clas=
ses/multilib.bbclass<br>
&gt;&gt;&gt;&gt;&gt; index f2ac8bdfef..7b4d6472b0 100644<br>
&gt;&gt;&gt;&gt;&gt; --- a/meta/classes/multilib.bbclass<br>
&gt;&gt;&gt;&gt;&gt; +++ b/meta/classes/multilib.bbclass<br>
&gt;&gt;&gt;&gt;&gt; @@ -50,7 +50,8 @@ python multilib_virtclass_handler ()=
 {<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if bb.data.inherits_class(&#=
39;nativesdk&#39;, e.data) or bb.data.inherits_class(&#39;crosssdk&#39;, e.=
data):<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise bb.parse=
.SkipRecipe(&quot;We can&#39;t extend nativesdk recipes&quot;)<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 if bb.data.inherits_class(&#39;allarch&=
#39;, e.data) and not bb.data.inherits_class(&#39;packagegroup&#39;, e.data=
):<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 if bb.data.inherits_class(&#39;allarch&=
#39;, e.data) and not d.getVar(&#39;MULTILIB_VARIANTS&#39;) \<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 and not bb.data.inherits_=
class(&#39;packagegroup&#39;, e.data):<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise bb.parse=
.SkipRecipe(&quot;Don&#39;t extend allarch recipes which are not packagegro=
ups&quot;)<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# Expand this since this won=
&#39;t work correctly once we set a multilib into place<br>
&gt;&gt;&gt;&gt;&gt; diff --git a/meta/classes/multilib_global.bbclass b/me=
ta/classes/multilib_global.bbclass<br>
&gt;&gt;&gt;&gt;&gt; index d2ec1adfea..1bb62427b0 100644<br>
&gt;&gt;&gt;&gt;&gt; --- a/meta/classes/multilib_global.bbclass<br>
&gt;&gt;&gt;&gt;&gt; +++ b/meta/classes/multilib_global.bbclass<br>
&gt;&gt;&gt;&gt;&gt; @@ -165,9 +165,7 @@ python multilib_virtclass_handler_=
global () {<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if bb.data.inherits_class(&#=
39;kernel&#39;, e.data) or \<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.data.inh=
erits_class(&#39;module-base&#39;, e.data) or \<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (bb.data.in=
herits_class(&#39;allarch&#39;, e.data) and\<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0not b=
b.data.inherits_class(&#39;packagegroup&#39;, e.data)):<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.data.inh=
erits_class(&#39;module-base&#39;, e.data):<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
variants =3D (e.data.getVar(&quot;MULTILIB_VARIANTS&quot;) or &quot;&quot;)=
.split()<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
import oe.classextend<br>
&gt;&gt;&gt;&gt;&gt; diff --git a/meta/classes/package.bbclass b/meta/class=
es/package.bbclass<br>
&gt;&gt;&gt;&gt;&gt; index 0b6f65a855..d1e9138c66 100644<br>
&gt;&gt;&gt;&gt;&gt; --- a/meta/classes/package.bbclass<br>
&gt;&gt;&gt;&gt;&gt; +++ b/meta/classes/package.bbclass<br>
&gt;&gt;&gt;&gt;&gt; @@ -494,7 +494,8 @@ def get_package_mapping (pkg, base=
pkg, d):<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if key in data:<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Have to avoi=
d undoing the write_extra_pkgs(global_variants...)<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if bb.data.inherits_class=
(&#39;allarch&#39;, d) and data[key] =3D=3D basepkg:<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if bb.data.inherits_class=
(&#39;allarch&#39;, d) and not d.getVar(&#39;MULTILIB_VARIANTS&#39;) \<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 and data[ke=
y] =3D=3D basepkg:<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
return pkg<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return data[ke=
y]<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0<br>
&gt;&gt;&gt;&gt;&gt; @@ -1413,7 +1414,8 @@ fi<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if bb.data.inherits_class(&#=
39;kernel&#39;, d) or bb.data.inherits_class(&#39;module-base&#39;, d):<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_extra_pk=
gs(variants, pn, packages, pkgdatadir)<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 if (bb.data.inherits_class(&#39;allarch=
&#39;, d) and not bb.data.inherits_class(&#39;packagegroup&#39;, d)):<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 if bb.data.inherits_class(&#39;allarch&=
#39;, d) and not variants \<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 and not bb.data.inherits_=
class(&#39;packagegroup&#39;, d):<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_extra_pk=
gs(global_variants, pn, packages, pkgdatadir)<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0workdir =3D d.getVar(&#39;WO=
RKDIR&#39;)<br>
&gt;&gt;&gt;&gt;&gt; @@ -1502,7 +1504,8 @@ fi<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if bb.data.inherits_class(&#=
39;kernel&#39;, d) or bb.data.inherits_class(&#39;module-base&#39;, d):<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_extra_ru=
ntime_pkgs(variants, packages, pkgdatadir)<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 if bb.data.inherits_class(&#39;allarch&=
#39;, d) and not bb.data.inherits_class(&#39;packagegroup&#39;, d):<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 if bb.data.inherits_class(&#39;allarch&=
#39;, d) and not variants \<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 and not bb.data.inherits_=
class(&#39;packagegroup&#39;, d):<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_extra_ru=
ntime_pkgs(global_variants, packages, pkgdatadir)<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0}<br>
&gt;&gt;&gt;&gt;&gt; -- <br>
&gt;&gt;&gt;&gt;&gt; 2.18.0<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; -- <br>
&gt;&gt;&gt;&gt;&gt; _______________________________________________<br>
&gt;&gt;&gt;&gt;&gt; Openembedded-core mailing list<br>
&gt;&gt;&gt;&gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded=
.org" target=3D"_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt;&gt;&gt;&gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/listi=
nfo/openembedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.op=
enembedded.org/mailman/listinfo/openembedded-core</a><br>
&gt;&gt;&gt;&gt; -- <br>
&gt;&gt;&gt;&gt; Martin &#39;JaMa&#39; Jansa=C2=A0 =C2=A0 =C2=A0jabber: <a =
href=3D"mailto:Martin.Jansa@gmail.com" target=3D"_blank">Martin.Jansa@gmail=
.com</a><br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; -- <br>
&gt;&gt;&gt; Martin &#39;JaMa&#39; Jansa=C2=A0 =C2=A0 =C2=A0jabber: <a href=
=3D"mailto:Martin.Jansa@gmail.com" target=3D"_blank">Martin.Jansa@gmail.com=
</a><br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; -- <br>
&gt;&gt; Martin &#39;JaMa&#39; Jansa=C2=A0 =C2=A0 =C2=A0jabber: <a href=3D"=
mailto:Martin.Jansa@gmail.com" target=3D"_blank">Martin.Jansa@gmail.com</a>=
<br>
&gt;<br>
&gt;<br>
<br>
-- <br>
Regards,<br>
Neil | Kai Kang<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000352c06057fa9a1de--
