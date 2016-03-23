Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7072A60132
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 14:28:59 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id a184so1173822oig.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 07:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=An32POrC35jrCSLgDV8lBhFAmugIm9IP7ZE2pk35vrA=;
	b=Q2K9+pYPZTI/uE6tS1NuwfDqwpxYp/emYTFs2gVUiNcPYXSVkMfT7T5F39+MGbJbBx
	321o861yBs5dFRYOIWWQXUCgkbHFy55YINtVNsi6tipbly76FZUFTpYe2yNA1PGXQOTE
	9FWFQaY56LSrJOKQMVGwRFKdGmqTM0BoO3iG3a6ZGA5bUz/F+ktfa7GPE8I88ARg5/AG
	hhpHzQjjCfLPbpTbvDegVKKHNA7sNM0xgR4u+TtG9kwEh5+8tJlfqfGNI+TYAPZPdCjo
	gHUZ3o46RLEU4hrtNPq5IFi0B6LHx734KFLgQw4k0lsKgpFu227hgIG6V+zrNTC65lzj
	3DRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=An32POrC35jrCSLgDV8lBhFAmugIm9IP7ZE2pk35vrA=;
	b=HU4m+JexODbNVKXd+xEtDgah5sjUMn4U/3vZpW4jb3yeFMViy/53uEVME86p3ppAOn
	Qihqe7O2QC2sjLWt1XEOpNd3rUegvQPQmW3Fsh9pPOTeXZ/0s3S5wY1pRtMlWhm53eqB
	2Y2bZOVQ+u0BqaaA2gplh+/vvxBKJeJmp4dIJwmmfOvdj/rLEsqFRt1xwNqdY9sZ47gC
	DNQtueOQ6iCOm8+hSy3Z1g4myyt0eVCNncTB6Os8vYfn6ZBK5HwupT7VXdda/4Vb3kxs
	8+u1wCjgu9smiBDlOvd7LwZrhbpUGvbMg/50Qqw5Foi0zvEhqZSE3eG5dJMMxwFzAYnK
	1GmA==
X-Gm-Message-State: AD7BkJIMvSeB0QlG0y+wldT2Q48DkjIBcQLhE+jWkJQ4E7LgTDkbqdmDrF0uqamnaRTKR9jhLcNX7TStqo8waQ==
MIME-Version: 1.0
X-Received: by 10.157.51.125 with SMTP id u58mr1716631otd.119.1458743339735;
	Wed, 23 Mar 2016 07:28:59 -0700 (PDT)
Received: by 10.157.8.248 with HTTP; Wed, 23 Mar 2016 07:28:59 -0700 (PDT)
In-Reply-To: <56F1F173.7070504@windriver.com>
References: <cover.1458638728.git.hongxu.jia@windriver.com>
	<fe57bd778472c15f247fbf20491221bdadad8b37.1458638728.git.hongxu.jia@windriver.com>
	<CADkTA4PbOMTOAEyA3GSPFiiiimOaQKB-Sv_TCtsGBmbiET-yCw@mail.gmail.com>
	<56F17064.6040507@windriver.com>
	<CADkTA4NNeTO4LH1s440mxw=RVuWkPFiaWWt3Z6twFH6ugypjGA@mail.gmail.com>
	<56F1F173.7070504@windriver.com>
Date: Wed, 23 Mar 2016 10:28:59 -0400
Message-ID: <CADkTA4NnAugXBRddkA5ZhbSMXsqx778bPH1U_7qtK0YetXn69w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 02/16] kernel.bbclass: fix buildpath QA issue
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
X-List-Received-Date: Wed, 23 Mar 2016 14:28:59 -0000
Content-Type: multipart/alternative; boundary=001a113e2984956142052eb8268c

--001a113e2984956142052eb8268c
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 22, 2016 at 9:29 PM, Hongxu Jia <hongxu.jia@windriver.com>
wrote:

