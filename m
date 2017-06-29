Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 20C2877F90
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jun 2017 13:06:50 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id g21so7658828lfk.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jun 2017 06:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+yEtoc0ulcKxPREAO0jlxDOE6dDUAZBsscNx9y3jkUA=;
	b=mH+tZUSXcWzzOqIqBGMgo37Wfj3/xsPvBWy+HadgpK10Nlb9apbu8AzOGeeSsg73AS
	GgM4uiwdhLuqbvMGMzXoZ0nXJMyb2a5h9mefiuLamzd4byR8EE9ki2N/xR5pYchdLTRq
	MkPAR24T1jDc4K2dIA0rx1FGG1Ub33HGT/uJ5y8pdDhdN3u2+p5Th/WkwT3SVdELaUAh
	EcDdBDrSvtk1Upyt3lNp2msHnUF2pjvbYx3F0JOgJnljPlzP1SeccslMyys6GeeGXNI/
	MExB7tlF4qC8GaFgiC4IbrzIXogowH9h3LwEtUElqcKZ35ZhTqjivJewARPiSf5mk1j9
	2upQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+yEtoc0ulcKxPREAO0jlxDOE6dDUAZBsscNx9y3jkUA=;
	b=DG09DNQ40RU2lKeogTMvjADJR6m7k5J1ZTtv2QNdFW3UlJqWIW+wF2ddgVwMCsWyMl
	2GGqzJFfU4U/RW7IT/GNcBmUF1iX2ajyBsISFL/op21teyGAFqbUqCUVuB6BHsTtxn7D
	OSu8dwZ3PPUfBc+xgPc4YAmGfMTm3NHCWBGzrOPzOtQ1pdaRlrLIb8qZJedu7HM8vPUO
	1xMaTPg2lSUoKATairBSzvPo0bQctJn7JjXhOvbcPjsLZ3M6ISugNSqkJWYnhpcBuMQ1
	iWtFRcSQARkY0K01tHiiw8piqgGCeBkUlJaBCoAQJPXCrAx32cediWb1++ndd53kC5rd
	cvEg==
X-Gm-Message-State: AKS2vOywzvtSGEeiJ1i7c9/5mjnBoI4330fBMO8mmHggJYIw7xifcd1Y
	lfSnLttxxic6bQw2kqHlg7R1zg9BRQ==
X-Received: by 10.25.72.145 with SMTP id v139mr4711142lfa.18.1498741611351;
	Thu, 29 Jun 2017 06:06:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.9.137 with HTTP; Thu, 29 Jun 2017 06:06:50 -0700 (PDT)
In-Reply-To: <23f339ea-47ed-7a93-5583-a74b555c690c@ni.com>
References: <20170621120003.6440-1-razvan.heghedus@ni.com>
	<20170621120003.6440-2-razvan.heghedus@ni.com>
	<CADkTA4NDO_5ch_unyr1Ydk9_wgxTaOzRkev3Kd=sXcSDtUMQoA@mail.gmail.com>
	<945a7f98-d3f7-7d41-c440-0bd71bb4ee19@ni.com>
	<CADkTA4MpEScpJ74MmtEQMTXPAe8_-wrMkYGTbEOAvPH7fpno1w@mail.gmail.com>
	<23f339ea-47ed-7a93-5583-a74b555c690c@ni.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 29 Jun 2017 09:06:50 -0400
Message-ID: <CADkTA4MR=dHJFu+9SOqX4DLxAqLSxgiBy5-rZVqTp=W3PMOwVQ@mail.gmail.com>
To: Razvan Heghedus <razvan.heghedus@ni.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] kernel: user defined KERNEL_VERSION_PKG_NAME
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
X-List-Received-Date: Thu, 29 Jun 2017 13:06:51 -0000
Content-Type: multipart/alternative; boundary="94eb2c0d00085ad399055318f9c8"

--94eb2c0d00085ad399055318f9c8
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 29, 2017 at 5:10 AM, Razvan Heghedus <razvan.heghedus@ni.com>
wrote:

