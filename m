Return-Path: <liu.ming50@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id D01FB6FF84
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jan 2016 08:46:01 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id i129so9314624vkb.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jan 2016 00:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Z3L70Y0sYd2I9gdWaPFwf1qKrws6CnDqkLX3fvmejaA=;
	b=YfWRpkbiS88efYaZQQ+qzNWIqxDkT5Kk961QyJclUvZDs37YF/PmVj8AWUTeK8Piir
	PVBf2Qs2FRhrNzFIKK9SqdUSg/SnCqKgnwB9kw+tTuNvq/c0E33EkALN2fnYp4wD+T4U
	cs9skooNDttfWZwRUn7aS9X11Fqvf/LI3RZ5AgYyUr1LZCd5gG5Am8sx50UPiq1nTs5n
	bpKBllY1XDL3G0IR4wVdWwc2QhReUJ9iHp9+Mb35wWaTAZ/rFKd8blu2ZKqTtMvtQWZX
	lskBiRqxfkeEPxxbi1OiaspOb0eeHYSBaCd5FUHaMxL2yLJHj+s+B6qaCF1P474y/7BM
	2ZzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=Z3L70Y0sYd2I9gdWaPFwf1qKrws6CnDqkLX3fvmejaA=;
	b=ddPyQz5hkFu/xiIbeSzg+2E3ixUiGLb8XC1nKgs8y47vV/u+FZNUdwT5dwOCm1PQMU
	wdM+cjcRizyyQSDQnrR+qPYAoJBDnw1eg25GAZk+bM75JlVbS0SpxVEU4d7wr151D5oB
	hIvz8J6JyPVZM5njBT0jbBiYgDku7IVyCK3v9yAMAmJOG2Ot0h8r4exhalO576iniNx8
	XnUhfcA2WN+oVuSNk1XuF/AMibCUHDpdnOzEihp9l1VfvpDEipuybAknB2bjvDvll93p
	uCP20HFqgmcAGp0im2fFLqePKU8hIVer4+mbYEtQMzroA+wjmX6fUXxDt/Yf2POwZwuM
	PHgw==
X-Gm-Message-State: ALoCoQn8UODKpUrM7vtCkyBfqxHt8LXdc0ZxB1oLrKcFui9/zvkZrTILicccqOXiGysq22u7xDLextVS5Wi8+rykKvLhld4xFw==
MIME-Version: 1.0
X-Received: by 10.31.178.146 with SMTP id b140mr6544409vkf.108.1452847562041; 
	Fri, 15 Jan 2016 00:46:02 -0800 (PST)
Received: by 10.31.30.204 with HTTP; Fri, 15 Jan 2016 00:46:01 -0800 (PST)
In-Reply-To: <5697D5AA.1030109@windriver.com>
References: <1451999565-3502-1-git-send-email-liu.ming50@gmail.com>
	<5697D5AA.1030109@windriver.com>
Date: Fri, 15 Jan 2016 09:46:01 +0100
Message-ID: <CALatG=53EemzBL90U3va+MWPVxdr_GoooN5Ux2Ym+_OdpT0trw@mail.gmail.com>
From: Ming Liu <liu.ming50@gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: "yue.tao" <yue.tao@windriver.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Introduces kernel-initramfs recipe to resolve a implicit dependency issue
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
X-List-Received-Date: Fri, 15 Jan 2016 08:46:02 -0000
Content-Type: multipart/alternative; boundary=001a1144034cd92f9f05295b6e2c

--001a1144034cd92f9f05295b6e2c
Content-Type: text/plain; charset=UTF-8

Hi, Bruce:

No problem, thanks for letting me know the status.

//Ming Liu

2016-01-14 18:06 GMT+01:00 Bruce Ashfield <bruce.ashfield@windriver.com>:

> Just bumping this review to let you know that I haven't forgotten
> about it.
>
> I've been looking at the details at least twice now, but haven't
> managed to sort everything out.
>
> I'll pick this up again shortly.
>
> Bruce
>
>
> On 16-01-05 08:12 AM, Ming Liu wrote:
>
>> In current initramfs bundled kernel packaging policy, there are several
>> dependency chains co-existing:
>>
>> | "core-image-minimal.do_build" ->
>> "core-image-minimal.do_bundle_initramfs"
>> | "core-image-minimal.do_bundle_initramfs" ->
>> "virtual/kernel.do_bundle_initramfs"
>> | "core-image-minimal.do_bundle_initramfs" ->
>> "core-image-minimal.do_rootfs"
>> | "core-image-minimal.do_rootfs" ->
>> "virtual/kernel.do_package_write_${IMAGE_PKGTYPE}"
>> | "virtual/kernel.do_package_write_${IMAGE_PKGTYPE}" ->
>> "virtual/kernel.do_package"
>> | "virtual/kernel.do_package" -> "virtual/kernel.do_install"
>> |
>> | "virtual/kernel.do_deploy" -> "virtual/kernel.do_bundle_initramfs"
>> | "virtual/kernel.do_bundle_initramfs" -> "virtual/kernel.do_install"
>>
>> We could see, virtual/kernel.do_package is not explicitly depending on
>> virtual/kernel.do_bundle_initramfs so far, therefore, there is not a
>> workable way to add initramfs bundled kernel image into rootfs, because
>> kernel's do_bundle_initramfs could run parallelly with its do_package,
>> which means we will get a implicit kernel-image package that sometimes it
>> contains the initramfs bundled kernel or sometimes it doesn't.
>>
>> To fix this problem, the idea is to let the initramfs bundled kernel
>> packaging depend on do_bundle_initramfs, meanwhile, to avoid the circular
>> dependency issue that commit: 609d5a9ab9e58bb1c2bcc2145399fbc8b701b85a
>> [ kernel.bbclass, image.bbclass: Implement kernel INITRAMFS dependency
>> and bundling ]
>>
>> was trying to address, this dependency has to be splitted from kernel
>> recipe(at least, I could not figure out another way to achieve it), so a
>> new kernel-initramfs is introduced, in which a dependency chain is
>> created:
>>
>> | "kernel-initramfs.do_install" -> "virtual/kernel.do_deploy"
>> | "virtual/kernel.do_deploy" -> "virtual/kernel.do_bundle_initramfs"
>>
>> Then the users can add initramfs bundled kernel image into rootfs by:
>>
>> IMAGE_INSTALL_append = " kernel-initramfs"
>>
>> without introducing any circular dependencies.
>>
>> Ming Liu (3):
>>    kernel.bbclass: do not install initramfs bundled kernel image
>>    image.bbclass: removes bundle_initramfs related code
>>    kernel-initramfs: new recipe, creates initramfs bundled kernel
>>      packaging
>>
>>   meta/classes/image.bbclass                    | 11 -----
>>   meta/classes/kernel.bbclass                   |  4 --
>>   meta/recipes-kernel/linux/kernel-initramfs.bb | 69
>> +++++++++++++++++++++++++++
>>   3 files changed, 69 insertions(+), 15 deletions(-)
>>   create mode 100644 meta/recipes-kernel/linux/kernel-initramfs.bb
>>
>>
>

--001a1144034cd92f9f05295b6e2c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hi, Bruce:<br><br></div>No problem, thanks for l=
etting me know the status.<br><br></div>//Ming Liu<br></div><div class=3D"g=
mail_extra"><br><div class=3D"gmail_quote">2016-01-14 18:06 GMT+01:00 Bruce=
 Ashfield <span dir=3D"ltr">&lt;<a href=3D"mailto:bruce.ashfield@windriver.=