> On 03/23/2016 12:49 AM, Bruce Ashfield wrote:
>
>
>
> On Tue, Mar 22, 2016 at 12:18 PM, Mark Hatle <mark.hatle@windriver.com>
> wrote:
>
>> On 3/22/16 7:21 AM, Bruce Ashfield wrote:
>> >
>> >
>> > On Tue, Mar 22, 2016 at 8:12 AM, Hongxu Jia <
>> <hongxu.jia@windriver.com>hongxu.jia@windriver.com
>> > <mailto: <hongxu.jia@windriver.com>hongxu.jia@windriver.com>> wrote:
>> >
>> >     Since CFLAGS CPPFLAGS CXXFLAGS has been unset, variable DEBUG_FLAGS
>> could
>> >     not been passed to compiler, so we explicitly add DEBUG_FLAGS to CC
>> to
>> >     replace build path with target path.
>> >
>> >
>> > Can you be more explicit here ? What is typically contained in
>> DEBUG_FLAGS ? The
>> > kernel builds its own compiler line and flags, so anything you are
>> setting from this
>> > environment, should not be leaking into the kernel build.
>> >
>> > .. which leaves me wondering, what exactly is in DEBUG_FLAGS, and how
>> is it
>> > actually fixing the QA issue ?
>>
>> The specific debug flag in question is being added to remap the on-disk
>> path to
>> the path we want the items to look like from a debugging point of view.
>>
>> The typical format of DEBUG_FLAGS is something like:
>>
>> DEBUG_FLAGS ?= "-g -feliminate-unused-debug-types"
>>
>> This was recently updated to include the remapping:
>>
>>  DEBUG_FLAGS ?= "-g -feliminate-unused-debug-types \
>>                  -fdebug-prefix-map=${WORKDIR}=/usr/src/debug \
>>                  -fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
>>                  -fdebug-prefix-map=${STAGING_DIR_HOST}= \
>>
>> The idea is the WORKDIR is replaced with '/usr/src/debug' inside of the
>> binary
>> and any debug symbol references.  This makes it much easier for the
>> system to
>> work with supplied debug sources/symbols.
>>
>> I'm not sure you want to use DEBUG_FLAGS since anything can be put in
>> there....
>>
>> Application space code should always use the DEBUG_FLAGS, or I think it's
>> likely
>> a bug.
>>
>> The kernel though should probably define it's own flag(s).  Most likely
>> you'll
>> want something simple like:
>>
>> -fdebug-prefix-map=${WORKDIR}=/usr/src/debug
>>
>
>
> I can see that.
>
> What outputs of the kernel build need this remapping ? The userspace parts
> ?
> Something else ?
>
>
> While building kernel, there are many build paths which caused by macro
> __FILE__.
> Once you invoke marco WARN_ON in kernel/module, there will be a __FILE__
> used.
> ....
> #define WARN_ON(condition) ({                                           \
>         int __ret_warn_on = !!(condition);                              \
>         if (unlikely(__ret_warn_on))                                    \
>                 __WARN();                                               \
>         unlikely(__ret_warn_on);                                        \
> })
>
> #define __WARN()                warn_slowpath_null(__FILE__, __LINE__)
> ....
>


Aha. Honestly, I've always gotten different paths from the kernel debug
info (or many
applications) via __FILE__, and never considered it much of a problem to go
and
find the source file :) .. but I digress.



>
> That's why I add -fdebug-prefix-map to kernel build. I original added a
> new option
> -ffile-prefix-map for gcc to remap __FILE__, and enhance -fdebug-prefix-map
> to replace -ffile-prefix-map to compat with external toolchain.
>
> The point is that we patch the kernel build, or make a specific Kconfig
> option, or
> something similar to that, versus leaking our build flags into the kernel
> build or
> "bad things can happen".
>
>
> If the leaking idea is bad, would you like to accept '-fdebug-prefix-map'
> as
> kernel's private?
>

Either you patch the kernel, and make it a Kconfig option for the mapping,
or we pass it
in as an intrinsic part of the CC definition, or some variant of those.

Bruce


