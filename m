Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com
	[209.85.218.42])
	by mail.openembedded.org (Postfix) with ESMTP id 6485F77116
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Apr 2016 08:33:36 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id w85so8867100oiw.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Apr 2016 01:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=LXrl4UBgzQi3i6M3ykkAuhFLsAA6aJDByk4FpWZ7qUA=;
	b=OcHhVM6NEPgtzeBCjwwNFXPYOz8YJkQP+7k8BQVH23BzOrVC2BwcVp2064tSzYZGCh
	1ssHAWKbIhrkmxwFGJ1PPWM15BGH8gv4Hxz6m7HR3CyDVmimTcK8yZqHvyDZDjsIEGrs
	SoueOuT1MOoHQMZETyobfnTh7sVumX5fOjjFC+edqsaoI1fp96GarBRH8LD8BpOgbggE
	QNzFTY2TK+0u76z9/uXrb2XsaW7FX9rBlUv11PlbVsBc58aa9HpSrPSUiPJO9wI9S8hD
	q1wwRGFT7YVk2kGvpvGqXVKBljXfoBB9RpsbsjDQ/eOqUXsvT44fk2/Tlpx1HPOnQJgz
	wkGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=LXrl4UBgzQi3i6M3ykkAuhFLsAA6aJDByk4FpWZ7qUA=;
	b=kTkEju1/zsrCx1aKIIQRR5Upi9FHoD5RFAwu8/5nYF0Qs6zZ0PuVVcKlq48kyvODWf
	2lsX/Fn27ppCqF8/awMgwWRMmbyn1DWXqUP6Iw1tEVLJXzOH2e+8Jp6c2SbE2v+xlKdD
	1iUOgEn/xc+qPLiYmeZxDb+z6ZpBDkpOn5NIHgSAncLUV1mheOG1SRdSlumlOifzKB9Q
	diXOJeoN6Atv25aVqz4n1ET+It59JPsUT28Liz4v+Bs02OyP5rGj1SSHOGnUT7C9chXe
	SSHBsc1QBykJ6lQz6JiX5FuBau6JT8fuvS6kgYs7if2hUOMd7p8DG56EMqhkQS9FTuCl
	hNlw==
X-Gm-Message-State: AD7BkJL2gGzCPWD3kFUFqFhzScnGHf2AemrcCmyXSoRe7dz9EPFy00cBGgx9yOjMCLP2UcAIOQqs/7eVOiePqQ==
MIME-Version: 1.0
X-Received: by 10.157.47.207 with SMTP id b15mr13792457otd.118.1459845217137; 
	Tue, 05 Apr 2016 01:33:37 -0700 (PDT)
Received: by 10.157.5.101 with HTTP; Tue, 5 Apr 2016 01:33:37 -0700 (PDT)
In-Reply-To: <57035E46.3090707@windriver.com>
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
Date: Tue, 5 Apr 2016 04:33:37 -0400
Message-ID: <CADkTA4Ojrn5DddPnAK2Ss6k0F2E+i5r0f68jN7F49WTAFa6pEg@mail.gmail.com>
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
X-List-Received-Date: Tue, 05 Apr 2016 08:33:38 -0000
Content-Type: multipart/alternative; boundary=001a11353a2c983d32052fb8b38d

--001a11353a2c983d32052fb8b38d
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 5, 2016 at 2:42 AM, Robert Yang <liezhi.yang@windriver.com>
wrote:

>
>
> On 04/05/2016 02:33 PM, Bruce Ashfield wrote:
>
>>
>>
>> On Mon, Apr 4, 2016 at 10:48 PM, Robert Yang <liezhi.yang@windriver.com
>> <mailto:liezhi.yang@windriver.com>> wrote:
>>
>>
>>
>>     On 04/05/2016 10:31 AM, Bruce Ashfield wrote:
>>
>>
>>
>>         On Mon, Apr 4, 2016 at 9:53 PM, Robert Yang <
>> liezhi.yang@windriver.com
>>         <mailto:liezhi.yang@windriver.com>
>>         <mailto:liezhi.yang@windriver.com <mailto:
>> liezhi.yang@windriver.com>>>
>>         wrote:
>>
>>
>>              Hi Bruce,
>>
>>              How many union fs on Linux, please? AFAIK:
>>              * unionfs: not supported by kernel any more.
>>              * aufs
>>              * overlayfs
>>
>>              If aufs and overlayfs are conflicted, how about:
>>
>>              KERNEL_UNION_FS ?= "features/overlayfs/overlayfs.scc"
>>
>>              KERNEL_EXTRA_FEATURES ?= "[snip] ${KERNEL_UNION_FS}"
>>
>>              I think that we really need a way to make iso/hddimg work by
>> default
>>              to enhance the OOBE.
>>
>>
>>         That sort of mechanism can work, but not if it is enabled by
>> default.
>>         out of box
>>         experience
>>         is one thing, but there are plenty of boot and image types that
>> don't need a
>>         unionfs, and
>>         we can't force these as =y for those image types.
>>
>>         If we make a modular config, and a built-in config, we could pick
>> the
>>         modular
>>         config by
>>         default, and then have the package list for the images that need
>> them,
>>         rdepend
>>         on the
>>         appropriate modules.
>>
>>
>>     Sounds good, so how about:
>>
>>     1) Update kernel to make overlayfs as module rather than builtin
>>
>>
>> Having two fragments make sense. one for built in, and one that is
>> modules.
>> Since these are
>> distinct use case both sets of configuration are reasonable.
>>
>
> How about this:
>
> diff --git a/ktypes/preempt-rt/preempt-rt.cfg
> b/ktypes/preempt-rt/preempt-rt.cfg
> index 4c62804..28ad8cf 100644
> --- a/ktypes/preempt-rt/preempt-rt.cfg
> +++ b/ktypes/preempt-rt/preempt-rt.cfg
> @@ -1116,3 +1116,5 @@ CONFIG_CRYPTO_TEST=m
>  #
>  CONFIG_LIBCRC32C=m
>  CONFIG_ZLIB_DEFLATE=m
> +
> +CONFIG_OVERLAY_FS=m
> diff --git a/ktypes/standard/standard.cfg b/ktypes/standard/standard.cfg
> index b3dbde5..3dabf49 100644
> --- a/ktypes/standard/standard.cfg
> +++ b/ktypes/standard/standard.cfg
> @@ -1108,3 +1108,5 @@ CONFIG_LIBCRC32C=m
>  CONFIG_ZLIB_DEFLATE=m
>
>  CONFIG_SHMEM=y
> +
> +CONFIG_OVERLAY_FS=m
>
>
Nope. See my follow up to the linux-yocto patch .. I was more detailed in
my follow up
there.


>
>
>>     2) let core-image-minimal-initramfs RDEPENEDS on the module.
>>
>>
>> I'd still prefer that this be set in a distro or optional layer. Since why
>>
>
> The live/iso/hddimg is supported by oe-core, all of them are in oe-core
> layer,
> I'm afraid that we can't add it in an extra layer or bbappend.
>
>
Why not ? There are just as many image types that don't need this support.
Why should
it be universally build and enabled for a feature that is only used by some
boot types.

You are missing the point, and there's no justification to globally enable
it.

What about flash boot, what about boot from specific MTD devices, etc, etc,
should
they all be enabled by default in the base configs .. just in case someone
boots that
way ? We'll end up with a giant kernel with everything enabled or as
modules if we
cover all the cases. These need to be specifically requested and triggered.

Just because you are concerned with live iso boot, doesn't mean that others
are,
and that we should have the overhead everywhere.


>
> should core image
>> minimal be the target for this ? There are any number of targets that
>> might be
>> used for
>> live boot.
>>
>
> All of them are in oe-core layer, core-image-minimal-initramfs.bb is the
> default live image in oe-core, I think that add kerne-module-overlay to
> its INSTALL is reasonable.
>

But that shouldn't need overlayfs for all configs. I boot initramfs kernels
all the time, I have no need
for overlay filesystems on those boards.

But yes, if you enable a module based overlayfs fragment, and then install
the
module via an install, it should be ok, since it can be overridden.

I hope you are seeing the point of not enabling kernel options "just in
case", and why
this sort of thing needs to be only built and installed when it is truly
needed.

Bruce


