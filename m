Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf0-f54.google.com (mail-lf0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id BB91F7807B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jun 2017 13:07:27 +0000 (UTC)
Received: by mail-lf0-f54.google.com with SMTP id b207so52424438lfg.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jun 2017 06:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=h/+IKHonLey6znx72g45iXoPkmu+R9IWW+CPx1amLCM=;
	b=Vb/oLVFZNn6FerAbF6cO7NtJJ2KMfiA4rBH2UoYg/i0PJGT5Rm5iZ+RGb5deZWP0gJ
	myWwugefq4UqJnkVZBIS2Dkd0osKpaTwZ3171cWivgBxwCJWqhz2v7HTAfhw5/toj7S7
	IN6jgDYj2SDW3T0UtFMZAz/h3v658H3yl7anSkcA38h5VmA/sHr08eZRGOi6DLqQuC+f
	mrS2n+qmjKkgKsBFEkA1t4zDP7Brw3yvtZEtJ6WmS/CEeHco+hEpUeUgIl+TTwPwDcqI
	H9R6cRkTtLEoqXqSKhO3bZTxin1OczV1wk1tNRaXlnKQimptvLAHw3+DkMXL4oqzGbK5
	6MeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=h/+IKHonLey6znx72g45iXoPkmu+R9IWW+CPx1amLCM=;
	b=YxbeAQV8XHKhyCxpexVtsKdNdriL/vjUCAnUnZr6qEU3IQH+j4y2rn+KwoI2XRppZv
	2M5cRdkmzRfLWBYq4k6u5469YDnr3n6Dy1ACRA5kK6mJ/sO6MWVwBO1xlkxTbdrTwBPb
	d1ZOBDsYkHT9+6nawsWRkf9STsBdi5Nt9aMPBuTd7uVi9Ahryak2QZj3nt7xqPIDHj30
	0GatmG831namj16GaAgGMyvukAAlrHwLXiJBwPjt7A15Sd5pZgRDYKIdhVb1+pcrVPqf
	Zt/AHzzOCyT1RcV1e9gD6yv9g1AeB6EC5s2KhJ1lSO2aXNQMzSHUXFQTiFG7gw+efHgP
	YRUQ==
X-Gm-Message-State: AKS2vOwK+mtn5dZmXjuHYZadHWKVvqRn6YOUkpZ3KDm+DU0Clcd0dbI6
	gDrsQGcZiYvKjQpLu52iegNfQ55FVg==
X-Received: by 10.46.21.3 with SMTP id s3mr4767959ljd.47.1498741648283; Thu,
	29 Jun 2017 06:07:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.9.137 with HTTP; Thu, 29 Jun 2017 06:07:27 -0700 (PDT)
In-Reply-To: <a78c41e3-fe8d-72cd-890d-fb4a9002dc8a@ni.com>
References: <20170621120003.6440-1-razvan.heghedus@ni.com>
	<CADkTA4PQB7Yi-UXSg6Y+CePfX+bh08Znmh9t-cMgwOLAJy3fZQ@mail.gmail.com>
	<83c5936e-f9b9-93c8-ee14-29c0734d813e@ni.com>
	<CADkTA4P8MjrFk720BzJbSq=_QBqfp8MAFghJXFRzsN4sAeuKAA@mail.gmail.com>
	<a78c41e3-fe8d-72cd-890d-fb4a9002dc8a@ni.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 29 Jun 2017 09:07:27 -0400
Message-ID: <CADkTA4O7ybkw7aXm+pTC18K614_VL3FB35znJMOBfzrvN0jmAg@mail.gmail.com>
To: Razvan Heghedus <razvan.heghedus@ni.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] kernel: add package version in dependencies for kernel packages
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
X-List-Received-Date: Thu, 29 Jun 2017 13:07:28 -0000
Content-Type: multipart/alternative; boundary="f403045f72788e602e055318fb4c"

--f403045f72788e602e055318fb4c
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 29, 2017 at 4:54 AM, Razvan Heghedus <razvan.heghedus@ni.com>
wrote:

>
>
> On 06/28/2017 04:10 AM, Bruce Ashfield wrote:
>
>
>
> On Tue, Jun 27, 2017 at 4:51 AM, Razvan Heghedus <razvan.heghedus@ni.com>
> wrote:
>
>>
>>
>> On 06/26/2017 06:50 PM, Bruce Ashfield wrote:
>>
>>
>>
>> On Wed, Jun 21, 2017 at 8:00 AM, Heghedus Razvan <razvan.heghedus@ni.com>
>> wrote:
>>
>>> Make all dependencies from kernel family packages which depend
>>> on another kernel related package to depend on the same version.
>>> This creates a consistent state where kernel, kernel images and
>>> kernel modules have the same version, making a kernel upgrade
>>> leading to upgrades of the image and modules.
>>>
>>> The upgrade works only if the KERNEL_VERSION_PKG_NAME remains
>>> the same for the newer versions.
>>>
>>> Signed-off-by: Heghedus Razvan <razvan.heghedus@ni.com>
>>> ---
>>>  meta/classes/kernel-module-split.bbclass  |  7 ++++---
>>>  meta/classes/kernel.bbclass               | 15 +++++++++------
>>>  meta/recipes-kernel/linux/linux-yocto.inc |  4 ++++
>>>  3 files changed, 17 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/meta/classes/kernel-module-split.bbclass
>>> b/meta/classes/kernel-module-split.bbclass
>>> index 5e10dcf735..e247e66901 100644
>>> --- a/meta/classes/kernel-module-split.bbclass
>>> +++ b/meta/classes/kernel-module-split.bbclass
>>> @@ -33,7 +33,7 @@ PACKAGESPLITFUNCS_prepend =
>>> "split_kernel_module_packages "
>>>  KERNEL_MODULES_META_PACKAGE ?= "kernel-modules"
>>>
>>>  KERNEL_MODULE_PACKAGE_PREFIX ?= ""
>>> -KERNEL_MODULE_PACKAGE_SUFFIX ?= "-${KERNEL_VERSION}"
>>> +KERNEL_MODULE_PACKAGE_SUFFIX ?= "-${KERNEL_VERSION_PKG_NAME}"
>>>  KERNEL_MODULE_PROVIDE_VIRTUAL ?= "1"
>>>
>>>  python split_kernel_module_packages () {
>>> @@ -114,6 +114,7 @@ python split_kernel_module_packages () {
>>>              for dep in vals["depends"].split(","):
>>>                  on = legitimize_package_name(dep)
>>>                  dependency_pkg = format % on
>>> +                dependency_pkg += ' ${@get_full_package_version(d)}'
>>>                  modinfo_deps.append(dependency_pkg)
>>>          for dep in modinfo_deps:
>>>              if not dep in rdepends:
>>> @@ -138,10 +139,10 @@ python split_kernel_module_packages () {
>>>      postinst = d.getVar('pkg_postinst_modules')
>>>      postrm = d.getVar('pkg_postrm_modules')
>>>
>>> -    modules = do_split_packages(d, root='${nonarch_base_libdir}/modules',
>>> file_regex=module_regex, output_pattern=module_pattern, description='%s
>>> kernel module', postinst=postinst, postrm=postrm, recursive=True,
>>> hook=frob_metadata, extra_depends='kernel-%s' %
>>> (d.getVar("KERNEL_VERSION")))
>>> +    modules = do_split_packages(d, root='${nonarch_base_libdir}/modules',
>>> file_regex=module_regex, output_pattern=module_pattern, description='%s
>>> kernel module', postinst=postinst, postrm=postrm, recursive=True,
>>> hook=frob_metadata, extra_depends='kernel-%s %s' %
>>> (d.getVar("KERNEL_VERSION_PKG_NAME"), get_full_package_version(d)))
>>>      if modules:
>>>          metapkg = d.getVar('KERNEL_MODULES_META_PACKAGE')
>>> -        d.appendVar('RDEPENDS_' + metapkg, ' '+' '.join(modules))
>>> +        d.appendVar('RDEPENDS_' + metapkg, ' '+' '.join(['{0}
>>> {1}'.format(module, get_full_package_version(d)) for module in modules]))
>>>
>>>      # If modules-load.d and modprobe.d are empty at this point, remove
>>> them to
>>>      # avoid warnings. removedirs only raises an OSError if an empty
>>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>>> index 7a134d5c29..605c101e62 100644
>>> --- a/meta/classes/kernel.bbclass
>>> +++ b/meta/classes/kernel.bbclass
>>> @@ -55,7 +55,7 @@ python __anonymous () {
>>>
>>>          d.setVar('FILES_kernel-image-' + typelower, '/' + imagedest +
>>> '/' + type + '-${KERNEL_VERSION_NAME}')
>>>
>>> -        d.appendVar('RDEPENDS_kernel-image', ' ' + 'kernel-image-' +
>>> typelower)
>>> +        d.appendVar('RDEPENDS_kernel-image', ' ' + 'kernel-image-' +
>>> typelower + ' ${@get_full_package_version(d)}')
>>>
>>>          d.setVar('PKG_kernel-image-' + typelower, 'kernel-image-' +
>>> typelower + '-${KERNEL_VERSION_PKG_NAME}')
>>>
>>> @@ -493,14 +493,17 @@ FILES_kernel-image = ""
>>>  FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers*
>>> /boot/config* ${KERNEL_SRC_PATH} ${nonarch_base_libdir}/modules
>>> /${KERNEL_VERSION}/build"
>>>  FILES_kernel-vmlinux = "/boot/vmlinux-${KERNEL_VERSION_NAME}"
>>>  FILES_kernel-modules = ""
>>> -RDEPENDS_kernel = "kernel-base"
>>> +RDEPENDS_kernel = "kernel-base ${@get_full_package_version(d)}"
>>>
>>
>> Is that really supposed to be a space, between kernel-base and the
>> package version
>> call ? I guess so, since I see the same thing below in the
>> RDEPENDS_kernel-base
>> line below .. but it just reads strange to me.  i.e. if that's a
>> RDEPENDS, where is the
>> package get_full_package_version(d) created ?
>>
>> Yes, the space is supposed to be there. If it's inconvenient here, it can
>> be moved in the string returned by get_full_package_version()
>>
>> Are you trying to set a generic versionless RDEPENDS and a versioned one
>> that doesn't
>> contain 'kernel-' in the name ?
>>
>>
>> This will create a versioned RDEPENDS. The syntax for a versioned package
>> is: "package_name (= package_version)". This only append the version to the
>> current value.
>>
>
> right. I was thinking of package rdepends, but not from the point of view
> of a
> package manager.
>
> I think it would be better to get it all from the utility function, since
> that makes it
> clear that it is a constructed value of the form you mentioned.
>
> Also, what if someone doesn't want the versioned depends ? If everything
> is in a
> routine, they could override to get the behaviour they want.
>
> There isn't a way to disable the versioned depends. Theoretically there
> shouldn't be problems, because this enforce that the modules and the kernel
> are at the same version(I mean the kernel and it's modules needs to be at
> the same version, so I don't see any problem with this). I could add a
> conditionals everywhere, but that involves an another variable.
>
>
> Out of curiosity .. have you tested this with both rpm and ipk ? I've run
> into problems
> with versioned depends and ipk in the past, so it would be good to confirm
> that this
> works consistently.
>
> I tested with all package types(deb, rmp and ipk) and I didn't have any
> problem at all.
>

That's good news!

Bruce


>
>
>
>>
>>  # Allow machines to override this dependency if kernel image files are
>>>  # not wanted in images as standard
>>> -RDEPENDS_kernel-base ?= "kernel-image"
>>> -PKG_kernel-image = "kernel-image-${@legitimize_pa
>>> ckage_name('${KERNEL_VERSION}')}"
>>> +RDEPENDS_kernel-base ?= "kernel-image ${@get_full_package_version(d)}"
>>> +PKG_kernel-image = "kernel-image-${KERNEL_VERSION_PKG_NAME}"
>>>  RDEPENDS_kernel-image += "${@base_conditional('KERNEL_IMAGETYPE',
>>> 'vmlinux', 'kernel-vmlinux', '', d)}"
>>> -PKG_kernel-base = "kernel-${@legitimize_package_
>>> name('${KERNEL_VERSION}')}"
>>> -RPROVIDES_kernel-base += "kernel-${KERNEL_VERSION}"
>>> +PKG_kernel-base = "kernel-${KERNEL_VERSION_PKG_NAME}"
>>> +RPROVIDES_kernel-base += "kernel-${KERNEL_VERSION_PKG_NAME}"
>>> +PKG_kernel-vmlinux = "kernel-vmlinux-${KERNEL_VERSION_PKG_NAME}"
>>>
>> +PKG_kernel-modules = "kernel-modules-${KERNEL_VERSION_PKG_NAME}"
>>> +PKG_kernel-dev = "kernel-dev-${KERNEL_VERSION_PKG_NAME}"
>>>  ALLOW_EMPTY_kernel = "1"
>>>  ALLOW_EMPTY_kernel-base = "1"
>>>  ALLOW_EMPTY_kernel-image = "1"
>>> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc
>>> b/meta/recipes-kernel/linux/linux-yocto.inc
>>> index 637506a2a8..c3d1284ad2 100644
>>> --- a/meta/recipes-kernel/linux/linux-yocto.inc
>>> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
>>> @@ -67,3 +67,7 @@ do_install_append(){
>>>  addtask kernel_version_sanity_check after do_kernel_metadata
>>> do_kernel_checkout before do_compile
>>>  addtask validate_branches before do_patch after do_kernel_checkout
>>>  addtask kernel_configcheck after do_configure before do_compile
>>> +
>>> +def get_full_package_version(d):
>>> +    return "(= " + d.getVar("PKGV") + "-" + d.getVar("PKGR") + ")"
>>>
>>
>> This doesn't belong in linux-yocto.inc, since it is called in
>> kernel.bbclass. It needs to be in the base
>> class and have a namespace that indicates it is specific to the kernel.
>>
>> Yeah, you're right, this shouldn't be in linux-yocto.inc. I will move it
>> to the base class, but I need some info about namespace thing, because I
>> don't recall reading about it in documentations.
>>
>
> Nothing fancy here, more convention than something technical. If this is
> only working for
> the kernel, it should be def kernel_get_full_package_version() so the
> context is clear and
> if another class/package add something similar, we won't collide.
>
> Bruce
>
>
>>
>> Bruce
>>
>>
>>> +
>>> --
>>> 2.13.1
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
>> at its end"
>>
>>
>> --
>>
>> Razvan
>>
>>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end"
>
>
> --
>
> Razvan
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--f403045f72788e602e055318fb4c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Jun 29, 2017 at 4:54 AM, Razvan Heghedus <span dir=3D"ltr">&lt;=
<a href=3D"mailto:razvan.heghedus@ni.com" target=3D"_blank">razvan.heghedus=
@ni.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
 =20
   =20
 =20
  <div text=3D"#000000" bgcolor=3D"#FFFFFF"><div><div class=3D"h5">
    <p><br>
    </p>
    <br>
    <div class=3D"m_6970285389326454075moz-cite-prefix">On 06/28/2017 04:10=
 AM, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr"><br>
        <div class=3D"gmail_extra"><br>
          <div class=3D"gmail_quote">On Tue, Jun 27, 2017 at 4:51 AM,
            Razvan Heghedus <span dir=3D"ltr">&lt;<a href=3D"mailto:razvan.=
heghedus@ni.com" target=3D"_blank">razvan.heghedus@ni.com</a>&gt;</span>
            wrote:<br>
            <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">
              <div text=3D"#000000" bgcolor=3D"#FFFFFF">
                <div>
                  <div class=3D"m_6970285389326454075h5">
                    <p><br>
                    </p>
                    <br>
                    <div class=3D"m_6970285389326454075m_-24688940639711371=
13moz-cite-prefix">On
                      06/26/2017 06:50 PM, Bruce Ashfield wrote:<br>
                    </div>
                    <blockquote type=3D"cite">
                      <div dir=3D"ltr"><br>
                        <div class=3D"gmail_extra"><br>
                          <div class=3D"gmail_quote">On Wed, Jun 21, 2017
                            at 8:00 AM, Heghedus Razvan <span dir=3D"ltr">&=
lt;<a href=3D"mailto:razvan.heghedus@ni.com" target=3D"_blank">razvan.heghe=
dus@ni.com</a>&gt;</span>
                            wrote:<br>
                            <blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">Make
                              all dependencies from kernel family
                              packages which depend<br>
                              on another kernel related package to
                              depend on the same version.<br>
                              This creates a consistent state where
                              kernel, kernel images and<br>
                              kernel modules have the same version,
                              making a kernel upgrade<br>
                              leading to upgrades of the image and
                              modules.<br>
                              <br>
                              The upgrade works only if the
                              KERNEL_VERSION_PKG_NAME remains<br>
                              the same for the newer versions.<br>
                              <br>
                              Signed-off-by: Heghedus Razvan &lt;<a href=3D=
"mailto:razvan.heghedus@ni.com" target=3D"_blank">razvan.heghedus@ni.com</a=
>&gt;<br>
                              ---<br>
                              =C2=A0meta/classes/kernel-module-sp<wbr>lit.b=
bclass=C2=A0
                              |=C2=A0 7 ++++---<br>
                              =C2=A0meta/classes/kernel.bbclass=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
                              =C2=A0| 15 +++++++++------<br>
                              =C2=A0meta/recipes-kernel/linux/lin<wbr>ux-yo=
cto.inc
                              |=C2=A0 4 ++++<br>
                              =C2=A03 files changed, 17 insertions(+), 9
                              deletions(-)<br>
                              <br>
                              diff --git a/meta/classes/kernel-module-s<wbr=
>plit.bbclass
                              b/meta/classes/kernel-module-s<wbr>plit.bbcla=
ss<br>
                              index 5e10dcf735..e247e66901 100644<br>
                              --- a/meta/classes/kernel-module-s<wbr>plit.b=
bclass<br>
                              +++ b/meta/classes/kernel-module-s<wbr>plit.b=
bclass<br>
                              @@ -33,7 +33,7 @@
                              PACKAGESPLITFUNCS_prepend =3D
                              &quot;split_kernel_module_packages &quot;<br>
                              =C2=A0KERNEL_MODULES_META_PACKAGE ?=3D
                              &quot;kernel-modules&quot;<br>
                              <br>
                              =C2=A0KERNEL_MODULE_PACKAGE_PREFIX ?=3D &quot=
;&quot;<br>
                              -KERNEL_MODULE_PACKAGE_SUFFIX ?=3D
                              &quot;-${KERNEL_VERSION}&quot;<br>
                              +KERNEL_MODULE_PACKAGE_SUFFIX ?=3D
                              &quot;-${KERNEL_VERSION_PKG_NAME}&quot;<br>
                              =C2=A0KERNEL_MODULE_PROVIDE_VIRTUAL ?=3D &quo=
t;1&quot;<br>
                              <br>
                              =C2=A0python split_kernel_module_packages () =
{<br>
                              @@ -114,6 +114,7 @@ python
                              split_kernel_module_packages () {<br>
                              =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0for dep in
                              vals[&quot;depends&quot;].split(&quot;,&quot;=
):<br>
                              =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0on =3D
                              legitimize_package_name(dep)<br>
                              =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0dependency_pkg =3D format %
                              on<br>
                              +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 dependency_pkg +=3D &#39;
                              ${@get_full_package_version(d)<wbr>}&#39;<br>
                              =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0
                              =C2=A0modinfo_deps.append(dependenc<wbr>y_pkg=
)<br>
                              =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for dep in =
modinfo_deps:<br>
                              =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0if not dep in rdepends:<br>
                              @@ -138,10 +139,10 @@ python
                              split_kernel_module_packages () {<br>
                              =C2=A0 =C2=A0 =C2=A0postinst =3D
                              d.getVar(&#39;pkg_postinst_modules<wbr>&#39;)=
<br>
                              =C2=A0 =C2=A0 =C2=A0postrm =3D
                              d.getVar(&#39;pkg_postrm_modules&#39;)<br>
                              <br>
                              -=C2=A0 =C2=A0 modules =3D do_split_packages(=
d,
                              root=3D&#39;${nonarch_base_libdir}/m<wbr>odul=
es&#39;,
                              file_regex=3Dmodule_regex,
                              output_pattern=3Dmodule_pattern,
                              description=3D&#39;%s kernel module&#39;,
                              postinst=3Dpostinst, postrm=3Dpostrm,
                              recursive=3DTrue, hook=3Dfrob_metadata,
                              extra_depends=3D&#39;kernel-%s&#39; %
                              (d.getVar(&quot;KERNEL_VERSION&quot;)))<br>
                              +=C2=A0 =C2=A0 modules =3D do_split_packages(=
d,
                              root=3D&#39;${nonarch_base_libdir}/m<wbr>odul=
es&#39;,
                              file_regex=3Dmodule_regex,
                              output_pattern=3Dmodule_pattern,
                              description=3D&#39;%s kernel module&#39;,
                              postinst=3Dpostinst, postrm=3Dpostrm,
                              recursive=3DTrue, hook=3Dfrob_metadata,
                              extra_depends=3D&#39;kernel-%s %s&#39; %
                              (d.getVar(&quot;KERNEL_VERSION_PKG_<wbr>NAME&=
quot;),
                              get_full_package_version(d)))<br>
                              =C2=A0 =C2=A0 =C2=A0if modules:<br>
                              =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0metapkg =3D
                              d.getVar(&#39;KERNEL_MODULES_META_<wbr>PACKAG=
E&#39;)<br>
                              -=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar(&#39=
;RDEPENDS_&#39; +
                              metapkg, &#39; &#39;+&#39; &#39;.join(modules=
))<br>
                              +=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar(&#39=
;RDEPENDS_&#39; +
                              metapkg, &#39; &#39;+&#39; &#39;.join([&#39;{=
0}
                              {1}&#39;.format(module,
                              get_full_package_version(d)) for module in
                              modules]))<br>
                              <br>
                              =C2=A0 =C2=A0 =C2=A0# If modules-load.d and m=
odprobe.d
                              are empty at this point, remove them to<br>
                              =C2=A0 =C2=A0 =C2=A0# avoid warnings. removed=
irs only
                              raises an OSError if an empty<br>
                              diff --git a/meta/classes/kernel.bbclass
                              b/meta/classes/kernel.bbclass<br>
                              index 7a134d5c29..605c101e62 100644<br>
                              --- a/meta/classes/kernel.bbclass<br>
                              +++ b/meta/classes/kernel.bbclass<br>
                              @@ -55,7 +55,7 @@ python __anonymous () {<br>
                              <br>
                              =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVar(&#=
39;FILES_kernel-image-<wbr>&#39;
                              + typelower, &#39;/&#39; + imagedest + &#39;/=
&#39; + type
                              + &#39;-${KERNEL_VERSION_NAME}&#39;)<br>
                              <br>
                              -=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar(&#39=
;RDEPENDS_kernel-i<wbr>mage&#39;,
                              &#39; &#39; + &#39;kernel-image-&#39; + typel=
ower)<br>
                              +=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar(&#39=
;RDEPENDS_kernel-i<wbr>mage&#39;,
                              &#39; &#39; + &#39;kernel-image-&#39; + typel=
ower + &#39;
                              ${@get_full_package_version(d)<wbr>}&#39;)<br=
>
                              <br>
                              =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVar(&#=
39;PKG_kernel-image-&#39; +
                              typelower, &#39;kernel-image-&#39; + typelowe=
r +
                              &#39;-${KERNEL_VERSION_PKG_NAME}&#39;)<br>
                              <br>
                              @@ -493,14 +493,17 @@ FILES_kernel-image =3D
                              &quot;&quot;<br>
                              =C2=A0FILES_kernel-dev =3D &quot;/boot/System=
.map*
                              /boot/Module.symvers* /boot/config*
                              ${KERNEL_SRC_PATH}
                              ${nonarch_base_libdir}/modules<wbr>/${KERNEL_=
VERSION}/build&quot;<br>
                              =C2=A0FILES_kernel-vmlinux =3D
                              &quot;/boot/vmlinux-${KERNEL_VERSIO<wbr>N_NAM=
E}&quot;<br>
                              =C2=A0FILES_kernel-modules =3D &quot;&quot;<b=
r>
                              -RDEPENDS_kernel =3D &quot;kernel-base&quot;<=
br>
                              +RDEPENDS_kernel =3D &quot;kernel-base
                              ${@get_full_package_version(d)<wbr>}&quot;<br=
>
                            </blockquote>
                            <div><br>
                            </div>
                            <div>Is that really supposed to be a space,
                              between kernel-base and the package
                              version<br>
                            </div>
                            <div>call ? I guess so, since I see the same
                              thing below in the RDEPENDS_kernel-base</div>
                            <div>line below .. but it just reads strange
                              to me. =C2=A0i.e. if that&#39;s a RDEPENDS, w=
here
                              is the</div>
                            <div>package get_full_package_version(d)
                              created ?</div>
                            <div><br>
                            </div>
                          </div>
                        </div>
                      </div>
                    </blockquote>
                  </div>
                </div>
                Yes, the space is supposed to be there. If it&#39;s
                inconvenient here, it can be moved in the string
                returned by get_full_package_version()<span><br>
                  <blockquote type=3D"cite">
                    <div dir=3D"ltr">
                      <div class=3D"gmail_extra">
                        <div class=3D"gmail_quote">
                          <div>Are you trying to set a generic
                            versionless RDEPENDS and a versioned one
                            that doesn&#39;t</div>
                          <div>contain &#39;kernel-&#39; in the name ?</div=
>
                          <div>=C2=A0</div>
                        </div>
                      </div>
                    </div>
                  </blockquote>
                </span> This will create a versioned RDEPENDS. The
                syntax for a versioned package is: &quot;package_name (=3D
                package_version)&quot;. This only append the version to the
                current value.</div>
            </blockquote>
            <div><br>
            </div>
            <div>right. I was thinking of package rdepends, but not from
              the point of view of a</div>
            <div>package manager.</div>
            <div><br>
            </div>
            <div>I think it would be better to get it all from the
              utility function, since that makes it</div>
            <div>clear that it is a constructed value of the form you
              mentioned.</div>
            <div><br>
            </div>
            <div>Also, what if someone doesn&#39;t want the versioned
              depends ? If everything is in a</div>
            <div>routine, they could override to get the behaviour they
              want.</div>
          </div>
        </div>
      </div>
    </blockquote></div></div>
    There isn&#39;t a way to disable the versioned depends. Theoretically
    there shouldn&#39;t be problems, because this enforce that the modules
    and the kernel are at the same version(I mean the kernel and it&#39;s
    modules needs to be at the same version, so I don&#39;t see any problem
    with this). I could add a conditionals everywhere, but that involves
    an another variable.<span class=3D""><br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_extra">
          <div class=3D"gmail_quote">
            <div><br>
            </div>
            <div>Out of curiosity .. have you tested this with both rpm
              and ipk ? I&#39;ve run into problems</div>
            <div>with versioned depends and ipk in the past, so it would
              be good to confirm that this</div>
            <div>works consistently.</div>
          </div>
        </div>
      </div>
    </blockquote></span>
    I tested with all package types(deb, rmp and ipk) and I didn&#39;t have
    any problem at all.</div></blockquote><div><br></div><div>That&#39;s go=
od news!</div><div><br></div><div>Bruce</div><div>=C2=A0<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex"><div text=3D"#000000" bgcolor=3D"#FFFFFF"><div><div c=
lass=3D"h5"><br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_extra">
          <div class=3D"gmail_quote">
            <div>=C2=A0</div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">
              <div text=3D"#000000" bgcolor=3D"#FFFFFF">
                <div>
                  <div class=3D"m_6970285389326454075h5"><br>
                    <blockquote type=3D"cite">
                      <div dir=3D"ltr">
                        <div class=3D"gmail_extra">
                          <div class=3D"gmail_quote">
                            <blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"> =C2=A0#
                              Allow machines to override this dependency
                              if kernel image files are<br>
                              =C2=A0# not wanted in images as standard<br>
                              -RDEPENDS_kernel-base ?=3D &quot;kernel-image=
&quot;<br>
                              -PKG_kernel-image =3D
                              &quot;kernel-image-${@legitimize_pa<wbr>ckage=
_name(&#39;${KERNEL_VERSION}&#39;<wbr>)}&quot;<br>
                              +RDEPENDS_kernel-base ?=3D &quot;kernel-image
                              ${@get_full_package_version(d)<wbr>}&quot;<br=
>
                              +PKG_kernel-image =3D
                              &quot;kernel-image-${KERNEL_VERSION<wbr>_PKG_=
NAME}&quot;<br>
                              =C2=A0RDEPENDS_kernel-image +=3D
                              &quot;${@base_conditional(&#39;KERNEL_I<wbr>M=
AGETYPE&#39;,
                              &#39;vmlinux&#39;, &#39;kernel-vmlinux&#39;, =
&#39;&#39;, d)}&quot;<br>
                              -PKG_kernel-base =3D
                              &quot;kernel-${@legitimize_package_<wbr>name(=
&#39;${KERNEL_VERSION}&#39;)}&quot;<br>
                              -RPROVIDES_kernel-base +=3D
                              &quot;kernel-${KERNEL_VERSION}&quot;<br>
                              +PKG_kernel-base =3D
                              &quot;kernel-${KERNEL_VERSION_PKG_N<wbr>AME}&=
quot;<br>
                              +RPROVIDES_kernel-base +=3D
                              &quot;kernel-${KERNEL_VERSION_PKG_N<wbr>AME}&=
quot;<br>
                              +PKG_kernel-vmlinux =3D
                              &quot;kernel-vmlinux-${KERNEL_VERSI<wbr>ON_PK=
G_NAME}&quot;<br>
                            </blockquote>
                            <blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">+PKG_kernel-modules
                              =3D &quot;kernel-modules-${KERNEL_VERSI<wbr>O=
N_PKG_NAME}&quot;<br>
                              +PKG_kernel-dev =3D
                              &quot;kernel-dev-${KERNEL_VERSION_P<wbr>KG_NA=
ME}&quot;<br>
                              =C2=A0ALLOW_EMPTY_kernel =3D &quot;1&quot;<br=
>
                              =C2=A0ALLOW_EMPTY_kernel-base =3D &quot;1&quo=
t;<br>
                              =C2=A0ALLOW_EMPTY_kernel-image =3D &quot;1&qu=
ot;<br>
                              diff --git a/meta/recipes-kernel/linux/li<wbr=
>nux-yocto.inc
                              b/meta/recipes-kernel/linux/li<wbr>nux-yocto.=
inc<br>
                              index 637506a2a8..c3d1284ad2 100644<br>
                              --- a/meta/recipes-kernel/linux/li<wbr>nux-yo=
cto.inc<br>
                              +++ b/meta/recipes-kernel/linux/li<wbr>nux-yo=
cto.inc<br>
                              @@ -67,3 +67,7 @@ do_install_append(){<br>
                              =C2=A0addtask kernel_version_sanity_check aft=
er
                              do_kernel_metadata do_kernel_checkout
                              before do_compile<br>
                              =C2=A0addtask validate_branches before do_pat=
ch
                              after do_kernel_checkout<br>
                              =C2=A0addtask kernel_configcheck after
                              do_configure before do_compile<br>
                              +<br>
                              +def get_full_package_version(d):<br>
                              +=C2=A0 =C2=A0 return &quot;(=3D &quot; + d.g=
etVar(&quot;PKGV&quot;) + &quot;-&quot;
                              + d.getVar(&quot;PKGR&quot;) + &quot;)&quot;<=
br>
                            </blockquote>
                            <div><br>
                            </div>
                            <div>This doesn&#39;t belong in linux-yocto.inc=
,
                              since it is called in kernel.bbclass. It
                              needs to be in the base</div>
                            <div>class and have a namespace that
                              indicates it is specific to the kernel.</div>
                            <div><br>
                            </div>
                          </div>
                        </div>
                      </div>
                    </blockquote>
                  </div>
                </div>
                Yeah, you&#39;re right, this shouldn&#39;t be in
                linux-yocto.inc. I will move it to the base class, but I
                need some info about namespace thing, because I don&#39;t
                recall reading about it in documentations.</div>
            </blockquote>
            <div><br>
            </div>
            <div>Nothing fancy here, more convention than something
              technical. If this is only working for</div>
            <div>the kernel, it should be def
              kernel_get_full_package_<wbr>version() so the context is clea=
r
              and</div>
            <div>if another class/package add something similar, we
              won&#39;t collide.</div>
            <div><br>
            </div>
            <div>Bruce</div>
            <div>=C2=A0</div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">
              <div text=3D"#000000" bgcolor=3D"#FFFFFF"><span><br>
                  <blockquote type=3D"cite">
                    <div dir=3D"ltr">
                      <div class=3D"gmail_extra">
                        <div class=3D"gmail_quote">
                          <div>Bruce</div>
                          <div>=C2=A0</div>
                          <blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
> +<br>
                            <span class=3D"m_6970285389326454075m_-24688940=
63971137113gmail-HOEnZb"><font color=3D"#888888">--<br>
                                2.13.1<br>
                                <br>
                                --<br>
                                ______________________________<wbr>________=
_________<br>
                                Openembedded-core mailing list<br>
                                <a href=3D"mailto:Openembedded-core@lists.o=
penembedded.org" target=3D"_blank">Openembedded-core@lists.openem<wbr>bedde=
d.org</a><br>
                                <a href=3D"http://lists.openembedded.org/ma=
ilman/listinfo/openembedded-core" rel=3D"noreferrer" target=3D"_blank">http=
://lists.openembedded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><=
br>
                              </font></span></blockquote>
                        </div>
                        <br>
                        <br clear=3D"all">
                        <div><br>
                        </div>
                        -- <br>
                        <div class=3D"m_6970285389326454075m_-2468894063971=
137113gmail_signature">&quot;Thou
                          shalt not follow the NULL pointer, for chaos
                          and madness await thee at its end&quot;</div>
                      </div>
                    </div>
                  </blockquote>
                  <br>
                </span><span class=3D"m_6970285389326454075HOEnZb"><font co=
lor=3D"#888888">
                    <pre class=3D"m_6970285389326454075m_-24688940639711371=
13moz-signature" cols=3D"72">--=20

Razvan
</pre>
                  </font></span></div>
            </blockquote>
          </div>
          <br>
          <br clear=3D"all">
          <div><br>
          </div>
          -- <br>
          <div class=3D"m_6970285389326454075gmail_signature" data-smartmai=
l=3D"gmail_signature">&quot;Thou
            shalt not follow the NULL pointer, for chaos and madness
            await thee at its end&quot;</div>
        </div>
      </div>
    </blockquote>
    <br>
    </div></div><span class=3D"HOEnZb"><font color=3D"#888888"><pre class=
=3D"m_6970285389326454075moz-signature" cols=3D"72">--=20

Razvan
</pre>
  </font></span></div>

</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt no=
t follow the NULL pointer, for chaos and madness await thee at its end&quot=
;</div>
</div></div>

--f403045f72788e602e055318fb4c--