>
> Or suggestions else to fix the build path in kernel?
>
> //Hongxu
>
>
> So I'm sure the solution in the build is the same, but passing flags via a
> general
> mechanism like I saw in the patch is generally not a good idea.
>
> Bruce
>
>
>>
>> Then all of the internal references to WORKDIR will be replaced with
>> '/usr/src/debug' which cross gdb can 'map' or on-target will actually
>> look in
>> that location.  (A corresponding '-dbg' package should be provided with
>> the
>> matching compilation sources at the local specified.)
>>
>> --Mark
>>
>> > Bruce
>> >
>> >
>> >
>> >     [YOCTO #7058]
>> >
>> >     Signed-off-by: Hongxu Jia < <hongxu.jia@windriver.com>
>> hongxu.jia@windriver.com
>> >     <mailto:hongxu.jia@windriver.com>>
>> >     ---
>> >      meta/classes/kernel.bbclass | 4 ++--
>> >      1 file changed, 2 insertions(+), 2 deletions(-)
>> >
>> >     diff --git a/meta/classes/kernel.bbclass
>> b/meta/classes/kernel.bbclass
>> >     index c3eab50..d357ccf 100644
>> >     --- a/meta/classes/kernel.bbclass
>> >     +++ b/meta/classes/kernel.bbclass
>> >     @@ -207,7 +207,7 @@ kernel_do_compile() {
>> >                     copy_initramfs
>> >
>> >
>>  use_alternate_initrd=CONFIG_INITRAMFS_SOURCE=${B}/usr/${INITRAMFS_IMAGE}-${MACHINE}.cpio
>> >             fi
>> >     -       oe_runmake ${KERNEL_IMAGETYPE_FOR_MAKE}
>> ${KERNEL_ALT_IMAGETYPE}
>> >     CC="${KERNEL_CC}" LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
>> $use_alternate_initrd
>> >     +       oe_runmake ${KERNEL_IMAGETYPE_FOR_MAKE}
>> ${KERNEL_ALT_IMAGETYPE}
>> >     CC="${KERNEL_CC} ${DEBUG_FLAGS}" LD="${KERNEL_LD}"
>> ${KERNEL_EXTRA_ARGS}
>> >     $use_alternate_initrd
>> >             if test "${KERNEL_IMAGETYPE_FOR_MAKE}.gz" =
>> "${KERNEL_IMAGETYPE}"; then
>> >                     gzip -9c < "${KERNEL_IMAGETYPE_FOR_MAKE}" >
>> "${KERNEL_OUTPUT}"
>> >             fi
>> >     @@ -216,7 +216,7 @@ kernel_do_compile() {
>> >      do_compile_kernelmodules() {
>> >             unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
>> >             if (grep -q -i -e '^CONFIG_MODULES=y$' ${B}/.config); then
>> >     -               oe_runmake -C ${B} ${PARALLEL_MAKE} modules
>> >     CC="${KERNEL_CC}" LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
>> >     +               oe_runmake -C ${B} ${PARALLEL_MAKE} modules
>> CC="${KERNEL_CC}
>> >     ${DEBUG_FLAGS}" LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
>> >
>> >                     # Module.symvers gets updated during the
>> >                     # building of the kernel modules. We need to
>> >     --
>> >     1.9.1
>> >
>> >     --
>> >     _______________________________________________
>> >     Openembedded-core mailing list
>> >     Openembedded-core@lists.openembedded.org
>> >     <mailto:Openembedded-core@lists.openembedded.org>
>> >     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> >
>> >
>> >
>> >
>> > --
>> > "Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its
>> > end"
>>
>>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end"
>
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a113e2984956142052eb8268c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Mar 22, 2016 at 9:29 PM, Hongxu Jia <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:hongxu.jia@windriver.com" target=3D"_blank">hongxu.jia@windriv=
er.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF" text=3D"#000000"><div><div class=3D"h5">
    <div>On 03/23/2016 12:49 AM, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr"><br>
        <div class=3D"gmail_extra"><br>
          <div class=3D"gmail_quote">On Tue, Mar 22, 2016 at 12:18 PM,
            Mark Hatle <span dir=3D"ltr">&lt;<a href=3D"mailto:mark.hatle@w=
indriver.com" target=3D"_blank">mark.hatle@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><span>On 3/22/16 7:21 AM, Bruce =
Ashfield wrote:<br>
                &gt;<br>
                &gt;<br>
                &gt; On Tue, Mar 22, 2016 at 8:12 AM, Hongxu Jia &lt;<a hre=
f=3D"mailto:hongxu.jia@windriver.com" target=3D"_blank"></a><a href=3D"mail=
to:hongxu.jia@windriver.com" target=3D"_blank">hongxu.jia@windriver.com</a>=
<br>
              </span><span>&gt; &lt;mailto:<a href=3D"mailto:hongxu.jia@win=
driver.com" target=3D"_blank"></a><a href=3D"mailto:hongxu.jia@windriver.co=
m" target=3D"_blank">hongxu.jia@windriver.com</a>&gt;&gt;
                wrote:<br>
                &gt;<br>
                &gt;=C2=A0 =C2=A0 =C2=A0Since CFLAGS CPPFLAGS CXXFLAGS has =
been unset,
                variable DEBUG_FLAGS could<br>
                &gt;=C2=A0 =C2=A0 =C2=A0not been passed to compiler, so we =
explicitly
                add DEBUG_FLAGS to CC to<br>
                &gt;=C2=A0 =C2=A0 =C2=A0replace build path with target path=
.<br>
                &gt;<br>
                &gt;<br>
                &gt; Can you be more explicit here ? What is typically
                contained in DEBUG_FLAGS ? The<br>
                &gt; kernel builds its own compiler line and flags, so
                anything you are setting from this<br>
                &gt; environment, should not be leaking into the kernel
                build.<br>
                &gt;<br>
                &gt; .. which leaves me wondering, what exactly is in
                DEBUG_FLAGS, and how is it<br>
                &gt; actually fixing the QA issue ?<br>
                <br>
              </span>The specific debug flag in question is being added
              to remap the on-disk path to<br>
              the path we want the items to look like from a debugging
              point of view.<br>
              <br>
              The typical format of DEBUG_FLAGS is something like:<br>
              <br>
              DEBUG_FLAGS ?=3D &quot;-g -feliminate-unused-debug-types&quot=
;<br>
              <br>
              This was recently updated to include the remapping:<br>
              <br>
              =C2=A0DEBUG_FLAGS ?=3D &quot;-g -feliminate-unused-debug-type=
s \<br>
              =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
              =C2=A0-fdebug-prefix-map=3D${WORKDIR}=3D/usr/src/debug \<br>
              =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0-fdebug-prefix-map=3D${STAGING_DIR_NATIVE}=3D
              \<br>
              =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0-fdebug-prefix-map=3D${STAGING_DIR_HOST}=3D \<br>
              <br>
              The idea is the WORKDIR is replaced with &#39;/usr/src/debug&=
#39;
              inside of the binary<br>
              and any debug symbol references.=C2=A0 This makes it much
              easier for the system to<br>
              work with supplied debug sources/symbols.<br>
              <br>
              I&#39;m not sure you want to use DEBUG_FLAGS since anything
              can be put in there....<br>
              <br>
              Application space code should always use the DEBUG_FLAGS,
              or I think it&#39;s likely<br>
              a bug.<br>
              <br>
              The kernel though should probably define it&#39;s own
              flag(s).=C2=A0 Most likely you&#39;ll<br>
              want something simple like:<br>
              <br>
              -fdebug-prefix-map=3D${WORKDIR}=3D/usr/src/debug<br>
            </blockquote>
            <div><br>
              <br>
            </div>
            <div>I can see that.<br>
              <br>
            </div>
            <div>What outputs of the kernel build need this remapping ?
              The userspace parts ?<br>
            </div>
            <div>Something else ?<br>
              <br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br></div></div>
    While building kernel, there are many build paths which caused by
    macro __FILE__.<br>
    Once you invoke marco WARN_ON in kernel/module, there will be a
    __FILE__ used.<br>
    ....<br>
    #define WARN_ON(condition)
    ({=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \<br>
    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int __ret_warn_on =3D
    !!(condition);=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \<br>
    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if
    (unlikely(__ret_warn_on))=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 \<br>
    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0
    __WARN();=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \<br>
    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
    unlikely(__ret_warn_on);=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \<br>
    })<br>
    <br>
    #define __WARN()=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 warn_slowpath_null(__FILE__,
    __LINE__)<br>
    ....<br></div></blockquote><div><br></div><div><br></div><div>Aha. Hone=
stly, I&#39;ve always gotten different paths from the kernel debug info (or=
 many</div><div>applications) via __FILE__, and never considered it much of=
 a problem to go and</div><div>find the source file :) .. but I digress.</d=
iv><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div bgc=
olor=3D"#FFFFFF" text=3D"#000000">
    <br>
    That&#39;s why I add -fdebug-prefix-map to kernel build. I original
    added a new option<br>
    -ffile-prefix-map for gcc to remap __FILE__, and enhance
    -fdebug-prefix-map<br>
    to replace -ffile-prefix-map to compat with external toolchain.<span cl=
ass=3D""><br>
    <br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_extra">
          <div class=3D"gmail_quote">
            <div>The point is that we patch the kernel build, or make a
              specific Kconfig option, or<br>
            </div>
            <div>something similar to that, versus leaking our build
              flags into the kernel build or<br>
            </div>
            <div>&quot;bad things can happen&quot;.<br>
              <br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br></span>
    If the leaking idea is bad, would you like to accept
    &#39;-fdebug-prefix-map&#39; as<br>
    kernel&#39;s private?<br></div></blockquote><div><br></div><div>Either =
you patch the kernel, and make it a Kconfig option for the mapping, or we p=
ass it</div><div>in as an intrinsic part of the CC definition, or some vari=
ant of those.</div><div><br></div><div>Bruce</div><div>=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex"><div bgcolor=3D"#FFFFFF" text=3D"#000000">
    <br>
    Or suggestions else to fix the build path in kernel?<span class=3D"HOEn=
Zb"><font color=3D"#888888"><br>
    <br>
    //Hongxu</font></span><div><div class=3D"h5"><br>
    <br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_extra">
          <div class=3D"gmail_quote">
            <div>So I&#39;m sure the solution in the build is the same, but
              passing flags via a general<br>
            </div>
            <div>mechanism like I saw in the patch is generally not a
              good idea.<br>
              <br>
            </div>
            <div>Bruce<br>
            </div>
            <div>=C2=A0</div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">
              <br>
              Then all of the internal references to WORKDIR will be
              replaced with<br>
              &#39;/usr/src/debug&#39; which cross gdb can &#39;map&#39; or=
 on-target
              will actually look in<br>
              that location.=C2=A0 (A corresponding &#39;-dbg&#39; package =
should be
              provided with the<br>
              matching compilation sources at the local specified.)<br>
              <br>
              --Mark<br>
              <span><br>
                &gt; Bruce<br>
                &gt;<br>
                &gt;<br>
                &gt;<br>
                &gt;=C2=A0 =C2=A0 =C2=A0[YOCTO #7058]<br>
                &gt;<br>
                &gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Hongxu Jia &lt;<a hr=
ef=3D"mailto:hongxu.jia@windriver.com" target=3D"_blank"></a><a href=3D"mai=
lto:hongxu.jia@windriver.com" target=3D"_blank">hongxu.jia@windriver.com</a=
><br>
              </span>&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:h=
ongxu.jia@windriver.com" target=3D"_blank">hongxu.jia@windriver.com</a>&gt;=
&gt;<br>
              <div>
                <div>&gt;=C2=A0 =C2=A0 =C2=A0---<br>
                  &gt;=C2=A0 =C2=A0 =C2=A0 meta/classes/kernel.bbclass | 4 =
++--<br>
                  &gt;=C2=A0 =C2=A0 =C2=A0 1 file changed, 2 insertions(+),=
 2
                  deletions(-)<br>
                  &gt;<br>
                  &gt;=C2=A0 =C2=A0 =C2=A0diff --git a/meta/classes/kernel.=
bbclass
                  b/meta/classes/kernel.bbclass<br>
                  &gt;=C2=A0 =C2=A0 =C2=A0index c3eab50..d357ccf 100644<br>
                  &gt;=C2=A0 =C2=A0 =C2=A0--- a/meta/classes/kernel.bbclass=
<br>
                  &gt;=C2=A0 =C2=A0 =C2=A0+++ b/meta/classes/kernel.bbclass=
<br>
                  &gt;=C2=A0 =C2=A0 =C2=A0@@ -207,7 +207,7 @@ kernel_do_com=
pile() {<br>
                  &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0copy_initramfs<br>
                  &gt;<br>
                  &gt;=C2=A0 =C2=A0
=C2=A0use_alternate_initrd=3DCONFIG_INITRAMFS_SOURCE=3D${B}/usr/${INITRAMFS=
_IMAGE}-${MACHINE}.cpio<br>
                  &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br=
>
                  &gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_ru=
nmake
                  ${KERNEL_IMAGETYPE_FOR_MAKE} ${KERNEL_ALT_IMAGETYPE}<br>
                  &gt;=C2=A0 =C2=A0 =C2=A0CC=3D&quot;${KERNEL_CC}&quot; LD=
=3D&quot;${KERNEL_LD}&quot;
                  ${KERNEL_EXTRA_ARGS} $use_alternate_initrd<br>
                  &gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_ru=
nmake
                  ${KERNEL_IMAGETYPE_FOR_MAKE} ${KERNEL_ALT_IMAGETYPE}<br>
                  &gt;=C2=A0 =C2=A0 =C2=A0CC=3D&quot;${KERNEL_CC} ${DEBUG_F=
LAGS}&quot;
                  LD=3D&quot;${KERNEL_LD}&quot; ${KERNEL_EXTRA_ARGS}<br>
                  &gt;=C2=A0 =C2=A0 =C2=A0$use_alternate_initrd<br>
                  &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if te=
st
                  &quot;${KERNEL_IMAGETYPE_FOR_MAKE}.gz&quot; =3D
                  &quot;${KERNEL_IMAGETYPE}&quot;; then<br>
                  &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0gzip -9c &lt;
                  &quot;${KERNEL_IMAGETYPE_FOR_MAKE}&quot; &gt; &quot;${KER=
NEL_OUTPUT}&quot;<br>
                  &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br=
>
                  &gt;=C2=A0 =C2=A0 =C2=A0@@ -216,7 +216,7 @@ kernel_do_com=
pile() {<br>
                  &gt;=C2=A0 =C2=A0 =C2=A0 do_compile_kernelmodules() {<br>
                  &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unset=
 CFLAGS CPPFLAGS CXXFLAGS
                  LDFLAGS MACHINE<br>
                  &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (g=
rep -q -i -e
                  &#39;^CONFIG_MODULES=3Dy$&#39; ${B}/.config); then<br>
                  &gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake -C ${B}
                  ${PARALLEL_MAKE} modules<br>
                  &gt;=C2=A0 =C2=A0 =C2=A0CC=3D&quot;${KERNEL_CC}&quot; LD=
=3D&quot;${KERNEL_LD}&quot;
                  ${KERNEL_EXTRA_ARGS}<br>
                  &gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake -C ${B}
                  ${PARALLEL_MAKE} modules CC=3D&quot;${KERNEL_CC}<br>
                  &gt;=C2=A0 =C2=A0 =C2=A0${DEBUG_FLAGS}&quot; LD=3D&quot;$=
{KERNEL_LD}&quot;
                  ${KERNEL_EXTRA_ARGS}<br>
                  &gt;<br>
                  &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0# Module.symvers gets updated
                  during the<br>
                  &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0# building of the kernel
                  modules. We need to<br>
                  &gt;=C2=A0 =C2=A0 =C2=A0--<br>
                  &gt;=C2=A0 =C2=A0 =C2=A01.9.1<br>
                  &gt;<br>
                  &gt;=C2=A0 =C2=A0 =C2=A0--<br>
                  &gt;=C2=A0 =C2=A0
                  =C2=A0_______________________________________________<br>
                  &gt;=C2=A0 =C2=A0 =C2=A0Openembedded-core mailing list<br=
>
                  &gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"mailto:Openembedded-co=
re@lists.openembedded.org" target=3D"_blank">Openembedded-core@lists.openem=
bedded.org</a><br>
                </div>
              </div>
              &gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:Openembe=
dded-core@lists.openembedded.org" target=3D"_blank">Openembedded-core@lists=
.openembedded.org</a>&gt;<br>
              <div>
                <div>&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://lists.openem=
bedded.org/mailman/listinfo/openembedded-core" rel=3D"noreferrer" target=3D=
"_blank">http://lists.openembedded.org/mailman/listinfo/openembedded-core</=
a><br>
                  &gt;<br>
                  &gt;<br>
                  &gt;<br>
                  &gt;<br>
                  &gt; --<br>
                  &gt; &quot;Thou shalt not follow the NULL pointer, for
                  chaos and madness await thee at its<br>
                  &gt; end&quot;<br>
                  <br>
                </div>
              </div>
            </blockquote>
          </div>
          <br>
          <br clear=3D"all">
          <br>
          -- <br>
          <div>&quot;Thou shalt not follow the NULL
            pointer, for chaos and madness await thee at its end&quot;</div=
>
        </div>
      </div>
    </blockquote>
    <br>
  </div></div></div>

</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer, for chao=
s and madness await thee at its end&quot;</div>
</div></div>

--001a113e2984956142052eb8268c--