>
> If there are other layers which have their own live image, then they can
> add
> it to their INSTALL.
>
>
> // Robert
>
>
>> Bruce
>>
>>     // Robert
>>
>>
>>         Bruce
>>
>>
>>              // Robert
>>
>>              On 04/04/2016 07:56 AM, Bruce Ashfield wrote:
>>
>>
>>
>>                  On Sun, Apr 3, 2016 at 5:46 PM, Richard Purdie
>>                  <richard.purdie@linuxfoundation.org
>>         <mailto:richard.purdie@linuxfoundation.org>
>>                  <mailto:richard.purdie@linuxfoundation.org
>>         <mailto:richard.purdie@linuxfoundation.org>>
>>                  <mailto:richard.purdie@linuxfoundation.org
>>         <mailto:richard.purdie@linuxfoundation.org>
>>                  <mailto:richard.purdie@linuxfoundation.org
>>         <mailto:richard.purdie@linuxfoundation.org>>>>
>>                  wrote:
>>
>>                       On Sun, 2016-04-03 at 06:11 -0400, Bruce Ashfield
>> wrote:
>>                       >
>>                       >
>>                       > On Sun, Apr 3, 2016 at 5:58 AM, Robert Yang <
>>                       >liezhi.yang@windriver.com
>>         <mailto:liezhi.yang@windriver.com> <mailto:
>> liezhi.yang@windriver.com
>>         <mailto:liezhi.yang@windriver.com>>
>>                  <mailto:liezhi.yang@windriver.com
>>         <mailto:liezhi.yang@windriver.com> <mailto:
>> liezhi.yang@windriver.com
>>         <mailto:liezhi.yang@windriver.com>>>>
>>
>>                  wrote:
>>                       > > So that iso can work well, otherwise the iso is
>>         readonly and there
>>                       > > would
>>                       > > be errors. The other way is aufs, but overlayfs
>> is
>>         more pupolar and
>>                       > > had
>>                       > > been merged by kernel mainline, we need make
>> iso work
>>         well by
>>                       > > default.
>>                       > Nope. As I mentioned before, this can't be a
>> always on
>>         default. It
>>                       > will conflict
>>                       > with other unionFS use cases.
>>                       >
>>                       > If you want overlayfs enabled, it needs to be
>> triggered
>>         from a
>>                       > specific image
>>                       > or distro feature.
>>
>>                       We can't change the kernel config from an image so
>> it
>>         would have to be
>>                       a distro setting. Is there a problem with enabling
>> both as
>>         modules btw?
>>                       I assume they can coexist?
>>
>>
>>                  I've always found it limiting that we can't trigger
>> kernel
>>         features based on
>>                  what an image'
>>                  type actually needs, but I understand why/how it works
>> like this.
>>
>>                  If it can't be triggered by an image setting, then just
>> keeping
>>         a layer
>>                  that is
>>                  added
>>                  to the build, that has a bbappend with the appropriate
>>         KERNEL_FEATURES would
>>                  also work, and is the approach that I've also taken.
>>
>>                  Not that the existing configs are great in this respect
>> (they
>>         need a lot of
>>                  streamlining),
>>                  but building modules 'just in case' eventually leads to
>>         allmodconfig :)
>>
>>                  I'd imagine they could co-exist, but it isn't something
>> I've tried.
>>
>>                  Bruce
>>
>>
>>                       Cheers,
>>
>>                       Richard
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

--001a11353a2c983d32052fb8b38d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Apr 5, 2016 at 2:42 AM, Robert Yang <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windr=
iver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span cl=
ass=3D""><br>
<br>
On 04/05/2016 02:33 PM, Bruce Ashfield wrote:<br>
</span><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><span class=3D"">
<br>
<br>
On Mon, Apr 4, 2016 at 10:48 PM, Robert Yang &lt;<a href=3D"mailto:liezhi.y=
ang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</a><br></spa=
n><span class=3D"">
&lt;mailto:<a href=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">l=
iezhi.yang@windriver.com</a>&gt;&gt; wrote:<br>
<br>
<br>
<br>
=C2=A0 =C2=A0 On 04/05/2016 10:31 AM, Bruce Ashfield wrote:<br>
<br>
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 On Mon, Apr 4, 2016 at 9:53 PM, Robert Yang &lt=
;<a href=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang=
@windriver.com</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:liezhi.yang@windri=
ver.com" target=3D"_blank">liezhi.yang@windriver.com</a>&gt;<br></span><spa=
n class=3D"">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:liezhi.yang@windri=
ver.com" target=3D"_blank">liezhi.yang@windriver.com</a> &lt;mailto:<a href=
=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriv=
er.com</a>&gt;&gt;&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 wrote:<br>
<br>
<br></span><div><div class=3D"h5">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Hi Bruce,<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0How many union fs on Linux,=
 please? AFAIK:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* unionfs: not supported by=
 kernel any more.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* aufs<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* overlayfs<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0If aufs and overlayfs are c=
