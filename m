Return-Path: <vlsireddy@gmail.com>
Received: from mail-wr0-f174.google.com (mail-wr0-f174.google.com
	[209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id 7A8A6607A5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 18:04:42 +0000 (UTC)
Received: by mail-wr0-f174.google.com with SMTP id w43so25022728wrb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Apr 2017 11:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=WbKqbedBSCfeobR8UoqmVcqMuC5S6vffqXKI7zzZz7w=;
	b=tBQtK5FA4863GJVvL6v1U2nqyXw0MYG4LsCun0gWxJ1Nehn2kD0j+5MBWs7SaBpfG6
	hXbwl63pmwXxZnJfDKsfef0mbaVD0KV3jN8r6/yqMvmts6RpARkTOaNY45nCs/FCPCYx
	fdYx7DosQSO3Z5nrDfzpq/GLdvRovKJVeSXFuooaW0txSfKJ9vOv5dTdXpMrNbZ0V5dd
	la2sTeD+YE5+Bn7Rz4o64WYVzp+8+Iq9LO0iLutEnvoIVeSHqgJ5yX+tuUIPCjq3gf/X
	EHIiKv4w8QXamSW/rhJbHTu8RnIqP+Iv9xeHmhDrkIFsibdTSRmh/YqZ4a42PWJk4IRh
	DbYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=WbKqbedBSCfeobR8UoqmVcqMuC5S6vffqXKI7zzZz7w=;
	b=Gq1iGM/WAS5XNodZwrSE3HAkOlzUnBrVtc7Gd+xu7/1VyfDXMG0F8PwAK9NxodEN9D
	+BMpAZj64Fhd9l/F4vlF4m0JaJbenGBbpfATpLBUOFHcQJtPIUd1FE8rcVgyNGfQNWwD
	UUC5rBWR6SlN6XM7OOLGTRXtEnokr5AvM9RPsC3I3DloVfnbdSMYZNP9OeYoa3kVLTWU
	rkBoe304//YgwQl0MpOTi2awcq95ueXycpem0ZtoaBu+LQGW6cmyFwS1HlMOJiJyvgRP
	a0tE1PP8FPIGWEPrru8KF/KRo5BMo+caFrRP9fQ5ByzE2rSnv9vueYuqSedbu8FD3LN3
	DKmQ==
X-Gm-Message-State: AFeK/H00GrpVTWGDTXyvtaiD4Dlhff/RRVHWDobUvKWjQOJeDPYjUo86
	VxhIIublsl8nVhZ8r10s7ksnUgGaVQ==
X-Received: by 10.28.98.135 with SMTP id w129mr20660934wmb.68.1491415483922;
	Wed, 05 Apr 2017 11:04:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.35.214 with HTTP; Wed, 5 Apr 2017 11:04:43 -0700 (PDT)
In-Reply-To: <1491407333.17200.22.camel@linuxfoundation.org>
References: <CAGQ4JX3rYtONiVv_eOhj-MK=2FA7=h3xCA_iytd=fpTF00rT6A@mail.gmail.com>
	<CAGQ4JX06AcUkSzRyg2255mZxxT=etOaE786_fVQqGp32EO8S2Q@mail.gmail.com>
	<CAEsOVNencj+9iW4xnqAUTzJAZ1_W=o8-N2-S6x0fr2pB-YJd9g@mail.gmail.com>
	<1491407333.17200.22.camel@linuxfoundation.org>
From: Ravi chandra reddy <vlsireddy@gmail.com>
Date: Wed, 5 Apr 2017 14:04:43 -0400
Message-ID: <CAGQ4JX1DGeQuO3WhhpHZbJFsUpOg1uHmOou1fcQvgBy+hJpjOQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Recipe [patch] modification to generate a static library instead of shared library
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
X-List-Received-Date: Wed, 05 Apr 2017 18:04:43 -0000
Content-Type: multipart/alternative; boundary=001a1148eb3621c7c8054c6f3a3a

--001a1148eb3621c7c8054c6f3a3a
Content-Type: text/plain; charset=UTF-8

Hi,
       in local/local.conf it [bitbake core-image-minimal] fails, if i use
libxml2-staticdev

  # Specify the 32-bit libraries to be added to all images
IMAGE_INSTALL_append = "lib32-glibc lib32-libgcc lib32-libstdc++ libedit
libxml2-staticdev"

================================== i get the following
errors==================================
ERROR: core-image-minimal-1.0-r0 do_rootfs: Function failed: do_rootfs
ERROR: Logfile of failure stored in:
/home/polar/zcu_yocto/poky/build/tmp/work/zcu102_zynqmp-poky-linux/core-image-minimal/1.0-r0/temp/log.do_rootfs.17721
ERROR: Task 9 (/home/polar/zcu_yocto/poky/meta/recipes-core/images/
core-image-minimal.bb, do_rootfs) failed with exit code '1'
NOTE: Tasks Summary: Attempted 2144 tasks of which 2143 didn't need to be
rerun and 1 failed.
===================================

if i use as below, there is no issue. however there is no .so

# Specify the 32-bit libraries to be added to all images
IMAGE_INSTALL_append = "lib32-glibc lib32-libgcc lib32-libstdc++ libedit
libxml2"

i ran

bitbake -e | grep static-libs

and all the "no-static-libs.inc" are commented [#]

Thanks
RC



On Wed, Apr 5, 2017 at 11:48 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2017-04-05 at 10:33 -0500, Matthew McClintock wrote:
> > On Wed, Apr 5, 2017 at 10:18 AM, Ravi chandra reddy <vlsireddy@gmail.
> > com> wrote:
> > >
> > > Hi All,
> > >           I am using meta-oe to generate libxml2 library using
> > > AARCH64
> > > compiler. However it generates shared object [.so] library.
> > >
> > > is there any setting in recipe to modify this, to generate static
> > > library
> > > [instead of shared library]
> > >
> > > if so, please point me to the recipe/file to change.
> > >
> > > if not, i will try to add it as patch, plz point me to appropriate
> > > files to
> > > change
> > Is the ${PN}-staticdev package getting generated for you?
>
> Its possible you have conf/distro/include/no-static-libs.inc included
> in your build (bitbake -e would tell you).
>
> If so, you could remove that include or set:
>
> DISABLE_STATIC = ""
>
> as it would currently be set to this if that include file is included:
>
> DISABLE_STATIC = " --disable-static"
>
> We tend not to build static libraries as they're a waste of space/time
> on the most part.
>
> Cheers,
>
> Richard
>

--001a1148eb3621c7c8054c6f3a3a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0in local/local.conf it =
[bitbake core-image-minimal] fails, if i use libxml2-staticdev<br><div>=C2=
=A0 =C2=A0</div><div>=C2=A0 # Specify the 32-bit libraries to be added to a=
ll images</div><div>IMAGE_INSTALL_append =3D &quot;lib32-glibc lib32-libgcc=
 lib32-libstdc++ libedit libxml2-staticdev&quot;</div><div><br></div><div>=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D i get the following errors=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br></div><div><div>ERROR: core-image-minimal-1.0-r0 do_rootfs: Funct=
ion failed: do_rootfs</div><div>ERROR: Logfile of failure stored in: /home/=
polar/zcu_yocto/poky/build/tmp/work/zcu102_zynqmp-poky-linux/core-image-min=
imal/1.0-r0/temp/log.do_rootfs.17721</div><div>ERROR: Task 9 (/home/polar/z=
cu_yocto/poky/meta/recipes-core/images/<a href=3D"http://core-image-minimal=
.bb">core-image-minimal.bb</a>, do_rootfs) failed with exit code &#39;1&#39=
;</div><div>NOTE: Tasks Summary: Attempted 2144 tasks of which 2143 didn&#3=
9;t need to be rerun and 1 failed.</div></div><div>=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D</div><div><br></div><div>if i use as below, there is no issue. howev=
er there is no .so</div><div><br></div><div><div># Specify the 32-bit libra=
ries to be added to all images</div><div>IMAGE_INSTALL_append =3D &quot;lib=
32-glibc lib32-libgcc lib32-libstdc++ libedit libxml2&quot;</div></div><div=
><br></div><div>i ran</div><div><br></div><div>bitbake -e | grep static-lib=
s<br></div><div><br></div><div>and all the &quot;no-static-libs.inc&quot; a=
re commented [#]=C2=A0</div><div><br></div><div>Thanks</div><div>RC=C2=A0</=
div><div><br></div><div><br></div></div></div><div class=3D"gmail_extra"><b=
r><div class=3D"gmail_quote">On Wed, Apr 5, 2017 at 11:48 AM, Richard Purdi=
e <span dir=3D"ltr">&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.or=
g" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;</span> wrot=
e:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><span class=3D"">On Wed, 2017-04-05 at=
 10:33 -0500, Matthew McClintock wrote:<br>
&gt; On Wed, Apr 5, 2017 at 10:18 AM, Ravi chandra reddy &lt;vlsireddy@gmai=
l.<br>
&gt; com&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Hi All,<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0I am =
using meta-oe to generate libxml2 library using<br>
&gt; &gt; AARCH64<br>
&gt; &gt; compiler. However it generates shared object [.so] library.<br>
&gt; &gt;<br>
&gt; &gt; is there any setting in recipe to modify this, to generate static=
<br>
&gt; &gt; library<br>
&gt; &gt; [instead of shared library]<br>
&gt; &gt;<br>
&gt; &gt; if so, please point me to the recipe/file to change.<br>
&gt; &gt;<br>
&gt; &gt; if not, i will try to add it as patch, plz point me to appropriat=
e<br>
&gt; &gt; files to<br>
&gt; &gt; change<br>
&gt; Is the ${PN}-staticdev package getting generated for you?<br>
<br>
</span>Its possible you have conf/distro/include/no-static-<wbr>libs.inc in=
cluded<br>
in your build (bitbake -e would tell you).<br>
<br>
If so, you could remove that include or set:<br>
<br>
DISABLE_STATIC =3D &quot;&quot;<br>
<br>
as it would currently be set to this if that include file is included:<br>
<br>
DISABLE_STATIC =3D &quot; --disable-static&quot;<br>
<br>
We tend not to build static libraries as they&#39;re a waste of space/time<=
br>
on the most part.<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div><br></div>

--001a1148eb3621c7c8054c6f3a3a--
