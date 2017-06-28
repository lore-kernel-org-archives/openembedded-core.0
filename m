Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id E314771A0C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jun 2017 01:29:45 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id g21so4049892lfk.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 18:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9jKiHn1CcnVjecPi0c+AvC2iMdtNKxXvGtmCq3e09cM=;
	b=LcPiHcGJfLu1HZoCj2TtGeABUxEF6d5yKWefKjKrh7v22wnAj7MLufn0ETTzLImjMm
	1NpAeJdTVPcJvGMV3gYVcS9UlRfhtc2NjmNuOMsYHfI/hka4Ac1tMbXTqe+k0jdG3o+o
	G6QhFZIViRV/VOT0AW55eYGkJJiUCRMrWZxZlkgo8rB8DGveGyBfNyQiR7tLDUlYrICQ
	T9oA0IAprT1NUe/u+J4y9okjxChrdOTfZer7YiV6nZU8FoSQaeRWEjCSPOOr/uO7klrO
	Ys1k22UNspxcZyzvzpYHRkdCMdTlIVjJHCkzX6l+G03dmPZwBQO8Lkcg5icYeX7GHe6l
	myrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9jKiHn1CcnVjecPi0c+AvC2iMdtNKxXvGtmCq3e09cM=;
	b=YYo/3IIckT7ccgS43tBVsxVMt6pSasBuH4GB9Qd4bGPHnsNT/t2HScse2QuYZs3qst
	Ec7g/sW/nciJxXtL6D+4qXP2yj5o5ODEG4hLB7F3Y9uGizqdq0E0HVxyoX7pr31Xz4z0
	0FrsupJvKSs2vkL3iWKiRxyq4WdyUllOLK+UEA1n4z4+re1TNe75QkGF6tA3DWmj7FxB
	DO3OcQ0su98gd3IeSLoRrYzn91+02xuJxUq0FKEJswfkhYNw7Q5VJkE6BiqVy0H3HIvQ
	ejPJHTS6Pv7hTWAVt26Ct69evtUeNtuQPX1MUOKB40C1ZABHPhbRRSsM218YsfBB60Bj
	F9BQ==
X-Gm-Message-State: AKS2vOy3rxitZzvNbW7grJFPPS1/WVeufSXInrb2h+wxv2qZHh0yo5B4
	ikYB2Gvl4Rovg66JJS0Q++JzwqKbLQ==
X-Received: by 10.25.56.13 with SMTP id f13mr87611lfa.167.1498613386193; Tue,
	27 Jun 2017 18:29:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.9.137 with HTTP; Tue, 27 Jun 2017 18:29:45 -0700 (PDT)
In-Reply-To: <945a7f98-d3f7-7d41-c440-0bd71bb4ee19@ni.com>
References: <20170621120003.6440-1-razvan.heghedus@ni.com>
	<20170621120003.6440-2-razvan.heghedus@ni.com>
	<CADkTA4NDO_5ch_unyr1Ydk9_wgxTaOzRkev3Kd=sXcSDtUMQoA@mail.gmail.com>
	<945a7f98-d3f7-7d41-c440-0bd71bb4ee19@ni.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 27 Jun 2017 21:29:45 -0400
Message-ID: <CADkTA4MpEScpJ74MmtEQMTXPAe8_-wrMkYGTbEOAvPH7fpno1w@mail.gmail.com>
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
X-List-Received-Date: Wed, 28 Jun 2017 01:29:47 -0000
Content-Type: multipart/alternative; boundary="f403045ea3448a34b40552fb1e05"

--f403045ea3448a34b40552fb1e05
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 27, 2017 at 5:15 AM, Razvan Heghedus <razvan.heghedus@ni.com>
wrote:

>
>
> On 06/26/2017 06:52 PM, Bruce Ashfield wrote:
>
>
>
> On Wed, Jun 21, 2017 at 8:00 AM, Heghedus Razvan <razvan.heghedus@ni.com>
> wrote:
>
>> Add possibility to set KERNEL_VERSION_PKG_NAME to a user
>> defined value.
>>
>> Signed-off-by: Heghedus Razvan <razvan.heghedus@ni.com>
>> ---
>>  meta/classes/kernel.bbclass | 8 ++++++--
>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index 605c101e62..02728d5a86 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -28,12 +28,16 @@ INITRAMFS_IMAGE_BUNDLE ?= ""
>>  # LINUX_VERSION which is a constant.
>>  KERNEL_VERSION_NAME = "${@d.getVar('KERNEL_VERSION') or "
>> <$%7B@d.getVar('KERNEL_VERSION')or>"}"
>>  KERNEL_VERSION_NAME[vardepvalue] = "${LINUX_VERSION}"
>> -KERNEL_VERSION_PKG_NAME = "${@legitimize_package_name(d.
>> getVar('KERNEL_VERSION'))}"
>> -KERNEL_VERSION_PKG_NAME[vardepvalue] = "${LINUX_VERSION}"
>>
>>  python __anonymous () {
>>      import re
>>
>> +    if d.getVar('USER_KERNEL_VERSION_PKG') is None :
>> +        d.setVar('KERNEL_VERSION_PKG_NAME',
>> "${@legitimize_package_name(d.getVar('KERNEL_VERSION'))}")
>> +        d.setVar('KERNEL_VERSION_PKG_NAME[vardepvalue]',
>> "${LINUX_VERSION}")
>> +    else:
>> +        d.setVar('KERNEL_VERSION_PKG_NAME',
>> "${@legitimize_package_name(d.getVar('USER_KERNEL_VERSION_PKG'))}")
>>
>
> This is introducing yet another variable that tweaks the already complex
> setting of
> the kernel version. Not to mention this code is already touchy with
> respect to
> parse time and rebuilding of the kernel.
>
> My concern is that if this is set, we are completely disassociated with
> the source
> code of the kernel.
>
> Where did you think this would be set ? local.conf ? distro config ?
> somewhere else ?
>
> If we had a way to simply override KERNEL_VERSION, we wouldn't need any
> extra
> variables.
>
> Bruce
>
>
>> +
>>      # Merge KERNEL_IMAGETYPE and KERNEL_ALT_IMAGETYPE into
>> KERNEL_IMAGETYPES
>>      type = d.getVar('KERNEL_IMAGETYPE') or ""
>>      alttype = d.getVar('KERNEL_ALT_IMAGETYPE') or ""
>> --
>> 2.13.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end"
>
> I have setting the variable in the kernel recipe. I need a way to override
> the KERNEL_VERSION because I want the kernel packages name to contain only
> a part of the version or nothing at all.
> I need this for the the kernel upgrade stuff, because if the package name
> is something like: kernel-4.9.8-{static_string} then I couldn't upgrade to
> a version like: kernel-4.9.10-{static_string}, because they are two
> different packages. I wanted a simple way to be able to have the package
> name : kernel-4.9-{static_string}, then I could do the upgrade for the new
> minor updates of the kernel.
>

I could have sworn this (upgrading) was already possible via the version
string we
are currently using.  i.e. the PV is already picked up from the kernel
source, and
that should be doing the job.

i.e. when I unpack my
kernel-image-bzimage-4.10.15-yocto-standard_4.10.15+git0+4d929fac34_d2c1ed3c0c-r0_qemux86_64.ipk
package, I see that it has:

 Version: 4.10.15+git0+4d929fac34_d2c1ed3c0c-r0
 but obviously has the general provides: Provides: kernel-image-bzimage

So that should be upgradable based on the version ... sure they have
different names, but the provides
and versions take care of things.

The versioning, ability to install multiple kernels, upgrades, etc, have
really churned
these variables making them a mess to read.

I'm probably misunderstanding your use case and error, can you elaborate
for me
and/or provide a log ? I'm more of a kernel guy than a package format guy
.. so
I'm probably missing something obvious.

Bruce



>
> This was the simple and cleanest way I could think of to achieve the my
> scenario. But if there is a better idea for this, let me know.
>
> --
>
> Razvan
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--f403045ea3448a34b40552fb1e05
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Jun 27, 2017 at 5:15 AM, Razvan Heghedus <span dir=3D"ltr">&lt;=
<a href=3D"mailto:razvan.heghedus@ni.com" target=3D"_blank">razvan.heghedus=
@ni.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF"><div><div class=3D"gmail-h5">
    <p><br>
    </p>
    <br>
    <div class=3D"gmail-m_-2376083430806215195moz-cite-prefix">On 06/26/201=
7 06:52 PM, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr"><br>
        <div class=3D"gmail_extra"><br>
          <div class=3D"gmail_quote">On Wed, Jun 21, 2017 at 8:00 AM,
            Heghedus Razvan <span dir=3D"ltr">&lt;<a href=3D"mailto:razvan.=
heghedus@ni.com" target=3D"_blank">razvan.heghedus@ni.com</a>&gt;</span>
            wrote:<br>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Add
              possibility to set KERNEL_VERSION_PKG_NAME to a user<br>
              defined value.<br>
              <br>
              Signed-off-by: Heghedus Razvan &lt;<a href=3D"mailto:razvan.h=
eghedus@ni.com" target=3D"_blank">razvan.heghedus@ni.com</a>&gt;<br>
              ---<br>
              =C2=A0meta/classes/kernel.bbclass | 8 ++++++--<br>
              =C2=A01 file changed, 6 insertions(+), 2 deletions(-)<br>
              <br>
              diff --git a/meta/classes/kernel.bbclass
              b/meta/classes/kernel.bbclass<br>
              index 605c101e62..02728d5a86 100644<br>
              --- a/meta/classes/kernel.bbclass<br>
              +++ b/meta/classes/kernel.bbclass<br>
              @@ -28,12 +28,16 @@ INITRAMFS_IMAGE_BUNDLE ?=3D &quot;&quot;<=
br>
              =C2=A0# LINUX_VERSION which is a constant.<br>
              =C2=A0KERNEL_VERSION_NAME =3D <a class=3D"gmail-m_-2376083430=
806215195moz-txt-link-rfc2396E" href=3D"mailto:$%7B@d.getVar(&#39;KERNEL_VE=
RSION&#39;)or" target=3D"_blank">&quot;${@d.getVar(&#39;KERNEL_VERSION&#39;=
) or
              &quot;</a>&quot;}&quot;<br>
              =C2=A0KERNEL_VERSION_NAME[vardepval<wbr>ue] =3D
              &quot;${LINUX_VERSION}&quot;<br>
              -KERNEL_VERSION_PKG_NAME =3D &quot;${@legitimize_package_name=
(d.<wbr>getVar(&#39;KERNEL_VERSION&#39;))}&quot;<br>
              -KERNEL_VERSION_PKG_NAME[varde<wbr>pvalue] =3D
              &quot;${LINUX_VERSION}&quot;<br>
              <br>
              =C2=A0python __anonymous () {<br>
              =C2=A0 =C2=A0 =C2=A0import re<br>
              <br>
              +=C2=A0 =C2=A0 if d.getVar(&#39;USER_KERNEL_VERSION_<wbr>PKG&=
#39;) is None :<br>
              +=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;KERNEL_VERSION_PKG=
_N<wbr>AME&#39;,
              &quot;${@legitimize_package_name(d.<wbr>getVar(&#39;KERNEL_VE=
RSION&#39;))}&quot;)<br>
              +=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;KERNEL_VERSION_PKG=
_N<wbr>AME[vardepvalue]&#39;,
              &quot;${LINUX_VERSION}&quot;)<br>
              +=C2=A0 =C2=A0 else:<br>
              +=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;KERNEL_VERSION_PKG=
_N<wbr>AME&#39;,
              &quot;${@legitimize_package_name(d.<wbr>getVar(&#39;USER_KERN=
EL_VERSION_PK<wbr>G&#39;))}&quot;)<br>
            </blockquote>
            <div><br>
            </div>
            <div>This is introducing yet another variable that tweaks
              the already complex setting of</div>
            <div>the kernel version. Not to mention this code is already
              touchy with respect to</div>
            <div>parse time and rebuilding of the kernel.</div>
            <div><br>
            </div>
            <div>My concern is that if this is set, we are completely
              disassociated with the source</div>
            <div>code of the kernel.</div>
            <div><br>
            </div>
            <div>Where did you think this would be set ? local.conf ?
              distro config ? somewhere else ?</div>
            <div><br>
            </div>
            <div>If we had a way to simply override KERNEL_VERSION, we
              wouldn&#39;t need any extra</div>
            <div>variables.</div>
            <div><br>
            </div>
            <div>Bruce</div>
            <div>=C2=A0</div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              +<br>
              =C2=A0 =C2=A0 =C2=A0# Merge KERNEL_IMAGETYPE and KERNEL_ALT_I=
MAGETYPE
              into KERNEL_IMAGETYPES<br>
              =C2=A0 =C2=A0 =C2=A0type =3D d.getVar(&#39;KERNEL_IMAGETYPE&#=
39;) or &quot;&quot;<br>
              =C2=A0 =C2=A0 =C2=A0alttype =3D d.getVar(&#39;KERNEL_ALT_IMAG=
ETYPE<wbr>&#39;) or &quot;&quot;<br>
              <span class=3D"gmail-m_-2376083430806215195m_-359906877894409=
9545HOEnZb"><font color=3D"#888888">--<br>
                  2.13.1<br>
                  <br>
                  --<br>
                  ______________________________<wbr>_________________<br>
                  Openembedded-core mailing list<br>
                  <a href=3D"mailto:Openembedded-core@lists.openembedded.or=
g" target=3D"_blank">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
                  <a href=3D"http://lists.openembedded.org/mailman/listinfo=
/openembedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.opene=
mbedded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
                </font></span></blockquote>
          </div>
          <br>
          <br clear=3D"all">
          <div><br>
          </div>
          -- <br>
          <div class=3D"gmail-m_-2376083430806215195m_-3599068778944099545g=
mail_signature">&quot;Thou shalt not follow the
            NULL pointer, for chaos and madness await thee at its end&quot;=
</div>
        </div>
      </div>
    </blockquote></div></div>
    I have setting the variable in the kernel recipe. I need a way to
    override the KERNEL_VERSION because I want the kernel packages name
    to contain only a part of the version or nothing at all. <br>
    I need this for the the kernel upgrade stuff, because if the package
    name is something like: kernel-4.9.8-{static_string} then I couldn&#39;=
t
    upgrade to a version like: kernel-4.9.10-{static_string}, because
    they are two different packages. I wanted a simple way to be able to
    have the package name : kernel-4.9-{static_string}, then I could do
    the upgrade for the new minor updates of the kernel.<br></div></blockqu=
ote><div><br></div><div>I could have sworn this (upgrading) was already pos=
sible via the version string we</div><div>are currently using. =C2=A0i.e. t=
he PV is already picked up from the kernel source, and</div><div>that shoul=
d be doing the job.</div><div><br></div><div>i.e. when I unpack my kernel-i=
mage-bzimage-4.10.15-yocto-standard_4.10.15+git0+4d929fac34_d2c1ed3c0c-r0_q=
emux86_64.ipk</div><div>package, I see that it has:<br></div><div><br>=C2=
=A0Version: 4.10.15+git0+4d929fac34_d2c1ed3c0c-r0<br></div><div>=C2=A0but o=
bviously has the general provides: Provides: kernel-image-bzimage<br></div>=
<div><br></div><div>So that should be upgradable based on the version ... s=
ure they have different names, but the provides</div><div>and versions take=
 care of things.</div><div><br></div><div>The versioning, ability to instal=
l multiple kernels, upgrades, etc, have really churned</div><div>these vari=
ables making them a mess to read.</div><div><br></div><div>I&#39;m probably=
 misunderstanding your use case and error, can you elaborate for me</div><d=
iv>and/or provide a log ? I&#39;m more of a kernel guy than a package forma=
t guy .. so</div><div>I&#39;m probably missing something obvious.</div><div=
><br></div><div>Bruce</div><div><br></div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><div bgcolor=3D"#FFFFFF">
    <br>
    This was the simple and cleanest way I could think of to achieve the
    my scenario. But if there is a better idea for this, let me know.<span =
class=3D"gmail-HOEnZb"><font color=3D"#888888"><br>
    <pre class=3D"gmail-m_-2376083430806215195moz-signature" cols=3D"72">--=
=20

Razvan
</pre>
  </font></span></div>

</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer, for chao=
s and madness await thee at its end&quot;</div>
</div></div>

--f403045ea3448a34b40552fb1e05--