onflicted, how about:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0KERNEL_UNION_FS ?=3D &quot;=
features/overlayfs/overlayfs.scc&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0KERNEL_EXTRA_FEATURES ?=3D =
&quot;[snip] ${KERNEL_UNION_FS}&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0I think that we really need=
 a way to make iso/hddimg work by default<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0to enhance the OOBE.<br>
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 That sort of mechanism can work, but not if it =
is enabled by default.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 out of box<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 experience<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 is one thing, but there are plenty of boot and =
image types that don&#39;t need a<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unionfs, and<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 we can&#39;t force these as =3Dy for those imag=
e types.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 If we make a modular config, and a built-in con=
fig, we could pick the<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 modular<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 config by<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 default, and then have the package list for the=
 images that need them,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rdepend<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 on the<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 appropriate modules.<br>
<br>
<br>
=C2=A0 =C2=A0 Sounds good, so how about:<br>
<br>
=C2=A0 =C2=A0 1) Update kernel to make overlayfs as module rather than buil=
tin<br>
<br>
<br>
Having two fragments make sense. one for built in, and one that is modules.=
<br>
Since these are<br>
distinct use case both sets of configuration are reasonable.<br>
</div></div></blockquote>
<br>
How about this:<br>
<br>
diff --git a/ktypes/preempt-rt/preempt-rt.cfg b/ktypes/preempt-rt/preempt-r=
t.cfg<br>
index 4c62804..28ad8cf 100644<br>
--- a/ktypes/preempt-rt/preempt-rt.cfg<br>
+++ b/ktypes/preempt-rt/preempt-rt.cfg<br>
@@ -1116,3 +1116,5 @@ CONFIG_CRYPTO_TEST=3Dm<br>
=C2=A0#<br>
=C2=A0CONFIG_LIBCRC32C=3Dm<br>
=C2=A0CONFIG_ZLIB_DEFLATE=3Dm<br>
+<br>
+CONFIG_OVERLAY_FS=3Dm<br>
diff --git a/ktypes/standard/standard.cfg b/ktypes/standard/standard.cfg<br=
>
index b3dbde5..3dabf49 100644<br>
--- a/ktypes/standard/standard.cfg<br>
+++ b/ktypes/standard/standard.cfg<br>
@@ -1108,3 +1108,5 @@ CONFIG_LIBCRC32C=3Dm<br>
=C2=A0CONFIG_ZLIB_DEFLATE=3Dm<br>
<br>
=C2=A0CONFIG_SHMEM=3Dy<br>
+<br>
+CONFIG_OVERLAY_FS=3Dm<span class=3D""><br>
<br></span></blockquote><div><br></div><div>Nope. See my follow up to the l=
inux-yocto patch .. I was more detailed in my follow up<br></div><div>there=
.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D""=
>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
=C2=A0 =C2=A0 2) let core-image-minimal-initramfs RDEPENEDS on the module.<=
br>
<br>
<br>
I&#39;d still prefer that this be set in a distro or optional layer. Since =
why<br>
</blockquote>
<br></span>
The live/iso/hddimg is supported by oe-core, all of them are in oe-core lay=
er,<br>
I&#39;m afraid that we can&#39;t add it in an extra layer or bbappend.<span=
 class=3D""><br><br></span></blockquote><div><br></div><div>Why not ? There=
 are just as many image types that don&#39;t need this support. Why should<=
br></div><div>it be universally build and enabled for a feature that is onl=
y used by some boot types.<br></div><div><br></div><div>You are missing the=
 point, and there&#39;s no justification to globally enable it.<br><br></di=
v><div>What about flash boot, what about boot from specific MTD devices, et=
c, etc, should<br></div><div>they all be enabled by default in the base con=
figs .. just in case someone boots that<br></div><div>way ? We&#39;ll end u=
p with a giant kernel with everything enabled or as modules if we<br></div>=
<div>cover all the cases. These need to be specifically requested and trigg=
ered.<br><br></div><div>Just because you are concerned with live iso boot, =
doesn&#39;t mean that others are,<br></div><div>and that we should have the=
 overhead everywhere.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><span class=3D"">
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
should core image<br>
minimal be the target for this ? There are any number of targets that might=
 be<br>