com" target=3D"_blank">bruce.ashfield@windriver.com</a>&gt;</span>:<br><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">Just bumping this review to let you know that I =
haven&#39;t forgotten<br>
about it.<br>
<br>
I&#39;ve been looking at the details at least twice now, but haven&#39;t<br=
>
managed to sort everything out.<br>
<br>
I&#39;ll pick this up again shortly.<span class=3D"HOEnZb"><font color=3D"#=
888888"><br>
<br>
Bruce</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
On 16-01-05 08:12 AM, Ming Liu wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
In current initramfs bundled kernel packaging policy, there are several<br>
dependency chains co-existing:<br>
<br>
| &quot;core-image-minimal.do_build&quot; -&gt; &quot;core-image-minimal.do=
_bundle_initramfs&quot;<br>
| &quot;core-image-minimal.do_bundle_initramfs&quot; -&gt; &quot;virtual/ke=
rnel.do_bundle_initramfs&quot;<br>
| &quot;core-image-minimal.do_bundle_initramfs&quot; -&gt; &quot;core-image=
-minimal.do_rootfs&quot;<br>
| &quot;core-image-minimal.do_rootfs&quot; -&gt; &quot;virtual/kernel.do_pa=
ckage_write_${IMAGE_PKGTYPE}&quot;<br>
| &quot;virtual/kernel.do_package_write_${IMAGE_PKGTYPE}&quot; -&gt; &quot;=
virtual/kernel.do_package&quot;<br>
| &quot;virtual/kernel.do_package&quot; -&gt; &quot;virtual/kernel.do_insta=
ll&quot;<br>
|<br>
| &quot;virtual/kernel.do_deploy&quot; -&gt; &quot;virtual/kernel.do_bundle=
_initramfs&quot;<br>
| &quot;virtual/kernel.do_bundle_initramfs&quot; -&gt; &quot;virtual/kernel=
.do_install&quot;<br>
<br>
We could see, virtual/kernel.do_package is not explicitly depending on<br>
virtual/kernel.do_bundle_initramfs so far, therefore, there is not a<br>
workable way to add initramfs bundled kernel image into rootfs, because<br>
kernel&#39;s do_bundle_initramfs could run parallelly with its do_package,<=
br>
which means we will get a implicit kernel-image package that sometimes it<b=
r>
contains the initramfs bundled kernel or sometimes it doesn&#39;t.<br>
<br>
To fix this problem, the idea is to let the initramfs bundled kernel<br>
packaging depend on do_bundle_initramfs, meanwhile, to avoid the circular<b=
r>
dependency issue that commit: 609d5a9ab9e58bb1c2bcc2145399fbc8b701b85a<br>
[ kernel.bbclass, image.bbclass: Implement kernel INITRAMFS dependency and =
bundling ]<br>
<br>
was trying to address, this dependency has to be splitted from kernel<br>
recipe(at least, I could not figure out another way to achieve it), so a<br=
>
new kernel-initramfs is introduced, in which a dependency chain is created:=
<br>
<br>
| &quot;kernel-initramfs.do_install&quot; -&gt; &quot;virtual/kernel.do_dep=
loy&quot;<br>
| &quot;virtual/kernel.do_deploy&quot; -&gt; &quot;virtual/kernel.do_bundle=
_initramfs&quot;<br>
<br>
Then the users can add initramfs bundled kernel image into rootfs by:<br>
<br>
IMAGE_INSTALL_append =3D &quot; kernel-initramfs&quot;<br>
<br>
without introducing any circular dependencies.<br>
<br>
Ming Liu (3):<br>
=C2=A0 =C2=A0kernel.bbclass: do not install initramfs bundled kernel image<=
br>
=C2=A0 =C2=A0image.bbclass: removes bundle_initramfs related code<br>
=C2=A0 =C2=A0kernel-initramfs: new recipe, creates initramfs bundled kernel=
<br>
=C2=A0 =C2=A0 =C2=A0packaging<br>
<br>
=C2=A0 meta/classes/image.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 11 -----<br>
=C2=A0 meta/classes/kernel.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 --<br>
=C2=A0 meta/recipes-kernel/linux/<a href=3D"http://kernel-initramfs.bb" rel=
=3D"noreferrer" target=3D"_blank">kernel-initramfs.bb</a> | 69 ++++++++++++=
+++++++++++++++<br>
=C2=A0 3 files changed, 69 insertions(+), 15 deletions(-)<br>
=C2=A0 create mode 100644 meta/recipes-kernel/linux/<a href=3D"http://kerne=
l-initramfs.bb" rel=3D"noreferrer" target=3D"_blank">kernel-initramfs.bb</a=
><br>
<br>
</blockquote>
<br>
</div></div></blockquote></div><br></div>

--001a1144034cd92f9f05295b6e2c--