>
>
> On 06/28/2017 04:29 AM, Bruce Ashfield wrote:
>
>
>
> On Tue, Jun 27, 2017 at 5:15 AM, Razvan Heghedus <razvan.heghedus@ni.com>
> wrote:
>
>>
>>
>> On 06/26/2017 06:52 PM, Bruce Ashfield wrote:
>>
>>
>>
>> On Wed, Jun 21, 2017 at 8:00 AM, Heghedus Razvan <razvan.heghedus@ni.com>
>> wrote:
>>
>>> Add possibility to set KERNEL_VERSION_PKG_NAME to a user
>>> defined value.
>>>
>>> Signed-off-by: Heghedus Razvan <razvan.heghedus@ni.com>
>>> ---
>>>  meta/classes/kernel.bbclass | 8 ++++++--
>>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>>> index 605c101e62..02728d5a86 100644
>>> --- a/meta/classes/kernel.bbclass
>>> +++ b/meta/classes/kernel.bbclass
>>> @@ -28,12 +28,16 @@ INITRAMFS_IMAGE_BUNDLE ?= ""
>>>  # LINUX_VERSION which is a constant.
>>>  KERNEL_VERSION_NAME = "${@d.getVar('KERNEL_VERSION') or "
>>> <$%7B@d.getVar%28%27KERNEL_VERSION%27%29or>"}"
>>>  KERNEL_VERSION_NAME[vardepvalue] = "${LINUX_VERSION}"
>>> -KERNEL_VERSION_PKG_NAME = "${@legitimize_package_name(d.
>>> getVar('KERNEL_VERSION'))}"
>>> -KERNEL_VERSION_PKG_NAME[vardepvalue] = "${LINUX_VERSION}"
>>>
>>>  python __anonymous () {
>>>      import re
>>>
>>> +    if d.getVar('USER_KERNEL_VERSION_PKG') is None :
>>> +        d.setVar('KERNEL_VERSION_PKG_NAME',
>>> "${@legitimize_package_name(d.getVar('KERNEL_VERSION'))}")
>>> +        d.setVar('KERNEL_VERSION_PKG_NAME[vardepvalue]',
>>> "${LINUX_VERSION}")
>>> +    else:
>>> +        d.setVar('KERNEL_VERSION_PKG_NAME',
>>> "${@legitimize_package_name(d.getVar('USER_KERNEL_VERSION_PKG'))}")
>>>
>>
>> This is introducing yet another variable that tweaks the already complex
>> setting of
>> the kernel version. Not to mention this code is already touchy with
>> respect to
>> parse time and rebuilding of the kernel.
>>
>> My concern is that if this is set, we are completely disassociated with
>> the source
>> code of the kernel.
>>
>> Where did you think this would be set ? local.conf ? distro config ?
>> somewhere else ?
>>
>> If we had a way to simply override KERNEL_VERSION, we wouldn't need any
>> extra
>> variables.
>>
>> Bruce
>>
>>
>>> +
>>>      # Merge KERNEL_IMAGETYPE and KERNEL_ALT_IMAGETYPE into
>>> KERNEL_IMAGETYPES
>>>      type = d.getVar('KERNEL_IMAGETYPE') or ""
>>>      alttype = d.getVar('KERNEL_ALT_IMAGETYPE') or ""
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
>> I have setting the variable in the kernel recipe. I need a way to
>> override the KERNEL_VERSION because I want the kernel packages name to
>> contain only a part of the version or nothing at all.
>> I need this for the the kernel upgrade stuff, because if the package name
>> is something like: kernel-4.9.8-{static_string} then I couldn't upgrade to
>> a version like: kernel-4.9.10-{static_string}, because they are two
>> different packages. I wanted a simple way to be able to have the package
>> name : kernel-4.9-{static_string}, then I could do the upgrade for the new
>> minor updates of the kernel.
>>
>
> I could have sworn this (upgrading) was already possible via the version
> string we
> are currently using.  i.e. the PV is already picked up from the kernel
> source, and
> that should be doing the job.
>
> i.e. when I unpack my kernel-image-bzimage-4.10.15-y
> octo-standard_4.10.15+git0+4d929fac34_d2c1ed3c0c-r0_qemux86_64.ipk
> package, I see that it has:
>
>  Version: 4.10.15+git0+4d929fac34_d2c1ed3c0c-r0
>  but obviously has the general provides: Provides: kernel-image-bzimage
>
> So that should be upgradable based on the version ... sure they have
> different names, but the provides
> and versions take care of things.
>
> The versioning, ability to install multiple kernels, upgrades, etc, have
> really churned
> these variables making them a mess to read.
>
> I'm probably misunderstanding your use case and error, can you elaborate
> for me
> and/or provide a log ? I'm more of a kernel guy than a package format guy
> .. so
> I'm probably missing something obvious.
>
> Bruce
>
>
>
> If I build a genericx86_64 core-image_sato without this patch, only with
> the other patch which add the versions(only the parts that are in round
> parenthesis) I have the following packages:
>
> Package: kernel-4.10.9-yocto-standard
> Version: 4.10.9+git0+ad2e885015_fe0fb8da3d-r0
> Depends: kernel-image-4.10.9-yocto-standard (=
> 4.10.9+git0+ad2e885015_fe0fb8da3d-r0)
> Provides: kernel-4.10.9-yocto-standard, kernel-base
>
> Package: kernel-image-4.10.9-yocto-standard
> Version: 4.10.9+git0+ad2e885015_fe0fb8da3d-r0
> Depends: kernel-image-bzimage-4.10.9-yocto-standard (=
> 4.10.9+git0+ad2e885015_fe0fb8da3d-r0)
> Provides: kernel-image
>
> Package: kernel-module-6lowpan-4.10.9-yocto-standard
> Version: 4.10.9+git0+ad2e885015_fe0fb8da3d-r0
> Depends: kernel-4.10.9-yocto-standard (= 4.10.9+git0+ad2e885015_fe0fb8d
> a3d-r0)
> Provides: kernel-module-6lowpan
>
> So the problem are the Depends field. We have the 4.10.9 part in the
> dependents that is messing with the upgrade. If we want to do only some
> minor update that doesn't change this value than everything is ok. It
> works. But if we have a new value e.g. 4.10.10 than we couldn't do the
> upgrade.
> So that's why I came up with this patch to be able to modify the Depends
> value to something like: kernel-image-4.10-yocto-standard, or even
> kernel-image.
>

That's the point I'm trying to make.

Patch 1/2 adds the depends, but there's no way to disable it. Without
defining the variable
that you have in patch 2/2, you can't upgrade the kernel packages .. which
makes it not only
a new variable, but a new requirement when working with the kernel
recipes/packages.

People have been upgrading the kernel before either of these patches (I
can't say that
I do very often .. but I know that users of the commercially supported
distros do) .. unless
it has been inadvertently broken, or there are more patches floating around
that I've not
seen.

what is the upgrade behaviour with neither of these patches applied ? ..
that's the behaviour that
I'm most concerned about maintaining.

Also, if we were to introduce something like this, the series needs to have
documentation
updates along with it .. or we'll surely forget to document it and catch
people by surprise :(

Bruce


>
>> This was the simple and cleanest way I could think of to achieve the my
>> scenario. But if there is a better idea for this, let me know.
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

--94eb2c0d00085ad399055318f9c8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Jun 29, 2017 at 5:10 AM, Razvan Heghedus <span dir=3D"ltr">&lt;=
<a href=3D"mailto:razvan.heghedus@ni.com" target=3D"_blank">razvan.heghedus=
@ni.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
 =20
   =20
 =20
  <div text=3D"#000000" bgcolor=3D"#FFFFFF"><div><div class=3D"m_7077270757=
819647348h5">
    <p><br>
    </p>
    <br>
    <div class=3D"m_7077270757819647348m_7647524976359667176moz-cite-prefix=
">On 06/28/2017 04:29 AM, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr"><br>
        <div class=3D"gmail_extra"><br>
          <div class=3D"gmail_quote">On Tue, Jun 27, 2017 at 5:15 AM,
            Razvan Heghedus <span dir=3D"ltr">&lt;<a href=3D"mailto:razvan.=
heghedus@ni.com" target=3D"_blank">razvan.heghedus@ni.com</a>&gt;</span>
            wrote:<br>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              <div bgcolor=3D"#FFFFFF">
                <div>
                  <div class=3D"m_7077270757819647348m_7647524976359667176g=
mail-h5">
                    <p><br>
                    </p>
                    <br>
                    <div class=3D"m_7077270757819647348m_764752497635966717=
6gmail-m_-2376083430806215195moz-cite-prefix">On
                      06/26/2017 06:52 PM, Bruce Ashfield wrote:<br>
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
x">Add
                              possibility to set KERNEL_VERSION_PKG_NAME
                              to a user<br>
                              defined value.<br>
                              <br>
                              Signed-off-by: Heghedus Razvan &lt;<a href=3D=
"mailto:razvan.heghedus@ni.com" target=3D"_blank">razvan.heghedus@ni.com</a=
>&gt;<br>
                              ---<br>
                              =C2=A0meta/classes/kernel.bbclass | 8 ++++++-=
-<br>
                              =C2=A01 file changed, 6 insertions(+), 2
                              deletions(-)<br>
                              <br>
                              diff --git a/meta/classes/kernel.bbclass
                              b/meta/classes/kernel.bbclass<br>
                              index 605c101e62..02728d5a86 100644<br>
                              --- a/meta/classes/kernel.bbclass<br>
                              +++ b/meta/classes/kernel.bbclass<br>
                              @@ -28,12 +28,16 @@ INITRAMFS_IMAGE_BUNDLE
                              ?=3D &quot;&quot;<br>
                              =C2=A0# LINUX_VERSION which is a constant.<br=
>
                              =C2=A0KERNEL_VERSION_NAME =3D <a class=3D"m_7=
077270757819647348m_7647524976359667176gmail-m_-2376083430806215195moz-txt-=
link-rfc2396E" href=3D"mailto:$%7B@d.getVar%28%27KERNEL_VERSION%27%29or" ta=
rget=3D"_blank">&quot;${@d.getVar(&#39;KERNEL_VERSION&#39;)
                                or &quot;</a>&quot;}&quot;<br>
                              =C2=A0KERNEL_VERSION_NAME[vardepval<wbr>ue] =
=3D
                              &quot;${LINUX_VERSION}&quot;<br>
                              -KERNEL_VERSION_PKG_NAME =3D
                              &quot;${@legitimize_package_name(d.<wbr>getVa=
r(&#39;KERNEL_VERSION&#39;))}&quot;<br>
                              -KERNEL_VERSION_PKG_NAME[varde<wbr>pvalue]
                              =3D &quot;${LINUX_VERSION}&quot;<br>
                              <br>
                              =C2=A0python __anonymous () {<br>
                              =C2=A0 =C2=A0 =C2=A0import re<br>
                              <br>
                              +=C2=A0 =C2=A0 if d.getVar(&#39;USER_KERNEL_V=
ERSION_<wbr>PKG&#39;)
                              is None :<br>
                              +=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;KE=
RNEL_VERSION_PKG_N<wbr>AME&#39;,
                              &quot;${@legitimize_package_name(d.<wbr>getVa=
r(&#39;KERNEL_VERSION&#39;))}&quot;)<br>
                              +=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;KE=
RNEL_VERSION_PKG_N<wbr>AME[vardepvalue]&#39;,
                              &quot;${LINUX_VERSION}&quot;)<br>
                              +=C2=A0 =C2=A0 else:<br>
                              +=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;KE=
RNEL_VERSION_PKG_N<wbr>AME&#39;,
                              &quot;${@legitimize_package_name(d.<wbr>getVa=
r(&#39;USER_KERNEL_VERSION_PK<wbr>G&#39;))}&quot;)<br>
                            </blockquote>
                            <div><br>
                            </div>
                            <div>This is introducing yet another
                              variable that tweaks the already complex
                              setting of</div>
                            <div>the kernel version. Not to mention this
                              code is already touchy with respect to</div>
                            <div>parse time and rebuilding of the
                              kernel.</div>
                            <div><br>
                            </div>
                            <div>My concern is that if this is set, we
                              are completely disassociated with the
                              source</div>
                            <div>code of the kernel.</div>
                            <div><br>
                            </div>
                            <div>Where did you think this would be set ?
                              local.conf ? distro config ? somewhere
                              else ?</div>
                            <div><br>
                            </div>
                            <div>If we had a way to simply override
                              KERNEL_VERSION, we wouldn&#39;t need any extr=
a</div>
                            <div>variables.</div>
                            <div><br>
                            </div>
                            <div>Bruce</div>
                            <div>=C2=A0</div>
                            <blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"> +<br>
                              =C2=A0 =C2=A0 =C2=A0# Merge KERNEL_IMAGETYPE =
and
                              KERNEL_ALT_IMAGETYPE into
                              KERNEL_IMAGETYPES<br>
                              =C2=A0 =C2=A0 =C2=A0type =3D d.getVar(&#39;KE=
RNEL_IMAGETYPE&#39;)
                              or &quot;&quot;<br>
                              =C2=A0 =C2=A0 =C2=A0alttype =3D
                              d.getVar(&#39;KERNEL_ALT_IMAGETYPE<wbr>&#39;)=
 or
                              &quot;&quot;<br>
                              <span class=3D"m_7077270757819647348m_7647524=
976359667176gmail-m_-2376083430806215195m_-3599068778944099545HOEnZb"><font=
 color=3D"#888888">--<br>
                                  2.13.1<br>
                                  <br>
                                  --<br>
                                  ______________________________<wbr>______=
___________<br>
                                  Openembedded-core mailing list<br>
                                  <a href=3D"mailto:Openembedded-core@lists=
.openembedded.org" target=3D"_blank">Openembedded-core@lists.openem<wbr>bed=
ded.org</a><br>
                                  <a href=3D"http://lists.openembedded.org/=
mailman/listinfo/openembedded-core" rel=3D"noreferrer" target=3D"_blank">ht=
tp://lists.openembedded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a=
><br>
                                </font></span></blockquote>
                          </div>
                          <br>
                          <br clear=3D"all">
                          <div><br>
                          </div>
                          -- <br>
                          <div class=3D"m_7077270757819647348m_764752497635=
9667176gmail-m_-2376083430806215195m_-3599068778944099545gmail_signature">&=
quot;Thou
                            shalt not follow the NULL pointer, for chaos
                            and madness await thee at its end&quot;</div>
                        </div>
                      </div>
                    </blockquote>
                  </div>
                </div>
                I have setting the variable in the kernel recipe. I need
                a way to override the KERNEL_VERSION because I want the
                kernel packages name to contain only a part of the
                version or nothing at all. <br>
                I need this for the the kernel upgrade stuff, because if
                the package name is something like:
                kernel-4.9.8-{static_string} then I couldn&#39;t upgrade to
                a version like: kernel-4.9.10-{static_string}, because
                they are two different packages. I wanted a simple way
                to be able to have the package name :
                kernel-4.9-{static_string}, then I could do the upgrade
                for the new minor updates of the kernel.<br>
              </div>
            </blockquote>
            <div><br>
            </div>
            <div>I could have sworn this (upgrading) was already
              possible via the version string we</div>
            <div>are currently using. =C2=A0i.e. the PV is already picked u=
p
              from the kernel source, and</div>
            <div>that should be doing the job.</div>
            <div><br>
            </div>
            <div>i.e. when I unpack my
kernel-image-bzimage-4.10.15-y<wbr>octo-standard_4.10.15+git0+4d9<wbr>29fac=
34_d2c1ed3c0c-r0_qemux86_<wbr>64.ipk</div>
            <div>package, I see that it has:<br>
            </div>
            <div><br>
              =C2=A0Version: 4.10.15+git0+4d929fac34_d2c1ed<wbr>3c0c-r0<br>
            </div>
            <div>=C2=A0but obviously has the general provides: Provides:
              kernel-image-bzimage<br>
            </div>
            <div><br>
            </div>
            <div>So that should be upgradable based on the version ...
              sure they have different names, but the provides</div>
            <div>and versions take care of things.</div>
            <div><br>
            </div>
            <div>The versioning, ability to install multiple kernels,
              upgrades, etc, have really churned</div>
            <div>these variables making them a mess to read.</div>
            <div><br>
            </div>
            <div>I&#39;m probably misunderstanding your use case and error,
              can you elaborate for me</div>
            <div>and/or provide a log ? I&#39;m more of a kernel guy than a
              package format guy .. so</div>
            <div>I&#39;m probably missing something obvious.</div>
            <div><br>
            </div>
            <div>Bruce</div>
            <div><br>
            </div>
            <div>=C2=A0</div>
          </div>
        </div>
      </div>
    </blockquote></div></div>
    If I build a genericx86_64 core-image_sato without this patch, only
    with the other patch which add the versions(only the parts that are
    in round parenthesis) I have the following packages:<br>
    <br>
    Package: kernel-4.10.9-yocto-standard<br>
    Version: 4.10.9+git0+ad2e885015_fe0fb8d<wbr>a3d-r0<br>
    Depends: kernel-image-4.10.9-yocto-stan<wbr>dard (=3D
    4.10.9+git0+ad2e885015_fe0fb8d<wbr>a3d-r0)<br>
    Provides: kernel-4.10.9-yocto-standard, kernel-base<br>
    <br>
    Package: kernel-image-4.10.9-yocto-stan<wbr>dard<br>
    Version: 4.10.9+git0+ad2e885015_fe0fb8d<wbr>a3d-r0<br>
    Depends: kernel-image-bzimage-4.10.9-yo<wbr>cto-standard (=3D
    4.10.9+git0+ad2e885015_fe0fb8d<wbr>a3d-r0)<br>
    Provides: kernel-image<br>
    <br>
    Package: kernel-module-6lowpan-4.10.9-y<wbr>octo-standard<br>
    Version: 4.10.9+git0+ad2e885015_fe0fb8d<wbr>a3d-r0<br>
    Depends: kernel-4.10.9-yocto-standard (=3D
    4.10.9+git0+ad2e885015_fe0fb8d<wbr>a3d-r0)<br>
    Provides: kernel-module-6lowpan<br>
    <br>
    So the problem are the Depends field. We have the 4.10.9 part in the
    dependents that is messing with the upgrade. If we want to do only
    some minor update that doesn&#39;t change this value than everything is
    ok. It works. But if we have a new value e.g. 4.10.10 than we
    couldn&#39;t do the upgrade. <br>
    So that&#39;s why I came up with this patch to be able to modify the
    Depends value to something like: kernel-image-4.10-yocto-standa<wbr>rd,
    or even kernel-image.</div></blockquote><div><br></div><div>That&#39;s =
the point I&#39;m trying to make.</div><div><br></div><div>Patch 1/2 adds t=
he depends, but there&#39;s no way to disable it. Without defining the vari=
able</div><div>that you have in patch 2/2, you can&#39;t upgrade the kernel=
 packages .. which makes it not only</div><div>a new variable, but a new re=
quirement when working with the kernel recipes/packages.</div><div><br></di=
v><div>People have been upgrading the kernel before either of these patches=
 (I can&#39;t say that</div><div>I do very often .. but I know that users o=
f the commercially supported distros do) .. unless</div><div>it has been in=
advertently broken, or there are more patches floating around that I&#39;ve=
 not</div><div>seen.</div><div><br></div><div>what is the upgrade behaviour=
 with neither of these patches applied ? .. that&#39;s the behaviour that</=
div><div>I&#39;m most concerned about maintaining.</div><div><br></div><div=
>Also, if we were to introduce something like this, the series needs to hav=
e documentation</div><div>updates along with it .. or we&#39;ll surely forg=
et to document it and catch people by surprise :(</div><div><br></div><div>=
Bruce</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div text=3D"#00=
0000" bgcolor=3D"#FFFFFF">
    <span><blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_extra">
          <div class=3D"gmail_quote">
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              <div bgcolor=3D"#FFFFFF"> <br>
                This was the simple and cleanest way I could think of to
                achieve the my scenario. But if there is a better idea
                for this, let me know.<span class=3D"m_7077270757819647348m=
_7647524976359667176gmail-HOEnZb"><font color=3D"#888888"><br>
                    <pre class=3D"m_7077270757819647348m_764752497635966717=
6gmail-m_-2376083430806215195moz-signature" cols=3D"72">--=20

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
          <div class=3D"m_7077270757819647348m_7647524976359667176gmail_sig=
nature">&quot;Thou shalt not follow the NULL
            pointer, for chaos and madness await thee at its end&quot;</div=
>
        </div>
      </div>
    </blockquote>
    <br>
    </span><span class=3D"m_7077270757819647348HOEnZb"><font color=3D"#8888=
88"><pre class=3D"m_7077270757819647348m_7647524976359667176moz-signature" =
cols=3D"72">--=20

Razvan
</pre>
  </font></span></div>

</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"m_7077270757819647348gmail_signature" data-smartmail=3D"gmail_signature=
">&quot;Thou shalt not follow the NULL pointer, for chaos and madness await=
 thee at its end&quot;</div>
</div></div>

--94eb2c0d00085ad399055318f9c8--