used for<br>
live boot.<br>
</blockquote>
<br></span>
All of them are in oe-core layer, <a href=3D"http://core-image-minimal-init=
ramfs.bb" rel=3D"noreferrer" target=3D"_blank">core-image-minimal-initramfs=
.bb</a> is the<br>
default live image in oe-core, I think that add kerne-module-overlay to<br>
its INSTALL is reasonable.<br></blockquote><div><br></div><div>But that sho=
uldn&#39;t need overlayfs for all configs. I boot initramfs kernels all the=
 time, I have no need<br></div><div>for overlay filesystems on those boards=
.<br><br></div><div>But yes, if you enable a module based overlayfs fragmen=
t, and then install the<br></div><div>module via an install, it should be o=
k, since it can be overridden.<br><br></div><div>I hope you are seeing the =
point of not enabling kernel options &quot;just in case&quot;, and why<br><=
/div><div>this sort of thing needs to be only built and installed when it i=
s truly needed.<br><br></div><div>Bruce<br></div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">
<br>
If there are other layers which have their own live image, then they can ad=
d<br>
it to their INSTALL.<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
// Robert<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
Bruce<br>
<br>
=C2=A0 =C2=A0 // Robert<br>
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Bruce<br>
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Robert<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0On 04/04/2016 07:56 AM, Bru=
ce Ashfield wrote:<br>
<br>
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0On Sun, Apr 3=
, 2016 at 5:46 PM, Richard Purdie<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.pu=
rdie@linuxfoundation.org</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:richard.purdie@lin=
uxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&=
gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a=
 href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richa=
rd.purdie@linuxfoundation.org</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:richard.purdie@lin=
uxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&=
gt;&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a=
 href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richa=
rd.purdie@linuxfoundation.org</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:richard.purdie@lin=
uxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&=
gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a=
 href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richa=
rd.purdie@linuxfoundation.org</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:richard.purdie@lin=
uxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&=
gt;&gt;&gt;&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wrote:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 On Sun, 2016-04-03 at 06:11 -0400, Bruce Ashfield wrote:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &gt; On Sun, Apr 3, 2016 at 5:58 AM, Robert Yang &lt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &gt;<a href=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liez=
hi.yang@windriver.com</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:liezhi.yang@windri=
ver.com" target=3D"_blank">liezhi.yang@windriver.com</a>&gt; &lt;mailto:<a =
href=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@win=
driver.com</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:liezhi.yang@windri=
ver.com" target=3D"_blank">liezhi.yang@windriver.com</a>&gt;&gt;<br>
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
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wrote:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &gt; &gt; So that iso can work well, otherwise the iso is<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 readonly and there<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &gt; &gt; would<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &gt; &gt; be errors. The other way is aufs, but overlayfs is<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 more pupolar and<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &gt; &gt; had<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &gt; &gt; been merged by kernel mainline, we need make iso work<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 well by<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &gt; &gt; default.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &gt; Nope. As I mentioned before, this can&#39;t be a always on<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 default. It<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &gt; will conflict<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &gt; with other unionFS use cases.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &gt; If you want overlayfs enabled, it needs to be triggered<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 from a<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &gt; specific image<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &gt; or distro feature.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 We can&#39;t change the kernel config from an image so it<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 would have to be<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 a distro setting. Is there a problem with enabling both as<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 modules btw?<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 I assume they can coexist?<br>
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0I&#39;ve alwa=
ys found it limiting that we can&#39;t trigger kernel<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 features based on<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0what an image=
&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0type actually=
 needs, but I understand why/how it works like this.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0If it can&#39=
;t be triggered by an image setting, then just keeping<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 a layer<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0that is<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0added<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0to the build,=
 that has a bbappend with the appropriate<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 KERNEL_FEATURES would<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0also work, an=
d is the approach that I&#39;ve also taken.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Not that the =
existing configs are great in this respect (they<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 need a lot of<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0streamlining)=
,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0but building =
modules &#39;just in case&#39; eventually leads to<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 allmodconfig :)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0I&#39;d imagi=
ne they could co-exist, but it isn&#39;t something I&#39;ve tried.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Bruce<br>
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 Cheers,<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 Richard<br>
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
</div></div></blockquote></div><br><br clear=3D"all"><br>-- <br><div class=
=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer, for chao=
s and madness await thee at its end&quot;</div>
</div></div>

--001a11353a2c983d32052fb8b38d--
